Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 577D64F6EEE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 02:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A81210E0FE;
	Thu,  7 Apr 2022 00:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D5510E0A4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 00:00:10 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1B77383E40;
 Thu,  7 Apr 2022 02:00:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649289609;
 bh=BBXK7hwzX2wthqDioCq3XkVgsmnptj4mNjKX6uSFagM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SOXwNtAXXximDsgDWc4GOyvbedk9TIsSoeujUDIOxIHWBEa3VO87UrX45p5MU2HDl
 qhEI6uqaPvZcvyYLDv6EIFZg7iV2H8bTQMPkLULPWPFTWbpsWdd7douDidN7595F7f
 8h2s/2qgxpsrtIa4Y16qQ35rbkuxnbGUPNPnbtiDBqJmlmCP+E+NM89r4RqjCP7FmO
 gMMBa+IlKCZM2m6sHG6GIJECIjJduDOcEg6lbYuiyQjp8JPtlOA8QOkpuXhmiA44dO
 TFR84ctfa54S2pyd4xg5jIzZDe56IkimgHeujdEtNx9hEh+B1raMeSYSo4l+Qcxnwh
 xADK1HCP2mVAw==
Message-ID: <0ba4a237-e8ac-485f-5291-5c23398ba6d7@denx.de>
Date: Thu, 7 Apr 2022 01:22:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] drm: lcdif: Add support for i.MX8MP LCDIF variant
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220322142853.125880-1-marex@denx.de>
 <20220322142853.125880-2-marex@denx.de>
 <97d0ed7496a65d70a79afed174a777d7d7abb4ae.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <97d0ed7496a65d70a79afed174a777d7d7abb4ae.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/4/22 14:23, Lucas Stach wrote:
> Hi Marek,

Hi,

> not a full review right now, just the first things that I noticed while
> playing around with this.
> 
> Am Dienstag, dem 22.03.2022 um 15:28 +0100 schrieb Marek Vasut:
>> Add support for i.MX8MP LCDIF variant. This is called LCDIFv3 and is
>> completely different from the LCDIFv3 found in i.MX23 in that it has
>> a completely scrambled register layout compared to all previous LCDIF
>> variants. The new LCDIFv3 also supports 36bit address space.
>>
>> Add a separate driver which is really a fork of MXSFB driver with the
>> i.MX8MP LCDIF variant handling filled in.

[...]

>>   drivers/gpu/drm/mxsfb/Kconfig      |  16 +
>>   drivers/gpu/drm/mxsfb/Makefile     |   2 +
>>   drivers/gpu/drm/mxsfb/lcdif_drv.c  | 367 +++++++++++++++++++++
>>   drivers/gpu/drm/mxsfb/lcdif_drv.h  |  48 +++
>>   drivers/gpu/drm/mxsfb/lcdif_kms.c  | 492 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/mxsfb/lcdif_regs.h | 243 ++++++++++++++
> 
> Not sure about this placement. I know you hope to share some code with
> the other mxsfb driver, but I would prefer to add this into
> drivers/gpu/drm/imx, same as the DCSS. Another driver for the imx21-
> lcdif will also be added there and we'll move the ipuv3 driver into its
> own subdirectory to make it clear that there are multiple separate
> drivers.

I do disagree with that. This new LCDIF and old LCDIF (mxsfb) are very 
similar except for bit shuffling, and yes, I would like to share common 
code between those two drivers as much as possible.

Placing this driver and mxsfb driver into the same directory makes it easy.

>>   6 files changed, 1168 insertions(+)
>>   create mode 100644 drivers/gpu/drm/mxsfb/lcdif_drv.c
>>   create mode 100644 drivers/gpu/drm/mxsfb/lcdif_drv.h
>>   create mode 100644 drivers/gpu/drm/mxsfb/lcdif_kms.c
>>   create mode 100644 drivers/gpu/drm/mxsfb/lcdif_regs.h
>>
>> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
>> index 987170e16ebd6..deb84f99d2fca 100644
>> --- a/drivers/gpu/drm/mxsfb/Kconfig
>> +++ b/drivers/gpu/drm/mxsfb/Kconfig
>> @@ -19,3 +19,19 @@ config DRM_MXSFB
>>   	  i.MX28, i.MX6SX, i.MX7 and i.MX8M).
>>   
>>   	  If M is selected the module will be called mxsfb.
>> +
>> +config DRM_LCDIF
> 
> The config option name and also the DRM driver name are way too
> generic. Every 3rd SoC out there has a block called lcdif to drive a
> panel...

