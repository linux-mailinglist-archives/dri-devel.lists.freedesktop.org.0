Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EECAEF2B1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2762A10E574;
	Tue,  1 Jul 2025 09:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DBNqX1Fn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32FA210E55F;
 Tue,  1 Jul 2025 09:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751360941; x=1782896941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J6RrilEwIqFj/C94Q79PLClMtORmkTLQTk4j9QJmEDY=;
 b=DBNqX1FnxYg1zcdw//06kzpcARxgdTHWXZzW9GTk6VdN/hGOkw77exIP
 R6YBpeIzcD6S18cg5NiFbLqi9EQDJGR+1HJi/RSTUNATEAPw8h4TYmMJL
 Pht98CVn83WndXR43GdTKq/A++WhtKM7IOcnBPM7MBudh3EUmf9Rw72j6
 jmb6c2QFqS8ciZUyxi4UQzkUk5ZYX7dhkUpQnEfUy4le072QLTHBV7Hsq
 SvrL786kJbcVyWLzbn45Xli41RAlnEA7e8vwDdZw8NUVUDNCQ5fz6jCzt
 ij3Y6U8B2aazK2LXTgAcya4BTuNnDHauTxijS66w8H4I7ARk1FQABROnI Q==;
X-CSE-ConnectionGUID: vtXqrCJERWqh2OjxXTTK0A==
X-CSE-MsgGUID: kH4MRBc+TBeeOzPd9YCOqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64218599"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="64218599"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 02:09:01 -0700
X-CSE-ConnectionGUID: tJZbMtIeReGAoZGxnAlKbQ==
X-CSE-MsgGUID: brgx0hFBTumfZoxItKpSTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="159427327"
Received: from zzombora-mobl1.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.11])
 by orviesa005.jf.intel.com with SMTP; 01 Jul 2025 02:08:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Jul 2025 12:08:56 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 16/19] drm/tegra: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Date: Tue,  1 Jul 2025 12:07:19 +0300
Message-ID: <20250701090722.13645-17-ville.syrjala@linux.intel.com>
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

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/tegra/drm.h   | 1 +
 drivers/gpu/drm/tegra/fb.c    | 5 +++--
 drivers/gpu/drm/tegra/fbdev.c | 4 +++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 77e520c43f72..1dd3670f37db 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -185,6 +185,7 @@ bool tegra_fb_is_bottom_up(struct drm_framebuffer *framebuffer);
 int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
 			struct tegra_bo_tiling *tiling);
 struct drm_framebuffer *tegra_fb_alloc(struct drm_device *drm,
+				       const struct drm_format_info *info,
 				       const struct drm_mode_fb_cmd2 *mode_cmd,
 				       struct tegra_bo **planes,
 				       unsigned int num_planes);
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index d359683f5ce6..dd041089f797 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -102,6 +102,7 @@ static const struct drm_framebuffer_funcs tegra_fb_funcs = {
 };
 
 struct drm_framebuffer *tegra_fb_alloc(struct drm_device *drm,
+				       const struct drm_format_info *info,
 				       const struct drm_mode_fb_cmd2 *mode_cmd,
 				       struct tegra_bo **planes,
 				       unsigned int num_planes)
@@ -114,7 +115,7 @@ struct drm_framebuffer *tegra_fb_alloc(struct drm_device *drm,
 	if (!fb)
 		return ERR_PTR(-ENOMEM);
 
-	drm_helper_mode_fill_fb_struct(drm, fb, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(drm, fb, info, mode_cmd);
 
 	for (i = 0; i < fb->format->num_planes; i++)
 		fb->obj[i] = &planes[i]->gem;
@@ -166,7 +167,7 @@ struct drm_framebuffer *tegra_fb_create(struct drm_device *drm,
 		planes[i] = to_tegra_bo(gem);
 	}
 
-	fb = tegra_fb_alloc(drm, cmd, planes, i);
+	fb = tegra_fb_alloc(drm, info, cmd, planes, i);
 	if (IS_ERR(fb)) {
 		err = PTR_ERR(fb);
 		goto unreference;
diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
index cd9d798f8870..1b70f5e164af 100644
--- a/drivers/gpu/drm/tegra/fbdev.c
+++ b/drivers/gpu/drm/tegra/fbdev.c
@@ -106,7 +106,9 @@ int tegra_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 		return PTR_ERR(info);
 	}
 
-	fb = tegra_fb_alloc(drm, &cmd, &bo, 1);
+	fb = tegra_fb_alloc(drm,
+			    drm_get_format_info(drm, cmd.pixel_format, cmd.modifier[0]),
+			    &cmd, &bo, 1);
 	if (IS_ERR(fb)) {
 		err = PTR_ERR(fb);
 		dev_err(drm->dev, "failed to allocate DRM framebuffer: %d\n",
-- 
2.49.0

