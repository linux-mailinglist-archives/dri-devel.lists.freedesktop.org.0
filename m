Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A3D82A1A8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 21:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B966810E648;
	Wed, 10 Jan 2024 20:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED30D10E648
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 20:03:09 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-783195e57c7so300013085a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 12:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1704916988; x=1705521788;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ON7TKuIHiVnpsIb56T4kckDmxFrZxuNEyg3jMYqFBog=;
 b=DV9qEN/y+dRdIUHefFsIXf1DsA/E1LJAYFhalB114Y8f9wGzvPbdIztw3gb2Rh5bbv
 GCbdarXOfBBd2drr483rua5zmFkOOgy+/MiiJnJb7aWhTvmdAK4xqjAvC8RfnMP2kOl3
 m7jvNXZ+RzjAuFSWZsKIIt+F/VtGVuCFUE5IU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704916988; x=1705521788;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ON7TKuIHiVnpsIb56T4kckDmxFrZxuNEyg3jMYqFBog=;
 b=crPnx0dIlLQrZp54emJRxWn2e5jYY8bSqTchBG5n2tedvgXcOoXPtJe4z/DVeOynLP
 A4Pgx0+r2b/4yI3sdBM1rlBVIX66Wiyysq0VuuHRqgQrIsK66aFuFztIoZvWvxpK9RhU
 fsYe0eJkOSZXD24viNOF6N5X2w+ZsiQNwEskFlbzFoY4Z5JaqV0vcPdKz7MN21SkHv7u
 KZA03kAZotQ7HykjzP1uuUbngsvuwSzMX1S2mD/QReHKzOetjA2zvdsfdeszPe8mwcLY
 37/QZqt+dn9t7bNx3nc72QMJSW3QD+lpng//GFV/p8SrzAxW9ihCLjDHGQx3UQUQLryo
 W15Q==
X-Gm-Message-State: AOJu0YwJ03e36uW6zsBxBd8hxdjULF9dxkBpX4jQ17PmxLFGaof0EQCg
 jqHdoRL1MggjhAcA9rCGcTQY8DpevfTuCn2AWFgotvFyRJAYGD8NbFeeStfzikD2Fp6iYu92T5w
 UvzQLrlDLaI+PiyZvWepn9VAfjPj6tNkQzsOP6N9fmr+WHLlaPgSow/22mgVi2cNU3+xPPHNQ+X
 am4q8j/zjY8tLmbMWHo7Xk
X-Google-Smtp-Source: AGHT+IFFIXjYqaWGyx31yI9Yk6y9Ny+MruPuyXDQi58sWTW0Do9uYf0CnaxRWqS5BNVb6fhEzKF+UQ==
X-Received: by 2002:a05:6214:c85:b0:680:f8d8:2c26 with SMTP id
 r5-20020a0562140c8500b00680f8d82c26mr13832qvr.19.1704916988434; 
 Wed, 10 Jan 2024 12:03:08 -0800 (PST)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 dh1-20020ad458c1000000b0067f6af684e5sm1939154qvb.73.2024.01.10.12.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 12:03:08 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: Fix possible null pointer derefence with invalid
 contexts
Date: Wed, 10 Jan 2024 15:03:05 -0500
Message-Id: <20240110200305.94086-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Niels De Graef <ndegraef@redhat.com>, stable@vger.kernel.org,
 Ian Forbes <ian.forbes@broadcom.com>,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 Martin Krastev <martin.krastev@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vmw_context_cotable can return either an error or a null pointer and its
usage sometimes went unchecked. Subsequent code would then try to access
either a null pointer or an error value.

The invalid dereferences were only possible with malformed userspace
apps which never properly initialized the rendering contexts.

Check the results of vmw_context_cotable to fix the invalid derefs.

Thanks:
ziming zhang(@ezrak1e) from Ant Group Light-Year Security Lab
who was the first person to discover it.
Niels De Graef who reported it and helped to track down the poc.

Fixes: 9c079b8ce8bf ("drm/vmwgfx: Adapt execbuf to the new validation api")
Cc: <stable@vger.kernel.org> # v4.20+
Reported-by: Niels De Graef  <ndegraef@redhat.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Martin Krastev <martin.krastev@broadcom.com>
Cc: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Cc: Ian Forbes <ian.forbes@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 272141b6164c..4f09959d27ba 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -447,7 +447,7 @@ static int vmw_resource_context_res_add(struct vmw_private *dev_priv,
 	    vmw_res_type(ctx) == vmw_res_dx_context) {
 		for (i = 0; i < cotable_max; ++i) {
 			res = vmw_context_cotable(ctx, i);
-			if (IS_ERR(res))
+			if (IS_ERR_OR_NULL(res))
 				continue;
 
 			ret = vmw_execbuf_res_val_add(sw_context, res,
@@ -1266,6 +1266,8 @@ static int vmw_cmd_dx_define_query(struct vmw_private *dev_priv,
 		return -EINVAL;
 
 	cotable_res = vmw_context_cotable(ctx_node->ctx, SVGA_COTABLE_DXQUERY);
+	if (IS_ERR_OR_NULL(cotable_res))
+		return cotable_res ? PTR_ERR(cotable_res) : -EINVAL;
 	ret = vmw_cotable_notify(cotable_res, cmd->body.queryId);
 
 	return ret;
@@ -2484,6 +2486,8 @@ static int vmw_cmd_dx_view_define(struct vmw_private *dev_priv,
 		return ret;
 
 	res = vmw_context_cotable(ctx_node->ctx, vmw_view_cotables[view_type]);
+	if (IS_ERR_OR_NULL(res))
+		return res ? PTR_ERR(res) : -EINVAL;
 	ret = vmw_cotable_notify(res, cmd->defined_id);
 	if (unlikely(ret != 0))
 		return ret;
@@ -2569,8 +2573,8 @@ static int vmw_cmd_dx_so_define(struct vmw_private *dev_priv,
 
 	so_type = vmw_so_cmd_to_type(header->id);
 	res = vmw_context_cotable(ctx_node->ctx, vmw_so_cotables[so_type]);
-	if (IS_ERR(res))
-		return PTR_ERR(res);
+	if (IS_ERR_OR_NULL(res))
+		return res ? PTR_ERR(res) : -EINVAL;
 	cmd = container_of(header, typeof(*cmd), header);
 	ret = vmw_cotable_notify(res, cmd->defined_id);
 
@@ -2689,6 +2693,8 @@ static int vmw_cmd_dx_define_shader(struct vmw_private *dev_priv,
 		return -EINVAL;
 
 	res = vmw_context_cotable(ctx_node->ctx, SVGA_COTABLE_DXSHADER);
+	if (IS_ERR_OR_NULL(res))
+		return res ? PTR_ERR(res) : -EINVAL;
 	ret = vmw_cotable_notify(res, cmd->body.shaderId);
 	if (ret)
 		return ret;
@@ -3010,6 +3016,8 @@ static int vmw_cmd_dx_define_streamoutput(struct vmw_private *dev_priv,
 	}
 
 	res = vmw_context_cotable(ctx_node->ctx, SVGA_COTABLE_STREAMOUTPUT);
+	if (IS_ERR_OR_NULL(res))
+		return res ? PTR_ERR(res) : -EINVAL;
 	ret = vmw_cotable_notify(res, cmd->body.soid);
 	if (ret)
 		return ret;
-- 
2.40.1

