Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 022D2A58182
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 09:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2C410E317;
	Sun,  9 Mar 2025 08:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jx0IBP/o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E9B10E301;
 Sun,  9 Mar 2025 08:14:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2383DA458F0;
 Sun,  9 Mar 2025 08:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3783EC4CEEE;
 Sun,  9 Mar 2025 08:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741508052;
 bh=Y7PNf56Wiy8usWt0XJSSy9g4zzDjcdLVUFxc4qN+JSU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Jx0IBP/oLb7j+4Pn2k702XiOEeIxxIkiOkhmF6hrNGshZ1CCzdB+mJJMmM8GHF5QV
 AAlNYMkMNTlw3jtsMT19Xmg8q5yrKZMwAyW9Op0/a6CIaPeSz9Wg2h+/eW1F0QcY2m
 vjnhZjE8AcsfitipuUfmSRYmGx3mZ0v5oVT2uBJegkToN4bALx5J5w4i2OfR6/7O8z
 jgkFUr5ME17CJLDA7TDVxsfpkaDxlq6hYINbZvWTnhSGZg8dY3zAqvBIb3lUu2xpDI
 EQtjArTGyvFHsHrP/EIk3sGhSPtlxI3cI0iV+fTvQnI3t++NOD3C+cDApbflx4BUIX
 +AuI3bWG6IXDQ==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sun, 09 Mar 2025 10:13:57 +0200
Subject: [PATCH 2/4] drm/msm/hdmi: use new helper for ACR tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250309-drm-hdmi-acr-v1-2-bb9c242f4d4b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6537;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SUlsWfvGe/u7v0SEKetOa0wew4AKOLnsgQAjWExJs1E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnzU3GIi/9QsNJXAvJTF/mNboznHA/d6Om/BFNg
 9I8g7XtO62JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ81NxgAKCRCLPIo+Aiko
 1bqnB/0SSbQnnMMCctc1vMJmtC8diGqPdcWflP9xr5wWzn185Q+Wi2Y6AMOSJEv6pvOKXG8XzEz
 t3lmrUqbwV+251wy53ziUjKH5IuHmDhaFSvSR5Am75Zmw4g7FoZzabklG8G8cpVO6jJ1a2Cxqz7
 ay18HdHfrg4URTiQaqFeYOF9ZdVTIyp1ayfwKFqTDXjPRMBpXNpRsI6fjATU+p28FqPPTvIvYRy
 IQrIfK82OIcOwchVR0P+q8SE3MvBdhbAiX06OBPY3tDirYzTldimQa2thCJyq7vp3CZc1FRVKxV
 1GxhwAl1K6xpYOoZ/T7w0cC6MfApd+MegNz65RrWrgihQUiy
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

Use new drm_hdmi_acr_get_n_cts() helper instead of hand-coding the
tables. Instead of storing the rate 'index', store the audio sample rate
in hdmi->audio.rate, removing the need for even more defines.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c | 107 +++-------------------------------
 1 file changed, 9 insertions(+), 98 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
index 8bb975e82c17c1d77217128e9ddbd6a0575bb33d..b9ec14ef2c20ebfa03c30994eb2395f21b9502bb 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
 #include <linux/hdmi.h>
@@ -12,71 +13,9 @@
 
 #include "hdmi.h"
 
-/* Supported HDMI Audio sample rates */
-#define MSM_HDMI_SAMPLE_RATE_32KHZ		0
-#define MSM_HDMI_SAMPLE_RATE_44_1KHZ		1
-#define MSM_HDMI_SAMPLE_RATE_48KHZ		2
-#define MSM_HDMI_SAMPLE_RATE_88_2KHZ		3
-#define MSM_HDMI_SAMPLE_RATE_96KHZ		4
-#define MSM_HDMI_SAMPLE_RATE_176_4KHZ		5
-#define MSM_HDMI_SAMPLE_RATE_192KHZ		6
-#define MSM_HDMI_SAMPLE_RATE_MAX		7
-
-
-struct hdmi_msm_audio_acr {
-	uint32_t n;	/* N parameter for clock regeneration */
-	uint32_t cts;	/* CTS parameter for clock regeneration */
-};
-
-struct hdmi_msm_audio_arcs {
-	unsigned long int pixclock;
-	struct hdmi_msm_audio_acr lut[MSM_HDMI_SAMPLE_RATE_MAX];
-};
-
-#define HDMI_MSM_AUDIO_ARCS(pclk, ...) { (1000 * (pclk)), __VA_ARGS__ }
-
-/* Audio constants lookup table for hdmi_msm_audio_acr_setup */
-/* Valid Pixel-Clock rates: 25.2MHz, 27MHz, 27.03MHz, 74.25MHz, 148.5MHz */
-static const struct hdmi_msm_audio_arcs acr_lut[] = {
-	/*  25.200MHz  */
-	HDMI_MSM_AUDIO_ARCS(25200, {
-		{4096, 25200}, {6272, 28000}, {6144, 25200}, {12544, 28000},
-		{12288, 25200}, {25088, 28000}, {24576, 25200} }),
-	/*  27.000MHz  */
-	HDMI_MSM_AUDIO_ARCS(27000, {
-		{4096, 27000}, {6272, 30000}, {6144, 27000}, {12544, 30000},
-		{12288, 27000}, {25088, 30000}, {24576, 27000} }),
-	/*  27.027MHz */
-	HDMI_MSM_AUDIO_ARCS(27030, {
-		{4096, 27027}, {6272, 30030}, {6144, 27027}, {12544, 30030},
-		{12288, 27027}, {25088, 30030}, {24576, 27027} }),
-	/*  74.250MHz */
-	HDMI_MSM_AUDIO_ARCS(74250, {
-		{4096, 74250}, {6272, 82500}, {6144, 74250}, {12544, 82500},
-		{12288, 74250}, {25088, 82500}, {24576, 74250} }),
-	/* 148.500MHz */
-	HDMI_MSM_AUDIO_ARCS(148500, {
-		{4096, 148500}, {6272, 165000}, {6144, 148500}, {12544, 165000},
-		{12288, 148500}, {25088, 165000}, {24576, 148500} }),
-};
-
-static const struct hdmi_msm_audio_arcs *get_arcs(unsigned long int pixclock)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(acr_lut); i++) {
-		const struct hdmi_msm_audio_arcs *arcs = &acr_lut[i];
-		if (arcs->pixclock == pixclock)
-			return arcs;
-	}
-
-	return NULL;
-}
-
 int msm_hdmi_audio_update(struct hdmi *hdmi)
 {
 	struct hdmi_audio *audio = &hdmi->audio;
-	const struct hdmi_msm_audio_arcs *arcs = NULL;
 	bool enabled = audio->enabled;
 	uint32_t acr_pkt_ctrl, vbi_pkt_ctrl, aud_pkt_ctrl;
 	uint32_t audio_config;
@@ -94,15 +33,6 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 		enabled = false;
 	}
 
