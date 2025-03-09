Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA2BA58184
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 09:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F7010E320;
	Sun,  9 Mar 2025 08:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Qkv1Uhwp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C06E10E327;
 Sun,  9 Mar 2025 08:14:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C050EA45B0E;
 Sun,  9 Mar 2025 08:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E72C4CEEC;
 Sun,  9 Mar 2025 08:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741508056;
 bh=iKB2YBTN12itUfX2G/gBJMos1y7mn3/DCF/Ulyo0X7I=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Qkv1UhwpVdIF/mpWjUCndDtzuaBw32F3c4molVWdZBfu/5pq6VrY5D7oO2XpWZDus
 AymRUdLjPF08GGjit0GU9imow6SKUk7hw4nATiOLi5r8fyRV30rW5aEA9RPkngIppv
 KLRKqqus1LbM7aKgw8MF29H7TClXXPeqOY0TSSZ4miHhbt7n2gQCF6QlKjAe7wIHEp
 a/3jvoql9kiknW0HAyF+k2hD6ni/pW4x6R8JGCGEw9d/4lWlZ2uefdZmRC1CHTL8dj
 TJO1itTPIIGn1pvtaOQRlcREXlwiCuiePJ0Owh8KNnyfz4+ILagipD4BvbyYP/eq9V
 azkpCbDxCE4Rw==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sun, 09 Mar 2025 10:13:58 +0200
Subject: [PATCH 3/4] drm/vc4: use new helper to get ACR values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250309-drm-hdmi-acr-v1-3-bb9c242f4d4b@linaro.org>
References: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
In-Reply-To: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2230;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=W6pWxFzbC0mPSPnJqUk170LFBYndwgytPiGUkUHjC54=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnzU3GrYcDRMq3W4ONCVGhBpUXl6k8lj2QsL7nl
 gdbA5U9/TyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ81NxgAKCRCLPIo+Aiko
 1dFKB/9JZWpbJ6y3a1WbkyYvqPJsufPOri+tur/kkqtnfjY8NYZEJBH/HZT9JHz9RRHAM6EFJtm
 gUL7PIDiHT1k4GT46QcRwQHgDipgj/auPslmS87JoUNdXfDX14abRUMRUb1W2sfaPSCar3YF4F5
 Vw8tOp+M82WiScIY5lGVlVo4Nrvl9aM30omD3AvMlt5V9zsgQgAkgEqHgoBWdICf8DU4Ih9Jadz
 +ccaUCMJML4c/gvDTcMTmObieduMt0iVZV+PeayvUgGCIr3h9XgaC/kajSpMqSrXyYczNH7G0XM
 cJXIJVPY8WeKbSfzv2bycJUTkfXz2NNZtK3OCWUYW9NTkkgh
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Use drm_hdmi_acr_get_n_cts() helper instead of calculating N and CTS
values in the VC4 driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++-------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 37238a12baa58a06a5d6f40d1ab64abc7fac60d7..f24bcc2f3a2ac39aaea061b809940978341472f4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1637,6 +1637,7 @@ static void vc4_hdmi_encoder_atomic_mode_set(struct drm_encoder *encoder,
 		      &crtc_state->adjusted_mode);
 	vc4_hdmi->output_bpc = conn_state->hdmi.output_bpc;
 	vc4_hdmi->output_format = conn_state->hdmi.output_format;
+	vc4_hdmi->tmds_char_rate = conn_state->hdmi.tmds_char_rate;
 	mutex_unlock(&vc4_hdmi->mutex);
 }
 
@@ -1829,17 +1830,12 @@ static void vc4_hdmi_audio_set_mai_clock(struct vc4_hdmi *vc4_hdmi,
 
 static void vc4_hdmi_set_n_cts(struct vc4_hdmi *vc4_hdmi, unsigned int samplerate)
 {
-	const struct drm_display_mode *mode = &vc4_hdmi->saved_adjusted_mode;
-	u32 n, cts;
-	u64 tmp;
+	unsigned int n, cts;
 
 	lockdep_assert_held(&vc4_hdmi->mutex);
 	lockdep_assert_held(&vc4_hdmi->hw_lock);
 
-	n = 128 * samplerate / 1000;
-	tmp = (u64)(mode->clock * 1000) * n;
-	do_div(tmp, 128 * samplerate);
-	cts = tmp;
+	drm_hdmi_acr_get_n_cts(vc4_hdmi->tmds_char_rate, samplerate, &n, &cts);
 
 	HDMI_WRITE(HDMI_CRP_CFG,
 		   VC4_HDMI_CRP_CFG_EXTERNAL_CTS_EN |
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index e3d989ca302b72533c374dfa3fd0d5bd7fe64a82..0a775dbfe99d45521f3d0a2016555aefa81d7934 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -211,6 +211,13 @@ struct vc4_hdmi {
 	 * KMS hooks. Protected by @mutex.
 	 */
 	enum hdmi_colorspace output_format;
+
+	/**
+	 * @tmds_char_rate: Copy of
+	 * @drm_connector_state.hdmi.tmds_char_rate for use outside of
+	 * KMS hooks. Protected by @mutex.
+	 */
+	unsigned long long tmds_char_rate;
 };
 
 #define connector_to_vc4_hdmi(_connector)				\

-- 
2.39.5

