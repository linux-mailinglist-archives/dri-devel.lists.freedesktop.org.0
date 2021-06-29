Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A2B3B6CC2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 05:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BC36E563;
	Tue, 29 Jun 2021 03:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78896E563
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 03:04:59 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 41F4582E6A;
 Tue, 29 Jun 2021 05:04:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1624935897;
 bh=gfBsN8VB3YDyMB96LBSRFDM8pajTYV1Oqj8CMp5r2PU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PZCu5SFWw2WSEDf5xO8/ECdV4QQJWBKlZMP5gc6vHYUMd/d9qROAIGHTIqBogPAfR
 6d7PC9283gWOLxlqbGd9S4FZiD0JxRvi1yE3ShtIRLHPmPTCZOrDZme4KUEx4a78eK
 1FOmUda0AFJTlgbBDjcbnbRlrIstqX1AiD+ynOK55Gl0PXSHj7KjT6Qtijk8AOED5A
 mWj9hnNHWaiqxOrexYWYaJYpsSUVDyKkv9p+XaKjrjGi5scJmjvVL3GwSJ3Jrle7+/
 S32xirKQCUZLxxRc54wS/lbH3scXUVWqiwM0CRX1uMg1CU1w846e7U4LAi0+HOdU0d
 SQQWQ4TOBGWPA==
Subject: Re: [PATCH] drm: mxsfb: Clear FIFO_CLEAR bit
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20210620224946.189524-1-marex@denx.de>
 <be290a3283ecadeb9269bd00e85adac99434eb82.camel@pengutronix.de>
 <85372867-2b5b-e97f-aa04-ed976db1eddb@denx.de>
 <07f58c1181e2e66277d0355055ff794fb091991d.camel@pengutronix.de>
 <d539afbd-c101-6a30-0a61-c52696521be7@denx.de>
 <fc2eeee51e5ef448aa814e572c27bf7f225078a7.camel@pengutronix.de>
 <6e1b79de-d748-000c-fd47-72ff7c265d9c@denx.de>
 <cbabc18803d241516137f1c8f45733ebb6f576a8.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <eddfaedf-cfbf-ad47-441a-11460d83d476@denx.de>
Date: Tue, 29 Jun 2021 05:04:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cbabc18803d241516137f1c8f45733ebb6f576a8.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Cc: Daniel Abrecht <public@danielabrecht.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>, ch@denx.de,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/28/21 10:09 AM, Lucas Stach wrote:
> Am Samstag, dem 26.06.2021 um 20:15 +0200 schrieb Marek Vasut:
>> On 6/24/21 2:01 PM, Lucas Stach wrote:
>>> Am Dienstag, dem 22.06.2021 um 11:33 +0200 schrieb Marek Vasut:
>>>> On 6/22/21 9:28 AM, Lucas Stach wrote:
>>>>> Am Montag, dem 21.06.2021 um 18:30 +0200 schrieb Marek Vasut:
>>>>>> On 6/21/21 2:14 PM, Lucas Stach wrote:
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>>>>>>>> index 98d8ba0bae84..22cb749fc9bc 100644
>>>>>>>> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>>>>>>>> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>>>>>>>> @@ -241,6 +241,9 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
>>>>>>>>      
>>>>>>>>      	/* Clear the FIFOs */
>>>>>>>>      	writel(CTRL1_FIFO_CLEAR, mxsfb->base + LCDC_CTRL1 + REG_SET);
>>>>>>>> +	readl(mxsfb->base + LCDC_CTRL1);
>>>>>>>
>>>>>>> Do you really need those readbacks? As both writes are targeting the
>>>>>>> same slave interface, the memory barrier in the clear write should push
>>>>>>> the set write.
>>>>>>
>>>>>> What would push the clear write then ? We can drop one of the readl()s,
>>>>>> but not the last one.
>>>>>
>>>>> There are a lot of more writes with barriers to the controller slave
>>>>> interface in that function after clearing the FIFO. I don't see why
>>>>> this readback would be required.
>>>>
>>>> Because you really do want to make sure the fifo is cleared before you
>>>> start doing any of those other writes or configuring the controller in
>>>> any way.
>>>
>>> I still don't see the reason. What additional properties do you think
>>> the readback provides that isn't already provided by the barriers in
>>> the following writes?
>>
>> See the paragraph above -- we have to make sure the writes that trigger
>> the FIFO clearing really take place before any other writes do.
> 
> And they do, as there are write barriers prepended to the writes
> following the FIFO clear. The readback just lets the CPU wait until the
> write reached the peripheral, which I don't see a reason to do here.
> The ordering of the writes from the perspective of the peripheral is
> completely the same with or without the readback. The later writes can
> not overtake the FIFO clear writes due to the barriers.
> 
> I'm strongly against adding stuff because it "might have an effect", if
> it isn't required by architectural rules. It clutters the code and some
> months/years down the line nobody dares to cleanup/remove this stuff
> anymore, because everyone assumes that there was a good reason for
> adding those things.

Since there is no RTL for any of the iMXes or their IPs, how do you 
propose anyone except NXP can validate what is and what is not required ?

This patch helps with a problem where I sporadically observe shifted 
image on boot on mx8mm.
