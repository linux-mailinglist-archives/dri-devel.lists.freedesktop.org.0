Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BBC49E951
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 18:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338EE10E1F6;
	Thu, 27 Jan 2022 17:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D295610E1F6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 17:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xOfwpIfWLMPtjwB4vDcjz0nGgt//wy4YV2BIhmW85Fk=; b=bM4BiFOEIwTJLVGM39kyrhwBpk
 3ba+N3s7G1FIDlUJv5vjHOYjMpk+qaD6mnpgQeonKKOvqz3jJ6JyXta4L2QdDbU5oowWsM2hDxqPN
 ICrgSXY8oMpCOSFR1pTRs9Z4ob79TKwpquB6kAq+EB2T7XA5oQ6yACGbvq+2cWq3cTMG04C5SZz1q
 gll/PxRXPO+b5mJ3Ws0w4Jx/SJTDoHNTG4ZSWPqa3BIwswI+QGpnpXxb9wfNPiYzoAJ7pxmYKSLSY
 2QEfjSlR5G+OeWGLjj2fJuTyLm1NYpLWycdH3pvlbcrf6spdoF4OBOoCKydiLcfOAuLpp624Kmi86
 selLBFpA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:57435
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1nD8xz-0006Bx-KX; Thu, 27 Jan 2022 18:53:51 +0100
Message-ID: <fff71d01-e1c9-2b0f-e4b2-9abb107f7770@tronnes.org>
Date: Thu, 27 Jan 2022 18:53:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/3] drm/panel: Add MIPI DBI compatible SPI driver
To: Maxime Ripard <maxime@cerno.tech>, robh+dt@kernel.org
References: <20220125175700.37408-1-noralf@tronnes.org>
 <20220125175700.37408-4-noralf@tronnes.org>
 <20220127100452.bmxcgf6ye3nxrgtq@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220127100452.bmxcgf6ye3nxrgtq@houat>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 27.01.2022 11.04, skrev Maxime Ripard:
