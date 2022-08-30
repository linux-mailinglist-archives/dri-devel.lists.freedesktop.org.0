Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C96505A6BC2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 20:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE1910E02F;
	Tue, 30 Aug 2022 18:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879E810E02F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 18:08:27 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id p16so20686427ejb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 11:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
 :subject:date; bh=jXXGaSH+LzmXXbPUT3jEtW2Nm9tCbJ23kAhFelj4/UI=;
 b=GqOSBwv1YK+A7Mb1equalINdHRuqpp1aEf1gzJELuYodsQqDNneY8QgUm1sJP9C7n2
 YlGH8Df1ahxfyFPgCZ91EvBYexqftfL/C3povlv0krCSMFm/8uQglkIfoOyALbpV04yc
 mZumiKZ7JX8QrH8wytf7OXgCZS/+C7MUyt00I2f0Z0Svilf6miRhWZmpEF8ibKgnHu/t
 JJxIJg/X4Rg71fokNziRvRAQFUnB8ODT5ShNBMOlH1dySVV7gLVQgcv5wqBr4KbZ5tH1
 uTuO4FigNxRTSvGmA2M10VsxLEhu6q0zG6rbDcr3ME6endO37eyHwnuzj7AyqFoj+cK7
 aENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject
 :x-gm-message-state:from:to:cc:subject:date;
 bh=jXXGaSH+LzmXXbPUT3jEtW2Nm9tCbJ23kAhFelj4/UI=;
 b=A1q9RZBcOb+gxJgC88lFFc7+TuSxosJb9yauii9Pu81t+OAyQC539rXHTC5w1I45lO
 0JcDR5adAGnQMCdcbjuCaf1C4s0yUVgU3I9ILInfJGlOgAp/P1BlFRaJ/TgQhjporwzR
 eq6rSm/Hx8lA6KjQg95Wa0LtsdPjwWqxjKmuKlFCpzs58E7kroPcp8SNewyPpCV1+clg
 Tw6P3k4Q2sDvsNxRKH4cddo8kXyP372kxbHpiGOLIY+ylDQgZM2XgWmoFlzq4QaL8v+e
 rIUAb4vhx61CbiY6sxKdOltD+8sC7pYIir6Khc01fCNpTBMWZa4+Z19nk/EyRIb3bpid
 XE4g==
X-Gm-Message-State: ACgBeo0D4HGBrAGQwglxCGpO2M6gFUAKujy16d7djdXlGZbaosZyWN7J
 DAcoUS3E71kSmHF92QzoMII=
X-Google-Smtp-Source: AA6agR7I6Kro0gm3iRAIJRdyaM5Z01ZJudCHbpC4biu2BNn3iA6Jo4paJUuMaRGwAvHnxZjKKlUs/Q==
X-Received: by 2002:a17:906:4fd0:b0:73d:be5b:291d with SMTP id
 i16-20020a1709064fd000b0073dbe5b291dmr17745504ejw.506.1661882905888; 
 Tue, 30 Aug 2022 11:08:25 -0700 (PDT)
Received: from [192.168.1.10] ([46.249.74.23])
 by smtp.googlemail.com with ESMTPSA id
 h8-20020a50ed88000000b004463b99bc09sm7725272edr.88.2022.08.30.11.08.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Aug 2022 11:08:25 -0700 (PDT)
Subject: Re: [PATCH 3/3] drm: omapdrm: Do no allocate non-scanout GEMs through
 DMM/TILER
