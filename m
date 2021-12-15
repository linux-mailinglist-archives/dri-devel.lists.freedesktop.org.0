Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7359D474FC2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E265510E14D;
	Wed, 15 Dec 2021 01:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCBF10E135
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vBf2LRURKsRzlb+vhaJGWIb0ImHMSAjNCVFgOW2fQD8=;
 b=drb4UXoHfjHzbMyHpH5sUpAWWrtLqy45UUS8NPv38zZJFkU3T3+pH2FJAAhT/xic7hPSw8
 6UXbQXaLnOR2ZkfAJ2VC/CDQDOSCoKGkSF2sgsydsOWUOWbjJcfelvEFDvF9WP0szLbEHq
 y3TAq5oR4ITzG2tdRQIk4hk95c1xloM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-OUNKCT4BOw-OJksKN529Rg-1; Tue, 14 Dec 2021 20:00:51 -0500
X-MC-Unique: OUNKCT4BOw-OJksKN529Rg-1
Received: by mail-wr1-f72.google.com with SMTP id
 h7-20020adfaa87000000b001885269a937so5415704wrc.17
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:00:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vBf2LRURKsRzlb+vhaJGWIb0ImHMSAjNCVFgOW2fQD8=;
 b=X6CJw0FvwlQNP1bHqXNxuUYAiB/PiwJeAVMHKo24/0LHCo8mF2iS2zgYnuHEkcZujT
 d7J5agcXlL1iVjChJpaJGd8WuvtgWdRxY6yEXE3A7cWDm5D1nIwpJW+mWhdc3tFALyOy
 sidUqk6VpZQZDiFuiZkUu45hKTSI85nZT1BAuj3aHHQvRlU28TWVX/PN4SoTjoE8nmFN
 KBBFwYDXPqeV5c5H8OshYu7TfmKmHsOeU5C6QzQTmGd5PNW3p8zmhhn+8qEZggA7roCI
 SyjunQRe/wkiOflloX4yeC0xEjkbWmxRZSsSnHSaXIoFgbe5Ua48sanFAbcliCjHg7MD
 kcrg==
X-Gm-Message-State: AOAM533FQ1m930OPq5mci9d3QlwGSbtqacJtbvAPRk5kIRgaYHRXtXK6
 PeGlKcx3Rl/0MaBO0sFT1lkJ+3R1sW+VldT2M9Fo4MgeI7jOUIFpLKHBerJqezX8kwlzUTY+k93
 3/drJIX8VezTuEoKCFLmLDrxQeKI6
X-Received: by 2002:a5d:5008:: with SMTP id e8mr2128768wrt.594.1639530050108; 
 Tue, 14 Dec 2021 17:00:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdAuwrdTMEESvsFcDG08E2OwA6WCyIG6BZJLPvxZ6SUDqAusQV4uM3jZsIEEHWw9jEc8VdZw==
X-Received: by 2002:a5d:5008:: with SMTP id e8mr2128737wrt.594.1639530049813; 
 Tue, 14 Dec 2021 17:00:49 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:00:49 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 00/60] drm: Make all drivers to honour the nomodeset parameter
Date: Wed, 15 Dec 2021 01:59:08 +0100
Message-Id: <20211215010008.2545520-1-javierm@redhat.com>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Edmund Dea <edmund.j.dea@intel.com>,
 Russell King <linux@armlinux.org.uk>, Paul Cercueil <paul@crapouillou.net>,
 Tomi Valkeinen <tomba@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Vasut <marex@denx.de>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, Joel Stanley <joel@jms.id.au>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Qiang Yu <yuq825@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Lechner <david@lechnology.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Alison Wang <alison.wang@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Tian Tao <tiantao6@hisilicon.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The nomodeset kernel command line parameter is used to prevent the KMS/DRM
drivers to be registered/probed. But only a few drivers implement support
for this parameter and most DRM drivers would just ignore it.

This (huge) patch series makes all DRM drivers to honour this parameter. It
is posted as separate patches to make easier for drivers maintainers to ack
or pick them independently at their own pace.

Patches are quite trivial and just add an if (drm_firmware_drivers_only())
check and return -ENODEV if that's true. The condition is checked as early
as possible, that is in the module_init handler for drivers that have one
or in the probe function for drivers that are using the module_*_driver()
macros and don't have their own module init function.

