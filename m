Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ADC11880D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 13:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE27E6E8CE;
	Tue, 10 Dec 2019 12:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4128A6E8CC;
 Tue, 10 Dec 2019 12:31:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 04:31:18 -0800
X-IronPort-AV: E=Sophos;i="5.69,299,1571727600"; d="scan'208";a="215428839"
Received: from orilivne-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.68])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 04:31:17 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/8] drm/gem-fb-helper: convert to drm device based logging
Date: Tue, 10 Dec 2019 14:30:46 +0200
Message-Id: <20191210123050.8799-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210123050.8799-1-jani.nikula@intel.com>
References: <20191210123050.8799-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer drm_dbg_kms() and drm_err() over all other logging.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index b9bcd310ca2d..3a7ace19a902 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -74,8 +74,7 @@ drm_gem_fb_alloc(struct drm_device *dev,
 
 	ret = drm_framebuffer_init(dev, fb, funcs);
 	if (ret) {
-		DRM_DEV_ERROR(dev->dev, "Failed to init framebuffer: %d\n",
-			      ret);
+		drm_err(dev, "Failed to init framebuffer: %d\n", ret);
 		kfree(fb);
 		return ERR_PTR(ret);
 	}
@@ -160,7 +159,7 @@ drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
 
 		objs[i] = drm_gem_object_lookup(file, mode_cmd->handles[i]);
 		if (!objs[i]) {
-			DRM_DEBUG_KMS("Failed to lookup GEM object\n");
+			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
 			ret = -ENOENT;
 			goto err_gem_object_put;
 		}
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
