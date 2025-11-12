Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE92C524F5
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 13:47:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B3D10E0BC;
	Wed, 12 Nov 2025 12:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JrFHBSZo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D2110E0BC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 12:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762951649;
 bh=677Qgxx81GKI1+F5cNNdbkuwRk43cXHUV+chiqgcYSo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JrFHBSZokh0/bNP8N3rpP8eD4EhslQYVMUSlNOnoiIU9giQ+5As9CPB6D5+ws+AD+
 xMpEkC26QspfIAtLTvWZBxihgs5ENtlKXW9MYANDVQjqLDWfhdweyvtq6YxFrDlsJr
 Wt7X5Fb3Gxg1Yn1HygHOMYDZCh+qLlXXCQmOZ4uZM2stZhWwU+RYR1DKUjghgt9k4R
 vNk2VHIIkMwnLZExUU4Z+lmUKuae+60AHgi4DSVWyQv9777Phhl+NSkm19xVL1CRoM
 3JYeojOBp0cZUL3OfVh5DAGo6YnMGEJiH/N4w+nbyKb9lZ4pzA0YlHPJBWI8qMquD8
 vzrN+Iy2C000Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0449217E0610;
 Wed, 12 Nov 2025 13:47:28 +0100 (CET)
Date: Wed, 12 Nov 2025 13:47:25 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org, Lars-Ivar
 Hesselberg Simonsen <lars-ivar.simonsen@arm.com>, kernel@collabora.com
Subject: Re: [PATCH v1 4/4] drm/panthor: Relax check in
 panthor_sched_pre_reset()
Message-ID: <20251112134725.160734c4@fedora>
In-Reply-To: <717fea87-6927-484a-b373-cb1917185c0f@arm.com>
References: <20251031154818.821054-1-boris.brezillon@collabora.com>
 <20251031154818.821054-5-boris.brezillon@collabora.com>
 <717fea87-6927-484a-b373-cb1917185c0f@arm.com>
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

On Fri, 7 Nov 2025 16:40:53 +0000
Steven Price <steven.price@arm.com> wrote:

> On 31/10/2025 15:48, Boris Brezillon wrote:
> > A group can become runnable even after reset.in_progress has
> > been set to true and panthor_sched_suspend() has been called,
> > because the drm_sched queues are still running at that point,
> > and ::run_job() might call group_schedule_locked() which moves
> > the group to the runnable list. And that's fine, because we're
> > moving those groups to the stopped list anyway when we call
> > panthor_group_stop(), so just drop the misleading WARN_ON().  
> 
> If we've got another thread mutating the runnable list between
> panthor_sched_suspend() and list_for_each_entry_safe(), doesn't that
> make the list iterator unsafe? (_safe only protects against deleting the
> current item, not against concurrent access).

I'm not too sure actually. There's an
atomic_read(&sched->reset.in_progress) to check if we're about to reset
in group_schedule_locked() and cancel the insertion into the runnable
list in that case, meaning we're sure nothing new will be inserted after
we've set the in_progress=true in panthor_sched_pre_reset().

> 
> It feels to me like we should be holding the sched mutex - at least
> while iterating. I agree the WARN_ON is unnecessary, and will need
> removing if we simply guard the iteration - the alternative is to
> recolour panthor_sched_suspend() to assume the lock is held (and take
> the lock in panthor_sched_pre_reset), but I suspect that's a more ugly
> change.

I'd rather ensure that nothing new is inserted in the runnable/idle
lists after sched->reset.in_progress is set to true. Note that
sched->reset.in_progress is set to true with the sched lock held,
meaning any path modifying the sched lists (must be done with the sched
lock held) should complete before we set this to true. As long as those
paths also skip the list insertion, or, for things happening in a work
context (thinking of the tick work here), as long as the work is not
rescheduled until we get a chance to disable this work, we should be
good, no?
