Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B4C48E4E9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 08:40:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12F010E154;
	Fri, 14 Jan 2022 07:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0DF10E154
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 07:40:43 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id u11so7437361plh.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 23:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EI6TVgd30tF1viMoRS7X9CLLIp4oh9sWJRBeqJ6vOEs=;
 b=dJtwix545BgyqpGmuYhlM59DrUTSfFr4JBF2rTd97bZ2wvRA+ehYAsWMjHCkdTNPS5
 Q8uleh7MqoEq2eYMGp4TTU7cYVRQupTMStIR8wYuOlNB+46IsL4XzIBBtk15KodOewS/
 3AvXU8JgZR8zP6U8TVmojq/c2wPZgf1ZaZlAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EI6TVgd30tF1viMoRS7X9CLLIp4oh9sWJRBeqJ6vOEs=;
 b=qB92QwnbsfWFX8MheHllRpSMmGfhr/o4HTQoX61WwWmUCnZhN63adtXa7tMo1YEwYW
 lQLOoykQhnzM+lFXhiK+54maU40cZ82oySKgD2K0ek2RZ6Px/xScrreWUEpYvLaLi7rU
 w4BxhWHbzu7o2YmDQVPXRz/iNv2Gog0fm1knXUIIjgftXRb0+cITxvLnN88G52uDfEEY
 uBpF5334QA7yoCynAMu7SBW48P0POYASmyJUGLbmQSXZFhjHZFENRjcCUldjngq+M9tE
 p6yVar7R3K315kX7R9VjNxkKzBgkEWDzY6X847Q7ZmdlnYK0F9iHQMvGUTaQNFK6irhm
 MSdg==
X-Gm-Message-State: AOAM532kYvf2OWaszg8ighmYygW8vKUInWcAVUP/LRQvOrLLyAS4FrJv
 QN0YiygeD81ZRkOOxbzmQAytuyDzWGLLrw==
X-Google-Smtp-Source: ABdhPJyvVORg9pEv7zdC5lqN5kgYrK/wPIL/+XApB8HBIAg6uDXXKDS5BM7pCAQ4eBFY4dCiNDJaOw==
X-Received: by 2002:a17:90a:df10:: with SMTP id
 gp16mr9308813pjb.69.1642146043403; 
 Thu, 13 Jan 2022 23:40:43 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:40e5:515f:fd6e:aa97])
 by smtp.gmail.com with ESMTPSA id o15sm1205700pfg.176.2022.01.13.23.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 23:40:42 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/rockchip: Support YUV formats with U/V swapped
Date: Fri, 14 Jan 2022 15:40:38 +0800
Message-Id: <20220114074038.2633848-1-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
MIME-Version: 1.0
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
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wenst@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VOP in Rockchip SoCs that support YUV planes also support swapping
of the U and V elements. Supporting the swapped variants, especially
NV21, would be beneficial for multimedia applications, as the hardware
video decoders only output NV21, and supporting this pixel format in
the display pipeline would allow the decoded video frames to be output
directly.

Add support for this to support the various formats that have U/V
swapped.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---

This was tested on an ROC-RK3399-PC with modetest only. Changes to all
other SoC platforms were based on their respective TRMs.

---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 20 +++++++++++++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h |  1 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 11 +++++++++++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 3e8d9e2d1b67..c75b39474977 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -262,6 +262,18 @@ static bool has_rb_swapped(uint32_t format)
 	}
 }
 
