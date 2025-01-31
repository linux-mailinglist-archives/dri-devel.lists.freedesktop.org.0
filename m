Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2AFA23B5E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 10:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB67E10EA53;
	Fri, 31 Jan 2025 09:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CEB10E169
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 09:23:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A77D91F391;
 Fri, 31 Jan 2025 09:23:03 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 82885139B1;
 Fri, 31 Jan 2025 09:23:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UPSmHneWnGd+GwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Jan 2025 09:23:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 07/16] drm/ast: Always validate H/V sync flags
Date: Fri, 31 Jan 2025 10:21:07 +0100
Message-ID: <20250131092257.115596-8-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: A77D91F391
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

The ast driver matches DRM display modes against an internal list of
modes supported by the VBIOS. Matching H/V sync flags between modes is
preferred, but optional. If sync flags are not matching, the driver
would program the VBIOS settings to hardware and let the display handle
the difference.

DRM modes are generated from attached displays or standard mode lines.
Therefore differences to the VBIOS modes are not just cosmetical, but
signal possible incompatibility with the display hardware.

Hence make matching H/V sync flags mandatory. If the VBIOS does not
support a certain mode, we should report it as unsupported. Note that
the VBIOS mode tables all appear to refer to standard modes.

(If sync flags really make no difference to the VBIOS, the ast driver
shouldn't match them in the first place.)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 45 ++++++++++++++--------------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index bc0c7db5ad46e..a484292c96453 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -113,8 +113,8 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
 {
 	u32 refresh_rate_index = 0, refresh_rate;
 	const struct ast_vbios_enhtable *best = NULL;
+	const struct ast_vbios_enhtable *loop;
 	u32 hborder, vborder;
-	bool check_sync;
 
 	switch (format->cpp[0] * 8) {
 	case 8:
@@ -176,36 +176,27 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
 	}
 
 	refresh_rate = drm_mode_vrefresh(mode);
-	check_sync = vbios_mode->enh_table->flags & WideScreenMode;
-
-	while (1) {
-		const struct ast_vbios_enhtable *loop = vbios_mode->enh_table;
-
-		while (loop->refresh_rate != 0xff) {
-			if ((check_sync) &&
-			    (((mode->flags & DRM_MODE_FLAG_NVSYNC)  &&
-			      (loop->flags & PVSync))  ||
-			     ((mode->flags & DRM_MODE_FLAG_PVSYNC)  &&
-			      (loop->flags & NVSync))  ||
-			     ((mode->flags & DRM_MODE_FLAG_NHSYNC)  &&
-			      (loop->flags & PHSync))  ||
-			     ((mode->flags & DRM_MODE_FLAG_PHSYNC)  &&
-			      (loop->flags & NHSync)))) {
-				loop++;
-				continue;
-			}
-			if (loop->refresh_rate <= refresh_rate
-			    && (!best || loop->refresh_rate > best->refresh_rate))
-				best = loop;
+
+	loop = vbios_mode->enh_table;
+
+	while (loop->refresh_rate != 0xff) {
+		if (((mode->flags & DRM_MODE_FLAG_NVSYNC) && (loop->flags & PVSync))  ||
+		    ((mode->flags & DRM_MODE_FLAG_PVSYNC) && (loop->flags & NVSync))  ||
+		    ((mode->flags & DRM_MODE_FLAG_NHSYNC) && (loop->flags & PHSync))  ||
+		    ((mode->flags & DRM_MODE_FLAG_PHSYNC) && (loop->flags & NHSync))) {
 			loop++;
+			continue;
 		}
-		if (best || !check_sync)
-			break;
-		check_sync = 0;
+		if (loop->refresh_rate <= refresh_rate &&
+		    (!best || loop->refresh_rate > best->refresh_rate))
+			best = loop;
+		loop++;
 	}
 
-	if (best)
-		vbios_mode->enh_table = best;
+	if (!best)
+		return false;
+
+	vbios_mode->enh_table = best;
 
 	hborder = (vbios_mode->enh_table->flags & HBorder) ? 8 : 0;
 	vborder = (vbios_mode->enh_table->flags & VBorder) ? 8 : 0;
-- 
2.48.1

