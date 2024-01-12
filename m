Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB49082C695
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 22:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6C010E13F;
	Fri, 12 Jan 2024 21:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F2310E0E7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 21:20:22 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-28be8ebcdc1so4936375a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 13:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1705094421; x=1705699221;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GAIZ3sX3So8SPvanmlPNWrR/xdGl9tAK7ZQjhyH2jro=;
 b=KDGq7qmS7bM3iI5CBO4YeCIPXfCzOwFpU6D1d6tIOCb8i1uiSaxgpEQiE1syH4JxWO
 bPXbqg6cRME81Lkz+1kA6IZf2Spp/gCbS7Jj+JqbL2oMsNrdBRDoOEFNpnSXjJaWKMql
 M8/vGTxpFbsRwYCDiKyDiILFiZQItWlbgzFOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705094421; x=1705699221;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GAIZ3sX3So8SPvanmlPNWrR/xdGl9tAK7ZQjhyH2jro=;
 b=NvOyJOjP1iiUSX7RkJzSvxK/P7rvpFcjL5XcpVZSIqQDitOT3Kr46PIYJY2k+ZnNxW
 wKNRqtUlKTB/Udx04u1T0dFVR8mh4cu6sIuiLkGFikMaRzK9bvHxOp1R9uGPLonXiYWT
 LeKBGezqcd+rVhJjs/mouFcji37peNFozN0EG4IEUAn64R602xjhE0BLPe+pXRR/tqc6
 ac0rVJXH/g8N2o2jm4sL59trWeRwXU8dQAyiMpCiIIB1nWhlHll4eFZLlfNkBYCAvR4u
 zSpKCt11I4RNdz7YdHwLtgMQbcRO97T/rsQJt2UzK5OYVUjOWXKjt9H/sSLpmkfrsPx7
 Neiw==
X-Gm-Message-State: AOJu0YwXqTrCrWvrlULn4Q9GNfwj8+RfpCfLmBGGQ+SsF40//FfLx4N6
 cvevYB15vH27YHIhILnAS/PTIDszRw1V6lNgkyCRTGP8FIppcYSzcRWjfM6XCYRnUzESbqbzI8s
 ECD6L6UJZYWFAxzX1azC4oWLPA1YC2WgUauQCv9vMp4skbt3ZW4YGiQ5aceL55FWNMnYbq5XaOG
 +TV/ys3oMHMmmnrbotlUArR6k=
X-Google-Smtp-Source: AGHT+IE6gl0odGRdqjhQEhLuSWwYbLV4txjWvIeaqFx3NRy6+zGvee7KccDXtQ55kxSEGomJR4/1/A==
X-Received: by 2002:a17:90a:af83:b0:28d:4c09:39af with SMTP id
 w3-20020a17090aaf8300b0028d4c0939afmr1733486pjq.70.1705094421313; 
 Fri, 12 Jan 2024 13:20:21 -0800 (PST)
Received: from localhost ([173.205.42.30]) by smtp.gmail.com with ESMTPSA id
 r4-20020a1709028bc400b001d4e04b6411sm3601178plo.69.2024.01.12.13.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 13:20:21 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: Filter modes which exceed 3/4 of graphics memory.
Date: Fri, 12 Jan 2024 14:38:03 -0600
Message-Id: <20240112203803.6421-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Ian Forbes <ian.forbes@broadcom.com>, maaz.mombasawala@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, martin.krastev@broadcom.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SVGA requires surfaces to fit within graphics memory (max_mob_pages) which
means that modes with a final buffer size that would exceed graphics memory
must be pruned otherwise creation will fail.

Additionally, device commands which use multiple graphics resources must
have all their resources fit within graphics memory for the duration of the
command. Thus we need a small carve out of 1/4 of graphics memory to ensure
commands likes surface copies to the primary framebuffer for cursor
composition or damage clips can fit within graphics memory.

This fixes an issue where VMs with low graphics memory (< 64MiB) configured
with high resolution mode boot to a black screen because surface creation
fails.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 28ff30e32fab..39d6d17fc488 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -2854,12 +2854,12 @@ enum drm_mode_status vmw_connector_mode_valid(struct drm_connector *connector,
 	struct vmw_private *dev_priv = vmw_priv(dev);
 	u32 max_width = dev_priv->texture_max_width;
 	u32 max_height = dev_priv->texture_max_height;
-	u32 assumed_cpp = 4;
+	u32 assumed_cpp = dev_priv->assume_16bpp ? 2 : 4;
+	u32 pitch = mode->hdisplay * assumed_cpp;
+	u64 total = mode->vdisplay * pitch;
+	bool using_stdu = dev_priv->active_display_unit == vmw_du_screen_target;
 
-	if (dev_priv->assume_16bpp)
-		assumed_cpp = 2;
-
-	if (dev_priv->active_display_unit == vmw_du_screen_target) {
+	if (using_stdu) {
 		max_width  = min(dev_priv->stdu_max_width,  max_width);
 		max_height = min(dev_priv->stdu_max_height, max_height);
 	}
@@ -2870,9 +2870,13 @@ enum drm_mode_status vmw_connector_mode_valid(struct drm_connector *connector,
 	if (max_height < mode->vdisplay)
 		return MODE_BAD_VVALUE;
 
-	if (!vmw_kms_validate_mode_vram(dev_priv,
-			mode->hdisplay * assumed_cpp,
-			mode->vdisplay))
+	if (using_stdu &&
+		(total > (dev_priv->max_mob_pages * PAGE_SIZE * 3 / 4) ||
+		total > dev_priv->max_mob_size)) {
+		return MODE_MEM;
+	}
+
+	if (!vmw_kms_validate_mode_vram(dev_priv, pitch, mode->vdisplay))
 		return MODE_MEM;
 
 	return MODE_OK;
-- 
2.34.1

