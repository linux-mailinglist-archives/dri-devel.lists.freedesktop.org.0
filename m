Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76126A23B54
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 10:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5B110EA4D;
	Fri, 31 Jan 2025 09:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AB710EA48
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 09:23:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E2DFB1F396;
 Fri, 31 Jan 2025 09:23:04 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF116139B1;
 Fri, 31 Jan 2025 09:23:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eLxwLXiWnGd+GwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Jan 2025 09:23:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 14/16] drm/ast: astdp: Look up mode index from table
Date: Fri, 31 Jan 2025 10:21:14 +0100
Message-ID: <20250131092257.115596-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131092257.115596-1-tzimmermann@suse.de>
References: <20250131092257.115596-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E2DFB1F396
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

Replace the large switch statement with a look-up table when selecting
the mode index. Makes the code easier to read. The table is sorted by
resolutions; if run-time overhead from traversal becomes significant,
binary search would be a possible optimization.

The mode index requires a refresh-rate index to be added or subtracted,
which still requires a minimal switch. In the original code, some of
the indices did not contain this computation. Those cases would have been
equivalent to adding 0, so they are now all subsumed in the switch's
default branch.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Jocelyn Falempe <jfalempe@redhat.com>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

v3:
- explain the semantics of the new switch statement (Jocelyn)
---
 drivers/gpu/drm/ast/ast_dp.c | 116 +++++++++++++++++------------------
 1 file changed, 55 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index e1ca012e639be..70fa754432bca 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -14,80 +14,74 @@
 #include "ast_drv.h"
 #include "ast_vbios.h"
 
+struct ast_astdp_mode_index_table_entry {
+	unsigned int hdisplay;
+	unsigned int vdisplay;
+	unsigned int mode_index;
+};
+
+/* FIXME: Do refresh rate and flags actually matter? */
+static const struct ast_astdp_mode_index_table_entry ast_astdp_mode_index_table[] = {
+	{  320,  240, ASTDP_320x240_60 },
+	{  400,  300, ASTDP_400x300_60 },
+	{  512,  384, ASTDP_512x384_60 },
+	{  640,  480, ASTDP_640x480_60 },
+	{  800,  600, ASTDP_800x600_56 },
+	{ 1024,  768, ASTDP_1024x768_60 },
+	{ 1152,  864, ASTDP_1152x864_75 },
+	{ 1280,  800, ASTDP_1280x800_60_RB },
+	{ 1280, 1024, ASTDP_1280x1024_60 },
+	{ 1360,  768, ASTDP_1366x768_60 }, // same as 1366x786
+	{ 1366,  768, ASTDP_1366x768_60 },
+	{ 1440,  900, ASTDP_1440x900_60_RB },
+	{ 1600,  900, ASTDP_1600x900_60_RB },
+	{ 1600, 1200, ASTDP_1600x1200_60 },
+	{ 1680, 1050, ASTDP_1680x1050_60_RB },
+	{ 1920, 1080, ASTDP_1920x1080_60 },
+	{ 1920, 1200, ASTDP_1920x1200_60 },
+	{ 0 }
+};
+
+static int __ast_astdp_get_mode_index(unsigned int hdisplay, unsigned int vdisplay)
+{
+	const struct ast_astdp_mode_index_table_entry *entry = ast_astdp_mode_index_table;
+
+	while (entry->hdisplay && entry->vdisplay) {
+		if (entry->hdisplay == hdisplay && entry->vdisplay == vdisplay)
+			return entry->mode_index;
+		++entry;
+	}
+
+	return -EINVAL;
+}
+
 static int ast_astdp_get_mode_index(const struct ast_vbios_enhtable *vmode)
 {
+	int mode_index;
 	u8 refresh_rate_index;
 
+	mode_index = __ast_astdp_get_mode_index(vmode->hde, vmode->vde);
+	if (mode_index < 0)
+		return mode_index;
+
 	if (vmode->refresh_rate_index < 1 || vmode->refresh_rate_index > 255)
 		return -EINVAL;
-
 	refresh_rate_index = vmode->refresh_rate_index - 1;
 
-	switch (vmode->hde) {
-	case 320:
-		if (vmode->vde == 240)
-			return ASTDP_320x240_60;
-		break;
-	case 400:
-		if (vmode->vde == 300)
-			return ASTDP_400x300_60;
-		break;
-	case 512:
-		if (vmode->vde == 384)
-			return ASTDP_512x384_60;
-		break;
-	case 640:
-		if (vmode->vde == 480)
-			return (u8)(ASTDP_640x480_60 + (u8)refresh_rate_index);
-		break;
-	case 800:
-		if (vmode->vde == 600)
-			return (u8)(ASTDP_800x600_56 + (u8)refresh_rate_index);
-		break;
-	case 1024:
-		if (vmode->vde == 768)
-			return (u8)(ASTDP_1024x768_60 + (u8)refresh_rate_index);
-		break;
-	case 1152:
-		if (vmode->vde == 864)
-			return ASTDP_1152x864_75;
-		break;
-	case 1280:
-		if (vmode->vde == 800)
-			return (u8)(ASTDP_1280x800_60_RB - (u8)refresh_rate_index);
-		if (vmode->vde == 1024)
-			return (u8)(ASTDP_1280x1024_60 + (u8)refresh_rate_index);
-		break;
-	case 1360:
-	case 1366:
-		if (vmode->vde == 768)
-			return ASTDP_1366x768_60;
-		break;
-	case 1440:
-		if (vmode->vde == 900)
-			return (u8)(ASTDP_1440x900_60_RB - (u8)refresh_rate_index);
-		break;
-	case 1600:
-		if (vmode->vde == 900)
-			return (u8)(ASTDP_1600x900_60_RB - (u8)refresh_rate_index);
-		if (vmode->vde == 1200)
-			return ASTDP_1600x1200_60;
-		break;
-	case 1680:
-		if (vmode->vde == 1050)
-			return (u8)(ASTDP_1680x1050_60_RB - (u8)refresh_rate_index);
-		break;
-	case 1920:
-		if (vmode->vde == 1080)
-			return ASTDP_1920x1080_60;
-		if (vmode->vde == 1200)
-			return ASTDP_1920x1200_60;
+	/* FIXME: Why are we doing this? */
+	switch (mode_index) {
+	case ASTDP_1280x800_60_RB:
+	case ASTDP_1440x900_60_RB:
+	case ASTDP_1600x900_60_RB:
+	case ASTDP_1680x1050_60_RB:
+		mode_index = (u8)(mode_index - (u8)refresh_rate_index);
 		break;
 	default:
+		mode_index = (u8)(mode_index + (u8)refresh_rate_index);
 		break;
 	}
 
-	return -EINVAL;
+	return mode_index;
 }
 
 static bool ast_astdp_is_connected(struct ast_device *ast)
-- 
2.48.1

