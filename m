Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B924F9F2B17
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 08:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE9810E2DA;
	Mon, 16 Dec 2024 07:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Okj3ZMHN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WzKNXkba";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Okj3ZMHN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WzKNXkba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA1510E2DA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 07:45:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6C9A7211FB;
 Mon, 16 Dec 2024 07:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734335100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=NR2odFMvBCSBarTSuL9QZZ7twh0d73aEvCeSX/f3wKk=;
 b=Okj3ZMHNM6Li+6wpDps878NCGBMzeVck3GY5Tk2IhZu14S/9wmXf/KNrFBPGkig6Z9ZNMf
 8wk0axdhfzBXjfz+n0TzY0vHDNWtKGcrGB98oimtlxMyhLPDzh4PiBOgu/b/rZhO6F6D2T
 gOKNGxJgnjyLDLyWp2qaLGiUET0HQ9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734335100;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=NR2odFMvBCSBarTSuL9QZZ7twh0d73aEvCeSX/f3wKk=;
 b=WzKNXkba+1EoE226aQkH+8inEyCvYVZVYeut2y+GW00I75kVl3KzVws+gu2VwAFeniUNfA
 Q/1fY41DBpldtCDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734335100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=NR2odFMvBCSBarTSuL9QZZ7twh0d73aEvCeSX/f3wKk=;
 b=Okj3ZMHNM6Li+6wpDps878NCGBMzeVck3GY5Tk2IhZu14S/9wmXf/KNrFBPGkig6Z9ZNMf
 8wk0axdhfzBXjfz+n0TzY0vHDNWtKGcrGB98oimtlxMyhLPDzh4PiBOgu/b/rZhO6F6D2T
 gOKNGxJgnjyLDLyWp2qaLGiUET0HQ9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734335100;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=NR2odFMvBCSBarTSuL9QZZ7twh0d73aEvCeSX/f3wKk=;
 b=WzKNXkba+1EoE226aQkH+8inEyCvYVZVYeut2y+GW00I75kVl3KzVws+gu2VwAFeniUNfA
 Q/1fY41DBpldtCDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B19E13418;
 Mon, 16 Dec 2024 07:45:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id J6sCBXzaX2egZAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 16 Dec 2024 07:45:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, arnd@arndb.de, deller@gmx.de,
 jani.nikula@linux.intel.com, christophe.leroy@csgroup.eu, simona@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 0/3] drm,fbdev: Fix module dependencies
Date: Mon, 16 Dec 2024 08:42:46 +0100
Message-ID: <20241216074450.8590-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[12];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
 FREEMAIL_TO(0.00)[redhat.com,arndb.de,gmx.de,linux.intel.com,csgroup.eu,ffwll.ch,gmail.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
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
Kconfig token automatically. These drivers should be updated to depend
on the token as well, such that backlight functionality is fully user-
controlled.

v3:
- Fix PMAC_BACKLIGHT case (Christophe)
v2:
- s/BACKLIGHT_DEVICE_CLASS/BACKLIGHT_CLASS_DEVICE (Helge)
- Fix fbdev driver-dependency corner case (Arnd)

[1] https://patchwork.freedesktop.org/series/141411/

Arnd Bergmann (1):
  drm: rework FB_CORE dependency

Thomas Zimmermann (2):
  fbdev: Fix recursive dependencies wrt BACKLIGHT_CLASS_DEVICE
  drm/fbdev: Select FB_CORE dependency for fbdev on DMA and TTM

 arch/powerpc/configs/pmac32_defconfig |  1 +
 arch/powerpc/configs/ppc6xx_defconfig |  1 +
 drivers/auxdisplay/Kconfig            |  2 +-
 drivers/gpu/drm/Kconfig               |  3 +++
 drivers/macintosh/Kconfig             |  1 +
 drivers/staging/fbtft/Kconfig         |  1 +
 drivers/video/fbdev/Kconfig           | 18 +++++++++++++-----
 drivers/video/fbdev/core/Kconfig      |  3 +--
 8 files changed, 22 insertions(+), 8 deletions(-)

-- 
2.47.1

