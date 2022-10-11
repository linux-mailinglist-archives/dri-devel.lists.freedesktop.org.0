Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908115FB690
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 17:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DBE10E833;
	Tue, 11 Oct 2022 15:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B941010E825
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 15:07:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6E9331F92C;
 Tue, 11 Oct 2022 15:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665500835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=augkMaHC0I3987qNRIF51UWxwXfQVd4W0P3vSWtiW3A=;
 b=Wa80gUpmnS80wGfuFNXI8eLmNbkVfqGbcqrI87D2xq9esfzINaw1pW4avYlf5oqkjOfsTx
 1y2GddS3vaSGgVulIjjlxdfehOV2J+yN+lK5H7FZOdiFFwOdrdAzn9EiwEcSfCBZ+MVlGb
 BLQ/7KvZPXoc5c4vsyr9c8m8WuilTR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665500835;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=augkMaHC0I3987qNRIF51UWxwXfQVd4W0P3vSWtiW3A=;
 b=sVlHbFHKcjJzfAEcRKkPoJhoMeTiylWiFbigThyguhm0FHcIOFOVrevwfqatSGpUb1BulE
 Hz9IaqJX5x+g2FAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 977B6139ED;
 Tue, 11 Oct 2022 15:07:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id h/MJI6KGRWPUTAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Oct 2022 15:07:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de,
 maxime@cerno.tech, sam@ravnborg.org, msuchanek@suse.de,
 benh@kernel.crashing.org, paulus@samba.org, geert@linux-m68k.org,
 mark.cave-ayland@ilande.co.uk
Subject: [PATCH v5 0/5] drm: Add driver for PowerPC OF displays
Date: Tue, 11 Oct 2022 17:07:07 +0200
Message-Id: <20221011150712.3928-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
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

PowerPC's Open Firmware offers a simple display buffer for graphics
output. Add ofdrm, a DRM driver for the device. As with the existing
simpledrm driver, the graphics hardware is pre-initialized by the
firmware. The driver only provides blitting, no actual DRM modesetting
is possible.

Patch 1 adds ofdrm, which has again been significantly reworked.
The FWFB library has been removed infavor of various functions in
existing DRM helper libraries. Ofdrm now supports damage iterators
and synchronization for imported GEM BOs.

Patches 2 to 4 add support for color management. The code has been
taken from fbdev's offb. I have no hardware available for testing the
functionality. Qemu's stdvga apparently does not support gamma tables
in RGB modes. I verified that the color management code is executed
by running Gnome's night-mode settings, but the display's color tone
does not change.

Patch 5, which is new in version 4 of this patchset, adds support for
big-endian scanout buffers. It works at least with qemu's ppc64
emulation. Fbdev emulation and pixman rendering works. GL rendering
produces incorrect colors.

Tested by running fbdev emulation, Wayland Gnome, and Weston on qemu's
ppc64le and ppc64 emulation. 

Thomas Zimmermann (5):
  drm/ofdrm: Add ofdrm for Open Firmware framebuffers
  drm/ofdrm: Add CRTC state
  drm/ofdrm: Add per-model device function
  drm/ofdrm: Support color management
  drm/ofdrm: Support big-endian scanout buffers

 MAINTAINERS                         |    1 +
 drivers/gpu/drm/drm_format_helper.c |   10 +
 drivers/gpu/drm/tiny/Kconfig        |   13 +
 drivers/gpu/drm/tiny/Makefile       |    1 +
 drivers/gpu/drm/tiny/ofdrm.c        | 1424 +++++++++++++++++++++++++++
 drivers/video/fbdev/Kconfig         |    1 +
 6 files changed, 1450 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/ofdrm.c

-- 
2.37.3

