Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4494F53F97A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 11:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE6312AEDF;
	Tue,  7 Jun 2022 09:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D55512AEDF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 09:20:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D21591F956;
 Tue,  7 Jun 2022 09:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654593609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xuFtKdv09BShV4IxvEABerYKt2sb1OwIjZAWblpbyEs=;
 b=cwbPvw+Kzf0CRoKEDKUc3sJKf0HPs6+GFtiqhTGhF/cN+VvESdqmghso8DoC1A8pEsWUPA
 uRG9m/vOAe5/SK4AJWIv7cjGe1xTguKWKG69zQZ2sGb2VUhGpDQJeCSF88Gkr2nHJCXTaO
 79dsR2tRhKbgstjdNNl8Sz2CK1aInWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654593609;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xuFtKdv09BShV4IxvEABerYKt2sb1OwIjZAWblpbyEs=;
 b=EnxR1bF84aGHJ/b7xT5xk7ZOrBuNEe6C37XwyIUt50URyesllh8fYXqejM7QpQlnlAwMKw
 Pfaku8UhsTWu1PBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9FC1213B40;
 Tue,  7 Jun 2022 09:20:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8I82JkkYn2JwLwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Jun 2022 09:20:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, kuohsiang_chou@aspeedtech.com, airlied@linux.ie,
 patrik.r.jakobsson@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v3 1/5] drm/ast: Support multiple outputs
Date: Tue,  7 Jun 2022 11:20:04 +0200
Message-Id: <20220607092008.22123-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607092008.22123-1-tzimmermann@suse.de>
References: <20220607092008.22123-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Systems with AST graphics can have multiple output; typically VGA
plus some other port. Record detected output chips in a bitmask and
initialize each output on its own.

Assume a VGA output by default and use SIL164 and DP501 if available.
For ASTDP assume that it can run in parallel with VGA.

Tested on AST2100.

v3:
	* define a macro for each BIT(ast_tx_chip) (Patrik)
v2:
	* make VGA/SIL164/DP501 mutually exclusive

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Fixes: a59b026419f3 ("drm/ast: Initialize encoder and connector for VGA in helper function")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/ast/ast_dp.c    |  5 ++---
 drivers/gpu/drm/ast/ast_dp501.c |  2 +-
 drivers/gpu/drm/ast/ast_drv.h   |  9 ++++++--
 drivers/gpu/drm/ast/ast_main.c  | 21 ++++++++----------
 drivers/gpu/drm/ast/ast_mode.c  | 38 ++++++++++++++++++---------------
 drivers/gpu/drm/ast/ast_post.c  |  2 +-
 6 files changed, 41 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 4551bc8a3ecf..f573d582407e 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -160,13 +160,12 @@ void ast_dp_launch(struct drm_device *dev, u8 bPower)
 		}
 
 		if (bDPExecute)
-			ast->tx_chip_type = AST_TX_ASTDP;
+			ast->tx_chip_types |= BIT(AST_TX_ASTDP);
 
 		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE5,
 							(u8) ~ASTDP_HOST_EDID_READ_DONE_MASK,
 							ASTDP_HOST_EDID_READ_DONE);
-	} else
-		ast->tx_chip_type = AST_TX_NONE;
+	}
 }
 
 
diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index 204c926a18ea..4f75a9efb610 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -450,7 +450,7 @@ void ast_init_3rdtx(struct drm_device *dev)
 			ast_init_dvo(dev);
 			break;
 		default:
-			if (ast->tx_chip_type == AST_TX_SIL164)
+			if (ast->tx_chip_types & BIT(AST_TX_SIL164))
 				ast_init_dvo(dev);
 			else
 				ast_init_analog(dev);
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index afebe35f205e..a34db4380f68 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -73,6 +73,11 @@ enum ast_tx_chip {
 	AST_TX_ASTDP,
 };
 
+#define AST_TX_NONE_BIT		BIT(AST_TX_NONE)
+#define AST_TX_SIL164_BIT	BIT(AST_TX_SIL164)
+#define AST_TX_DP501_BIT	BIT(AST_TX_DP501)
+#define AST_TX_ASTDP_BIT	BIT(AST_TX_ASTDP)
+
 #define AST_DRAM_512Mx16 0
 #define AST_DRAM_1Gx16   1
 #define AST_DRAM_512Mx32 2
