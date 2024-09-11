Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A31975133
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 13:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EAE10E9D7;
	Wed, 11 Sep 2024 11:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="J71OJA1h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="djhUYuC7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="J71OJA1h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="djhUYuC7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA51F10E9C7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 11:53:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9F82E21AA0;
 Wed, 11 Sep 2024 11:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726055631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lbetA6WqES5JHjDBCRnncKlI/ZJniYqFM2ibgt9DZk8=;
 b=J71OJA1hyAV/W47r1S9kA8KpXOKb0k+jH6HWPej8+nslle/0Vnk3s6Merkd00k50SD7pYu
 228HUy+QcmH9ZZsC3KoVYGusKz7CyXGj9S3LADNAClXxEX5iX2CrNIyoUl3EWdirWAHF32
 SbaA8GVjZhVJ0OieKo5/bgh0UAWZguA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726055631;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lbetA6WqES5JHjDBCRnncKlI/ZJniYqFM2ibgt9DZk8=;
 b=djhUYuC7xozm0jzmvO3KBrtKYIDw5kOLr8Khal9nXCPNLr4nM4FrkAPc9stH9PkT88quyE
 WO1ZT9zo4LZQNtCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726055631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lbetA6WqES5JHjDBCRnncKlI/ZJniYqFM2ibgt9DZk8=;
 b=J71OJA1hyAV/W47r1S9kA8KpXOKb0k+jH6HWPej8+nslle/0Vnk3s6Merkd00k50SD7pYu
 228HUy+QcmH9ZZsC3KoVYGusKz7CyXGj9S3LADNAClXxEX5iX2CrNIyoUl3EWdirWAHF32
 SbaA8GVjZhVJ0OieKo5/bgh0UAWZguA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726055631;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lbetA6WqES5JHjDBCRnncKlI/ZJniYqFM2ibgt9DZk8=;
 b=djhUYuC7xozm0jzmvO3KBrtKYIDw5kOLr8Khal9nXCPNLr4nM4FrkAPc9stH9PkT88quyE
 WO1ZT9zo4LZQNtCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E0A713A7C;
 Wed, 11 Sep 2024 11:53:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aLJ7Gc+E4WbGIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Sep 2024 11:53:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 02/10] drm/ast: astdp: Avoid upcasting to struct ast_device
Date: Wed, 11 Sep 2024 13:51:20 +0200
Message-ID: <20240911115347.899148-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911115347.899148-1-tzimmermann@suse.de>
References: <20240911115347.899148-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
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

Several functions receive an instance of struct drm_device only to
upcast it to struct ast_device. Improve type safety by passing the
AST device directly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index dab73dc6cb87..2b5129c6f8b0 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -158,9 +158,8 @@ static bool ast_dp_power_is_on(struct ast_device *ast)
 	return !(vgacre3 & AST_DP_PHY_SLEEP);
 }
 
-static void ast_dp_power_on_off(struct drm_device *dev, bool on)
+static void ast_dp_power_on_off(struct ast_device *ast, bool on)
 {
-	struct ast_device *ast = to_ast_device(dev);
 	// Read and Turn off DP PHY sleep
 	u8 bE3 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE3, AST_DP_VIDEO_ENABLE);
 
@@ -192,9 +191,8 @@ static void ast_dp_link_training(struct ast_device *ast)
 	drm_err(dev, "Link training failed\n");
 }
 
-static void ast_dp_set_on_off(struct drm_device *dev, bool on)
+static void ast_dp_set_on_off(struct ast_device *ast, bool on)
 {
-	struct ast_device *ast = to_ast_device(dev);
 	u8 video_on_off = on;
 	u32 i = 0;
 
@@ -317,26 +315,25 @@ static void ast_astdp_encoder_helper_atomic_mode_set(struct drm_encoder *encoder
 static void ast_astdp_encoder_helper_atomic_enable(struct drm_encoder *encoder,
 						   struct drm_atomic_state *state)
 {
-	struct drm_device *dev = encoder->dev;
-	struct ast_device *ast = to_ast_device(dev);
+	struct ast_device *ast = to_ast_device(encoder->dev);
 	struct ast_connector *ast_connector = &ast->output.astdp.connector;
 
 	if (ast_connector->physical_status == connector_status_connected) {
-		ast_dp_power_on_off(dev, AST_DP_POWER_ON);
+		ast_dp_power_on_off(ast, AST_DP_POWER_ON);
 		ast_dp_link_training(ast);
 
 		ast_wait_for_vretrace(ast);
-		ast_dp_set_on_off(dev, 1);
+		ast_dp_set_on_off(ast, 1);
 	}
 }
 
 static void ast_astdp_encoder_helper_atomic_disable(struct drm_encoder *encoder,
 						    struct drm_atomic_state *state)
 {
-	struct drm_device *dev = encoder->dev;
+	struct ast_device *ast = to_ast_device(encoder->dev);
 
-	ast_dp_set_on_off(dev, 0);
-	ast_dp_power_on_off(dev, AST_DP_POWER_OFF);
+	ast_dp_set_on_off(ast, 0);
+	ast_dp_power_on_off(ast, AST_DP_POWER_OFF);
 }
 
 static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
@@ -383,7 +380,6 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
 						 bool force)
 {
 	struct ast_connector *ast_connector = to_ast_connector(connector);
-	struct drm_device *dev = connector->dev;
 	struct ast_device *ast = to_ast_device(connector->dev);
 	enum drm_connector_status status = connector_status_disconnected;
 	bool power_is_on;
@@ -392,13 +388,13 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
 
 	power_is_on = ast_dp_power_is_on(ast);
 	if (!power_is_on)
-		ast_dp_power_on_off(dev, true);
+		ast_dp_power_on_off(ast, true);
 
 	if (ast_astdp_is_connected(ast))
 		status = connector_status_connected;
 
 	if (!power_is_on && status == connector_status_disconnected)
-		ast_dp_power_on_off(dev, false);
+		ast_dp_power_on_off(ast, false);
 
 	mutex_unlock(&ast->modeset_lock);
 
-- 
2.46.0

