Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB671AD8B1D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 13:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E7210E8E9;
	Fri, 13 Jun 2025 11:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K5FYjKsR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A636E10E8DD;
 Fri, 13 Jun 2025 11:48:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B008E447DB;
 Fri, 13 Jun 2025 11:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F085BC4CEE3;
 Fri, 13 Jun 2025 11:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749815298;
 bh=MOo/4EALMeElSGHB60M5EW6v4K6E+bIxI3ruVPuQUbo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K5FYjKsRiG0qJWCWD4bxUY8srTZIgsZL7n1OVehhPdIe8hLyAzApcBQoh5FtkeMK1
 W8UfBxM5JwvIgu6m0QntfW9F+cwM66dCJHeOnXqbi47uPe9GvOF/38Yd9KnNWKV2sZ
 TmPXDoUXx9DwrkZBGV59fy9aPkMdNNOzn0I+1echHrkVA+dYDzFchphlJI18z+oB9X
 WijjUIJj+zhFYKSBDbgdAAC+3j3KK9tGL7hshkATJjZsK8ZhthFa+erlLk2TZoyI/z
 68RZ6a8MqM/cekRRVIPN42GPiaWVa63bq1ZL853cwbjx0eKI66UOaQVUTxG2ldKR3i
 k6paGneoRRA1g==
Date: Fri, 13 Jun 2025 13:48:14 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 Philipp Stanner <phasta@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/amdgpu: give each kernel job a unique id
Message-ID: <aEwP_kOkRKD9akKt@pollux>
References: <aEmR9420vj-ISz-W@cassiopeiae>
 <dc661205-1e5b-4697-863b-36a299365219@amd.com>
 <aEmcpsXwS8dLNGUg@cassiopeiae>
 <5f71cfd0-fd38-491c-8255-bdd3e0fb19dc@amd.com>
 <aEtnS6kvh1mssFTb@cassiopeiae>
 <099816b4-0b7b-4ac7-9bb5-22f23b1db7b7@amd.com>
 <aEvitwoc_D6OxXCS@pollux>
 <d205de0c-0c7a-4644-9655-e9ca28cadb57@damsy.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d205de0c-0c7a-4644-9655-e9ca28cadb57@damsy.net>
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

On Fri, Jun 13, 2025 at 11:27:08AM +0200, Pierre-Eric Pelloux-Prayer wrote:
> Le 13/06/2025 � 10:35, Danilo Krummrich a �crit�:
> > On Fri, Jun 13, 2025 at 10:23:15AM +0200, Christian K�nig wrote:
> > > > Another option is to just add an interface to get a kernel client_id from the
> > > > same atomic / IDA.
> > > 
> > > That won't give us fixed numbers for in kernel clients.
> > 
> > That's fine, then let's come up with an API that reserves fixed numbers.
> > 
> > My main concern is that drivers silently rely on DRM API internals, i.e. that
> > client_id is an u64 atomic, etc.
> 
> Let me express the need then: an id that is printed in gpu_scheduler_trace
> events and this id needs to be mappable by a userspace tool to a semantic.
> 
> The current solution implements this need using:
> * fixed ids which are u64 numbers because drm client id are u64.
> * hard-coded mapping in the tool between these ids and their meaning
> ("u64_max - 1" interpreted as "vm_update" and so on).
> 
> It doesn't depend on how drm internally manage these ids.
> 
> Adding an API to reserve fixed numbers would work but:
> * if the fixed numbers are chosen by the driver ("drm_reserve_id(u64_max
> -1)"), I don't see the benefit over the current patch
> * if the fixed numbers are allocated by drm (drm_reserve_id("vm_update") ->
> u64), it would then require a way to expose them to userspace (through
> /sys/kernel/debug/dri/x/clients?)

Yeah, both is possible, I'm fine with either.

The benefit is that this way it becomes an official API, which can (and must)
be considered should there ever be a change on drm_file::client_id.

If someone would patch drm_file::client_id to start allocating IDs from high to
low, your corresponding driver code would silently break, because it relies on
an implementation detail of something that is not an official API.

Yes, I know that this exact case won't happen, but I guess you get the idea. :-)
