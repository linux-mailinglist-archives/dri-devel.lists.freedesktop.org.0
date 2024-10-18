Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC599A48A9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 23:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6DA10E9A1;
	Fri, 18 Oct 2024 21:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="hHJMGaww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC95F10E9A1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 21:01:49 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-288642376bcso1399139fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 14:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1729285308; x=1729890108;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+1g1/XbzqPOXbL2vO4IXOxaUAiMvAaiXahkkcF46rzE=;
 b=hHJMGawwCk4QYXgiAwHbJp5M70OgKWk5NZY2b082dVk5xbsE1J61ZqHBfbrZOvwHcJ
 8ZwzxKmAomxh0YdTRY+D3v49OGSoyUxWUDO6tYEeF6k3L+kHr9MrBL0qTX0HLD8fOJ2P
 6R6CNUJqcSngxr7twkvOeWEiCUn/iTW91pqPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729285308; x=1729890108;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+1g1/XbzqPOXbL2vO4IXOxaUAiMvAaiXahkkcF46rzE=;
 b=t6zx+i1bMHRyFyMQJ6Nqu03dIPut+6rqSi3dVKH5HW11vpqcKJdah3hLb33whLZz3s
 YMTDKKqft9DpHp0gCiQSdtF34E87fKaTOdAkFjbOo6CRykS1BgLzCnEzvhwezzxrVHf8
 duxfwr0JsrEKPlbSbabpxhJyFFzbmHOczGbB5M0WCaCknriVsRLvehDlcqkP4yHsCSA8
 VUWqI/tD4uK6XAE+RalLZcIWkcyccfLQnOxdj2z2jtXYxfCX7evtDJvJXJhpr5TChtgj
 tQC6gtkeYQrTjYf46k1oTQuVdJtzS2DTnlaQYBF2kr2Mx8+Rbos83kISfzNrzYB9pz+2
 7buA==
X-Gm-Message-State: AOJu0YyOkR4uJMIS67x0vug/C+w5joxE1q7QPGQvqb7ONAdRKYCuHshd
 gRXRrXJmB/FpZt9HRB9WNm92JOTirjp0ZaYkc/jJkqtwSsfSgW83GWdo0TroSLpeoqVxQg1UtQW
 F4hxzvMyP2VEuSHeDsRhwlM2/GeDXigZClsm/kbdH/SXcA7v3fJ1h+f1WFnsumIJuR4G9jn7n/r
 kSSdcPzdA7u4iGDXR78NnHkjupinyGq6x3J/nWOMCgtv9Z9DXqVg5IBhppFQ==
X-Google-Smtp-Source: AGHT+IF9ZI30w4HjyRw7Tod6v7le1my4PTTg4xsMZc1KZisNHym6xr84NQLUus8c36tJCfgYMEtUjA==
X-Received: by 2002:a05:6870:2107:b0:25e:bd07:4743 with SMTP id
 586e51a60fabf-2892bf0b202mr3712610fac.0.1729285307969; 
 Fri, 18 Oct 2024 14:01:47 -0700 (PDT)
Received: from localhost.localdomain ([216.221.25.44])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-460aea48ebcsm10599501cf.63.2024.10.18.14.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 14:01:46 -0700 (PDT)
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Subject: [PATCH v2 3/3] drm/vmwgfx: Add support for older define commands for
 userspace surfaces
Date: Fri, 18 Oct 2024 14:00:46 -0700
Message-ID: <20241018210046.2222313-4-maaz.mombasawala@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018210046.2222313-1-maaz.mombasawala@broadcom.com>
References: <20241018210046.2222313-1-maaz.mombasawala@broadcom.com>
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
2.43.0

