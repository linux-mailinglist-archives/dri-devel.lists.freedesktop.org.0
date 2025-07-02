Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C84AF103F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917C410E671;
	Wed,  2 Jul 2025 09:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UCKumJdU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0217610E671;
 Wed,  2 Jul 2025 09:42:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA5AB5C6B22;
 Wed,  2 Jul 2025 09:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F176C4CEED;
 Wed,  2 Jul 2025 09:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751449364;
 bh=DsjKHY1GUVtaqB541z5W1P7Mb/2sQOrRjL29c3xI8cA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UCKumJdUauSJKqemWT1HcLXhQyaviC7Rg1zxNs139rwdA4z2iVOVVmTkkm3z8Y1Qi
 KMRFmFY/ROm3fH4fAC10rb3uAFvmzzzX/SgSwRxk4ZH5yGGYrV1p+EqiYj6ldUAv6x
 R62PX9qZLwvVEZqjNpe8QJFpw4MKbFC+dDH2EdvoG5nIRjdCZYNvTVFE6Jlg2FS8ih
 h5lNsFf2P26ktpjdLNyikM+RHzIOBpOhtHt7tgQZJH0GgkZDFmTfJ2lWze0X9PpfGO
 7xDT3+luAiuAb2Diibkvn40bqsxvoh9EU4oTd8ANEOI6IJB6UjFZnKS9s47AHpETMH
 tGGJ/zF4NvOhg==
Date: Wed, 2 Jul 2025 11:42:40 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 Philipp Stanner <phasta@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/amdgpu: give each kernel job a unique id
Message-ID: <aGT_EMqpDLccP7At@pollux>
References: <dc661205-1e5b-4697-863b-36a299365219@amd.com>
 <aEmcpsXwS8dLNGUg@cassiopeiae>
 <5f71cfd0-fd38-491c-8255-bdd3e0fb19dc@amd.com>
 <aEtnS6kvh1mssFTb@cassiopeiae>
 <099816b4-0b7b-4ac7-9bb5-22f23b1db7b7@amd.com>
 <aEvitwoc_D6OxXCS@pollux>
 <d205de0c-0c7a-4644-9655-e9ca28cadb57@damsy.net>
 <aEwP_kOkRKD9akKt@pollux>
 <6cb228b7-0926-425b-8ffe-8c48f2c554b8@damsy.net>
 <c30011b2-8eaa-4a0a-8c9a-81fb61cfcced@damsy.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c30011b2-8eaa-4a0a-8c9a-81fb61cfcced@damsy.net>
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

On Wed, Jul 02, 2025 at 11:23:26AM +0200, Pierre-Eric Pelloux-Prayer wrote:
> 
> 
> Le 18/06/2025 à 11:18, Pierre-Eric Pelloux-Prayer a écrit :
> > 
> > 
> > 
> > > > 
> > > > Adding an API to reserve fixed numbers would work but:
> > > > * if the fixed numbers are chosen by the driver ("drm_reserve_id(u64_max
> > > > -1)"), I don't see the benefit over the current patch
> > > > * if the fixed numbers are allocated by drm (drm_reserve_id("vm_update") ->
> > > > u64), it would then require a way to expose them to userspace (through
> > > > /sys/kernel/debug/dri/x/clients?)
> > > 
> > > Yeah, both is possible, I'm fine with either.
> > > 
> > > The benefit is that this way it becomes an official API, which can (and must)
> > > be considered should there ever be a change on drm_file::client_id.
> > > 
> > > If someone would patch drm_file::client_id to start allocating IDs from high to
> > > low, your corresponding driver code would silently break, because it relies on
> > > an implementation detail of something that is not an official API.
> > > 
> > > Yes, I know that this exact case won't happen, but I guess you get the idea. :-)
> > 
> > After looking a bit more into this, I came to the conclusion that IMO the 2 above options aren't great:
> > * the first adds a function that expose the possibility of reserving an
> > id so we'll have to keep track of such reserved ids for a benefit that
> > is limited at best
> > * the second option is nicer on the surface because it doesn't make the
> > tools dependent on hard- coded kernel ids. But it also requires quite a
> > bit of changes and memory usage allocations.
> > 
> > Honestly I'm wondering if adding a comment to drm_file_alloc like this would be enough;
> > 
> >     /* Get a unique identifier for fdinfo.
> >      * The highest ids may be used by drivers for tracing purposes. Overlapping is
> >      * unlikely to occur, and if it does the impact will be limited to tracing.
> >      */
> >     file->client_id = atomic64_inc_return(&ident);
> > 
> > What do you think?
> > 
> 
> ping?
> 
> btw, I don't think that adding a comment to drm_file is even useful.
> 
> What the original patch does is passing opaque ids to a function that expects
> client_id (drm_sched_job_init).
> These opaque ids could have any values, they won't interfere with fdinfo statistics
> nor the driver inner working - they're just for tracing purpose.

I mean, you're right, you can definitely do that, it's entirely up to the driver
what to pass as a debug cookie to drm_sched_job_init().

I'm just saying that you're completely on your own if the implementation of
file->client_id would change (which admittedly is unlikely). In such a case
you'd have to accept that potentially a change silently breaks your driver and
that people are free to ignore this fact.

In this case it's probably not that big a deal, but still I like to create some
awareness that this class of solutions (i.e. rely on how generic infrastructure
works internally) is usually not a good idea at all, since it's error prone and
is giving maintainers a hard time.
