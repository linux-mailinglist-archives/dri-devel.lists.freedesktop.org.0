Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E38273C7E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53F16E81B;
	Tue, 22 Sep 2020 07:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 89B676E4DE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 16:10:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7956F147A;
 Mon, 21 Sep 2020 09:10:24 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D50D3F73B;
 Mon, 21 Sep 2020 09:10:23 -0700 (PDT)
Date: Mon, 21 Sep 2020 17:10:21 +0100
From: Qais Yousef <qais.yousef@arm.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 0/3] drm: commit_work scheduling
Message-ID: <20200921161020.pjd6v6ul3beljwot@e107158-lin.cambridge.arm.com>
References: <20200919193727.2093945-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200919193727.2093945-1-robdclark@gmail.com>
User-Agent: NeoMutt/20171215
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:37 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 timmurray@google.com, dri-devel@lists.freedesktop.org,
 Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/19/20 12:37, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The android userspace treats the display pipeline as a realtime problem.
> And arguably, if your goal is to not miss frame deadlines (ie. vblank),
> it is.  (See https://lwn.net/Articles/809545/ for the best explaination
> that I found.)
> 
> But this presents a problem with using workqueues for non-blocking
> atomic commit_work(), because the SCHED_FIFO userspace thread(s) can
> preempt the worker.  Which is not really the outcome you want.. once
> the required fences are scheduled, you want to push the atomic commit
> down to hw ASAP.
> 
> But the decision of whether commit_work should be RT or not really
> depends on what userspace is doing.  For a pure CFS userspace display
> pipeline, commit_work() should remain SCHED_NORMAL.

Just a side note; this RT vs CFS inter-operatability is an issue that
creeps up every now and again.

https://lore.kernel.org/lkml/1567048502-6064-1-git-send-email-jing-ting.wu@mediatek.com/

Does the UI thread in Android ever run as RT by the way? I always suspected it
is one susceptible to such potential delays since it is part of the application
thread and thought it can't be trusted to become RT.

Those 120MHz displays will stress the pipeline :-)

> 
> To handle this, convert non-blocking commit_work() to use per-CRTC
> kthread workers, instead of system_unbound_wq.  Per-CRTC workers are
> used to avoid serializing commits when userspace is using a per-CRTC
> update loop.
> 
> A client-cap is introduced so that userspace can opt-in to SCHED_FIFO
> priority commit work.
> 
> A potential issue is that since 616d91b68cd ("sched: Remove
> sched_setscheduler*() EXPORTs") we have limited RT priority levels,
> meaning that commit_work() ends up running at the same priority level
> as vblank-work.  This shouldn't be a big problem *yet*, due to limited
> use of vblank-work at this point.  And if it could be arranged that
> vblank-work is scheduled before signaling out-fences and/or sending
> pageflip events, it could probably work ok to use a single priority
> level for both commit-work and vblank-work.

This is a function of num_cpus too. As long as nr_cpus > nr_running_rt_tasks
you should be fine.

Cheers

--
Qais Yousef
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