To: Yongqin Liu <yongqin.liu@linaro.org>, Andrew Davis <afd@ti.com>
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1642587791-13222-4-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <5b6d3e7f-c638-fdc7-5080-44d34abed610@ideasonboard.com>
 <a3ed3a2c-86ce-1c85-e8aa-c08b54ad1a43@gmail.com>
 <CAMSo37XdZSZUHLWJj373DdtOBA9=uD8SJ7ywWCYF2pU1i4cB_g@mail.gmail.com>
 <ed4fe238-4fcd-1253-658f-18fe1e1f13b0@gmail.com>
 <CAMSo37V3U5nYng77jzSnKH73CTLhGYQJu11Q5wRt289se5nFJw@mail.gmail.com>
 <4128aed0-211a-d12a-6a86-deb4457d39f7@gmail.com>
 <CAMSo37W-DePLDP=zk-nY6FGcZuk0QzHj4=usrieyV0TNcNfbXw@mail.gmail.com>
 <da2a661e-9da0-850c-3067-8c1e8d5531bc@gmail.com>
 <CAMSo37VXNQeR0qZgzZONBwp_4z9CuUSJJJzhM7k+K39BcwvW6A@mail.gmail.com>
 <235621d0-2141-5ef9-bcd4-5c48b985b3a0@gmail.com>
 <5dc2c212-4967-ab2d-c016-f3b3a854fe32@ti.com>
 <CAMSo37W+Z2hn_wJ9At1nyJX6XnpZx9JLXJv9g6DoqoaqqjUATw@mail.gmail.com>
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <0eb026d9-faaa-68cb-cdcd-7d031acfbb03@gmail.com>
Date: Tue, 30 Aug 2022 21:08:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMSo37W+Z2hn_wJ9At1nyJX6XnpZx9JLXJv9g6DoqoaqqjUATw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: tomba@kernel.org, "Bajjuri, Praneeth" <praneeth@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, merlijn@wizzup.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, tony@atomide.com, linux-omap@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 30.08.22 г. 18:08 ч., Yongqin Liu wrote:
> HI, Andrew
> 
> Thanks a lot for the information! And great to have you here!
> 
> Hi, Ivaylo
> 
> With the code provided by Andrew, could you please help give suggestions
> on how to modify it in the gralloc lib side?
> 
> to add the OMAP_BO_SCANOUT flag unconditionally as OMAP_BO_MEM_CONTIG?
> 

I don't think adding OMAP_BO_SCANOUT unconditionally is a good idea - we 
already agreed on why. Without having access to the whole source code, I 
would not make blind suggestions and would leave between you (as user) 
and Andrew (as a provider) to agree on what is the best way to fix the 
issue. Still, see the comments bellow.

