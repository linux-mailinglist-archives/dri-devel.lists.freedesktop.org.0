Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CD0782FBE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 19:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7F610E296;
	Mon, 21 Aug 2023 17:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 39FA510E29B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 17:56:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F5502F4;
 Mon, 21 Aug 2023 10:57:08 -0700 (PDT)
Received: from [10.57.3.137] (unknown [10.57.3.137])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFA6C3F762;
 Mon, 21 Aug 2023 10:56:25 -0700 (PDT)
Message-ID: <49f7f241-1333-622d-4098-d06b659556d6@arm.com>
Date: Mon, 21 Aug 2023 18:56:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 13/15] drm/panthor: Allow driver compilation
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, Daniel Stone
 <daniels@collabora.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-14-boris.brezillon@collabora.com>
 <abed970e-db59-9eef-c4b6-dee49718f582@arm.com>
 <fa757894-f501-4114-ba7c-e46c59904300@collabora.com>
 <71e8c55c-049f-688a-b97e-bdfbb54d18cb@arm.com>
 <60720747-5f03-2766-0d5f-e102097308e7@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <60720747-5f03-2766-0d5f-e102097308e7@arm.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-08-14 12:18, Steven Price wrote:
> On 11/08/2023 20:26, Robin Murphy wrote:
>> On 2023-08-11 17:56, Daniel Stone wrote:
>>> Hi,
>>>
>>> On 11/08/2023 17:35, Robin Murphy wrote:
>>>> On 2023-08-09 17:53, Boris Brezillon wrote:
>>>>> +obj-$(CONFIG_DRM_PANTHOR) += panthor.o
>>>>
>>>> FWIW I still think it would be nice to have a minor
>>>> directory/Kconfig/Makefile reshuffle and a trivial bit of extra
>>>> registration glue to build both drivers into a single module. It
>>>> seems like it could be a perpetual source of confusion to end users
>>>> where Mesa "panfrost" is the right option but kernel "panfrost" is
>>>> the wrong one. Especially when pretty much every other GPU driver is
>>>> also just one big top-level module to load for many different
>>>> generations of hardware. Plus it would mean that if someone did want
>>>> to have a go at deduplicating the resource-wrangling boilerplate for
>>>> OPPs etc. in future, there's more chance of being able to do so
>>>> meaningfully.
>>>
>>> It might be nice to point it out, but to be fair Intel and AMD both
>>> have two (or more) drivers, as does Broadcom/RPi. As does, err ... Mali.
>>
>> Indeed, I didn't mean to imply that I'm not aware that e.g. gma500 is to
>> i915 what lima is to panfrost. It was more that unlike the others where
>> there's a pretty clear line in the sand between "driver for old
>> hardware" and "driver for the majority of recent hardware", this one
>> happens to fall splat in the middle of the current major generation such
>> that panfrost is the correct module for Mali Bifrost but also the wrong
>> one for Mali Bifrost... :/
> 
> Well panfrost.ko is the correct module for all Bifrost ;) It's Valhall
> that's the confusing one.

Bah, you see? If even developers sufficiently involved to be CCed on the 
patches can't remember what's what, what hope does Joe User have? :D

> I would hope that for most users they can just build both panfrost and
> panthor and everything will "Just Work (tm)". I'm not sure how much
> users are actually aware of the architecture family of their GPU.
> 
> I think at the moment (until marketing mess it up) there's also the
> 'simple' rule:
> 
> * Mali T* is Midgard and supported by panfrost.ko
> * Mali Gxx (two digits) is Bifrost or first-generation Valhall and
> supported by panfrost.ko
> * Mali Gxxx (three digits) is Valhall CSF and supported by panthor.
> 
> (and Immortalis is always three digits and Valhall CSF).

With brain now engaged, indeed that sounds right. However if the 
expectation is that most people would steer clear even of marketing's 
alphabet soup and just enable everything, that could also be seen as 
somewhat of an argument for just putting it all together and not 
bothering with a separate option.

>>> I can see the point, but otoh if someone's managed to build all the
>>> right regulator/clock/etc modules to get a working system, they'll
>>> probably manage to figure teh GPU side out?
>>
>> Maybe; either way I guess it's not really my concern, since I'm the only
>> user that *I* have to support, and I do already understand it. From the
>> upstream perspective I mostly just want to hold on to the hope of not
>> having to write my io-pgtable bugs twice over if at all possible :)
> 
> I agree it would be nice to merge some of the common code, I'm hoping
> this is something that might be possible in the future. But at the
> moment the focus is on trying to get basic support for the new GPUs
> without the danger of regressing the old GPUs.

Yup, I get that, it's just the niggling concern I have is whether what 
we do at the moment might paint us into a corner with respect to what 
we're then able to change later; I know KConfig symbols are explicitly 
not ABI, but module names and driver names might be more of a grey area.

> And, to be honest, for a fair bit of the common code in
> panfrost/panthorm it's common to a few other drivers too. So the correct
> answer might well be to try to add more generic helpers (devfreq,
> clocks, power domains all spring to mind - there's a lot of boiler plate
> and nothing very special about Mali).

That much is true, however I guess there's also stuff like perf counter 
support which is less likely to be DRM-level generic but perhaps still 
sufficiently similar between JM and CSF. The main thing I don't know, 
and thus feel compelled to poke at, is whether there's any possibility 
that once the new UAPI is mature, it might eventually become preferable 
to move Job Manager support over to some subset of that rather than 
maintain two whole UAPIs in parallel (particularly at the Mesa end). My 
(limited) understanding is that all the BO-wrangling and MMU code is 
primarily different here for the sake of supporting new shiny UAPI 
features, not because of anything inherent to CSF itself (other than CSF 
being the thing which makes supporting said features feasible). If 
that's a preposterous idea and absolutely never ever going to be 
realistic, then fine, but if not, then it feels like the kind of thing 
that my all-too-great experience of technical debt and bad short-term 
decisions tells me is worth planning around from the very start.

Thanks,
Robin.
