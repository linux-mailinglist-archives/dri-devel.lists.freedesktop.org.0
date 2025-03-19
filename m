Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E600BA686DB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 09:34:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2729010E004;
	Wed, 19 Mar 2025 08:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="wJgAEGAJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zJHEX+Ho";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wJgAEGAJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zJHEX+Ho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D805710E004
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 08:33:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7B2741F7C4;
 Wed, 19 Mar 2025 08:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742373232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8hmY+5/Br0QBFV23UYNiiYKXmc14i2Nyc+uoucGQsz8=;
 b=wJgAEGAJi5L8q0TjYSIsPpsWB3W1GBdZyJ1VIgA8MgHhNpnEd/8AWb1Hjf1hJVXgYAizre
 imBIbFqYshvyiDxDGpYNqD8jJb8vw4ykEJD+neVrFKzyx0Gc7Ofto0GnHIwafjliOsWk7K
 7Ki5P/X/WdrqlTwyw6RKypb9l/HTDLA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742373232;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8hmY+5/Br0QBFV23UYNiiYKXmc14i2Nyc+uoucGQsz8=;
 b=zJHEX+HoOqhaNNC3d2tXmEsXb7GbqOayPYmwpCC9Z2/aoXljIFmWA4b3KPSCZyfDQd5/Wn
 aYT39gR25ZOf/6BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742373232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8hmY+5/Br0QBFV23UYNiiYKXmc14i2Nyc+uoucGQsz8=;
 b=wJgAEGAJi5L8q0TjYSIsPpsWB3W1GBdZyJ1VIgA8MgHhNpnEd/8AWb1Hjf1hJVXgYAizre
 imBIbFqYshvyiDxDGpYNqD8jJb8vw4ykEJD+neVrFKzyx0Gc7Ofto0GnHIwafjliOsWk7K
 7Ki5P/X/WdrqlTwyw6RKypb9l/HTDLA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742373232;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8hmY+5/Br0QBFV23UYNiiYKXmc14i2Nyc+uoucGQsz8=;
 b=zJHEX+HoOqhaNNC3d2tXmEsXb7GbqOayPYmwpCC9Z2/aoXljIFmWA4b3KPSCZyfDQd5/Wn
 aYT39gR25ZOf/6BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44B9813A2C;
 Wed, 19 Mar 2025 08:33:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id pAiBD3CB2mc+OQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Mar 2025 08:33:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/18] drm: Provide helpers for system framebuffers and add
 efidrm/vesadrm
Date: Wed, 19 Mar 2025 08:44:59 +0100
Message-ID: <20250319083021.6472-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[opensuse.org:url,imap1.dmz-prg2.suse.org:helo]; 
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

This series simplifies the existing ofdrm and simepldrm drivers,
and adds new drivers for EFI- and VESA-based framebuffers. Existing
drivers for system framebuffers, ofdrm and simpledrm, share much of
their mode-setting pipeline. The major difference between the two
drivers is in how they retrieve the framebuffer from the systems.
Hence, it makes sense to share some of the pipeline implementation.
With the shared helpers in place, we can then add dedicated drivers
for EFI and VESA easily.

Patches 1 to 3 clean up obsolete artifacts from ofdrm and simpledrm.

Patch 4 moves both drivers from tiny/ into their own subdirectory
sysfb/. The name aligns with the naming in drivers/firmware/sysfb.c
to signal the connection. It's the firmware code that creates most
of the system-framebuffer devices that these drivers operate on. The
patch also adds a separate menu in Kconfig.

Patches 5 to 11 unify the mode-setting pipeline between ofdrm and
simpledrm. Either both drivers already use the same implementation
or they can easily do so. There've been previous attempts to unify
some of the drivers' code, but with little success. This time the
helpers will be shared among 4 drivers, so it's already much more
successful than before.

Patch 12 adds EDID support to ofdrm. The EDID data can be found in
some Macintosh's DeviceTree next to the framebuffer configuration.
EDID support will be useful for EFI and VESA as well.

Patch 13 adds another helper for screen_info that will be required
by EFI and VESA drivers.

