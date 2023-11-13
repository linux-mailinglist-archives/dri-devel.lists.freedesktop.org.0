Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB577E98A1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 10:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB8510E15B;
	Mon, 13 Nov 2023 09:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B4510E173
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 09:14:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3CF451F853;
 Mon, 13 Nov 2023 09:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1699866885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WLVWV17RbE5adgEjh/24cuj4X1DIfXSRqeDadoL2JCk=;
 b=CSvw/1UIsYCm61cAqCqYz7nkvve6QCF2lSjSbTGj28hvJcRRD6i06XBNJwM+sWLOF6Vs0a
 yoiQlUOzPBR6T1gZc7HSuTOPMQ986dOrZumaQDQUQyfp8XR70a39UAwvCjLDdwY9JS1nLR
 6CdH+iyBhM3mhMD/SV6r0GOs0WFk/Pk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1699866885;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WLVWV17RbE5adgEjh/24cuj4X1DIfXSRqeDadoL2JCk=;
 b=q64LiQNRNieB3InDQYs3b+hdmj+FmVRbWERPkXSzLVMVFdOlbyhfLjsq9Py4E8TTbyqklX
 6h+8h7lsyRIsTKAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1213513907;
 Mon, 13 Nov 2023 09:14:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UKSFAwXpUWW0BwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Nov 2023 09:14:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, airlied@gmail.com
Subject: [PATCH 08/10] drm/ast: Add enum ast_config_mode
Date: Mon, 13 Nov 2023 09:50:30 +0100
Message-ID: <20231113091439.17181-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113091439.17181-1-tzimmermann@suse.de>
References: <20231113091439.17181-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The config mode used to be a field in struct ast_device. Turn it into
a named type. We'll need this for device detection.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 491603a13151c..b0c899f2ecfd7 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -98,6 +98,12 @@ enum ast_tx_chip {
 #define AST_TX_DP501_BIT	BIT(AST_TX_DP501)
 #define AST_TX_ASTDP_BIT	BIT(AST_TX_ASTDP)
 
+enum ast_config_mode {
+	ast_use_p2a,
+	ast_use_dt,
+	ast_use_defaults
+};
+
 #define AST_DRAM_512Mx16 0
 #define AST_DRAM_1Gx16   1
 #define AST_DRAM_512Mx32 2
@@ -185,7 +191,9 @@ struct ast_device {
 	void __iomem *ioregs;
 	void __iomem *dp501_fw_buf;
 
+	enum ast_config_mode config_mode;
 	enum ast_chip chip;
+
 	uint32_t dram_bus_width;
 	uint32_t dram_type;
 	uint32_t mclk;
@@ -224,11 +232,6 @@ struct ast_device {
 	} output;
 
 	bool support_wide_screen;
-	enum {
-		ast_use_p2a,
-		ast_use_dt,
-		ast_use_defaults
-	} config_mode;
 
 	unsigned long tx_chip_types;		/* bitfield of enum ast_chip_type */
 	u8 *dp501_fw_addr;
-- 
2.42.0

