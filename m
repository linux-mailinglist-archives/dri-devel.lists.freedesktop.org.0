Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2477A30EC
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 16:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48EF10E12A;
	Sat, 16 Sep 2023 14:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5816510E12A
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 14:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694874958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/mp9XkH8OUlg5iQgXOIaWNRuMOOZINkri8HGnBg221o=;
 b=J+HfkZFMHTDAC2y9Wdk6UKVLtfqNawJVOfbr04hXSdyU9CjI5ljXW6iXSBZVEer1YVEGGj
 wrik/Y6cJ35ExSUjD2xcOfIOhOD54QMLw+1E5OU66xSsX7pNe/IYNELCsEjiLf39CVlGdU
 ++7JeGuoxNibxwTbkMywMy2K0b4R57A=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-m6ITENNpP8ucrrj9T-9Tlg-1; Sat, 16 Sep 2023 10:35:56 -0400
X-MC-Unique: m6ITENNpP8ucrrj9T-9Tlg-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5007f3d3255so1774931e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 07:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694874955; x=1695479755;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/mp9XkH8OUlg5iQgXOIaWNRuMOOZINkri8HGnBg221o=;
 b=LuSd8oPf4YnFfuIuD5RuJenUmhkb2+HZv/TDZNh66qPc3LveFBAujYbX+4rMk/84JK
 TqzivSzNjIAsdyJIyDrVsEwqxE+zTi+yS6gH0CKUO7sD9YsR0A8dDcdaqRUTW+0SCNw1
 y2VuhXOMSrOBFYR2Ws/RBzX9iOt2DXNRKv1qiGcyDYiK+EvmmnF448SOSFfFnjUckJaw
 6694CtiCKRmCjkoVmd6TSjkVb+JFxxYrwJpobr6Bfd9pd0M3/Xh+aNx6OIZTbh5nc6Ti
 SHYUqPz1GzYlXDL8L9lT+IgjpuItBna2M1LBXhvXaDgi7zHu64e7GuSXRQb/tMZNJBPA
 C2wg==
X-Gm-Message-State: AOJu0Yyesy+pf2XjqBYG9RN+Lguey6YkcNxkPvcCQhg9jlQcFasXdRpk
 mFvueFCGTFIQaxLSD398U2G08ZTbmk9kS0NealU7cfK3AGtkeayit9ZXxfXKXFk06BFwzNdwjDP
 nZbpBCix0HCrGnLjvHWZy5zhRRjND
X-Received: by 2002:ac2:5f46:0:b0:4fe:af1:c3ae with SMTP id
 6-20020ac25f46000000b004fe0af1c3aemr3571158lfz.15.1694874954965; 
 Sat, 16 Sep 2023 07:35:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlgl0Ylz4+Dm9kk9jCkqXMN1BHISMu1BMtuNzZkQJVTmUz/b3svV55Beso1XJDaH8pjSaaCQ==
X-Received: by 2002:ac2:5f46:0:b0:4fe:af1:c3ae with SMTP id
 6-20020ac25f46000000b004fe0af1c3aemr3571143lfz.15.1694874954578; 
 Sat, 16 Sep 2023 07:35:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 u23-20020aa7d997000000b0052a3edff5c3sm3524909eds.87.2023.09.16.07.35.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Sep 2023 07:35:54 -0700 (PDT)
Message-ID: <27ce1aa9-ea98-479d-76ab-45aae531b1de@redhat.com>
Date: Sat, 16 Sep 2023 16:35:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Nouveau] [PATCH] nouveau/u_memcpya: fix NULL vs error pointer bug
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
 <91865741-dd19-39ad-9042-d34ed32e0552@redhat.com>
 <813a260a-80ac-4c11-a0c5-f50edb399b5c@kadam.mountain>
 <2ab31d98-931f-4322-8e67-381d21302a7c@kadam.mountain>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <2ab31d98-931f-4322-8e67-381d21302a7c@kadam.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/16/23 16:26, Dan Carpenter wrote:
> On Sat, Sep 16, 2023 at 05:24:04PM +0300, Dan Carpenter wrote:
>> On Sat, Sep 16, 2023 at 01:41:43AM +0200, Danilo Krummrich wrote:
>>> Hi Dan,
>>>
>>> On 9/15/23 14:59, Dan Carpenter wrote:
>>>> The u_memcpya() function is supposed to return error pointers on
>>>> error.  Returning NULL will lead to an Oops.
>>>>
>>>> Fixes: 68132cc6d1bc ("nouveau/u_memcpya: use vmemdup_user")
>>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/nouveau/nouveau_drv.h | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
>>>> index 3666a7403e47..52a708a98915 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
>>>> @@ -193,7 +193,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
>>>>    	size_t bytes;
>>>>    	if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
>>>> -		return NULL;
>>>> +		return ERR_PTR(-ENOMEM);
>>>
>>> I plan to replace this function with an upcoming vmemdup_array_user() helper,
>>> which returns -EOVERFLOW instead, hence mind using that?
>>>
>>> Unless you disagree, no need to resubmit the patch, I can change it
>>> before applying the patch.
>>
>> Generally, I would say that ENOMEM is the correct error code.  I feel
>> like someone thinks EOVERFLOW means integer overflow and that's not
>> correct.  I means like if you pass a number higher than INT_MAX to
>> kstroint().
> 
> The most common error code for integer overflows is EINVAL because the
> user passed invalid data.

I totally agree with that, and my choice would have been EINVAL as well. It's just
that it seems (v)memdup_array_user() [1] goes with that and hence I'd just go along.

[1] https://lore.kernel.org/lkml/93001a9f3f101be0f374080090f9c32df73ca773.1694202430.git.pstanner@redhat.com/

> 
> regards,
> dan carpenter
> 

