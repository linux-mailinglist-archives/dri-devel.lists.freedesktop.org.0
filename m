Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FDDAEF2AF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D2310E572;
	Tue,  1 Jul 2025 09:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VgIIZ9TU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3729810E56F;
 Tue,  1 Jul 2025 09:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751360937; x=1782896937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U2KlIWIZ4E5ySX5ZHLmAs18VIqpprG+irqTyD0u890g=;
 b=VgIIZ9TUNFxZPrRvZHjv5gDwpQIj9dRQifLlu7IcObB9AYb73c4glCTN
 wqvqHSflzL3HWvsmiM1x+yDlkJDkh7cUqtAV71RY7+F2tRco5cn9X6Mei
 rMy7Po2TsJYShYCwAFtr2Ru5bYncbnIUQU4M7gTSfzGa09o4VBN6XH0cx
 +y81vEPw/x0GR2fjK25YMI0nCKEnVitU0zqqaLMRuGq4phqwgFXCaOadI
 bYj9yJBr2ySEC6wNtI5qy+9d1GYxqFD6XQNX4cBDjT1E4zRMsPXWjbgGn
 6SpNnvsqn30CjCiZoIbKKm0pukHEtNzeKNVjNKkGUN98NO5j+aXKyvMjA A==;
X-CSE-ConnectionGUID: MWY/OsgqTnWW9YB8wPhpZw==
X-CSE-MsgGUID: 2EW2lpF1S7+IdcDtPbxgCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64218585"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="64218585"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 02:08:57 -0700
X-CSE-ConnectionGUID: tEsn6lv9QeOh7SOwcZ55YQ==
X-CSE-MsgGUID: QxO1wgINR56//xQe68PaFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="159427305"
Received: from zzombora-mobl1.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.11])
 by orviesa005.jf.intel.com with SMTP; 01 Jul 2025 02:08:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Jul 2025 12:08:50 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 15/19] drm/msm: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Date: Tue,  1 Jul 2025 12:07:18 +0300
Message-ID: <20250701090722.13645-16-ville.syrjala@linux.intel.com>
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
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

