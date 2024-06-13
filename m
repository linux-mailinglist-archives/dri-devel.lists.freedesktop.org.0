Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A4F906808
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B83D10E9A8;
	Thu, 13 Jun 2024 09:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gMSrLkSX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GKzis372";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gMSrLkSX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GKzis372";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DD010E9A8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 09:02:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 73A8B5D079;
 Thu, 13 Jun 2024 09:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718269365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pIVDisUcR8VzoZKPTV+OuoRv5XGyVWJlmcO4Rce/v2I=;
 b=gMSrLkSXexMPw9/kUjkJSX1TOuZj/aS7qWXH/Ji6l4XWan6aU1xNEBElCer1QSjJeWO1bK
 AFL0QvLJNX1DQ4l1mB/3fK2fRTWDtdtpo9C7+CtcPOA+vPbFwEyrNvFXqqWPwSp0wcTirM
 pHrdzYpjtnKOQM9lNd0h0eB3Kwd84TM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718269365;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pIVDisUcR8VzoZKPTV+OuoRv5XGyVWJlmcO4Rce/v2I=;
 b=GKzis372FGj5MdEJcQ4TN/+ZVtiIfVnL68wH45TH6k9woqsa6JaqR+mzITfbKxdkbk68sl
 TQVBMr3q9Z4LbMDQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gMSrLkSX;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GKzis372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718269365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pIVDisUcR8VzoZKPTV+OuoRv5XGyVWJlmcO4Rce/v2I=;
 b=gMSrLkSXexMPw9/kUjkJSX1TOuZj/aS7qWXH/Ji6l4XWan6aU1xNEBElCer1QSjJeWO1bK
 AFL0QvLJNX1DQ4l1mB/3fK2fRTWDtdtpo9C7+CtcPOA+vPbFwEyrNvFXqqWPwSp0wcTirM
 pHrdzYpjtnKOQM9lNd0h0eB3Kwd84TM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718269365;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pIVDisUcR8VzoZKPTV+OuoRv5XGyVWJlmcO4Rce/v2I=;
 b=GKzis372FGj5MdEJcQ4TN/+ZVtiIfVnL68wH45TH6k9woqsa6JaqR+mzITfbKxdkbk68sl
 TQVBMr3q9Z4LbMDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 392E713A7F;
 Thu, 13 Jun 2024 09:02:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HZSjDLW1ambHZgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Jun 2024 09:02:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	sam@ravnborg.org,
	javierm@redhat.com,
	hpa@zytor.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org
Subject: [PATCH] fbdev: vesafb: Detect VGA compatibility from screen info's
 VESA attributes
Date: Thu, 13 Jun 2024 11:02:22 +0200
Message-ID: <20240613090240.7107-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 73A8B5D079
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[gmx.de,ravnborg.org,redhat.com,zytor.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Test the vesa_attributes field in struct screen_info for compatibility
with VGA hardware. Vesafb currently tests bit 1 in screen_info's
capabilities field, It sets the framebuffer address size and is
unrelated to VGA.

Section 4.4 of the Vesa VBE 2.0 specifications defines that bit 5 in
the mode's attributes field signals VGA compatibility. The mode is
compatible with VGA hardware if the bit is clear. In that case, the
driver can access VGA state of the VBE's underlying hardware. The
vesafb driver uses this feature to program the color LUT in palette
modes. Without, colors might be incorrect.

The problem got introduced in commit 89ec4c238e7a ("[PATCH] vesafb: Fix
incorrect logo colors in x86_64"). It incorrectly stores the mode
attributes in the screen_info's capabilities field and updates vesafb
accordingly. Later, commit 5e8ddcbe8692 ("Video mode probing support for
the new x86 setup code") fixed the screen_info, but did not update vesafb.
Color output still tends to work, because bit 1 in capabilities is
usually 0.

Besides fixing the bug in vesafb, this commit introduces a helper that
reads the correct bit from screen_info.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 5e8ddcbe8692 ("Video mode probing support for the new x86 setup code")
Cc: <stable@vger.kernel.org> # v2.6.23+
---
 drivers/video/fbdev/vesafb.c | 2 +-
 include/linux/screen_info.h  | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
index 8ab64ae4cad3e..5a161750a3aee 100644
--- a/drivers/video/fbdev/vesafb.c
+++ b/drivers/video/fbdev/vesafb.c
@@ -271,7 +271,7 @@ static int vesafb_probe(struct platform_device *dev)
 	if (si->orig_video_isVGA != VIDEO_TYPE_VLFB)
 		return -ENODEV;
 
-	vga_compat = (si->capabilities & 2) ? 0 : 1;
+	vga_compat = !__screen_info_vbe_mode_nonvga(si);
 	vesafb_fix.smem_start = si->lfb_base;
 	vesafb_defined.bits_per_pixel = si->lfb_depth;
 	if (15 == vesafb_defined.bits_per_pixel)
diff --git a/include/linux/screen_info.h b/include/linux/screen_info.h
index 75303c126285a..95f2a339de329 100644
--- a/include/linux/screen_info.h
+++ b/include/linux/screen_info.h
@@ -49,6 +49,11 @@ static inline u64 __screen_info_lfb_size(const struct screen_info *si, unsigned
 	return lfb_size;
 }
 
+static inline bool __screen_info_vbe_mode_nonvga(const struct screen_info *si)
+{
+	return si->vesa_attributes & BIT(5); // VGA if _not_ set
+}
+
 static inline unsigned int __screen_info_video_type(unsigned int type)
 {
 	switch (type) {
-- 
2.45.2

