Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6C5AEF2A6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE2D10E568;
	Tue,  1 Jul 2025 09:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAotwm+A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8AA10E568;
 Tue,  1 Jul 2025 09:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751360916; x=1782896916;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H8R1P31/qZ4cS8IWx6TJ6FLRePhp76VuL8GlLXr3GMk=;
 b=jAotwm+AE6hStBmzGHQ3qmhLRKGIQi2BA8EUWTJ9CdJ0dB/pa/PP+vsB
 UTPwSSdBrVJzLCS3JQQfWopa7cprFx+6t6a4QGjdqffi62y0C/b1AKT9I
 MO9DoEUi9bW8S+hM40pQorIdSayczl+pUaTKKsODnmL/yHMRIqUXssTky
 d0mH8j/5NZ/XP5Gf8apEPGZqIuqkHl8ZRbbh8NNFvuf0/FX3elnnldKcB
 YT9FRpG2JeIykYzj1N7Yoi9752MTSLt9ENSbF5GU/y9b1sZTv7XBxvJmu
 l1QCyq5IFAqbOohvsZC3O8IcK4Dj3nlaQHKiv2QVsylrNS8dvcLFL4Ta6 Q==;
X-CSE-ConnectionGUID: F4CxydDWTGG8r3JmntxpOA==
X-CSE-MsgGUID: 4/g9RLMoRKSVDoaG/Vz/Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64218515"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="64218515"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 02:08:36 -0700
X-CSE-ConnectionGUID: gxGJY5QBT1OIjK48kAuoTw==
X-CSE-MsgGUID: zSs4/v9RTkywWDYzlk+DBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="159427198"
Received: from zzombora-mobl1.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.11])
 by orviesa005.jf.intel.com with SMTP; 01 Jul 2025 02:08:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Jul 2025 12:08:31 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 11/19] drm/exynos: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Date: Tue,  1 Jul 2025 12:07:14 +0300
Message-ID: <20250701090722.13645-12-ville.syrjala@linux.intel.com>
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

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fb.c    | 5 +++--
 drivers/gpu/drm/exynos/exynos_drm_fb.h    | 1 +
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 5 ++++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index 7091d31835ec..ddd73e7f26a3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -56,6 +56,7 @@ static const struct drm_framebuffer_funcs exynos_drm_fb_funcs = {
 
 struct drm_framebuffer *
 exynos_drm_framebuffer_init(struct drm_device *dev,
+			    const struct drm_format_info *info,
 			    const struct drm_mode_fb_cmd2 *mode_cmd,
 			    struct exynos_drm_gem **exynos_gem,
 			    int count)
@@ -76,7 +77,7 @@ exynos_drm_framebuffer_init(struct drm_device *dev,
 		fb->obj[i] = &exynos_gem[i]->base;
 	}
 
-	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
 
 	ret = drm_framebuffer_init(dev, fb, &exynos_drm_fb_funcs);
 	if (ret < 0) {
@@ -124,7 +125,7 @@ exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		}
 	}
 
-	fb = exynos_drm_framebuffer_init(dev, mode_cmd, exynos_gem, i);
+	fb = exynos_drm_framebuffer_init(dev, info, mode_cmd, exynos_gem, i);
 	if (IS_ERR(fb)) {
 		ret = PTR_ERR(fb);
 		goto err;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.h b/drivers/gpu/drm/exynos/exynos_drm_fb.h
index 2f841bbdddc5..fdc6cb40cc9c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.h
@@ -14,6 +14,7 @@
 
 struct drm_framebuffer *
 exynos_drm_framebuffer_init(struct drm_device *dev,
+			    const struct drm_format_info *info,
 			    const struct drm_mode_fb_cmd2 *mode_cmd,
 			    struct exynos_drm_gem **exynos_gem,
 			    int count);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index 9526a25e90ac..93de25b77e68 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -116,7 +116,10 @@ int exynos_drm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 		return PTR_ERR(exynos_gem);
 
 	helper->fb =
-		exynos_drm_framebuffer_init(dev, &mode_cmd, &exynos_gem, 1);
+		exynos_drm_framebuffer_init(dev,
+					    drm_get_format_info(dev, mode_cmd.pixel_format,
+								mode_cmd.modifier[0]),
+					    &mode_cmd, &exynos_gem, 1);
 	if (IS_ERR(helper->fb)) {
 		DRM_DEV_ERROR(dev->dev, "failed to create drm framebuffer.\n");
 		ret = PTR_ERR(helper->fb);
-- 
2.49.0

