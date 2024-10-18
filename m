Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7489A48A8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 23:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F9110E9A0;
	Fri, 18 Oct 2024 21:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="UjQ0hOXo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA9F10E9A0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 21:01:44 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-46089a6849bso15279141cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 14:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1729285302; x=1729890102;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=A1Ut+AREuPwkxKzVHVNNtSQGa7YvwxFAQwZP0H3KyMg=;
 b=UjQ0hOXo+5ieMmS0PNW2O13k35/Rh7ow3/QTTqmBu36YYVnBRXXOlPcIBDVbJam5ir
 ZhROK1JUI24Ljw10rC4FEzUimqb+rOU5Ub2eKPJHfPMQvu22BW2cd826xbJDs3+VDyVh
 8u0JIxGGqP3UUY8NoYFmKWk/AVYz/wgwCjeMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729285302; x=1729890102;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A1Ut+AREuPwkxKzVHVNNtSQGa7YvwxFAQwZP0H3KyMg=;
 b=wBe1TZYjHozJO3Y1l+DpizzKsJl0trYA2a/L6D5FwLJu3Vac3jBlt/VvYv4Ep0/umn
 H/Hrd2TWPsZtK95leiqtyMibwPeDRr98D7l74rZwF9HJXO1k1omJMjOk+O3FbfYCKDni
 6GQjgFnWANWKvrfPuYVYifuyKJ8osZOp6GDcaNWiImYMJSCCDHjltLTLLcHKbL8EkD58
 Wz6NiDryi49Rqq4dbKJbVbgb5FUoKUW/zGW2ugqM8x12etHED4NBbdl+iJDu5giuioOV
 9EMJ2MW5vaYtR2g+tYZRCjOpUHzl5u7HBN5i6ByEZW/8Kjnos/QMPW32VTCExwsaTsG+
 hYRg==
X-Gm-Message-State: AOJu0Yy37f1L6RYmDPle4lted6cKNmiqSp3Y8XMVSjCovkn2SKGCyGbu
 24ulJFyy0ZLozUNS3PMhyc+5xg6QEAjlhth8eTrPa5b4INrxFjamsLGu4aIX+5xH0OclmRdEEzW
 kGwrHj2WD+nskU9RNDZ6klHMp/ddb1bzMEBpVnlbOjLJL7OxcfBrFzSjgGsQ39/4iCx2TchaPT6
 V53lQc41az4+wUQk8V/Gh67eVSKQ3GtxIrA+ArBwykpFMwXk/om8tsiNzcBg==
X-Google-Smtp-Source: AGHT+IH+NsCJsJPQ/ngNbb9MGh+QRFgSn686iqMI/OBtmzin4ddirfGaBzahIgLEFHRN45p++gxH/Q==
X-Received: by 2002:a05:622a:1b0b:b0:460:ad8e:f5a9 with SMTP id
 d75a77b69052e-460aed4cf7amr43039181cf.19.1729285301893; 
 Fri, 18 Oct 2024 14:01:41 -0700 (PDT)
Received: from localhost.localdomain ([216.221.25.44])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-460aea48ebcsm10599501cf.63.2024.10.18.14.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 14:01:40 -0700 (PDT)
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Subject: [PATCH v2 2/3] drm/vmwgfx: Support hw_destroy for userspace managed
 surfaces
Date: Fri, 18 Oct 2024 14:00:45 -0700
Message-ID: <20241018210046.2222313-3-maaz.mombasawala@broadcom.com>
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

A userspace may create a userspace managed surface but not destroy it,
add hw_destroy function for userspace surfaces so that vmwgfx records the
destroy command and submits it when the userspace context is destroyed.

Signed-off-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c |  7 ++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 41 +++++++++++++++++++++++++
 3 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 67f75d366f9d..6cb3f648eaad 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -267,6 +267,7 @@ struct vmw_surface {
 struct vmw_cmdbuf_surface {
 	struct vmw_surface surface;
 	struct ttm_base_object base;
+	bool cmdbuf_destroy;
 };
 
 struct vmw_fifo_state {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 0468c9f4f293..70f816062fd2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -3374,6 +3374,8 @@ static int vmw_cmd_destroy_gb_surface(struct vmw_private *dev_priv,
 				      SVGA3dCmdHeader *header)
 {
 	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDestroyGBSurface);
+	struct vmw_resource *res;
+	struct vmw_cmdbuf_surface *surface;
 	int ret;
 
 	cmd = container_of(header, typeof(*cmd), header);
@@ -3382,10 +3384,13 @@ static int vmw_cmd_destroy_gb_surface(struct vmw_private *dev_priv,
 		return -EINVAL;
 
 	ret = vmw_cmd_res_check(dev_priv, sw_context, vmw_res_surface,
-				VMW_RES_DIRTY_NONE, NULL, &cmd->body.sid, NULL);
+				VMW_RES_DIRTY_NONE, NULL, &cmd->body.sid, &res);
 	if (unlikely(ret))
 		return ret;
 
+	surface = vmw_res_to_cmdbuf_srf(res);
+	surface->cmdbuf_destroy = true;
+
 	ret = vmw_cmdbuf_surface_destroy(dev_priv, sw_context, cmd->body.sid);
 	if (unlikely(ret))
 		return ret;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 4dfce3ea104c..26a71af79a39 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -2403,6 +2403,44 @@ static void vmw_cmdbuf_surface_base_release(struct ttm_base_object **p_base)
 }
 
 
+static void vmw_cmdbuf_surface_hw_destroy(struct vmw_resource *res)
+{
+	struct vmw_private *dev_priv = res->dev_priv;
+	struct vmw_cmdbuf_surface *surface;
+	struct {
+		SVGA3dCmdHeader header;
+		SVGA3dCmdDestroyGBSurface body;
+	} *cmd;
+
+	if (res->id == -1)
+		return;
+
+	surface = vmw_res_to_cmdbuf_srf(res);
+	/**
+	 * If userspace is submitting a destroy command there is no need for
+	 * kernel to do so.
+	 */
+	if (surface->cmdbuf_destroy)
+		return;
+
+	mutex_lock(&dev_priv->binding_mutex);
+	vmw_view_surface_list_destroy(dev_priv, &surface->surface.view_list);
+	vmw_binding_res_list_scrub(&res->binding_head);
+
+	cmd = VMW_CMD_RESERVE(dev_priv, sizeof(*cmd));
+	if (unlikely(!cmd)) {
+		mutex_unlock(&dev_priv->binding_mutex);
+		return;
+	}
+
+	cmd->header.id = SVGA_3D_CMD_DESTROY_GB_SURFACE;
+	cmd->header.size = sizeof(cmd->body);
+	cmd->body.sid = res->id;
+	vmw_cmd_commit(dev_priv, sizeof(*cmd));
+	mutex_unlock(&dev_priv->binding_mutex);
+}
+
+
 int vmw_cmdbuf_surface_define(struct vmw_private *dev_priv,
 			      struct vmw_sw_context *sw_context,
 			      struct vmw_surface_metadata *metadata,
@@ -2484,6 +2522,9 @@ int vmw_cmdbuf_surface_define(struct vmw_private *dev_priv,
 		return ret;
 	}
 
+	res->hw_destroy = vmw_cmdbuf_surface_hw_destroy;
+	surface->cmdbuf_destroy = false;
+
 	return 0;
 }
 
-- 
2.43.0

