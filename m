Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA6656BE5B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 18:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31A410E245;
	Fri,  8 Jul 2022 16:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BC2F710E1ED
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 16:55:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F0031063;
 Fri,  8 Jul 2022 09:55:41 -0700 (PDT)
Received: from [192.168.99.12] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5ACA03F66F;
 Fri,  8 Jul 2022 09:55:40 -0700 (PDT)
Message-ID: <3c9881c8-5a41-19ec-a95f-79a4a2a4852b@foss.arm.com>
Date: Fri, 8 Jul 2022 17:55:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/3] drm/komeda - At init write GCU control block to
 handle already on DPU
Content-Language: en-US
To: Liviu Dudau <liviu.dudau@arm.com>
References: <20220606114714.175499-1-carsten.haitzler@foss.arm.com>
 <20220606114714.175499-2-carsten.haitzler@foss.arm.com>
 <YshWRMqb/h+bAWda@e110455-lin.cambridge.arm.com>
From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Organization: Arm Ltd.
In-Reply-To: <YshWRMqb/h+bAWda@e110455-lin.cambridge.arm.com>
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
Cc: dri-devel@lists.freedesktop.org, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/8/22 17:07, Liviu Dudau wrote:
> On Mon, Jun 06, 2022 at 12:47:13PM +0100, carsten.haitzler@foss.arm.com wrote:
>> From: Carsten Haitzler <carsten.haitzler@arm.com>
>>
>> If something has already set up the DPU before the komeda driver comes
>> up, it will fail to init because it was just writing to the SRST bit in
>> the GCU control register and ignoring others. This resulted in TBU
>> bringup stalling and init failing. By writing completely we also  set the
>> mode back to 0 (inactive) too and thus TBU bringup works.
> 
> This is a rather large hammer, tbh. I would like to see if there is a better way of
> handling the handover from EFIFB that this patch is trying to fix, but I lack an
> usable plaform for that. It will generate a flicker at module load time, but if users
> of Morello are happy with that, then

We're pretty happy with that setup right now. Certainly better than 
Komeda failing to init.

> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
> 
> Best regards,
> Liviu
> 
>>
>> Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
>> ---
>>   drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
>> index 00fa56c29b3e..39618c1a4c81 100644
>> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
>> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
>> @@ -309,8 +309,7 @@ static int d71_reset(struct d71_dev *d71)
>>   	u32 __iomem *gcu = d71->gcu_addr;
>>   	int ret;
>>   
>> -	malidp_write32_mask(gcu, BLK_CONTROL,
>> -			    GCU_CONTROL_SRST, GCU_CONTROL_SRST);
>> +	malidp_write32(gcu, BLK_CONTROL, GCU_CONTROL_SRST);
>>   
>>   	ret = dp_wait_cond(!(malidp_read32(gcu, BLK_CONTROL) & GCU_CONTROL_SRST),
>>   			   100, 1000, 10000);
>> -- 
>> 2.32.0
>>
> 
