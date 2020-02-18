Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0881622A3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 09:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420F06E9C0;
	Tue, 18 Feb 2020 08:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22A16E9BB;
 Tue, 18 Feb 2020 08:48:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 52259AD68;
 Tue, 18 Feb 2020 08:48:20 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, alexander.deucher@amd.com, emil.velikov@collabora.com
Subject: [PATCH v2 2/4] drm/ast: Use simple encoder
Date: Tue, 18 Feb 2020 09:48:13 +0100
Message-Id: <20200218084815.2137-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200218084815.2137-1-tzimmermann@suse.de>
References: <20200218084815.2137-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: spice-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ast driver uses an empty implementation for its encoder. Replace
the code with the generic simple encoder.

v2:
	* rebase onto new simple-encoder interface

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  6 +-----
 drivers/gpu/drm/ast/ast_mode.c | 25 ++++++++-----------------
 2 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index f5d8780776ae..656d591b154b 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -121,6 +121,7 @@ struct ast_private {
 		unsigned int next_index;
 	} cursor;
 
+	struct drm_encoder encoder;
 	struct drm_plane primary_plane;
 	struct drm_plane cursor_plane;
 
@@ -238,13 +239,8 @@ struct ast_crtc {
 	u8 offset_x, offset_y;
 };
 
-struct ast_encoder {
-	struct drm_encoder base;
-};
-
 #define to_ast_crtc(x) container_of(x, struct ast_crtc, base)
 #define to_ast_connector(x) container_of(x, struct ast_connector, base)
-#define to_ast_encoder(x) container_of(x, struct ast_encoder, base)
 
 struct ast_vbios_stdtable {
 	u8 misc;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 562ea6d9df13..7a9f20a2fd30 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -40,6 +40,7 @@
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "ast_drv.h"
 #include "ast_tables.h"
@@ -968,28 +969,18 @@ static int ast_crtc_init(struct drm_device *dev)
  * Encoder
  */
 
-static void ast_encoder_destroy(struct drm_encoder *encoder)
-{
-	drm_encoder_cleanup(encoder);
-	kfree(encoder);
-}
-
-static const struct drm_encoder_funcs ast_enc_funcs = {
-	.destroy = ast_encoder_destroy,
-};
-
 static int ast_encoder_init(struct drm_device *dev)
 {
-	struct ast_encoder *ast_encoder;
+	struct ast_private *ast = dev->dev_private;
+	struct drm_encoder *encoder = &ast->encoder;
+	int ret;
 
-	ast_encoder = kzalloc(sizeof(struct ast_encoder), GFP_KERNEL);
-	if (!ast_encoder)
-		return -ENOMEM;
+	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
+	if (ret)
+		return ret;
 
-	drm_encoder_init(dev, &ast_encoder->base, &ast_enc_funcs,
-			 DRM_MODE_ENCODER_DAC, NULL);
+	encoder->possible_crtcs = 1;
 
-	ast_encoder->base.possible_crtcs = 1;
 	return 0;
 }
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
