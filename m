Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7BE211D4D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4C26EA6F;
	Thu,  2 Jul 2020 07:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3966EA7E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 07:48:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f7so23939583wrw.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jul 2020 00:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VYba028CJZ9T7XD/ZTFsh/GrF/6SxW5rmDPslFkKJEg=;
 b=wxi9l2wpvFUBcyiwxwxdzQ0LtAL+CsSh4uPFgKKVj+xONa6JpwGzWXsBL7JS6bgR7f
 RBWALDIWTv2wL07yclrrGux8AyWrdNjLW1+E+Dut4UhcJLVKAwHMXGjxYqypakfPOk9X
 p387wtrvM4enhUh+fLjS/qoMjqMgv/ANkvNJtmWI740Va+AXO0NXp1dg8Qu4QAFpjuxm
 xZy1/vTSQz12flZVHtrHC7WFgGNDPsEcKJlSvKYwW8AH+Ch/TrsL96ba7ISIgNEc3Zqo
 U5D1l9txrCZMMmbhxY/Td22vcGxZ72ay64ztCfClEQCx4mMp2DRZUbX+nsVezLKZuQtw
 cuwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VYba028CJZ9T7XD/ZTFsh/GrF/6SxW5rmDPslFkKJEg=;
 b=Ezj6eK3ZPVilGE61AbbrS7NtEgT+sW24V9pgNTi3ZU6qw+Koj6WB8D7LZuIpa4pdXl
 V0WvPLGdskV/Z5tloiuN4YlBGrYtDSrG328v7UncjAGAzH+CiAwJl9MhF30fFO8FDBhy
 dFHqY4sDRUPNEbOh2pkGNb7X4A1FtxskX1zorC84vJX7zLhKxxOvN326q8KarSrcirnI
 cUhpeskGu4IdyMV/kiG3vwajyOpOO3qfRuCxvYX4x4+V1FPlURfDHc+A3GJdc0sP8LK9
 3ECM0IpsUXmx9GvjVpC8/cGkXO/pIiMtLH9CYG1xWlv5iA8UcFaretgeuS1s9FNgLLIo
 reqg==
X-Gm-Message-State: AOAM532KiFITG3wIzwMrLjZZMjZGZwcG+yi5q4iwknumnHPQHsQ9SQx/
 0NdlGSY/Vx1dvAdFYPET5qes6Q==
X-Google-Smtp-Source: ABdhPJykcmbrJhzMMw+Lgp0fx/cyMjCMpMIHsUhsBEZjIdT5ACEAnqyDrjRgRJrlkhlYikdoMd0n7Q==
X-Received: by 2002:adf:ecc8:: with SMTP id s8mr30718668wro.317.1593676090734; 
 Thu, 02 Jul 2020 00:48:10 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7023:727a:c688:cf9b])
 by smtp.gmail.com with ESMTPSA id z1sm10001882wru.30.2020.07.02.00.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 00:48:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 5/6] drm/meson: overlay: setup overlay for Amlogic FBC
 Scatter Memory layout
Date: Thu,  2 Jul 2020 09:47:58 +0200
Message-Id: <20200702074759.32356-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200702074759.32356-1-narmstrong@baylibre.com>
References: <20200702074759.32356-1-narmstrong@baylibre.com>
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
Cc: jianxin.pan@amlogic.com, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Setup the Amlogic FBC decoder for the VD1 video overlay plane to use
read the FBC header as Scatter Memory layout reference.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_overlay.c | 53 ++++++++++++++++++---------
 1 file changed, 35 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 1566a887d482..1f7b2055e012 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -490,6 +490,10 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 						AMLOGIC_FBC_OPTION_MEM_SAVING))
 			priv->viu.vd1_afbc_mode |= AFBC_BLK_MEM_MODE;
 
+		if ((fb->modifier & __fourcc_mod_amlogic_layout_mask) ==
+				AMLOGIC_FBC_LAYOUT_SCATTER)
+			priv->viu.vd1_afbc_mode |= AFBC_SCATTER_MODE;
+
 		priv->viu.vd1_afbc_en = 0x1600 | AFBC_DEC_ENABLE;
 
 		priv->viu.vd1_afbc_conv_ctrl = AFBC_CONV_LBUF_LEN(256);
@@ -675,23 +679,32 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 	}
 
 	if (priv->viu.vd1_afbc) {
-		/* Default mode is 4k per superblock */
-		unsigned long block_size = 4096;
-		unsigned long body_size;
-
-		/* 8bit mem saving mode is 3072bytes per superblock */
-		if (priv->viu.vd1_afbc_mode & AFBC_BLK_MEM_MODE)
-			block_size = 3072;
-
-		body_size = (ALIGN(priv->viu.vd1_stride0, 64) / 64) *
-			    (ALIGN(priv->viu.vd1_height0, 32) / 32) *
-			    block_size;
-
-		priv->viu.vd1_afbc_body_addr = priv->viu.vd1_addr0 >> 4;
-
-		/* Header is after body content */
-		priv->viu.vd1_afbc_head_addr = (priv->viu.vd1_addr0 +
-						body_size) >> 4;
+		if (priv->viu.vd1_afbc_mode & AFBC_SCATTER_MODE) {
+			/*
+			 * In Scatter mode, the header contains the physical
+			 * body content layout, thus the body content
+			 * size isn't needed.
+			 */
+			priv->viu.vd1_afbc_head_addr = priv->viu.vd1_addr0 >> 4;
+			priv->viu.vd1_afbc_body_addr = 0;
+		} else {
+			/* Default mode is 4k per superblock */
+			unsigned long block_size = 4096;
+			unsigned long body_size;
+
+			/* 8bit mem saving mode is 3072bytes per superblock */
+			if (priv->viu.vd1_afbc_mode & AFBC_BLK_MEM_MODE)
+				block_size = 3072;
+
+			body_size = (ALIGN(priv->viu.vd1_stride0, 64) / 64) *
+				    (ALIGN(priv->viu.vd1_height0, 32) / 32) *
+				    block_size;
+
+			priv->viu.vd1_afbc_body_addr = priv->viu.vd1_addr0 >> 4;
+			/* Header is after body content */
+			priv->viu.vd1_afbc_head_addr = (priv->viu.vd1_addr0 +
+							body_size) >> 4;
+		}
 	}
 
 	priv->viu.vd1_enabled = true;
@@ -754,7 +767,8 @@ static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
 			return false;
 		}
 
-		if (layout != AMLOGIC_FBC_LAYOUT_BASIC) {
+		if (layout != AMLOGIC_FBC_LAYOUT_BASIC &&
+		    layout != AMLOGIC_FBC_LAYOUT_SCATTER) {
 			DRM_DEBUG_KMS("%llx invalid layout %x\n",
 				      modifier, layout);
 			return false;
@@ -800,8 +814,11 @@ static const uint32_t supported_drm_formats[] = {
 };
 
 static const uint64_t format_modifiers[] = {
+	DRM_FORMAT_MOD_AMLOGIC_FBC(AMLOGIC_FBC_LAYOUT_SCATTER,
+				   AMLOGIC_FBC_OPTION_MEM_SAVING),
 	DRM_FORMAT_MOD_AMLOGIC_FBC(AMLOGIC_FBC_LAYOUT_BASIC,
 				   AMLOGIC_FBC_OPTION_MEM_SAVING),
+	DRM_FORMAT_MOD_AMLOGIC_FBC(AMLOGIC_FBC_LAYOUT_SCATTER, 0),
 	DRM_FORMAT_MOD_AMLOGIC_FBC(AMLOGIC_FBC_LAYOUT_BASIC, 0),
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID,
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
