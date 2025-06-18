Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6852ADE676
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 11:20:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DAC10E1CA;
	Wed, 18 Jun 2025 09:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="poEFqzn3";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="2/xx+ShN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FAA10E7B5;
 Wed, 18 Jun 2025 09:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1750238316;
 bh=nukWTs8ZmSoGjoyLtuUX0te
 +Vtma3cwEBHQhZNc0G4E=; b=poEFqzn3SuF5bmqvAQQoEFuxxmMbxhs45VkhR+Zcr/G6l9282e
 Y5yA16nMnwOPLXF6UehYvgmNys5dYFjb5WhuNvThaWCJszzx+bI+cqeJ4Xetpz0+G+ARXYG4vqR
 /bMW3kDjK2FPoCpr46+Rx9NIyR2Fj3qZIOXUpnJHyKmHg4JP62uf2J9EkvKlQCBQwyAHaoIs0s2
 pxR3pMnRve/nINFlfjWbu2W9q5jLW6KxLjVTDxErOlkHEGViN+E4aHbqDgI3O+cTfGGhvtFjYY4
 T5ls+ZCeB3pxzf7OSb7W6TBCZ4WJKDYebFQXsWDIbl4vnuG/6BS/C4DcI7tGCxW02pQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1750238316; bh=nukWTs8ZmSoGjoyLtuUX0te
 +Vtma3cwEBHQhZNc0G4E=; b=2/xx+ShNjaj7Du1VA79X4wEJxttdGRgMAgVhnVgpvFVMRWIgo1
 sZQhrtq5wpBXLDwtzIyEtwe8GmHQZi/ZzUBw==;
Message-ID: <6cb228b7-0926-425b-8ffe-8c48f2c554b8@damsy.net>
Date: Wed, 18 Jun 2025 11:18:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/amdgpu: give each kernel job a unique id
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
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <aEwP_kOkRKD9akKt@pollux>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>




>>
>> Adding an API to reserve fixed numbers would work but:
>> * if the fixed numbers are chosen by the driver ("drm_reserve_id(u64_max
>> -1)"), I don't see the benefit over the current patch
>> * if the fixed numbers are allocated by drm (drm_reserve_id("vm_update") ->
>> u64), it would then require a way to expose them to userspace (through
>> /sys/kernel/debug/dri/x/clients?)
> 
> Yeah, both is possible, I'm fine with either.
> 
> The benefit is that this way it becomes an official API, which can (and must)
> be considered should there ever be a change on drm_file::client_id.
> 
> If someone would patch drm_file::client_id to start allocating IDs from high to
> low, your corresponding driver code would silently break, because it relies on
> an implementation detail of something that is not an official API.
> 
> Yes, I know that this exact case won't happen, but I guess you get the idea. :-)

After looking a bit more into this, I came to the conclusion that IMO the 2 above options aren't great:
* the first adds a function that expose the possibility of reserving an id so we'll have to keep 
track of such reserved ids for a benefit that is limited at best
* the second option is nicer on the surface because it doesn't make the tools dependent on 
hard-coded kernel ids. But it also requires quite a bit of changes and memory usage allocations.

Honestly I'm wondering if adding a comment to drm_file_alloc like this would be enough;

    /* Get a unique identifier for fdinfo.
     * The highest ids may be used by drivers for tracing purposes. Overlapping is
     * unlikely to occur, and if it does the impact will be limited to tracing.
     */
    file->client_id = atomic64_inc_return(&ident);

What do you think?

Pierre-Eric



