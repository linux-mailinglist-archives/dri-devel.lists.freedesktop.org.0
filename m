Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4465594F766
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 21:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B036910E297;
	Mon, 12 Aug 2024 19:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="PhOlqUV8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA00B10E297
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 19:17:02 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1ff67158052so29764015ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 12:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723490222; x=1724095022;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9RrKdm887JRfRNJHXWtnpoOta9dNFRp10bC+1FA5s9U=;
 b=PhOlqUV8RMZp3vBEuIM+DZreWW2Gp0Wd1WAU41+2QMTJCOhP+3qbWblAhPwskLbqQV
 vfrmnqRFQqJdtAfCJYxzDiIw4gZbdNQ1INUS6Q1+PjqsI1qWQKuKH4f1RN+hg3/aJoNe
 Yxv9LYaTIoehfQL4hjHgEf2Q84nUPK4HSrTXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723490222; x=1724095022;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9RrKdm887JRfRNJHXWtnpoOta9dNFRp10bC+1FA5s9U=;
 b=XE6Z57Qj7w5IuRoYevdwLjPteZPAUJbnAehbMsGZoGNyHbkbx1N57XVxJrXg4AVLFd
 Qfrvl9wOwAwY08zC63Ss9mlczjRfQVVKrWI6tQYnN/N/ULrg6vg4EZQ4qNLXVXKX7cGd
 NWZE3rhxZZ3wJkXD+Q0QsRw/qvQsMfGxaEBsdNHhSF6B/k9/zaGxpzns5OWKEPGGBIWe
 SYkMvW/cq2+XrHcfqn8ys0QjjwsjgvxUj3a4LFpz4Lyfq3lephH0VH/q1CivFwhXFlsc
 obfMABiwQIDS3HXkEaIxTl8OG4dhKxZCU/2CYiPvPnyNHjnVS9izK0DWaTGtJPe3FCZ1
 fn6w==
X-Gm-Message-State: AOJu0Yy7nycLFMPKPzfyLag57JOue+Mj78Fc12Wor+h8ZYKJpq/tpyGh
 6c6jF+DU8ZAN6cy/cCQFLxWamgkA+idAZd28sWCPXnWuPH8h/6Dc+MHci3FlCunZ0leM6LQWiEa
 Sx4MvdXYgY/Lwe8Fh+HTKGQQqj4BfVKCJGijBlATTGebAvJ2xUiTKW5UH+SFTtr/mjZn1TM6PU3
 m+xJOzWLTs/DdZhX8jIKj2T66FpPi+Ls0pmpuUtY4UmQrttZjlCxpqItCQaw==
X-Google-Smtp-Source: AGHT+IHHRostg51nzbJ1C29RlxMWzBR32R4hb6Gaw5QCuvjyk7DAf69Ks8DxIiiURLqfx56gyH+ylg==
X-Received: by 2002:a17:903:a88:b0:1fd:a412:5ded with SMTP id
 d9443c01a7336-201ca175257mr13748995ad.26.1723490221710; 
 Mon, 12 Aug 2024 12:17:01 -0700 (PDT)
Received: from mombasawalam-Precision-5820-Tower.eng.vmware.com ([66.170.99.2])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201cd1e1572sm309785ad.300.2024.08.12.12.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 12:17:01 -0700 (PDT)
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Subject: [PATCH 2/3] drm/vmwgfx: Support hw_destroy for userspace managed
 surfaces
Date: Mon, 12 Aug 2024 12:16:38 -0700
Message-Id: <20240812191639.649841-3-maaz.mombasawala@broadcom.com>
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

A userspace may create a userspace managed surface but not destroy it,
add hw_destroy function for userspace surfaces so that vmwgfx records the
destroy command and submits it when the userspace context is destroyed.

Signed-off-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c |  7 ++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 40 +++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 3e959d2a32bc..f6edeac99cf7 100644
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
index 4f8fb45ab7fa..d4c9a7e51088 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -2403,6 +2403,43 @@ static void vmw_cmdbuf_surface_base_release(struct ttm_base_object **p_base)
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
@@ -2484,6 +2521,9 @@ int vmw_cmdbuf_surface_define(struct vmw_private *dev_priv,
 		return ret;
 	}
 
+	res->hw_destroy = vmw_cmdbuf_surface_hw_destroy;
+	surface->cmdbuf_destroy = false;
+
 	return 0;
 }
 
-- 
2.34.1

