Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7AEADB107
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 15:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4ED10E335;
	Mon, 16 Jun 2025 13:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F6e++47j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC60210E335
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 13:04:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A7FA14A05A;
 Mon, 16 Jun 2025 13:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB58C4CEEA;
 Mon, 16 Jun 2025 13:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750079074;
 bh=zHbMFFZVSC+9mYWwl+ZnIqnXkE0H7Syzj52sA71Hc7k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F6e++47jRjOTEKMojSWfxy4BXsc5FnCI45X3HhCloXgAoL1d3aw2f+fWHXqiIvqmv
 XbeRTDjr/hyIKh+JruaPMVj52wY1R+gl/zHqyrBC9ePKXB0+GT/8OCkM4bfP4qIwA4
 oaMGoxD33QHnA7QirPkV+rb0O64OXRSnunDN/6nmHpVIhl6X40Y3Tqcccdvxrp9qeW
 I552UpE3EuJ0V1q+DoAxkyxVxENwni+Mab8hxCDxBa+rknXWoN5z5x5TiB3q1pJ8XV
 3X8PSja3rqBcQpFGsowVoQoXaUu+lrIGTx+T1/XDoHy84CTQGVsw8jCX3AuE90uVxK
 65RbXv34xwiNA==
Date: Mon, 16 Jun 2025 15:04:29 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sched/tests: Make timedout_job callback a better
 role model
Message-ID: <aFAWXTjuhYjMlAR9@pollux>
References: <20250605134154.191764-2-phasta@kernel.org>
 <e1b65491-781c-48f7-9368-58d7ede91b12@igalia.com>
 <aE_8lDuMFFhJBeUY@pollux>
 <723c98e2-cf75-4565-b78b-711b3022d44d@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <723c98e2-cf75-4565-b78b-711b3022d44d@igalia.com>
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

On Mon, Jun 16, 2025 at 09:49:46AM -0300, Maíra Canal wrote:
> Hi Danilo,
> 
> On 16/06/25 08:14, Danilo Krummrich wrote:
> > On Mon, Jun 16, 2025 at 11:57:47AM +0100, Tvrtko Ursulin wrote:
> > > Code looks fine, but currently nothing is broken and I disagree with the
> > > goal that the _mock_^1 components should be role models. The idea is to
> > > implement as little in the mock components as it is required to exercise the
> > > tested functionality.
> > 
> > No, please consider the following.
> > 
> >    1) When we write tests for common infrastructure we should be testing things
> >       as close as possible to how we intend real code to use this infrastructure.
> >       Relying on internals in creative ways is likely to underrun this testing.
> 
> Regarding unit testing (and KUnit is a unit testing framework), the core
> principle is that individual components of the code should be tested in
> isolation to validate that they perform as expected.
> 
> The "units" should be tested independently and we use those mocks to
> simulate dependencies, ensuring that the test focuses solely on the unit
> under scrutiny.
> 
> If we introduce more things into the mock, we end up losing the
> isolation. The mock scheduler, from what I understand, is not suppose to
> be a reference design or even something close to a driver.  It should
> remain just a mock, a minimal interface to test the scheduler's
> internals.

Nothing of what you say seems contradictive to what I say, no?

I'm just saying that while we're doing all this we can (and should) still try
to be as close as possible to how we intend real code to use the corresponding
APIs.
