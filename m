Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF82690AF8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 14:55:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDD910EAE6;
	Thu,  9 Feb 2023 13:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB6C10EAE4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 13:55:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9CE3E229E0;
 Thu,  9 Feb 2023 13:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675950912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uRXYWe304mkCxYZE0lH4+u8aTbd19nfJc9iHmaY1sNs=;
 b=rGoNUeHAKyyaOWP1mlyHpoRNo8hh31zgKYmRP6qxRNT8QfNwA6YaXG7rHjRGE1m/ylLMGR
 g9ejrdOFZJ3NQA7dCMmp65bqYgU2kGtttdHBB326k38YyttBqXNB+ELPB4GiJtmucnSX6G
 /PrKOuOx9K1EKieAsj2P1/t25VALtC8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675950912;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uRXYWe304mkCxYZE0lH4+u8aTbd19nfJc9iHmaY1sNs=;
 b=fxzGR2USnOzNJy0acLQiboQ/osEf+Oy+1nm5x8+ggn+D4J+XiU1aI6WICQgpe6xViZClJ+
 fNNF/22aiuayXkAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B3E3138E4;
 Thu,  9 Feb 2023 13:55:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iaZWFUD75GNTfwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 13:55:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, deller@gmx.de, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, geoff@infradead.org,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: [PATCH 00/11] drm,fbdev: Move video= option to drivers/video
Date: Thu,  9 Feb 2023 14:54:58 +0100
Message-Id: <20230209135509.7786-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kernel's video= option sets the initial video mode. It is shared
by fbdev and DRM, but located within the fbdev code. Move it to
drivers/video/ and adapt callers. Allows DRM (and others) to use the
option without depending on fbdev.

While at it, fix the interface of the lookup functions. This requires
a number of changes. First clarify the ownership of the option string
in patch 2. The helper fb_get_options() returns the video= parameter's
value. It's sometimes a copy and sometimes the original string. Hence
callers, mostly fbdev drivers, have just leaked the returned string.
Change this to always duplicate the option string in fb_get_options()
and transfer ownership of the copy to the caller. We can then start to
fix the memory leaks in the fbdev drivers.

There's a global video= setting and a number of per-output settings.
In patches 3 to 5, support explicit lookup of the global video option
and lookup the string in fbdev's modedb and in a PS3 driver. Then
avoid exporting the global setting's internal state variable in patch 6.

Finally, in patches 7 to 11, move the video= option to drivers/video.
It can be used directly in DRM and a PS3 driver. This fixes any memory
leaks from the returned option string. For fbdev drivers, the helper
fb_get_options() remains as an adapter aroudn the new interface.

Tested with DRM and fbdev and built for the PS3.

Thomas Zimmermann (11):
  fbdev: Fix contact info in fb_cmdline.c
  fbdev: Transfer video= option strings to caller; clarify ownership
  fbdev: Support NULL for name in option-string lookup
  drivers/ps3: Read video= option with fb_get_option()
  fbdev: Read video= option with fb_get_option() in modedb
  fbdev: Unexport fb_mode_option
  fbdev: Move option-string lookup into helper
  fbdev: Handle video= parameter in video/cmdline.c
  driver/ps3: Include <video/cmdline.h> for mode parsing
  drm: Include <video/cmdline.h> for mode parsing
  drm: Fix comment on mode parsing

 drivers/gpu/drm/Kconfig               |   2 +-
 drivers/gpu/drm/drm_connector.c       |   9 +-
 drivers/gpu/drm/drm_modes.c           |   3 +-
 drivers/ps3/ps3av.c                   |   9 +-
 drivers/video/Kconfig                 |   3 +
 drivers/video/Makefile                |   1 +
 drivers/video/cmdline.c               | 133 ++++++++++++++++++++++++++
 drivers/video/fbdev/Kconfig           |   5 +-
 drivers/video/fbdev/core/Makefile     |   3 +-
 drivers/video/fbdev/core/fb_cmdline.c |  94 +++++-------------
 drivers/video/fbdev/core/modedb.c     |   8 +-
 include/linux/fb.h                    |   1 -
 include/video/cmdline.h               |  20 ++++
 13 files changed, 202 insertions(+), 89 deletions(-)
 create mode 100644 drivers/video/cmdline.c
 create mode 100644 include/video/cmdline.h


base-commit: 1a019dd7a5d25f7c1c9b77931138290e28947e6a
-- 
2.39.1

