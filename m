Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ECB8BA108
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 21:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC7D112678;
	Thu,  2 May 2024 19:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="K8cC/7mP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KNaX5ZtX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K8cC/7mP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KNaX5ZtX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B7F11265E;
 Thu,  2 May 2024 19:21:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 17BC31FCF6;
 Thu,  2 May 2024 19:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1714677679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=ZXqsBYu/Ng5F1OxLPZUY7dBgxj95fCG+OPrKH3Oi9tI=;
 b=K8cC/7mPT5DbpE5e/O7a/zwCxNcpOiXaEB/g4JArOrHGoRoPoDwO84Hn8LeIRUpgI0pPFD
 mQNzfK0Zu9miSzh/2bQSqZdzfr/T4kAcOrzZ4vhjCnRWM4dza/iw3G8MthgecwZH85vX5r
 w4aCRxe3p5RcLFtsfzGkKi9w+6mx+rE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1714677679;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=ZXqsBYu/Ng5F1OxLPZUY7dBgxj95fCG+OPrKH3Oi9tI=;
 b=KNaX5ZtXpM1DWloHOV0ZxtYTYbKjjX2yx41WW4CPkmNZ/nDOwbE+S7zWRxVXQsNSodphlF
 QExQaUfkTLWwtWAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1714677679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=ZXqsBYu/Ng5F1OxLPZUY7dBgxj95fCG+OPrKH3Oi9tI=;
 b=K8cC/7mPT5DbpE5e/O7a/zwCxNcpOiXaEB/g4JArOrHGoRoPoDwO84Hn8LeIRUpgI0pPFD
 mQNzfK0Zu9miSzh/2bQSqZdzfr/T4kAcOrzZ4vhjCnRWM4dza/iw3G8MthgecwZH85vX5r
 w4aCRxe3p5RcLFtsfzGkKi9w+6mx+rE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1714677679;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=ZXqsBYu/Ng5F1OxLPZUY7dBgxj95fCG+OPrKH3Oi9tI=;
 b=KNaX5ZtXpM1DWloHOV0ZxtYTYbKjjX2yx41WW4CPkmNZ/nDOwbE+S7zWRxVXQsNSodphlF
 QExQaUfkTLWwtWAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B2F031386E;
 Thu,  2 May 2024 19:21:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Zb2SKq7nM2Y/QAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 02 May 2024 19:21:18 +0000
Date: Thu, 2 May 2024 21:21:17 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Subject: [PULL] drm-misc-fixes
Message-ID: <20240502192117.GA12158@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_DN_SOME(0.00)[]
X-Spam-Score: -4.30
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

Hi Dave, Sima,

here's the PR for drm-misc-fixes for this week.

Best regards
Thomas

drm-misc-fixes-2024-05-02:
Short summary of fixes pull:

imagination:
- fix page-count macro

nouveau:
- avoid page-table allocation failures
- fix firmware memory allocation

panel:
- ili9341: avoid OF for device properties; respect deferred probe; fix
usage of errno codes

ttm:
- fix status output

vmwgfx:
- fix legacy display unit
- fix read length in fence signalling
The following changes since commit 78d9161d2bcd442d93d917339297ffa057dbee8c:

  fbdev: fix incorrect address computation in deferred IO (2024-04-24 15:03:37 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-05-02

for you to fetch changes up to da85f0aaa9f21999753b01d45c0343f885a8f905:

  drm/panel: ili9341: Use predefined error codes (2024-05-02 09:41:27 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

imagination:
- fix page-count macro

nouveau:
- avoid page-table allocation failures
- fix firmware memory allocation

panel:
- ili9341: avoid OF for device properties; respect deferred probe; fix
usage of errno codes

ttm:
- fix status output

vmwgfx:
- fix legacy display unit
- fix read length in fence signalling

----------------------------------------------------------------
Andy Shevchenko (3):
      drm/panel: ili9341: Correct use of device property APIs
      drm/panel: ili9341: Respect deferred probe
      drm/panel: ili9341: Use predefined error codes

Ian Forbes (1):
      drm/vmwgfx: Fix Legacy Display Unit

Lyude Paul (2):
      drm/nouveau/firmware: Fix SG_DEBUG error with nvkm_firmware_ctor()
      drm/nouveau/gsp: Use the sg allocator for level 2 of radix3

Matt Coster (1):
      drm/imagination: Ensure PVR_MIPS_PT_PAGE_COUNT is never zero

Zack Rusin (2):
      drm/ttm: Print the memory decryption status just once
      drm/vmwgfx: Fix invalid reads in fence signaled events

 drivers/gpu/drm/imagination/pvr_fw_mips.h         |  5 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  4 +-
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c      | 19 +++---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 77 +++++++++++++++--------
 drivers/gpu/drm/panel/Kconfig                     |  2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c      | 13 ++--
 drivers/gpu/drm/ttm/ttm_tt.c                      |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c             |  2 +-
 9 files changed, 80 insertions(+), 45 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
