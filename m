Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A83A8286532
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 18:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1BE6E95B;
	Wed,  7 Oct 2020 16:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 36BDB8932B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 16:30:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63A661FB;
 Wed,  7 Oct 2020 09:30:14 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 094943F66B;
 Wed,  7 Oct 2020 09:30:12 -0700 (PDT)
Date: Wed, 7 Oct 2020 17:30:10 +0100
From: Qais Yousef <qais.yousef@arm.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
Message-ID: <20201007163010.bfgst6xfvkn2lzrk@e107158-lin.cambridge.arm.com>
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <20201002110105.e56qrvzoqfioi4hs@e107158-lin.cambridge.arm.com>
 <CAF6AEGvWMvZuy7CcGhzUSbwGtEkrNkzWHu_BN1cbdBJdZtvevA@mail.gmail.com>
 <20201005150024.mchfdtd62rlkuh4s@e107158-lin.cambridge.arm.com>
 <CAF6AEGs7NmCPyLdg+gg5jTTe-wgi2myRQ80tum6odv6tLLQ0DQ@mail.gmail.com>
 <20201006105918.v3xspb6xasjyy5ky@e107158-lin.cambridge.arm.com>
 <CAF6AEGu_V_EGcPQ+F_Z73cMCAcFPoM-GuiGWUPr+=6GD4Om=zg@mail.gmail.com>
 <20201007103653.qjohhta7douhlb22@e107158-lin.cambridge.arm.com>
 <CAF6AEGsA_enFOUkV4Rw=Sxyjf=_oFLjwbz-Y4jTO=TUraOCzVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGsA_enFOUkV4Rw=Sxyjf=_oFLjwbz-Y4jTO=TUraOCzVQ@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-Mailman-Approved-At: Wed, 07 Oct 2020 16:49:03 +0000
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

On 10/07/20 08:57, Rob Clark wrote:
> Yeah, I think we will end up making some use of uclamp.. there is
> someone else working on that angle
> 
> But without it, this is a case that exposes legit prioritization
> problems with commit_work which we should fix ;-)

I wasn't suggesting this as an alternative to fixing the other problem. But it
seemed you had a different problem here that I thought I could help with :-)

I did give my opinion about how to handle that priority issue. If the 2 threads
are kernel threads and by design they need relative priorities IMO the kernel
need to be taught to set this relative priority. It seemed the vblank worker
could run as SCHED_DEADLINE. If this works, then the priority problem for
commit_work disappears as SCHED_DEADLINE will preempt RT. If commit_work uses
sched_set_fifo(), its priority will be 50, hence your SF threads can no longer
preempt it. And you can manage the SF threads to be any value you want relative
to 50 anyway without having to manage commit_work itself.

I'm not sure if you have problems with RT tasks preempting important CFS
tasks. My brain registered two conflicting statements.

Thanks

--
Qais Yousef
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
