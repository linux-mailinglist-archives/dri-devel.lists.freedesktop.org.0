Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E569A8C8C57
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 20:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139B910EF58;
	Fri, 17 May 2024 18:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="ENKhWZbf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC8310EF58
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 18:48:51 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-3c99257e0cbso332376b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 11:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1715971730; x=1716576530;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NwLTSzkJVjfr3yIEgVUxQAA5OYE2rQN+MHnV5J9QSpc=;
 b=ENKhWZbfyvY+25qL0EQ/0PdEFLlU3QzoN7H2zCy5EvG7PphNTCdKxXsOkkB05MA/dT
 E+K0gMPKfhLhcZnVJ4/Ot5T5mYU5LpXtr6j/41kCdE60s+gpCaOq9gR8EeoCkWqZXqyV
 uD+Gbz5w9+KtH1O3+TiWMbSr/an3Ely8TVV4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715971730; x=1716576530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NwLTSzkJVjfr3yIEgVUxQAA5OYE2rQN+MHnV5J9QSpc=;
 b=UEf1wMwmfWgt/azdZ9u/Y9ccfm8baYdmCmrzLtgv2M1PxzQvPo2mAJarAOT9KWOeDS
 ji6Hf6EBYDVktTW0KdRdUoNiL8573oY3K/sfstimGhLOq8AwTDHiGlVzJSOdQPaie97W
 SZ2oZonGCBkCAtT7l25+/UXNWP4KGlWk5MuPAH0FHvR4mjQGvWMcx/pSv8JVZuMkrm5D
 GWVoyqvZQU0nJoFXAL5JF+p9q2FrKnnlQRi7ShVdd2nyDn+6TMN27nj/u9+qsR8e42yq
 AKR+IpbK8vCl9AFbefxDs9cOUbnFUCqjoHjJ4nhw0shj3gDltfrNXUMIdRLFG5eo4v9l
 QEpg==
X-Gm-Message-State: AOJu0YyyP92pmufxslomTL+WBQMEDGUrje+V73yKDXaCi4rs/qqcpIcr
 VM8WBqcMgfXzovBr2SWYVpvU/HN6po4+lhqJaBwqXJVPDqpGtSdVjiPzzQbQs4u742/gJLJPKSe
 mOhQaXMduAYOrGVZkTHHR1gom4xvo2P8kcKJorPCLwBbVDHcUkaSt3qGTKjoFYd+MBEBKAUjIEo
 38wIcB+WOMOEck4dErZeGQVjYHuo0VI6mqjyOExMBQzdX2FyGc/Q==
X-Google-Smtp-Source: AGHT+IEZg2+O3xTU3bgiSKRo5ReeZlsvz9ihcKmn6CWDhekeT7oUSXJ7InsqDoGQ5gB1RovbFnF/dg==
X-Received: by 2002:a05:6808:1803:b0:3c3:d47b:e4cf with SMTP id
 5614622812f47-3c9970bd1c0mr27607475b6e.39.1715971729953; 
 Fri, 17 May 2024 11:48:49 -0700 (PDT)
Received: from localhost ([192.19.144.250]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf2fc57asm926571085a.81.2024.05.17.11.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 11:48:49 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2 3/4] drm/vmwgfx: Remove STDU logic from generic mode_valid
 function
Date: Fri, 17 May 2024 13:48:10 -0500
Message-Id: <20240517184811.25807-4-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240517184811.25807-1-ian.forbes@broadcom.com>
References: <20240517184811.25807-1-ian.forbes@broadcom.com>
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

