Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235F3A84A02
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DEF10EA41;
	Thu, 10 Apr 2025 16:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CjfCVKC8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1725B10EA3B;
 Thu, 10 Apr 2025 16:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744302825; x=1775838825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tL0K6s/BvLinP4UF7E69JAgncDkaAeda+2LEshLsvCw=;
 b=CjfCVKC8MnM62X9fN3tujPfgag0nmFN7zlrK3rsFsXKcPA//jEM2erIU
 cpR9Spvd/RompWeUDNO/otx9IPrbKvrnlhv2e2WmNT06xA376+EAwXzS8
 3UVd07fR6XNhsbsiAxXYkgtUiKVPEOO4zbXUtfhB02YtuqffjOcsSsxeE
 PoupEAcRZt50pr5wvnhUeymjHJRJqGk2higkHBnWBA2PTjK/PyqLaITRN
 7vdbn9tGAHGtL0p5ny2stlHvUQ5ukoXfnVQZuYAbjnvesppzsCOiwhiqp
 L1IH+1F+GRr+s4SvLt62aCQiqdNJgvIo5VVE9M3LbwXRGMqJmN2e9onhD Q==;
X-CSE-ConnectionGUID: RSJ/mTaaTgSRvL4flBcjUQ==
X-CSE-MsgGUID: UYIIlq/4TJWWgUBna4u8kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57220121"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="57220121"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:33:45 -0700
X-CSE-ConnectionGUID: LdM1bALfRqaAjMGRdl/ZqQ==
X-CSE-MsgGUID: rKFVUY4MQuOYYNhXFuxCNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134129380"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 09:33:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Apr 2025 19:33:40 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 15/19] drm/msm: Pass along the format info from .fb_create()
 to drm_helper_mode_fill_fb_struct()
Date: Thu, 10 Apr 2025 19:32:14 +0300
Message-ID: <20250410163218.15130-16-ville.syrjala@linux.intel.com>
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
lookups.

For the fbdev case a manual drm_get_format_info() lookup
is needed.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 0615427e85ce..d7bc4479547d 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -30,6 +30,7 @@ struct msm_framebuffer {
 #define to_msm_framebuffer(x) container_of(x, struct msm_framebuffer, base)
 
 static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
+		const struct drm_format_info *info,
 		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos);
 
 static int msm_framebuffer_dirtyfb(struct drm_framebuffer *fb,
@@ -149,7 +150,7 @@ struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
 		}
 	}
 
-	fb = msm_framebuffer_init(dev, mode_cmd, bos);
+	fb = msm_framebuffer_init(dev, info, mode_cmd, bos);
 	if (IS_ERR(fb)) {
 		ret = PTR_ERR(fb);
 		goto out_unref;
@@ -164,11 +165,9 @@ struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
 }
 
 static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
+		const struct drm_format_info *info,
 		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos)
 {
-	const struct drm_format_info *info = drm_get_format_info(dev,
-								 mode_cmd->pixel_format,
-								 mode_cmd->modifier[0]);
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	struct msm_framebuffer *msm_fb = NULL;
@@ -222,7 +221,7 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 		msm_fb->base.obj[i] = bos[i];
 	}
 
-	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
 
 	ret = drm_framebuffer_init(dev, fb, &msm_framebuffer_funcs);
 	if (ret) {
@@ -271,7 +270,10 @@ msm_alloc_stolen_fb(struct drm_device *dev, int w, int h, int p, uint32_t format
 
 	msm_gem_object_set_name(bo, "stolenfb");
 
-	fb = msm_framebuffer_init(dev, &mode_cmd, &bo);
+	fb = msm_framebuffer_init(dev,
+				  drm_get_format_info(dev, mode_cmd.pixel_format,
+						      mode_cmd.modifier[0]),
+				  &mode_cmd, &bo);
 	if (IS_ERR(fb)) {
 		DRM_DEV_ERROR(dev->dev, "failed to allocate fb\n");
 		/* note: if fb creation failed, we can't rely on fb destroy
-- 
2.49.0

