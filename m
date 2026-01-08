Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5937ED038A1
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 15:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DF510E775;
	Thu,  8 Jan 2026 14:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="17nT0uqj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JXfDqnGH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="17nT0uqj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JXfDqnGH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744B510E775
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 14:51:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2321D5C7ED;
 Thu,  8 Jan 2026 14:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1767883862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=W/eTUG+ysAsgGSdlosKgjYFRQosHCRiLAkuNYwWFQQo=;
 b=17nT0uqjPz0zuGGPN8BFn/IN8UWKB3/64/EgNojzs3caB8vVlpmXObNvPeH5QFysqBxDql
 LFWq/u6aq5kIhOdB5VBlnUx6K2TkU76Jj4nUJM0Nj2vR5MJlv5/f11Q81PSZzRGiq+gvgu
 INVl4dHfsMz1SewAnEnInWIdLRDR/6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1767883862;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=W/eTUG+ysAsgGSdlosKgjYFRQosHCRiLAkuNYwWFQQo=;
 b=JXfDqnGHp6pJ4mjYM9WpoOZEsKI2Xi7ofK6+Z0TqtYp3GjU1CGwAcJ01yCLJT+xSlUfsbU
 1osCB9gSFXt5cxCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1767883862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=W/eTUG+ysAsgGSdlosKgjYFRQosHCRiLAkuNYwWFQQo=;
 b=17nT0uqjPz0zuGGPN8BFn/IN8UWKB3/64/EgNojzs3caB8vVlpmXObNvPeH5QFysqBxDql
 LFWq/u6aq5kIhOdB5VBlnUx6K2TkU76Jj4nUJM0Nj2vR5MJlv5/f11Q81PSZzRGiq+gvgu
 INVl4dHfsMz1SewAnEnInWIdLRDR/6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1767883862;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=W/eTUG+ysAsgGSdlosKgjYFRQosHCRiLAkuNYwWFQQo=;
 b=JXfDqnGHp6pJ4mjYM9WpoOZEsKI2Xi7ofK6+Z0TqtYp3GjU1CGwAcJ01yCLJT+xSlUfsbU
 1osCB9gSFXt5cxCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CBB403EA63;
 Thu,  8 Jan 2026 14:51:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ebp1MFXEX2n0WQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 08 Jan 2026 14:51:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/8] drm, coreboot: Add DRM coreboot driver
Date: Thu,  8 Jan 2026 15:19:40 +0100
Message-ID: <20260108145058.56943-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.992];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[11];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,linux.intel.com,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
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

Coreboot implements framebuffer support via simplefb. Provide a
native DRM driver. Keep the simplefb code for now.

For each firmware's provided framebuffer, we want a dedicated DRM
driver tailored towards the platform's feature set. The coreboot
framebuffer device creates a simplefb device for the provided
framebuffer. When the native graphics driver unloads the simplefb
device, it leaves behind a dangling pointer in the coreboot framebuffer
device. [1] This only works because the coreboot framebuffer device
never runs this code; even after the native driver took over the
hardware. At that point the underlying coreboot framebuffer is gone,
which is inconsistent with kernel state.

Additionally, the simplefb drivers handle simple-framebuffer nodes in
the DeviceTree, but were not meant for supporting arbitrary framebuffers.
The simplefb infrastructure should be phased out for non-DT use cases.
Coreboot is one of the final users of the code (besides n64).

Patches 1 to 4 of this series prepare the kernel's coreboot support for
the DRM driver. With patch 1, the coreboot framebuffer device will only
be created if it really handles the framebuffer. Some systems emulate
UEFI instead. The other 3 patches make coreboot drivers available to
other subsystems. A DRM driver will then be able to bind directly to a
coreboot device.

Patch 5 prepares the kernel's aperture helpers for coreboot devices.
This is required to handover hardware to the native graphics driver.

Patches 6 to 8 prepare DRM and add a new driver for the coreboot
framebuffer. The corebootdrm driver follows the pattern established by
similar drivers. It also uses the same sysfb helpers. It's fairly small
therefore.

Tested on an HP Chromebook with MrChromebox 4.16. Runs with Weston and
fbcon. Xorg requires an additional patch available at [2].

[1] https://elixir.bootlin.com/linux/v6.18/source/drivers/firmware/google/framebuffer-coreboot.c#L92
[2] https://gitlab.freedesktop.org/tzimmermann/xserver/-/commit/0b326aad28549762ed2b0e2bedf8f8a42f1f6b3b

Thomas Zimmermann (8):
  firmware: google: Do sysfb test before creating coreboot framebuffer
  firmware: google: Init coreboot bus with subsys_initcall()
  firmware: google: Clean up include statements in coreboot_table.h
  firmware: google: Export coreboot driver and device interfaces
  video/aperture: Support coreboot devices
  drm/sysfb: Remove duplicate declarations
  drm/sysfb: Generalize pixel-format matching
  drm/sysfb: corebootdrm: Add DRM driver for coreboot framebuffers

 drivers/firmware/google/Kconfig               |   1 +
 drivers/firmware/google/cbmem.c               |   4 +-
 drivers/firmware/google/coreboot_table.c      |  33 +-
 .../firmware/google/framebuffer-coreboot.c    |  20 +-
 drivers/firmware/google/memconsole-coreboot.c |   3 +-
 drivers/firmware/google/vpd.c                 |   3 +-
 drivers/gpu/drm/sysfb/Kconfig                 |  16 +
 drivers/gpu/drm/sysfb/Makefile                |   1 +
 drivers/gpu/drm/sysfb/corebootdrm.c           | 402 ++++++++++++++++++
 drivers/gpu/drm/sysfb/drm_sysfb.c             |  24 ++
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h      |  17 +-
 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c |  30 --
 drivers/gpu/drm/sysfb/efidrm.c                |   8 +-
 drivers/gpu/drm/sysfb/vesadrm.c               |   8 +-
 drivers/video/aperture.c                      |  60 ++-
 include/linux/aperture.h                      |  16 +
 .../linux/coreboot.h                          |  29 +-
 17 files changed, 575 insertions(+), 100 deletions(-)
 create mode 100644 drivers/gpu/drm/sysfb/corebootdrm.c
 rename drivers/firmware/google/coreboot_table.h => include/linux/coreboot.h (86%)

-- 
2.52.0

