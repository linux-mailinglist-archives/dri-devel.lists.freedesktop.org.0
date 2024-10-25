Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 606809B0ADB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECA210EB41;
	Fri, 25 Oct 2024 17:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="hSFulc3R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED3410EB2B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:16:28 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-37d3ecad390so2496235f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 10:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729876586; x=1730481386;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FpgFdk3JtzocDW3WFzPDdBLFBiWF0X+yqUm+UTtblgc=;
 b=hSFulc3RFzn9uQZhoJz4r/I/g6wpGBSy0O6TbgVB1zrroSleKTqT/4vQ2WIkHdtiQo
 IrXIcflvRWs44B4sNrfei7TyyPgAaSrrz/FCnGdwQ9OUwKUMy/dcNhy8OVjh32LdY/sV
 6S+cIPIyLNlHG7hsBDfWOoLQSkCAmZLqeIpjy6xHxOSHhgomBO/mfeigMdPwkdcPxJWD
 qlYzusXzb79EUYzjRxgK9Pd9ynpqOruc+vMQQZFQQqWivrHdixLxjanUDmh7B2IQYmOZ
 n78Bqr/r+mjrZl7XLW7Rh6wJhOTj08iG7nUEECtjbdzkDXfB7/zS6UVZ81WlxteIntG/
 vheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729876586; x=1730481386;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FpgFdk3JtzocDW3WFzPDdBLFBiWF0X+yqUm+UTtblgc=;
 b=duDBydibk30fZISdNhwb1KQn/rxhi65wiJyB1/MuJkk8NaaCWeQH4b9uG7MWgRA0ng
 PNgOl6EDn6ZdzY96sDpmujcJucax8Df7z8Jn8UX+GsJjcz/WENq791oGHgYMKHQ4Ptbo
 Eub/hSYp7cgMPKUgvnseCjSFvvHn281D0qf2TyJC/GbNnOmXgOyQKaw+t+ZixeScBSVp
 SvX4OJYY/PtpihuyAeZmbtFKaax3F2twuKxkTmn2qFPqpMslZJAhzXa4pMEixXt771SP
 Y8m5qaNPHLYQgBujljQVwEmu3lAEbu8H+5NdOFq+/BbFq9pG89HBxXpBXufPBRh9kNjR
 Hg7A==
X-Gm-Message-State: AOJu0YyQcIFl8iewpulR+LPy2GuYkh3mmgPCm3d5VhoI5M1Yyi+C9wwd
 3NnPqQ38VNs4J1lJSFsHMpyiv5qIVsl/bNz47Ojq6ye9bJipXmNjiTwE1N0k8EM=
X-Google-Smtp-Source: AGHT+IEjGuncFTNT/SZ4zceoos60e4tV8diFXOXGxrnPO4HgWUpl+fjYGjtIIh1LWTqEDG68tqrqAQ==
X-Received: by 2002:a5d:40c6:0:b0:37d:2d6f:3284 with SMTP id
 ffacd0b85a97d-38060eb2031mr225091f8f.9.1729876586551; 
 Fri, 25 Oct 2024 10:16:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:16:26 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:57 +0100
Subject: [PATCH v2 26/36] drm/vc4: Add additional warn_on for incorrect
 revisions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-26-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
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

From: Maxime Ripard <mripard@kernel.org>

Some code path in vc4 are conditional to a generation and cannot be
executed on others. Let's put a WARN_ON if that ever happens.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c   | 30 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_kms.c   |  6 ++++++
 drivers/gpu/drm/vc4/vc4_plane.c | 17 +++++++++++++++++
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 11acc56ab92d..2493ac17d78f 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -419,12 +419,15 @@ static int vc4_hvs_upload_linear_kernel(struct vc4_hvs *hvs,
 static void vc4_hvs_lut_load(struct vc4_hvs *hvs,
 			     struct vc4_crtc *vc4_crtc)
 {
-	struct drm_device *drm = &hvs->vc4->base;
+	struct vc4_dev *vc4 = hvs->vc4;
+	struct drm_device *drm = &vc4->base;
 	struct drm_crtc *crtc = &vc4_crtc->base;
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
 	int idx;
 	u32 i;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_5);
+
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
@@ -474,6 +477,8 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 	u8 field = 0;
 	int idx;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_6_D);
+
 	if (!drm_dev_enter(drm, &idx))
 		return 0;
 
@@ -530,6 +535,8 @@ int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output)
 	u32 reg;
 	int ret;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_6_D);
+
 	switch (vc4->gen) {
 	case VC4_GEN_4:
 		return output;
@@ -621,6 +628,8 @@ static int vc4_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 	u32 dispctrl;
 	int idx;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_5);
+
 	if (!drm_dev_enter(drm, &idx))
 		return -ENODEV;
 
@@ -682,6 +691,8 @@ static int vc6_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 	u32 disp_ctrl1;
 	int idx;
 
+	WARN_ON_ONCE(vc4->gen < VC4_GEN_6_C);
+
 	if (!drm_dev_enter(drm, &idx))
 		return -ENODEV;
 
@@ -707,9 +718,12 @@ static int vc6_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 
 static void __vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int chan)
 {
-	struct drm_device *drm = &hvs->vc4->base;
+	struct vc4_dev *vc4 = hvs->vc4;
+	struct drm_device *drm = &vc4->base;
 	int idx;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_5);
+
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
@@ -740,6 +754,8 @@ static void __vc6_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int chan)
 	struct drm_device *drm = &vc4->base;
 	int idx;
 
