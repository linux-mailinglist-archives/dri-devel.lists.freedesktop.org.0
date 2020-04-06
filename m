Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E3D19FB84
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 19:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B0E6E45C;
	Mon,  6 Apr 2020 17:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580F86E45C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 17:29:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 30594BAEF;
 Mon,  6 Apr 2020 17:29:08 +0000 (UTC)
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
Subject: [PATCH 00/10] Set up generic fbdev after registering device
Date: Mon,  6 Apr 2020 15:43:55 +0200
Message-Id: <20200406134405.6232-1-tzimmermann@suse.de>
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

Built-tested on x86-64, aarch64 and arm.

[1] https://lore.kernel.org/dri-devel/20200403135828.2542770-1-daniel.vetter@ffwll.ch/T/#m216b5b37aeeb7b28d55ad73b7a702b3d1d7bf867

Thomas Zimmermann (10):
  drm/ast: Set up fbdev after registering device; remove error checks
  drm/hibmc: Remove error check from fbdev setup
  drm/kirin: Set up fbdev after fully registering device
  drm/ingenic: Remove error check from fbdev setup
  drm/mediathek: Remove error check from fbdev setup
  drm/mgag200: Set up fbdev after registering device; remove error
    checks
  drm/tilcdc: Set up fbdev after fully registering device
  drm/udl: Remove error check from fbdev setup
  drm/vboxvideo: Set up fbdev after registering device; remove error
    checks
  drm/fb-helper: Remove return value from drm_fbdev_generic_setup()

 drivers/gpu/drm/ast/ast_drv.c                  |  3 +++
 drivers/gpu/drm/ast/ast_main.c                 |  5 -----
 drivers/gpu/drm/drm_fb_helper.c                | 18 ++++++++----------
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |  6 +-----
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |  4 ++--
 drivers/gpu/drm/ingenic/ingenic-drm.c          |  4 +---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c         |  4 +---
 drivers/gpu/drm/mgag200/mgag200_drv.c          |  2 ++
 drivers/gpu/drm/mgag200/mgag200_main.c         |  4 ----
 drivers/gpu/drm/tilcdc/tilcdc_drv.c            |  3 +--
 drivers/gpu/drm/udl/udl_drv.c                  |  6 +-----
 drivers/gpu/drm/vboxvideo/vbox_drv.c           |  6 ++----
 include/drm/drm_fb_helper.h                    |  5 +++--
 13 files changed, 25 insertions(+), 45 deletions(-)

--
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
