Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCA35B3628
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D452710EC79;
	Fri,  9 Sep 2022 11:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349FB10EC72
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 11:16:46 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oWc04-0002dP-Ir; Fri, 09 Sep 2022 13:16:44 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: linux-mm@kvack.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 2/5] drm/gem: track mm struct of allocating process in gem
 object
Date: Fri,  9 Sep 2022 13:16:37 +0200
Message-Id: <20220909111640.3789791-3-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220909111640.3789791-1-l.stach@pengutronix.de>
References: <20220909111640.3789791-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Michal Hocko <mhocko@suse.com>, kernel@pengutronix.de,
 David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This keeps around a weak reference to the struct mm of the process
allocating the GEM object. This allows us to charge/uncharge the
process with the allocated backing store memory, even if this is
happening from another context.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/drm_gem.c |  5 +++++
 include/drm/drm_gem.h     | 12 ++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 86d670c71286..b882f935cd4b 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -36,6 +36,7 @@
 #include <linux/pagemap.h>
 #include <linux/pagevec.h>
 #include <linux/shmem_fs.h>
+#include <linux/sched/mm.h>
 #include <linux/slab.h>
 #include <linux/string_helpers.h>
 #include <linux/types.h>
@@ -157,6 +158,9 @@ void drm_gem_private_object_init(struct drm_device *dev,
 	obj->dev = dev;
 	obj->filp = NULL;
 
+	mmgrab(current->mm);
+	obj->mm = current->mm;
+
 	kref_init(&obj->refcount);
 	obj->handle_count = 0;
 	obj->size = size;
@@ -949,6 +953,7 @@ drm_gem_object_release(struct drm_gem_object *obj)
 	if (obj->filp)
 		fput(obj->filp);
 
+	mmdrop(obj->mm);
 	dma_resv_fini(&obj->_resv);
 	drm_gem_free_mmap_offset(obj);
 }
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 87cffc9efa85..d021a083c282 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -234,6 +234,18 @@ struct drm_gem_object {
 	 */
 	struct drm_vma_offset_node vma_node;
 
+	/**
+	 * @mm:
+	 *
+	 * mm struct of the process creating the object. Used to account the
+	 * allocated backing store memory.
+	 *
+	 * Note that this is a weak reference created by mmgrab(), so any
+	 * manipulation needs to make sure the address space is still around by
+	 * calling mmget_not_zero().
+	 */
+	struct mm_struct *mm;
+
 	/**
 	 * @size:
 	 *
-- 
2.30.2

