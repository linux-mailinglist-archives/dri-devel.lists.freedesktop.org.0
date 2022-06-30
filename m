Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A5F562496
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 22:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D2510FA5E;
	Thu, 30 Jun 2022 20:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BFD10FA5E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 20:47:31 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BB9D383C97;
 Thu, 30 Jun 2022 22:47:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656622049;
 bh=uQiA3lPQs2CZGrtJoMj60A9GhYEvDlphcPp3cC/rDFY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QZyTAdnBi60c3DJYaqHicNwqZDW5xLzMmAgBAFjQyHMSitKELDHajOIj7tFcm9QwD
 71JLk0yvO4D3QHNv8FEVJBchV0urGcC5rXnRrG82Ty6KgW8SUPfyiDvxFFkPYHL5n/
 CfQhOdDYehvxY4IlhH2y6D+J9zUFHm7IZgx51Ixdj5FB6i+Hhm/ZsgB4I0vACdl0xB
 GwC7xw7WrT4qtv2tMn2F0kq5cdJT4gjh9lZpiTSNVXqJxFrc3XQpcJKl6cIdvYOQvx
 NFZcDJ/slNMcS7/IFkgMHt2ndOMxrr/0OqNn6Ieg/E23IcC7FDcyG3K5nJMUNBl6zG
 23kdxRGydkvcg==
Message-ID: <3ebb3f00-d17c-35b0-6214-66393221fa6f@denx.de>
Date: Thu, 30 Jun 2022 22:47:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 2/2] drm: lcdif: Add support for i.MX8MP LCDIF variant
Content-Language: en-US
To: Liu Ying <victor.liu@oss.nxp.com>, dri-devel@lists.freedesktop.org
References: <20220624180201.150417-1-marex@denx.de>
 <20220624180201.150417-2-marex@denx.de>
 <2179a7f82a45e5af836ca5bdf28f10cdbeecaf55.camel@oss.nxp.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2179a7f82a45e5af836ca5bdf28f10cdbeecaf55.camel@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, robert.foss@linaro.org,
 Martyn Welch <martyn.welch@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/30/22 10:30, Liu Ying wrote:
> Hi Marek,

Hi,

>>   drivers/gpu/drm/Makefile           |   2 +-
>>   drivers/gpu/drm/mxsfb/Kconfig      |  16 +
>>   drivers/gpu/drm/mxsfb/Makefile     |   2 +
>>   drivers/gpu/drm/mxsfb/lcdif_drv.c  | 341 ++++++++++++++++++++
>>   drivers/gpu/drm/mxsfb/lcdif_drv.h  |  44 +++
>>   drivers/gpu/drm/mxsfb/lcdif_kms.c  | 483 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/mxsfb/lcdif_regs.h | 257 +++++++++++++++
> 
> The mxsfb-drm driver is in the mxsfb directory as a successor of the
> legacy mxsfb fbdev driver. The fbdev driver is for i.MX23/28 lcdif.

That mxsfb-drm is also used on iMX8M{,M,N}

> So, in order to avoid confusion, maybe don't put the new lcdifv3 driver
> here. I would choose to create a new sub-directory in
> drivers/gpu/drm/imx and put it there. The full path can be
> drivers/gpu/drm/imx/lcdifv3, which matches the IP name(as called by
> design team).

It also matches the NXP downstream vendor kernel paths.

> If people don't like it because i.MX23 lcdif version
> register reads major version3, drivers/gpu/drm/imx/imx8mp-lcdif

It cannot, because this IP is also used in iMXRT.

> can be
> an alternative, though longer directory name. I tend to use lcdifv3
> since separate directory(imx vs mxsfb) hints totally different display
> controllers.

We've had this discussion about naming/placement before.

Placing the lcdif driver into mxsfb would allow code deduplication 
between the two drivers, that's why it is in mxsfb directory.

