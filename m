Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76C3AF58D3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 15:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0983D10E709;
	Wed,  2 Jul 2025 13:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="CyyhlCyK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZlG8Jm72";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CyyhlCyK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZlG8Jm72";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE1C10E6FD
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 13:27:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4DFB821191;
 Wed,  2 Jul 2025 13:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751462859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j/E2UDagKwgTLB06obyCBoKgrHAi/F9GHL4hu7pJPfE=;
 b=CyyhlCyKh9JRYxRGG0DU5u7d+SHMRC9cbaiMqX+ryPqbu8PqTqOL/JWnG+dcp5mql8x97E
 nA+mPdEzl6wtmvxkkDJEJtcXNygTvPqEIhqyT4NGG9tHNuckgoFZfsZESqaqfp1W70CbRB
 ZoQ3MzlBXmnNcMxvNdJvKQ7Xe7pk+Xc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751462859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j/E2UDagKwgTLB06obyCBoKgrHAi/F9GHL4hu7pJPfE=;
 b=ZlG8Jm72IXf4umUJKZwhhWC6oiIfnS+HoKdUO0cJyy2KkbXFyLkTXoh/wB2KyQ+/zhI7ox
 ERw56jtTQEtCvGDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751462859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j/E2UDagKwgTLB06obyCBoKgrHAi/F9GHL4hu7pJPfE=;
 b=CyyhlCyKh9JRYxRGG0DU5u7d+SHMRC9cbaiMqX+ryPqbu8PqTqOL/JWnG+dcp5mql8x97E
 nA+mPdEzl6wtmvxkkDJEJtcXNygTvPqEIhqyT4NGG9tHNuckgoFZfsZESqaqfp1W70CbRB
 ZoQ3MzlBXmnNcMxvNdJvKQ7Xe7pk+Xc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751462859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j/E2UDagKwgTLB06obyCBoKgrHAi/F9GHL4hu7pJPfE=;
 b=ZlG8Jm72IXf4umUJKZwhhWC6oiIfnS+HoKdUO0cJyy2KkbXFyLkTXoh/wB2KyQ+/zhI7ox
 ERw56jtTQEtCvGDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 284DD13A54;
 Wed,  2 Jul 2025 13:27:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +F2DCMszZWj0MAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Jul 2025 13:27:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/10] drm/ast: Move struct ast_dramstruct to ast_post.h
Date: Wed,  2 Jul 2025 15:12:54 +0200
Message-ID: <20250702132431.249329-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132431.249329-1-tzimmermann@suse.de>
References: <20250702132431.249329-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCVD_TLS_ALL(0.00)[]
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

Declare struct ast_dramstruct in ast_post.h and remove its original
header file.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_2000.c        |  2 +-
 drivers/gpu/drm/ast/ast_2100.c        |  2 +-
 drivers/gpu/drm/ast/ast_dram_tables.h | 11 -----------
 drivers/gpu/drm/ast/ast_post.h        |  6 ++++++
 4 files changed, 8 insertions(+), 13 deletions(-)
 delete mode 100644 drivers/gpu/drm/ast/ast_dram_tables.h

diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
index 099c90e1402f..b2ad2ea5056b 100644
--- a/drivers/gpu/drm/ast/ast_2000.c
+++ b/drivers/gpu/drm/ast/ast_2000.c
@@ -28,8 +28,8 @@
 
 #include <linux/delay.h>
 
-#include "ast_dram_tables.h"
 #include "ast_drv.h"
+#include "ast_post.h"
 
 /*
  * POST
diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
index f41c778e02da..ee40f3911ca4 100644
--- a/drivers/gpu/drm/ast/ast_2100.c
+++ b/drivers/gpu/drm/ast/ast_2100.c
@@ -28,8 +28,8 @@
 
 #include <linux/delay.h>
 
-#include "ast_dram_tables.h"
 #include "ast_drv.h"
+#include "ast_post.h"
 
 /*
  * POST
diff --git a/drivers/gpu/drm/ast/ast_dram_tables.h b/drivers/gpu/drm/ast/ast_dram_tables.h
deleted file mode 100644
index 6c191e2c4e6c..000000000000
--- a/drivers/gpu/drm/ast/ast_dram_tables.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef AST_DRAM_TABLES_H
-#define AST_DRAM_TABLES_H
-
-/* DRAM timing tables */
-struct ast_dramstruct {
-	u16 index;
-	u32 data;
-};
-
-#endif
diff --git a/drivers/gpu/drm/ast/ast_post.h b/drivers/gpu/drm/ast/ast_post.h
index 314fa0475c79..3a55c32a7eb7 100644
--- a/drivers/gpu/drm/ast/ast_post.h
+++ b/drivers/gpu/drm/ast/ast_post.h
@@ -7,6 +7,12 @@
 
 struct ast_device;
 
+/* DRAM timing tables */
+struct ast_dramstruct {
+	u16 index;
+	u32 data;
+};
+
 u32 __ast_mindwm(void __iomem *regs, u32 r);
 void __ast_moutdwm(void __iomem *regs, u32 r, u32 v);
 
-- 
2.50.0

