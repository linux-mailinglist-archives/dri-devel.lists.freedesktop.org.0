Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A30CC63556
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 10:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1825F10E30D;
	Mon, 17 Nov 2025 09:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4FE3610E30D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 09:49:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F546FEC;
 Mon, 17 Nov 2025 01:49:23 -0800 (PST)
Received: from [10.57.69.30] (unknown [10.57.69.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61B0D3F66E;
 Mon, 17 Nov 2025 01:49:29 -0800 (PST)
Message-ID: <285e5435-7dca-4539-a5ab-aae82df4ef7b@arm.com>
Date: Mon, 17 Nov 2025 09:49:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] drm/panthor: Relax check in
 panthor_sched_pre_reset()
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org,
 Lars-Ivar Hesselberg Simonsen <lars-ivar.simonsen@arm.com>,
 kernel@collabora.com
References: <20251031154818.821054-1-boris.brezillon@collabora.com>
 <20251031154818.821054-5-boris.brezillon@collabora.com>
 <717fea87-6927-484a-b373-cb1917185c0f@arm.com>
 <20251112134725.160734c4@fedora>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251112134725.160734c4@fedora>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/11/2025 12:47, Boris Brezillon wrote:
> On Fri, 7 Nov 2025 16:40:53 +0000
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 31/10/2025 15:48, Boris Brezillon wrote:
>>> A group can become runnable even after reset.in_progress has
>>> been set to true and panthor_sched_suspend() has been called,
>>> because the drm_sched queues are still running at that point,
>>> and ::run_job() might call group_schedule_locked() which moves
>>> the group to the runnable list. And that's fine, because we're
>>> moving those groups to the stopped list anyway when we call
>>> panthor_group_stop(), so just drop the misleading WARN_ON().  
>>
>> If we've got another thread mutating the runnable list between
>> panthor_sched_suspend() and list_for_each_entry_safe(), doesn't that
>> make the list iterator unsafe? (_safe only protects against deleting the
>> current item, not against concurrent access).
> 
> I'm not too sure actually. There's an
> atomic_read(&sched->reset.in_progress) to check if we're about to reset
> in group_schedule_locked() and cancel the insertion into the runnable
> list in that case, meaning we're sure nothing new will be inserted after
> we've set the in_progress=true in panthor_sched_pre_reset().

I was mostly going on your commit message:

> A group can become runnable even after reset.in_progress has
> been set to true and panthor_sched_suspend() has been called

if that is indeed happening then we have a problem (and removing the
WARN_ON is just papering over it). I haven't actually followed through
the logic.

>>
>> It feels to me like we should be holding the sched mutex - at least
>> while iterating. I agree the WARN_ON is unnecessary, and will need
>> removing if we simply guard the iteration - the alternative is to
>> recolour panthor_sched_suspend() to assume the lock is held (and take
>> the lock in panthor_sched_pre_reset), but I suspect that's a more ugly
>> change.
> 
> I'd rather ensure that nothing new is inserted in the runnable/idle
> lists after sched->reset.in_progress is set to true. Note that
> sched->reset.in_progress is set to true with the sched lock held,
> meaning any path modifying the sched lists (must be done with the sched
> lock held) should complete before we set this to true. As long as those
> paths also skip the list insertion, or, for things happening in a work
> context (thinking of the tick work here), as long as the work is not
> rescheduled until we get a chance to disable this work, we should be
> good, no?

Yes that design can work. But atomics can be difficult to reason about,
so unless there's a good reason I think we'd generally be better
sticking with (simple) locks on the slow paths, then we get the benefits
of lockdep etc checking we haven't messed up.

Thanks,
Steve

