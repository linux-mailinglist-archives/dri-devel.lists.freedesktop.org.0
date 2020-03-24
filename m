Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E67F1912B5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 15:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAD76E4A1;
	Tue, 24 Mar 2020 14:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A001E8981B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 14:20:33 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m3so3681144wmi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bQ1QYtO/tMQBwkAJAywEsN2ZoHeRcm9xw/UIMy3tzWs=;
 b=pwZM4KzjFSd+3f1bt4y1Pqx9BLK42KWI8HI8KK1kJ+uazCIs3hjQ+8ihLR3uLh5/Uy
 KdHKsY8UvqzvVucEp5OicS06lI/9GzhyLPrW1rZE6bDUZQi8KyzZ0UoUqEW5e9dMxEr7
 SUfg2LFhOmL+l5LpQHwZP/kNFAqPg6RjBm8aIOpoyH7Hw1qfNFMRDXRx65KijMlG3Wgw
 AfJTGfc+JZPOgd9l46jkKMRFUxV0x1SuiTnmm2BzVxHZrae946x+inQJ3t0ueVadx0pO
 Hi9IkCLSwoimSXbjLX85mhBp5K48JNkgDTGPSyvq/ZKZinVLrfHyT2lXuhs2b4B9JT7n
 LeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bQ1QYtO/tMQBwkAJAywEsN2ZoHeRcm9xw/UIMy3tzWs=;
 b=YKl77X2wNMDVtSDFxQ3UfX259sIvPNMW3f3utFWXAsQIk3ptgk+w7/EVv3nTl/RqDt
 A9WJMV9uvycbKD4iKhWn7S67d0zoFfOyIjS6NwfcHdYS24wGc1Xs8pNqig9pAm4ksaCi
 eIvtlZe2XGMbZNIoxxygDUGFznIM5P4Ny15f/xKKalZKWUyyqI2RoqHQ7ICY1jEE+9T8
 VY674sZuOpr4AqnkN28KVT7oTnGBpEMHw/evkqtMC+YIbwf4BiCUW4e7Bd+B+dMCz16O
 gVVVYABFw2Q7rodZvHhXr/HpRAt6swbgwSnb0rA+zOcAdvz97O4GJgNftZQcuqSBA/21
 1amg==
X-Gm-Message-State: ANhLgQ3vGnusFkI/nXGCoUhx+8kRGKG4xjsmNH1oWocgBZf5P5NOzlpf
 A9kYU+TQWbumjcB8zOykU2qWzw==
X-Google-Smtp-Source: ADFU+vsi8XChzYWkPwf3P3dxnAAUU/mu0eE/odkEiA+Ehxydey8350TC2MORo/6Hsc0L8/db3kKznA==
X-Received: by 2002:a1c:196:: with SMTP id 144mr6069214wmb.100.1585059631328; 
 Tue, 24 Mar 2020 07:20:31 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id o4sm28688472wrp.84.2020.03.24.07.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 07:20:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/7] drm/meson: overlay: setup overlay for Amlogic FBC
 Memory Saving mode
Date: Tue, 24 Mar 2020 15:20:15 +0100
Message-Id: <20200324142016.31824-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200324142016.31824-1-narmstrong@baylibre.com>
References: <20200324142016.31824-1-narmstrong@baylibre.com>
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
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Setup the Amlogic FBC decoder for the VD1 video overlay plane to use
a different superblock size for the Memory Saving mode.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_overlay.c | 14 ++++++++++++--
 include/uapi/drm/drm_fourcc.h         | 16 +++++++++++++++-
 2 files changed, 27 insertions(+), 3 deletions(-)

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
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 84edc5d69613..b49f1d45e1b4 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -840,6 +840,19 @@ extern "C" {
  */
 #define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC		(1ULL << 0)
 
+/*
+ * Amlogic FBC Scatter Memory layout
+ *
+ * Indicates the header contains IOMMU references to the compressed
+ * frames content to optimize memory access and layout.
+ *
+ * In this mode, only the header memory address is needed, thus the
+ * content memory organization is tied to the current producer
+ * execution and cannot be saved/dumped neither transferrable between
+ * Amlogic SoCs supporting this modifier.
+ */
+#define DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_SCATTER	(2ULL << 0)
+
 /*
  * Amlogic FBC Layout Options
  */
@@ -852,7 +865,8 @@ extern "C" {
  * memory.
  *
  * This mode reduces body layout to 3072 bytes per 64x32 superblock with
- * the basic layout.
+ * the basic layout and 3200 bytes per 64x32 superblock combined with
+ * the scatter layout.
  */
 #define DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING	(1ULL << 8)
 
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
