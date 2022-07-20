Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD04657B87F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 16:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA348BB43;
	Wed, 20 Jul 2022 14:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580178B03A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 14:27:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2C9DC34851;
 Wed, 20 Jul 2022 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658327254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ndyTqgDHrwAnRGiKTFcM0pUlQ6zCKyLMtSPcv3dUEvI=;
 b=foVbmkvsWdvUGChCCXU0jXpKoN76BNS/M252S4BtEOB1pY19WzLPmvlFbJOXL1sSHiPyWZ
 L9e1sqdkz/rLs5qOCErxAUzERLr/F7uq/xe13EwhmJ4L8TJchu+iJ4Pi/dNHO8jKc98wIe
 DTEoLyxLyAqusSbMDN0zt65CwhuCDWg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658327254;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ndyTqgDHrwAnRGiKTFcM0pUlQ6zCKyLMtSPcv3dUEvI=;
 b=pZY0KCwwddwZRf0uPX+Z3MZHcVpvAbibSGhx3s4tDi0jFFZfclFKR8NaYAA8TxWpTBKQyn
 mF2LoWhv56JVVECg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D75A713AAD;
 Wed, 20 Jul 2022 14:27:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mvSsM9UQ2GLfHgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Jul 2022 14:27:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de,
 maxime@cerno.tech, sam@ravnborg.org, msuchanek@suse.de, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, geert@linux-m68k.org,
 mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 00/10] drm: Add driver for PowerPC OF displays
Date: Wed, 20 Jul 2022 16:27:22 +0200
Message-Id: <20220720142732.32041-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
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

(was: drm: Add driverof PowerPC OF displays)

PowerPC's Open Firmware offers a simple display buffer for graphics
output. Add ofdrm, a DRM driver for the device. As with the existing
simpledrm driver, the graphics hardware is pre-initialized by the
firmware. The driver only provides blitting, no actual DRM modesetting
is possible.

Version 2 of this patchset starts by cleaning up and refactoring
simpledrm, and moving some of the code in a helper library. These
functions are useful for ofdrm as well.

Patch 7 adds ofdrm, which has been significantly reworked since v1.
PCI is now optional and COMPILE_TEST is supported.

Patches 8 to 10 add support for color management. The code has been
taken from fbdev's offb. I have no hardware available for testing the
functionality. Qemu's stdvga apparently does not support gamma tables
in RGB modes. I verified that the color management code is executed
by running Gnome's night-mode settings, but the display's color tone
does not change.

Thomas Zimmermann (10):
  drm/simpledrm: Remove mem field from device structure
  drm/simpledrm: Inline device-init helpers
  drm/simpledrm: Remove pdev field from device structure
  drm/simpledrm: Compute framebuffer stride if not set
  drm/simpledrm: Convert to atomic helpers
  drm/simpledrm: Move some functionality into fwfb helper library
  drm/ofdrm: Add ofdrm for Open Firmware framebuffers
  drm/ofdrm: Add CRTC state
  drm/ofdrm: Add per-model device function
  drm/ofdrm: Support color management

 Documentation/gpu/drm-kms-helpers.rst |   12 +
 MAINTAINERS                           |    3 +
 drivers/gpu/drm/Kconfig               |    6 +
 drivers/gpu/drm/Makefile              |    3 +-
 drivers/gpu/drm/drm_fwfb_helper.c     |  301 ++++++
 drivers/gpu/drm/tiny/Kconfig          |   15 +
 drivers/gpu/drm/tiny/Makefile         |    1 +
 drivers/gpu/drm/tiny/ofdrm.c          | 1301 +++++++++++++++++++++++++
 drivers/gpu/drm/tiny/simpledrm.c      |  588 +++++------
 drivers/video/fbdev/Kconfig           |    1 +
 include/drm/drm_fwfb_helper.h         |   51 +
 11 files changed, 1949 insertions(+), 333 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_fwfb_helper.c
 create mode 100644 drivers/gpu/drm/tiny/ofdrm.c
 create mode 100644 include/drm/drm_fwfb_helper.h

-- 
2.36.1

