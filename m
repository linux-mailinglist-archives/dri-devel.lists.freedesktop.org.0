Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1572089E453
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 22:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27007112F33;
	Tue,  9 Apr 2024 20:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="H12p3nQB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C97112F38
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 20:25:53 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-36a3a5465c6so707025ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 13:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712694352; x=1713299152;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=27ARGpEtofbIIO/y9cIEsTeirpz7mqRhbVlvM4yTom4=;
 b=H12p3nQBUDsDz7sIenJg/Sejs35vAQle/CQ3lSdZYsl2beZL3w+GflVRRRpJgzKpqy
 MNe3Yw3culu4sNdVYbLZnhbVsWaC8JTkvt2CkJw4Fr6adpH4bXBbNeZAC8hWlS0AyhuF
 sChiqJymMICHrlsVNoQ+8zMYfqfsp2RQdpgWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712694352; x=1713299152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=27ARGpEtofbIIO/y9cIEsTeirpz7mqRhbVlvM4yTom4=;
 b=AmZkifK735FwQqRtFfIWlVSWsVEyT9dcfwZj5/NrAe5thAr5ZFmvIMDiCbF1SfP4pn
 yCvTPUg6YE3j7JwRt/FkVuW0hm3GdIYgakbb3SD0ludI+LxKJc+Pfb9XkFs6XE9kFBE1
 3CybZr8z8jZzzeKKWwT+SkB39shM3zreyDbMVGC1pbvw7eTqglUOsiV4mA2z19arcZfU
 SSMcBteNOYymhE41BKsrvLa1XT4BsOTpYL2o3Ne+km2oGyQ0IpNdvBOJP2ZigcogoA4y
 6ge+UtRlajH9vSWkncI+4ZNzk2m9YT/YL/3JQMHipxGUjGJRCwE+yi4q/3P487G8TGy3
 lLUQ==
X-Gm-Message-State: AOJu0YzoU5Q0Pik0fgzYoqwon2RsvLhNRClJrgmuDgvQoJTkF0JdyKNq
 gevZyS64+5aQ5h53NZ59i76AvJAPtEHR+0/6cDmWT4aXAxOWc6Y04ySXW0mT3gqSGRVIozidToO
 M8F/+JSWeIhs1RgM/RgdJmtgQbMp2x3ZqqiTr1pPXYmwryw4tbtN5CXPz+3DyOiy7XH5DpdJnZ5
 XoaBjIMsJb7DloXDZbiHlmHUskj9g617CgQbKq+B+UlbEwNoF4UDO8
X-Google-Smtp-Source: AGHT+IENhonbSNqQACgGMF9rxKwvWSYGOERWYEhrRwsSnE8QQzg53IobzAL4XvnawLmJKCNlTODGeg==
X-Received: by 2002:a05:6e02:1748:b0:36a:1fb5:ef6f with SMTP id
 y8-20020a056e02174800b0036a1fb5ef6fmr1204318ill.13.1712694352282; 
 Tue, 09 Apr 2024 13:25:52 -0700 (PDT)
Received: from localhost ([216.221.31.53]) by smtp.gmail.com with ESMTPSA id
 k11-20020a92c9cb000000b00369ffbc0176sm2754996ilq.73.2024.04.09.13.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 13:25:52 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2 3/4] drm/vmwgfx: Remove STDU logic from generic mode_valid
 function
Date: Sat,  6 Apr 2024 04:11:18 -0500
Message-Id: <20240406091119.26567-4-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240406091119.26567-1-ian.forbes@broadcom.com>
References: <20240401195645.31081-1-ian.forbes@broadcom.com>
 <20240406091119.26567-1-ian.forbes@broadcom.com>
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

