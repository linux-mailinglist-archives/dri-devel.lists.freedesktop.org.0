Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E322B467B76
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 17:33:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184B46FEF5;
	Fri,  3 Dec 2021 16:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D66B6FEF5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 16:33:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00D661435
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 08:33:15 -0800 (PST)
Received: from [192.168.99.12] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B91743F73B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 08:33:14 -0800 (PST)
Message-ID: <f8803e4d-afc1-c3c6-39f4-14bea52f003f@foss.arm.com>
Date: Fri, 3 Dec 2021 16:33:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] drm/plane: Move range check for format_count earlier
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20211203102815.38624-1-steven.price@arm.com>
 <YaoWxOk0hCuVZpoz@e110455-lin.cambridge.arm.com>
From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Organization: Arm Ltd.
In-Reply-To: <YaoWxOk0hCuVZpoz@e110455-lin.cambridge.arm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/3/21 13:08, Liviu Dudau wrote:
> On Fri, Dec 03, 2021 at 10:28:15AM +0000, Steven Price wrote:
>> While the check for format_count > 64 in __drm_universal_plane_init()
>> shouldn't be hit (it's a WARN_ON), in its current position it will then
>> leak the plane->format_types array and fail to call
>> drm_mode_object_unregister() leaking the modeset identifier. Move it to
>> the start of the function to avoid allocating those resources in the
>> first place.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
> 
> Well spotted!
> 
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> 
> I'm going to wait to see if anyone else has any comments before I'll merge this into
> drm-misc-fixes (or should it be drm-misc-next-fixes?)

This definitely looks to fix an ugly I spotted too while looking at your 
prior patch thinking it might be wrong so a +1 from me.

> Best regards,
> Liviu
> 
>> ---
>>   drivers/gpu/drm/drm_plane.c | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
>> index 82afb854141b..fd0bf90fb4c2 100644
>> --- a/drivers/gpu/drm/drm_plane.c
>> +++ b/drivers/gpu/drm/drm_plane.c
>> @@ -249,6 +249,13 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>>   	if (WARN_ON(config->num_total_plane >= 32))
>>   		return -EINVAL;
>>   
>> +	/*
>> +	 * First driver to need more than 64 formats needs to fix this. Each
>> +	 * format is encoded as a bit and the current code only supports a u64.
>> +	 */
>> +	if (WARN_ON(format_count > 64))
>> +		return -EINVAL;
>> +
>>   	WARN_ON(drm_drv_uses_atomic_modeset(dev) &&
>>   		(!funcs->atomic_destroy_state ||
>>   		 !funcs->atomic_duplicate_state));
>> @@ -270,13 +277,6 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>>   		return -ENOMEM;
>>   	}
>>   
>> -	/*
>> -	 * First driver to need more than 64 formats needs to fix this. Each
>> -	 * format is encoded as a bit and the current code only supports a u64.
>> -	 */
>> -	if (WARN_ON(format_count > 64))
>> -		return -EINVAL;
>> -
>>   	if (format_modifiers) {
>>   		const uint64_t *temp_modifiers = format_modifiers;
>>   
>> -- 
>> 2.25.1
>>
> 

