Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE3460F339
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 11:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239DA10E58B;
	Thu, 27 Oct 2022 09:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72A110E58B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 09:09:31 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 16BB680079;
 Thu, 27 Oct 2022 11:09:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1666861769;
 bh=FYEhkK0PI1aRbm2f0jFXL7eACJndyI2w8Cr5VowPmAk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XPGZvkKT9jrBYmQvnxe67EiLv1M/lFPZJgnK3dchSQi3HREJZeBmXKkQxd0ZkXBIE
 iEQNCB5vAXTk4l0ov01TbZUFA3t2lKvIshuS2uuCMrHs/0PBe0LbAnZn84zEVhbWtA
 5VtVrPEN0F52xpH9y/MaqyIS7RSJd1ciQa9FLIS8LnXmmHDnYPYK00/Jq7UO0JDHFe
 wBGGMwdqSJ/62tKL8dW/hXXJ5zzoUiy+tMIHyvKh8KTVpCIciEKSIk0Ph8g9V7Lo22
 OHoGiyS+TPIJ3cYm1olmZzcMdyxVVb81q0/Cl9YMEvfDibpuGFjpP3GoA0Oo9ReBSL
 kR4j3ghY/GOTg==
Message-ID: <f2988921-894b-0b3c-7d33-b80372254df0@denx.de>
Date: Thu, 27 Oct 2022 11:09:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm: lcdif: Set and enable FIFO Panic threshold
Content-Language: en-US
To: Marco Felsch <m.felsch@pengutronix.de>
References: <20221026212002.542375-1-marex@denx.de>
 <20221027081323.luobufjh3n4isiy7@pengutronix.de>
 <9deaa960-778b-a640-a63e-0da5aaf9b934@denx.de>
 <20221027083223.cwgymey4ar247afe@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221027083223.cwgymey4ar247afe@pengutronix.de>
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

On 10/27/22 10:32, Marco Felsch wrote:

Hi,

>>>> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
>>>> index a5302006c02cd..aee7babb5fa5c 100644
>>>> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
>>>> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
>>>> @@ -341,6 +341,18 @@ static void lcdif_enable_controller(struct lcdif_drm_private *lcdif)
>>>>    	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
>>>>    	reg |= CTRLDESCL0_5_EN;
>>>>    	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
>>>> +
>>>> +	/* Set FIFO Panic watermarks, low 1/3, high 2/3 . */
>>>> +	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 * PANIC0_THRES_RANGE / 3) |
>>>> +	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 * PANIC0_THRES_RANGE / 3),
>>>> +	       lcdif->base + LCDC_V8_PANIC0_THRES);
>>>> +
>>>> +	/*
>>>> +	 * Enable FIFO Panic, this does not generate interrupt, but
>>>> +	 * boosts NoC priority based on FIFO Panic watermarks.
>>>> +	 */
>>>> +	writel(INT_ENABLE_D1_PLANE_PANIC_EN,
>>>> +	       lcdif->base + LCDC_V8_INT_ENABLE_D1);
>>>
>>> Out of curiosity since we have a patch doing the exact same thing but
>>> didn't saw any improvements. Is there a reason why you enabled it here?
>>
>> It seems like the right thing to do here, when enabling the controller.
>>
>>> We did this during lcdif_rpm_resume(). But as I said with a 1080P
>>> display we still saw the flickering, it disappeared first after rising
>>> the burst-size.
>>
>> That's what the NXP downstream driver does too, isn't it ? That seems like
>> the wrong place to me.
> 
> Yes, I think so. It's not about the place (if it wrong/correct) it is
> more about the PANIC mode itself. I'm curios about:
>   1) Do you still see the flickering with this patch and without the
>      "burst-size increase" patch?

No

>   2) Do you still saw flickering after the "burst-size increase" patch
>      applied and without this patch?

I did not try

> I had no 4K display therefore I'm asking, but with 1080P we didn't saw
> any improvements without increasing the burst-size. My assumption was:
> if the panic mode does work, than I don't have to increase the
> burst-size.

I believe the burst size optimizes the DRAM access pattern -- longer 
bursts mean the DRAM controller can do longer sustained transfers from 
the DRAM, which means fewer gaps between transfers for the same amount 
of data, which means you can use the newly available spare bandwidth for 
some other transfer.