I included all the DRM drivers that think makes sense. I only left the vc4
and v3d drivers, that Maxime is already handling in another patch series
and the vgem, vkms and simpledrm drivers that should ignore the param IMO.

I've built tested with 'make allmodconfig && make M=drivers/gpu/drm/', but
only booted in a few devices with and without nomodeset in the cmdline. So
testing and reviewing for all the drivers would be highly appreciated.

Best regards,
Javier


Javier Martinez Canillas (60):
  drm/komeda: Add support for the nomodeset kernel parameter
  drm/arm/hdlcd: Add support for the nomodeset kernel parameter
  drm/malidp: Add support for the nomodeset kernel parameter
  drm/armada: Add support for the nomodeset kernel parameter
  drm/aspeed: Add support for the nomodeset kernel parameter
  drm/atmel-hlcdc: Add support for the nomodeset kernel parameter
  drm/etnaviv: Add support for the nomodeset kernel parameter
  drm/exynos: Add support for the nomodeset kernel parameter
  drm/fsl-dcu: Add support for the nomodeset kernel parameter
  drm/gma500: Add support for the nomodeset kernel parameter
  drm/gud: Add support for the nomodeset kernel parameter
  drm/hisilicon/hibmc: Add support for the nomodeset kernel parameter
  drm/hisilicon/kirin: Add support for the nomodeset kernel parameter
  drm/hyperv: Add support for the nomodeset kernel parameter
  drm/i810: Add support for the nomodeset kernel parameter
  drm/imx/dcss: Add support for the nomodeset kernel parameter
  drm/imx: Add support for the nomodeset kernel parameter
  drm/ingenic: Add support for the nomodeset kernel parameter
  drm/kmb: Add support for the nomodeset kernel parameter
  drm/lima: Add support for the nomodeset kernel parameter
  drm/mcde: Add support for the nomodeset kernel parameter
  drm/mediatek: Add support for the nomodeset kernel parameter
  drm/meson: Add support for the nomodeset kernel parameter
  drm/mga: Add support for the nomodeset kernel parameter
  drm/msm: Add support for the nomodeset kernel parameter
  drm: mxsfb: Add support for the nomodeset kernel parameter
  drm/omap: Add support for the nomodeset kernel parameter
  drm/panel: ilitek-ili9341: Add support for the nomodeset kernel
    parameter
  drm/panfrost: Add support for the nomodeset kernel parameter
  drm/pl111: Add support for the nomodeset kernel parameter
  drm/r128: Add support for the nomodeset kernel parameter
  drm: rcar-du: Add support for the nomodeset kernel parameter
  drm/rockchip: Add support for the nomodeset kernel parameter
  drm/savage: Add support for the nomodeset kernel parameter
  drm/shmobile: Add support for the nomodeset kernel parameter
  drm/sis: Add support for the nomodeset kernel parameter
  drm/sprd: Add support for the nomodeset kernel parameter
  drm/sti: Add support for the nomodeset kernel parameter
  drm/stm: Add support for the nomodeset kernel parameter
  drm/sun4i: Add support for the nomodeset kernel parameter
  drm/tdfx: Add support for the nomodeset kernel parameter
  drm/tegra: Add support for the nomodeset kernel parameter
  drm/tidss: Add support for the nomodeset kernel parameter
  drm/tilcdc: Add support for the nomodeset kernel parameter
  drm/arc: Add support for the nomodeset kernel parameter
  drm/gm12u320: Add support for the nomodeset kernel parameter
  drm/hx8357d: Add support for the nomodeset kernel parameter
  drm/ili9163: Add support for the nomodeset kernel parameter
  drm/ili9225: Add support for the nomodeset kernel parameter
  drm/ili9341: Add support for the nomodeset kernel parameter
  drm/ili9486: Add support for the nomodeset kernel parameter
  drm/mi0283qt: Add support for the nomodeset kernel parameter
  drm/repaper: Add support for the nomodeset kernel parameter
  drm/st7586: Add support for the nomodeset kernel parameter
  drm/st7735r: Add support for the nomodeset kernel parameter
  drm/tve200: Add support for the nomodeset kernel parameter
  drm/udl: Add support for the nomodeset kernel parameter
  drm/via: Add support for the nomodeset kernel parameter
  drm/xen: Add support for the nomodeset kernel parameter
  drm/xlnx: Add support for the nomodeset kernel parameter

 drivers/gpu/drm/arm/display/komeda/komeda_drv.c | 4 ++++
 drivers/gpu/drm/arm/hdlcd_drv.c                 | 3 +++
 drivers/gpu/drm/arm/malidp_drv.c                | 3 +++
 drivers/gpu/drm/armada/armada_drv.c             | 3 +++
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c         | 3 +++
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c    | 3 +++
 drivers/gpu/drm/etnaviv/etnaviv_drv.c           | 3 +++
 drivers/gpu/drm/exynos/exynos_drm_drv.c         | 3 +++
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c       | 3 +++
 drivers/gpu/drm/gma500/psb_drv.c                | 3 +++
 drivers/gpu/drm/gud/gud_drv.c                   | 3 +++
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 3 +++
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 3 +++
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c         | 3 +++
 drivers/gpu/drm/i810/i810_drv.c                 | 3 +++
 drivers/gpu/drm/imx/dcss/dcss-drv.c             | 3 +++
 drivers/gpu/drm/imx/imx-drm-core.c              | 3 +++
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c       | 3 +++
 drivers/gpu/drm/kmb/kmb_drv.c                   | 3 +++
 drivers/gpu/drm/lima/lima_drv.c                 | 3 +++
 drivers/gpu/drm/mcde/mcde_drv.c                 | 3 +++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          | 3 +++
 drivers/gpu/drm/meson/meson_drv.c               | 3 +++
 drivers/gpu/drm/mga/mga_drv.c                   | 3 +++
 drivers/gpu/drm/msm/msm_drv.c                   | 3 +++
 drivers/gpu/drm/mxsfb/mxsfb_drv.c               | 3 +++
 drivers/gpu/drm/omapdrm/omap_drv.c              | 3 +++
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c    | 3 +++
 drivers/gpu/drm/panfrost/panfrost_drv.c         | 3 +++
 drivers/gpu/drm/pl111/pl111_drv.c               | 3 +++
 drivers/gpu/drm/r128/r128_drv.c                 | 3 +++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c           | 3 +++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c     | 3 +++
 drivers/gpu/drm/savage/savage_drv.c             | 3 +++
 drivers/gpu/drm/shmobile/shmob_drm_drv.c        | 3 +++
 drivers/gpu/drm/sis/sis_drv.c                   | 3 +++
 drivers/gpu/drm/sprd/sprd_drm.c                 | 3 +++
 drivers/gpu/drm/sti/sti_drv.c                   | 3 +++
 drivers/gpu/drm/stm/drv.c                       | 3 +++
 drivers/gpu/drm/sun4i/sun4i_drv.c               | 3 +++
 drivers/gpu/drm/tdfx/tdfx_drv.c                 | 3 +++
 drivers/gpu/drm/tegra/drm.c                     | 3 +++
 drivers/gpu/drm/tidss/tidss_drv.c               | 3 +++
 drivers/gpu/drm/tilcdc/tilcdc_drv.c             | 3 +++
 drivers/gpu/drm/tiny/arcpgu.c                   | 3 +++
 drivers/gpu/drm/tiny/gm12u320.c                 | 3 +++
 drivers/gpu/drm/tiny/hx8357d.c                  | 3 +++
 drivers/gpu/drm/tiny/ili9163.c                  | 3 +++
 drivers/gpu/drm/tiny/ili9225.c                  | 3 +++
 drivers/gpu/drm/tiny/ili9341.c                  | 3 +++
 drivers/gpu/drm/tiny/ili9486.c                  | 3 +++
 drivers/gpu/drm/tiny/mi0283qt.c                 | 3 +++
 drivers/gpu/drm/tiny/repaper.c                  | 3 +++
 drivers/gpu/drm/tiny/st7586.c                   | 3 +++
 drivers/gpu/drm/tiny/st7735r.c                  | 3 +++
 drivers/gpu/drm/tve200/tve200_drv.c             | 3 +++
 drivers/gpu/drm/udl/udl_drv.c                   | 3 +++
 drivers/gpu/drm/via/via_drv.c                   | 3 +++
 drivers/gpu/drm/xen/xen_drm_front.c             | 3 +++
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c             | 3 +++
 60 files changed, 181 insertions(+)

-- 
2.33.1

