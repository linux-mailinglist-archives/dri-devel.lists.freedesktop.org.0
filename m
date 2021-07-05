Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 935A43BB906
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 10:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88DD89A7A;
	Mon,  5 Jul 2021 08:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1817B89A7A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 08:23:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FFC1D6E;
 Mon,  5 Jul 2021 01:23:05 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFE033F694;
 Mon,  5 Jul 2021 01:23:03 -0700 (PDT)
Subject: Re: [PATCH v3 5/7] drm/panfrost: Add a new ioctl to submit batches
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa@collabora.com>
References: <20210702143225.3347980-1-boris.brezillon@collabora.com>
 <20210702143225.3347980-6-boris.brezillon@collabora.com>
 <YN8tDD6tRF85cR4z@maud> <20210702173843.44b3e322@collabora.com>
 <YN9DsztrsMWY1rv+@maud> <20210702201112.4c07c2c7@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <a059fc1a-2596-314c-ace8-c3bd44d1b052@arm.com>
Date: Mon, 5 Jul 2021 09:22:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702201112.4c07c2c7@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/07/2021 19:11, Boris Brezillon wrote:
> On Fri, 2 Jul 2021 12:49:55 -0400
> Alyssa Rosenzweig <alyssa@collabora.com> wrote:
> 
>>>> ```  
>>>>>  #define PANFROST_BO_REF_EXCLUSIVE	0x1
>>>>> +#define PANFROST_BO_REF_NO_IMPLICIT_DEP	0x2    
>>>> ```
>>>>
>>>> This seems logically backwards. NO_IMPLICIT_DEP makes sense if we're
>>>> trying to keep backwards compatibility, but here you're crafting a new
>>>> interface totally from scratch. If anything, isn't BO_REF_IMPLICIT_DEP
>>>> the flag you'd want?  
>>>
>>> AFAICT, all other drivers make the no-implicit-dep an opt-in, and I
>>> didn't want to do things differently in panfrost. But if that's really
>>> an issue, I can make it an opt-out.  
>>
>> I don't have strong feelings either way. I was just under the
>> impressions other drivers did this for b/w compat reasons which don't
>> apply here.
> 
> Okay, I think I'll keep it like that unless there's a strong reason to
> make no-implicit dep the default. It's safer to oversync than the skip
> the synchronization, so it does feel like something the user should
> explicitly enable.

I don't have strong feelings - ultimately the number of projects caring
about the uABI is so limited the "default" is pretty irrelevant (it's
not as if we are needing to guide random developers who are new to the
interface). But a conservative default seems sensible.

>>
>>>> Hmm. I'm not /opposed/ and I know kbase uses strides but it seems like
>>>> somewhat unwarranted complexity, and there is a combinatoric explosion
>>>> here (if jobs, bo refs, and syncobj refs use 3 different versions, as
>>>> this encoding permits... as opposed to just specifying a UABI version or
>>>> something like that)  
>>>
>>> Sounds like a good idea. I'll add a version field and map that
>>> to a <job_stride,bo_ref_stride,syncobj_ref_stride> tuple.  
>>
>> Cc Steven, does this make sense?
> 
> I have this approach working, and I must admit I prefer it to the
> per-object stride field passed to the submit struct.
> 

There are benefits both ways:

 * Version number: easier to think about, and less worries about
combinatorial explosion of possible options to test.

 * Explicit structure sizes/strides: much harder to accidentally forgot
to change, clients 'naturally' move to newer versions just with recompiling.

For now I'd be tempted to go for the version number, but I suspect we
should also ensure there's a generic 'flags' field in there. That would
allow us to introduce new features/behaviours in a way which can be
backported more easily if necessary.

The main benefit of structure sizes/strides is if you can break binary
backwards compatibility after a few years - because source compatibility
can easily be maintained while dropping the code for the shorter/older
structs. But Linux tries to maintain binary compatibility so this isn't
so relevant.

Steve