> Thanks,
> Yongqin Liu
> 
> On Mon, 29 Aug 2022 at 22:36, Andrew Davis <afd@ti.com> wrote:
>>
>> On 8/29/22 8:24 AM, Ivaylo Dimitrov wrote:
>>> Hi,
>>>
>>>
>>> On 29.08.22 г. 5:51 ч., Yongqin Liu wrote:
>>>> Hi, Ivaylo
>>>>
>>>> Sorry for the late response, and Thanks very much for the detailed explanations!
>>>>
>>>> On Thu, 18 Aug 2022 at 18:23, Ivaylo Dimitrov
>>>> <ivo.g.dimitrov.75@gmail.com> wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> On 17.08.22 г. 7:52 ч., Yongqin Liu wrote:
>>>>>> Hi, Ivaylo
>>>>>>
>>>>>> On Mon, 15 Aug 2022 at 14:23, Ivaylo Dimitrov
>>>>>> <ivo.g.dimitrov.75@gmail.com> wrote:
>>>>>>>
>>>>>>> Hi Liu,
>>>>>>>
>>>>>>> On 14.08.22 г. 17:27 ч., Yongqin Liu wrote:
>>>>>>>> Hi, IvayIo
>>>>>>>>
>>>>>>>> Thanks very much for the reply!
>>>>>>>>
>>>>>>>> On Sat, 13 Aug 2022 at 14:58, Ivaylo Dimitrov
>>>>>>>> <ivo.g.dimitrov.75@gmail.com> wrote:
>>>>>>>>>
>>>>>>>>> Hi Liu,
>>>>>>>>>
>>>>>>>>> On 12.08.22 г. 7:35 ч., Yongqin Liu wrote:
>>>>>>>>>> Hi, Ivaylo, Tomi
>>>>>>>>>>
>>>>>>>>>> We have one X15 Android AOSP master build, it could not have the home
>>>>>>>>>> screen displayed
>>>>>>>>>> on the hdmi monitor connected with this change, with the following
>>>>>>>>>> message printed on the serial console
>>>>>>>>>>          [  607.404205] omapdrm omapdrm.0: Failed to setup plane plane-0
>>>>>>>>>>          [  607.410522] omapdrm omapdrm.0: Failed to setup plane plane-1
>>>>>>>>>>          [  607.416381] omapdrm omapdrm.0: Failed to setup plane plane-2
>>>>>>>>>>          [  607.422088] omapdrm omapdrm.0: Failed to setup plane plane-3
>>>>>>>>>>
>>>>>>>>>>         # for details, please check the link here: http://ix.io/47m1
>>>>>>>>>>
>>>>>>>>>> It will work with home screen displayed on the hdmi monitor if this
>>>>>>>>>> change is reverted.
>>>>>>>>>>
>>>>>>>>>> Is this the broken problem you talked about here?
>>>>>>>>>>
>>>>>>>>>> And could you please give some suggestions on how to have the x15
>>>>>>>>>> Android build work with this change?
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Make sure scanout (i.e. those to be displayed) buffers are actually
>>>>>>>>> allocated as such - OMAP_BO_SCANOUT flag must be set when calling
>>>>>>>>> omap_bo_new().
>>>>>>>>
>>>>>>>> I am not familiar with this area, I am sorry if I asked quite silly questions:(
>>>>>>>> I googled omap_bo_new, and found it's a function of libdrm here[1], is
>>>>>>>> it what you meant here?
>>>>>>>>
>>>>>>>
>>>>>>> Yes, calling this function from userspace ends in kernel code the
>>>>>>> $subject patch is part of.
>>>>>>>
>>>>>>>> If it's the omap_bo_new that we should pass OMAP_BO_SCANOUT when it is called,
>>>>>>>> then is it the correct way to update omap_bo_new to add the OMAP_BO_SCANOUT flag
>>>>>>>> before it calls omap_bo_new_impl?
>>>>>>>>
>>>>>>>
>>>>>>> omap_bo_new() is fine and does not need any updates/fixes, it is the
>>>>>>> code that uses it (whoever it is, I am not familiar with the userspace
>>>>>>> you are using) that shall pass correct flags (third parameter) when
>>>>>>> calling it.
>>>>>>
>>>>>> Sorry, I do not get the point here.
>>>>>> Like you said, the code that calls omap_bo_new needs to pass OMAP_BO_SCANOUT,
>>>>>> then IMO omap_bo_new should be the best place to add the OMAP_BO_SCANOUT flag,
>>>>>> (like via flags = flags | OMAP_BO_SCANOUT), that could help avoid
>>>>>> missing the flag by some code,
>>>>>> and also avoids hacks/changes on the possible blob binaries.
>>>>>>
>>>>>> Do I misunderstand somewhere?
>>>>>> Or is there some case that OMAP_BO_SCANOUT shouldn't be passed when
>>>>>> omap_bo_new is called?
>>>>>>
>>>>>
>>>>> Exactly. You need to pass OMAP_BO_SCANOUT only when you want your
>>>>> buffers to be 'scanout' buffers(i.e. buffers that can be displayed on
>>>>> screen), which is not always the case - there is no need offscreen
>>>>> buffers or pixmaps to be scanout capable, for example. There are more
>>>>> cases like that.
>>>>>
>>>>> The problem is that scanout buffer on OMAP4 allocate additional
>>>>> resources in DMM/TILER (a piece of hardware) and those resources are
>>>>> limited. Not only that, but DMM/TILER memory space eventually gets
>>>>> fragmented over time (if you have lots of allocataoins/deallocations)
>>>>> and you will start getting ENOMEM (or similar) errors.
>>>>>
>>>>> Ofc, in your particular use case you may never hit such issues.
>>>>
>>>> Thanks, I understand the cases now.
>>>>
>>>>
>>>>>>> BTW you shall really find who and how uses OMAP BO API, in theory it
>>>>>>> might use ioctls directly and not call omap_bo_xxx functions.
>>>>>>
>>>>>> Do you mean the DRM_OMAP_GEM_NEW ioctl api?
>>>>>> There is no place in the AOSP tree to call that except the
>>>>>> omap_bo_new_impl function,
>>>>>> which is called by the omap_bo_new and omap_bo_new_tiled functions.
>>>>>> The omap_bo_new should not be called with the OMAP_BO_TILED flag,
>>>>>> while the omap_bo_new_tiled should be called with the OMAP_BO_TILED flag
>>>>>>
>>>>>> Regarding to the omap_bo_new function, there are 2 places call it in
>>>>>> the AOSP tree:
>>>>>> #1 ./external/libkmsxx/kms++/src/omap/omapframebuffer.cpp
>>>>>> #2 ./device/ti/beagle_x15/gpu/gralloc.am57x.so
>>>>>>
>>>>>> #1 seems not used in AOSP yet, and #2 is one blob binary we do not
>>>>>> have the source for.
>>>>>>
>>>>>
>>>>> I would bet on gralloc.am57x.so.
>>>> yeah, that's my guess as well.
>>>>
>>>>>>> strace
>>>>>>> would be your friend there. or gdb, or whatever tools are used on
>>>>>>> android. Or put some printfs() in omap_bo_new() that output the PID of
>>>>>>> the calling process, etc.
>>>>>>
>>>>>> Thanks a lot for these great suggestions! Will use them when possible.
>>>>>>
>>>>>>>> And another question is that, since the userspace(libdrm) will be used
>>>>>>>> to work with different kernel versions,
>>>>>>>> like the old 4.14, 4.19, etc, do you think there will be problem to
>>>>>>>> pass  OMAP_BO_SCANOUT
>>>>>>>> from the userspace side with the old kernels(which does not have this change)?
>>>>>>>> does this change need to be backported to the old kernel versions?
>>>>>>>
>>>>>>> There should not be any issue. The changes could be backported if one
>>>>>>> hits the issues this $series is fixing, but there is no need.
>>>>>>
>>>>>> Thanks for the confirmation!
>>>>>> I just boot-tested with adding OMAP_BO_SCANOUT in the omap_bo_new function,
>>>>>> and it worked with the current 4.14, 4.19, and the mainline kernels.
>>>>>> # via adding line "flags = flags | OMAP_BO_SCANOUT" in the omap_bo_new function.
>>>>>>
>>>>>
>>>>> sure, the point is that with this change *every* BO will be allocated as
>>>>> scanout BO, potentially leading to the above explained issues.
>>>>
>>>> get it.
>>>>
>>>>>>>>
>>>>>>>> And the last question is that, omap_bo_new might be called by some
>>>>>>>> property binaries what not everyone
>>>>>>>> could get the source to update, for such case what's your suggestions?
>>>>>>>>
>>>>>>>
>>>>>>> Hard to say without knowing what that library would be.
>>>>>>>
>>>>>>> When I hit issues with closed blobs, sometimes I reverse-engineer them
>>>>>>> to fix the issue, example:
>>>>>>>
>>>>>>> https://github.com/maemo-leste/sgx-ddk-um/tree/master/dbm
>>>>>>>
>>>>>>> This is REed libdbm from sgx-ddk-um 1.17.4948957, that is responsible
>>>>>>> for allocating BOs (what omap_bo_new() does) but it uses DUMB buffers
>>>>>>> API, instead of OMAP BO API.
>>>>>>>
>>>>>>> I guess you are using some older version of sgx-ddk-um, so you may fix
>>>>>>> in similar way. Or binary patch.
>>>>>>
>>>>>> The blob binary that calls omap_bo_new is the gralloc.am57x.so here[2]:
>>>>>> any suggestions with it?
>>>>>> # sorry, I am not able to find out how you did the reverse-engineer
>>>>>> work# with the dbm repository shared here,
>>>>>> # not sure if you could give some tutorial steps for the similar
>>>>>> reverse-engineer# work with gralloc.am57x.so
>>>>>>
>>>>>
>>>>> Sorry, but it is like if you ask me to provide you with a tutorial on
>>>>> how to do brain surgery :)
>>>>>
>>>>>> [2]: https://android.googlesource.com/device/ti/beagle-x15/+/refs/heads/master/gpu/gralloc.am57x.so
>>>>>>
>>>>>
>>>>> I investigated this a bit and it seems it calls omap_bo_new() in a
>>>>> wrapper function like:
>>>>>
>>>>> bo = omap_bo_new(dev, -page_size & (size + page_size - 1), ((param5 &
>>>>> 0x800000) != 0) | OMAP_BO_WC | OMAP_BO_MEM_CONTIG);
>>>>>
>>>>> Didn't investigate further what param5 is, but it controls if
>>>>> OMAP_BO_SCANOUT is passed to omap_bo_new or not.
>>>>>
>>>>> However, this library was not made with upstream kernel in mind, as
>>>>> AFAIK OMAP_BO_MEM_CONTIG never made it upstream:
>>>>>
>>>>> https://yhbt.net/lore/all/2580272.MiZDHyRxZo@avalon/T/
>>>>>
>>>>> @Tomi - any comment?
>>>>>
>>>>> So, you have couple of options:
>>>>>
>>>>> 1. Ask TI for upstream-compatible library.
>>>> check is in progress, but it would take quite a long time I guess
>>>>> 2. Try to push OMAP_BO_MEM_CONTIG patch upstream.
>>>> hmm, sounds like one impossible thing...
>>>>> 3. Modify omap_bo_new() to something like:
>>>>> .
>>>>> #define OMAP_BO_MEM_CONTIG      0x00000008      /* only use contiguous dma mem */
>>>>> .
>>>>> if (flags & OMAP_BO_MEM_CONTIG)
>>>>>      flags |= OMAP_BO_SCANOUT;
>>>>> .
>>>>> This will not achieve exactly what OMAP_BO_MEM_CONTIG is supposed to do,
>>>>> but should make it work, at least.
>>>>
>>>> This looks like the only doable thing at the moment, maybe one change
>>>> needs to be submitted to the mesa/drm repository.
>>>> I can submit a request on your #3 change to the mesa/drm repository
>>>> for discussion after some check if you do not mind.
>>>>
>>>
>>> I doubt mesa/drm will accept such hack, I think you will need to support your drm clone (with the above fix) until TI fixes the closed library.
>>>
>>
>>
>> Hi all,
>>

