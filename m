Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A022A60F218
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 10:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041A110E575;
	Thu, 27 Oct 2022 08:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A95610E581
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 08:19:43 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3D67585092;
 Thu, 27 Oct 2022 10:19:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1666858781;
 bh=9fEy0EaGSpx7ZtrFYB0u8PIEjyo68DQfKaJ89hPyrxA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=STDhsEY2DHOYsP16OkH0pNOSTuv/dHe6dbmQPAV+ck+MHT67XPgNxkzcxFkzg9alX
 3uRf/pyLYcpzgSTmTOIMu5xuhqBcImqQVUqNDvxi60nef8iCIYR/mnoBpSU60GiWUI
 QjFdSC12BRnkoZAG8WZoXMwCMgLnELBh15hAzQr/uIOD7VAkRIG75KPfcRo9McAILn
 UdBlsaihZB/QAAUTw9mUOpC6nw5MVDKPeZohryH0Q1AxA0zGYfjk43l65F6CVkT211
 gVu6tEep5KwIg8+4AaIrQh2CtsWCYjtAc6SjVvOUMliHgaChPupcI4dn3GK1EVd5Gm
 XwKT2ppDL8j1Q==
Message-ID: <9deaa960-778b-a640-a63e-0da5aaf9b934@denx.de>
Date: Thu, 27 Oct 2022 10:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm: lcdif: Set and enable FIFO Panic threshold
Content-Language: en-US
To: Marco Felsch <m.felsch@pengutronix.de>
References: <20221026212002.542375-1-marex@denx.de>
 <20221027081323.luobufjh3n4isiy7@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221027081323.luobufjh3n4isiy7@pengutronix.de>
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
Cc: Peng Fan <peng.fan@nxp.com>, Liu Ying <victor.liu@nxp.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Martyn Welch <martyn.welch@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/27/22 10:13, Marco Felsch wrote:

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
>> +	       lcdif->base + LCDC_V8_PANIC0_THRES);
>> +
>> +	/*
>> +	 * Enable FIFO Panic, this does not generate interrupt, but
>> +	 * boosts NoC priority based on FIFO Panic watermarks.
>> +	 */
>> +	writel(INT_ENABLE_D1_PLANE_PANIC_EN,
>> +	       lcdif->base + LCDC_V8_INT_ENABLE_D1);
> 
> Out of curiosity since we have a patch doing the exact same thing but
> didn't saw any improvements. Is there a reason why you enabled it here?

It seems like the right thing to do here, when enabling the controller.

> We did this during lcdif_rpm_resume(). But as I said with a 1080P
> display we still saw the flickering, it disappeared first after rising
> the burst-size.

That's what the NXP downstream driver does too, isn't it ? That seems 
like the wrong place to me.
