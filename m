Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B48124C0C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 16:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691326E7E5;
	Wed, 18 Dec 2019 15:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F346E7D7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 15:46:50 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id b19so2333450wmj.4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 07:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BH6e3bahFkWBTjXwfWXdljOGokLAIKV+wnWDzABNP74=;
 b=omVWiHXLRaPV/ydWfQBU04NH95kIXEj2dP02jegjAK8kLmWE1KU9Sv2MygDYSmBgkL
 1ySn1Eg/LgD5mL9l+KRkxDFRz2gv953PmMSDRsrQBAo/F7O/W5q6KD0uoxxGGcDekonL
 DGuBsISgSk8tB2EIOvreCPHyC7I7P2x8fa387bjQ/3VKRFNOZAiMEsS/C6eYzEuAumNh
 veZmmKEcVuNhypTLKgeCF2HQS6he78ot8MfdB+D2QeKM2llpVOKFk4zo9P48fsL2C0QH
 4vv1KTfy0eq2bDMXcB9bWw0GHBf1bGZAh4xXpKb/nNhlCAHnJg0GhFwhYEFD3oNbHwA1
 Ul1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BH6e3bahFkWBTjXwfWXdljOGokLAIKV+wnWDzABNP74=;
 b=GGf91wesxFjbM07VBdL9jm9xOFNFz00CEDdkjGr2xeaaLCei3mx6wA/1kXFpO5MRsY
 k1DLQM3vtOav/tp8sLK80MZB5Barw3H0hRUYKJ6XEbxvZKPCzwxG58NYqUEeGDI47pxc
 5E9dv+dn1UPwWKPBhZ7TYHYZadukqPX8MdNEBnOPrYTieHzPKQUl7NGNzmawzxI931gQ
 JOXynx1mcjMplEQlhRbRdkmntsQScroEmSt5RK2Psr8i9MZaeHrv9wzLwOU8T1rJ2YHr
 ol0+mt7+x2adDRtUQUt5IQYrx4I7bxmPsw4dHK/fb1ywY89sIcODxfaVuyK9VM8Kqh/T
 aBOA==
X-Gm-Message-State: APjAAAX5RT//zsRuRG+63tdI5/ATA2CJQ85GeAPSUaQKEDs0oW7C8/iQ
 rkNIppxhu6Cn8INAY4p5mLhA/A==
X-Google-Smtp-Source: APXvYqwiMmPBuwhf+2rWRor3F5AMIaAs7w/h+pInq8Kwk/3+4ZeaOmiz1xHepKTgUKges0nOG5L2Hw==
X-Received: by 2002:a7b:c318:: with SMTP id k24mr4206960wmj.54.1576684008490; 
 Wed, 18 Dec 2019 07:46:48 -0800 (PST)
Received: from bender.baylibre.local
 (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id x1sm2891492wru.50.2019.12.18.07.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 07:46:47 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v3 08/10] drm/meson: venc: add support for YUV420 setup
Date: Wed, 18 Dec 2019 16:46:35 +0100
Message-Id: <20191218154637.17509-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191218154637.17509-1-narmstrong@baylibre.com>
References: <20191218154637.17509-1-narmstrong@baylibre.com>
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
index 69926d5d8756..75c133a048d3 100644
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
