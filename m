Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D696BB9DB70
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 08:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1AD10E844;
	Thu, 25 Sep 2025 06:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="cNaa6Q+k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/3se8pi5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vapjxTjo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L9uH1gnA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4233110E846
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 06:43:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E872575B92;
 Thu, 25 Sep 2025 06:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758782579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=oFMcrEZdEURrdz2SIR1YNKgU/KyHwzydJ7NKOJngRPc=;
 b=cNaa6Q+kN1Ut+hjnzZXrNfSiMMe5TLCYgxIe+6BKjPaPpSNHHFor4S04InOmFMIB508wPo
 0Ada2K4AIK+YjtYBG6+KeOu/cFtnhwXEXnfbEtXjNWe46K8KR6WijJhNCkqaKtYZjztCZi
 m76lwBgmElb/pP2gAVuwSvc3/1aaVuA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758782579;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=oFMcrEZdEURrdz2SIR1YNKgU/KyHwzydJ7NKOJngRPc=;
 b=/3se8pi5uYOnjZdfNG9Iu+sm/wVKmS7utwQl2f+2wtoDj/zoO60ZC6Cp//gi1wU6RoyxEe
 dQYRuX1of9EBN2Aw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758782578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=oFMcrEZdEURrdz2SIR1YNKgU/KyHwzydJ7NKOJngRPc=;
 b=vapjxTjoK+5wkftWN3OgXbfUIJuHmVLDBDptz2RQspLcePD8TlCRYFWDSiAL82tMlYuSd8
 Nfkj4gBey+m/pCAj2iTaLQGemJCx1t4FPIcKyhfB8egbmStHulwI83Qp1VIXGDIg4oWoot
 3VJ4O/Q1Alh6j7pOTQFAamsQTwSFAF0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758782578;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=oFMcrEZdEURrdz2SIR1YNKgU/KyHwzydJ7NKOJngRPc=;
 b=L9uH1gnALN7Q2DsN9Z8M0+f6vvSb+MQi456DR773BiPmKqPmeRd6ovA/NQkRz+ALsNIi+a
 KPXNwpukp8Mx72Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 74C27132C9;
 Thu, 25 Sep 2025 06:42:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6tKwGnLk1GiwIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 25 Sep 2025 06:42:58 +0000
Date: Thu, 25 Sep 2025 08:42:57 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20250925064257.GA9107@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 MISSING_XM_UA(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_DN_SOME(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Hi Dave, Sima,

here's the drm-misc-next-fixes PR.

Best regards
Thomas

drm-misc-next-fixes-2025-09-25:
Short summary of fixes pull:

bridge:
- waveshare-dsi: Fix error handling in probe function

pixpaper:
- select GEM SHMEM helpers
The following changes since commit 0265d0ebb409a25d3bb3a19494e0173d06d9d132:

  drm/pixpaper: Fix return type of pixpaper_mode_valid() (2025-09-15 12:29:37 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2025-09-25

for you to fetch changes up to 0c4932f6ddf815618fa34f7403df682aed7862b5:

  drm/tiny: pixpaper: Fix missing dependency on DRM_GEM_SHMEM_HELPER (2025-09-23 14:07:04 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

bridge:
- waveshare-dsi: Fix error handling in probe function

pixpaper:
- select GEM SHMEM helpers

----------------------------------------------------------------
LiangCheng Wang (1):
      drm/tiny: pixpaper: Fix missing dependency on DRM_GEM_SHMEM_HELPER

Liu Ying (1):
      drm/bridge: waveshare-dsi: Fix bailout for devm_drm_bridge_alloc()

 drivers/gpu/drm/bridge/waveshare-dsi.c | 4 ++--
 drivers/gpu/drm/tiny/Kconfig           | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
