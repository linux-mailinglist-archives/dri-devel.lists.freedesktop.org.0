Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 233591AC99F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 17:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A3E6E30D;
	Thu, 16 Apr 2020 15:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D836E320
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 15:25:21 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t14so5278733wrw.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 08:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oEh+32nEVm+L3h2nqrkEI2RZhWGyawtUviLim3KeczU=;
 b=khWHx9oTBXuB1jvkx97Q7Ge3/eNg08KayjK9LifGmWHefyOs7Sar790b9XmaDvc0/w
 2/LUWAfRz1Ldbt51o+u5U9gqAT6VWQYogG8wd+u0DfUzRzfWx4l7Sy/eBJ2Qwp7m2hBz
 SY/fHyKGKj/BBPQ7Dpp3bXD9VmvE+hxO6eKTuGr9bt4wmulAK6Hen19GujLVgVOKMEuv
 nzYVdHUTkD2vc6+VGUdlcQGC2sI5IjfZFiMhw2T8kZP4rGB5i9FXFufcXIw9p5Pm0Hd+
 Nx9goUzds5pn7AToyiRxOEyFwPlLVRXSsS2N454QXl/9Kv5XRHGibSR1dXoLe+NcJNc6
 yUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oEh+32nEVm+L3h2nqrkEI2RZhWGyawtUviLim3KeczU=;
 b=QwbfbPgTpEVAPgDds/2zUFLWvpx6S+OrpzQyyVqs+n0LsFTY4p9+lMsNAxqBg+flPM
 v9Hwd0VbMy1jWMnsU643/VggWSCKlCEW7mOnuhVN2iyZQjYygVFxYAfS5yY+9+/o4TM8
 iwl2ndEAwnIuUxMXfpBFDSk0X4RXbOfRUUBtml/2c8Vj4l4XT/kfvjC+CnJ+qLAR3RyK
 bIkVM6MifKzAz3W6lLNFAzDXAHEhkKk/dmyCjtuqaJG5U9dbg+klXZb6bIkvlpthZ571
 tLyVJMwJRFehfsrJEm0jvqkgVmlxsKUPVfA/RJZFdVJc5+Nv+zRu5JiS8y41OEd+shD6
 Mpdg==
X-Gm-Message-State: AGi0PuZH2AmnIS1RCL6T1E8QTPnnv7JeF5hhNf30AvQ5QzEvSNyP2lUS
 bjOvsssV2IeOdA8wPTfaBjDgZA==
X-Google-Smtp-Source: APiQypI7osjvHZzGJMQeIwOy4gibMUTIGvmyObz0ROfmiYS5Bg1uOzdAvHxwUv2g/n16I6yxGVwXHw==
X-Received: by 2002:a5d:5151:: with SMTP id u17mr34134663wrt.240.1587050720509; 
 Thu, 16 Apr 2020 08:25:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 i17sm18019489wru.39.2020.04.16.08.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 08:25:19 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 8/8] drm/meson: overlay: setup overlay for Amlogic FBC
 Scatter Memory layout
Date: Thu, 16 Apr 2020 17:25:00 +0200
Message-Id: <20200416152500.29429-9-narmstrong@baylibre.com>
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
read the FBC header as Scatter Memory layout reference.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_overlay.c | 53 ++++++++++++++++++---------
 1 file changed, 35 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index bbf86e9fc0ca..29b85509dbf8 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -487,6 +487,10 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 					  AFBC_HOLD_LINE_NUM(8) |
 					  AFBC_BURST_LEN(2);
 
+		if ((fb->modifier & DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_MASK) ==
+				DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_SCATTER)
+			priv->viu.vd1_afbc_mode |= AFBC_SCATTER_MODE;
+
 		if (fb->modifier & DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING)
 			priv->viu.vd1_afbc_mode |= AFBC_BLK_MEM_MODE;
 
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
 
-		if (layout != DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC) {
+		if (layout != DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC &&
+		    layout != DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_SCATTER) {
 			DRM_DEBUG_KMS("%llx invalid layout %x\n",
 				      modifier, layout);
 			return false;
@@ -800,8 +814,11 @@ static const uint32_t supported_drm_formats[] = {
 };
 
 static const uint64_t format_modifiers[] = {
+	DRM_FORMAT_MOD_AMLOGIC_FBC(DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_SCATTER |
+				   DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING),
 	DRM_FORMAT_MOD_AMLOGIC_FBC(DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC |
 				   DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING),
+	DRM_FORMAT_MOD_AMLOGIC_FBC(DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_SCATTER),
 	DRM_FORMAT_MOD_AMLOGIC_FBC(DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC),
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID,
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
