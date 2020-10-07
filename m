Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AB028624F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 17:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9706E929;
	Wed,  7 Oct 2020 15:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 22C326E8BB
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 10:36:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D14D11B3;
 Wed,  7 Oct 2020 03:36:57 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AEF33F71F;
 Wed,  7 Oct 2020 03:36:56 -0700 (PDT)
Date: Wed, 7 Oct 2020 11:36:53 +0100
From: Qais Yousef <qais.yousef@arm.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
Message-ID: <20201007103653.qjohhta7douhlb22@e107158-lin.cambridge.arm.com>
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <20201002110105.e56qrvzoqfioi4hs@e107158-lin.cambridge.arm.com>
 <CAF6AEGvWMvZuy7CcGhzUSbwGtEkrNkzWHu_BN1cbdBJdZtvevA@mail.gmail.com>
 <20201005150024.mchfdtd62rlkuh4s@e107158-lin.cambridge.arm.com>
 <CAF6AEGs7NmCPyLdg+gg5jTTe-wgi2myRQ80tum6odv6tLLQ0DQ@mail.gmail.com>
 <20201006105918.v3xspb6xasjyy5ky@e107158-lin.cambridge.arm.com>
 <CAF6AEGu_V_EGcPQ+F_Z73cMCAcFPoM-GuiGWUPr+=6GD4Om=zg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGu_V_EGcPQ+F_Z73cMCAcFPoM-GuiGWUPr+=6GD4Om=zg@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-Mailman-Approved-At: Wed, 07 Oct 2020 15:39:39 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Tim Murray <timmurray@google.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/06/20 13:04, Rob Clark wrote:
> On Tue, Oct 6, 2020 at 3:59 AM Qais Yousef <qais.yousef@arm.com> wrote:
> >
> > On 10/05/20 16:24, Rob Clark wrote:
> >
> > [...]
> >
> > > > RT planning and partitioning is not easy task for sure. You might want to
> > > > consider using affinities too to get stronger guarantees for some tasks and
> > > > prevent cross-talking.
> > >
> > > There is some cgroup stuff that is pinning SF and some other stuff to
> > > the small cores, fwiw.. I think the reasoning is that they shouldn't
> > > be doing anything heavy enough to need the big cores.
> >
> > Ah, so you're on big.LITTLE type of system. I have done some work which enables
> > biasing RT tasks towards big cores and control the default boost value if you
> > have util_clamp and schedutil enabled. You can use util_clamp in general to
> > help with DVFS related response time delays.
> >
> > I haven't done any work to try our best to pick a small core first but fallback
> > to big if there's no other alternative.
> >
> > It'd be interesting to know how often you end up on a big core if you remove
> > the affinity. The RT scheduler picks the first cpu in the lowest priority mask.
> > So it should have this bias towards picking smaller cores first if they're
> > in the lower priority mask (ie: not running higher priority RT tasks).
> 
> fwiw, the issue I'm looking at is actually at the opposite end of the
> spectrum, less demanding apps that let cpus throttle down to low
> OPPs.. which stretches out the time taken at each step in the path
> towards screen (which seems to improve the odds that we hit priority
> inversion scenarios with SCHED_FIFO things stomping on important CFS
> things)

So you do have the problem of RT task preempting an important CFS task.

> 
> There is a *big* difference in # of cpu cycles per frame between
> highest and lowest OPP..

To combat DVFS related delays, you can use util clamp.

Hopefully this article helps explain it if you didn't come across it before

	https://lwn.net/Articles/762043/

You can use sched_setattr() to set SCHED_FLAG_UTIL_CLAMP_MIN for a task. This
will guarantee everytime this task is running it'll appear it has at least
this utilization value, so schedutil governor (which must be used for this to
work) will pick up the right performance point (OPP).

The scheduler will try its best to make sure that the task will run on a core
that meets the minimum requested performance point (hinted by setting
uclamp_min).

Thanks

--
Qais Yousef
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
