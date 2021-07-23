Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 575A33D37CF
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 11:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEC26E896;
	Fri, 23 Jul 2021 09:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FCB6E896
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 09:40:23 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id z8so1644501wru.7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 02:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ReRpvNkrpr1BuaHO5GOqJ4cFBZpQicPOLNn+wCL8Bsk=;
 b=II/on/AxxsJb9xykruRjqTkGPxhVpMcU9JGT3kG5VuFLNhtrqGZLNO/tc2vFESQwaf
 5Y69PRk38ikI0Tj9+NhJsvMxIC6WZqYJ7bOOb4lRrhZ1ZW+X7T4ICN3v5NprFz8L1msp
 YK3Dpoy5eZYuTMEYqhVlNdJxrXMDhLDbnheVb6sR4bk5TbLYGiph2qcBsEgnHsp52k6p
 ICajVwWyobFiK79lkcIU01kyFUnqV4jjTbmv2hqcRF+Bpr44F29brV3If70O62dAUT8X
 ZC8PqgrhUzXljLJWzls562KozLG8LGSt8+bps429WOsnoT2Y56zW7uo1b2poCMRa3B2C
 JcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ReRpvNkrpr1BuaHO5GOqJ4cFBZpQicPOLNn+wCL8Bsk=;
 b=NZPHcKhuGFdypnSnc9iI85DbsPvISGLwx6V4DeMP05PrX+lJ5VEv9IsMpQf95l0PxK
 SqkR35PHixzB6I5jAG3NUGbtYIkVVQCav8bjdAtqjLYP71Mvj3l+rF0Y/peW9XORKV7H
 UL+W3MWpXP2r3E+FlVEyLReBDscZdpHwhgaq7SG3uggqbfZ00MC1wFAQo9XND/+02yid
 ANbaq9GEhoFIywbd61pw9m/vfW6/OypTFfRO3FguL0/8LQBc50i0SWLRQk7ARkp4hHJw
 fLkemAMw40ZDL2+t/GW7GPqWM8nRP4DyAZ5nzGcoWBf4FX1/NEZKnd0Anm+IUkpfW2YK
 ujaA==
X-Gm-Message-State: AOAM532TdNM5mE2l05KdOudpZN2s5tdM6C4IRYaYyjioMCYMypiMFio5
 J01BvwFTXwSr4kS/0NLYC6/2k9XmqC0=
X-Google-Smtp-Source: ABdhPJzSlBmn8j9zSQ4S06OzS0vUzGwSk6vORkor2skyVKUBZU00JVUXWyeVkJpxwxilFWxmQW3giQ==
X-Received: by 2002:a5d:464b:: with SMTP id j11mr4368080wrs.356.1627033222230; 
 Fri, 23 Jul 2021 02:40:22 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:a0d7:cc1c:9090:5782?
 ([2a02:908:1252:fb60:a0d7:cc1c:9090:5782])
 by smtp.gmail.com with ESMTPSA id q7sm27209678wmq.33.2021.07.23.02.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 02:40:21 -0700 (PDT)
Subject: Re: [PATCH 1/5] drm/vmwgfx: unbind in vmw_ttm_unpopulate
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210722124127.17901-1-christian.koenig@amd.com>
 <YPqCBUDiibBWUs2/@phenom.ffwll.local>
 <c83ebc42-567c-4f4c-d6da-53ff21739222@gmail.com>
 <CAKMK7uGVPnsw2o=9E295CobiY_qYdCg5fZQN4Q8Bu22r9E3WUw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4c30a961-0a73-3f69-7733-2491549a8743@gmail.com>
