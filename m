Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3388C2111
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 11:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A007110E79A;
	Fri, 10 May 2024 09:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id F1B1910E79A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 09:36:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49ED3106F;
 Fri, 10 May 2024 02:36:56 -0700 (PDT)
Received: from [10.1.33.24] (e122027.cambridge.arm.com [10.1.33.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F0ED3F762;
 Fri, 10 May 2024 02:36:30 -0700 (PDT)
Message-ID: <821f8348-a3ea-42b5-b990-6d1520d70d89@arm.com>
Date: Fri, 10 May 2024 10:36:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: deprecate driver date
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Simon Ser <contact@emersion.fr>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20240429164336.1406480-1-jani.nikula@intel.com>
 <9d0cff47-308e-4b11-a9f3-4157dc26b6fa@arm.com> <8734qqjahi.fsf@intel.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <8734qqjahi.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/05/2024 10:13, Jani Nikula wrote:
> On Thu, 09 May 2024, Steven Price <steven.price@arm.com> wrote:
>> On 29/04/2024 17:43, Jani Nikula wrote:
>>> The driver date serves no useful purpose, because it's hardly ever
>>> updated. The information is misleading at best.
>>>
>>> As described in Documentation/gpu/drm-internals.rst:
>>>
>>>   The driver date, formatted as YYYYMMDD, is meant to identify the date
>>>   of the latest modification to the driver. However, as most drivers
>>>   fail to update it, its value is mostly useless. The DRM core prints it
>>>   to the kernel log at initialization time and passes it to userspace
>>>   through the DRM_IOCTL_VERSION ioctl.
>>>
>>> Stop printing the driver date at init, and start returning the empty
>>> string "" as driver date through the DRM_IOCTL_VERSION ioctl.
>>
>> I agree with the idea of this, unfortuantly it breaks user space :(
>>
>> It's a bug in libdrm, but given this breaks existing user space I think
>> we'll need to revert/reconsider.
>>
>> The issue is in drmGetVersion() [1]:
>>
>>>     if (version->date_len)                                                       
>>>         version->date    = drmMalloc(version->date_len + 1);                     
>>
>> So if date_len == 0, then version->date isn't populated (and isn't
>> initialized at all). But then later on in drmCopyVersion() [2] the
>> (unset) version->date is passed to strdup():
>>
>>> static void drmCopyVersion(drmVersionPtr d, const drm_version_t *s)              
>>> {                                                                                
>>>     d->version_major      = s->version_major;                                    
>>>     d->version_minor      = s->version_minor;                                    
>>>     d->version_patchlevel = s->version_patchlevel;                               
>>>     d->name_len           = s->name_len;                                         
>>>     d->name               = strdup(s->name);                                     
>>>     d->date_len           = s->date_len;                                         
>>>     d->date               = strdup(s->date);                                     
>>>     d->desc_len           = s->desc_len;                                         
>>>     d->desc               = strdup(s->desc);                                     
>>> }                                                                                
>>
>> Which then segfaults if the uninitialized value points off somewhere
>> bad. And this does happen (my test setup reproduced this).
> 
> Thanks for the report!
> 
>> A simple fix is to make sure the string isn't empty - so return
>> "unknown" or just a space, or even "\0".
> 
> I don't think "\0" works, because strlen() will still return 0 for it.

Ah, true - you'd have to hack up drm_copy_field() to someone return a
length of 1 in this case. And I'd be a little worried that it would
break something else...

> I went ahead with "0", because that's already been used by virtio until
> now. Fix at [1].

Yep, that seems like the best solution.

Thanks,

Steve

> BR,
> Jani.
> 
> 
> [1] https://lore.kernel.org/r/20240510090951.3398882-1-jani.nikula@intel.com
> 
> 