-	if (enabled) {
-		arcs = get_arcs(hdmi->pixclock);
-		if (!arcs) {
-			DBG("disabling audio: unsupported pixclock: %lu",
-					hdmi->pixclock);
-			enabled = false;
-		}
-	}
-
 	/* Read first before writing */
 	acr_pkt_ctrl = hdmi_read(hdmi, REG_HDMI_ACR_PKT_CTRL);
 	vbi_pkt_ctrl = hdmi_read(hdmi, REG_HDMI_VBI_PKT_CTRL);
@@ -116,15 +46,12 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 		uint32_t n, cts, multiplier;
 		enum hdmi_acr_cts select;
 
-		n   = arcs->lut[audio->rate].n;
-		cts = arcs->lut[audio->rate].cts;
+		drm_hdmi_acr_get_n_cts(hdmi->pixclock, audio->rate, &n, &cts);
 
-		if ((MSM_HDMI_SAMPLE_RATE_192KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_176_4KHZ == audio->rate)) {
+		if (audio->rate == 192000 || audio->rate == 176400) {
 			multiplier = 4;
 			n >>= 2; /* divide N by 4 and use multiplier */
-		} else if ((MSM_HDMI_SAMPLE_RATE_96KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_88_2KHZ == audio->rate)) {
+		} else if (audio->rate == 96000 || audio->rate == 88200) {
 			multiplier = 2;
 			n >>= 1; /* divide N by 2 and use multiplier */
 		} else {
@@ -137,13 +64,11 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 		acr_pkt_ctrl |= HDMI_ACR_PKT_CTRL_AUDIO_PRIORITY;
 		acr_pkt_ctrl |= HDMI_ACR_PKT_CTRL_N_MULTIPLIER(multiplier);
 
-		if ((MSM_HDMI_SAMPLE_RATE_48KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_96KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_192KHZ == audio->rate))
+		if (audio->rate == 48000 || audio->rate == 96000 ||
+		    audio->rate == 192000)
 			select = ACR_48;
-		else if ((MSM_HDMI_SAMPLE_RATE_44_1KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_88_2KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_176_4KHZ == audio->rate))
+		else if (audio->rate == 44100 || audio->rate == 88200 ||
+			 audio->rate == 176400)
 			select = ACR_44;
 		else /* default to 32k */
 			select = ACR_32;
@@ -204,7 +129,6 @@ int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	unsigned int rate;
 	int ret;
 
 	drm_dbg_driver(bridge->dev, "%u Hz, %d bit, %d channels\n",
@@ -214,25 +138,12 @@ int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
 
 	switch (params->sample_rate) {
 	case 32000:
-		rate = MSM_HDMI_SAMPLE_RATE_32KHZ;
-		break;
 	case 44100:
-		rate = MSM_HDMI_SAMPLE_RATE_44_1KHZ;
-		break;
 	case 48000:
-		rate = MSM_HDMI_SAMPLE_RATE_48KHZ;
-		break;
 	case 88200:
-		rate = MSM_HDMI_SAMPLE_RATE_88_2KHZ;
-		break;
 	case 96000:
-		rate = MSM_HDMI_SAMPLE_RATE_96KHZ;
-		break;
 	case 176400:
-		rate = MSM_HDMI_SAMPLE_RATE_176_4KHZ;
-		break;
 	case 192000:
-		rate = MSM_HDMI_SAMPLE_RATE_192KHZ;
 		break;
 	default:
 		drm_err(bridge->dev, "rate[%d] not supported!\n",
@@ -245,7 +156,7 @@ int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
 	if (ret)
 		return ret;
 
-	hdmi->audio.rate = rate;
+	hdmi->audio.rate = params->sample_rate;
 	hdmi->audio.channels = params->cea.channels;
 	hdmi->audio.enabled = true;
 

-- 
2.39.5

