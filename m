Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B54FD89461D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 22:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B6D10F4F7;
	Mon,  1 Apr 2024 20:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="BhGQjmKL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C165610F508
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 20:35:39 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-7cc5fdb0148so190147039f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Apr 2024 13:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712003739; x=1712608539;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M3IJzLFRvG6o4l+nhtTL6WJJV/ZNPsBvwMCnk0EU60Y=;
 b=BhGQjmKLSSfWlUUCkox2lu0y7u27O6YneM4vz1a0sC5MkTj3SG0qNps/cQOGBA45MJ
 WDjnd5TpKIMKUw9CZ+MuEJY1tEASO2xKwG3b/Ydl7stPgExB67MVFgX3znO+4dwh6i4+
 VqucH+5swlxt3D/JQkPLV5XIwdYq8japx8454=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712003739; x=1712608539;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M3IJzLFRvG6o4l+nhtTL6WJJV/ZNPsBvwMCnk0EU60Y=;
 b=fvByviZIE8wCRvpg7aHPF1Ov7+IeMVRMpgSVgJ/DJVABh2j9S1AZaIGwB9hE2AWhm0
 4z2iL+YPhUHUihlHNPnv0XnakGH6AXRAEsXDFC7JEzAqAuxT89VtSBUDjnL/1JFIl+t1
 U/KQbTMUOR0h0KLCVnxq6WywQWwXxwwntXYIr3uotFCOGw6KjqmRXWyWioyCECQSIHxL
 Jr1OT0c/0W3dwaoSseXz39aSTQyWued3QwjM28wFV2Uf8Lhcp38rkBETxMkmUuP5DxWC
 sEfeCoXcCRmDzgVRDrRao3f/jMZBkcvIQs/aPu1+GN6D7rzJaoTFsM4beRdO6DYGOyIU
 9bsA==
X-Gm-Message-State: AOJu0YzjpTDRi6oDOMQkcxqq+epyVvJQNcDU4lbKTkL3H4k/dl/pGoNH
 9CtkTlMQRxiVN1IClj0p2/D6z814X080zDfP/0SKGZwbjT/HmVMuHl92S7ZO8nW0w5QAME9eG4H
 6s3K9fZ8UG0/FAqqDok4X7WLslaqNxh+uHHYJ6+1TQVkE1oupjkTFEUqAvN1K7IBx+wyR11xDdT
 It6N73oOJ1u1ot1VJ8bIrlKfFYEaD7h9IqasGVRg5504ghQvh7EmUD
X-Google-Smtp-Source: AGHT+IFIJzazwH5Vf+cK+hMGgu5nQn92cHUj+tCeZlPdx+p3jhrNYHVsORv9/VQr0mx5MyWSbaGWdA==
X-Received: by 2002:a6b:4e18:0:b0:7cc:5c:e269 with SMTP id
 c24-20020a6b4e18000000b007cc005ce269mr11998031iob.3.1712003738594; 
 Mon, 01 Apr 2024 13:35:38 -0700 (PDT)
Received: from localhost ([173.205.42.30]) by smtp.gmail.com with ESMTPSA id
 o12-20020a056602124c00b007d062e4cc20sm2847032iou.36.2024.04.01.13.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 13:35:38 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Filter modes which exceed graphics memory
Date: Mon,  1 Apr 2024 14:56:45 -0500
Message-Id: <20240401195645.31081-1-ian.forbes@broadcom.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SVGA requires individual surfaces to fit within graphics memory
(max_mob_pages) which means that modes with a final buffer size that would
exceed graphics memory must be pruned otherwise creation will fail.

This fixes an issue where VMs with low graphics memory (< 64MiB) configured
with high resolution mode boot to a black screen because surface creation
fails.

Fixes: d947d1b71deb ("drm/vmwgfx: Add and connect connector helper function")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 32 +++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 3c8414a13dba..49583b186a7d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -830,7 +830,37 @@ static void vmw_stdu_connector_destroy(struct drm_connector *connector)
 	vmw_stdu_destroy(vmw_connector_to_stdu(connector));
 }
 
+static enum drm_mode_status
+vmw_stdu_connector_mode_valid(struct drm_connector *connector,
+			      struct drm_display_mode *mode)
+{
+	enum drm_mode_status ret;
+	struct drm_device *dev = connector->dev;
+	struct vmw_private *dev_priv = vmw_priv(dev);
+	u64 assumed_cpp = dev_priv->assume_16bpp ? 2 : 4;
+	u64 required_mem = mode->hdisplay * assumed_cpp * mode->vdisplay;
+
+	ret = drm_mode_validate_size(mode, dev_priv->stdu_max_width,
+				     dev_priv->stdu_max_height);
+	if (ret != MODE_OK)
+		return ret;
+
+	ret = drm_mode_validate_size(mode, dev_priv->texture_max_width,
+				     dev_priv->texture_max_height);
+	if (ret != MODE_OK)
+		return ret;
 
+	if (required_mem > dev_priv->max_primary_mem)
+		return MODE_MEM;
+
+	if (required_mem > dev_priv->max_mob_pages * PAGE_SIZE)
+		return MODE_MEM;
+
+	if (required_mem > dev_priv->max_mob_size)
+		return MODE_MEM;
+
+	return MODE_OK;
+}
 
 static const struct drm_connector_funcs vmw_stdu_connector_funcs = {
 	.dpms = vmw_du_connector_dpms,
@@ -846,7 +876,7 @@ static const struct drm_connector_funcs vmw_stdu_connector_funcs = {
 static const struct
 drm_connector_helper_funcs vmw_stdu_connector_helper_funcs = {
 	.get_modes = vmw_connector_get_modes,
-	.mode_valid = vmw_connector_mode_valid
+	.mode_valid = vmw_stdu_connector_mode_valid
 };
 
 
-- 
2.34.1

