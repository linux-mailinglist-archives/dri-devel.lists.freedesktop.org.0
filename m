Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05340192328
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 09:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770086E5C1;
	Wed, 25 Mar 2020 08:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0934E6E5BB
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 08:50:39 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d198so1414642wmd.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 01:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fPJX5pxHatWlhsndvDxqYNXpPbJWSaIQ/yvG8JwAaPQ=;
 b=aYBMrSDLGFsR9VGiA3afn25swSvBzlrBXb5UxObkLtHAfr5/+WOEvT0kDWgdi4FwZQ
 zjXQdJNgPta9PL4WL8iKpMmwrCQUjzd7L5DroRcX2ImHVgy2LegXPtXrazdftqoeVc1x
 2JDqjdl6bhSvwuIox3qPuKmXyKjgduvx0k6LVHhGYu7wNyvXwXb8oxn2Wxep8JR3Hxmh
 RNa4Dxv30pWkhHsYO3464gILGOeas27+J+86DpavRaAJ7e6k8QqAH9FkhtwLZQSBiRJ1
 bFMxqGTXHot17KqkZH0jUGmqpKnDXFuM9gVBRsTp5fT56nLY0EtNYwRzcv0if1ux9Ukw
 OuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fPJX5pxHatWlhsndvDxqYNXpPbJWSaIQ/yvG8JwAaPQ=;
 b=DtQO5spU6z62NRR6OkwNjb1FrbzWJzaNzLsoX0xwxorIfdERPhRiN52O9XqCC5ZKUi
 xYVbbdbrGZuQImCa023y9Sg1Xi1w8jLLMvuqbg98JzebPQYmAnUPaUzfPSYtMGUw53tj
 zlbflzLFCEFk55TtYFqxNvRv0ZxIsECOh/ZPiXwx9bkNe6C4GFAWk8VUkHnSH1TxN/pe
 12rlNm9Dl7AIOck8RMYPddBL9ANad/ZuvAmblzFjJg09VnK8aQ3YA3HYyEMhZ09TLqGy
 +52jmP8LFJN1DDXTUb+riAJIk58YPYe6Hs5Kg+VaSu6jYGcDVrzD+iUZuKs+GvzF/2Z3
 4ZBA==
X-Gm-Message-State: ANhLgQ1MvgSDBaM6XK7Ak2MW72pLYeCCtW27MRRhJAqYVFQQaNG61Y7Z
 QIW8XD47Anqq5zC1n2XguG6l0A==
X-Google-Smtp-Source: ADFU+vuYjdCM+0T2o7saCgezXhu9RnRogVZPN6H0/ZPkKnWZxBuY5GQnR1RGVO/FZ47BMHplkvQV5g==
X-Received: by 2002:a1c:9a43:: with SMTP id c64mr2217618wme.173.1585126237494; 
 Wed, 25 Mar 2020 01:50:37 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id o16sm33892229wrs.44.2020.03.25.01.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 01:50:37 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 6/8] drm/meson: overlay: setup overlay for Amlogic FBC
 Memory Saving mode
Date: Wed, 25 Mar 2020 09:50:23 +0100
Message-Id: <20200325085025.30631-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200325085025.30631-1-narmstrong@baylibre.com>
References: <20200325085025.30631-1-narmstrong@baylibre.com>
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
Cc: mjourdan@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Setup the Amlogic FBC decoder for the VD1 video overlay plane to use
a different superblock size for the Memory Saving mode.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_overlay.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 51fa038ad5d7..8b9d4984b2a7 100644
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
 
@@ -763,6 +771,8 @@ static const uint32_t supported_drm_formats[] = {
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
