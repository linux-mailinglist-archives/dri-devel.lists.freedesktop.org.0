Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A8C1A1D61
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 10:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC2B6E9B6;
	Wed,  8 Apr 2020 08:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B3D6E9B1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 08:26:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 44978AC61;
 Wed,  8 Apr 2020 08:26:54 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: noralf@tronnes.org, daniel@ffwll.ch, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 xinliang.liu@linaro.org, zourongrong@gmail.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul@crapouillou.net, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, jsarha@ti.com, tomi.valkeinen@ti.com,
 sean@poorly.run, hdegoede@redhat.com, kraxel@redhat.com,
 emil.velikov@collabora.com, sam@ravnborg.org, yc_chen@aspeedtech.com,
 tiantao6@hisilicon.com
Subject: [PATCH v2 00/10] Set up generic fbdev after registering device
Date: Wed,  8 Apr 2020 10:26:31 +0200
Message-Id: <20200408082641.590-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generic fbdev emulation is a DRM client. If possible, it should behave
like userspace clients. Therefore it should not run before the driver
registered the new DRM device. If the setup function fails, the driver
should not report an error.

This is a follow-up patchset to the discussion at [1].  I went
through all calls to drm_fbdev_generic_setup(), moved them to the
final operation of their driver's probe function, and removed the
return value.

Built on x86-64, aarch64 and arm. Tested with mgag200.

v2:
	* warn in drm_fbdev_generic_setup() if device is unregistered (Jani)
	* document the new behavior (Sam)
	* fix mediatek subject (Noralf)
	* keep kirin patch for now, even though the patched code will
	  probably be removed

Thomas Zimmermann (10):
  drm/ast: Set up fbdev after registering device; remove error checks
  drm/hibmc: Remove error check from fbdev setup
  drm/kirin: Set up fbdev after fully registering device
  drm/ingenic: Remove error check from fbdev setup
  drm/mediatek: Remove error check from fbdev setup
  drm/mgag200: Set up fbdev after registering device; remove error
    checks
  drm/tilcdc: Set up fbdev after fully registering device
  drm/udl: Remove error check from fbdev setup
  drm/vboxvideo: Set up fbdev after registering device; remove error
    checks
  drm/fb-helper: Remove return value from drm_fbdev_generic_setup()

 drivers/gpu/drm/ast/ast_drv.c                 |  3 +++
 drivers/gpu/drm/ast/ast_main.c                |  5 ----
 drivers/gpu/drm/drm_fb_helper.c               | 25 ++++++++++---------
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  6 +----
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  4 +--
 drivers/gpu/drm/ingenic/ingenic-drm.c         |  4 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  4 +--
 drivers/gpu/drm/mgag200/mgag200_drv.c         |  2 ++
 drivers/gpu/drm/mgag200/mgag200_main.c        |  4 ---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  3 +--
 drivers/gpu/drm/udl/udl_drv.c                 |  6 +----
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |  6 ++---
 include/drm/drm_fb_helper.h                   |  5 ++--
 13 files changed, 30 insertions(+), 47 deletions(-)

--
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
