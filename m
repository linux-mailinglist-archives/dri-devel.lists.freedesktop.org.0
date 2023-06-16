Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE94D733320
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 16:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8114C10E62C;
	Fri, 16 Jun 2023 14:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62AA10E62C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 14:07:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ADC121F899;
 Fri, 16 Jun 2023 14:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686924461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dmuBd6wfu7xPrmCdhUYbYsyqzue8SYpjsKk5yr/LlrU=;
 b=UFBkavSSIUO0QX52+bC3F5Hj1U8z2HKjUglAKZXCyqzpakAQbxNCc1QsIlC7STxxeHnrRO
 k5zr44z66v5bt3WUO79x3zChdemXYt7AA7Q6SWw/O5ER8euekm6b8Jf90zhBEWnZTR8RDV
 Wa2a2J09IqZGHkETp3MIE/qjHxqmENM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686924461;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dmuBd6wfu7xPrmCdhUYbYsyqzue8SYpjsKk5yr/LlrU=;
 b=A8Jrx1yi1h1mMdoNLveY0JtXRr9Yqkgxg0qTBN68gy6IFVjgbI1cMkQ51vgfMdn6dAgP3H
 K1ORVKXrVXjq6jBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 815CE1391E;
 Fri, 16 Jun 2023 14:07:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yBh0Hq1sjGTfWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jun 2023 14:07:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com
Subject: [PATCH 01/14] drm/ast: Fix DRAM init on AST2200
Date: Fri, 16 Jun 2023 15:52:23 +0200
Message-ID: <20230616140739.32042-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230616140739.32042-1-tzimmermann@suse.de>
References: <20230616140739.32042-1-tzimmermann@suse.de>
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
Cc: stable@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the test for the AST2200 in the DRAM initialization. The value
in ast->chip has to be compared against an enum constant instead of
a numerical value.

This bug got introduced when the driver was first imported into the
kernel.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 312fec1405dd ("drm: Initial KMS driver for AST (ASpeed Technologies) 2000 series (v2)")
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v3.5+
---
 drivers/gpu/drm/ast/ast_post.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index a005aec18a020..0262aaafdb1c5 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -291,7 +291,7 @@ static void ast_init_dram_reg(struct drm_device *dev)
 				;
 			} while (ast_read32(ast, 0x10100) != 0xa8);
 		} else {/* AST2100/1100 */
-			if (ast->chip == AST2100 || ast->chip == 2200)
+			if (ast->chip == AST2100 || ast->chip == AST2200)
 				dram_reg_info = ast2100_dram_table_data;
 			else
 				dram_reg_info = ast1100_dram_table_data;
-- 
2.41.0

