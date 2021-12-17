Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC06478169
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C28510E192;
	Fri, 17 Dec 2021 00:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F1C10E13E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UcuPE0AoZt0Mctr7vyCREdMtC8eh0mER6sYELdYOusQ=;
 b=HqXGf462SCdbPCA3SGzktWLBHLjyuJV0pn2HoX+JstyRluQVYaDJuNEXJyOo4D0+ZFfxWU
 inUlyO0HXiaVNyDIkAbW1wPSS4wtPsUKMp2glryvB0HYfxZsvwquk8Lxo0cMgv8b3QtSE0
 sDs0JaQNEB4B1X0vAvGSYcvkoWt8YXI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-1zPSbOUkO7-cr4liGjVEjg-1; Thu, 16 Dec 2021 19:37:59 -0500
X-MC-Unique: 1zPSbOUkO7-cr4liGjVEjg-1
Received: by mail-wr1-f71.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so153510wrd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UcuPE0AoZt0Mctr7vyCREdMtC8eh0mER6sYELdYOusQ=;
 b=PKjesDR/um/Zc9yVF+i6Lfwae4JA0ds+5U806qC23TwWrO9lkybvFtz4eRpIzLY2Fe
 U7oPyyjld/OKDXW0r+DJpkxJmz/hj+puFZYIjlaf5sBoCMldCVRgui1ltv2Tcjs9XkuS
 jMgiWflVxyxLHDBmM+fgxlss0E6TWqmYEZImQzoQcBYue/FtzFpQ2NKF4NVflb6QDU9l
 5iuReYY0oQHUdviLSTnSnUKT2IoU0g1gAjBQKk3XQ+0aLrOAo764Z031FStkTDC8rTqf
 +tzPsJ4VUTmF4ozMwQBBfgb6t2yeB8YDg5tCW2ArbTJbTTc0lxCj+DL77QdtzABvJXmq
 sSKQ==
X-Gm-Message-State: AOAM531lcSEU4kZMmqcG4MMIu0JK6b9GVL2Ylien1oSggJhihKywaB4w
 Rw04V6Z0/w89Dxhu3/koTlmxpxD1r2owG28sTVgv/T30hAsVatc/2Qw7LXrz8IRzGlRa/4I7uOM
 vub/ECNbxM7AUhdlDf2ykfw0wc0Sl
X-Received: by 2002:a1c:96:: with SMTP id 144mr7469215wma.126.1639701478055;
 Thu, 16 Dec 2021 16:37:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhvKYqhblogmMzb7NLVERvgIW4LXK0Y/44bPJukQECBSev7UAmtTbdLWWG/yEFd7I6S1UFwg==
X-Received: by 2002:a1c:96:: with SMTP id 144mr7469181wma.126.1639701477776;
 Thu, 16 Dec 2021 16:37:57 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:37:57 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/37] drm: Make drivers to honour the nomodeset parameter
Date: Fri, 17 Dec 2021 01:37:15 +0100
Message-Id: <20211217003752.3946210-1-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Edmund Dea <edmund.j.dea@intel.com>,
 Russell King <linux@armlinux.org.uk>, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Vasut <marex@denx.de>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, Joel Stanley <joel@jms.id.au>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liviu Dudau <liviu.dudau@arm.com>,
 Alison Wang <alison.wang@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Sean Paul <sean@poorly.run>,
 Tomi Valkeinen <tomba@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Sandy Huang <hjc@rock-chips.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Tian Tao <tiantao6@hisilicon.com>,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The nomodeset kernel command line parameter is used to prevent the KMS/DRM
drivers to be registered/probed. But only a few drivers implement support
for this and most DRM drivers just ignore it.

This patch series is a v2 to make DRM drivers to honour nomodeset. It is
posted as separate patches to make easier for drivers maintainers to ack
or pick them independently at their own pace.

The drm_module_{pci,platform}_driver() helper macros are added, which are
just wrappers around module_{pci,platform}_driver() but adding a check for
drm_firmware_drivers_only() and returning -ENODEV if that is true.

PCI and platform DRM drivers are then modified in the following patches to
make use of those macros.

For drivers that have custom module init/exit, the check is added to these
functions instead. Since the drm_*_module_driver() macros are only for the
default case when the init/exit just register/unregister the driver type.

In v1 all KMS/DRM drivers were included but v2 only includes KMS drivers,
and only the the PCI and platform DRM drivers. A follow-up series might
do the same for rendering-only and USB/SPI/I2C drivers, but it will need
more discussion to agree if that's desirable.

I've built tested with 'make allmodconfig && make M=drivers/gpu/drm' but I
don't have hardware to test the drivers, so review/testing is appreciated.

Best regards,
Javier

Changes in v2:
- Add drm_module_{pci,platform}_driver() macros and put the check there
  (Thomas Zimmermann).
