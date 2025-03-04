Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E5DA4DF7F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 14:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D935210E5CB;
	Tue,  4 Mar 2025 13:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="j74GWCPR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kbWyiGTU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j74GWCPR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kbWyiGTU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6177B10E5CB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 13:42:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C87F71F74C;
 Tue,  4 Mar 2025 13:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741095731; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nyc6J/gksMhLhuBouY5xml3nE5EEMor2jUfF0ZTd8DU=;
 b=j74GWCPRpYz4zVw2x8/0H9aqWSI25IIQFAnNLLlx2WvUQlTz5Ds14UCSt3IHqvvpqKrkeI
 B7kyL+eUFn94wRmVqdREAMQBekAYKAzQiirg1cpfNGI00qBpU/ien359JBdu2BnsPwYi3u
 kKKyjGEehyTM2VVx0eiSc4piyoK2AZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741095731;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nyc6J/gksMhLhuBouY5xml3nE5EEMor2jUfF0ZTd8DU=;
 b=kbWyiGTU6+GQhDxR3HzAaJMzkDtXYNKGC5u1G3Si5DAnCVDqB2THNdevcJk6hI/ltfxMrT
 moihjhh498C+XjBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741095731; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nyc6J/gksMhLhuBouY5xml3nE5EEMor2jUfF0ZTd8DU=;
 b=j74GWCPRpYz4zVw2x8/0H9aqWSI25IIQFAnNLLlx2WvUQlTz5Ds14UCSt3IHqvvpqKrkeI
 B7kyL+eUFn94wRmVqdREAMQBekAYKAzQiirg1cpfNGI00qBpU/ien359JBdu2BnsPwYi3u
 kKKyjGEehyTM2VVx0eiSc4piyoK2AZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741095731;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nyc6J/gksMhLhuBouY5xml3nE5EEMor2jUfF0ZTd8DU=;
 b=kbWyiGTU6+GQhDxR3HzAaJMzkDtXYNKGC5u1G3Si5DAnCVDqB2THNdevcJk6hI/ltfxMrT
 moihjhh498C+XjBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9D5E13967;
 Tue,  4 Mar 2025 13:42:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id LmDXKDMDx2eNIgAAD6G6ig
 (envelope-from <tiwai@suse.de>); Tue, 04 Mar 2025 13:42:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, virtualization@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bochs: Fix DPMS regression
Date: Tue,  4 Mar 2025 14:41:57 +0100
Message-ID: <20250304134203.20534-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_SEVEN(0.00)[7];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.com:url];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO
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

The recent rewrite with the use of regular atomic helpers broke the
DPMS unblanking on X11.  Fix it by moving the call of
bochs_hw_blank(false) from CRTC mode_set_nofb() to atomic_enable().

Fixes: 2037174993c8 ("drm/bochs: Use regular atomic helpers")
Link: https://bugzilla.suse.com/show_bug.cgi?id=1238209
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/tiny/bochs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 76e29950a807..c1c7d6c9e85f 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -323,8 +323,6 @@ static void bochs_hw_setmode(struct bochs_device *bochs, struct drm_display_mode
 			 bochs->xres, bochs->yres, bochs->bpp,
 			 bochs->yres_virtual);
 
-	bochs_hw_blank(bochs, false);
-
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_ENABLE,      0);
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_BPP,         bochs->bpp);
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_XRES,        bochs->xres);
@@ -494,6 +492,9 @@ static int bochs_crtc_helper_atomic_check(struct drm_crtc *crtc,
 static void bochs_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 					    struct drm_atomic_state *state)
 {
+	struct bochs_device *bochs = to_bochs_device(crtc->dev);
+
+	bochs_hw_blank(bochs, false);
 }
 
 static void bochs_crtc_helper_atomic_disable(struct drm_crtc *crtc,
-- 
2.43.0

