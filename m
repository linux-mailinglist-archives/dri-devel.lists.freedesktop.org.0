Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5DB94F767
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 21:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E69710E298;
	Mon, 12 Aug 2024 19:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="eeTF5y5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC42F10E298
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 19:17:13 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-70d162eef54so3349440b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 12:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723490233; x=1724095033;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=bvz2mQeAUW2BZft4CykBOGMS9+YlJ5Ujvz7e17jHPCI=;
 b=eeTF5y5H9EAvTHqF2nTCqzmqLrP78Q9GJJuYYJtImu23ZHs3rqYxRAdDFZgpxMyn3d
 6EsigK5XPp5JH8RW7kOIW61NJeqqXcY9bsV0rM7WlkC7A2B31F+PHRFUrP2V8xY2yN6V
 C4+/l73ujOMpz3GwyDAng14luVHDekWnRbDeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723490233; x=1724095033;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bvz2mQeAUW2BZft4CykBOGMS9+YlJ5Ujvz7e17jHPCI=;
 b=UM41i0izFZftAtCUH4E+x4oVc3CpzacTbAP8xveQm1ksuXv0fE9++1MzG3TtyjauGe
 vqOYtmwHQn1DNjjkWNpXHzCUDg9NS5YSOJ8/zUPHgHYbM9HxY5RxKFzgXH496Ix6Ukm5
 +xa/Ctr1qrbE8NBaYwfa16c8B1wV33SOedBZs9jl1rAtb500Psh6FH7TUIjntfGtW9Po
 7j2o07b/TeLT3EwDbMCTVmiuSwVXigqFw8q+dcrJ4a1FKF7Qo9P0oxCwoI9gWhDcdXW0
 7SqrmSzs1KoGIPHmVMCVdURdxhhorDUIQ0eSScj80oNVmlVLYGgwRInXcT6MapBDBL6s
 sUGQ==
X-Gm-Message-State: AOJu0YyykWW8q0TragY5jWyRj3BgoWu7es4QNekzxNDGm1QI+Ni9MIiS
 yHb7VGNN7wdCZ0J/XY/dCPy1mPhcDaRBUgY2LhTctXxe3NJSao4DV72oqiDlx8WJu/OfiA3nz1d
 hy5E0mYeHSbR9KFvrw30CoqcyDhKH+3pNPPG0ML7J0Tg4l8NQCYVF/VldYcljTLe8h1xy5xZpjA
 b+NZNm0S7cYxWCv4md/LKLixqPuNPPrUhI2oITKAGWThKOHBjkrgLX07ntgA==
X-Google-Smtp-Source: AGHT+IE30s/inrZTnXM1Y9SWFRoW10K0lIkn0Hfa8CHyjbtyRJ9LRqXe/2yzdBf2wC508Lmg/nMpaA==
X-Received: by 2002:a17:902:ecc9:b0:1fd:9a23:90cc with SMTP id
 d9443c01a7336-201ca1387e3mr15608775ad.26.1723490232835; 
 Mon, 12 Aug 2024 12:17:12 -0700 (PDT)
Received: from mombasawalam-Precision-5820-Tower.eng.vmware.com ([66.170.99.2])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201cd1e1572sm309785ad.300.2024.08.12.12.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 12:17:12 -0700 (PDT)
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Subject: [PATCH 3/3] drm/vmwgfx: Add support for older define commands for
 userspace surfaces
Date: Mon, 12 Aug 2024 12:16:39 -0700
Message-Id: <20240812191639.649841-4-maaz.mombasawala@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812191639.649841-1-maaz.mombasawala@broadcom.com>
References: <20240812191639.649841-1-maaz.mombasawala@broadcom.com>
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
Reply-To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Older HW versions of the svga device will only support older versions of
DefineGBSurface command.
Allow userspace to submit v3 and v2 of the DefineGBSurface command for
userspace managed surfaces. The first version of the command is not
supported since it is only used for pre-dx hardware.

Signed-off-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 92 ++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 70f816062fd2..e7f224afe338 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -3324,6 +3324,92 @@ vmw_cmd_get_expected_surface_version(struct vmw_private *dev_priv,
 	return 0;
 }
 
