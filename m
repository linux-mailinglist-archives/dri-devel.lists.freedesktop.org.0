Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB935770A1
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 20:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426BC10E204;
	Sat, 16 Jul 2022 18:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF3810E204
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 18:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=AsxPGsDad56TWDDg1flcW06rCUhwPhNrnnuaH/4673M=;
 b=KTVKTkoDdhOh2ISxwRIDgDGHMqVOlrxDZZKZcjZS4crEDaDP+XXKtxn4DZdf6BU8AoHpc7Vs8Uup7
 a/STJS8Hxwxb9fINRZdudwihlxeiiNzC94WKlNiDn/SsgjSiTcqTywx/99pUL8g0I4hbfzrz7cm2tI
 ER8Bx0cA/K2VmO5Gwov0yOJBdziZ9XE7AM+t+rPxwwfEZ/1BhLIeJmNM1nVahB3SUnz0/GwlvPlHY0
 FwcXl+JJ2sHJqf9YTmF2eN3M958KreWZnx3a1aZh99bDmA6P9nXw2J6TBItla81EvE8GXg8vWxEx2S
 QXSX3kzKUDDWP/2QSZYyKgZ6ramxjaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=AsxPGsDad56TWDDg1flcW06rCUhwPhNrnnuaH/4673M=;
 b=kNml+FUi/6Nznv712i5IId6HlIVqHgR9MGRCXKB2WjJI+GwxzMe+k8D2fZQBEBt7wcVLJj7Y5E59Q
 DerxFZrDg==
X-HalOne-Cookie: 8f0700b8b7b99a6f2d56bb81bfb9e6231a4e8224
X-HalOne-ID: a14358cf-0533-11ed-a917-d0431ea8a290
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id a14358cf-0533-11ed-a917-d0431ea8a290;
 Sat, 16 Jul 2022 18:18:02 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/11] drm: move dri1 drivers to drm/dri1/
Date: Sat, 16 Jul 2022 20:17:39 +0200
Message-Id: <20220716181750.3874838-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While discussing the way forward for the via driver
Javier came up with the proposal to move all DRI1 drivers
to their own folder.

The idea is to move the old DRI1 drivers so one do not
accidentally consider them modern drivers.

This set of patches implements this idea.

To prepare the move, DRIVER_LEGACY and CONFIG_DRM_LEGACY
are both renamed to *_DRI1. This makes it more obvious
that we are dealing with DRI1 drivers, as we have
a lot of other legacy support.

The drivers continue to have their own sub-directory
so the driver files are not mixed with the core files
which are copied in the last commit.

The DRI1 specific part of drm/Kconfig is likewise pulled
out and located in the dri1/ folder.

Feedback welcome!

	Sam

