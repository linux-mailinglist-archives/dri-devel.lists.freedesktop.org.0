Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1431D91AB7D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDE610EAED;
	Thu, 27 Jun 2024 15:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E7410EAED
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 15:36:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EC9E521BF9;
 Thu, 27 Jun 2024 15:36:42 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B7B9E13AC4;
 Thu, 27 Jun 2024 15:36:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eNONKwqHfWbmCgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jun 2024 15:36:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/8] drm/ast: Implement atomic enable/disable for encoders
Date: Thu, 27 Jun 2024 17:27:46 +0200
Message-ID: <20240627153638.8765-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627153638.8765-1-tzimmermann@suse.de>
References: <20240627153638.8765-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: EC9E521BF9
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The CRTC helpers contain code to enable and disable DisplayPort
connectors. Implement this functionality in the respective connector's
atomic_enable/atomic_disable callbacks. DRM's atomic-modesetting
helpers will call the functions as part of the atomic commit.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 66 +++++++++++++++++++++++++---------
 1 file changed, 50 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 2fd9c78eab73..7f9f77b7ee73 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1034,14 +1034,6 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 	case DRM_MODE_DPMS_ON:
 		ast_set_index_reg_mask(ast, AST_IO_VGASRI,  0x01, 0xdf, 0);
 		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, 0);
-		if (ast->tx_chip_types & AST_TX_DP501_BIT)
-			ast_set_dp501_video_output(crtc->dev, 1);
-
-		if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
-			ast_dp_power_on_off(crtc->dev, AST_DP_POWER_ON);
-			ast_wait_for_vretrace(ast);
-			ast_dp_set_on_off(crtc->dev, 1);
-		}
 
 		ast_state = to_ast_crtc_state(crtc->state);
 		format = ast_state->format;
@@ -1061,14 +1053,6 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 	case DRM_MODE_DPMS_SUSPEND:
 	case DRM_MODE_DPMS_OFF:
 		ch = mode;
-		if (ast->tx_chip_types & AST_TX_DP501_BIT)
-			ast_set_dp501_video_output(crtc->dev, 0);
-
-		if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
-			ast_dp_set_on_off(crtc->dev, 0);
-			ast_dp_power_on_off(crtc->dev, AST_DP_POWER_OFF);
-		}
-
 		ast_set_index_reg_mask(ast, AST_IO_VGASRI,  0x01, 0xdf, 0x20);
 		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, ch);
 		break;
@@ -1521,6 +1505,27 @@ static const struct drm_encoder_funcs ast_dp501_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
+static void ast_dp501_encoder_helper_atomic_enable(struct drm_encoder *encoder,
+						   struct drm_atomic_state *state)
+{
+	struct drm_device *dev = encoder->dev;
+
+	ast_set_dp501_video_output(dev, 1);
+}
+
+static void ast_dp501_encoder_helper_atomic_disable(struct drm_encoder *encoder,
+						    struct drm_atomic_state *state)
+{
+	struct drm_device *dev = encoder->dev;
+
+	ast_set_dp501_video_output(dev, 0);
+}
+
+static const struct drm_encoder_helper_funcs ast_dp501_encoder_helper_funcs = {
+	.atomic_enable = ast_dp501_encoder_helper_atomic_enable,
+	.atomic_disable = ast_dp501_encoder_helper_atomic_disable,
+};
+
 /*
  * DP501 Connector
  */
@@ -1607,6 +1612,8 @@ static int ast_dp501_output_init(struct ast_device *ast)
 			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret)
 		return ret;
+	drm_encoder_helper_add(encoder, &ast_dp501_encoder_helper_funcs);
+
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
 	ret = ast_dp501_connector_init(dev, connector);
@@ -1628,6 +1635,31 @@ static const struct drm_encoder_funcs ast_astdp_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
+static void ast_astdp_encoder_helper_atomic_enable(struct drm_encoder *encoder,
+						   struct drm_atomic_state *state)
+{
+	struct drm_device *dev = encoder->dev;
+	struct ast_device *ast = to_ast_device(dev);
+
+	ast_dp_power_on_off(dev, AST_DP_POWER_ON);
+	ast_wait_for_vretrace(ast);
+	ast_dp_set_on_off(dev, 1);
+}
+
+static void ast_astdp_encoder_helper_atomic_disable(struct drm_encoder *encoder,
+						    struct drm_atomic_state *state)
+{
+	struct drm_device *dev = encoder->dev;
+
+	ast_dp_set_on_off(dev, 0);
+	ast_dp_power_on_off(dev, AST_DP_POWER_OFF);
+}
+
+static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
+	.atomic_enable = ast_astdp_encoder_helper_atomic_enable,
+	.atomic_disable = ast_astdp_encoder_helper_atomic_disable,
+};
+
 /*
  * ASPEED Display-Port Connector
  */
@@ -1726,6 +1758,8 @@ static int ast_astdp_output_init(struct ast_device *ast)
 			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret)
 		return ret;
+	drm_encoder_helper_add(encoder, &ast_astdp_encoder_helper_funcs);
+
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
 	ret = ast_astdp_connector_init(dev, connector);
-- 
2.45.2

