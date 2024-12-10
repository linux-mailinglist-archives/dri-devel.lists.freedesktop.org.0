Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D2D9EB313
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 15:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE2310E3BA;
	Tue, 10 Dec 2024 14:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GCBZ8MYa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="j03dPbEh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OnOtlPal";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WWa2EuLZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A6310E8EB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 14:23:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 00E291F441;
 Tue, 10 Dec 2024 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1733840616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HOfG7Gw/bCptWLlIWvRh2S9GG0Yyaxi6VYuw6+qdsZg=;
 b=GCBZ8MYa5ZgjJ0xhl5sKuL9MuD8VC5yF1HQlmsPjKSYPP1g42dGaX0lzcFACT0ddtFC1Zy
 gXmRbEo2zGIOj9z1pEqyxQA+bhc3oWs0RmDM7oDWVswler8B0CYdcR2JzZh61+/PQULIPM
 DNE3zAghKi41uS13xKW/KdFr85mFRn8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1733840616;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HOfG7Gw/bCptWLlIWvRh2S9GG0Yyaxi6VYuw6+qdsZg=;
 b=j03dPbEhFD/AMuSmZfXYJOFn61e9Zzxrj6/l9D79yXDzOGQKDlrwn61nK4DXZtUoMaE1Ty
 IrW9LLzdGrOU1VCw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OnOtlPal;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WWa2EuLZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1733840615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HOfG7Gw/bCptWLlIWvRh2S9GG0Yyaxi6VYuw6+qdsZg=;
 b=OnOtlPalTphqc9d7qaKl8/LpJ620C3/rg1a5mn8JeamL/7WSlBiedJMUdwHCZKE/fHyTCk
 UtoI/fDNYjun9pzZf6QRVlglII5mVgUhY0KqBhZVRFPaJP8PaAIsu4LRI7g57doktSvAaL
 kaeEEBnZRdwT25cBOBwyptvMtsYGzCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1733840615;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HOfG7Gw/bCptWLlIWvRh2S9GG0Yyaxi6VYuw6+qdsZg=;
 b=WWa2EuLZNR4Z2FCdYS1TV9fpEN23yVNYtIPhGO1u/vT8Ed2SQEjsf6kpNToCchUswr/DCf
 s4E7lSfOu3xT5vCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE14013A15;
 Tue, 10 Dec 2024 14:23:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2Fg3KeZOWGfREwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Dec 2024 14:23:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, arnd@arndb.de, deller@gmx.de, simona@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/3] drm,fbdev: Fix module dependencies
Date: Tue, 10 Dec 2024 15:09:53 +0100
Message-ID: <20241210142329.660801-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 00E291F441
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,arndb.de,gmx.de,ffwll.ch,gmail.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,patchwork.freedesktop.org:url];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[10];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Fix the dependencies among the various graphics modules.

Before addressing the FB_CORE issue, patch 1 first resolves a problem
with BACKLIGHT_CLASS_DEVICE. A number of fbdev drivers select it, which
results in a recursive-dependency error after patch has been applied.
Making these drivers (or parts of them) depend on BACKLIGHT_CLASS_DEVICE
fixes this.

Patch 2 selects FB_CORE for DRM_GEM_DMA_HELPER and DRM_TTM_HELPER.
This is necessary with the recently added DRM client library.

Patch 3 is the second half of the patch provided by Arnd at [1]. It
could not yet be merged because of the issues fixed by patch 1.

Side note: For the majority of graphics drivers, backlight functionality
depends on BACKLIGHT_CLASS_DEVICE. In a few cases drivers select the
Kconfig token automatically. These drivers should be updated to depends
on the token as well, such that backlight functionality is fully user-
controlled.

[1] https://patchwork.freedesktop.org/series/141411/

Arnd Bergmann (1):
  drm: rework FB_CORE dependency

Thomas Zimmermann (2):
  fbdev: Fix recursive dependencies wrt BACKLIGHT_CLASS_DEVICE
  drm/fbdev: Select FB_CORE dependency for fbdev on DMA and TTM

 drivers/auxdisplay/Kconfig       |  2 +-
 drivers/gpu/drm/Kconfig          |  3 +++
 drivers/macintosh/Kconfig        |  1 +
 drivers/staging/fbtft/Kconfig    |  1 +
 drivers/video/fbdev/Kconfig      | 18 +++++++++++++-----
 drivers/video/fbdev/core/Kconfig |  3 +--
 6 files changed, 20 insertions(+), 8 deletions(-)

-- 
2.47.1

