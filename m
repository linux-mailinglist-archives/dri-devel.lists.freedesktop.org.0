Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B1981A026
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 14:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E11210E59E;
	Wed, 20 Dec 2023 13:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423DD10E58B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 13:46:49 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D0DF51F832;
 Wed, 20 Dec 2023 13:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1703080007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3eAv9E6qr6EXTkKeEDMFcGocoOXyIA6N2GExstlwndY=;
 b=VXzUkhVcB6NE/V3xy0ECYg/h0kQXwpdevATL7yTEfpXlk1RS17qGBRdX7Q54kRYzaZS0mS
 rOSWnKULaTnVbHOxKN4PnsjDeDAzzSyUJPJivfaH/B5bQe31KcK14Mye3mNx968ZXKapvr
 uEgQR/JR2axEr1+umWn7coss18Q8LH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1703080007;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3eAv9E6qr6EXTkKeEDMFcGocoOXyIA6N2GExstlwndY=;
 b=zfqIxVt6yzIdNG8rwwWJV2z5FycqIhjh2VKSuu5UsWpCm8enTibaPDAR8Tr5BSQ++wOuWg
 6RsLnXRnN/fhrMCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1703080007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3eAv9E6qr6EXTkKeEDMFcGocoOXyIA6N2GExstlwndY=;
 b=VXzUkhVcB6NE/V3xy0ECYg/h0kQXwpdevATL7yTEfpXlk1RS17qGBRdX7Q54kRYzaZS0mS
 rOSWnKULaTnVbHOxKN4PnsjDeDAzzSyUJPJivfaH/B5bQe31KcK14Mye3mNx968ZXKapvr
 uEgQR/JR2axEr1+umWn7coss18Q8LH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1703080007;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3eAv9E6qr6EXTkKeEDMFcGocoOXyIA6N2GExstlwndY=;
 b=zfqIxVt6yzIdNG8rwwWJV2z5FycqIhjh2VKSuu5UsWpCm8enTibaPDAR8Tr5BSQ++wOuWg
 6RsLnXRnN/fhrMCg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 95A7713BA8;
 Wed, 20 Dec 2023 13:46:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id mHNdI0fwgmWZJwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Dec 2023 13:46:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	James.Bottomley@HansenPartnership.com,
	arnd@arndb.de
Subject: [PATCH 3/4] arch/parisc: Detect primary video device from device
 instance
Date: Wed, 20 Dec 2023 14:22:56 +0100
Message-ID: <20231220134639.8190-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220134639.8190-1-tzimmermann@suse.de>
References: <20231220134639.8190-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ***
X-Spamd-Bar: +++
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VXzUkhVc;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zfqIxVt6
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [3.16 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[7]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[gmx.de,HansenPartnership.com,arndb.de];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-0.33)[76.01%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 3.16
X-Rspamd-Queue-Id: D0DF51F832
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-parisc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update fb_is_primary device() on parisc to detect the primary display
device from the Linux device instance. Aligns the code with the other
architectures. A later patch will remove the fbdev dependency from the
function's interface.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/parisc/video/fbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/video/fbdev.c b/arch/parisc/video/fbdev.c
index 137561d98246..e4f8ac99fc9e 100644
--- a/arch/parisc/video/fbdev.c
+++ b/arch/parisc/video/fbdev.c
@@ -21,6 +21,6 @@ int fb_is_primary_device(struct fb_info *info)
 		return true;
 
 	/* return true if it's the default built-in framebuffer driver */
-	return (sti->info == info);
+	return (sti->dev == info->device);
 }
 EXPORT_SYMBOL(fb_is_primary_device);
-- 
2.43.0