+static bool has_uv_swapped(uint32_t format)
+{
+	switch (format) {
+	case DRM_FORMAT_NV21:
+	case DRM_FORMAT_NV61:
+	case DRM_FORMAT_NV42:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static enum vop_data_format vop_convert_format(uint32_t format)
 {
 	switch (format) {
@@ -277,10 +289,13 @@ static enum vop_data_format vop_convert_format(uint32_t format)
 	case DRM_FORMAT_BGR565:
 		return VOP_FMT_RGB565;
 	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV21:
 		return VOP_FMT_YUV420SP;
 	case DRM_FORMAT_NV16:
+	case DRM_FORMAT_NV61:
 		return VOP_FMT_YUV422SP;
 	case DRM_FORMAT_NV24:
+	case DRM_FORMAT_NV42:
 		return VOP_FMT_YUV444SP;
 	default:
 		DRM_ERROR("unsupported format[%08x]\n", format);
@@ -899,7 +914,7 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
 	unsigned long offset;
 	dma_addr_t dma_addr;
 	uint32_t val;
-	bool rb_swap;
+	bool rb_swap, uv_swap;
 	int win_index = VOP_WIN_TO_INDEX(vop_win);
 	int format;
 	int is_yuv = fb->format->is_yuv;
@@ -988,6 +1003,9 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
 							y2r_coefficients[i],
 							bt601_yuv2rgb[i]);
 		}
+
+		uv_swap = has_uv_swapped(fb->format->format);
+		VOP_WIN_SET(vop, win, uv_swap, uv_swap);
 	}
 
 	if (win->phy->scl)
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
index 857d97cdc67c..3aa95fdd427d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
@@ -166,6 +166,7 @@ struct vop_win_phy {
 	struct vop_reg gate;
 	struct vop_reg format;
 	struct vop_reg rb_swap;
+	struct vop_reg uv_swap;
 	struct vop_reg act_info;
 	struct vop_reg dsp_info;
 	struct vop_reg dsp_st;
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index 1f7353f0684a..af2b07fafadf 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -46,8 +46,11 @@ static const uint32_t formats_win_full[] = {
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_BGR565,
 	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
 	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV61,
 	DRM_FORMAT_NV24,
+	DRM_FORMAT_NV42,
 };
 
 static const uint64_t format_modifiers_win_full[] = {
@@ -272,6 +275,7 @@ static const struct vop_win_phy px30_win0_data = {
 	.enable = VOP_REG(PX30_WIN0_CTRL0, 0x1, 0),
 	.format = VOP_REG(PX30_WIN0_CTRL0, 0x7, 1),
 	.rb_swap = VOP_REG(PX30_WIN0_CTRL0, 0x1, 12),
+	.uv_swap = VOP_REG(PX30_WIN0_CTRL0, 0x1, 15),
 	.act_info = VOP_REG(PX30_WIN0_ACT_INFO, 0xffffffff, 0),
 	.dsp_info = VOP_REG(PX30_WIN0_DSP_INFO, 0xffffffff, 0),
 	.dsp_st = VOP_REG(PX30_WIN0_DSP_ST, 0xffffffff, 0),
@@ -291,6 +295,7 @@ static const struct vop_win_phy px30_win1_data = {
 	.enable = VOP_REG(PX30_WIN1_CTRL0, 0x1, 0),
 	.format = VOP_REG(PX30_WIN1_CTRL0, 0x7, 4),
 	.rb_swap = VOP_REG(PX30_WIN1_CTRL0, 0x1, 12),
+	.uv_swap = VOP_REG(PX30_WIN1_CTRL0, 0x1, 15),
 	.dsp_info = VOP_REG(PX30_WIN1_DSP_INFO, 0xffffffff, 0),
 	.dsp_st = VOP_REG(PX30_WIN1_DSP_ST, 0xffffffff, 0),
 	.yrgb_mst = VOP_REG(PX30_WIN1_MST, 0xffffffff, 0),
@@ -368,6 +373,7 @@ static const struct vop_win_phy rk3066_win0_data = {
 	.enable = VOP_REG(RK3066_SYS_CTRL1, 0x1, 0),
 	.format = VOP_REG(RK3066_SYS_CTRL1, 0x7, 4),
 	.rb_swap = VOP_REG(RK3066_SYS_CTRL1, 0x1, 19),
+	.uv_swap = VOP_REG(RK3066_SYS_CTRL1, 0x1, 22),
 	.act_info = VOP_REG(RK3066_WIN0_ACT_INFO, 0x1fff1fff, 0),
 	.dsp_info = VOP_REG(RK3066_WIN0_DSP_INFO, 0x0fff0fff, 0),
 	.dsp_st = VOP_REG(RK3066_WIN0_DSP_ST, 0x1fff1fff, 0),
@@ -386,6 +392,7 @@ static const struct vop_win_phy rk3066_win1_data = {
 	.enable = VOP_REG(RK3066_SYS_CTRL1, 0x1, 1),
 	.format = VOP_REG(RK3066_SYS_CTRL1, 0x7, 7),
 	.rb_swap = VOP_REG(RK3066_SYS_CTRL1, 0x1, 23),
+	.uv_swap = VOP_REG(RK3066_SYS_CTRL1, 0x1, 26),
 	.act_info = VOP_REG(RK3066_WIN1_ACT_INFO, 0x1fff1fff, 0),
 	.dsp_info = VOP_REG(RK3066_WIN1_DSP_INFO, 0x0fff0fff, 0),
 	.dsp_st = VOP_REG(RK3066_WIN1_DSP_ST, 0x1fff1fff, 0),
@@ -489,6 +496,7 @@ static const struct vop_win_phy rk3188_win0_data = {
 	.enable = VOP_REG(RK3188_SYS_CTRL, 0x1, 0),
 	.format = VOP_REG(RK3188_SYS_CTRL, 0x7, 3),
 	.rb_swap = VOP_REG(RK3188_SYS_CTRL, 0x1, 15),
+	.uv_swap = VOP_REG(RK3188_SYS_CTRL, 0x1, 18),
 	.act_info = VOP_REG(RK3188_WIN0_ACT_INFO, 0x1fff1fff, 0),
 	.dsp_info = VOP_REG(RK3188_WIN0_DSP_INFO, 0x0fff0fff, 0),
 	.dsp_st = VOP_REG(RK3188_WIN0_DSP_ST, 0x1fff1fff, 0),
@@ -619,6 +627,7 @@ static const struct vop_win_phy rk3288_win01_data = {
 	.enable = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 0),
 	.format = VOP_REG(RK3288_WIN0_CTRL0, 0x7, 1),
 	.rb_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 12),
+	.uv_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 15),
 	.act_info = VOP_REG(RK3288_WIN0_ACT_INFO, 0x1fff1fff, 0),
 	.dsp_info = VOP_REG(RK3288_WIN0_DSP_INFO, 0x0fff0fff, 0),
 	.dsp_st = VOP_REG(RK3288_WIN0_DSP_ST, 0x1fff1fff, 0),
@@ -753,6 +762,7 @@ static const struct vop_win_phy rk3368_win01_data = {
 	.enable = VOP_REG(RK3368_WIN0_CTRL0, 0x1, 0),
 	.format = VOP_REG(RK3368_WIN0_CTRL0, 0x7, 1),
 	.rb_swap = VOP_REG(RK3368_WIN0_CTRL0, 0x1, 12),
+	.uv_swap = VOP_REG(RK3368_WIN0_CTRL0, 0x1, 15),
 	.x_mir_en = VOP_REG(RK3368_WIN0_CTRL0, 0x1, 21),
 	.y_mir_en = VOP_REG(RK3368_WIN0_CTRL0, 0x1, 22),
 	.act_info = VOP_REG(RK3368_WIN0_ACT_INFO, 0x1fff1fff, 0),
@@ -902,6 +912,7 @@ static const struct vop_win_phy rk3399_win01_data = {
 	.enable = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 0),
 	.format = VOP_REG(RK3288_WIN0_CTRL0, 0x7, 1),
 	.rb_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 12),
+	.uv_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 15),
 	.y_mir_en = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 22),
 	.act_info = VOP_REG(RK3288_WIN0_ACT_INFO, 0x1fff1fff, 0),
 	.dsp_info = VOP_REG(RK3288_WIN0_DSP_INFO, 0x0fff0fff, 0),
-- 
2.34.1.703.g22d0c6ccf7-goog

