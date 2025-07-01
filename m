Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEC2AEF2A3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B340610E567;
	Tue,  1 Jul 2025 09:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ljf3q93V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8739110E55D;
 Tue,  1 Jul 2025 09:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751360912; x=1782896912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=br9PH7S5d3Ls/QdTGcCJINWLKqs8bEREuPBTX0WpAGQ=;
 b=Ljf3q93VHPkJRYoNjWHy9c8vayjCm570RlJKozA0yacHHBb79Ur/uB6B
 zlSuxoGHLBQWcIRSgXZedePTy9ksBH9gdoZLo4radesP6Ap5OMYR3Bqq3
 viZq3BomucvKSawLhsD4pe+lCZqNC+UGBfHMj5CM/arUIW2lLWhxBZ5Mm
 B1WgYpBfwz8H5wbUBtg8eDgwl48gInbjuFxvRiTMxzt15PUY3s+fxYfrx
 Bi9412hnP6oR/EvsHaGXD4AxwtAq1PBo6Xn8AjAk2fyviYEOrKWjPZqLa
 HtP12mzA18w9ae6vAsiy1QuptM3UHYUIrbWWub/n2OuY2V0eyb32DC7Oo g==;
X-CSE-ConnectionGUID: Gb5U4AdLSXiUhLk//vOAbw==
X-CSE-MsgGUID: CO0EK2QITgSC6BKZa+WTNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64218491"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="64218491"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 02:08:31 -0700
X-CSE-ConnectionGUID: CH2GnmQwSW2kdxZn3CU3Aw==
X-CSE-MsgGUID: cF5yg3+lRLan5FuEH0sEzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="159427193"
Received: from zzombora-mobl1.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.11])
 by orviesa005.jf.intel.com with SMTP; 01 Jul 2025 02:08:29 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Jul 2025 12:08:27 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 10/19] drm/armada: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Date: Tue,  1 Jul 2025 12:07:13 +0300
Message-ID: <20250701090722.13645-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
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
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
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

