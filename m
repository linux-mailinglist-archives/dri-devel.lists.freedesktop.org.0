Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED89513319
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 13:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C83A10F8C2;
	Thu, 28 Apr 2022 11:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DBE7910F8C2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 11:57:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A3661474;
 Thu, 28 Apr 2022 04:57:56 -0700 (PDT)
Received: from [10.1.31.24] (e122027.cambridge.arm.com [10.1.31.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC3FB3F73B;
 Thu, 28 Apr 2022 04:57:54 -0700 (PDT)
Message-ID: <0b3136fa-8fd1-5496-812e-c03e430da84a@arm.com>
Date: Thu, 28 Apr 2022 12:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/plane: Move range check for format_count earlier
Content-Language: en-GB
To: Liviu Dudau <liviu.dudau@arm.com>
References: <20211203102815.38624-1-steven.price@arm.com>
 <YaoWxOk0hCuVZpoz@e110455-lin.cambridge.arm.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <YaoWxOk0hCuVZpoz@e110455-lin.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/12/2021 13:08, Liviu Dudau wrote:
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

Gentle ping! I think we've probably waited long enough. Are you going to
merge this or would you like me to?

Thanks,

Steve

> Best regards,
> Liviu
> 
>> ---
>>  drivers/gpu/drm/drm_plane.c | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
>> index 82afb854141b..fd0bf90fb4c2 100644
>> --- a/drivers/gpu/drm/drm_plane.c
>> +++ b/drivers/gpu/drm/drm_plane.c
>> @@ -249,6 +249,13 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>>  	if (WARN_ON(config->num_total_plane >= 32))
>>  		return -EINVAL;
>>  
>> +	/*
>> +	 * First driver to need more than 64 formats needs to fix this. Each
>> +	 * format is encoded as a bit and the current code only supports a u64.
>> +	 */
>> +	if (WARN_ON(format_count > 64))
>> +		return -EINVAL;
>> +
>>  	WARN_ON(drm_drv_uses_atomic_modeset(dev) &&
>>  		(!funcs->atomic_destroy_state ||
>>  		 !funcs->atomic_duplicate_state));
>> @@ -270,13 +277,6 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>>  		return -ENOMEM;
>>  	}
>>  
>> -	/*
>> -	 * First driver to need more than 64 formats needs to fix this. Each
>> -	 * format is encoded as a bit and the current code only supports a u64.
>> -	 */
>> -	if (WARN_ON(format_count > 64))
>> -		return -EINVAL;
>> -
>>  	if (format_modifiers) {
>>  		const uint64_t *temp_modifiers = format_modifiers;
>>  
>> -- 
>> 2.25.1
>>
> 

