Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C2838CCEE
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 20:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F7A6E5D1;
	Fri, 21 May 2021 18:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D096E50E;
 Fri, 21 May 2021 18:08:08 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id u21so31694016ejo.13;
 Fri, 21 May 2021 11:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=c4sxkXq0hSnbuKanuNWzIU4L193Mti8XvH1mHdvMK7Q=;
 b=bCyVjPryc5TmKTitR0jVcY39JoRb7sP0qgPfRWLRBDXxsvtu/Fa2YPzkzHaOfMj/kf
 j/uUJiOxAIz7qT5HZWZyB3mELi1k6/RP8BOtuCpLW2xenAIZdd4SbMgH1cSmS6HY6mQe
 oX+K6QyJQZhKf0il0fPIRI5pIRicOzvX7X4jmWa31ZDADYKBaqdTySfFGNhtD4w9copm
 qgypnqaCpTN6vVPjyZS8V7ep7Lxb2sKORVFH5PvGy7BBFxgy9VWklDqQr2dPFR9e0iZh
 c243oHRrdDZiHEPOxBn1W23N5Qk1SAUsW7YqdBpUCpmS74CPn52GULRkfZbHdvYgMPVq
 sCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=c4sxkXq0hSnbuKanuNWzIU4L193Mti8XvH1mHdvMK7Q=;
 b=NCDxokreU061xBXyQTVoi26AIk8vJHJ31j0nEvs6a+yyrdm09N9rEVH9G8mHtAco/X
 g+gifq5MHqIEpFwvgN3uHEg2JhM8Mrt+c0IwIRiyXy/DpvLqAKC+eA4czOP1lrbHaO7N
 rYtoO9lWbfyvWkvrxijMHw/hBA5iUF3E2ed/LAm1w+CNdP0Ou7/qmvy78oDyZOwGhNEZ
 DBznatNiOzMetyPm6FPpnkmLkjrZIPF89OUc2Afv1YZgmvUIJ2r3E/cFkDyEuoQtooTS
 6+HsKPkRIg1H4fdAL/QPs4JTPx5WGN+B3lY3D4fSVC0zek3QFNJJu7IJk2FuXvSo5SC2
 rWWw==
X-Gm-Message-State: AOAM530q+fEzdazvWJqy/hzqomq80kx/pmgB1nEsfs+3LbJuRj/rCIk0
 Z+kWfJ+XJa1M2Ui34R3s8VE=
X-Google-Smtp-Source: ABdhPJw0mnGs+FTRgEO15fPaN8uOT9yRBc2vOL7A3CMc3y5I9FJODYjlDunANc/h9IkPveTUZs7b8g==
X-Received: by 2002:a17:906:11d3:: with SMTP id
 o19mr11511488eja.387.1621620487273; 
 Fri, 21 May 2021 11:08:07 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8496:ee5:88c2:a2c4?
 ([2a02:908:1252:fb60:8496:ee5:88c2:a2c4])
 by smtp.gmail.com with ESMTPSA id n8sm3922455ejl.0.2021.05.21.11.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 11:08:06 -0700 (PDT)
Subject: Re: [Mesa-dev] [PATCH 01/11] drm/amdgpu: Comply with implicit fencing
 rules
To: Daniel Vetter <daniel@ffwll.ch>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <CAP+8YyEhRwgz2hCri3K7Kv1OusVa_LGEuKZqQEx5jv+NiDKZrA@mail.gmail.com>
 <YKfFqrlLrikGMn4K@phenom.ffwll.local>
 <CAP+8YyG0o58dQt_tvnJ2ESbeqo02xxvFdifpMwnhz2VYNk8HUw@mail.gmail.com>
 <YKfOymXrB7O4cYVb@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <31467363-e936-879b-8b0d-5a2a92644221@gmail.com>
Date: Fri, 21 May 2021 20:08:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKfOymXrB7O4cYVb@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, mesa-dev <mesa-dev@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.05.21 um 17:16 schrieb Daniel Vetter:
> On Fri, May 21, 2021 at 05:00:46PM +0200, Bas Nieuwenhuizen wrote:
>> On Fri, May 21, 2021 at 4:37 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>>> On Fri, May 21, 2021 at 11:46:23AM +0200, Bas Nieuwenhuizen wrote:
>>>> On Fri, May 21, 2021 at 11:10 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 4 ++--
>>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>> index 88a24a0b5691..cc8426e1e8a8 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>> @@ -617,8 +617,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>>>>          amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>>>>>                  struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
>>>>>
>>>>> -               /* Make sure we use the exclusive slot for shared BOs */
>>>>> -               if (bo->prime_shared_count)
>>>>> +               /* Make sure we use the exclusive slot for all potentially shared BOs */
>>>>> +               if (!(bo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID))
>>>>>                          e->tv.num_shared = 0;
>>>> I think it also makes sense to skip this with
>>>> AMDGPU_GEM_CREATE_EXPLICIT_SYNC? It can be shared but I don't think
>>>> anyone expects implicit sync to happen with those.
>>> Ah yes, I missed this entirely. So the "no implicit flag" is already
>>> there, and the _only_ thing that's missing really is a way to fish out the
>>> implicit fences, and set them.
>>>
>>> https://lore.kernel.org/dri-devel/20210520190007.534046-1-jason@jlekstrand.net/
>>>
>>> So I think all that's really needed in radv is not setting
>>> RADEON_FLAG_IMPLICIT_SYNC for winsys buffers when Jason's dma-buf ioctl
>>> are present (means you need to do some import/export and keep the fd
>>> around for winsys buffers, but shouldn't be too bad), and then control the
>>> implicit fences entirely explicitly like vk expects.
>> That is the part I'm less sure about. This is a BO wide flag so we are
>> also disabling implicit sync in the compositor. If the compositor does
>> only do read stuff that is ok, as the inserted exclusive fence will
>> work for that. But as I learned recently the app provided buffer may
>> end up being written to by the X server which open a whole can of
>> potential problems if implicit sync gets disabled between Xserver
>> operations on the app provided buffer. Hence setting that on the WSI
>> buffer is a whole new can of potential problems and hence I've said a
>> submission based flag would be preferred.
>>
>> I can certainly try it out though.
> Hm yeah that's the wrong flag. We need a flag on the drm_file which the
> explicit userspace sets. And which is valid only for itself.
>
> There's a nice flags field when creating a ctx, but it's not validated and
> there's already a comment that we have to filter out garbage priority, so
> that's not use. I'll whip up something entirely untested just as a draft.

We could provide an IOCTL for the BO to change the flag.

But could we first figure out the semantics we want to use here?

Cause I'm pretty sure we don't actually need those changes at all and as 
said before I'm certainly NAKing things which break existing use cases.

Regards,
Christian.

> -Daniel
>
>
>
>>> Are you bored enough to type this up for radv? I'll give Jason's kernel
>>> stuff another review meanwhile.
>>> -Daniel
>>>
>>>>>                  e->bo_va = amdgpu_vm_bo_find(vm, bo);
>>>>>          }
>>>>> --
>>>>> 2.31.0
>>>>>
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> http://blog.ffwll.ch

