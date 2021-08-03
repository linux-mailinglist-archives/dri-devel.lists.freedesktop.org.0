Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E210D3DE3F7
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 03:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F1D6E114;
	Tue,  3 Aug 2021 01:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg587.qq.com (smtpbg126.qq.com [106.55.201.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353AC6E114
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 01:26:03 +0000 (UTC)
X-QQ-mid: bizesmtp50t1627953952t9i7a2ym
Received: from [192.168.0.46] (unknown [14.154.30.9])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 03 Aug 2021 09:25:51 +0800 (CST)
X-QQ-SSF: 0010000000200030B000B00A0000000
X-QQ-FEAT: jE/Jgvobnf/7CpswWjZ9lsqV+/yBULhPXv+Xyl67CU2ZYnZ7Y0lYrgypNoqYB
 Q2LSJOhSqUbThgala5oyyLkHGCLQVJBNrp1cCjtIAsxc8cc9sGGBtRfWCz9c9Fjo5HBYg7r
 Lg1vhaC/db9Q7yqeWZyELrxR9ExHuOX1b7liCWtdC2+XHlhiClc6P364HVOnOiAyXeejEZ1
 JdZxtteU2EDNyHfxnmfGSPB0ZG7AtsJ5TB82FqUcF4RY815nJ2e7BGN5LYIa1N5B06sT63l
 KgrtYkNE9gTAVw8ZaizVOOezdL9bdIfgMiVLeoKef2gFqn0wxFRn/FojR7xyckhNSNCmniW
 ZfXmxUvmVp3UQUfAz/M0jdEGrdrQA==
X-QQ-GoodBg: 0
Message-ID: <f69afa7ac2984c5145f38c037a06668b9e08fe44.camel@sipeed.com>+0FC33BC26BE5318F
Subject: Re: [PATCH 3/4] drm/tiny: add simple-dbi driver
From: Icenowy Zheng <icenowy@sipeed.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@linux.ie>,  Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Tue, 03 Aug 2021 09:25:51 +0800
In-Reply-To: <bfd59539-fc71-4994-ca33-f5fd3851243b@suse.de>
References: <20210802063538.75583-1-icenowy@sipeed.com>
 <20210802063538.75583-4-icenowy@sipeed.com>
 <bfd59539-fc71-4994-ca33-f5fd3851243b@suse.de>
Organization: Sipeed
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam2
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

在 2021-08-02星期一的 17:08 +0200，Thomas Zimmermann写道：
> Hi
> 
> Am 02.08.21 um 08:35 schrieb Icenowy Zheng:
> > Add a driver for generic MIPI DBI panels initialized with MIPI DCS
> > commands.
> > 
> > Currently a ST7789V-based panel is added to it. This panel has its
> > configuration pre-programmed into the controller, so no vendor-
> > specific
> > configuration is needed.
> > 
> > Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
> > ---
> >   drivers/gpu/drm/tiny/Kconfig      |  12 ++
> >   drivers/gpu/drm/tiny/Makefile     |   1 +
> >   drivers/gpu/drm/tiny/simple-dbi.c | 244
> > ++++++++++++++++++++++++++++++
> >   3 files changed, 257 insertions(+)
> >   create mode 100644 drivers/gpu/drm/tiny/simple-dbi.c
> > 
> > diff --git a/drivers/gpu/drm/tiny/Kconfig
> > b/drivers/gpu/drm/tiny/Kconfig
> > index d31be274a2bd..6cfc57b68a46 100644
> > --- a/drivers/gpu/drm/tiny/Kconfig
> > +++ b/drivers/gpu/drm/tiny/Kconfig
> > @@ -144,6 +144,18 @@ config TINYDRM_REPAPER
> >   
> >           If M is selected the module will be called repaper.
> >   
> > +config TINYDRM_SIMPLE_DBI
> > +       tristate "DRM support for generic MIPI DBI panels"
> > +       depends on DRM && SPI
> > +       select DRM_KMS_HELPER
> > +       select DRM_KMS_CMA_HELPER
> > +       select DRM_MIPI_DBI
> > +       help
> > +         DRM driver for generic DBI panels that are MIPI DCS
> > compatible
> > +         and needs no vendor-specific setup commands.
> > +
> > +         If M is selected the module will be called simple-dbi.
> > +
> >   config TINYDRM_ST7586
> >         tristate "DRM support for Sitronix ST7586 display panels"
> >         depends on DRM && SPI
> > diff --git a/drivers/gpu/drm/tiny/Makefile
> > b/drivers/gpu/drm/tiny/Makefile
> > index e09942895c77..2553de651aa3 100644
> > --- a/drivers/gpu/drm/tiny/Makefile
> > +++ b/drivers/gpu/drm/tiny/Makefile
> > @@ -13,3 +13,4 @@ obj-$(CONFIG_TINYDRM_MI0283QT)                +=
> > mi0283qt.o
> >   obj-$(CONFIG_TINYDRM_REPAPER)         += repaper.o
> >   obj-$(CONFIG_TINYDRM_ST7586)          += st7586.o
> >   obj-$(CONFIG_TINYDRM_ST7735R)         += st7735r.o
> > +obj-$(CONFIG_TINYDRM_SIMPLE_DBI)       += simple-dbi.o
> > diff --git a/drivers/gpu/drm/tiny/simple-dbi.c
> > b/drivers/gpu/drm/tiny/simple-dbi.c
> > new file mode 100644
> > index 000000000000..2b207e43d500
> > --- /dev/null
> > +++ b/drivers/gpu/drm/tiny/simple-dbi.c
> > @@ -0,0 +1,244 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * DRM driver for display panels with configuration preset and
> > needs only
> > + * standard MIPI DCS commands to bring up.
> > + *
> > + * Copyright (C) 2021 Sipeed
> > + */
> > +
> > +#include <linux/backlight.h>
> > +#include <linux/delay.h>
> > +#include <linux/dma-buf.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/module.h>
> > +#include <linux/property.h>
> > +#include <linux/spi/spi.h>
> > +#include <video/mipi_display.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_fb_helper.h>
> > +#include <drm/drm_gem_atomic_helper.h>
> > +#include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_managed.h>
> > +#include <drm/drm_mipi_dbi.h>
> > +
> > +#define MIPI_DCS_ADDRESS_MODE_BGR              BIT(3)
> > +#define MIPI_DCS_ADDRESS_MODE_REVERSE          BIT(5)
> > +#define MIPI_DCS_ADDRESS_MODE_RTL              BIT(6)
> > +#define MIPI_DCS_ADDRESS_MODE_BTT              BIT(7)
> > +
> > +struct simple_dbi_cfg {
> > +       const struct drm_display_mode mode;
> > +       unsigned int left_offset;
> > +       unsigned int top_offset;
> > +       bool inverted;
> > +       bool write_only;
> > +       bool bgr;
> > +       bool right_to_left;
> > +       bool bottom_to_top;
> > +};
> > +
> > +struct simple_dbi_priv {
> > +       struct mipi_dbi_dev dbidev;     /* Must be first for
> > .release() */
> 
> Which release?

Ah, some copy-n-paste waste.

Will drop this in v2.

> 
> > +       const struct simple_dbi_cfg *cfg;
> > +};
> > +
> > +static void simple_dbi_pipe_enable(struct drm_simple_display_pipe
> > *pipe,
> > +                               struct drm_crtc_state *crtc_state,
> > +                               struct drm_plane_state
> > *plane_state)
> > +{
> > +       struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe-
> > >crtc.dev);
> > +       struct simple_dbi_priv *priv = container_of(dbidev,
> > +                                                   struct
> > simple_dbi_priv,
> > +                                                   dbidev);
> > +       struct mipi_dbi *dbi = &dbidev->dbi;
> > +       int ret, idx;
> > +       u8 addr_mode = 0x00;
> > +
> > +       if (!drm_dev_enter(pipe->crtc.dev, &idx))
> > +               return;
> > +
> > +       DRM_DEBUG_KMS("\n");
> 
> I'm not a friend of such debugging statements. If you absolutely want
> to 
> keep it, rather use drm_dbg_kms().

Should be copy-n-paste waste too.

> 
> > +
> > +       ret = mipi_dbi_poweron_reset(dbidev);
> > +       if (ret)
> > +               goto out_exit;
> > +
> > +       mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
> > +       msleep(5);
> > +
> > +       /* Currently tinydrm supports 16bit only now */
> > +       mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT,
> > +                        MIPI_DCS_PIXEL_FMT_16BIT);
> > +
> > +       if (priv->cfg->inverted)
> > +               mipi_dbi_command(dbi, MIPI_DCS_ENTER_INVERT_MODE);
> > +       else
> > +               mipi_dbi_command(dbi, MIPI_DCS_EXIT_INVERT_MODE);
> > +
> > +       if (priv->cfg->bgr)
> > +               addr_mode |= MIPI_DCS_ADDRESS_MODE_BGR;
> > +
> > +       if (priv->cfg->right_to_left)
> > +               addr_mode |= MIPI_DCS_ADDRESS_MODE_RTL;
> > +
> > +       if (priv->cfg->bottom_to_top)
> > +               addr_mode |= MIPI_DCS_ADDRESS_MODE_BTT;
> > +
> > +       switch (dbidev->rotation) {
> > +       default:
> > +               break;
> > +       case 90:
> > +               addr_mode ^= MIPI_DCS_ADDRESS_MODE_REVERSE;
> > +               addr_mode ^= MIPI_DCS_ADDRESS_MODE_RTL;
> > +               break;
> > +       case 180:
> > +               addr_mode ^= MIPI_DCS_ADDRESS_MODE_RTL;
> > +               addr_mode ^= MIPI_DCS_ADDRESS_MODE_BTT;
> > +               break;
> > +       case 270:
> > +               addr_mode ^= MIPI_DCS_ADDRESS_MODE_REVERSE;
> > +               addr_mode ^= MIPI_DCS_ADDRESS_MODE_BTT;
> > +               break;
> > +       }
> > +
> > +       mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE,
> > addr_mode);
> > +
> > +       mipi_dbi_command(dbi, MIPI_DCS_ENTER_NORMAL_MODE);
> > +
> > +       mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
> > +
> > +       mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
> > +out_exit:
> > +       drm_dev_exit(idx);
> > +}
> > +
> > +static const struct drm_simple_display_pipe_funcs
> > simple_dbi_pipe_funcs = {
> > +       .enable         = simple_dbi_pipe_enable,
> > +       .disable        = mipi_dbi_pipe_disable,
> > +       .update         = mipi_dbi_pipe_update,
> > +       .prepare_fb     = drm_gem_simple_display_pipe_prepare_fb,
> > +};
> > +
> > +static const struct simple_dbi_cfg zsx154_b1206_cfg = {
> > +       .mode           = { DRM_SIMPLE_MODE(240, 240, 28, 28) },
> > +       .inverted       = true,
> > +       .write_only     = true,
> > +};
> > +
> > +DEFINE_DRM_GEM_CMA_FOPS(simple_dbi_fops);
> > +
> > +static const struct drm_driver simple_dbi_driver = {
> > +       .driver_features        = DRIVER_GEM | DRIVER_MODESET |
> > DRIVER_ATOMIC,
> > +       .fops                   = &simple_dbi_fops,
> > +       DRM_GEM_CMA_DRIVER_OPS_VMAP,
> > +       .debugfs_init           = mipi_dbi_debugfs_init,
> > +       .name                   = "simple-dbi",
> > +       .desc                   = "Generic MIPI-DCS compatible DBI
> > panel",
> > +       .date                   = "20210723",
> > +       .major                  = 1,
> > +       .minor                  = 0,
> > +};
> > +
> > +static const struct of_device_id simple_dbi_of_match[] = {
> > +       { .compatible = "zsx,zsx154-b1206", .data =
> > &zsx154_b1206_cfg },
> > +       { },
> > +}
> > +MODULE_DEVICE_TABLE(of, simple_dbi_of_match);
> > +
> > +static int simple_dbi_probe(struct spi_device *spi)
> > +{
> > +       struct device *dev = &spi->dev;
> > +       const struct simple_dbi_cfg *cfg;
> > +       struct mipi_dbi_dev *dbidev;
> > +       struct simple_dbi_priv *priv;
> > +       struct drm_device *drm;
> > +       struct mipi_dbi *dbi;
> > +       struct gpio_desc *dc;
> > +       u32 rotation = 0;
> > +       int ret;
> > +
> > +       cfg = device_get_match_data(&spi->dev);
> > +       if (!cfg)
> > +               cfg = (void *)spi_get_device_id(spi)->driver_data;
> > +
> > +       priv = devm_drm_dev_alloc(dev, &simple_dbi_driver,
> > +                                 struct simple_dbi_priv,
> > dbidev.drm);
> > +       if (IS_ERR(priv))
> > +               return PTR_ERR(priv);
> > +
> > +       dbidev = &priv->dbidev;
> > +       priv->cfg = cfg;
> > +
> > +       dbi = &dbidev->dbi;
> > +       drm = &dbidev->drm;
> > +
> > +       dbi->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > +       if (IS_ERR(dbi->reset))
> > +               return dev_err_probe(dev, PTR_ERR(dbi->reset),
> > "Failed to get reset GPIO\n");
> > +
> > +       dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
> > +       if (IS_ERR(dc))
> > +               return dev_err_probe(dev, PTR_ERR(dc), "Failed to
> > get D/C GPIO\n");
> > +
> > +       dbidev->backlight = devm_of_find_backlight(dev);
> > +       if (IS_ERR(dbidev->backlight))
> > +               return PTR_ERR(dbidev->backlight);
> > +
> > +       device_property_read_u32(dev, "rotation", &rotation);
> > +
> > +       ret = mipi_dbi_spi_init(spi, dbi, dc);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (cfg->write_only)
> > +               dbi->read_commands = NULL;
> > +
> > +       ret = mipi_dbi_dev_init(dbidev, &simple_dbi_pipe_funcs,
> > &cfg->mode,
> > +                               rotation);
> > +       if (ret)
> > +               return ret;
> > +
> > +       drm_mode_config_reset(drm);
> > +
> > +       ret = drm_dev_register(drm, 0);
> > +       if (ret)
> > +               return ret;
> > +
> > +       spi_set_drvdata(spi, drm);
> 
> AFAIK dev files are being created during drm_dev_register(). It's 
> probably safer to set the drvdata before.

Okay, thanks.

> 
> > +
> > +       drm_fbdev_generic_setup(drm, 0);
> > +
> > +       return 0;
> > +}
> > +
> > +static int simple_dbi_remove(struct spi_device *spi)
> > +{
> > +       struct drm_device *drm = spi_get_drvdata(spi);
> > +
> > +       drm_dev_unplug(drm);
> > +       drm_atomic_helper_shutdown(drm);
> > +
> > +       return 0;
> > +}
> > +
> > +static void simple_dbi_shutdown(struct spi_device *spi)
> > +{
> > +       drm_atomic_helper_shutdown(spi_get_drvdata(spi));
> > +}
> > +
> > +static struct spi_driver simple_dbi_spi_driver = {
> > +       .driver = {
> > +               .name = "simple-dbi",
> > +               .of_match_table = simple_dbi_of_match,
> > +       },
> > +       .probe = simple_dbi_probe,
> > +       .remove = simple_dbi_remove,
> > +       .shutdown = simple_dbi_shutdown,
> > +};
> > +module_spi_driver(simple_dbi_spi_driver);
> > +
> > +MODULE_DESCRIPTION("Simple DBI panel DRM driver");
> > +MODULE_AUTHOR("Icenowy Zheng <icenowy@aosc.io>");
> > +MODULE_LICENSE("GPL");
> > 
> 
> Trailing blank line. (?)

Ah I do not know what happened, I just `git format-patch` and then `git
send-email`.

At least I have no trailing blank line in the file inside patch :-)

> 
> Best regards
> Thomas
> 


