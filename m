Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 374B053A3FB
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 13:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2AF10E7B2;
	Wed,  1 Jun 2022 11:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539A710E737
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 11:25:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E817A21B01;
 Wed,  1 Jun 2022 11:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654082723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tWhcxYxidSJUDUfNlzYZW6u1aMCQQ4bIRGTV+48DOLw=;
 b=Ke2ryj50L86IVGnVpPm+o9BwUc6LrzQVNUjcz17gs5bLPrY3NO9jHxS7TtFeyS1pGxOKox
 7xjlyNnKNHwUdkJOZCN+dp48M29+kMDddSnmebq0MSFh57ZTOSeh+3yZoE115fYfYW4Rdh
 y2WC4zV3PAjGMi7M2ej9li59ZSNzipY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654082723;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tWhcxYxidSJUDUfNlzYZW6u1aMCQQ4bIRGTV+48DOLw=;
 b=uQTsg0J6eSIAa2/khNqYK1lRiP+5IjHTwLUObvlT95Sj4awjOROMupXkhSYaCnclu8WGL/
 /1IZMMX3uF1n04Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C30511330F;
 Wed,  1 Jun 2022 11:25:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NT2GLqNMl2JqMQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Jun 2022 11:25:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 00/10] drm/mgag200: Convert device init to use device-info
 structure
Date: Wed,  1 Jun 2022 13:25:12 +0200
Message-Id: <20220601112522.5774-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the device-init code to use a device-info structure for each
model. The device info contains constants and flags that were previously
located in different places of the code.

Also refactor the PCI and VRAM initialization handling. A later patchset
could convert the PCI magic numbers into constants.

For modesetting, the per-model init functions currently don't do much.
This will change when more model-specific code gets moved there. The
modesetting and PLL code contains model-specific handling that should
be refactored.

Tested with G200 and G200EV hardware.

Thomas Zimmermann (10):
  drm/mgag200: Remove special case for G200SE with <2 MiB
  drm/mgag200: Initialize each model in separate function
  drm/mgag200: Move PCI-option setup into model-specific code
  drm/mgag200: Call mgag200_device_probe_vram() from per-model init
  drm/mgag200: Implement new init logic
  drm/mgag200: Add struct mgag200_device_info
  drm/mgag200: Store HW_BUG_NO_STARTADD flag in device info
  drm/mgag200: Store maximum resolution and memory bandwith in device
    info
  drm/mgag200: Store vidrst flag in device info
  drm/mgag200: Store positions of I2C data and clock bits in device info

 drivers/gpu/drm/mgag200/Makefile          |  14 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c     | 386 ++++++++--------------
 drivers/gpu/drm/mgag200/mgag200_drv.h     | 135 ++++++--
 drivers/gpu/drm/mgag200/mgag200_g200.c    | 200 +++++++++++
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |  50 +++
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |  51 +++
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |  46 +++
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  50 +++
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  60 ++++
 drivers/gpu/drm/mgag200/mgag200_g200se.c  | 130 ++++++++
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  50 +++
 drivers/gpu/drm/mgag200/mgag200_i2c.c     |  27 +-
 drivers/gpu/drm/mgag200/mgag200_mm.c      | 116 -------
 drivers/gpu/drm/mgag200/mgag200_mode.c    | 100 ++----
 drivers/gpu/drm/mgag200/mgag200_pll.c     |  12 +-
 drivers/gpu/drm/mgag200/mgag200_reg.h     |   2 +
 16 files changed, 942 insertions(+), 487 deletions(-)
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200eh.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200eh3.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200er.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200ev.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200ew3.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200se.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200wb.c
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_mm.c


base-commit: 2c8cc5cd20e28afe6b63acb28890e5f57d9bf055
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
-- 
2.36.1

