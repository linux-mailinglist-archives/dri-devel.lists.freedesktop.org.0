Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665685F0564
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 08:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C15E10EB8D;
	Fri, 30 Sep 2022 06:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A3410EB8D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 06:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664520908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=detPd9aSS6r2WvJonCoeS+WdZ8iofwV4FknCE/O0DTU=;
 b=U1wXP5tffIP+sK7m2FvHSvaatmzv1DhBQWYU5MRTZ164DwprDS18WKJ23lnC4VFOXj0HQ6
 vFH2piDrrn2K3vhZHIK7EcsnbsqdtfR+W2onCO+VJBz4rWzpL8XuXshdmbtMr336bqf5jy
 77VLSzmwXlhCdDIV7WM2qHBmj5xy7ys=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-80-up2rZMbLM2C-kX7C0fhSPQ-1; Fri, 30 Sep 2022 02:55:06 -0400
X-MC-Unique: up2rZMbLM2C-kX7C0fhSPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13C9D85A583;
 Fri, 30 Sep 2022 06:55:06 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D62AC15BA4;
 Fri, 30 Sep 2022 06:55:05 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com
Subject: [PATCH v3] drm/ast: Add Atomic gamma lut support for aspeed
Date: Fri, 30 Sep 2022 08:54:44 +0200
Message-Id: <20220930065444.689578-1-jfalempe@redhat.com>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current ast driver only supports legacy gamma interface.
This also fixes a Gnome3/Wayland error which incorrectly adds
gamma to atomic commit:
"Page flip discarded: CRTC property (GAMMA_LUT) not found"

I only tested remotely, so I wasn't able to check that it had
an effect on the VGA output. But when activating "Night Light"
in Gnome, ast_crtc_load_lut() is called.

v2: use the same functions as mgag200.
    handle 16bits color mode.

v3: Check gamma_lut size in atomic check.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 103 +++++++++++++++++++++++++++------
 1 file changed, 86 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 214b10178454..874b356ce37a 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -49,6 +49,8 @@
 #include "ast_drv.h"
 #include "ast_tables.h"
 
+#define AST_LUT_SIZE 256
+
 static inline void ast_load_palette_index(struct ast_private *ast,
 				     u8 index, u8 red, u8 green,
 				     u8 blue)
@@ -63,20 +65,71 @@ static inline void ast_load_palette_index(struct ast_private *ast,
 	ast_io_read8(ast, AST_IO_SEQ_PORT);
 }
 
-static void ast_crtc_load_lut(struct ast_private *ast, struct drm_crtc *crtc)
+static void ast_crtc_set_gamma_linear(struct ast_private *ast,
+				      const struct drm_format_info *format)
 {
-	u16 *r, *g, *b;
 	int i;
 
-	if (!crtc->enabled)
-		return;
+	switch (format->format) {
+	case DRM_FORMAT_RGB565:
+		/* Use better interpolation, to take 32 values from 0 to 255 */
+		for (i = 0; i < AST_LUT_SIZE / 8; i++)
+			ast_load_palette_index(ast,
+					       i,
+					       i * 8 + i / 4,
+					       i * 4 + i / 16,
+					       i * 8 + i / 4);
+		/* Green has one more bit, so add padding with 0 for red and blue. */
+		for (i = AST_LUT_SIZE / 8; i < AST_LUT_SIZE / 4; i++)
+			ast_load_palette_index(ast, i, 0, i * 4 + i / 16, 0);
+		break;
+	case DRM_FORMAT_C8: /* In this case, gamma table is used as color palette */
+	case DRM_FORMAT_RGB888:
+	case DRM_FORMAT_XRGB8888:
+		for (i = 0; i < AST_LUT_SIZE; i++)
+			ast_load_palette_index(ast, i, i, i, i);
+		break;
+	default:
+		drm_warn_once(&ast->base, "Unsupported format %p4cc for gamma correction\n",
+			      &format->format);
+		break;
+	}
+}
 
