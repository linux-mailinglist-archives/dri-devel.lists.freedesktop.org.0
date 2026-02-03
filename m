Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKhpKFj+gWk7NQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 14:55:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE109DA38F
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 14:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6AA10E65F;
	Tue,  3 Feb 2026 13:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="oaKW2tiS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rBVFvwb6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oaKW2tiS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rBVFvwb6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A979510E65F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 13:55:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9A2233E6D1;
 Tue,  3 Feb 2026 13:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770126926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+CIHYkjaXAEWy8odjGr8niNTH0yOibXjwQqar5641gw=;
 b=oaKW2tiSJb8smthB0DNb4RnBMzUQ7Yelzv8VMbLFpQGsWI2oILXxNcpvWRQTKW8XiehYhT
 rXdhv/VpnGTixxu4cN7qqcvCi2zHcss+65QPgbRfoRZEBJPjzrsOy/kaNQCGm0asWRaBRf
 uJjU6/6I4X4ZmsTpH7sWB7hVXFNtoO4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770126926;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+CIHYkjaXAEWy8odjGr8niNTH0yOibXjwQqar5641gw=;
 b=rBVFvwb6Xk0UnfwKjS2NFkpc17h8w9jSZEKCJI2A1nVuAZwd2Dd6NcXAhs4CLvhbtDyfb1
 zCz90FDswjfJb8DQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oaKW2tiS;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rBVFvwb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770126926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+CIHYkjaXAEWy8odjGr8niNTH0yOibXjwQqar5641gw=;
 b=oaKW2tiSJb8smthB0DNb4RnBMzUQ7Yelzv8VMbLFpQGsWI2oILXxNcpvWRQTKW8XiehYhT
 rXdhv/VpnGTixxu4cN7qqcvCi2zHcss+65QPgbRfoRZEBJPjzrsOy/kaNQCGm0asWRaBRf
 uJjU6/6I4X4ZmsTpH7sWB7hVXFNtoO4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770126926;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+CIHYkjaXAEWy8odjGr8niNTH0yOibXjwQqar5641gw=;
 b=rBVFvwb6Xk0UnfwKjS2NFkpc17h8w9jSZEKCJI2A1nVuAZwd2Dd6NcXAhs4CLvhbtDyfb1
 zCz90FDswjfJb8DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B6333EA62;
 Tue,  3 Feb 2026 13:55:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sZgHDU7+gWlGDwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Feb 2026 13:55:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
 javierm@redhat.com, samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 00/12] drm, coreboot: Add DRM coreboot driver
Date: Tue,  3 Feb 2026 14:52:19 +0100
Message-ID: <20260203135519.417931-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tzungbi@kernel.org,m:briannorris@chromium.org,m:jwerner@chromium.org,m:javierm@redhat.com,m:samuel@sholland.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:chrome-platform@lists.linux.dev,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,suse.de:mid,suse.de:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BE109DA38F
X-Rspamd-Action: no action

Coreboot implements framebuffer support via simple-framebuffer. Provide a
dedicated DRM driver. Keep the simple-framebuffer code for now.

For each firmware's provided framebuffer, we prefer a dedicated DRM driver
tailored towards the platform's feature set. The coreboot framebuffer
device currently creates a simple-framebuffer device for the provided
framebuffer aperture. But simple-framebuffer is for DeviceTree nodes; not
for coreboot. The simple-framebuffer infrastructure should be phased out
for non-DT use cases. Coreboot is one of the final users of the code
(besides n64).

Patches 1 to 5 start by fixing problems in the coreboot framebuffer
implementation. There is a possible dangling pointer, the memory is
marked as busy, the device hierarchy is incorrect, and a few minor things.

Patches 6 to 9 prepare the coreboot support for use by external drivers.
Specifically, structures for the entries os the coreboot payload table
have to be exported.

Patches 10 to 12 add corebootdrm, a DRM driver for the new
coreboot-framebuffer platform device. Corebootdrm follows the pattern
established by similar drivers. It also uses the same sysfb helpers. It
is therefore fairly small. With patch 11, it has feature parity with
simpledrm on the old simple-framebuffer. Patch 12 adds support for panel-
orientation flags that coreboot makes available.

Tested on an HP Chromebook with MrChromebox 4.16. Runs with Weston and
fbcon. Xorg requires an additional patch available at [1].

v3:
- avoid packed types for coreboot headers
- comment in various places
- fix typos
v2:
- keep design of coreboot framebuffer code intact (Julius)
- fix bugs in the coreboot framebuffer code
- rewrite corebootdrm as platform device
- support panel orientation

[1] https://gitlab.freedesktop.org/tzimmermann/xserver/-/commit/0b326aad28549762ed2b0e2bedf8f8a42f1f6b3b

Thomas Zimmermann (12):
  firmware: google: framebuffer: Do not unregister platform device
  firmware: google: framebuffer: Do not mark framebuffer as busy
  firmware: google: framebuffer: Init memory resource with helper macro
  firmware: google: framebuffer: Tie platform device to PCI hardware
  firmware: google: framebuffer: Fix dependencies
  firmware: google: Init coreboot bus with subsys_initcall()
  firmware: google: Clean up include statements in coreboot_table.h
  firmware: google: Export coreboot table entries
  firmware: google: Pack structures for coreboot table entries
  drm/sysfb: Generalize pixel-format matching
  drm/sysfb: corebootdrm: Add DRM driver for coreboot framebuffers
  drm/sysfb: corebootdrm: Support panel orientation

 MAINTAINERS                                   |   1 +
 drivers/firmware/google/Kconfig               |   5 +-
 drivers/firmware/google/cbmem.c               |   1 +
 drivers/firmware/google/coreboot_table.c      |  13 +-
 drivers/firmware/google/coreboot_table.h      |  59 +--
 .../firmware/google/framebuffer-coreboot.c    | 126 +++--
 drivers/firmware/google/memconsole-coreboot.c |   1 +
 drivers/firmware/google/vpd.c                 |   1 +
 drivers/gpu/drm/sysfb/Kconfig                 |  16 +
 drivers/gpu/drm/sysfb/Makefile                |   1 +
 drivers/gpu/drm/sysfb/corebootdrm.c           | 434 ++++++++++++++++++
 drivers/gpu/drm/sysfb/drm_sysfb.c             |  24 +
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h      |   8 +-
 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c |  30 --
 drivers/gpu/drm/sysfb/efidrm.c                |   8 +-
 drivers/gpu/drm/sysfb/vesadrm.c               |   8 +-
 include/linux/coreboot.h                      |  90 ++++
 17 files changed, 702 insertions(+), 124 deletions(-)
 create mode 100644 drivers/gpu/drm/sysfb/corebootdrm.c
 create mode 100644 include/linux/coreboot.h


base-commit: 6e53f6296065672f8a0c7f98b4b6c409dac382b4
-- 
2.52.0