- Use the drm_module_*_driver() macros if possible (Thomas Zimmermann).
- Leave the DRM drivers that don't set the DRIVER_MODESET driver feature
  (Lucas Stach).
- Leave USB/SPI/I2C drivers and only include PCI and platform ones
  (Noralf Trønnes).
- Add collected Reviewed-by tags

Javier Martinez Canillas (37):
  drm: Add drm_module_{pci,platform}_driver() helper macros
  drm/hisilicon/hibmc: Use drm_module_pci_driver() to register the
    driver
  drm/komeda: Use drm_module_platform_driver() to register the driver
  drm/arm/hdlcd: Use drm_module_platform_driver() to register the driver
  drm/malidp: Use drm_module_platform_driver() to register the driver
  drm/aspeed: Use drm_module_platform_driver() to register the driver
  drm/atmel-hlcdc: Use drm_module_platform_driver() to register the
    driver
  drm/fsl-dcu: Use drm_module_platform_driver() to register the driver
  drm/hisilicon/kirin: Use drm_module_platform_driver() to register the
    driver
  drm/imx/dcss: Use drm_module_platform_driver() to register the driver
  drm/kmb: Use drm_module_platform_driver() to register the driver
  drm/meson: Use drm_module_platform_driver() to register the driver
  drm: mxsfb: Use drm_module_platform_driver() to register the driver
  drm/shmobile: Use drm_module_platform_driver() to register the driver
  drm/stm: Use drm_module_platform_driver() to register the driver
  drm/sun4i: Use drm_module_platform_driver() to register the driver
  drm/tidss: Use drm_module_platform_driver() to register the driver
  drm/arc: Use drm_module_platform_driver() to register the driver
  drm/tve200: Use drm_module_platform_driver() to register the driver
  drm/xlnx: Use drm_module_platform_driver() to register the driver
  drm/armada: Add support for the nomodeset kernel parameter
  drm/exynos: Add support for the nomodeset kernel parameter
  drm/gma500: Add support for the nomodeset kernel parameter
  drm/hyperv: Add support for the nomodeset kernel parameter
  drm/imx: Add support for the nomodeset kernel parameter
  drm/ingenic: Add support for the nomodeset kernel parameter
  drm/mcde: Add support for the nomodeset kernel parameter
  drm/mediatek: Add support for the nomodeset kernel parameter
  drm/msm: Add support for the nomodeset kernel parameter
  drm/omap: Add support for the nomodeset kernel parameter
  drm: rcar-du: Add support for the nomodeset kernel parameter
  drm/rockchip: Add support for the nomodeset kernel parameter
  drm/sprd: Add support for the nomodeset kernel parameter
  drm/sti: Add support for the nomodeset kernel parameter
  drm/tegra: Add support for the nomodeset kernel parameter
  drm/tilcdc: Add support for the nomodeset kernel parameter
  drm/xen: Add support for the nomodeset kernel parameter

 .../gpu/drm/arm/display/komeda/komeda_drv.c   |  3 +-
 drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
 drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
 drivers/gpu/drm/armada/armada_drv.c           |  3 ++
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c       |  3 ++
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  2 +-
 drivers/gpu/drm/gma500/psb_drv.c              |  3 ++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c       |  3 ++
 drivers/gpu/drm/imx/dcss/dcss-drv.c           |  2 +-
 drivers/gpu/drm/imx/imx-drm-core.c            |  3 ++
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  3 ++
 drivers/gpu/drm/kmb/kmb_drv.c                 |  2 +-
 drivers/gpu/drm/mcde/mcde_drv.c               |  3 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  3 ++
 drivers/gpu/drm/meson/meson_drv.c             |  2 +-
 drivers/gpu/drm/msm/msm_drv.c                 |  3 ++
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  2 +-
 drivers/gpu/drm/omapdrm/omap_drv.c            |  3 ++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  3 ++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  3 ++
 drivers/gpu/drm/shmobile/shmob_drm_drv.c      |  2 +-
 drivers/gpu/drm/sprd/sprd_drm.c               |  3 ++
 drivers/gpu/drm/sti/sti_drv.c                 |  3 ++
 drivers/gpu/drm/stm/drv.c                     |  2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-
 drivers/gpu/drm/tegra/drm.c                   |  3 ++
 drivers/gpu/drm/tidss/tidss_drv.c             |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  3 ++
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 drivers/gpu/drm/tve200/tve200_drv.c           |  2 +-
 drivers/gpu/drm/xen/xen_drm_front.c           |  3 ++
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |  2 +-
 include/drm/drm_drv.h                         | 50 +++++++++++++++++++
 37 files changed, 121 insertions(+), 19 deletions(-)

-- 
2.33.1