>>   7 files changed, 1144 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/mxsfb/lcdif_drv.c
>>   create mode 100644 drivers/gpu/drm/mxsfb/lcdif_drv.h
>>   create mode 100644 drivers/gpu/drm/mxsfb/lcdif_kms.c
>>   create mode 100644 drivers/gpu/drm/mxsfb/lcdif_regs.h
>>
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 13ef240b3d2b2..75b5ac7c2663c 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -130,7 +130,7 @@ obj-y			+= bridge/
>>   obj-$(CONFIG_DRM_FSL_DCU) += fsl-dcu/
>>   obj-$(CONFIG_DRM_ETNAVIV) += etnaviv/
>>   obj-y			+= hisilicon/
>> -obj-$(CONFIG_DRM_MXSFB)	+= mxsfb/
>> +obj-y			+= mxsfb/
>>   obj-y			+= tiny/
>>   obj-$(CONFIG_DRM_PL111) += pl111/
>>   obj-$(CONFIG_DRM_TVE200) += tve200/
>> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
>> index 987170e16ebd6..873551b4552f5 100644
>> --- a/drivers/gpu/drm/mxsfb/Kconfig
>> +++ b/drivers/gpu/drm/mxsfb/Kconfig
>> @@ -19,3 +19,19 @@ config DRM_MXSFB
>>   	  i.MX28, i.MX6SX, i.MX7 and i.MX8M).
>>   
>>   	  If M is selected the module will be called mxsfb.
>> +
>> +config DRM_IMX_LCDIF
> 
> Perhaps, choose a less generic name here in case yet another new IP
> with similar name in future... Use DRM_IMX_LCDIFV3?
> 
>> +	tristate "i.MX LCDIFv3 LCD controller"
>> +	depends on DRM && OF
>> +	depends on COMMON_CLK
>> +	select DRM_MXS
>> +	select DRM_KMS_HELPER
>> +	select DRM_GEM_CMA_HELPER
>> +	select DRM_PANEL
>> +	select DRM_PANEL_BRIDGE
>> +	help
>> +	  Choose this option if you have an LCDIFv3 LCD controller.
>> +	  Those devices are found in various i.MX SoC (i.MX8MP,
>> +	  i.MXRT).
>> +
>> +	  If M is selected the module will be called imx-lcdif.
> 
> Same here. Use imx-lcdifv3?

The mxsfb LCDIF also supports multiple versions of the LCDIF IP (v3, v4, 
v6 at least). So calling a driver LCDIF v3 is about as confusing, since 
you cannot tell whether it is the iMX23 LCDIF v3 or the iMXRT/iMX8MP 
LCDIFv3 .

> Similar comment applies to the entire driver - less generic name.

[...]

>> +struct lcdif_drm_private {
>> +	void __iomem			*base;	/* registers */
>> +	struct clk			*clk;
>> +	struct clk			*clk_axi;
>> +	struct clk			*clk_disp_axi;
> 
> i.MX8mp RM mentions that clocks are pix_clk, apb_clk and b_clk.
> Why not use them?

That's only because the DT bindings are aligned between old and new LCDIF.

[...]

>> +	switch (format) {
>> +	case DRM_FORMAT_RGB565:
>> +		writel(CTRLDESCL0_5_BPP_16_RGB565,
>> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
>> +		break;
>> +	case DRM_FORMAT_RGB888:
>> +		writel(CTRLDESCL0_5_BPP_24_RGB888,
>> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
>> +		break;
>> +	case DRM_FORMAT_XRGB1555:
> 
> DRM_FORMAT_ARGB1555?

Why would there be formats with Alpha channel here ?
Because of the (unsupported) overlay planes ?

> 
>> +		writel(CTRLDESCL0_5_BPP_32_ARGB8888,
>> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
>> +		break;
>> +	default:
>> +		dev_err(drm->dev, "Unknown pixel format 0x%x\n", format);
>> +		break;
>> +	}
> 
> lcdif_set_formats() is called in lcdif_crtc_mode_set_nofb(), so no fb,
> which means the framebuffer pixel format should be set in plane
> callback.

Do you have iMXRT and are/or you able to test overlay planes with this 
IP (the overlay planes which are currently not supported) ? Or is there 
any other iMX which has overlay plane available ?

[...]
