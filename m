Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F06C63878
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 11:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753F610E00A;
	Mon, 17 Nov 2025 10:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pw3/SVyS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EFD610E00A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 10:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763375198;
 bh=7E1iGzMd4PDWHzR3rFxKohDJmdKwKNnadkzMdyJaFAI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pw3/SVySjxBjRbUGsHXER1AtYL/ROW1n8XlfwAbfvNWfGDowFHpPGMi/RDtmDIzip
 jKevGmZo/2vFkeDLjADMOoDD7Gn2v4j6ZxoR8it3SrVkZdd1Q+cuuWdtkgv9BgJX6e
 Mh1wYdMQ8M2IX51PkZH0wnA25bA+9CYnEP64ZxKHZBb5oukSKXvEoL6LExDluO5Hpi
 VNcdZWiOimryWcdInLegq/Iw2JwYKmePqSGBktVyUxP6nQQoejoVNY0hqx9tO+Ibtv
 6QyXruvt1VqjhkW4zprbTXi+FsA6kei4uKXehhoX76fSXYtmO0Vn4QVHiU3NBWMJ5G
 5NnYQGD7C+6hA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B4D917E126B;
 Mon, 17 Nov 2025 11:26:38 +0100 (CET)
Date: Mon, 17 Nov 2025 11:26:34 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org, Lars-Ivar
 Hesselberg Simonsen <lars-ivar.simonsen@arm.com>, kernel@collabora.com
Subject: Re: [PATCH v1 4/4] drm/panthor: Relax check in
 panthor_sched_pre_reset()
Message-ID: <20251117112634.0542ee63@fedora>
In-Reply-To: <285e5435-7dca-4539-a5ab-aae82df4ef7b@arm.com>
References: <20251031154818.821054-1-boris.brezillon@collabora.com>
 <20251031154818.821054-5-boris.brezillon@collabora.com>
 <717fea87-6927-484a-b373-cb1917185c0f@arm.com>
 <20251112134725.160734c4@fedora>
 <285e5435-7dca-4539-a5ab-aae82df4ef7b@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon, 17 Nov 2025 09:49:27 +0000
Steven Price <steven.price@arm.com> wrote:

> On 12/11/2025 12:47, Boris Brezillon wrote:
> > On Fri, 7 Nov 2025 16:40:53 +0000
> > Steven Price <steven.price@arm.com> wrote:
> >   
> >> On 31/10/2025 15:48, Boris Brezillon wrote:  
> >>> A group can become runnable even after reset.in_progress has
> >>> been set to true and panthor_sched_suspend() has been called,
> >>> because the drm_sched queues are still running at that point,
> >>> and ::run_job() might call group_schedule_locked() which moves
> >>> the group to the runnable list. And that's fine, because we're
> >>> moving those groups to the stopped list anyway when we call
> >>> panthor_group_stop(), so just drop the misleading WARN_ON().    
> >>
> >> If we've got another thread mutating the runnable list between
> >> panthor_sched_suspend() and list_for_each_entry_safe(), doesn't that
> >> make the list iterator unsafe? (_safe only protects against deleting the
> >> current item, not against concurrent access).  
> > 
> > I'm not too sure actually. There's an
> > atomic_read(&sched->reset.in_progress) to check if we're about to reset
> > in group_schedule_locked() and cancel the insertion into the runnable
> > list in that case, meaning we're sure nothing new will be inserted after
> > we've set the in_progress=true in panthor_sched_pre_reset().  
> 
> I was mostly going on your commit message:
> 
> > A group can become runnable even after reset.in_progress has
> > been set to true and panthor_sched_suspend() has been called  
> 
> if that is indeed happening then we have a problem (and removing the
> WARN_ON is just papering over it). I haven't actually followed through
> the logic.

Sorry, it's not exactly that. The problem is that a group might be
inserted in the runnable list before we've had a chance to set
reset.in_progress=true (earlier in this function), and there's nothing
removing those groups from the runnable list between this assignment and
the loop stopping the groups.

> 
> >>
> >> It feels to me like we should be holding the sched mutex - at least
> >> while iterating. I agree the WARN_ON is unnecessary, and will need
> >> removing if we simply guard the iteration - the alternative is to
> >> recolour panthor_sched_suspend() to assume the lock is held (and take
> >> the lock in panthor_sched_pre_reset), but I suspect that's a more ugly
> >> change.  
> > 
> > I'd rather ensure that nothing new is inserted in the runnable/idle
> > lists after sched->reset.in_progress is set to true. Note that
> > sched->reset.in_progress is set to true with the sched lock held,
> > meaning any path modifying the sched lists (must be done with the sched
> > lock held) should complete before we set this to true. As long as those
> > paths also skip the list insertion, or, for things happening in a work
> > context (thinking of the tick work here), as long as the work is not
> > rescheduled until we get a chance to disable this work, we should be
> > good, no?  
> 
> Yes that design can work. But atomics can be difficult to reason about,
> so unless there's a good reason I think we'd generally be better
> sticking with (simple) locks

Locks alone won't prevent groups from being moved around after the
stop_all_groups loop though. It's the lock plus the fact groups can't
have their state changed while a reset is in progress that gives this
guarantee, at which point I guess checking reset.in_progress with or
without the lock held is the same, no? We do change the
reset.in_progress state with the sched.reset.lock held though, to make
sure any path that could move the group to a different list is out of
the way when we exit the locked section. That means that new threads
entering such paths (path changing the group state) will see the new
value and bail out.

> on the slow paths, then we get the benefits
> of lockdep etc checking we haven't messed up.

I don't mind taking the sched lock in this slow path, but I don't think
taking/releasing it inside panthor_sched_pre_reset() is giving any more
safeness, because what we want is a guarantee that groups won't be
moved around between panthor_sched_pre_reset() and
panthor_sched_post_reset(). If that's really a change we want to push
(reworking the locking in the reset sequence), I'd rather do that in
its own patchset, if you don't mind.
