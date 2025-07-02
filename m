Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B47AF0FD5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F38210E68A;
	Wed,  2 Jul 2025 09:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="oq1/vpZL";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="zJhL5OLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBB810E682;
 Wed,  2 Jul 2025 09:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=To:From:Subject:Date:Message-ID; t=1751448206;
 bh=Fx82RsOU2EqiBrBtYxvy+rT
 zeJpcmmOvyFtXAJ7kSzA=; b=oq1/vpZL4F6FwO1k7tfUpi0rrpEbRcUFni4vJygtXuTEX5x8zA
 +ZohAayVc3fNFow999fayM+RNTpX4YeRs+HDkomSEt1tSWsAxgCsvzp5C/Yi4+kg/DQBGp5I77D
 qnzDYsY3eXQQ6O0VW7Z/mduw1JYX/FkoHBZg+PpAlkRrWUleLZQNWDO1J+u9PLPsnH0YCOhD7DB
 qcqYCTNYP4vP41M4DmXjnMchmvLMQQnVvqGod8lYU+Z3BSjVj4hx33giDxYuXC7Aa77NpPsSW5r
 pqVK4f34PyaAAaDgDYQjxYKK9Hr5sHAb0NOaU1iX7nweXyLb9gGnxuCysJ/I3GMUqAg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=To:From:Subject:Date:Message-ID; t=1751448206; bh=Fx82RsOU2EqiBrBtYxvy+rT
 zeJpcmmOvyFtXAJ7kSzA=; b=zJhL5OLyXj5BHyzNGM4Ssax9745uZX2NDxnjVWD0y2pEmoTfKM
 KRNm9gqmn8AltdyUYTVHBfJZjEQevHhyxrDA==;
Message-ID: <c30011b2-8eaa-4a0a-8c9a-81fb61cfcced@damsy.net>
Date: Wed, 2 Jul 2025 11:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/amdgpu: give each kernel job a unique id
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
To: Danilo Krummrich <dakr@kernel.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 Philipp Stanner <phasta@kernel.org>, dri-devel@lists.freedesktop.org
References: <aEmR9420vj-ISz-W@cassiopeiae>
 <dc661205-1e5b-4697-863b-36a299365219@amd.com> <aEmcpsXwS8dLNGUg@cassiopeiae>
 <5f71cfd0-fd38-491c-8255-bdd3e0fb19dc@amd.com> <aEtnS6kvh1mssFTb@cassiopeiae>
 <099816b4-0b7b-4ac7-9bb5-22f23b1db7b7@amd.com> <aEvitwoc_D6OxXCS@pollux>
 <d205de0c-0c7a-4644-9655-e9ca28cadb57@damsy.net> <aEwP_kOkRKD9akKt@pollux>
 <6cb228b7-0926-425b-8ffe-8c48f2c554b8@damsy.net>
Content-Language: en-US
In-Reply-To: <6cb228b7-0926-425b-8ffe-8c48f2c554b8@damsy.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le 18/06/2025 à 11:18, Pierre-Eric Pelloux-Prayer a écrit :
> 
> 
> 
>>>
>>> Adding an API to reserve fixed numbers would work but:
>>> * if the fixed numbers are chosen by the driver ("drm_reserve_id(u64_max
>>> -1)"), I don't see the benefit over the current patch
>>> * if the fixed numbers are allocated by drm (drm_reserve_id("vm_update") ->
>>> u64), it would then require a way to expose them to userspace (through
>>> /sys/kernel/debug/dri/x/clients?)
>>
>> Yeah, both is possible, I'm fine with either.
>>
>> The benefit is that this way it becomes an official API, which can (and must)
>> be considered should there ever be a change on drm_file::client_id.
>>
>> If someone would patch drm_file::client_id to start allocating IDs from high to
>> low, your corresponding driver code would silently break, because it relies on
>> an implementation detail of something that is not an official API.
>>
>> Yes, I know that this exact case won't happen, but I guess you get the idea. :-)
> 
> After looking a bit more into this, I came to the conclusion that IMO the 2 above options aren't great:
> * the first adds a function that expose the possibility of reserving an id so we'll have to keep 
> track of such reserved ids for a benefit that is limited at best
> * the second option is nicer on the surface because it doesn't make the tools dependent on hard- 
> coded kernel ids. But it also requires quite a bit of changes and memory usage allocations.
> 
> Honestly I'm wondering if adding a comment to drm_file_alloc like this would be enough;
> 
>     /* Get a unique identifier for fdinfo.
>      * The highest ids may be used by drivers for tracing purposes. Overlapping is
>      * unlikely to occur, and if it does the impact will be limited to tracing.
>      */
>     file->client_id = atomic64_inc_return(&ident);
> 
> What do you think?
> 

ping?

btw, I don't think that adding a comment to drm_file is even useful.

What the original patch does is passing opaque ids to a function that expects
client_id (drm_sched_job_init).
These opaque ids could have any values, they won't interfere with fdinfo statistics
nor the driver inner working - they're just for tracing purpose.

Pierre-Eric


> Pierre-Eric
> 
> 
