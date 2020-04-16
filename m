Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B97DA1AC9A0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 17:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB7D6E30E;
	Thu, 16 Apr 2020 15:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA406E30D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 15:25:18 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f13so5267241wrm.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 08:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pAAPmG/Jb3adRgVZcI3+WEZjd0CmBHlfGNHq+xKmSJk=;
 b=gb9mZRBkNIdN2fCnMt+El5mgw2WvvGR6aS/C/2wNRDwfSozMtKfOA60GbKoEAcQKqh
 UFBrc3r4cbHmlEcOVWXrrYXuHdY0f1fx0OouQPqCX7h1efZVVSZTEuP+hUsuKSdDZJ53
 C3Qr94o4eDf55MkwbkY1s7dimuMAbqWaORbJU7dtwPzVEaPPMB4RSlWTIp6Fy7gKcdbW
 9j26s6VN79Do1I2hDyLrmomQw4UevEVOHs/cvpMJTx106IwRMAZZkFzmvIv7Oz++m1IQ
 qBdvcByMosAJKufkkMKkWn5QQdEmnzKEEQGR6aEPP5O1q+uHNwKg6Pu/h2Wd/piNNkQP
 EBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pAAPmG/Jb3adRgVZcI3+WEZjd0CmBHlfGNHq+xKmSJk=;
 b=ZWDLPW/2rvq+9+K242oFHYpLnREGIVHmMSQTu7NrP/i0EJuyz7TgheKCUam/CV2D14
 HWkhMxpBaVMLKc//ofje/yGVWMq9gxzfeQK+NKPwhBN+QYM26N6EBbIqcv6hMk+LKVRn
 M1ovywCvnRAYCc4zqJ1emT1hAVc5/9DYiJ8x4D73hACuyHjr2zO2nVlmMs9B3k0frbvD
 fRAu+wmZ7K2btw8fb7BTYTfPZ4gO0ffKMOUAXeJh9TUegDQma+gI3MRlhPwfMnyyoxng
 EMzBHwJjAlg9KuzYwgCSL5KJ5uPMdBz7rdqYLDF96P9zVbu2zCzsyPhECLKNIyOiNvHo
 mNsw==
X-Gm-Message-State: AGi0Pua9v+UdvKhb54SBG7/JqT4vtezP8u/Hxll/P3S/JIzuSWlj6e31
 Qqudf/CL0F9a4ovPpa1bszrgxw==
X-Google-Smtp-Source: APiQypIYCGk/APKOgaU92vz2hRnB71h6Oa4IfHbO/xSY2Vhgx/msOHurLSBkaZDwyaPEWqpzBH8x2Q==
X-Received: by 2002:adf:c442:: with SMTP id a2mr33790736wrg.110.1587050716672; 
 Thu, 16 Apr 2020 08:25:16 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 i17sm18019489wru.39.2020.04.16.08.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 08:25:15 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 6/8] drm/meson: overlay: setup overlay for Amlogic FBC
 Memory Saving mode
Date: Thu, 16 Apr 2020 17:24:58 +0200
Message-Id: <20200416152500.29429-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200416152500.29429-1-narmstrong@baylibre.com>
References: <20200416152500.29429-1-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Setup the Amlogic FBC decoder for the VD1 video overlay plane to use
a different superblock size for the Memory Saving mode.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_overlay.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 3127bd1a5d70..bbf86e9fc0ca 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -487,6 +487,9 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 					  AFBC_HOLD_LINE_NUM(8) |
 					  AFBC_BURST_LEN(2);
 
+		if (fb->modifier & DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING)
+			priv->viu.vd1_afbc_mode |= AFBC_BLK_MEM_MODE;
+
 		priv->viu.vd1_afbc_en = 0x1600 | AFBC_DEC_ENABLE;
 
 		priv->viu.vd1_afbc_conv_ctrl = AFBC_CONV_LBUF_LEN(256);
@@ -672,12 +675,17 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 	}
 
 	if (priv->viu.vd1_afbc) {
+		/* Default mode is 4k per superblock */
+		unsigned long block_size = 4096;
 		unsigned long body_size;
 
-		/* Default mode is 4k per superblock */
+		/* 8bit mem saving mode is 3072bytes per superblock */
+		if (priv->viu.vd1_afbc_mode & AFBC_BLK_MEM_MODE)
+			block_size = 3072;
+
 		body_size = (ALIGN(priv->viu.vd1_stride0, 64) / 64) *
 			    (ALIGN(priv->viu.vd1_height0, 32) / 32) *
-			    4096;
+			    block_size;
 
 		priv->viu.vd1_afbc_body_addr = priv->viu.vd1_addr0 >> 4;
 
@@ -735,6 +743,9 @@ static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
 		unsigned int layout = modifier &
 			DRM_FORMAT_MOD_AMLOGIC_FBC(
 				DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_MASK);
+		unsigned int options = modifier &
+			DRM_FORMAT_MOD_AMLOGIC_FBC(
+				DRM_FORMAT_MOD_AMLOGIC_FBC_OPTIONS_MASK);
 
 		if (format != DRM_FORMAT_YUV420_8BIT &&
 		    format != DRM_FORMAT_YUV420_10BIT) {
@@ -749,6 +760,13 @@ static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
 			return false;
 		}
 
+		if (options &&
+		    options != DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING) {
+			DRM_DEBUG_KMS("%llx invalid layout %x\n",
+				      modifier, layout);
+			return false;
+		}
+
 		return true;
 	}
 
@@ -782,6 +800,8 @@ static const uint32_t supported_drm_formats[] = {
 };
 
 static const uint64_t format_modifiers[] = {
+	DRM_FORMAT_MOD_AMLOGIC_FBC(DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC |
+				   DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING),
 	DRM_FORMAT_MOD_AMLOGIC_FBC(DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC),
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID,
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