@@ -173,7 +178,7 @@ struct ast_private {
 	struct drm_plane primary_plane;
 	struct ast_cursor_plane cursor_plane;
 	struct drm_crtc crtc;
-	union {
+	struct {
 		struct {
 			struct drm_encoder encoder;
 			struct ast_vga_connector vga_connector;
@@ -199,7 +204,7 @@ struct ast_private {
 		ast_use_defaults
 	} config_mode;
 
-	enum ast_tx_chip tx_chip_type;
+	unsigned long tx_chip_types;		/* bitfield of enum ast_chip_type */
 	u8 *dp501_fw_addr;
 	const struct firmware *dp501_fw;	/* dp501 fw */
 };
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index d770d5a23c1a..067453266897 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -216,7 +216,7 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 	}
 
 	/* Check 3rd Tx option (digital output afaik) */
-	ast->tx_chip_type = AST_TX_NONE;
+	ast->tx_chip_types |= AST_TX_NONE_BIT;
 
 	/*
 	 * VGACRA3 Enhanced Color Mode Register, check if DVO is already
@@ -229,7 +229,7 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 	if (!*need_post) {
 		jreg = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xa3, 0xff);
 		if (jreg & 0x80)
-			ast->tx_chip_type = AST_TX_SIL164;
+			ast->tx_chip_types = AST_TX_SIL164_BIT;
 	}
 
 	if ((ast->chip == AST2300) || (ast->chip == AST2400) || (ast->chip == AST2500)) {
@@ -241,7 +241,7 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 		jreg = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd1, 0xff);
 		switch (jreg) {
 		case 0x04:
-			ast->tx_chip_type = AST_TX_SIL164;
+			ast->tx_chip_types = AST_TX_SIL164_BIT;
 			break;
 		case 0x08:
 			ast->dp501_fw_addr = drmm_kzalloc(dev, 32*1024, GFP_KERNEL);
@@ -254,22 +254,19 @@ static int ast_detect_chip(struct drm_device *dev, bool *need_post)
 			}
 			fallthrough;
 		case 0x0c:
-			ast->tx_chip_type = AST_TX_DP501;
+			ast->tx_chip_types = AST_TX_DP501_BIT;
 		}
 	} else if (ast->chip == AST2600)
 		ast_dp_launch(&ast->base, 0);
 
 	/* Print stuff for diagnostic purposes */
-	switch(ast->tx_chip_type) {
-	case AST_TX_SIL164:
+	if (ast->tx_chip_types & AST_TX_NONE_BIT)
+		drm_info(dev, "Using analog VGA\n");
+	if (ast->tx_chip_types & AST_TX_SIL164_BIT)
 		drm_info(dev, "Using Sil164 TMDS transmitter\n");
-		break;
-	case AST_TX_DP501:
+	if (ast->tx_chip_types & AST_TX_DP501_BIT)
 		drm_info(dev, "Using DP501 DisplayPort transmitter\n");
-		break;
-	default:
-		drm_info(dev, "Analog VGA only\n");
-	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 323af2746aa9..db2010a55674 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -997,10 +997,10 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 	case DRM_MODE_DPMS_ON:
 		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT,  0x01, 0xdf, 0);
 		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0xfc, 0);
-		if (ast->tx_chip_type == AST_TX_DP501)
+		if (ast->tx_chip_types & AST_TX_DP501_BIT)
 			ast_set_dp501_video_output(crtc->dev, 1);
 
-		if (ast->tx_chip_type == AST_TX_ASTDP) {
+		if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
 			ast_dp_power_on_off(crtc->dev, AST_DP_POWER_ON);
 			ast_wait_for_vretrace(ast);
 			ast_dp_set_on_off(crtc->dev, 1);
@@ -1012,17 +1012,17 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 	case DRM_MODE_DPMS_SUSPEND:
 	case DRM_MODE_DPMS_OFF:
 		ch = mode;
-		if (ast->tx_chip_type == AST_TX_DP501)
+		if (ast->tx_chip_types & AST_TX_DP501_BIT)
 			ast_set_dp501_video_output(crtc->dev, 0);
-		break;
 
-		if (ast->tx_chip_type == AST_TX_ASTDP) {
+		if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
 			ast_dp_set_on_off(crtc->dev, 0);
 			ast_dp_power_on_off(crtc->dev, AST_DP_POWER_OFF);
 		}
 
 		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT,  0x01, 0xdf, 0x20);
 		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0xfc, ch);
+		break;
 	}
 }
 
@@ -1155,7 +1155,7 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 		ast_crtc_load_lut(ast, crtc);
 
 	//Set Aspeed Display-Port
-	if (ast->tx_chip_type == AST_TX_ASTDP)
+	if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
 		ast_dp_set_mode(crtc, vbios_mode_info);
 
 	mutex_unlock(&ast->ioregs_lock);
@@ -1739,22 +1739,26 @@ int ast_mode_config_init(struct ast_private *ast)
 
 	ast_crtc_init(dev);
 
-	switch (ast->tx_chip_type) {
-	case AST_TX_NONE:
+	if (ast->tx_chip_types & AST_TX_NONE_BIT) {
 		ret = ast_vga_output_init(ast);
-		break;
-	case AST_TX_SIL164:
+		if (ret)
+			return ret;
+	}
+	if (ast->tx_chip_types & AST_TX_SIL164_BIT) {
 		ret = ast_sil164_output_init(ast);
-		break;
-	case AST_TX_DP501:
+		if (ret)
+			return ret;
+	}
+	if (ast->tx_chip_types & AST_TX_DP501_BIT) {
 		ret = ast_dp501_output_init(ast);
-		break;
-	case AST_TX_ASTDP:
+		if (ret)
+			return ret;
+	}
+	if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
 		ret = ast_astdp_output_init(ast);
-		break;
+		if (ret)
+			return ret;
 	}
-	if (ret)
-		return ret;
 
 	drm_mode_config_reset(dev);
 
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 0aa9cf0fb5c3..82fd3c8adee1 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -391,7 +391,7 @@ void ast_post_gpu(struct drm_device *dev)
 
 		ast_init_3rdtx(dev);
 	} else {
-		if (ast->tx_chip_type != AST_TX_NONE)
+		if (ast->tx_chip_types & AST_TX_SIL164_BIT)
 			ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xa3, 0xcf, 0x80);	/* Enable DVO */
 	}
 }
-- 
2.36.1

