Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2418E689F81
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 17:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B032C10E206;
	Fri,  3 Feb 2023 16:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2E99410E209
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 16:43:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8135C14;
 Fri,  3 Feb 2023 08:43:58 -0800 (PST)
Received: from [10.1.39.17] (e122027.cambridge.arm.com [10.1.39.17])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14BA03F71E;
 Fri,  3 Feb 2023 08:43:14 -0800 (PST)
Message-ID: <2891caff-e419-f88c-79c2-7630cc351444@arm.com>
Date: Fri, 3 Feb 2023 16:43:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH] drm/pancsf: Add a new driver for Mali CSF-based GPUs
Content-Language: en-GB
To: Alyssa Rosenzweig <alyssa@collabora.com>
References: <20230201084832.1708866-1-boris.brezillon@collabora.com>
 <bf9a7562-796b-d39e-ef4b-deb8217484b4@arm.com> <Y902XDkZB6PvT47s@maud>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <Y902XDkZB6PvT47s@maud>
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
Cc: Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/02/2023 16:29, Alyssa Rosenzweig wrote:
>>> Mali v10 (second Valhal iteration) and later GPUs replaced the Job
>>> Manager block by a command stream based interface called CSF (for
>>> Command Stream Frontend). This interface is not only turning the job
>>> chain based submission model into a command stream based one, but also
>>> introducing FW-assisted scheduling of command stream queues. This is a
>>> fundamental shift in both how userspace is supposed to submit jobs, but
>>> also how the driver is architectured. We initially tried to retrofit the
>>> CSF model into panfrost, but this ended up introducing unneeded
>>> complexity to the existing driver, which we all know is a potential
>>> source of regression.
>>
>> While I agree there's some big differences which effectively mandate
>> splitting the driver I do think there are some parts which make a lot of
>> sense to share.
>>
>> For example pancsf_regs.h and panfrost_regs.h are really quite similar
>> and I think could easily be combined. The clock/regulator code is pretty
>> much a direct copy/paste (just adding support for more clocks), etc.
>>
>> What would be ideal is factoring out 'generic' parts from panfrost and
>> then being able to use them from pancsf.
>>
>> I had a go at starting that:
>>
>> https://gitlab.arm.com/linux-arm/linux-sp/-/tree/pancsf-refactor
>>
>> (lightly tested for Panfrost, only build tested for pancsf).
>>
>> That saves around 200 lines overall and avoids needing to maintain two
>> lots of clock/regulator code. There's definite scope for sharing (most)
>> register definitions between the drivers and quite possibly some of the
>> MMU/memory code (although there's diminishing returns there).
> 
> 200 lines saved in a 5kloc+ driver doesn't seem worth much, especially
> against the added testing combinatorics, TBH. The main reason I can see
> to unify is if we want VM_BIND (and related goodies) on JM hardware too.
> That's only really for Vulkan and I really don't see the case for Vulkan
> on anything older than Valhall at this point. So it comes down to
> whether we want to start Vulkan at v9 or skip to v10. The separate
> panfrost/pancsf drivers approach strongly favours the latter.

While I agree 200 lines isn't much in the grand scheme what I really
don't want is to have to maintain two (almost) identical versions of the
same code. I agree with the concept entirely of having a separate .ko
and not trying to keep it all "one driver". Just, for the bits where
it's clearly copy/pasted from the existing Panfrost, lets move that code
into a common file and build it into both drivers.

Ultimately the 200 line saving was just a couple of hours this morning -
indeed I was 'reviewing' by comparing against Panfrost and thinking "if
it works in Panfrost it must be correct" - the review would be even
easier if it wasn't new code ;)

And as far as I'm aware the changes I'm proposing don't make any
difference to testing - I'm not sure I understand that statement.

The MMU/memory code I'm undecided on. There's clearly copied code there
but quite a few differences. If we can unify and get extra goodies for
Panfrost then it's worth doing, if the unification is going to be hard
or risk regressions then perhaps not - especially if Mesa isn't going to
get the features (which depends whether anyone working on Mesa wants to
work on Vulkan for Bifrost).

Anyway, just to be clear I don't want to stand in the way of getting
this merged. If necessary the refactor can be done on top afterwards
(indeed that's what I've got in my repo).

Thanks,

Steve