-	r = crtc->gamma_store;
-	g = r + crtc->gamma_size;
-	b = g + crtc->gamma_size;
+static void ast_crtc_set_gamma(struct ast_private *ast,
+			       const struct drm_format_info *format,
+			       struct drm_color_lut *lut)
+{
+	int i;
 
-	for (i = 0; i < 256; i++)
-		ast_load_palette_index(ast, i, *r++ >> 8, *g++ >> 8, *b++ >> 8);
+	switch (format->format) {
+	case DRM_FORMAT_RGB565:
+		/* Use better interpolation, to take 32 values from lut[0] to lut[255] */
+		for (i = 0; i < AST_LUT_SIZE / 8; i++)
+			ast_load_palette_index(ast,
+					       i,
+					       lut[i * 8 + i / 4].red >> 8,
+					       lut[i * 4 + i / 16].green >> 8,
+					       lut[i * 8 + i / 4].blue >> 8);
+		/* Green has one more bit, so add padding with 0 for red and blue. */
+		for (i = AST_LUT_SIZE / 8; i < AST_LUT_SIZE / 4; i++)
+			ast_load_palette_index(ast, i, 0, lut[i * 4 + i / 16].green >> 8, 0);
+		break;
+	case DRM_FORMAT_C8: /* In this case, gamma table is used as color palette */
+	case DRM_FORMAT_RGB888:
+	case DRM_FORMAT_XRGB8888:
+		for (i = 0; i < AST_LUT_SIZE; i++)
+			ast_load_palette_index(ast,
+					       i,
+					       lut[i].red >> 8,
+					       lut[i].green >> 8,
+					       lut[i].blue >> 8);
+		break;
+	default:
+		drm_warn_once(&ast->base, "Unsupported format %p4cc for gamma correction\n",
+			      &format->format);
+		break;
+	}
 }
 
 static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
@@ -1018,9 +1071,11 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 
 			ast_set_color_reg(ast, format);
 			ast_set_vbios_color_reg(ast, format, vbios_mode_info);
+			if (crtc->state->gamma_lut)
+				ast_crtc_set_gamma(ast, format, crtc->state->gamma_lut->data);
+			else
+				ast_crtc_set_gamma_linear(ast, format);
 		}
-
-		ast_crtc_load_lut(ast, crtc);
 		break;
 	case DRM_MODE_DPMS_STANDBY:
 	case DRM_MODE_DPMS_SUSPEND:
@@ -1128,6 +1183,15 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	if (drm_WARN_ON_ONCE(dev, !format))
 		return -EINVAL; /* BUG: We didn't set format in primary check(). */
 
+	if (crtc_state->color_mgmt_changed && crtc_state->gamma_lut) {
+		if (crtc_state->gamma_lut->length !=
+		    AST_LUT_SIZE * sizeof(struct drm_color_lut)) {
+			drm_err(dev, "Wrong size for gamma_lut %zu\n",
+				crtc_state->gamma_lut->length);
+			return -EINVAL;
+		}
+	}
+
 	succ = ast_get_vbios_mode_info(format, &crtc_state->mode,
 				       &crtc_state->adjusted_mode,
 				       &ast_state->vbios_mode_info);
@@ -1158,20 +1222,23 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
-	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state,
-									      crtc);
 	struct drm_device *dev = crtc->dev;
 	struct ast_private *ast = to_ast_private(dev);
 	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
-	struct ast_crtc_state *old_ast_crtc_state = to_ast_crtc_state(old_crtc_state);
 	struct ast_vbios_mode_info *vbios_mode_info = &ast_crtc_state->vbios_mode_info;
 
 	/*
 	 * The gamma LUT has to be reloaded after changing the primary
 	 * plane's color format.
 	 */
-	if (old_ast_crtc_state->format != ast_crtc_state->format)
-		ast_crtc_load_lut(ast, crtc);
+	if (crtc_state->enable && crtc_state->color_mgmt_changed) {
+		if (crtc_state->gamma_lut)
+			ast_crtc_set_gamma(ast,
+					   ast_crtc_state->format,
+					   crtc_state->gamma_lut->data);
+		else
+			ast_crtc_set_gamma_linear(ast, ast_crtc_state->format);
+	}
 
 	//Set Aspeed Display-Port
 	if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
@@ -1309,7 +1376,9 @@ static int ast_crtc_init(struct drm_device *dev)
 	if (ret)
 		return ret;
 
-	drm_mode_crtc_set_gamma_size(crtc, 256);
+	drm_mode_crtc_set_gamma_size(crtc, AST_LUT_SIZE);
+	drm_crtc_enable_color_mgmt(crtc, 0, false, AST_LUT_SIZE);
+
 	drm_crtc_helper_add(crtc, &ast_crtc_helper_funcs);
 
 	return 0;
-- 
2.37.3

