Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03759A21A8D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 10:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A9010E78B;
	Wed, 29 Jan 2025 09:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="BuDjYnHq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JpQbo9GX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MUIL6doP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RZkh/Jou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3C710E77A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 09:58:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EDCB321119;
 Wed, 29 Jan 2025 09:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738144728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ag0FboK5jTXPJPLwBM1OUeyB/Px9rhkVYWRUMPA8Gj4=;
 b=BuDjYnHqm9wXQD/VbrIzHGSlcpdwDeB1wKg7zSn+/242MzvcxcTvjJdQuiSKwiBUCCrJIG
 3v2jMJa2BwbAGF43wLD02SZmmq3TrwsLJmkGbB09HQgIGCpqRr9M7k8li77++l/jUjXsL7
 pzeQlO6eoM8abeDXYXLanesCprOxKNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738144728;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ag0FboK5jTXPJPLwBM1OUeyB/Px9rhkVYWRUMPA8Gj4=;
 b=JpQbo9GXc+rgxE7kHN0imGzoyccNjPJxUoAhqhozsFQC8hB9sUjUvH1EcTlqCqT6NSMWNj
 ffJwfCjped8oWZCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738144727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ag0FboK5jTXPJPLwBM1OUeyB/Px9rhkVYWRUMPA8Gj4=;
 b=MUIL6doPlCyUIs7c359kNJY32+MqCtCytgCs2jGs62Dw2IUrBQ5hkQCA0g1foaNI0eHTD4
 rxzxl/yqCL6wmDMzQbOxcSYWpXcvOKAwKOkEksZf1oKLUPPZVtEP6xArvKX/wZC/QFzgrZ
 2HK7xmyVmIMDfjEF3wqQ29tQ4IUNVCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738144727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ag0FboK5jTXPJPLwBM1OUeyB/Px9rhkVYWRUMPA8Gj4=;
 b=RZkh/JoujyH/4veKVFBg/HxApeh6w0cR+oDwm58njiXn5tOniVHiUq7FC+ZcAhneEare2h
 4NzbV1ixPE1DXNDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C862413AA6;
 Wed, 29 Jan 2025 09:58:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kEqgL9f7mWflDQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 29 Jan 2025 09:58:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 07/16] drm/ast: Always validate H/V sync flags
Date: Wed, 29 Jan 2025 10:54:53 +0100
Message-ID: <20250129095840.20629-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129095840.20629-1-tzimmermann@suse.de>
References: <20250129095840.20629-1-tzimmermann@suse.de>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
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

