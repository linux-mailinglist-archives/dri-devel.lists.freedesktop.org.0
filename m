Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 188911912B3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 15:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABAA6E49C;
	Tue, 24 Mar 2020 14:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF6F89CDB
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 14:20:33 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a9so3659207wmj.4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pMoqaL6yn4wVYVlvTr5RoruqY0oplnpZZkK4h3Bk1Vc=;
 b=j1P7KuTVSjxrPEtajniTPWPfAOlurldgsF/xktOKR/xrk7/1/NQs15p+Wh7faGwx5J
 31rujTLqTWRQMqH3/Qe4/2GOhv1LyhS6h3aQmndYeiWEtihu+gMRLJ8Mhsc4Atutwenr
 P5yimGaHugk71bQO+JmtIQ7GkIpIRgbfPi0L04cCM3jPUZ8Yg6RBzuOGm+sOD+wR9+90
 hG1wSKJEIKqlV5EB1NyWZFEzvJXJGDqbt4fg81lUn6ckvIHasxInI05zYHRS0tL/A6kF
 wHF7icX/QfK7X5YWY18rNDRgIKKk1LgiCm6vJjVPQiHDPsc7B2m0Uhv6VF7NQFKGCV42
 hC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pMoqaL6yn4wVYVlvTr5RoruqY0oplnpZZkK4h3Bk1Vc=;
 b=EW1MyHwTNnprpJQUHiddpY9t0RAqigH1OjCe8ccvKQAoR49ucUxf8fT+Rndy72J6ir
 qJZXOFZV1EIKdxVjK8PGZWghR+5VAkcQN/3vcYpLFNTTQrZNjbuDd2nJP6+DzQU9hCr4
 xnBOcK8reyaVHr3w7RLThnICjGgGnVzRnJsVzLBQonSN2gW9NEF8Xv8OBJc9U3UCZHWh
 dIH1YxCQcnzNm2u3BYhdEHYWhV8zJobfEcmMoYe9z94tIA/R9dgJbNVcyfCva/rDZzrZ
 uwQuuIXyjyrP2XrlbuTkudscweWQ1za4WUWCiBOBO5eCTPHl5FWow/8+jJZRVoo5xF0i
 lwcQ==
X-Gm-Message-State: ANhLgQ03yBRM+WFDfGvfRSKUL9nhmM/6WXJhlUHdwTzENn319r721knx
 kRY2m1/DT6HZCAc3U17AF9YHZA==
X-Google-Smtp-Source: ADFU+vtdVs9Y/Tzl2+XQY7ViTUqyXqgfFO/2wOmSWtCEH4wZVZeKpxYXjUZe5vF6CoRkmPuskQbK2Q==
X-Received: by 2002:a1c:6605:: with SMTP id a5mr5962156wmc.32.1585059632470;
 Tue, 24 Mar 2020 07:20:32 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id o4sm28688472wrp.84.2020.03.24.07.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 07:20:32 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 7/7] drm/meson: overlay: setup overlay for Amlogic FBC
 Scatter Memory layout
Date: Tue, 24 Mar 2020 15:20:16 +0100
Message-Id: <20200324142016.31824-8-narmstrong@baylibre.com>
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
read the FBC header as Scatter Memory layout reference.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_overlay.c | 48 +++++++++++++++++----------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 8b9d4984b2a7..af4698ae5281 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -487,6 +487,9 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 					  AFBC_HOLD_LINE_NUM(8) |
 					  AFBC_BURST_LEN(2);
 
+		if (fb->modifier & DRM_FORMAT_MOD_AMLOGIC_FBC_SCATTER)
+			priv->viu.vd1_afbc_mode |= AFBC_SCATTER_MODE;
+
 		if (fb->modifier & DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING)
 			priv->viu.vd1_afbc_mode |= AFBC_BLK_MEM_MODE;
 
@@ -675,23 +678,32 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
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
@@ -771,6 +783,8 @@ static const uint32_t supported_drm_formats[] = {
 };
 
 static const uint64_t format_modifiers[] = {
+	DRM_FORMAT_MOD_AMLOGIC_FBC(DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_SCATTER |
+				   DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING),
 	DRM_FORMAT_MOD_AMLOGIC_FBC(DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC |
 				   DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING),
 	DRM_FORMAT_MOD_AMLOGIC_FBC(DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC),
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
