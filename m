Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C22352AD62C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 13:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FC789A8C;
	Tue, 10 Nov 2020 12:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE7D89A8C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 12:27:09 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AACR6PX038987;
 Tue, 10 Nov 2020 06:27:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605011226;
 bh=qaplHHHfbCRRC09+eEOndaHKROgEAwxSi4I1D6Vqgx4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=DUrrcLMeD4ZyTFtB9489c2sGBNY4CbmNZamnj99Pm1OgAuyCdnEkHUdgnODrxr1QD
 mITpdqEFBB99UAVn2I4v+XYX05rPWFJOUXGevbGVUkgvjv8sNMkEKQsfs2Pbc7qMiD
 uC5qBMFSxrdBg2kB9W9hONPWcYys6I8l+8jRAzPM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AACR5DO019194
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 06:27:05 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 10
 Nov 2020 06:27:05 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 10 Nov 2020 06:27:05 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AACR3ov070601;
 Tue, 10 Nov 2020 06:27:04 -0600
Subject: Re: [PATCH v2 6/6] drm/bridge: cdns-mhdp8546: Fix the interrupt
 enable/disable
To: Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20201109170601.21557-1-nikhil.nd@ti.com>
 <20201109170601.21557-7-nikhil.nd@ti.com>
 <1e434bb5-c027-792a-0c4d-c3cf057a0ec6@ti.com>
 <20201110102723.mgtrq5gznvvbpop2@NiksLab>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <9d23f838-a9bc-ba5d-adfe-9b3bfc26c223@ti.com>
Date: Tue, 10 Nov 2020 14:27:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201110102723.mgtrq5gznvvbpop2@NiksLab>
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
Cc: Yuti Amonkar <yamonkar@cadence.com>, Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/11/2020 12:27, Nikhil Devshatwar wrote:
> On 11:21-20201110, Tomi Valkeinen wrote:
>> On 09/11/2020 19:06, Nikhil Devshatwar wrote:
>>> When removing the tidss driver, there is a warning reported by
>>> kernel about an unhandled interrupt for mhdp driver.
>>>
>>> [   43.238895] irq 31: nobody cared (try booting with the "irqpoll" option)
>>> ... [snipped backtrace]
>>> [   43.330735] handlers:
>>> [   43.333020] [<000000005367c4f9>] irq_default_primary_handler threaded [<000000007e02b601>]
>>> cdns_mhdp_irq_handler [cdns_mhdp8546]
>>> [   43.344607] Disabling IRQ #31
>>>
>>> This happens because as part of cdns_mhdp_bridge_hpd_disable, driver tries
>>> to disable the interrupts. While disabling the SW_EVENT interrupts,
>>> it accidentally enables the MBOX interrupts, which are not handled by
>>> the driver.
>>>
>>> Fix this with a read-modify-write to update only required bits.
>>> Do the same for enabling interrupts as well.
>>>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>> ---
>>>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 7 +++++--
>>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>> index 2cd809eed827..6beccd2a408e 100644
>>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>> @@ -2146,7 +2146,8 @@ static void cdns_mhdp_bridge_hpd_enable(struct drm_bridge *bridge)
>>>  
>>>  	/* Enable SW event interrupts */
>>>  	if (mhdp->bridge_attached)
>>> -		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
>>> +		writel(readl(mhdp->regs + CDNS_APB_INT_MASK) &
>>> +		       ~CDNS_APB_INT_MASK_SW_EVENT_INT,
>>>  		       mhdp->regs + CDNS_APB_INT_MASK);
>>>  }
>>>  
>>> @@ -2154,7 +2155,9 @@ static void cdns_mhdp_bridge_hpd_disable(struct drm_bridge *bridge)
>>>  {
>>>  	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
>>>  
>>> -	writel(CDNS_APB_INT_MASK_SW_EVENT_INT, mhdp->regs + CDNS_APB_INT_MASK);
>>> +	writel(readl(mhdp->regs + CDNS_APB_INT_MASK) |
>>> +	       CDNS_APB_INT_MASK_SW_EVENT_INT,
>>> +	       mhdp->regs + CDNS_APB_INT_MASK);
>>>  }
>>>  
>>>  static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
>>
>> Good catch. I wonder why we need the above functions... We already enable and disable the interrupts
>> when attaching/detaching the driver. And I think we want to get the interrupt even if we won't
>> report HPD (but I think we always do report it), as we need the interrupts to track the link status.
>>
> 
> I read from the code that there is TODO for handling the mailbox
> interrupts in the driver. Once that is supported, you will be able to
> explictily enable/disable interrupts for SW_EVENTS (like hotplug) as
> well as mailbox events. This enabling specific bits in the interrupt
> status.

But SW_EVENTS is not the same as HPD, at least in theory. If we disable SW_EVENT_INT in
hpd_disable(), we lose all SW_EVENT interrupts.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