Patch 14 and 15 add efidrm, a DRM driver that operates on EFI-provided
framebuffers. It uses the shared sysfb helpers. The immediate benefit
over simpledrm is the support for EFI's various types of memory caching
on the framebuffer. Simpledrm only supported WriteCombine caching.
There's also EDID support if the kernel's edid_info has been initialized.
This feature needs to be implemented in the kernel's efistub library.

Patches 16 to 18 add vesadrm, a DRM driver that operates in VESA-
provided framebuffers. It is very much like efidrm, but tailored
towards VESA features. It has EDID support and there's a patch at [1]
for grub to provide the data as part of the kernel's boot parameters.
Vesadrm also supports gamma ramps. Together with EDID, this allows
for gamma correction and night mode. Gnome already does that.

Future directions: Efidrm requires EDID data that has to be provided
by the efistub library. There is an EFI call to do so. Vesadrm currently
requires a discrete color mode. Support for palette modes can be added
later. There's still a bit of code duplication among palette handling.
We have more drivers that use similar code for palette LUTs, such as
ast and mgag200. We should try to provide generic palette helpers for
all these drivers.

This series has been tested on various devices that require the provided
drivers.

[1] https://build.opensuse.org/projects/home:tdz:branches:Base:System/packages/grub2/files/grub2-provide-edid.patch?expand=1

Thomas Zimmermann (18):
  drm/ofdrm: Remove struct ofdrm_device.pdev
  drm/ofdrm: Open-code drm_simple_encoder_init()
  drm/simpledrm: Remove struct simpledrm_device.nformats
  drm: Move sysfb drivers into separate subdirectory
  drm/sysfb: Add struct drm_sysfb_device
  drm/sysfb: Provide single mode-init helper
  drm/sysfb: Merge mode-config functions
  drm/sysfb: Merge connector functions
  drm/sysfb: Maintain CRTC state in struct drm_sysfb_crtc_state
  drm/sysfb: Merge CRTC functions
  drm/sysfb: Merge primary-plane functions
  drm/sysfb: ofdrm: Add EDID support
  firmware: sysfb: Move bpp-depth calculation into screen_info helper
  drm/sysfb: Add efidrm for EFI displays
  drm/sysfb: efidrm: Add EDID support
  drm/sysfb: Add vesadrm for VESA displays
  drm/sysfb: vesadrm: Add EDID support
  drm/sysfb: vesadrm: Add gamma correction

 MAINTAINERS                                 |   3 +-
 drivers/firmware/sysfb_simplefb.c           |  31 +-
 drivers/gpu/drm/Kconfig                     |   2 +
 drivers/gpu/drm/Makefile                    |   1 +
 drivers/gpu/drm/sysfb/Kconfig               |  76 +++
 drivers/gpu/drm/sysfb/Makefile              |   8 +
 drivers/gpu/drm/sysfb/drm_sysfb_helper.c    | 319 ++++++++++
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h    | 136 ++++
 drivers/gpu/drm/sysfb/efidrm.c              | 495 +++++++++++++++
 drivers/gpu/drm/{tiny => sysfb}/ofdrm.c     | 364 ++---------
 drivers/gpu/drm/{tiny => sysfb}/simpledrm.c | 237 +------
 drivers/gpu/drm/sysfb/vesadrm.c             | 660 ++++++++++++++++++++
 drivers/gpu/drm/tiny/Kconfig                |  32 -
 drivers/gpu/drm/tiny/Makefile               |   2 -
 drivers/video/screen_info_generic.c         |  36 ++
 include/linux/screen_info.h                 |   9 +
 include/video/pixel_format.h                |  41 ++
 17 files changed, 1885 insertions(+), 567 deletions(-)
 create mode 100644 drivers/gpu/drm/sysfb/Kconfig
 create mode 100644 drivers/gpu/drm/sysfb/Makefile
 create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb_helper.c
 create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb_helper.h
 create mode 100644 drivers/gpu/drm/sysfb/efidrm.c
 rename drivers/gpu/drm/{tiny => sysfb}/ofdrm.c (75%)
 rename drivers/gpu/drm/{tiny => sysfb}/simpledrm.c (76%)
 create mode 100644 drivers/gpu/drm/sysfb/vesadrm.c
 create mode 100644 include/video/pixel_format.h

-- 
2.48.1