Date: Fri, 23 Jul 2021 11:40:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGVPnsw2o=9E295CobiY_qYdCg5fZQN4Q8Bu22r9E3WUw@mail.gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.07.21 um 11:21 schrieb Daniel Vetter:
> On Fri, Jul 23, 2021 at 11:13 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 23.07.21 um 10:47 schrieb Daniel Vetter:
>>> On Thu, Jul 22, 2021 at 02:41:23PM +0200, Christian König wrote:
>>>> Doing this in vmw_ttm_destroy() is to late.
>>>>
>>>> It turned out that this is not a good idea at all because it leaves pointers
>>>> to freed up system memory pages in the GART tables of the drivers.
>>> So I wanted to review this series, and I can't reconcile your claim here
>>> with the demidlayering Dave has done. The driver patches here don't
>>> ouright undo what Dave has done, but that means the bug has been
>>> preexisting since forever (or is due to some other change?), and your
>>> commit message is a bit confusing here.
>>>
>>> The final patch just undoes the demidlayering from Dave, and I really
>>> don't see where there's even a functional change there.
>>>
>>> And even these patches here don't really change a hole lot with the
>>> calling sequence for at least final teardown: ttm_tt_destroy_common calls
>>> ttm_tt_unpopulate as the first thing, so at least there there's no change.
>>>
>>> Can you pls elaborate more clearly what exactly you're fixing and what
>>> exactly needs to be reordered and where this bug is from (commit sha1)? As
>>> is I'm playing detective and the evidence presented is extremely since and
>>> I can't reconcile it at all.
>>>
>>> I mean I know you don't like typing commit message and documentation, but
>>> it does get occasionally rather frustrating on the reviewer side if I have
>>> to interpolate between some very sparse hints for this stuff :-/
>> Yeah, when have seen the history it's rather obvious what's wrong here
>> and I expected Dave to review it himself.
>>
>> Previously we had three states in TTM for a tt object: Allocated ->
>> Populated -> Bound which on destruction where done in the order unbind
>> -> unpopulate -> free.
>>
>> Dave moved handling of the bound state into the drivers since it is
>> basically a driver decision and not a TTM decision what should be bound
>> and what not (that part perfectly makes sense).
> I haven't reviewed all the patches from Dave, only the one you pointed
> at (in the last patch). And that one I still can't match up with your
> description. If there's other commits relevant, can you pls dig them
> out?
>
> Like it all makes sense what you're saying and matches the code, I
> just can't match it up with the commit you're referencing.

That is the patch directly following the one I've mentioned:

commit 37bff6542c4e140a11657406c1bab50a40329cc1
Author: Dave Airlie <airlied@redhat.com>
Date:   Thu Sep 17 13:24:50 2020 +1000

     drm/ttm: move unbind into the tt destroy.

     This moves unbind into the driver side on destroy paths.

I will add a Fixes tag to make that clear.

But this patch also just moves the undbind from the TTM destroy path to 
the driver destroy path.

To be honest I'm not 100% sure either when the when the unbind moved 
from the unpopulate path into the destroy path, but I think that this 
wasn't always the case. Let me try to dig that up.

>> The problem is that he also moved doing the unbind into the free
>> callback instead of the unpopulate callback. This result in stale page
>> pointers in the GART if that unpopulate operation isn't immediately
>> followed by a free.
>>
>> Thinking more about it if we do populated->unpopulated->populated then
>> we would also have stale pointers to the old pages which is even worse.
>>
>> This is also not de-midlayering since we already have a proper
>> ttm_tt_init()/ttm_tt_fini() functions which should work nicely for the
>> tt object.
> Well you're last patch moves the ttm_tt_destroy_common stuff back into
> ttm, which kinda is de-demidlayering. So I'm confused.

Ah, yes that is correct. I've also considered to move this in 
ttm_tt_fini instead of there.

But that would be a larger change and I wanted to fix the problem at 
hand first, potentially even adding a CC stable tag.

> Other bit: I think it'd be good to document this properly in the
> callbacks, and maybe ideally go about and kerneldoc-ify the entire
> ttm_tt.h header. Otherwise when we eventually (never?) get around to
> that, everyone has forgotten these semantic details and issues again.

Already working towards including more of the TTM headers and code files 
in kerneldoc. But not quite there yet.

But you know, normal human: Only equipped with one head and two hands 
and not cloneable.

Cheers,
Christian.

> -Daniel
>
>> Christian.
>>
>>> -Daniel
>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 9 +++------
>>>>    1 file changed, 3 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>>>> index b0973c27e774..904031d03dbe 100644
>>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>>>> @@ -526,14 +526,9 @@ static void vmw_ttm_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>>>>       struct vmw_ttm_tt *vmw_be =
>>>>               container_of(ttm, struct vmw_ttm_tt, dma_ttm);
>>>>
>>>> -    vmw_ttm_unbind(bdev, ttm);
>>>>       ttm_tt_destroy_common(bdev, ttm);
>>>>       vmw_ttm_unmap_dma(vmw_be);
>>>> -    if (vmw_be->dev_priv->map_mode == vmw_dma_alloc_coherent)
>>>> -            ttm_tt_fini(&vmw_be->dma_ttm);
>>>> -    else
>>>> -            ttm_tt_fini(ttm);
>>>> -
>>>> +    ttm_tt_fini(ttm);
>>>>       if (vmw_be->mob)
>>>>               vmw_mob_destroy(vmw_be->mob);
>>>>
>>>> @@ -578,6 +573,8 @@ static void vmw_ttm_unpopulate(struct ttm_device *bdev,
>>>>                                                dma_ttm);
>>>>       unsigned int i;
>>>>
>>>> +    vmw_ttm_unbind(bdev, ttm);
>>>> +
>>>>       if (vmw_tt->mob) {
>>>>               vmw_mob_destroy(vmw_tt->mob);
>>>>               vmw_tt->mob = NULL;
>>>> --
>>>> 2.25.1
>>>>
>