Hi, glad to see you are doing fine :)

>> Just got around to reading this thread. I work with the TI gralloc lib
>> and can generate new versions as needed (I was probably the one who compiled
>> the version you have now). I've wanted to have our gralloc layer open source'd
>> as there is nothing really propriety in it (and I re-wrote a lot of it already)
>> and to avoid issues like this. But it interacts with the GPU code in some places,
>> so it's up to Imagination :(. The actual code in question if it helps is:
>>
>>          if(ui32Flags & PVRSRV_MEM_CACHED)
>>                  flags &= ~OMAP_BO_CACHE_MASK;
>>          else
>>                  flags |= OMAP_BO_WC;
>>
>>          if (ui32Flags & PVRSRV_HAP_CONTIG)
>>                  flags |= OMAP_BO_SCANOUT;
>>

Why is PVRSRV_HAP_CONTIG not set if the code requesting the buffer needs 
contiguous memory? Who is responsible for setting it?

>>          flags &= ~OMAP_BO_TILED_MASK;
>>          flags |= 0x00000008;
>>          flags |= OMAP_BO_WC;
>>
>>          bo = omap_bo_new(dev, size, flags);
>>
>> As you can see we use 0x00000008 (OMAP_BO_MEM_CONTIG) unconditionally.
>> This was a hack added since even non-scanout buffers sometimes need
>> to be contiguous (video decoder surfaces), but we had no way back

