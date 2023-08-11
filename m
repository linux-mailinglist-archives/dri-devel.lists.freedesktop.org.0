Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D13C7797B9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 21:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C1110E6E9;
	Fri, 11 Aug 2023 19:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EEB9910E6E9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 19:26:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 759521FB;
 Fri, 11 Aug 2023 12:27:22 -0700 (PDT)
Received: from [10.57.1.174] (unknown [10.57.1.174])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 144673F6C4;
 Fri, 11 Aug 2023 12:26:37 -0700 (PDT)
Message-ID: <71e8c55c-049f-688a-b97e-bdfbb54d18cb@arm.com>
Date: Fri, 11 Aug 2023 20:26:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 13/15] drm/panthor: Allow driver compilation
Content-Language: en-GB
To: Daniel Stone <daniels@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-14-boris.brezillon@collabora.com>
 <abed970e-db59-9eef-c4b6-dee49718f582@arm.com>
 <fa757894-f501-4114-ba7c-e46c59904300@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <fa757894-f501-4114-ba7c-e46c59904300@collabora.com>
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
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-08-11 17:56, Daniel Stone wrote:
> Hi,
> 
> On 11/08/2023 17:35, Robin Murphy wrote:
>> On 2023-08-09 17:53, Boris Brezillon wrote:
>>> +obj-$(CONFIG_DRM_PANTHOR) += panthor.o
>>
>> FWIW I still think it would be nice to have a minor 
>> directory/Kconfig/Makefile reshuffle and a trivial bit of extra 
>> registration glue to build both drivers into a single module. It seems 
>> like it could be a perpetual source of confusion to end users where 
>> Mesa "panfrost" is the right option but kernel "panfrost" is the wrong 
>> one. Especially when pretty much every other GPU driver is also just 
>> one big top-level module to load for many different generations of 
>> hardware. Plus it would mean that if someone did want to have a go at 
>> deduplicating the resource-wrangling boilerplate for OPPs etc. in 
>> future, there's more chance of being able to do so meaningfully.
> 
> It might be nice to point it out, but to be fair Intel and AMD both have 
> two (or more) drivers, as does Broadcom/RPi. As does, err ... Mali.

Indeed, I didn't mean to imply that I'm not aware that e.g. gma500 is to 
i915 what lima is to panfrost. It was more that unlike the others where 
there's a pretty clear line in the sand between "driver for old 
hardware" and "driver for the majority of recent hardware", this one 
happens to fall splat in the middle of the current major generation such 
that panfrost is the correct module for Mali Bifrost but also the wrong 
one for Mali Bifrost... :/

> I can see the point, but otoh if someone's managed to build all the 
> right regulator/clock/etc modules to get a working system, they'll 
> probably manage to figure teh GPU side out?

Maybe; either way I guess it's not really my concern, since I'm the only 
user that *I* have to support, and I do already understand it. From the 
upstream perspective I mostly just want to hold on to the hope of not 
having to write my io-pgtable bugs twice over if at all possible :)

Cheers,
Robin.
