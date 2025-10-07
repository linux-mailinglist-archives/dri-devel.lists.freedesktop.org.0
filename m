Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D75BC1DC6
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4029F10E6CB;
	Tue,  7 Oct 2025 15:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gBgQAL0O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nzlvfSpi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gBgQAL0O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nzlvfSpi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA1710E6CE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:06:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4192E3371F;
 Tue,  7 Oct 2025 15:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759849590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CWrVtRs1NpvCFiAU/4VbbiKD1Jn7OiTi85PH/ejOwJw=;
 b=gBgQAL0OjOo5j1KcjxxlMk3e/tY7H8SRU2O9j5RANtVJJ7qt8d6DFLIKk5LQ1Ev35oapm+
 dT8SdSKgr6pgvRjcGISQv5WwqSybvhkRPy+bNibRocvCTSFpKTRyo6XwKDXng8ygYsixHw
 YosDUI6C8AAjh+Bu3nikJYfZgdoew9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759849590;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CWrVtRs1NpvCFiAU/4VbbiKD1Jn7OiTi85PH/ejOwJw=;
 b=nzlvfSpiFvZORVoKkWOsfl71TlPBnpM94qSGb07p6xWcPyKvcwEhBH7UgUihK6tUajWUiC
 T3qWkNRbTMMrFEBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759849590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CWrVtRs1NpvCFiAU/4VbbiKD1Jn7OiTi85PH/ejOwJw=;
 b=gBgQAL0OjOo5j1KcjxxlMk3e/tY7H8SRU2O9j5RANtVJJ7qt8d6DFLIKk5LQ1Ev35oapm+
 dT8SdSKgr6pgvRjcGISQv5WwqSybvhkRPy+bNibRocvCTSFpKTRyo6XwKDXng8ygYsixHw
 YosDUI6C8AAjh+Bu3nikJYfZgdoew9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759849590;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CWrVtRs1NpvCFiAU/4VbbiKD1Jn7OiTi85PH/ejOwJw=;
 b=nzlvfSpiFvZORVoKkWOsfl71TlPBnpM94qSGb07p6xWcPyKvcwEhBH7UgUihK6tUajWUiC
 T3qWkNRbTMMrFEBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1F23B13693;
 Tue,  7 Oct 2025 15:06:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SG0wBnYs5Wh1SAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Oct 2025 15:06:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/5] drm/ast: Store CRTC memory request threshold in device
 quirks
Date: Tue,  7 Oct 2025 16:54:44 +0200
Message-ID: <20251007150343.273718-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007150343.273718-1-tzimmermann@suse.de>
References: <20251007150343.273718-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80
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

Store each hardware's CRTC memory threshold in the specific instance
of struct ast_device_quirks. Removes the calls to IS_AST_GENn() from
ast_set_crtthd_reg().

The values stored in the registers appear to be plain limits. Hence
write them in the driver in decimal format instead of hexadecimal.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_2000.c |  2 ++
 drivers/gpu/drm/ast/ast_2100.c |  2 ++
 drivers/gpu/drm/ast/ast_2200.c |  2 ++
 drivers/gpu/drm/ast/ast_2300.c |  2 ++
 drivers/gpu/drm/ast/ast_2400.c |  2 ++
 drivers/gpu/drm/ast/ast_2500.c |  2 ++
 drivers/gpu/drm/ast/ast_2600.c |  2 ++
 drivers/gpu/drm/ast/ast_drv.h  |  5 +++++
 drivers/gpu/drm/ast/ast_mode.c | 19 +++++--------------
 9 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
