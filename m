Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3F4176F13
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 07:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5820E6E996;
	Tue,  3 Mar 2020 06:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67B16E996
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 06:02:56 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02362mgN072926;
 Tue, 3 Mar 2020 00:02:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1583215368;
 bh=yKiNYD+8y7Qu09nDhYahOcRlXG7fP8YIj6NAyiAOHMs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=yrWL1D6CGPLlugRxoFy69xtkmbRU5aQ7B4C8E0x9FfP4c+l1WW88uIfg/OO4XY2X0
 seOjJI5XvEMLNuzxoj/dU98pYt7qk6dDLLaNFtO/epn8MhvsGCevok21XLn+0nyRs5
 5rBJYlgzZqizAqEb8botmCANaxPqIA8Os/oqJejQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02362mHm111089
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 3 Mar 2020 00:02:48 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 3 Mar
 2020 00:02:47 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 3 Mar 2020 00:02:47 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02362hrt076700;
 Tue, 3 Mar 2020 00:02:44 -0600
Subject: Re: [PATCH 3/3] bus: ti-sysc: Implement display subsystem reset quirk
To: Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
References: <20200224191230.30972-1-tony@atomide.com>
 <20200224191230.30972-4-tony@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <7d4af3b5-5dd7-76b3-4d3f-4698bfde288c@ti.com>
Date: Tue, 3 Mar 2020 08:02:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224191230.30972-4-tony@atomide.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
 Dave Gerlach <d-gerlach@ti.com>, Keerthy <j-keerthy@ti.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, "Andrew F . Davis" <afd@ti.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Suman Anna <s-anna@ti.com>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/02/2020 21:12, Tony Lindgren wrote:
> The display subsystem (DSS) needs the child outputs disabled for reset.
> In order to prepare to probe DSS without legacy platform data, let's
> implement sysc_pre_reset_quirk_dss() similar to what we have for the
> platform data with omap_dss_reset().
> 
> Note that we cannot directly use the old omap_dss_reset() without
> platform data callbacks and updating omap_dss_reset() to understand
> struct device. And we will be dropping omap_dss_reset() anyways when
> all the SoCs are probing with device tree, so let's not mess with the
> legacy code at all.
> 
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   drivers/bus/ti-sysc.c                 | 131 +++++++++++++++++++++++++-
>   include/linux/platform_data/ti-sysc.h |   1 +
>   2 files changed, 129 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -1303,11 +1303,11 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
>   	SYSC_QUIRK("dcan", 0x48480000, 0x20, -ENODEV, -ENODEV, 0xa3170504, 0xffffffff,
>   		   SYSC_QUIRK_CLKDM_NOAUTO),
>   	SYSC_QUIRK("dss", 0x4832a000, 0, 0x10, 0x14, 0x00000020, 0xffffffff,
> -		   SYSC_QUIRK_OPT_CLKS_IN_RESET),
> +		   SYSC_QUIRK_OPT_CLKS_IN_RESET | SYSC_MODULE_QUIRK_DSS_RESET),
>   	SYSC_QUIRK("dss", 0x58000000, 0, -ENODEV, 0x14, 0x00000040, 0xffffffff,
> -		   SYSC_QUIRK_OPT_CLKS_IN_RESET),
> +		   SYSC_QUIRK_OPT_CLKS_IN_RESET | SYSC_MODULE_QUIRK_DSS_RESET),
>   	SYSC_QUIRK("dss", 0x58000000, 0, -ENODEV, 0x14, 0x00000061, 0xffffffff,
> -		   SYSC_QUIRK_OPT_CLKS_IN_RESET),
> +		   SYSC_QUIRK_OPT_CLKS_IN_RESET | SYSC_MODULE_QUIRK_DSS_RESET),
>   	SYSC_QUIRK("dwc3", 0x48880000, 0, 0x10, -ENODEV, 0x500a0200, 0xffffffff,
>   		   SYSC_QUIRK_CLKDM_NOAUTO),
>   	SYSC_QUIRK("dwc3", 0x488c0000, 0, 0x10, -ENODEV, 0x500a0200, 0xffffffff,
> @@ -1468,6 +1468,128 @@ static void sysc_init_revision_quirks(struct sysc *ddata)
>   	}
>   }
>   
> +/*
> + * DSS needs dispc outputs disabled to reset modules. Returns mask of
> + * enabled DSS interrupts. Eventually we may be able to do this on
> + * dispc init rather than top-level DSS init.
> + */
> +static u32 sysc_quirk_dispc(struct sysc *ddata, int dispc_offset,
> +			    bool disable)
> +{
> +	bool lcd_en, digit_en, lcd2_en = false, lcd3_en = false;
> +	const int lcd_en_mask = BIT(0), digit_en_mask = BIT(1);
> +	int manager_count;
> +	bool framedonetv_irq;
> +	u32 val, irq_mask = 0;
> +
> +	switch (sysc_soc->soc) {
> +	case SOC_2420 ... SOC_3630:
> +		manager_count = 2;
> +		framedonetv_irq = false;
> +		break;
> +	case SOC_4430 ... SOC_4470:
> +		manager_count = 3;
> +		break;
> +	case SOC_5430:
> +	case SOC_DRA7:
> +		manager_count = 4;
> +		break;
> +	case SOC_AM4:
> +		manager_count = 1;
> +		break;
> +	case SOC_UNKNOWN:
> +	default:
> +		return 0;
> +	};
> +
> +	/* Remap the whole module range to be able to reset dispc outputs */
> +	devm_iounmap(ddata->dev, ddata->module_va);
> +	ddata->module_va = devm_ioremap(ddata->dev,
> +					ddata->module_pa,
> +					ddata->module_size);

Why is this needed? The range is not mapped when sysc_pre_reset_quirk_dss() is called? This will 
unmap and remap twice, as this function is called twice. And then left mapped.

> +	if (!ddata->module_va)
> +		return -EIO;
> +
> +	/* DISP_CONTROL */
> +	val = sysc_read(ddata, dispc_offset + 0x40);

Defines for dss/dispc register offsets could have been copied from the platform display.c and used 
in this file.

> +	lcd_en = val & lcd_en_mask;
> +	digit_en = val & digit_en_mask;
> +	if (lcd_en)
> +		irq_mask |= BIT(0);			/* FRAMEDONE */
> +	if (digit_en) {
> +		if (framedonetv_irq)
> +			irq_mask |= BIT(24);		/* FRAMEDONETV */
> +		else
> +			irq_mask |= BIT(2) | BIT(3);	/* EVSYNC bits */
> +	}
> +	if (disable & (lcd_en | digit_en))
> +		sysc_write(ddata, dispc_offset + 0x40,
> +			   val & ~(lcd_en_mask | digit_en_mask));
> +
> +	if (manager_count <= 2)
> +		return irq_mask;
> +
> +	/* DISPC_CONTROL2 */
> +	val = sysc_read(ddata, dispc_offset + 0x238);
> +	lcd2_en = val & lcd_en_mask;
> +	if (lcd2_en)
> +		irq_mask |= BIT(22);			/* FRAMEDONE2 */
> +	if (disable && lcd2_en)
> +		sysc_write(ddata, dispc_offset + 0x238,
> +			   val & ~lcd_en_mask);
> +
> +	if (manager_count <= 3)
> +		return irq_mask;
> +
> +	/* DISPC_CONTROL3 */
> +	val = sysc_read(ddata, dispc_offset + 0x848);
> +	lcd3_en = val & lcd_en_mask;
> +	if (lcd3_en)
> +		irq_mask |= BIT(30);			/* FRAMEDONE3 */
> +	if (disable && lcd3_en)
> +		sysc_write(ddata, dispc_offset + 0x848,
> +			   val & ~lcd_en_mask);
> +
> +	return irq_mask;
> +}
> +
> +/* DSS needs child outputs disabled and SDI registers cleared for reset */
> +static void sysc_pre_reset_quirk_dss(struct sysc *ddata)
> +{
> +	const int dispc_offset = 0x1000;
> +	int error;
> +	u32 irq_mask, val;
> +
> +	/* Get enabled outputs */
> +	irq_mask = sysc_quirk_dispc(ddata, dispc_offset, false);
> +	if (!irq_mask)
> +		return;
> +
> +	/* Clear IRQSTATUS */
> +	sysc_write(ddata, 0x1000 + 0x18, irq_mask);

dispc_offset instead of 0x1000.

> +
> +	/* Disable outputs */
> +	val = sysc_quirk_dispc(ddata, dispc_offset, true);
> +
> +	/* Poll IRQSTATUS */
> +	error = readl_poll_timeout(ddata->module_va + dispc_offset + 0x18,
> +				   val, val != irq_mask, 100, 50);
> +	if (error)
> +		dev_warn(ddata->dev, "%s: timed out %08x !+ %08x\n",
> +			 __func__, val, irq_mask);
> +
> +	if (sysc_soc->soc == SOC_3430) {
> +		/* Clear DSS_SDI_CONTROL */
> +		sysc_write(ddata, dispc_offset + 0x44, 0);
> +
> +		/* Clear DSS_PLL_CONTROL */
> +		sysc_write(ddata, dispc_offset + 0x48, 0);

These are not dispc registers, but dss registers.

> +	}
> +
> +	/* Clear DSS_CONTROL to switch DSS clock sources to PRCM if not */
> +	sysc_write(ddata, dispc_offset + 0x40, 0);

Same here.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