+	WARN_ON_ONCE(vc4->gen < VC4_GEN_6_C);
+
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
@@ -927,6 +943,8 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	bool found = false;
 	int idx;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_6_D);
+
 	if (!drm_dev_enter(dev, &idx)) {
 		vc4_crtc_send_vblank(crtc);
 		return;
@@ -1011,6 +1029,8 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	if (crtc->state->color_mgmt_changed) {
 		u32 dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(channel));
 
+		WARN_ON_ONCE(vc4->gen > VC4_GEN_5);
+
 		if (crtc->state->gamma_lut) {
 			vc4_hvs_update_gamma_lut(hvs, vc4_crtc);
 			dispbkgndx |= SCALER_DISPBKGND_GAMMA;
@@ -1040,6 +1060,8 @@ void vc4_hvs_mask_underrun(struct vc4_hvs *hvs, int channel)
 	u32 dispctrl;
 	int idx;
 
+	WARN_ON(vc4->gen > VC4_GEN_5);
+
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
@@ -1060,6 +1082,8 @@ void vc4_hvs_unmask_underrun(struct vc4_hvs *hvs, int channel)
 	u32 dispctrl;
 	int idx;
 
+	WARN_ON(vc4->gen > VC4_GEN_5);
+
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
@@ -1094,6 +1118,8 @@ static irqreturn_t vc4_hvs_irq_handler(int irq, void *data)
 	u32 status;
 	u32 dspeislur;
 
+	WARN_ON(vc4->gen > VC4_GEN_5);
+
 	/*
 	 * NOTE: We don't need to protect the register access using
 	 * drm_dev_enter() there because the interrupt handler lifetime
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index ce65e152876e..f5b167417428 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -138,6 +138,8 @@ vc4_ctm_commit(struct vc4_dev *vc4, struct drm_atomic_state *state)
 	struct vc4_ctm_state *ctm_state = to_vc4_ctm_state(vc4->ctm_manager.state);
 	struct drm_color_ctm *ctm = ctm_state->ctm;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_5);
+
 	if (ctm_state->fifo) {
 		HVS_WRITE(SCALER_OLEDCOEF2,
 			  VC4_SET_FIELD(vc4_ctm_s31_32_to_s0_9(ctm->matrix[0]),
@@ -213,6 +215,8 @@ static void vc4_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 	struct drm_crtc *crtc;
 	unsigned int i;
 
+	WARN_ON_ONCE(vc4->gen != VC4_GEN_4);
+
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
 		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 		struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
@@ -256,6 +260,8 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 	unsigned int i;
 	u32 reg;
 
+	WARN_ON_ONCE(vc4->gen != VC4_GEN_5);
+
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
 		struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
 		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 205aea3ed419..c084967d3527 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -566,8 +566,11 @@ static int vc4_plane_setup_clipping_and_scaling(struct drm_plane_state *state)
 
 static void vc4_write_tpz(struct vc4_plane_state *vc4_state, u32 src, u32 dst)
 {
+	struct vc4_dev *vc4 = to_vc4_dev(vc4_state->base.plane->dev);
 	u32 scale, recip;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_6_D);
+
 	scale = src / dst;
 
 	/* The specs note that while the reciprocal would be defined
@@ -593,10 +596,13 @@ static void vc4_write_tpz(struct vc4_plane_state *vc4_state, u32 src, u32 dst)
 static void vc4_write_ppf(struct vc4_plane_state *vc4_state, u32 src, u32 dst,
 			  u32 xy, int channel)
 {
+	struct vc4_dev *vc4 = to_vc4_dev(vc4_state->base.plane->dev);
 	u32 scale = src / dst;
 	s32 offset, offset2;
 	s32 phase;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_6_D);
+
 	/*
 	 * Start the phase at 1/2 pixel from the 1st pixel at src_x.
 	 * 1/4 pixel for YUV.
@@ -825,8 +831,11 @@ static size_t vc6_upm_size(const struct drm_plane_state *state,
 static void vc4_write_scaling_parameters(struct drm_plane_state *state,
 					 int channel)
 {
+	struct vc4_dev *vc4 = to_vc4_dev(state->plane->dev);
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_6_D);
+
 	/* Ch0 H-PPF Word 0: Scaling Parameters */
 	if (vc4_state->x_scaling[channel] == VC4_SCALING_PPF) {
 		vc4_write_ppf(vc4_state, vc4_state->src_w[channel],
@@ -1113,6 +1122,11 @@ static const u32 colorspace_coeffs[2][DRM_COLOR_ENCODING_MAX][3] = {
 
 static u32 vc4_hvs4_get_alpha_blend_mode(struct drm_plane_state *state)
 {
+	struct drm_device *dev = state->state->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+
+	WARN_ON_ONCE(vc4->gen != VC4_GEN_4);
+
 	if (!state->fb->format->has_alpha)
 		return VC4_SET_FIELD(SCALER_POS2_ALPHA_MODE_FIXED,
 				     SCALER_POS2_ALPHA_MODE);
@@ -1137,6 +1151,9 @@ static u32 vc4_hvs5_get_alpha_blend_mode(struct drm_plane_state *state)
 	struct drm_device *dev = state->state->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
+	WARN_ON_ONCE(vc4->gen != VC4_GEN_5 && vc4->gen != VC4_GEN_6_C &&
+		     vc4->gen != VC4_GEN_6_D);
+
 	switch (vc4->gen) {
 	default:
 	case VC4_GEN_5:

-- 
2.34.1

