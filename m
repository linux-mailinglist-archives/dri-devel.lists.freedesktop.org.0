Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2B0A96F4E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 16:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D40E10E5C5;
	Tue, 22 Apr 2025 14:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RUX/PHzi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1292610E2A9;
 Tue, 22 Apr 2025 14:53:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 78CE05C0F2C;
 Tue, 22 Apr 2025 14:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976CEC4CEE9;
 Tue, 22 Apr 2025 14:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745333579;
 bh=018saJNBRs7zemO9fzSOBQxHo1poUiqtBOtAUljjlY4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RUX/PHzinyM9Br2ohsV5psWHr9HC30mW4Qfvv0nJlSi/a8EoPfm59C+m58wvtX1e8
 iBpR+fxYxQITB6uIRouvyd40V6zf6X5no5959gFexwuy1k7KY4xKidKnOsogmRP2jG
 dK6+kodnftT/o4Yn4apZC7fKIX9gRMZ9blNUqAkZjVaeGHLP5Z6wkjuFMUxidsB2Ns
 3VLudYWHplEtA48QEQBhn/wycwXaXkOTCFzES4dRCu4+Fr0tro5Nv/9oB7UYA1G19h
 8by4A+JPsBOJNEbg80DHrihnJAl42rGL641kOQKBtLjwtbT6dzT0lqAOlbAAjr3RGL
 Z6AJRZ7Da57vQ==
Date: Tue, 22 Apr 2025 16:52:54 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: phasta@kernel.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
Message-ID: <aAetRm3Sbp9vzamg@cassiopeiae>
References: <aAEUwjzZ9w9xlKRY@cassiopeiae>
 <0e8313dc-b1bb-4ce7-b5b7-b8b3e027adb7@igalia.com>
 <0bfa746ca37de1813db22e518ffb259648d29e02.camel@mailbox.org>
 <5a5d4a33-2f7b-46e4-8707-7445ac3de376@igalia.com>
 <aAd54jUwBwgc-_g2@cassiopeiae>
 <d3c0f721-2d19-4a1c-a086-33e8d6bd7be6@igalia.com>
 <aAeMVtdkrAoMrmVk@cassiopeiae>
 <52574769-2120-41a1-b5dc-50a42da5dca6@igalia.com>
 <aAeiwZ2j2PhEwhVh@cassiopeiae>
 <f0ae2d411c21e799491244fe49880a4acca32918.camel@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0ae2d411c21e799491244fe49880a4acca32918.camel@mailbox.org>
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

On Tue, Apr 22, 2025 at 04:16:48PM +0200, Philipp Stanner wrote:
> On Tue, 2025-04-22 at 16:08 +0200, Danilo Krummrich wrote:
> > On Tue, Apr 22, 2025 at 02:39:21PM +0100, Tvrtko Ursulin wrote:
> 
> > > Sorry I don't see the argument for the claim it is relying on the
> > > internals
> > > with the re-positioned drm_sched_fini call. In that case it is
> > > fully
> > > compliant with:
> > > 
> > > /**
> > >  * drm_sched_fini - Destroy a gpu scheduler
> > >  *
> > >  * @sched: scheduler instance
> > >  *
> > >  * Tears down and cleans up the scheduler.
> > >  *
> > >  * This stops submission of new jobs to the hardware through
> > >  * drm_sched_backend_ops.run_job(). Consequently,
> > > drm_sched_backend_ops.free_job()
> > >  * will not be called for all jobs still in
> > > drm_gpu_scheduler.pending_list.
> > >  * There is no solution for this currently. Thus, it is up to the
> > > driver to
> > > make
> > >  * sure that:
> > >  *
> > >  *  a) drm_sched_fini() is only called after for all submitted jobs
> > >  *     drm_sched_backend_ops.free_job() has been called or that
> > >  *  b) the jobs for which drm_sched_backend_ops.free_job() has not
> > > been
> > > called
> > >  *
> > >  * FIXME: Take care of the above problem and prevent this function
> > > from
> > > leaking
> > >  * the jobs in drm_gpu_scheduler.pending_list under any
> > > circumstances.
> > > 
> > > ^^^ recommended solution b).
> > 
> > This has been introduced recently with commit baf4afc58314
> > ("drm/sched: Improve
> > teardown documentation") and I do not agree with this. The scheduler
> > should
> > *not* make any promises about implementation details to enable
> > drivers to abuse
> > their knowledge about component internals.
> > 
> > This makes the problem *worse* as it encourages drivers to rely on
> > implementation details, making maintainability of the scheduler even
> > worse.
> > 
> > For instance, what if I change the scheduler implementation, such
> > that for every
> > entry in the pending_list the scheduler allocates another internal
> > object for
> > ${something}? Then drivers would already fall apart leaking those
> > internal
> > objects.
> > 
> > Now, obviously that's pretty unlikely, but I assume you get the idea.
> > 
> > The b) paragraph in drm_sched_fini() should be removed for the given
> > reasons.
> > 
> > AFAICS, since the introduction of this commit, driver implementations
> > haven't
> > changed in this regard, hence we should be good.
> > 
> > So, for me this doesn't change the fact that every driver
> > implementation that
> > just stops the scheduler at an arbitrary point of time and tries to
> > clean things
> > up manually relying on knowledge about component internals is broken.
> 
> To elaborate on that, this documentation has been written so that we at
> least have *some* documentation about the problem, instead of just
> letting new drivers run into the knife.
> 
> The commit explicitly introduced the FIXME, marking those two hacky
> workarounds as undesirable.
> 
> But back then we couldn't fix the problem quickly, so it was either
> document the issue at least a bit, or leave it completely undocumented.

Agreed, but b) really sounds like an invitation (or even justification) for
doing the wrong thing, let's removed it.
