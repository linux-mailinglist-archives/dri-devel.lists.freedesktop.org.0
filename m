Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B8F73A2F0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 16:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F5110E571;
	Thu, 22 Jun 2023 14:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F35910E571
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687443783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0q7rImqCfSTwUHverUYJSMCU6piKOXc2WChZXUdmxQE=;
 b=h2z+AvSrxcOyH6CdRuWdSX89Wya/VwKPIoF5wSxvbLfgy4CRoALoBjgPzQNY6lCLKQwVq1
 5/U46embxwEGdtL1aBquRNCB361PpQs4+lKT9OCZny1QHWeXpAYuS7ddOYhIplOJ2k0PZL
 gZgOCnAHO42TizppeNfSIAPCWJxr+9U=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-F6JkvFfTOtSWQy3WgW__vg-1; Thu, 22 Jun 2023 10:22:59 -0400
X-MC-Unique: F6JkvFfTOtSWQy3WgW__vg-1
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-53425d37f33so3334575a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 07:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687443769; x=1690035769;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0q7rImqCfSTwUHverUYJSMCU6piKOXc2WChZXUdmxQE=;
 b=juwfdl0uX+m/5+HlKjEBs10fWawNNe0zUhySTsyIirfbppq3SYGnlpmFMOD3SPGpUU
 wmcXWJ1DTiMEGk+ctzO2n+1/lSXAmbNyVGF0cbDB3SzvZ6zQJyll4CtqtgbmZk8povsi
 uohJNW2z5ibPpx0dUkTZB9V0mWOYPdX4ecAIeZtLUaeQtkzem8K+N/L1CfThfhwk3yWH
 i2RcrNZvdD4SWk3Z7jIwrggagVkyatYWM8kS71AbxNcZ7n76FrYCZ1p5q0iKHcAAlJXb
 oFytUb06TBVXCqqRH5qepo7OlKrcdNyFHxX3C6OlzWHJs0mortW+aK8YVpvY9hIdpKJ3
 jGEA==
X-Gm-Message-State: AC+VfDx/dEkplJ8mJu1oV6QiuzwDoVmzfdu7rwzzfr6pJ0oux/6AWr2V
 W/7K0GoqPq5dhAulRvORMOGXBXnwSVVhQ75sQJSHz+ZNyI6pIut2n0OTnKx5u8AElgXH0DQIKUY
 DXIXfBAh/ZuLGiQGCuLb9Kp1A/XGM
X-Received: by 2002:a17:903:280e:b0:1b0:48e9:cddd with SMTP id
 kp14-20020a170903280e00b001b048e9cdddmr11003954plb.69.1687443769268; 
 Thu, 22 Jun 2023 07:22:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7WGrYMwwejrJnH7T2C3FaNBaY1FPeFkjKFjutN5VdhnvN4RMKBQk6mBNw0Aj/+8BttIDl5ZA==
X-Received: by 2002:a17:903:280e:b0:1b0:48e9:cddd with SMTP id
 kp14-20020a170903280e00b001b048e9cdddmr11003932plb.69.1687443768933; 
 Thu, 22 Jun 2023 07:22:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a170902d34500b001b5640a8874sm5438809plk.293.2023.06.22.07.22.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 07:22:48 -0700 (PDT)
Message-ID: <bcde7ea3-fbab-3a18-e810-64b6589ddb18@redhat.com>
Date: Thu, 22 Jun 2023 16:22:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH drm-next v5 03/14] drm: manager to keep track of GPUs VA
 mappings
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de, mripard@kernel.org,
 corbet@lwn.net, bskeggs@redhat.com, Liam.Howlett@oracle.com,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
 willy@infradead.org, jason@jlekstrand.net
References: <20230620004217.4700-1-dakr@redhat.com>
 <20230620004217.4700-4-dakr@redhat.com>
 <cf6846ea-5bd0-0b41-b7e6-901c70701751@amd.com>
 <a8edf75b-e0f7-a6c7-7d29-f0d39923549b@redhat.com>
 <41aecd10-9956-0752-2838-34c97834f0c8@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <41aecd10-9956-0752-2838-34c97834f0c8@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Donald Robson <donald.robson@imgtec.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/22/23 15:54, Christian König wrote:
> Am 20.06.23 um 14:23 schrieb Danilo Krummrich:
>> Hi Christian,
>>
>> On 6/20/23 08:45, Christian König wrote:
>>> Hi Danilo,
>>>
>>> sorry for the delayed reply. I've trying to dig myself out of a hole 
>>> at the moment.
>>
>> No worries, thank you for taking a look anyway!
>>
>>>
>>> Am 20.06.23 um 02:42 schrieb Danilo Krummrich:
>>>> [SNIP]
>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>>> index bbc721870c13..5ec8148a30ee 100644
>>>> --- a/include/drm/drm_gem.h
>>>> +++ b/include/drm/drm_gem.h
>>>> @@ -36,6 +36,8 @@
>>>>   #include <linux/kref.h>
>>>>   #include <linux/dma-resv.h>
>>>> +#include <linux/list.h>
>>>> +#include <linux/mutex.h>
>>>>   #include <drm/drm_vma_manager.h>
>>>> @@ -379,6 +381,18 @@ struct drm_gem_object {
>>>>        */
>>>>       struct dma_resv _resv;
>>>> +    /**
>>>> +     * @gpuva:
>>>> +     *
>>>> +     * Provides the list of GPU VAs attached to this GEM object.
>>>> +     *
>>>> +     * Drivers should lock list accesses with the GEMs &dma_resv lock
>>>> +     * (&drm_gem_object.resv).
>>>> +     */
>>>> +    struct {
>>>> +        struct list_head list;
>>>> +    } gpuva;
>>>> +
>>>>       /**
>>>>        * @funcs:
>>>>        *
>>>
>>> I'm pretty sure that it's not a good idea to attach this directly to 
>>> the GEM object.
>>
>> Why do you think so? IMHO having a common way to connect mappings to 
>> their backing buffers is a good thing, since every driver needs this 
>> connection anyway.
>>
>> E.g. when a BO gets evicted, drivers can just iterate the list of 
>> mappings and, as the circumstances require, invalidate the 
>> corresponding mappings or to unmap all existing mappings of a given 
>> buffer.
>>
>> What would be the advantage to let every driver implement a driver 
>> specific way of keeping this connection?
> 
> Flexibility. For example on amdgpu the mappings of a BO are groups by VM 
> address spaces.
> 
> E.g. the BO points to multiple bo_vm structures which in turn have lists 
> of their mappings.

Isn't this (almost) the same relationship I introduce with the GPUVA 
manager?

If you would switch over to the GPUVA manager right now, it would be 
that every GEM has a list of it's mappings (the gpuva list). The mapping 
is represented by struct drm_gpuva (of course embedded in driver 
specific structure(s)) which has a pointer to the VM address space it is 
part of, namely the GPUVA manager instance. And the GPUVA manager keeps 
a maple tree of it's mappings as well.

If you still would like to *directly* (indirectly you already have that 
relationship) keep a list of GPUVA managers (VM address spaces) per GEM, 
you could still do that in a driver specific way.

Do I miss something?

> 
> Additional to that there is a state maschine associated with the 
> mappings, e.g. if the page tables are up to date or need to be updated 
> etc....
> 
>> Do you see cases where this kind of connection between mappings and 
>> backing buffers wouldn't be good enough? If so, which cases do you 
>> have in mind? Maybe we can cover them in a common way as well?
> 
> Yeah, we have tons of cases like that. But I have no idea how to 
> generalize them.

They could still remain to be driver specific then, right?

> 
>>
>>>
>>> As you wrote in the commit message it's highly driver specific what 
>>> to map and where to map it.
>>
>> In the end the common case should be that in a VA space at least every 
>> mapping being backed by a BO is represented by a struct drm_gpuva.
> 
> Oh, no! We also have mappings not backed by a BO at all! For example for 
> partial resident textures or data routing to internal hw etc...
> 
> You can't be sure that a mapping is backed by a BO at all.

I fully agree, that's why I wrote "the common case should be that in a 
VA space at least every mapping *being backed by a BO* is represented by 
a struct drm_gpuva".

Mappings not being backed by an actual BO would not be linked to a GEM 
of course.

> 
>>
>>>
>>> Instead I suggest to have a separate structure for mappings in a VA 
>>> space which driver can then add to their GEM objects or whatever they 
>>> want to map into their VMs.
>>
>> Which kind of separate structure for mappings? Another one analogous 
>> to struct drm_gpuva?
> 
> Well similar to what amdgpu uses BO -> one structure for each 
> combination of BO and VM -> mappings inside that VM

As explained above, I think that's exactly what the GPUVA manager does, 
just in another order:

BO has list of mappings, mappings have pointer to VM, VM has list (or 
actually a maple tree) of mappings.

You see any advantages or disadvantages of either order of 
relationships? For me it looks like it doesn't really matter which one 
to pick.

- Danilo

> 
> Regards,
> Christian.
> 
>>
>> - Danilo
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>
>>
> 

