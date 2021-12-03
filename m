Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 667CA4679EA
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 16:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649556FFB2;
	Fri,  3 Dec 2021 15:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8F45C6FFB2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 15:02:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33B1F1396
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 07:02:09 -0800 (PST)
Received: from [192.168.99.12] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDCE03F73B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 07:02:08 -0800 (PST)
Message-ID: <38cb5793-494e-15f8-7ccf-ae52d811fec8@foss.arm.com>
Date: Fri, 3 Dec 2021 15:02:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] drm/komeda: return early if drm_universal_plane_init()
 fails.
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <95728378-3af0-2b55-0545-46d5131fa491@arm.com>
 <20211203100946.2706922-1-liviu.dudau@arm.com>
 <76a8e999-f54c-625a-1180-95ceb159cb25@foss.arm.com>
From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Organization: Arm Ltd.
In-Reply-To: <76a8e999-f54c-625a-1180-95ceb159cb25@foss.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/3/21 14:15, Carsten Haitzler wrote:
> On 12/3/21 10:09, Liviu Dudau wrote:
>> If drm_universal_plane_init() fails early we jump to the common 
>> cleanup code
>> that calls komeda_plane_destroy() which in turn could access the 
>> uninitalised
>> drm_plane and crash. Return early if an error is detected without 
>> going through
>> the common code.
>>
>> Reported-by: Steven Price <steven.price@arm.com>
>> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
>> ---
>>   drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c 
>> b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
>> index aa193c58f4bf6d9..517b94c3bcaf966 100644
>> --- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
>> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
>> @@ -279,8 +279,10 @@ static int komeda_plane_add(struct komeda_kms_dev 
>> *kms,
>>       komeda_put_fourcc_list(formats);
>> -    if (err)
>> -        goto cleanup;
>> +    if (err) {
>> +        kfree(kplane);
>> +        return err;
>> +    }
>>       drm_plane_helper_add(plane, &komeda_plane_helper_funcs);
>>
> 
> Ummm... can I disagree here? this goto cleanup I think is just fine 
> because plane has been set before drm_universal_plane_init() is called 
> which is before the if (err) here. komeda_plane_destroy() in cleanup: 
> does all the right things, so this patch isn't needed. I think it's less 
> clean as it adds a new "handle error" path special-case instance where a 
> special case is not needed. The fix to Zhou's original patch was needed 
> for exactly the reason Liviu said - but not this one... ?

Let me take that back - it seems an init fail shouldn't call cleanup but 
the init fail doesn't quite cleanup properly. Steven found this and 
already sent a patch.
