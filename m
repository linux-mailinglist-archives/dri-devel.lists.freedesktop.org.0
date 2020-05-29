Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DCB1E818B
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 17:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0ED6E935;
	Fri, 29 May 2020 15:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA35F6E936
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 15:19:51 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id r9so3766007wmh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 08:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2W/tk3xtyOOYW8CHtOYgazclqfCaFCGaEqtWfgUm9eE=;
 b=pEqG5L5GWWSwNPpPU9DM02ap3Zr2QmJjPVWHkferukyZLyvxACGqoVFwYOgQwB2G5S
 ttMlimnv6urPWI82mVmCulLFHsRBhZsg+1cF4vwbtoyiphcqTaU5EaG8ah+Bw9xMV8NI
 9i6ak139bVdmpQSFMqQuxKaj5Iy2cB+4dtnZmyFj1nFg9hu7mrt0CcB/6Zg5k20s9UsK
 MxPfJU9zY9BRa5rKuqp/z2qYIoE1AM9qB1aUCsjClipjFEyUZJ0tNgmYToyB+eY+Gfdp
 3FK7ZiLnbVU0g0PyFmT0tcjD97T2GImoPNMe3K2bHU+znEHKBQhc5fTdZCJ6hFhTbMjl
 2v2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2W/tk3xtyOOYW8CHtOYgazclqfCaFCGaEqtWfgUm9eE=;
 b=RHPZVkvjbmJVYRqGVsjwZCYfE9XNqu5i6OlAanXr9oIhPw1RV5qxOeVlrpDS+8a+mC
 +JJIAj2WU8dSNa5vkNmchGPY3/pCfP4Dh8M3fO4PgZ+BByHxbexbn/2CD/KdQq8vxl6N
 t5llPI2pgsL3ldd2o/ihgARPFncl8dvP9RLLFg0y3soxvbDmCc4eqqjtdQGiZcKXL7ao
 glZPeb8TQH1dtqUntugAHmwvm5N4sI4I6mawdWc2WgQzCjYT5wS1P2eh/QqHcrE2G8RY
 ipfRq7Bs4pBaab2M/swhaQQuKVBsRw4k9RcqNtkZm5FDcnRVadSntsr5p7cKUbBJL0K2
 iB8Q==
X-Gm-Message-State: AOAM533ZkDHzmoIfDJ9hUgth+FDkXW7HLvv6UjVKAw4csVxulwRwH51M
 IWL42Gyk14KFBoOH7sSjTpzybd59rzYDfw==
X-Google-Smtp-Source: ABdhPJxgdPXo7ecKSgHx2RWpGVgE0uFXTqOD/vOeodmVPVNl9pS6GXox41J79wfvY5tURiBuFX9XUA==
X-Received: by 2002:a1c:1d94:: with SMTP id d142mr9128523wmd.42.1590765590342; 
 Fri, 29 May 2020 08:19:50 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b])
 by smtp.gmail.com with ESMTPSA id x66sm9220421wmb.40.2020.05.29.08.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 08:19:49 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 5/6] drm/meson: overlay: setup overlay for Amlogic FBC
 Scatter Memory layout
Date: Fri, 29 May 2020 17:19:34 +0200
Message-Id: <20200529151935.13418-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200529151935.13418-1-narmstrong@baylibre.com>
References: <20200529151935.13418-1-narmstrong@baylibre.com>
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
index b5c502876428..6aef28767fc1 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -491,6 +491,10 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 						AMLOGIC_FBC_OPTION_MEM_SAVING))
 			priv->viu.vd1_afbc_mode |= AFBC_BLK_MEM_MODE;
 
+		if ((fb->modifier & __fourcc_mod_amlogic_layout_mask) ==
+				AMLOGIC_FBC_LAYOUT_SCATTER)
+			priv->viu.vd1_afbc_mode |= AFBC_SCATTER_MODE;
+
 		priv->viu.vd1_afbc_en = 0x1600 | AFBC_DEC_ENABLE;
 
 		priv->viu.vd1_afbc_conv_ctrl = AFBC_CONV_LBUF_LEN(256);
@@ -676,23 +680,32 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
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
@@ -755,7 +768,8 @@ static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
 			return false;
 		}
 
-		if (layout != AMLOGIC_FBC_LAYOUT_BASIC) {
+		if (layout != AMLOGIC_FBC_LAYOUT_BASIC &&
+		    layout != AMLOGIC_FBC_LAYOUT_SCATTER) {
 			DRM_DEBUG_KMS("%llx invalid layout %x\n",
 				      modifier, layout);
 			return false;
@@ -801,8 +815,11 @@ static const uint32_t supported_drm_formats[] = {
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
