Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B86F386C43E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6361410E385;
	Thu, 29 Feb 2024 08:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="M1m7sqFq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uGuzMgmZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M1m7sqFq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uGuzMgmZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CE010E385;
 Thu, 29 Feb 2024 08:53:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3F945228E4;
 Thu, 29 Feb 2024 08:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709196813; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=0cJH8I45VoLCuP6O+LhlP2KE+Wv6PaXjRZdZXC3fSDo=;
 b=M1m7sqFqwiPxiU0yhSOF5ZQHOiDs4nTJXKR3+uwsvnXGsnoVoH0J5uqNzJjOFX0Ql8LD7o
 wKbJjhs5WN+9n8h4OsvK2eLUmQBa4tqcB1XYtRCFOUMFmUm0BNVUksMPtjaKXzkTg3D7Dk
 Jo7HBnUnVAvADDcA2TNnjhWE+QOb8A8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709196813;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=0cJH8I45VoLCuP6O+LhlP2KE+Wv6PaXjRZdZXC3fSDo=;
 b=uGuzMgmZsMJIfDE826KF2BqRYn/dBiNxwCeDnWV2wnY62GDbOVg7o5a1jgXcFT0vwIUoh7
 qOg1tfYT0RynqaBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709196813; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=0cJH8I45VoLCuP6O+LhlP2KE+Wv6PaXjRZdZXC3fSDo=;
 b=M1m7sqFqwiPxiU0yhSOF5ZQHOiDs4nTJXKR3+uwsvnXGsnoVoH0J5uqNzJjOFX0Ql8LD7o
 wKbJjhs5WN+9n8h4OsvK2eLUmQBa4tqcB1XYtRCFOUMFmUm0BNVUksMPtjaKXzkTg3D7Dk
 Jo7HBnUnVAvADDcA2TNnjhWE+QOb8A8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709196813;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=0cJH8I45VoLCuP6O+LhlP2KE+Wv6PaXjRZdZXC3fSDo=;
 b=uGuzMgmZsMJIfDE826KF2BqRYn/dBiNxwCeDnWV2wnY62GDbOVg7o5a1jgXcFT0vwIUoh7
 qOg1tfYT0RynqaBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C931513A58;
 Thu, 29 Feb 2024 08:53:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zRvFLwxG4GUYUQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 29 Feb 2024 08:53:32 +0000
Date: Thu, 29 Feb 2024 09:53:31 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
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
Message-ID: <20240229085331.GA25863@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.989]; RCPT_COUNT_TWELVE(0.00)[16];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
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

here's the release cycle's first PR for drm-misc-next-fixes.

Best regards
Thomas

drm-misc-next-fixes-2024-02-29:
Short summary of fixes pull:

i915:
- Fix NULL-pointer deref

imx:
- dcss: Fix resource-size calculation

firmware:
- sysfb: Fix returned error code
The following changes since commit f112b68f273fb0121cb64e0c3ac06adcb91e32b8:

  Merge v6.8-rc6 into drm-next (2024-02-26 11:41:07 +0100)

are available in the Git repository at:

  https://anongit.freedesktop.org/git/drm/drm-misc tags/drm-misc-next-fixes-2024-02-29

for you to fetch changes up to 9cb3542aeeac31b3dd6b5a7d58b9b7d6fe9fd2bc:

  drm/imx/dcss: fix resource size calculation (2024-02-28 09:16:59 +0000)

----------------------------------------------------------------
Short summary of fixes pull:

i915:
- Fix NULL-pointer deref

imx:
- dcss: Fix resource-size calculation

firmware:
- sysfb: Fix returned error code

----------------------------------------------------------------
Dan Carpenter (2):
      firmware/sysfb: fix an error code in sysfb_init()
      drm/imx/dcss: fix resource size calculation

Thomas Zimmermann (1):
      Merge drm/drm-next into drm-misc-next-fixes

Tvrtko Ursulin (1):
      drm/i915: Fix possible null pointer dereference after drm_dbg_printer conversion

 drivers/firmware/sysfb.c                         | 4 +++-
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 4 ++--
 drivers/gpu/drm/imx/dcss/dcss-dev.c              | 4 +---
 3 files changed, 6 insertions(+), 6 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
