Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1079ACFD7E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 09:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF4310E35C;
	Fri,  6 Jun 2025 07:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="VRJtfjfI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9bNbFGIl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lrnaRrZ7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hdnylJPt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382E710E8CF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 07:28:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E0B8233681;
 Fri,  6 Jun 2025 07:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749194936; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=tC4AXg7TbV+BRemd7lg7PMHB48GtMI3cn/p5bEGX3RA=;
 b=VRJtfjfIxyipdroX/KK3ikOaUMTP//eg2NYqdaHsQEZ0NfhoNNAxt9UMUaaJbA462p7/+u
 pZygS8BG5pdFqHLzg9xlyf4qKv3Wgy6NeBlsFopsiWB6UVfhtS21hdYfxZaku5S6blgpqr
 EtYHprsKXU4WDLITm3TGo1PETdYn7N8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749194936;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=tC4AXg7TbV+BRemd7lg7PMHB48GtMI3cn/p5bEGX3RA=;
 b=9bNbFGIl99YPq3SHmWfZbEWhfjk5KT4i0lr2pRFcNwV9nzdBI4fP5PFFtCKaQ2exwSOiUJ
 Xa+Z4AF2pkl5KvCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749194935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=tC4AXg7TbV+BRemd7lg7PMHB48GtMI3cn/p5bEGX3RA=;
 b=lrnaRrZ7o2EnkCJrknCmaT4qrSlAp+oAzBKWHrNCA+6U1s+53+6nb7BgqEls0czEmcW89Q
 NvIe3tpzS1HAV1gSkA0EJ+ryrkGX3n3Bj7my/sdONdASAIP3f5NNCFu6uH5HQ+1hACUyps
 f7tIYGT/d6//ggBcfmCuWeyEqVkThq0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749194935;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=tC4AXg7TbV+BRemd7lg7PMHB48GtMI3cn/p5bEGX3RA=;
 b=hdnylJPtg3Rzs9Lo4D+Xz915UpuurPLcS78/eDh60wFMKhoD4e1b44erXaA6lIIbOqrPzF
 9hFMZoIakkAsNVDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 736621336F;
 Fri,  6 Jun 2025 07:28:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DAFYGreYQmhgcAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Jun 2025 07:28:55 +0000
Date: Fri, 6 Jun 2025 09:28:53 +0200
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
Subject: [PULL] drm-misc-fixes
Message-ID: <20250606072853.GA13099@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Hi Dave, Sima,

here's the PR from drm-misc-fixes for this week. It's a bit later
due to merge-window confusion. The fixes for sysfb and video also
affect fbdev.

Best regards
Thomas

drm-misc-fixes-2025-06-06:
Short summary of fixes pull:

ivpu:
- gem: Use dma-resv lock
- gem. Fix a warning
- Trigger recovery on device engine reset/resume failure

panel:
- panel-simple: Fix settings for Evervision VGG644804

sysfb:
- Fix screen_info type check

video:
- Update screen_info for relocated PCI framebuffers
The following changes since commit 4557cc834712eca4eae7adbd9f0a06bdd8f79c99:

  accel/ivpu: Reorder Doorbell Unregister and Command Queue Destruction (2025-05-28 11:49:29 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-06-06

for you to fetch changes up to f670b50ef5e4a69bf4d2ec5ac6a9228d93b13a7a:

  sysfb: Fix screen_info type check for VGA (2025-06-05 17:54:31 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

ivpu:
- gem: Use dma-resv lock
- gem. Fix a warning
- Trigger recovery on device engine reset/resume failure

panel:
- panel-simple: Fix settings for Evervision VGG644804

sysfb:
- Fix screen_info type check

video:
- Update screen_info for relocated PCI framebuffers

----------------------------------------------------------------
Jacek Lawrynowicz (2):
      accel/ivpu: Use dma_resv_lock() instead of a custom mutex
      accel/ivpu: Fix warning in ivpu_gem_bo_free()

Karol Wachowski (1):
      accel/ivpu: Trigger device recovery on engine reset/resume failure

Michael Walle (1):
      drm/panel-simple: fix the warnings for the Evervision VGG644804

Thomas Zimmermann (2):
      video: screen_info: Relocate framebuffers behind PCI bridges
      sysfb: Fix screen_info type check for VGA

 drivers/accel/ivpu/ivpu_gem.c        | 68 +++++++++++++++++---------------
 drivers/accel/ivpu/ivpu_gem.h        |  1 -
 drivers/accel/ivpu/ivpu_job.c        |  6 ++-
 drivers/accel/ivpu/ivpu_jsm_msg.c    |  9 ++++-
 drivers/firmware/sysfb.c             | 26 +++++++++----
 drivers/gpu/drm/panel/panel-simple.c |  5 ++-
 drivers/video/screen_info_pci.c      | 75 +++++++++++++++++++++++-------------
 7 files changed, 117 insertions(+), 73 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
