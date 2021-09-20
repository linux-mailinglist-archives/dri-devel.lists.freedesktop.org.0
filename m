Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B416411676
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 16:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA016E507;
	Mon, 20 Sep 2021 14:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820816E505
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 14:10:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DED1F200DA;
 Mon, 20 Sep 2021 14:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632147052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=r4W3l3w7G7PosLDNZO4xuLdCs1lO09arT+fReeRvKwM=;
 b=OLJ7uRa4fP0JrE/FBXauZXbpg6L+AOp1kiYTKkOXV1OJgYYnehu/zV0lemoz0re0WiD1/E
 jQ0JHuYvr8vG+CHTfk0HidJZeoWl+LgSfTUxr7Am6mvtDHKVBjEYj39pIXagk7/mQDvoI1
 p4rlQofoevJiy9w+CWdJ/nvPaW3zWU4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632147052;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=r4W3l3w7G7PosLDNZO4xuLdCs1lO09arT+fReeRvKwM=;
 b=CPFHC5QXCec1KsvJf1ER4lsR0vmx6qKj/FQutktr0zzslKZy+VstzKr+/VjrNqnCp9lADh
 r3T4ACooKKPmXECw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C093713A71;
 Mon, 20 Sep 2021 14:10:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gxIRLmyWSGG0cgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Sep 2021 14:10:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/5] drm/gma500: Managed cleanup
Date: Mon, 20 Sep 2021 16:10:46 +0200
Message-Id: <20210920141051.30988-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch gma500 to managed cleanup and remove the manual cleanup
code from the driver's PCI callbacks.

Managed cleanup involves embedding the DRM device structure in the
driver's structure. In preparation, patch 1 replaces references all
references to dev_private with a helper function.

Patch 2 adds managed cleanup for pci_enable_device().

Patches 3 and 4 embed struct drm_device in struct_drm_psb_private. The
structure's memory is being automatically released.

Patch 5 adds managed cleanup for the device resources. Instead of
calling the large, monolithic function psb_driver_unload(), the release
code could be split up split into smaller helpers and reuse exising
functionality from devres.

Future work: for a number of drivers, the PCI remove callback contains
only a single call to drm_device_unregister(). In a later patchset,
this could be implemented as another shared helper within DRM.

Tested on Atom N2800 hardware.

Thomas Zimmermann (5):
  drm/gma500: Replace references to dev_private with helper function
  drm/gma500: Disable PCI device during shutdown
  drm/gma500: Embed struct drm_device in struct drm_psb_private
  drm/gma500: Remove dev_priv branch from unload function
  drm/gma500: Managed device release

 drivers/gpu/drm/gma500/backlight.c         |  12 +-
 drivers/gpu/drm/gma500/cdv_device.c        |  24 ++--
 drivers/gpu/drm/gma500/cdv_intel_display.c |  10 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c      |  12 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c    |  22 +--
 drivers/gpu/drm/gma500/framebuffer.c       |  16 +--
 drivers/gpu/drm/gma500/gem.c               |   2 +-
 drivers/gpu/drm/gma500/gma_device.c        |   2 +-
 drivers/gpu/drm/gma500/gma_display.c       |  14 +-
 drivers/gpu/drm/gma500/gtt.c               |  18 +--
 drivers/gpu/drm/gma500/intel_bios.c        |  10 +-
 drivers/gpu/drm/gma500/intel_gmbus.c       |  12 +-
 drivers/gpu/drm/gma500/mid_bios.c          |  11 +-
 drivers/gpu/drm/gma500/mmu.c               |  12 +-
 drivers/gpu/drm/gma500/oaktrail_crtc.c     |   8 +-
 drivers/gpu/drm/gma500/oaktrail_device.c   |  20 +--
 drivers/gpu/drm/gma500/oaktrail_hdmi.c     |  18 +--
 drivers/gpu/drm/gma500/oaktrail_lvds.c     |  14 +-
 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c |   2 +-
 drivers/gpu/drm/gma500/opregion.c          |  14 +-
 drivers/gpu/drm/gma500/power.c             |  20 +--
 drivers/gpu/drm/gma500/psb_device.c        |  16 +--
 drivers/gpu/drm/gma500/psb_drv.c           | 147 ++++++++++-----------
 drivers/gpu/drm/gma500/psb_drv.h           |  24 ++--
 drivers/gpu/drm/gma500/psb_intel_display.c |  10 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c    |  31 ++---
 drivers/gpu/drm/gma500/psb_intel_sdvo.c    |  10 +-
 drivers/gpu/drm/gma500/psb_irq.c           |  26 ++--
 drivers/gpu/drm/gma500/psb_lid.c           |   2 +-
 29 files changed, 261 insertions(+), 278 deletions(-)

--
2.33.0

