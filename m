Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9ED154BE0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 20:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69A96FB29;
	Thu,  6 Feb 2020 19:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C466FB28
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 19:18:51 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t23so1228737wmi.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 11:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fthTlSvdqndaDon1km3RUC8MaAbjzEmDQ4T+qx7kFIg=;
 b=tLRb2ev7H3keiN0RtJlGvE0tnAN6Lp0TIP6ZilsTp6GnzlFiPUDJeg+GERg0Z3V/+S
 nH7l+EzoTX7RphmWgUdXloilUCNO7I21UbRnrf150VhhttkCXCZi2+zZ41TWWGKhu+S1
 NToFdQtwoZh+53Xq5u3o4U93i9Rrl1i7Xt3PUJwPz5N87x6LBXxTqg8a/dMq0UYmtjiC
 oSCL1qoIrxk5VMC+8kjkQYRHlKCDu8iHUCbTYPXYxu5bC/0pg3Wxxi8mtbDNUM5FBret
 rx4NqAz1K3STqXJb3E8584rHGl+wYFMgdQ53v2g3ua+1o2iGrwiuM99y2F92rFFkL5po
 RGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fthTlSvdqndaDon1km3RUC8MaAbjzEmDQ4T+qx7kFIg=;
 b=ptZWGVG5wLLQ365cog2DxQhWeqeWcSbMSpWrIJXWXOR03mrAfFq5JdydoiShtYv/3U
 9D1TU0NAN+LUvkdN8kTgEpj46Y+oCzoMlQkK0zq1rHOkdW8cgAwXWw0VgUhOraWaHeZq
 a0mP2YtwAq0p9X2r2pjeMH5yLOP5+2HbtJXMQDcJGqrZ4UTtkCkyQaRRfShSfiI5S5Ic
 PkXiVzV1IFeLgo4ZuaQ2+t93uOlJt4v8vDtdHXo3V76ARWB9xFZ2mljpgC52P8sL8aUK
 vEJ0on3OMnSIJm7aj0tPv+XxfxrtlgqacNN7Qe1VIO+XA9l5dvpzzfHsj6RPfpSCGEY4
 GZZQ==
X-Gm-Message-State: APjAAAU0BzU/D8gWJofMWz59/qjhJ1obACTQeEzeMDOjn5lhJjL+PfOG
 MVKOmVCDrnyiID1HE8HH5af8ew==
X-Google-Smtp-Source: APXvYqwlQi9eASN0rOmDcfSxEfYRW3a2yYVPMtn73nQR0JHbukVgLpa0edWoF2Pu+QOpxSmJNLlT9w==
X-Received: by 2002:a7b:cc6a:: with SMTP id n10mr6240559wmj.170.1581016729357; 
 Thu, 06 Feb 2020 11:18:49 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
 by smtp.gmail.com with ESMTPSA id m3sm272662wrs.53.2020.02.06.11.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 11:18:48 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v4 09/11] drm/meson: venc: add support for YUV420 setup
Date: Thu,  6 Feb 2020 20:18:32 +0100
Message-Id: <20200206191834.6125-10-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200206191834.6125-1-narmstrong@baylibre.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds encoding support for the YUV420 output from the
Amlogic Meson SoCs Video Processing Unit to the HDMI Controller.

The YUV420 is obtained by generating a YUV444 pixel stream like
the classic HDMI display modes, but then the Video Encoder output
can be configured to down-sample the YUV444 pixel stream to a YUV420
stream.

In addition if pixel stream down-sampling, the Y Cb Cr components must
also be mapped differently to align with the HDMI2.0 specifications.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 3 ++-
 drivers/gpu/drm/meson/meson_venc.c    | 8 +++++---
 drivers/gpu/drm/meson/meson_venc.h    | 2 ++
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 686c47106a18..f5d46d082534 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -772,7 +772,8 @@ static void meson_venc_hdmi_encoder_mode_set(struct drm_bridge *bridge,
 	DRM_DEBUG_DRIVER("\"%s\" vic %d\n", mode->name, vic);
 
 	/* VENC + VENC-DVI Mode setup */
-	meson_venc_hdmi_mode_set(priv, vic, mode);
+	meson_venc_hdmi_mode_set(priv, vic, ycrcb_map, false,
+				 VPU_HDMI_OUTPUT_CBYCR);
 
 	/* VCLK Set clock */
 	dw_hdmi_set_vclk(dw_hdmi, mode);
diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index a9ab78970bfe..f93c725b6f02 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -946,6 +946,8 @@ bool meson_venc_hdmi_venc_repeat(int vic)
 EXPORT_SYMBOL_GPL(meson_venc_hdmi_venc_repeat);
 
 void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
+			      unsigned int ycrcb_map,
+			      bool yuv420_mode,
 			      const struct drm_display_mode *mode)
 {
 	union meson_hdmi_venc_mode *vmode = NULL;
@@ -1528,14 +1530,14 @@ void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
 	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
 		reg |= VPU_HDMI_INV_VSYNC;
 
-	/* Output data format: CbYCr */
-	reg |= VPU_HDMI_OUTPUT_CBYCR;
+	/* Output data format */
+	reg |= ycrcb_map;
 
 	/*
 	 * Write rate to the async FIFO between VENC and HDMI.
 	 * One write every 2 wr_clk.
 	 */
-	if (venc_repeat)
+	if (venc_repeat || yuv420_mode)
 		reg |= VPU_HDMI_WR_RATE(2);
 
 	/*
diff --git a/drivers/gpu/drm/meson/meson_venc.h b/drivers/gpu/drm/meson/meson_venc.h
index 1abdcbdf51c0..9138255ffc9e 100644
--- a/drivers/gpu/drm/meson/meson_venc.h
+++ b/drivers/gpu/drm/meson/meson_venc.h
@@ -60,6 +60,8 @@ extern struct meson_cvbs_enci_mode meson_cvbs_enci_ntsc;
 void meson_venci_cvbs_mode_set(struct meson_drm *priv,
 			       struct meson_cvbs_enci_mode *mode);
 void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
+			      unsigned int ycrcb_map,
+			      bool yuv420_mode,
 			      const struct drm_display_mode *mode);
 unsigned int meson_venci_get_field(struct meson_drm *priv);
 
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
