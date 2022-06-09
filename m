Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 284DF5444A8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 09:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3F2113DB5;
	Thu,  9 Jun 2022 07:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9C9113F33
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 07:22:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3E3A91FD82;
 Thu,  9 Jun 2022 07:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654759365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8TfWAaXkB+S11jKYpjSUwR+Kzwmh1NPY+CKvJD8+meY=;
 b=vijEf+E6XzxRp2dSPr0y9uFDOuwQ2YrOBGwq+nqTL8zsr7JtsRN0mXgaugGGLQXCXRg/2W
 huYt1DOlPw7lwLMnHY/EC9p4fmATgGHIAZsm9KlyDC59czKoWQRS3Ya8YQhmP6EQ1ibw11
 ViSEX6EiR+6tn1yUyFHyPAVTC7EK6kE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654759365;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8TfWAaXkB+S11jKYpjSUwR+Kzwmh1NPY+CKvJD8+meY=;
 b=TyhNHZpMMQKubaom3/wfvVPPGYqdJvASEGOXi7UUf8uLcT3uMTe3X/xh0H/mvLPZZMFLUw
 BPk0mrLthdAFxdCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 21E3D13A97;
 Thu,  9 Jun 2022 07:22:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QKWQB8WfoWLYMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Jun 2022 07:22:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	kuohsiang_chou@aspeedtech.com,
	jfalempe@redhat.com
Subject: [PATCH 1/1] drm/ast: Create threshold values for AST2600
Date: Thu,  9 Jun 2022 09:22:42 +0200
Message-Id: <20220609072242.11721-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220609072242.11721-1-tzimmermann@suse.de>
References: <20220609072242.11721-1-tzimmermann@suse.de>
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
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>

The threshold value is used for AST2600 only.

Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20220117083643.41493-1-kuohsiang_chou@aspeedtech.com
---
 drivers/gpu/drm/ast/ast_mode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 44c2aafcb7c2..6fa8042a0dfd 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -471,7 +471,10 @@ static void ast_set_color_reg(struct ast_private *ast,
 static void ast_set_crtthd_reg(struct ast_private *ast)
 {
 	/* Set Threshold */
-	if (ast->chip == AST2300 || ast->chip == AST2400 ||
+	if (ast->chip == AST2600) {
+		ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa7, 0xe0);
+		ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa6, 0xa0);
+	} else if (ast->chip == AST2300 || ast->chip == AST2400 ||
 	    ast->chip == AST2500) {
 		ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa7, 0x78);
 		ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa6, 0x60);
-- 
2.36.1

