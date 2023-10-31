Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B0A7DD582
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 18:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD5310E593;
	Tue, 31 Oct 2023 17:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F9510E593
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 17:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698774773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MM0l2/ZF5doyc+5WQup6Ywo/07BlpO+C3i/f3pi7EBM=;
 b=LbFe3+E2NGZTMLxmGeJcC+Tu5zbjPpTd3/dGYyLl9hnYOKM8KzMgYNX7CkqpYRvCqm61KU
 y07gi2mIdul8UQM+T0vuU9DGOPXgh7wM1NtjD0QcKBHaBJ6GqpJ17ftGmjY1mfbJaaXm0j
 L3Kl+RAD5R98rMFPmi1Qegp4dCaOEE4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-ztt7NYcyPEi2L1v7RY3BHA-1; Tue, 31 Oct 2023 13:52:52 -0400
X-MC-Unique: ztt7NYcyPEi2L1v7RY3BHA-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5218b9647a8so4358216a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 10:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698774771; x=1699379571;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MM0l2/ZF5doyc+5WQup6Ywo/07BlpO+C3i/f3pi7EBM=;
 b=frdKz/3MIzsbNWgaaJFfs7N992Vep6HsKhVNZA6zOpaSIq/V85PzlI9dzuZs/JH+Vc
 +C86DRE0uUKxCPSu+SaSLZMHFxLmWABbcBUJ4l03iXd3CqGzBNW8fok3+G7OwKXgXJgg
 /TYYit6vAzvsFT8GO4gsiBsQZv6O3y7AxkWZwxd6tNEc6RJsTKaBIZ+SniAYJi5qur7b
 1G66pwuyIm6xBt64NypYrbw5JxdJPMNr07diPuJ0NNoVsa62QXyuY1qa48lS7mtSJC+c
 u0cERbJnWEFnuMq2NdPH2gtUY6gKoGe9vS+7RgYZA5p98USudkdNGXJ+anPW1M1VTgl8
 jCbw==
X-Gm-Message-State: AOJu0YwQFHd04l3S7/+Ix2jbby9wRBBHgEqZI265UJv/cEdfPxfT3Z3p
 gGEtYskBJN12P7ZSz6RrTgEGOwU/BqwACWzrdLVJW+jMtiIL7waS6M3zZiE9/w7i99w9FsnfM1g
 yZseCONw144E6xejkNHGXsgx7HSCH
X-Received: by 2002:a05:6402:5214:b0:540:caed:3619 with SMTP id
 s20-20020a056402521400b00540caed3619mr14093188edd.24.1698774769052; 
 Tue, 31 Oct 2023 10:52:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqrQl2BkPvKjejlZpdYejly+6BkpnQx23fRbw5JtUR23RuBxlpngOmivqZXHT036Dx+L2nJA==
X-Received: by 2002:a05:6402:5214:b0:540:caed:3619 with SMTP id
 s20-20020a056402521400b00540caed3619mr14093033edd.24.1698774767721; 
 Tue, 31 Oct 2023 10:52:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a50ccc8000000b0053e15aefb0fsm1512922edj.85.2023.10.31.10.52.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 10:52:47 -0700 (PDT)
Message-ID: <b09e37f3-33f6-4ea8-876b-f0bee9627ced@redhat.com>
Date: Tue, 31 Oct 2023 18:52:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v7 4/7] drm/gpuvm: add an abstraction for a
 VM / BO combination
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, faith@gfxstrand.net
References: <20231023201659.25332-1-dakr@redhat.com>
 <20231023201659.25332-5-dakr@redhat.com>
 <4a51c1cd9e2435332e033f9426bac8fae1c21c60.camel@linux.intel.com>
 <980754a3-7f5a-465e-88a9-62a40c82cae8@redhat.com>
 <ab8f30452540171447118d64931e66da96b6e85e.camel@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <ab8f30452540171447118d64931e66da96b6e85e.camel@linux.intel.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/31/23 17:45, Thomas Hellström wrote:
> On Tue, 2023-10-31 at 17:39 +0100, Danilo Krummrich wrote:
>> On 10/31/23 12:25, Thomas Hellström wrote:
>>> On Mon, 2023-10-23 at 22:16 +0200, Danilo Krummrich wrote:
>>>> Add an abstraction layer between the drm_gpuva mappings of a
>>>> particular
>>>> drm_gem_object and this GEM object itself. The abstraction
>>>> represents
>>>> a
>>>> combination of a drm_gem_object and drm_gpuvm. The drm_gem_object
>>>> holds
>>>> a list of drm_gpuvm_bo structures (the structure representing
>>>> this
>>>> abstraction), while each drm_gpuvm_bo contains list of mappings
>>>> of
>>>> this
>>>> GEM object.
>>>>
>>>> This has multiple advantages:
>>>>
>>>> 1) We can use the drm_gpuvm_bo structure to attach it to various
>>>> lists
>>>>      of the drm_gpuvm. This is useful for tracking external and
>>>> evicted
>>>>      objects per VM, which is introduced in subsequent patches.
>>>>
>>>> 2) Finding mappings of a certain drm_gem_object mapped in a
>>>> certain
>>>>      drm_gpuvm becomes much cheaper.
>>>>
>>>> 3) Drivers can derive and extend the structure to easily
>>>> represent
>>>>      driver specific states of a BO for a certain GPUVM.
>>>>
>>>> The idea of this abstraction was taken from amdgpu, hence the
>>>> credit
>>>> for
>>>> this idea goes to the developers of amdgpu.
>>>>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_gpuvm.c            | 335
>>>> +++++++++++++++++++++--
>>>> --
>>>>    drivers/gpu/drm/nouveau/nouveau_uvmm.c |  64 +++--
>>>>    include/drm/drm_gem.h                  |  32 +--
>>>>    include/drm/drm_gpuvm.h                | 188 +++++++++++++-
>>>>    4 files changed, 533 insertions(+), 86 deletions(-)
>>>
>>> That checkpatch.pl error still remains as well.
>>
>> I guess you refer to:
>>
>> ERROR: do not use assignment in if condition
>> #633: FILE: drivers/gpu/drm/nouveau/nouveau_uvmm.c:1165:
>> +                       if (!(op->gem.obj = obj))
>>
>> This was an intentional decision, since in this specific case it
>> seems to
>> be more readable than the alternatives.
>>
>> However, if we consider this to be a hard rule, which we never ever
>> break,
>> I'm fine changing it too.
> 
> With the errors, sooner or later they are going to start generate
> patches to "fix" them. In this particular case also Xe CI is
> complaining and abort building when I submit the Xe adaptation, so it'd
> be good to be checkpatch.pl conformant IMHO.

Ok, I will change this one.

However, in general my opinion on coding style is that we should preserve us
the privilege to deviate from it when we agree it makes sense and improves
the code quality.

Having a CI forcing people to *blindly* follow certain rules and even abort
building isn't very beneficial in that respect.

Also, consider patches which partially change a line of code that already
contains a coding style "issue" - the CI would also block you on that one I
guess. Besides that it seems to block you on unrelated code, note that the
assignment in question is from Nouveau and not from GPUVM.

- Danilo

> 
> Thanks,
> Thomas
> 
> 
> 
> 
>>
>>>
>>> Thanks,
>>> Thomas
>>>
>>
> 

