Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D975B3629
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF7610EC78;
	Fri,  9 Sep 2022 11:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6CA10EC74
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 11:16:46 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oWc05-0002dP-2O; Fri, 09 Sep 2022 13:16:45 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: linux-mm@kvack.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 3/5] drm/gem: add functions to account GEM object memory
 usage
Date: Fri,  9 Sep 2022 13:16:38 +0200
Message-Id: <20220909111640.3789791-4-l.stach@pengutronix.de>
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

This adds some functions which driver can call to make the MM aware
of the resident memory used by the GEM object. As drivers will have
different points where memory is made resident/pinned into system
memory, this just adds the helper functions and drivers need to make
sure to call them at the right points.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/drm_gem.c | 37 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_gem.h     |  3 +++
 2 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index b882f935cd4b..efccd0a1dde7 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1279,3 +1279,40 @@ drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
 	ww_acquire_fini(acquire_ctx);
 }
 EXPORT_SYMBOL(drm_gem_unlock_reservations);
+
+/**
+ * drm_gem_add_resident - Account memory used by GEM object to the
+ * task which called drm_gem_object_init(). Call when the pages are
+ * made resident in system memory, i.e. pinned for GPU usage.
+ *
+ * @obj: GEM buffer object
+ */
+void drm_gem_add_resident(struct drm_gem_object *obj)
+{
+	if (!mmget_not_zero(obj->mm))
+		return;
+
+	add_mm_counter(obj->mm, MM_DRIVERPAGES, obj->size / PAGE_SIZE);
+
+	mmput(obj->mm);
+}
+EXPORT_SYMBOL(drm_gem_add_resident)
+
+/**
+ * drm_gem_dec_resident - Remove memory used by GEM object accounted
+ * to the task which called drm_gem_object_init(). Call this when the
+ * pages backing the GEM object are no longer resident in system memory,
+ * i.e. when freeing or unpinning the pages.
+ *
+ * @obj: GEM buffer object
+ */
+void drm_gem_dec_resident(struct drm_gem_object *obj)
+{
+	if (!mmget_not_zero(obj->mm))
+		return;
+
+	add_mm_counter(obj->mm, MM_DRIVERPAGES, -(obj->size / PAGE_SIZE));
+
+	mmput(obj->mm);
+}
+EXPORT_SYMBOL(drm_gem_dec_resident)
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index d021a083c282..5951963a2f1a 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -374,6 +374,9 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
 		     struct vm_area_struct *vma);
 int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
 
+void drm_gem_add_resident(struct drm_gem_object *obj);
+void drm_gem_dec_resident(struct drm_gem_object *obj);
+
 /**
  * drm_gem_object_get - acquire a GEM buffer object reference
  * @obj: GEM buffer object
-- 
2.30.2

