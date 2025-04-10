Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F64A849F3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A7E10EA2C;
	Thu, 10 Apr 2025 16:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="muAmnTdh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF81310EA34;
 Thu, 10 Apr 2025 16:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744302805; x=1775838805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KkcimRBSJo82wgrZJ3FBObk6RbiLelUvsAr25ymjVTI=;
 b=muAmnTdh12cn+8+5vedMmYv0ln3HjLHt83Zsj10JVAUCpGP7biGK6ykp
 nIeg3vTzq5QuV48c7mOj3QPLEg6xziz7JSWGOkyAGYAZb57EnKCJsegi7
 s8P47U6l2MtlGuru6oVI7M7PtjxkM3JPjmlaXJpV/HxiPYxmRasATuCe6
 2S+YgJRS8xcetzXfljzksAIpIQyK+W24S5aP47RdFRJ9SZVLQXILiWOXc
 O+v25cIRx30gpyeW78TBvv+SSuQ+va86leeDchCNkIO/jUqn8APDYNgcE
 /gcgPYeCsBSD8gbMi4YfycNVOQeGCmc0uohhJwKzP6snXd49JkgYXe7bx w==;
X-CSE-ConnectionGUID: iCUye6Q0TvKHqyJvC9L8Dg==
X-CSE-MsgGUID: 0KijoRpxTCKbrqv9nDN6mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57220091"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="57220091"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:33:25 -0700
X-CSE-ConnectionGUID: fPXRtKcOQpKpLKDu344Rdw==
X-CSE-MsgGUID: xDPTTyZ+QIegP6bYVTTDbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134129325"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 09:33:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Apr 2025 19:33:22 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>
Subject: [PATCH 10/19] drm/armada: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Date: Thu, 10 Apr 2025 19:32:09 +0300
Message-ID: <20250410163218.15130-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Plumb the format info from .fb_create() all the way to
drm_helper_mode_fill_fb_struct() to avoid the redundant
lookup.

For the fbdev case a manual drm_get_format_info() lookup
is needed.

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/armada/armada_fb.c    | 8 +++++---
 drivers/gpu/drm/armada/armada_fb.h    | 1 +
 drivers/gpu/drm/armada/armada_fbdev.c | 5 ++++-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_fb.c b/drivers/gpu/drm/armada/armada_fb.c
index 7e94ec5bd4f4..aa4289127086 100644
--- a/drivers/gpu/drm/armada/armada_fb.c
+++ b/drivers/gpu/drm/armada/armada_fb.c
@@ -18,7 +18,9 @@ static const struct drm_framebuffer_funcs armada_fb_funcs = {
 };
 
 struct armada_framebuffer *armada_framebuffer_create(struct drm_device *dev,
-	const struct drm_mode_fb_cmd2 *mode, struct armada_gem_object *obj)
+						     const struct drm_format_info *info,
+						     const struct drm_mode_fb_cmd2 *mode,
+						     struct armada_gem_object *obj)
 {
 	struct armada_framebuffer *dfb;
 	uint8_t format, config;
@@ -64,7 +66,7 @@ struct armada_framebuffer *armada_framebuffer_create(struct drm_device *dev,
 	dfb->mod = config;
 	dfb->fb.obj[0] = &obj->obj;
 
-	drm_helper_mode_fill_fb_struct(dev, &dfb->fb, NULL, mode);
+	drm_helper_mode_fill_fb_struct(dev, &dfb->fb, info, mode);
 
 	ret = drm_framebuffer_init(dev, &dfb->fb, &armada_fb_funcs);
 	if (ret) {
@@ -122,7 +124,7 @@ struct drm_framebuffer *armada_fb_create(struct drm_device *dev,
 		goto err_unref;
 	}
 
-	dfb = armada_framebuffer_create(dev, mode, obj);
+	dfb = armada_framebuffer_create(dev, info, mode, obj);
 	if (IS_ERR(dfb)) {
 		ret = PTR_ERR(dfb);
 		goto err;
diff --git a/drivers/gpu/drm/armada/armada_fb.h b/drivers/gpu/drm/armada/armada_fb.h
index 41ba76dd80d6..f2b990f055a2 100644
--- a/drivers/gpu/drm/armada/armada_fb.h
+++ b/drivers/gpu/drm/armada/armada_fb.h
@@ -17,6 +17,7 @@ struct armada_framebuffer {
 #define drm_fb_obj(fb) drm_to_armada_gem((fb)->obj[0])
 
 struct armada_framebuffer *armada_framebuffer_create(struct drm_device *,
+	const struct drm_format_info *info,
 	const struct drm_mode_fb_cmd2 *, struct armada_gem_object *);
 struct drm_framebuffer *armada_fb_create(struct drm_device *dev,
 	struct drm_file *dfile, const struct drm_format_info *info,
diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index 6ee7ce04ee71..cb53cc91bafb 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -78,7 +78,10 @@ int armada_fbdev_driver_fbdev_probe(struct drm_fb_helper *fbh,
 		return -ENOMEM;
 	}
 
-	dfb = armada_framebuffer_create(dev, &mode, obj);
+	dfb = armada_framebuffer_create(dev,
+					drm_get_format_info(dev, mode.pixel_format,
+							    mode.modifier[0]),
+					&mode, obj);
 
 	/*
 	 * A reference is now held by the framebuffer object if
-- 
2.49.0