Hmm, why would video decoder need linear memory? No MMU?

>> then to communicate this to the gralloc layer. I think your best
>> bet would be to modify the gralloc lib to not do that, or put it
>> under the CONTIG check.
>>

Does that mean that now there is a way? If that's the case, then what 
needs to be fixed is the application requesting the buffer to send the 
truth about what it needs to gralloc.

>> If you tell me what the code should look like, I can rebuild the
>> lib and post a copy.
>>
>> Long term, I'd like to start using DMA-BUF Heaps for CMA memory
>> allocations in gralloc and elsewhere, then drop out the DMM/TILER
>> support from OMAPDRM, since it never really belonged there in
>> the first place (being a IOMMU unrelated to the display/GPU).
>>

Umm, how will we rotate scanout buffers then?

>> Thanks,
>> Andrew
>>


>>
>>> Regards,
>>> Ivo
>>>
>>>> Thanks,
>>>> Yongqin Liu
>>>>
>>>>>>>>>> On Thu, 17 Feb 2022 at 23:29, Ivaylo Dimitrov
>>>>>>>>>> <ivo.g.dimitrov.75@gmail.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 17.02.22 г. 14:46 ч., Tomi Valkeinen wrote:
>>>>>>>>>>>> Hi,
>>>>>>>>>>>>
>>>>>>>>>>>> On 19/01/2022 12:23, Ivaylo Dimitrov wrote:
>>>>>>>>>>>>> On devices with DMM, all allocations are done through either DMM or
>>>>>>>>>>>>> TILER.
>>>>>>>>>>>>> DMM/TILER being a limited resource means that such allocations will start
>>>>>>>>>>>>> to fail before actual free memory is exhausted. What is even worse is
>>>>>>>>>>>>> that
>>>>>>>>>>>>> with time DMM/TILER space gets fragmented to the point that even if we
>>>>>>>>>>>>> have
>>>>>>>>>>>>> enough free DMM/TILER space and free memory, allocation fails because
>>>>>>>>>>>>> there
>>>>>>>>>>>>> is no big enough free block in DMM/TILER space.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Such failures can be easily observed with OMAP xorg DDX, for example -
>>>>>>>>>>>>> starting few GUI applications (so buffers for their windows are
>>>>>>>>>>>>> allocated)
>>>>>>>>>>>>> and then rotating landscape<->portrait while closing and opening new
>>>>>>>>>>>>> windows soon results in allocation failures.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Fix that by mapping buffers through DMM/TILER only when really needed,
>>>>>>>>>>>>> like, for scanout buffers.
>>>>>>>>>>>>
>>>>>>>>>>>> Doesn't this break users that get a buffer from omapdrm and expect it to
>>>>>>>>>>>> be contiguous?
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> If you mean dumb buffer, then no, this does not break users as dumb
>>>>>>>>>>> buffers are allocated as scanout:
>>>>>>>>>>>
>>>>>>>>>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/omapdrm/omap_gem.c#L603
>>>>>>>>>>>
>>>>>>>>>>> If you mean omap_bo allocated buffers, then if users want
>>>>>>>>>>> linear(scanout) buffer, then they request it explicitly by passing
>>>>>>>>>>> OMAP_BO_SCANOUT.
>>>>>>>>>>>
>>>>>>>>>>> Ivo
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>
>>>>
>>>>
> 
> 
> 
