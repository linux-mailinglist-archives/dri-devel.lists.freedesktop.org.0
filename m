Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6EB60F460
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 12:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2BC10E5B5;
	Thu, 27 Oct 2022 10:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB89210E5B5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 10:03:45 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E2A40850C2;
 Thu, 27 Oct 2022 12:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1666865023;
 bh=x8RQF8Ar63YaV3PFReAkC8RB+jyGwVhQSWcb6XIfXmQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KGSxolm3ZuIkIfv0znyjGyUmx5pQLKReAijj0G2hkL9/XXrNwBYazzGTkIfjJteAR
 zwpTzj/rVgwgMuTK8yykzwlclABQieTxFSw88PbXY6tHOQesGYp/dzpW1fTp2PRA+4
 /IEPTL9tUeuvsImGOUAfL8Wk98ifLofjuz/zOMTbcfViks+lEdsnqQoiZkO4MuXx5R
 7M5QCGdxDbKKFLtAYEMXbuNHU1cG4p+U2odwlT2DExu69iEc32eparkrM6S6MBUQOw
 5KiNERyTdQGHcDG4mwHNbeQVohVjgvdAm6tYQLbMbKOiybFMiHigc3H708P7xd4qbu
 bd2Tcm2Bc4RFA==
Message-ID: <9bd9ee85-3a20-f13a-3984-017a439e08cd@denx.de>
Date: Thu, 27 Oct 2022 12:03:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm: lcdif: Set and enable FIFO Panic threshold
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
References: <20221026212002.542375-1-marex@denx.de>
 <2e9368bcc1c354ff01e63b9c451d839aa6a7a36f.camel@nxp.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2e9368bcc1c354ff01e63b9c451d839aa6a7a36f.camel@nxp.com>
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
Cc: Peng Fan <peng.fan@nxp.com>, Martyn Welch <martyn.welch@collabora.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, "jian.li" <jian.li@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/27/22 07:45, Liu Ying wrote:

Hi,

[...]

>> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
>> index a5302006c02cd..aee7babb5fa5c 100644
>> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
>> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
>> @@ -341,6 +341,18 @@ static void lcdif_enable_controller(struct lcdif_drm_private *lcdif)
>>   	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
>>   	reg |= CTRLDESCL0_5_EN;
>>   	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
>> +
>> +	/* Set FIFO Panic watermarks, low 1/3, high 2/3 . */
>> +	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 * PANIC0_THRES_RANGE / 3) |
>> +	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 * PANIC0_THRES_RANGE / 3),
> 
> Better to define PANIC0_THRES_{LOW,HIGH}(n) macros in lcdif_regs.h?
> 
> Downstream kernel uses the below threshold values:
> a) i.MX8mp EVK board with LPDDR4
> 1/3 and 2/3 for LCDIF{1,2} + DSI/LVDS - default values in driver
> 1/2 and 3/4 for LCDIF3 + HDMI - set in device tree
> 
> b) i.MX8mp EVK board with DDR4
> 1/3 and 2/3 for LCDIF{1,2} + DSI/LVDS - default values in driver
> 2/3 and 3/3 for LCDIF3 + HDMI - set in devic tree
> 
> Jian told me that LCDIF3 needs different sets of threshold values for
> different types of DDR to avoid 4k HDMI display issues and the
> threshold values impact overall DDR/bus utilization(?), so downstream
> kernel chooses to get optional threshold value properties from LCDIF DT
> node.
> 
> Instead of always using 1/3 and 2/3, maybe there are three options:
> 1) Same to downstream kernel, take 1/3 and 2/3 as default values and
> get optional threshold values from DT properties - no additional
> properties are acceptable in the existing DT binding doc?
> 2) Check pixel clock rate, and if it is greater than a certain value,
> use 2/3 and 3/3.  Otherwise, use 1/3 and 2/3.
> 3) Always use 2/3 and 3/3.

Why 2/3 and 3/3 instead of 1/3 and 2/3 ?

Seems like 1/3 and 2/3 provides enough FIFO margin for every scenario.

>> +	       lcdif->base + LCDC_V8_PANIC0_THRES);
>> +
>> +	/*
>> +	 * Enable FIFO Panic, this does not generate interrupt, but
>> +	 * boosts NoC priority based on FIFO Panic watermarks.
>> +	 */
>> +	writel(INT_ENABLE_D1_PLANE_PANIC_EN,
>> +	       lcdif->base + LCDC_V8_INT_ENABLE_D1);
> 
> This should be enabled _before_ LCDIF controller starts to fetch
> pixels, otherwise, there is chance that the FIFO still underflows.

That means _before_ DISP_PARA_DISP_ON or CTRLDESCL0_5_EN ?

>>   }
>>   
>>   static void lcdif_disable_controller(struct lcdif_drm_private *lcdif)
>> @@ -348,6 +360,9 @@ static void lcdif_disable_controller(struct lcdif_drm_private *lcdif)
>>   	u32 reg;
>>   	int ret;
>>   
>> +	/* Disable FIFO Panic NoC priority booster. */
>> +	writel(0, lcdif->base + LCDC_V8_INT_ENABLE_D1);
> 
> Similar to enablement, this should be disabled _after_ LCDIF controller
> stops fetching pixels.

Same question as above applies, which bits controls that part, DISP_ON 
or CTRLDESCL0_5_EN ? I suspect the later.

>> +
>>   	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
>>   	reg &= ~CTRLDESCL0_5_EN;
>>   	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
>> diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h b/drivers/gpu/drm/mxsfb/lcdif_regs.h
>> index fb74eb5ccbf1d..3d2f81d6f995e 100644
>> --- a/drivers/gpu/drm/mxsfb/lcdif_regs.h
>> +++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
>> @@ -255,6 +255,7 @@
>>   
>>   #define PANIC0_THRES_LOW_MASK		GENMASK(24, 16)
>>   #define PANIC0_THRES_HIGH_MASK		GENMASK(8, 0)
>> +#define PANIC0_THRES_RANGE		512
> 
> Should be 511? If high threshold is 3/3 and PANIC0_THRES_RANGE = 512,
> PANIC0_THRES_HIGH will overflow and zero is set.

Let's rename this to PANIC0_THRES_MAX too.
