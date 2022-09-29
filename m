Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB135EF0DB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 10:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C864D10E9E5;
	Thu, 29 Sep 2022 08:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECB210E9E5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 08:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664441426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=beW0Hkme/U2SUxgF06TlOpERYlFOrbQewybs7yh0ftM=;
 b=HYDhbW/tkwr4RReBYR/nCuUkOAtA3qSCxlDwjNoZf1GjeV2xEIpMJuK+A9OfzlZPAkuEGR
 2L1kFY52aHmRebFtTuXN3JBI4SuU9W+FW3Ba9umyLWJZchTVQGnkA/eXwMM9EVsU6neHAE
 Poue26iWdj9ATqopQ21aGfZ8DW39yUc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-KDTNF1PZN0yWoD6aFNGrtA-1; Thu, 29 Sep 2022 04:50:22 -0400
X-MC-Unique: KDTNF1PZN0yWoD6aFNGrtA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70DA1101CC6D;
 Thu, 29 Sep 2022 08:50:22 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0D1F2166B26;
 Thu, 29 Sep 2022 08:50:21 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com
Subject: [PATCH] drm/ast: Add Atomic gamma lut support for aspeed
Date: Thu, 29 Sep 2022 10:50:05 +0200
Message-Id: <20220929085005.300409-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 35 +++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 214b10178454..0561fd7e7bb2 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -63,20 +63,23 @@ static inline void ast_load_palette_index(struct ast_private *ast,
 	ast_io_read8(ast, AST_IO_SEQ_PORT);
 }
 
-static void ast_crtc_load_lut(struct ast_private *ast, struct drm_crtc *crtc)
+static void ast_crtc_load_lut(struct ast_private *ast, struct drm_crtc_state *state)
 {
-	u16 *r, *g, *b;
 	int i;
 
-	if (!crtc->enabled)
-		return;
-
-	r = crtc->gamma_store;
-	g = r + crtc->gamma_size;
-	b = g + crtc->gamma_size;
+	if (state->gamma_lut) {
+		struct drm_color_lut *lut = (struct drm_color_lut *)state->gamma_lut->data;
 
-	for (i = 0; i < 256; i++)
-		ast_load_palette_index(ast, i, *r++ >> 8, *g++ >> 8, *b++ >> 8);
+		for (i = 0; i < 256; i++)
+			ast_load_palette_index(ast,
+				i,
+				lut[i].red >> 8,
+				lut[i].green >> 8,
+				lut[i].blue >> 8);
+	} else {
+		for (i = 0; i < 256; i++)
+			ast_load_palette_index(ast, i, i, i, i);
+	}
 }
 
 static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
@@ -1019,8 +1022,7 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 			ast_set_color_reg(ast, format);
 			ast_set_vbios_color_reg(ast, format, vbios_mode_info);
 		}
-
-		ast_crtc_load_lut(ast, crtc);
+		ast_crtc_load_lut(ast, crtc->state);
 		break;
 	case DRM_MODE_DPMS_STANDBY:
 	case DRM_MODE_DPMS_SUSPEND:
@@ -1158,20 +1160,17 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
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
+	if (crtc_state->enable && crtc_state->color_mgmt_changed)
+		ast_crtc_load_lut(ast, crtc_state);
 
 	//Set Aspeed Display-Port
 	if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
@@ -1310,6 +1309,8 @@ static int ast_crtc_init(struct drm_device *dev)
 		return ret;
 
 	drm_mode_crtc_set_gamma_size(crtc, 256);
+	drm_crtc_enable_color_mgmt(crtc, 0, false, 256);
+
 	drm_crtc_helper_add(crtc, &ast_crtc_helper_funcs);
 
 	return 0;
-- 
2.37.3

