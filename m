Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DD95B193E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 11:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D344C10E9F6;
	Thu,  8 Sep 2022 09:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229B110E9F0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 09:51:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B92963372C;
 Thu,  8 Sep 2022 09:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662630678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=r7T3YAjulaRn5e4LHbBsLxYuASM55+Otot1t/CvftwE=;
 b=IgMdqiupQ6U7KQHbulMYrZUJgjBGHnNXE2zjuxS78utZsPrNOUhiJcZdfR65c8/OGuXzn1
 1vA+09RJWEodv3tYSw8hKiMOqWSS+urFL6EbZmQ6peCy8iGwuNz6tKXGGlPgk9cpbdKxGI
 ZCVlLFYz2+uyeSksG6cZqLWB4T7MOpA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662630678;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=r7T3YAjulaRn5e4LHbBsLxYuASM55+Otot1t/CvftwE=;
 b=OvZJF4G5m329KR9SBsVZMvdWrrLRTCEX6/qA7O7iSM/3HTehKfZaRvF6hisD0/QeSsp3iQ
 Y4DQJKsryoLstnCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 95C3B13A6D;
 Thu,  8 Sep 2022 09:51:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OKuEIxa7GWNrUgAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 08 Sep 2022 09:51:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 00/12] drm/udl: More fixes
Date: Thu,  8 Sep 2022 11:51:03 +0200
Message-Id: <20220908095115.23396-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

this is another respin of patch set for cleaning up and fixes for UDL
driver [*].  It covers the PM problems, regressions in the previous
patch set, fixes for the stalls on some systems, as well as more
hardening.


thanks,

Takashi

[*] v2: https://lore.kernel.org/r/20220906073951.2085-1-tiwai@suse.de

===

v2->v3:
- More fix on Restore-on-display-mode patch, suggested by Daniel
- Yet more fix for ubs.count check patch, suggested by Thomas
- Another patch for passing rectangle directly, suggested by Thomas
- Put more Acks from Daniel and Thomas

v1->v2: cleanups as suggested by Thomas
- Drop numurbs parameter patch
- Clean up / simplify clipping patch
- Code cleanup and changes for urb management patch
- Put Acks on some given patches

===

Takashi Iwai (10):
  drm/udl: Restore display mode on resume
  Revert "drm/udl: Kill pending URBs at suspend and disconnect"
  drm/udl: Suppress error print for -EPROTO at URB completion
  drm/udl: Increase the default URB list size to 20
  drm/udl: Drop unneeded alignment
  drm/udl: Pass rectangle directly to udl_handle_damage()
  drm/udl: Fix potential URB leaks
  drm/udl: Fix inconsistent urbs.count value during udl_free_urb_list()
  drm/udl: Don't re-initialize stuff at retrying the URB list allocation
  drm/udl: Sync pending URBs at the end of suspend

Thomas Zimmermann (2):
  drm/udl: Add reset_resume
  drm/udl: Enable damage clipping

 drivers/gpu/drm/udl/udl_drv.c      | 19 +++++-
 drivers/gpu/drm/udl/udl_drv.h      | 13 +----
 drivers/gpu/drm/udl/udl_main.c     | 93 +++++++++++++++---------------
 drivers/gpu/drm/udl/udl_modeset.c  | 54 ++++-------------
 drivers/gpu/drm/udl/udl_transfer.c | 45 ++-------------
 5 files changed, 80 insertions(+), 144 deletions(-)

-- 
2.35.3

