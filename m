Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A15437691
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 14:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6A16E7DC;
	Fri, 22 Oct 2021 12:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 367 seconds by postgrey-1.36 at gabe;
 Fri, 22 Oct 2021 12:13:16 UTC
Received: from unicom146.biz-email.net (unicom146.biz-email.net
 [210.51.26.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615B86E7DC;
 Fri, 22 Oct 2021 12:13:16 +0000 (UTC)
Received: from ([60.208.111.195])
 by unicom146.biz-email.net ((LNX1044)) with ASMTP (SSL) id QOD00159;
 Fri, 22 Oct 2021 20:06:59 +0800
Received: from localhost.localdomain (10.200.104.119) by
 jtjnmail201604.home.langchao.com (10.100.2.4) with Microsoft SMTP Server id
 15.1.2308.14; Fri, 22 Oct 2021 20:07:00 +0800
From: Kai Song <songkai01@inspur.com>
To: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>
CC: <airlied@linux.ie>, <daniel@ffwll.ch>, <jason@jlekstrand.net>,
 <thomas.hellstrom@linux.intel.com>, <matthew.auld@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Kai Song <songkai01@inspur.com>
Subject: [PATCH] drm/i915/selftests: Fix inconsistent IS_ERR and PTR_ERR
Date: Fri, 22 Oct 2021 20:06:55 +0800
Message-ID: <20211022120655.22173-1-songkai01@inspur.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.200.104.119]
tUid: 2021102220065935d306d5aee3ec50df61f00ae9b372c3
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix inconsistent IS_ERR and PTR_ERR in i915_gem_dmabuf.c

Signed-off-by: Kai Song <songkai01@inspur.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index 4a6bb64c3a35..3cc74b0fed06 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -102,7 +102,7 @@ static int igt_dmabuf_import_same_driver_lmem(void *arg)
 	obj = __i915_gem_object_create_user(i915, PAGE_SIZE, &lmem, 1);
 	if (IS_ERR(obj)) {
 		pr_err("__i915_gem_object_create_user failed with err=%ld\n",
-		       PTR_ERR(dmabuf));
+		       PTR_ERR(obj));
 		err = PTR_ERR(obj);
 		goto out_ret;
 	}
@@ -158,7 +158,7 @@ static int igt_dmabuf_import_same_driver(struct drm_i915_private *i915,
 					    regions, num_regions);
 	if (IS_ERR(obj)) {
 		pr_err("__i915_gem_object_create_user failed with err=%ld\n",
-		       PTR_ERR(dmabuf));
+		       PTR_ERR(obj));
 		err = PTR_ERR(obj);
 		goto out_ret;
 	}
-- 
2.27.0

