Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB86433B34
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 17:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2D06EB74;
	Tue, 19 Oct 2021 15:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4B16EB62;
 Tue, 19 Oct 2021 15:51:41 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 s198-20020a1ca9cf000000b0030d6986ea9fso3751796wme.1; 
 Tue, 19 Oct 2021 08:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=6ZFaxOZuF+IhLUiqvXFEEaubfNfset/rnTpcy2dgnJg=;
 b=UKPHdrSwzYVYfSOaQNp28TlNw8ngnMfJFfd+bxj8K6Yk60xlDM3U3CMVv7havbe6d5
 mlhmi+ZablsSB8GX3O3JLakmBpT4p/UFv6EBMQiUNmbHp8w86++d1P1D9eE34J3Xn/UN
 QrvCaOe6Ebj8ZPQYzkFrNuKm3+BHxHE851Thul43ZfsCvMn6vJLjX/1jgzAIhCGEsN9e
 oA6TExBNqjmvTTgQ2W+mkivR9ovsuQ+VhByjzxqAuRfHXRfx5Ud+CtKkUj+9Ug0bjCHI
 VE4zU2MMS/hPW/IwgxZGY94R9f58Jq8wLe5F7m7aFOEQMkeVwKU2si3Tqe+jcKFK6Bdb
 WfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=6ZFaxOZuF+IhLUiqvXFEEaubfNfset/rnTpcy2dgnJg=;
 b=P22++yi2fml59XaaRJIaMFur0+2RePK1PBpNIRQ3BLbe0/Qaborx/DRENrH8KNchxO
 q13CRxoXQmPXYksyjHiHCoG+CJY+YZThKeMJ+ImgEQoZoeDCZaAXgPyZ5lUKCCZXwVu4
 Va+ozL/5bPACWd5wEBU6ODEJBMBYAQiRsaIfj2TFzujrWH07QXFpWqaVb2Af010FTg8N
 MrbNt4jl++EhD5qt751KQsboyw0eAvlK4e1aIgbgImqGjm7vu1LIxfv3ThLFtGmsbNeF
 UXy76+ncqhxt38bzf+TpOfR4PIC09m8xsK8olT8A7iHm2ZhPXnwc83wdJKaLqafTv3ya
 hqrw==
X-Gm-Message-State: AOAM530NX4+Hug65wazvFk3UKWfIxQV4hq/xQ5wQsDa07nMnvRx1DqFn
 M+d6/GdNUrMgU68YbJ4sERm5XzZpxbA=
X-Google-Smtp-Source: ABdhPJz4XNeACAlrFxmsoMuUEFHsdoY3ZgMk/DqPLSEBGgjXzSylOvjXgNMCJTEtcGYcpIsBs1s+Tw==
X-Received: by 2002:a7b:c114:: with SMTP id w20mr6922264wmi.143.1634658700577; 
 Tue, 19 Oct 2021 08:51:40 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:4fc4:fae2:bc41:a808?
 ([2a02:908:1252:fb60:4fc4:fae2:bc41:a808])
 by smtp.gmail.com with ESMTPSA id 133sm2560203wmb.24.2021.10.19.08.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 08:51:40 -0700 (PDT)
Subject: Re: [PATCH 24/28] drm: use new iterator in
 drm_gem_plane_helper_prepare_fb v2
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 tvrtko.ursulin@linux.intel.com
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-25-christian.koenig@amd.com>
 <YWbr0/ey1rCbb0Yi@phenom.ffwll.local>
 <405b9df8-58fd-b8f2-cec2-acde69aa5633@gmail.com>
 <YW7WmU/GLzgJbDQc@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <35416546-b60b-d5cf-7fe9-abaa0dde63e2@gmail.com>
Date: Tue, 19 Oct 2021 17:51:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YW7WmU/GLzgJbDQc@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.10.21 um 16:30 schrieb Daniel Vetter:
> On Tue, Oct 19, 2021 at 03:02:26PM +0200, Christian König wrote:
>> Am 13.10.21 um 16:23 schrieb Daniel Vetter:
>>> On Tue, Oct 05, 2021 at 01:37:38PM +0200, Christian König wrote:
>>>> Makes the handling a bit more complex, but avoids the use of
>>>> dma_resv_get_excl_unlocked().
>>>>
>>>> v2: improve coding and documentation
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_gem_atomic_helper.c | 13 +++++++++++--
>>>>    1 file changed, 11 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
>>>> index e570398abd78..8534f78d4d6d 100644
>>>> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
>>>> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
>>>> @@ -143,6 +143,7 @@
>>>>     */
>>>>    int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>>>>    {
>>>> +	struct dma_resv_iter cursor;
>>>>    	struct drm_gem_object *obj;
>>>>    	struct dma_fence *fence;
>>>> @@ -150,9 +151,17 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
>>>>    		return 0;
>>>>    	obj = drm_gem_fb_get_obj(state->fb, 0);
>>>> -	fence = dma_resv_get_excl_unlocked(obj->resv);
>>>> -	drm_atomic_set_fence_for_plane(state, fence);
>>>> +	dma_resv_iter_begin(&cursor, obj->resv, false);
>>>> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>>> +		/* TODO: We only use the first write fence here and need to fix
>>>> +		 * the drm_atomic_set_fence_for_plane() API to accept more than
>>>> +		 * one. */
>>> I'm confused, right now there is only one write fence. So no need to
>>> iterate, and also no need to add a TODO. If/when we add more write fences
>>> then I think this needs to be revisited, and ofc then we do need to update
>>> the set_fence helpers to carry an entire array of fences.
>> Well could be that I misunderstood you, but in your last explanation it
>> sounded like the drm_atomic_set_fence_for_plane() function needs fixing
>> anyway because a plane could have multiple BOs.
>>
>> So in my understanding what we need is a
>> drm_atomic_add_dependency_for_plane() function which records that a certain
>> fence needs to be signaled before a flip.
> Yeah that's another issue, but in practice there's no libva which decodes
> into planar yuv with different fences between the planes. So not a bug in
> practice.
>
> But this is entirely orthogonal to you picking up the wrong fence here if
> there's not exclusive fence set:
>
> - old code: Either pick the exclusive fence, or not fence if the exclusive
>    one is not set.
>
> - new code: Pick the exclusive fence or the first shared fence

Hui what?

We use "dma_resv_iter_begin(&cursor, obj->resv, *false*);" here which 
means that only the exclusive fence is returned and no shared fences 
whatsoever.

My next step is to replace the boolean with a bunch of use case 
describing enums. I hope that will make it much clearer what's going on 
here.

Christian.

> New behaviour is busted, because scanning out and reading from a buffer at
> the same time (for the next frame, e.g. to copy over damaged areas or some
> other tricks) is very much a supported thing. Atomic _only_ wants to look
> at the exclusive fence slot, which mean "there is an implicitly synced
> write to this buffers". Implicitly synced reads _must_ be ignored.


>
> Now amdgpu doesn't have this distinction in its uapi, but many drivers do.
> -Daniel
>
>> Support for more than one write fence then comes totally naturally.
>>
>> Christian.
>>
>>> -Daniel
>>>
>>>> +		dma_fence_get(fence);
>>>> +		break;
>>>> +	}
>>>> +	dma_resv_iter_end(&cursor);
>>>> +	drm_atomic_set_fence_for_plane(state, fence);
>>>>    	return 0;
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
>>>> -- 
>>>> 2.25.1
>>>>