> On Tue, Jan 25, 2022 at 06:57:00PM +0100, Noralf Trønnes wrote:
>> Add a driver that will work with most MIPI DBI compatible SPI panels.
>> This avoids adding a driver for every new MIPI DBI compatible controller
>> that is to be used by Linux. The 'compatible' Device Tree property with
>> a '.bin' suffix will be used to load a firmware file that contains the
>> controller configuration.
>>
>> Example (driver will load sainsmart18.bin):
>>
>> display@0 {
>> 	compatible = "sainsmart18", "panel-mipi-dbi-spi";
>> 	reg = <0>;
>> 	reset-gpios = <&gpio 25 0>;
>> 	dc-gpios = <&gpio 24 0>;
>> };
>>
>> v2:
>> - Drop model property and use compatible instead (Rob)
>> - Add wiki entry in MAINTAINERS
>>
>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
>> ---
>>  MAINTAINERS                            |   8 +
>>  drivers/gpu/drm/panel/Kconfig          |  11 +
>>  drivers/gpu/drm/panel/Makefile         |   1 +
>>  drivers/gpu/drm/panel/panel-mipi-dbi.c | 394 +++++++++++++++++++++++++
>>  4 files changed, 414 insertions(+)
>>  create mode 100644 drivers/gpu/drm/panel/panel-mipi-dbi.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index d03ad8da1f36..8baa98723bdc 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -6047,6 +6047,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>>  F:	Documentation/devicetree/bindings/display/multi-inno,mi0283qt.txt
>>  F:	drivers/gpu/drm/tiny/mi0283qt.c
>>  
>> +DRM DRIVER FOR MIPI DBI compatible panels
>> +M:	Noralf Trønnes <noralf@tronnes.org>
>> +S:	Maintained
>> +W:	https://github.com/notro/panel-mipi-dbi/wiki
>> +T:	git git://anongit.freedesktop.org/drm/drm-misc
>> +F:	Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
>> +F:	drivers/gpu/drm/panel/panel-mipi-dbi.c
>> +
>>  DRM DRIVER FOR MSM ADRENO GPU
>>  M:	Rob Clark <robdclark@gmail.com>
>>  M:	Sean Paul <sean@poorly.run>
>> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
>> index 434c2861bb40..1851cda5f877 100644
>> --- a/drivers/gpu/drm/panel/Kconfig
>> +++ b/drivers/gpu/drm/panel/Kconfig
>> @@ -274,6 +274,17 @@ config DRM_PANEL_LG_LG4573
>>  	  Say Y here if you want to enable support for LG4573 RGB panel.
>>  	  To compile this driver as a module, choose M here.
>>  
>> +config DRM_PANEL_MIPI_DBI
>> +	tristate "MIPI DBI compatible panel"
>> +	depends on SPI
>> +	depends on BACKLIGHT_CLASS_DEVICE
>> +	depends on DRM_KMS_HELPER
>> +	select DRM_KMS_CMA_HELPER
>> +	select DRM_MIPI_DBI
>> +	help
>> +	  Say Y here if you want to enable support for MIPI DBI compatible panels.
>> +	  To compile this driver as a module, choose M here.
>> +
>>  config DRM_PANEL_NEC_NL8048HL11
>>  	tristate "NEC NL8048HL11 RGB panel"
>>  	depends on GPIOLIB && OF && SPI
>> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
>> index d99fbbce49d1..a90c30459964 100644
>> --- a/drivers/gpu/drm/panel/Makefile
>> +++ b/drivers/gpu/drm/panel/Makefile
>> @@ -25,6 +25,7 @@ obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W) += panel-leadtek-ltk050h3146w.o
>>  obj-$(CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829) += panel-leadtek-ltk500hd1829.o
>>  obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
>>  obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
>> +obj-$(CONFIG_DRM_PANEL_MIPI_DBI) += panel-mipi-dbi.o
>>  obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
>>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35510) += panel-novatek-nt35510.o
>>  obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35950) += panel-novatek-nt35950.o
>> diff --git a/drivers/gpu/drm/panel/panel-mipi-dbi.c b/drivers/gpu/drm/panel/panel-mipi-dbi.c
>> new file mode 100644
>> index 000000000000..6e3dc2de21d2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/panel/panel-mipi-dbi.c
>> @@ -0,0 +1,394 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * DRM driver for MIPI DBI compatible display panels
>> + *
>> + * Copyright 2022 Noralf Trønnes
>> + */
>> +
>> +#include <linux/backlight.h>
>> +#include <linux/delay.h>
>> +#include <linux/firmware.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/module.h>
>> +#include <linux/property.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/spi/spi.h>
>> +
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_fb_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>> +#include <drm/drm_gem_cma_helper.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/drm_mipi_dbi.h>
>> +#include <drm/drm_modeset_helper.h>
>> +#include <video/mipi_display.h>
>> +
>> +static const u8 panel_mipi_dbi_magic[15] = { 'M', 'I', 'P', 'I', ' ', 'D', 'B', 'I',
>> +					     0, 0, 0, 0, 0, 0, 0 };
>> +
>> +/*
>> + * The display panel configuration is stored in a firmware file. The Device Tree 'compatible'
>> + * property value with a '.bin' suffix is passed to request_firmware() to fetch this file.
>> + */
>> +struct panel_mipi_dbi_config {
>> +	/* Magic string: panel_mipi_dbi_magic */
>> +	u8 magic[15];
>> +
>> +	/* Config file format version */
>> +	u8 file_format_version;
>> +
>> +	/* Width in pixels */
>> +	__be16 width;
>> +	/* Height in pixels */
>> +	__be16 height;
>> +
>> +	/* Width in millimeters (optional) */
>> +	__be16 width_mm;
>> +	/* Height in millimeters (optional) */
>> +	__be16 height_mm;
>> +
>> +	/* X-axis panel offset */
>> +	__be16 x_offset;
>> +	/* Y-axis panel offset */
>> +	__be16 y_offset;
>> +
>> +	/* 4 pad bytes, must be zero */
>> +	u8 pad[4];
>> +
>> +	/*
>> +	 * Optional MIPI commands to execute when the display pipeline is enabled.
>> +	 * This can be used to configure the display controller.
>> +	 *
>> +	 * The commands are stored in a byte array with the format:
>> +	 *     command, num_parameters, [ parameter, ...], command, ...
>> +	 *
>> +	 * Some commands require a pause before the next command can be received.
>> +	 * Inserting a delay in the command sequence is done by using the NOP command with one
>> +	 * parameter: delay in miliseconds (the No Operation command is part of the MIPI Display
>> +	 * Command Set where it has no parameters).
>> +	 *
>> +	 * Example:
>> +	 *     command 0x11
>> +	 *     sleep 120ms
>> +	 *     command 0xb1 parameters 0x01, 0x2c, 0x2d
>> +	 *     command 0x29
>> +	 *
>> +	 * Byte sequence:
>> +	 *     0x11 0x00
>> +	 *     0x00 0x01 0x78
>> +	 *     0xb1 0x03 0x01 0x2c 0x2d
>> +	 *     0x29 0x00
>> +	 */
>> +	u8 commands[];
>> +};
> 
> I'm not really a fan of parsing raw data in the kernel. I guess we can't
> really avoid the introduction of a special case to sleep, but we already
> have dt properties for all of the other properties (but X and Y offset,
> maybe?)
> 
> Maybe we should use those instead?
> 

I don't understand your reluctance to parsing data, lots of ioctls do
it. And this data can only be loaded by root. What I like about having
these properties in the config file is that the binding becomes a
fallback binding that can actually be made to work without changing the
Device Tree.

For arguments sake let's say tiny/st7735r.c was not built and we had
this node:

display@0{
	compatible = "jianda,jd-t18003-t01", "sitronix,st7735r",
"panel-mipi-dbi-spi";
};

It will still be possible to use this display without changing the
Device Tree. Just add a firmware/config file.

Having the properties in DT it would have to look like this for the
fallback to work:

display@0{
	compatible = "jianda,jd-t18003-t01", "sitronix,st7735r",
"panel-mipi-dbi-spi";
	panel-timing = {
		hactive = <128>;
		vactive = <128>;
	};
	width-mm = <25>;
	height-mm = <26>;
	x-offset = <2>;
	y-offset = <3>;
};

Is this important, I'm not sure. What do you think?

The users I care most about have DT overlays so for them it doesn't
matter much where the properties are.

Noralf.