Sam Ravnborg (11):
      drm: rename DRIVER_LEGACY to DRIVER_DRI1
      drm: Rename CONFIG_DRM_LEGACY to CONFIG_DRM_DRI1
      drm/tdfx: Move the tdfx driver to drm/dri1/
      drm/r128: Move the r128 driver to drm/dri1/
      drm/i810: Move the i810 driver to drm/dri1/
      drm/mga: Move the mga driver to drm/dri1/
      drm/sis: Move the sis driver to drm/dri1/
      drm/via: Move the via driver to drm/dri1/
      drm/savage: Move the savage driver to drm/dri1/
      drm/dri1: Move Kconfig logic to drm/dri1
      drm: Move dri1 core files to drm/dri1

 arch/powerpc/configs/pmac32_defconfig              |  2 +-
 arch/powerpc/configs/ppc6xx_defconfig              |  2 +-
 drivers/char/agp/Makefile                          |  2 +-
 drivers/char/agp/agp.h                             |  2 +-
 drivers/gpu/drm/Kconfig                            | 79 +---------------------
 drivers/gpu/drm/Makefile                           | 18 +++--
 drivers/gpu/drm/dri1/Kconfig                       | 79 ++++++++++++++++++++++
 drivers/gpu/drm/dri1/Makefile                      | 11 +++
 drivers/gpu/drm/{ => dri1}/drm_agpsupport.c        |  4 +-
 drivers/gpu/drm/{ => dri1}/drm_bufs.c              | 22 +++---
 drivers/gpu/drm/{ => dri1}/drm_context.c           | 24 +++----
 drivers/gpu/drm/{ => dri1}/drm_dma.c               |  4 +-
 drivers/gpu/drm/{ => dri1}/drm_hashtab.c           |  0
 drivers/gpu/drm/{ => dri1}/drm_irq.c               |  6 +-
 drivers/gpu/drm/{ => dri1}/drm_legacy_misc.c       |  2 +-
 drivers/gpu/drm/{ => dri1}/drm_lock.c              |  6 +-
 drivers/gpu/drm/{ => dri1}/drm_memory.c            |  0
 drivers/gpu/drm/{ => dri1}/drm_scatter.c           |  6 +-
 drivers/gpu/drm/{ => dri1}/drm_vm.c                |  2 +-
 drivers/gpu/drm/{ => dri1}/i810/Makefile           |  0
 drivers/gpu/drm/{ => dri1}/i810/i810_dma.c         |  0
 drivers/gpu/drm/{ => dri1}/i810/i810_drv.c         |  2 +-
 drivers/gpu/drm/{ => dri1}/i810/i810_drv.h         |  0
 drivers/gpu/drm/{ => dri1}/mga/Makefile            |  0
 drivers/gpu/drm/{ => dri1}/mga/mga_dma.c           |  0
 drivers/gpu/drm/{ => dri1}/mga/mga_drv.c           |  2 +-
 drivers/gpu/drm/{ => dri1}/mga/mga_drv.h           |  0
 drivers/gpu/drm/{ => dri1}/mga/mga_ioc32.c         |  0
 drivers/gpu/drm/{ => dri1}/mga/mga_irq.c           |  0
 drivers/gpu/drm/{ => dri1}/mga/mga_state.c         |  0
 drivers/gpu/drm/{ => dri1}/mga/mga_warp.c          |  0
 drivers/gpu/drm/{ => dri1}/r128/Makefile           |  0
 drivers/gpu/drm/{ => dri1}/r128/ati_pcigart.c      |  0
 drivers/gpu/drm/{ => dri1}/r128/ati_pcigart.h      |  0
 drivers/gpu/drm/{ => dri1}/r128/r128_cce.c         |  0
 drivers/gpu/drm/{ => dri1}/r128/r128_drv.c         |  2 +-
 drivers/gpu/drm/{ => dri1}/r128/r128_drv.h         |  0
 drivers/gpu/drm/{ => dri1}/r128/r128_ioc32.c       |  0
 drivers/gpu/drm/{ => dri1}/r128/r128_irq.c         |  0
 drivers/gpu/drm/{ => dri1}/r128/r128_state.c       |  0
 drivers/gpu/drm/{ => dri1}/savage/Makefile         |  0
 drivers/gpu/drm/{ => dri1}/savage/savage_bci.c     |  0
 drivers/gpu/drm/{ => dri1}/savage/savage_drv.c     |  2 +-
 drivers/gpu/drm/{ => dri1}/savage/savage_drv.h     |  0
 drivers/gpu/drm/{ => dri1}/savage/savage_state.c   |  0
 drivers/gpu/drm/{ => dri1}/sis/Makefile            |  0
 drivers/gpu/drm/{ => dri1}/sis/sis_drv.c           |  2 +-
 drivers/gpu/drm/{ => dri1}/sis/sis_drv.h           |  0
 drivers/gpu/drm/{ => dri1}/sis/sis_mm.c            |  0
 drivers/gpu/drm/{ => dri1}/tdfx/Makefile           |  0
 drivers/gpu/drm/{ => dri1}/tdfx/tdfx_drv.c         |  2 +-
 drivers/gpu/drm/{ => dri1}/tdfx/tdfx_drv.h         |  0
 drivers/gpu/drm/{ => dri1}/via/Makefile            |  4 +-
 drivers/gpu/drm/{via/via_dri1.c => dri1/via/via.c} |  4 +-
 drivers/gpu/drm/drm_drv.c                          |  2 +-
 drivers/gpu/drm/drm_file.c                         | 12 ++--
 drivers/gpu/drm/drm_internal.h                     |  2 +-
 drivers/gpu/drm/drm_ioc32.c                        | 12 ++--
 drivers/gpu/drm/drm_ioctl.c                        |  4 +-
 drivers/gpu/drm/drm_legacy.h                       | 32 ++++-----
 drivers/gpu/drm/drm_pci.c                          | 12 ++--
 drivers/gpu/drm/drm_vblank.c                       | 12 ++--
 include/drm/drm_auth.h                             |  2 +-
 include/drm/drm_device.h                           |  4 +-
 include/drm/drm_drv.h                              | 10 +--
 include/drm/drm_file.h                             |  2 +-
 include/drm/drm_legacy.h                           |  2 +-
 67 files changed, 205 insertions(+), 194 deletions(-)


