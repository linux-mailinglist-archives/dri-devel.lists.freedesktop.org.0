Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4254F750995
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 15:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB5F10E08C;
	Wed, 12 Jul 2023 13:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87C110E52C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 13:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689168515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=njviNuUYhMhHX25+mP7+WvQU22dyAqbmOtUfBhTjQHs=;
 b=d/mvjjdfBwzLzzWGuj6yrOk8i4ut+HIwrScfWeZC6NPIRe9d/VqT7+Sq8vJ13lJZ+B3923
 qCd/eqnIirc6o7h2+WcT6XwqhvPb2OeJBOw03gxDBWTy6v8FFrXm5E1BY3e4ZTTe6V22TJ
 KDd07aXd4wLUn4jOt5rfK6JmKFpniko=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-VEu9SxyUO1O5rYbx5VQ-Yg-1; Wed, 12 Jul 2023 09:28:31 -0400
X-MC-Unique: VEu9SxyUO1O5rYbx5VQ-Yg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5181293248A;
 Wed, 12 Jul 2023 13:28:30 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66E8AC1ED96;
 Wed, 12 Jul 2023 13:28:29 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: tzimmermann@suse.de, airlied@redhat.com, kuohsiang_chou@aspeedtech.com,
 jammy_huang@aspeedtech.com, jani.nikula@linux.intel.com,
 dianders@chromium.org
Subject: [PATCH v4 1/2] drm/ast: Add BMC virtual connector
Date: Wed, 12 Jul 2023 15:27:16 +0200
Message-ID: <20230712132826.287126-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most aspeed devices have a BMC, which allows to remotely see the screen.
Also in the common use case, those servers don't have a display connected.
So add a Virtual connector, to reflect that even if no display is
connected, the framebuffer can still be seen remotely.
This prepares the work to implement a detect_ctx() for the Display port
connector.

v4: call drm_add_modes_noedid() with 4096x4096 (Thomas Zimmermann)
    remove useless struct field init to 0 (Thomas Zimmermann)
    don't use drm_simple_encoder_init() (Thomas Zimmermann)
    inline ast_bmc_connector_init() (Thomas Zimmermann)

Fixes: fae7d186403e ("drm/probe-helper: Default to 640x480 if no EDID on DP")
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_drv.h  |  4 +++
 drivers/gpu/drm/ast/ast_mode.c | 58 ++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 3f6e0c984523..c9659e72002f 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -214,6 +214,10 @@ struct ast_device {
 			struct drm_encoder encoder;
 			struct drm_connector connector;
 		} astdp;
+		struct {
+			struct drm_encoder encoder;
+			struct drm_connector connector;
+		} bmc;
 	} output;
 
 	bool support_wide_screen;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index f711d592da52..1a8293162fec 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1735,6 +1735,61 @@ static int ast_astdp_output_init(struct ast_device *ast)
 	return 0;
 }
 
+/*
+ * BMC virtual Connector
+ */
+
+static int ast_bmc_connector_helper_get_modes(struct drm_connector *connector)
+{
+	return drm_add_modes_noedid(connector, 4096, 4096);
+}
+
+static const struct drm_connector_helper_funcs ast_bmc_connector_helper_funcs = {
+	.get_modes = ast_bmc_connector_helper_get_modes,
+};
+
+static const struct drm_connector_funcs ast_bmc_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static const struct drm_encoder_funcs ast_bmc_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+static int ast_bmc_output_init(struct ast_device *ast)
+{
+	struct drm_device *dev = &ast->base;
+	struct drm_crtc *crtc = &ast->crtc;
+	struct drm_encoder *encoder = &ast->output.bmc.encoder;
+	struct drm_connector *connector = &ast->output.bmc.connector;
+	int ret;
+
+
+	ret = drm_encoder_init(dev, encoder,
+				&ast_bmc_encoder_funcs,
+				DRM_MODE_ENCODER_VIRTUAL, "ast_bmc");
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	ret = drm_connector_init(dev, connector, &ast_bmc_connector_funcs,
+				 DRM_MODE_CONNECTOR_VIRTUAL);
+	if (ret)
+		return ret;
+
+	drm_connector_helper_add(connector, &ast_bmc_connector_helper_funcs);
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /*
  * Mode config
  */
@@ -1842,6 +1897,9 @@ int ast_mode_config_init(struct ast_device *ast)
 		if (ret)
 			return ret;
 	}
+	ret = ast_bmc_output_init(ast);
+	if (ret)
+		return ret;
 
 	drm_mode_config_reset(dev);
 

base-commit: b32d5a51f3c21843011d68a58e6ac0b897bce9f2
-- 
2.41.0

