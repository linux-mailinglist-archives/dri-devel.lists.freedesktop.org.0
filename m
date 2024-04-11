Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E56618A20DF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 23:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1F710F20E;
	Thu, 11 Apr 2024 21:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="A8fYzmLx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48D310F178
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 21:27:13 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-69b236a942dso12029176d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 14:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712870832; x=1713475632;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=27ARGpEtofbIIO/y9cIEsTeirpz7mqRhbVlvM4yTom4=;
 b=A8fYzmLxRgr6vcBmXok7h4UPt/Uac+7wvwVFb4Xtp8Y1G2BOm4bGVK48OXOJ6/ly3O
 QfEby9Cc1fWY5tCufUT7Y4HV7VzozpYYV6Q1G1UI5yJVWcD2Zs3wSwYpNu2tDqPWsJ5V
 yHcwYQJ4fm3syDzvSoRpeEjqJrjK/mjf5eDRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712870832; x=1713475632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=27ARGpEtofbIIO/y9cIEsTeirpz7mqRhbVlvM4yTom4=;
 b=UMWYHYIDHl8XUbvxciZaKvy4+7GFWGwUFLvGAnwscU2VNYr2rYKCLC0sg+qZii2XqT
 N3wiACUDgsXLchL3Zi0ILim17ZIHUby1Nq4R+2SUFBAjmpQmWrIIdIvzCytTbd+g5emH
 tseIUb7+2QJLr5ERE7Sv/fdy0cVl8DcIRACK0h1xIUvya8FX8pojgWTqtt/YCxrwD1c/
 8jAGunj4MrEJRDUc5BxhNNPIa1IMopnjjjm5tOrTcQlhL4sAqblW0mwqugK+ZlSiDv+k
 rOrI1DAe8M2QGFpjUateTflIosE5MyI7p1l1B/t40ZnjGygNHxDNEpefKsixd8I2B37D
 zTEQ==
X-Gm-Message-State: AOJu0YxW/yMphRpmJfRUV+Y2yZ42qMzns+pcOjjEPEVjTztqPaSae8RD
 QDjW44/rVB4bbiKUnCAyrpve9KnwKA4Av+gd5Xziowv+OzNEQE9U6VlAiaHZ9U1FfEbZZrM8bOF
 EBEj7m4ORLyR43lKp668SP+uBYDhBTOV0r2kblcF+IXoX209rzw35598PREByWvE6k6s7mQNBRN
 ZJQNhzCwDpCTXVVkUnRun7mYcrnsdLbt4r531W+y0ePuXQw7+ocp00
X-Google-Smtp-Source: AGHT+IHNZlEN02pIh6Xyrq5C4cKFmL1rUB4Z7bGE0Oow9uf6oOmcI3JzmSXlpw/xb4GZmWex3DKyaQ==
X-Received: by 2002:a0c:e84a:0:b0:699:393a:c366 with SMTP id
 l10-20020a0ce84a000000b00699393ac366mr1627503qvo.28.1712870832211; 
 Thu, 11 Apr 2024 14:27:12 -0700 (PDT)
Received: from localhost ([216.221.31.53]) by smtp.gmail.com with ESMTPSA id
 m4-20020ad45044000000b0069b525192e2sm670340qvq.45.2024.04.11.14.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 14:27:12 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH 3/4] drm/vmwgfx: Remove STDU logic from generic mode_valid
 function
Date: Thu, 11 Apr 2024 16:26:50 -0500
Message-Id: <20240411212651.540-4-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411212651.540-1-ian.forbes@broadcom.com>
References: <20240411212651.540-1-ian.forbes@broadcom.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

STDU has its own mode_valid function now so this logic can be removed from
the generic version.

Fixes: 935f795045a6 ("drm/vmwgfx: Refactor drm connector probing for display modes")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  3 ---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 26 +++++++++-----------------
 2 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 4ecaea0026fc..a1ce41e1c468 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1043,9 +1043,6 @@ void vmw_kms_cursor_snoop(struct vmw_surface *srf,
 int vmw_kms_write_svga(struct vmw_private *vmw_priv,
 		       unsigned width, unsigned height, unsigned pitch,
 		       unsigned bpp, unsigned depth);
-bool vmw_kms_validate_mode_vram(struct vmw_private *dev_priv,
-				uint32_t pitch,
-				uint32_t height);
 int vmw_kms_present(struct vmw_private *dev_priv,
 		    struct drm_file *file_priv,
 		    struct vmw_framebuffer *vfb,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 13b2820cae51..9532258a0848 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -2171,13 +2171,12 @@ int vmw_kms_write_svga(struct vmw_private *vmw_priv,
 	return 0;
 }
 
+static
 bool vmw_kms_validate_mode_vram(struct vmw_private *dev_priv,
-				uint32_t pitch,
-				uint32_t height)
+				u64 pitch,
+				u64 height)
 {
-	return ((u64) pitch * (u64) height) < (u64)
-		((dev_priv->active_display_unit == vmw_du_screen_target) ?
-		 dev_priv->max_primary_mem : dev_priv->vram_size);
+	return (pitch * height) < (u64)dev_priv->vram_size;
 }
 
 /**
@@ -2873,25 +2872,18 @@ int vmw_du_helper_plane_update(struct vmw_du_update_plane *update)
 enum drm_mode_status vmw_connector_mode_valid(struct drm_connector *connector,
 					      struct drm_display_mode *mode)
 {
+	enum drm_mode_status ret;
 	struct drm_device *dev = connector->dev;
 	struct vmw_private *dev_priv = vmw_priv(dev);
-	u32 max_width = dev_priv->texture_max_width;
-	u32 max_height = dev_priv->texture_max_height;
 	u32 assumed_cpp = 4;
 
 	if (dev_priv->assume_16bpp)
 		assumed_cpp = 2;
 
-	if (dev_priv->active_display_unit == vmw_du_screen_target) {
-		max_width  = min(dev_priv->stdu_max_width,  max_width);
-		max_height = min(dev_priv->stdu_max_height, max_height);
-	}
-
-	if (max_width < mode->hdisplay)
-		return MODE_BAD_HVALUE;
-
-	if (max_height < mode->vdisplay)
-		return MODE_BAD_VVALUE;
+	ret = drm_mode_validate_size(mode, dev_priv->texture_max_width,
+				     dev_priv->texture_max_height);
+	if (ret != MODE_OK)
+		return ret;
 
 	if (!vmw_kms_validate_mode_vram(dev_priv,
 					mode->hdisplay * assumed_cpp,
-- 
2.34.1

