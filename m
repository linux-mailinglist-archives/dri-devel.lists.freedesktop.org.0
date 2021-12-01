Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F03E5464F7E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 15:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E226EB07;
	Wed,  1 Dec 2021 14:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 393536E9DD;
 Wed,  1 Dec 2021 14:19:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5FDA143B;
 Wed,  1 Dec 2021 06:19:24 -0800 (PST)
Received: from [10.57.34.58] (unknown [10.57.34.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10F763F5A1;
 Wed,  1 Dec 2021 06:19:22 -0800 (PST)
Message-ID: <c11d2a04-428c-67c2-9cd6-52ce3281cdab@arm.com>
Date: Wed, 1 Dec 2021 14:18:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 3/3] drm/etnaviv: use a 32 bit mask as coherent DMA mask
Content-Language: en-GB
To: Lucas Stach <l.stach@pengutronix.de>, Michael Walle <michael@walle.cc>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20210907164945.2309815-1-michael@walle.cc>
 <20210907164945.2309815-4-michael@walle.cc>
 <25915a21-57f2-adbd-cfc2-1a2bc2a1a5e7@arm.com>
 <d0266804325c6dd35aab5b82a552506892c546d1.camel@pengutronix.de>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <d0266804325c6dd35aab5b82a552506892c546d1.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>, Marek Vasut <marek.vasut@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "Lukas F . Hartmann" <lukas@mntre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-01 13:41, Lucas Stach wrote:
> Hi Robin,
> 
> Am Mittwoch, dem 01.12.2021 um 12:50 +0000 schrieb Robin Murphy:
>> Sorry I missed this earlier...
>>
>> On 2021-09-07 17:49, Michael Walle wrote:
>>> The STLB and the first command buffer (which is used to set up the TLBs)
>>> has a 32 bit size restriction in hardware. There seems to be no way to
>>> specify addresses larger than 32 bit. Keep it simple and restict the
>>> addresses to the lower 4 GiB range for all coherent DMA memory
>>> allocations.
>>>
>>> Please note, that platform_device_alloc() will initialize dev->dma_mask
>>> to point to pdev->platform_dma_mask, thus dma_set_mask() will work as
>>> expected.
>>>
>>> While at it, move the dma_mask setup code to the of_dma_configure() to
>>> keep all the DMA setup code next to each other.
>>>
>>> Suggested-by: Lucas Stach <l.stach@pengutronix.de>
>>> Signed-off-by: Michael Walle <michael@walle.cc>
>>> ---
>>>    drivers/gpu/drm/etnaviv/etnaviv_drv.c | 20 ++++++++++++++++++--
>>>    1 file changed, 18 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>>> index 54eb653ca295..0b756ecb1bc2 100644
>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>>> @@ -613,6 +613,24 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
>>>    			component_match_add(dev, &match, compare_str, names[i]);
>>>    	}
>>>    
>>> +	/*
>>> +	 * PTA and MTLB can have 40 bit base addresses, but
>>> +	 * unfortunately, an entry in the MTLB can only point to a
>>> +	 * 32 bit base address of a STLB. Moreover, to initialize the
>>> +	 * MMU we need a command buffer with a 32 bit address because
>>> +	 * without an MMU there is only an indentity mapping between
>>> +	 * the internal 32 bit addresses and the bus addresses.
>>> +	 *
>>> +	 * To make things easy, we set the dma_coherent_mask to 32
>>> +	 * bit to make sure we are allocating the command buffers and
>>> +	 * TLBs in the lower 4 GiB address space.
>>> +	 */
>>> +	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(40)) ||
>>> +	    dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32))) {
>>
>> Since AFAICS you're not changing the default dma_mask pointer to point
>> to some storage other than the coherent mask, the dma_set_mask() call
>> effectively does nothing and both masks will end up reading back as 32 bits.
>>
>  From what I can see the dma_mask has allocated storage in the platform
> device and does not point to the coherent dma mask, see
> setup_pdev_dma_masks().

Urgh, apologies for the confusion - seems I had one of those mental 
short-circuits and was utterly convinced that that's what the platform 
device setup did, but of course it's only the fallback case in 
of_dma_configure(). Sorry for the noise!

Cheers,
Robin.