index ae4d7a2a0ec8..fa3bc23ce098 100644
--- a/drivers/gpu/drm/ast/ast_2000.c
+++ b/drivers/gpu/drm/ast/ast_2000.c
@@ -212,6 +212,8 @@ void ast_2000_detect_tx_chip(struct ast_device *ast, bool need_post)
 }
 
 static const struct ast_device_quirks ast_2000_device_quirks = {
+	.crtc_mem_req_threshold_low = 31,
+	.crtc_mem_req_threshold_high = 47,
 };
 
 struct drm_device *ast_2000_device_create(struct pci_dev *pdev,
diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
index 01e064e67cf7..05aeb0624d41 100644
--- a/drivers/gpu/drm/ast/ast_2100.c
+++ b/drivers/gpu/drm/ast/ast_2100.c
@@ -433,6 +433,8 @@ static void ast_2100_detect_widescreen(struct ast_device *ast)
 }
 
 static const struct ast_device_quirks ast_2100_device_quirks = {
+	.crtc_mem_req_threshold_low = 47,
+	.crtc_mem_req_threshold_high = 63,
 };
 
 struct drm_device *ast_2100_device_create(struct pci_dev *pdev,
diff --git a/drivers/gpu/drm/ast/ast_2200.c b/drivers/gpu/drm/ast/ast_2200.c
index 46b6fc6cf7eb..b64345d11ffa 100644
--- a/drivers/gpu/drm/ast/ast_2200.c
+++ b/drivers/gpu/drm/ast/ast_2200.c
@@ -44,6 +44,8 @@ static void ast_2200_detect_widescreen(struct ast_device *ast)
 }
 
 static const struct ast_device_quirks ast_2200_device_quirks = {
+	.crtc_mem_req_threshold_low = 47,
+	.crtc_mem_req_threshold_high = 63,
 };
 
 struct drm_device *ast_2200_device_create(struct pci_dev *pdev,
diff --git a/drivers/gpu/drm/ast/ast_2300.c b/drivers/gpu/drm/ast/ast_2300.c
index b76a80d6aea6..5f50d9f91ffd 100644
--- a/drivers/gpu/drm/ast/ast_2300.c
+++ b/drivers/gpu/drm/ast/ast_2300.c
@@ -1408,6 +1408,8 @@ static void ast_2300_detect_widescreen(struct ast_device *ast)
 }
 
 static const struct ast_device_quirks ast_2300_device_quirks = {
+	.crtc_mem_req_threshold_low = 96,
+	.crtc_mem_req_threshold_high = 120,
 };
 
 struct drm_device *ast_2300_device_create(struct pci_dev *pdev,
diff --git a/drivers/gpu/drm/ast/ast_2400.c b/drivers/gpu/drm/ast/ast_2400.c
index 2b41ff69ab0b..2e6befd24f91 100644
--- a/drivers/gpu/drm/ast/ast_2400.c
+++ b/drivers/gpu/drm/ast/ast_2400.c
@@ -45,6 +45,8 @@ static void ast_2400_detect_widescreen(struct ast_device *ast)
 }
 
 static const struct ast_device_quirks ast_2400_device_quirks = {
+	.crtc_mem_req_threshold_low = 96,
+	.crtc_mem_req_threshold_high = 120,
 };
 
 struct drm_device *ast_2400_device_create(struct pci_dev *pdev,
diff --git a/drivers/gpu/drm/ast/ast_2500.c b/drivers/gpu/drm/ast/ast_2500.c
index 6d305a8ccc51..416bce9ea757 100644
--- a/drivers/gpu/drm/ast/ast_2500.c
+++ b/drivers/gpu/drm/ast/ast_2500.c
@@ -619,6 +619,8 @@ static void ast_2500_detect_widescreen(struct ast_device *ast)
 }
 
 static const struct ast_device_quirks ast_2500_device_quirks = {
+	.crtc_mem_req_threshold_low = 96,
+	.crtc_mem_req_threshold_high = 120,
 };
 
 struct drm_device *ast_2500_device_create(struct pci_dev *pdev,
diff --git a/drivers/gpu/drm/ast/ast_2600.c b/drivers/gpu/drm/ast/ast_2600.c
index df3b429e8174..bb0a50b25766 100644
--- a/drivers/gpu/drm/ast/ast_2600.c
+++ b/drivers/gpu/drm/ast/ast_2600.c
@@ -60,6 +60,8 @@ static void ast_2600_detect_widescreen(struct ast_device *ast)
 }
 
 static const struct ast_device_quirks ast_2600_device_quirks = {
+	.crtc_mem_req_threshold_low = 160,
+	.crtc_mem_req_threshold_high = 224,
 };
 
 struct drm_device *ast_2600_device_create(struct pci_dev *pdev,
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 2a2c28693dc6..926e1c7de6f8 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -165,6 +165,11 @@ to_ast_connector(struct drm_connector *connector)
  */
 
 struct ast_device_quirks {
+	/*
+	 * CRTC memory request threshold
+	 */
+	unsigned char crtc_mem_req_threshold_low;
+	unsigned char crtc_mem_req_threshold_high;
 };
 
 struct ast_device {
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index a9ffda1b1dea..da374af9596d 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -410,20 +410,11 @@ static void ast_set_color_reg(struct ast_device *ast,
 
 static void ast_set_crtthd_reg(struct ast_device *ast)
 {
-	/* Set Threshold */
-	if (IS_AST_GEN7(ast)) {
-		ast_set_index_reg(ast, AST_IO_VGACRI, 0xa7, 0xe0);
-		ast_set_index_reg(ast, AST_IO_VGACRI, 0xa6, 0xa0);
-	} else if (IS_AST_GEN6(ast) || IS_AST_GEN5(ast) || IS_AST_GEN4(ast)) {
-		ast_set_index_reg(ast, AST_IO_VGACRI, 0xa7, 0x78);
-		ast_set_index_reg(ast, AST_IO_VGACRI, 0xa6, 0x60);
-	} else if (IS_AST_GEN3(ast) || IS_AST_GEN2(ast)) {
-		ast_set_index_reg(ast, AST_IO_VGACRI, 0xa7, 0x3f);
-		ast_set_index_reg(ast, AST_IO_VGACRI, 0xa6, 0x2f);
-	} else {
-		ast_set_index_reg(ast, AST_IO_VGACRI, 0xa7, 0x2f);
-		ast_set_index_reg(ast, AST_IO_VGACRI, 0xa6, 0x1f);
-	}
+	u8 vgacra6 = ast->quirks->crtc_mem_req_threshold_low;
+	u8 vgacra7 = ast->quirks->crtc_mem_req_threshold_high;
+
+	ast_set_index_reg(ast, AST_IO_VGACRI, 0xa7, vgacra7);
+	ast_set_index_reg(ast, AST_IO_VGACRI, 0xa6, vgacra6);
 }
 
 static void ast_set_sync_reg(struct ast_device *ast,
-- 
2.51.0

