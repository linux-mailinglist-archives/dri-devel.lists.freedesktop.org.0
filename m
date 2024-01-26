Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5D083E314
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 21:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C48910FE21;
	Fri, 26 Jan 2024 20:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B54E10FE21
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 20:09:17 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-59927972125so432025eaf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 12:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1706299696; x=1706904496;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1GTb249HDVDkHK8S6SLVCy44afYeYeH1yhMwfpgsTBE=;
 b=G0eAXjnQaTXnr1IcwvOWdnGhkCzDY+64GfQHO0anPkSuUCLvvOjB/D/0wfiVHYwPy7
 oHfUjgwgNwyKi1FuwO5uAPIbFhxgAAds6sqIPNexRk+iRm6qAbfER7Im3FqEtyg9PU7A
 b6qiM2Vr5C+XP+p9qbtyOX8iA+RkSBPVX8xVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706299696; x=1706904496;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1GTb249HDVDkHK8S6SLVCy44afYeYeH1yhMwfpgsTBE=;
 b=XfN+E++JWTw5YkFUF9Izm4ujjFIYgcAJGyZVk75uvq91yxesnYzNnxjFtHFD+ZgYmp
 aPYfTRUy4cowpHAk1a4n8H2VGzMbLCIPIpKgF8bLi+78kOKHicRWv3jnhZwZSruV5Y4Z
 msVXGLVaYOxlFGt+JTe+Y9IJ1IhU7B5mLkXGd4nZB6rw//flimDCoZKol+jX5bVk5F8B
 d+3995QCkmBClJZZx0USBO26X936jbUtA++v33nLpfw8ckWRMZuTilld7DE21rUgXl1y
 OpGEGz6TCEkBqSW3DId9kWwH0qP41lMXBsmNNnd5DEm/9ytwnQcnfnPWTtwUc8ttExKg
 dQwA==
X-Gm-Message-State: AOJu0Yx3AjIQDuVLWp3aOUlHzjPiNr0J6lVciuihcOdehcF97GrBeI9U
 DV2Fq60F9WWwk3HI3a1lerGa5oYsZjpNjFQOPC5fwX8sIVcdvffQZngkgMeNT0bimIbtKs+RJxR
 CFyXyY9OrVF4V1uISicfM1mI3Js2vu3HoqC/AEy+jjT3pK4SfuI0xVLneFijUr2NnV0FRvJF4q1
 S3M9TCZsulTLU+RIlT7cEJwXF/n6dpFAA/gnhHJJ9Jb23Q44pIFg==
X-Google-Smtp-Source: AGHT+IEViU0fezbQ9Kkyzoq2F6uLwDLhl+jv2QB27dw4/XMnOQF4JxN3o5oxp+wN0HzflTzjlQ4MHw==
X-Received: by 2002:a4a:bd03:0:b0:59a:9ff:9ed0 with SMTP id
 n3-20020a4abd03000000b0059a09ff9ed0mr212198oop.0.1706299696286; 
 Fri, 26 Jan 2024 12:08:16 -0800 (PST)
Received: from vertex.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a4abd87000000b00599f5c2c052sm358161oop.8.2024.01.26.12.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 12:08:16 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/vmwgfx: Fix vmw_du_get_cursor_mob fencing of
 newly-created MOBs
Date: Fri, 26 Jan 2024 15:08:03 -0500
Message-Id: <20240126200804.732454-5-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240126200804.732454-1-zack.rusin@broadcom.com>
References: <20240126200804.732454-1-zack.rusin@broadcom.com>
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
Cc: Martin Krastev <martin.krastev@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <martin.krastev@broadcom.com>

The fencing of MOB creation used in vmw_du_get_cursor_mob was incompatible
with register-based device communication employed by this routine. As a
result cursor MOB creation was racy, leading to potentially broken/missing
mouse cursor on desktops using CursorMob device feature.

Fixes: 53bc3f6fb6b3 ("drm/vmwgfx: Clean up cursor mobs")
Signed-off-by: Martin Krastev <martin.krastev@broadcom.com>
Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 2398041502c9..e2bfaf4522a6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -273,6 +273,7 @@ static int vmw_du_get_cursor_mob(struct vmw_cursor_plane *vcp,
 	u32 size = vmw_du_cursor_mob_size(vps->base.crtc_w, vps->base.crtc_h);
 	u32 i;
 	u32 cursor_max_dim, mob_max_size;
+	struct vmw_fence_obj *fence = NULL;
 	int ret;
 
 	if (!dev_priv->has_mob ||
@@ -314,7 +315,15 @@ static int vmw_du_get_cursor_mob(struct vmw_cursor_plane *vcp,
 	if (ret != 0)
 		goto teardown;
 
-	vmw_bo_fence_single(&vps->cursor.bo->tbo, NULL);
+	ret = vmw_execbuf_fence_commands(NULL, dev_priv, &fence, NULL);
+	if (ret != 0) {
+		ttm_bo_unreserve(&vps->cursor.bo->tbo);
+		goto teardown;
+	}
+
+	dma_fence_wait(&fence->base, false);
+	dma_fence_put(&fence->base);
+
 	ttm_bo_unreserve(&vps->cursor.bo->tbo);
 	return 0;
 
-- 
2.40.1

