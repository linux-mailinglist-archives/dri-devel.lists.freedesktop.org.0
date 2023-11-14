Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8712D7EB5C0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 18:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03EA10E494;
	Tue, 14 Nov 2023 17:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9384410E4A3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 17:44:14 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-77891f362cfso584085a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 09:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1699983853; x=1700588653; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LxJSud2bUpEWb5+zdKhsCdpc+jFCEiyn/rkkbqMyRnU=;
 b=gi+GSHJrAHIRQxQ6QZmCSYf+jWLGMPU54K1KekG12Yu57UEQ1Z/lIquB70Z9dY2NZf
 pvhEy2LyYiT4QPdkA99DIHzWiiFPTz0xWJh5F0ntZ4VsLFO+OyXDUTlXZQmuXYcJokqL
 DJaMoloQHy4l80CfAlRx2J8+eAK+yeDP50NBN0BnNXp4+ZeA64ch4Vz+3EyXljlKVfg7
 I7P1luEg61ZpgRJ+Gfoz6mGGyyPi96PRP5x2vuTIg1FGiXvPY4X+Fm68kQaiWfWzBOBZ
 83S2dZ6eg/VHaFDgGwhMxonkg+uhV5k/+fJIJhn8ntacVNR0RDfNlsT+IPVFPEtXO6qK
 EG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699983853; x=1700588653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LxJSud2bUpEWb5+zdKhsCdpc+jFCEiyn/rkkbqMyRnU=;
 b=d8fxIfP/DnhrgrFrwhwwC5813dm8PrS5psG0yvHnanE5cNOmfKFnEAbYsdknFIb4wu
 sCtBAjMkedv4on7UYLc0YJ0F2Rtaa4VWhOJgN8b3FEZ8lcyo+Z5dtMKeSuyyjUOxgnv+
 FHwwxrUL8NIVTo5/WhFtKC1YpkZP7i5m2DmPiCQqafrNTdpOFXvFWAiZIlgu7gQyUph/
 Bh2qlCq/rZA+Qe8wDmELLEZezjB9ieyPA2FHG6MeoDYe/jta1TjFVNQPCnfnD4CzI/Qh
 P+A4OUo35muSlSJAW+nVFVABgId2lxzmhZ2GZhy2a+LXCLg/IvGcyudfha8rhXFzQo6g
 QnJw==
X-Gm-Message-State: AOJu0Yx/jA1v5tDklfmbM7wZHuh/Va4l/f9llhvt1FVFCKJFSNGKrpXD
 YePZ4YK/b5bhYl3WKr5Jv6/Fag==
X-Google-Smtp-Source: AGHT+IFQfSiyA6caJXGmA0kjldo9K1Mp143S3RfZtOQoQPR93hcHUbZgAlUeJDg/XI9hn6gk8MAd8A==
X-Received: by 2002:a05:620a:1993:b0:76c:b7f0:2bc9 with SMTP id
 bm19-20020a05620a199300b0076cb7f02bc9mr5333777qkb.16.1699983853651; 
 Tue, 14 Nov 2023 09:44:13 -0800 (PST)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 bi8-20020a05620a318800b007671cfe8a18sm2833350qkb.13.2023.11.14.09.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 09:44:13 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 4/4] drm/msm/dsi: fix DSC for the bonded DSI case
Date: Tue, 14 Nov 2023 12:42:16 -0500
Message-Id: <20231114174218.19765-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20231114174218.19765-1-jonathan@marek.ca>
References: <20231114174218.19765-1-jonathan@marek.ca>
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the bonded DSI case, DSC pic_width and timing calculations should use
the width of a single panel instead of the total combined width.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  3 ++-
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 20 +++++++++++---------
 drivers/gpu/drm/msm/dsi/dsi_manager.c |  2 +-
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 28379b1af63f..3a641e69447c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -93,7 +93,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host);
 int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
 				  const struct drm_display_mode *mode);
 enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
-					    const struct drm_display_mode *mode);
+					    const struct drm_display_mode *mode,
+					    bool is_bonded_dsi);
 unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
 int msm_dsi_host_register(struct mipi_dsi_host *host);
 void msm_dsi_host_unregister(struct mipi_dsi_host *host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 7284346ab787..a6286eb9d006 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -938,8 +938,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			       mode->hdisplay, mode->vdisplay);
 			return;
 		}
-
-		dsc->pic_width = mode->hdisplay;
+		dsc->pic_width = hdisplay;
 		dsc->pic_height = mode->vdisplay;
 		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
 
@@ -950,6 +949,11 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		if (ret)
 			return;
 
+		if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
+			dsi_update_dsc_timing(msm_host, false, hdisplay);
+		else
+			dsi_update_dsc_timing(msm_host, true, hdisplay);
+
 		/* Divide the display by 3 but keep back/font porch and
 		 * pulse width same
 		 */
@@ -966,9 +970,6 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 	}
 
 	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
-		if (msm_host->dsc)
-			dsi_update_dsc_timing(msm_host, false, mode->hdisplay);
-
 		dsi_write(msm_host, REG_DSI_ACTIVE_H,
 			DSI_ACTIVE_H_START(ha_start) |
 			DSI_ACTIVE_H_END(ha_end));
@@ -987,9 +988,6 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
 			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
 	} else {		/* command mode */
-		if (msm_host->dsc)
-			dsi_update_dsc_timing(msm_host, true, mode->hdisplay);
-
 		/* image data and 1 byte write_memory_start cmd */
 		if (!msm_host->dsc)
 			wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
@@ -2487,7 +2485,8 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
 }
 
 enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
-					    const struct drm_display_mode *mode)
+					    const struct drm_display_mode *mode,
+					    bool is_bonded_dsi)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	struct drm_dsc_config *dsc = msm_host->dsc;
@@ -2497,6 +2496,9 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
 	if (!msm_host->dsc)
 		return MODE_OK;
 
+	if (is_bonded_dsi)
+		pic_width = mode->hdisplay / 2;
+
 	if (pic_width % dsc->slice_width) {
 		pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
 		       pic_width, dsc->slice_width);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 896f369fdd53..2ca1a7ca3659 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -455,7 +455,7 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
 			return MODE_ERROR;
 	}
 
-	return msm_dsi_host_check_dsc(host, mode);
+	return msm_dsi_host_check_dsc(host, mode, IS_BONDED_DSI());
 }
 
 static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
-- 
2.26.1