+static int vmw_cmd_define_gb_surface_v2(struct vmw_private *dev_priv,
+					struct vmw_sw_context *sw_context,
+					SVGA3dCmdHeader *header)
+{
+	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDefineGBSurface_v2);
+	uint32 expected_cmd_id;
+	struct vmw_surface_metadata metadata = {0};
+	int ret;
+
+	cmd = container_of(header, typeof(*cmd), header);
+
+	ret = vmw_cmd_get_expected_surface_version(dev_priv,
+						   cmd->body.arraySize,
+						   &expected_cmd_id);
+	if (ret || (expected_cmd_id != header->id))
+		return -EINVAL;
+
+	if (cmd->body.sid >= VMWGFX_NUM_GB_SURFACE)
+		return -EINVAL;
+
+	metadata.flags = cmd->body.surfaceFlags;
+	metadata.format = cmd->body.format;
+	metadata.mip_levels[0] = cmd->body.numMipLevels;
+	metadata.multisample_count = cmd->body.multisampleCount;
+	metadata.autogen_filter = cmd->body.autogenFilter;
+	metadata.array_size = cmd->body.arraySize;
+	metadata.num_sizes = 1;
+	metadata.base_size.width = cmd->body.size.width;
+	metadata.base_size.height = cmd->body.size.height;
+	metadata.base_size.depth = cmd->body.size.depth;
+
+	ret = vmw_cmdbuf_surface_define(dev_priv, sw_context, &metadata,
+					cmd->body.sid);
+	if (unlikely(ret))
+		return ret;
+
+	ret = vmw_cmd_res_check(dev_priv, sw_context, vmw_res_surface,
+				VMW_RES_DIRTY_NONE, NULL, &cmd->body.sid, NULL);
+
+	return ret;
+}
+
+static int vmw_cmd_define_gb_surface_v3(struct vmw_private *dev_priv,
+					struct vmw_sw_context *sw_context,
+					SVGA3dCmdHeader *header)
+{
+	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDefineGBSurface_v3);
+	uint32 expected_cmd_id;
+	struct vmw_surface_metadata metadata = {0};
+	int ret;
+
+	cmd = container_of(header, typeof(*cmd), header);
+
+	ret = vmw_cmd_get_expected_surface_version(dev_priv,
+						   cmd->body.arraySize,
+						   &expected_cmd_id);
+	if (ret || (expected_cmd_id != header->id))
+		return -EINVAL;
+
+	if (cmd->body.sid >= VMWGFX_NUM_GB_SURFACE)
+		return -EINVAL;
+
+	metadata.flags = cmd->body.surfaceFlags;
+	metadata.format = cmd->body.format;
+	metadata.mip_levels[0] = cmd->body.numMipLevels;
+	metadata.multisample_count = cmd->body.multisampleCount;
+	metadata.multisample_pattern = cmd->body.multisamplePattern;
+	metadata.quality_level = cmd->body.qualityLevel;
+	metadata.autogen_filter = cmd->body.autogenFilter;
+	metadata.array_size = cmd->body.arraySize;
+	metadata.num_sizes = 1;
+	metadata.base_size.width = cmd->body.size.width;
+	metadata.base_size.height = cmd->body.size.height;
+	metadata.base_size.depth = cmd->body.size.depth;
+
+	ret = vmw_cmdbuf_surface_define(dev_priv, sw_context, &metadata,
+					cmd->body.sid);
+	if (unlikely(ret))
+		return ret;
+
+	ret = vmw_cmd_res_check(dev_priv, sw_context, vmw_res_surface,
+				VMW_RES_DIRTY_NONE, NULL, &cmd->body.sid, NULL);
+
+	return ret;
+}
+
 static int vmw_cmd_define_gb_surface_v4(struct vmw_private *dev_priv,
 					struct vmw_sw_context *sw_context,
 					SVGA3dCmdHeader *header)
@@ -3611,8 +3697,8 @@ static const struct vmw_cmd_entry vmw_cmd_entries[SVGA_3D_CMD_MAX] = {
 		    false, false, true),
 	VMW_CMD_DEF(SVGA_3D_CMD_GB_MOB_FENCE, &vmw_cmd_invalid,
 		    false, false, true),
-	VMW_CMD_DEF(SVGA_3D_CMD_DEFINE_GB_SURFACE_V2, &vmw_cmd_invalid,
-		    false, false, true),
+	VMW_CMD_DEF(SVGA_3D_CMD_DEFINE_GB_SURFACE_V2,
+		    &vmw_cmd_define_gb_surface_v2, true, false, true),
 
 	/* SM commands */
 	VMW_CMD_DEF(SVGA_3D_CMD_DX_DEFINE_CONTEXT, &vmw_cmd_invalid,
@@ -3766,6 +3852,8 @@ static const struct vmw_cmd_entry vmw_cmd_entries[SVGA_3D_CMD_MAX] = {
 		    true, false, true),
 	VMW_CMD_DEF(SVGA_3D_CMD_INTRA_SURFACE_COPY, &vmw_cmd_intra_surface_copy,
 		    true, false, true),
+	VMW_CMD_DEF(SVGA_3D_CMD_DEFINE_GB_SURFACE_V3,
+		    &vmw_cmd_define_gb_surface_v3, true, false, true),
 
 	/*
 	 * SM5 commands
-- 
2.34.1