Do you have any other example of LCDIF ? I only see LCDIF from MX23 
(sgtl design) and this new LCDIF , which still seems like an evolution 
of that sgtl design.

> Maybe something like CONFIG_FSL_LCDIF_V3 and fsl-lcdif-v3 for the name?

Except that LCDIF v3 is the LCDIF present in i.MX23 , which makes this 
even more confusing. Any other ideas ?

[...]

>> +static struct drm_framebuffer *
>> +lcdif_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>> +		const struct drm_mode_fb_cmd2 *mode_cmd)
>> +{
>> +	const struct drm_format_info *info;
>> +
>> +	info = drm_get_format_info(dev, mode_cmd);
>> +	if (!info)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	if (mode_cmd->width * info->cpp[0] != mode_cmd->pitches[0]) {
>> +		dev_dbg(dev->dev, "Invalid pitch: fb width must match pitch\n");
>> +		return ERR_PTR(-EINVAL);
>> +	}
> 
> That's not true. One of the major advantages of the LCDIFv3 vs. the
> other controllers supported by mxsfb is that it actually has a
> configurable pitch (CTRLDESCL0_3) separate from the display width.

Right, dropped.

[...]

>> +static int lcdif_rpm_suspend(struct device *dev)
>> +{
>> +	struct drm_device *drm = dev_get_drvdata(dev);
>> +	struct lcdif_drm_private *lcdif = drm->dev_private;
>> +
>> +	/* These clock supply the DISPLAY CLOCK Domain */
>> +	clk_disable_unprepare(lcdif->clk);
> 
> The pixel clock is really only needed when the display is active, so I
> think it would be better to keep this in the modeset path.

Let's continue this in the MXSFB patch discussion so its in one place.

[...]

>> +static void
>> +lcdif_update_buffer(struct lcdif_drm_private *lcdif, struct drm_plane *plane)
>> +{
>> +	dma_addr_t paddr;
>> +	u32 reg;
>> +
>> +	paddr = lcdif_get_fb_paddr(plane);
>> +	if (!paddr)
>> +		return;
>> +
>> +	writel(lower_32_bits(paddr),
>> +	       lcdif->base + LCDC_V8_CTRLDESCL_LOW0_4);
>> +	writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
>> +	       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
>> +
>> +	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
>> +	reg |= CTRLDESCL0_5_SHADOW_LOAD_EN;
>> +	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> 
> The shadow load enable should typically go into the atomic_flush
> function, together with drm_crtc_arm_vblank_event to avoid races.

Can you elaborate on this further ? Why ? What races ?

>> +static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
>> +{
>> +	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
>> +	u32 ctrl = 0;
>> +
>> +	if (m->flags & DRM_MODE_FLAG_PHSYNC)
>> +		ctrl |= CTRL_INV_HS;
>> +	if (m->flags & DRM_MODE_FLAG_PVSYNC)
>> +		ctrl |= CTRL_INV_VS;
>> +	/* Make sure Data Enable is high active by default */
>> +	if (!(bus_flags & DRM_BUS_FLAG_DE_LOW))
>> +		ctrl |= CTRL_INV_DE;
> 
> The above three controls seems to have the wrong polarity. Bit set
> means low active according to the register documentation and the PVI in
> the HDMI path, which has configurable input signal polarity, seems to
> agree with that.

I seem to recall seeing something about DE polarity being inverted in 
odd way in the NXP downstream driver, and differently for each LCDIF 
instance. Isn't that what you're seeing with HDMI ?

[...]

>> +static void lcdif_disable_controller(struct lcdif_drm_private *lcdif)
>> +{
>> +	u32 reg;
>> +
>> +	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
>> +	reg &= ~CTRLDESCL0_5_EN;
>> +	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> 
> The downstream driver claims that this bit only takes effect on the end
> of frame, so we should wait here to make sure that DMA is really
> stopped.

[...]

The rest should be fixed.
