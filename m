Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B847C41E13A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 20:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28D86E450;
	Thu, 30 Sep 2021 18:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5EC6E450;
 Thu, 30 Sep 2021 18:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DIZyZIMPtrZviYPUhA7kumW9iGvFHoustq8r9Fe4NwA=; b=ANGhMQtO5SO4GSrl/cTqqzLmBl
 0Nkd1VPrcFhNusU0EhzJ4symEhOwmuzxUBya+LLmbzKEYIMb9uBg/XiH/HPo9EfHZXzgmrDsjjO0q
 SaU2/4M1hJn/zey1tKkMQ5Uy5JcxJENFj5bxtF9DKdE0+d0n99nPSbDeyFITfHBgVMALtF6XAf7qt
 ZGsmM2bbxienMEeIxHfKLiaUBYOB0x5fZ23Lu4kn8f8ldNlmGC9yIvJbIq1RCbmiJA2KeKbrKJUSZ
 FvQKPT6mSuWQquEX+o80kolB7XoqRZkkkf25LNjwQPb6KHK49m2pLGwOx3ncifpSoiY+zIU4WGJrx
 HOM1P7xw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mW0rt-0070Cr-3g; Thu, 30 Sep 2021 18:33:17 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 643E6981431; Thu, 30 Sep 2021 20:33:16 +0200 (CEST)
Date: Thu, 30 Sep 2021 20:33:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [RFC 1/6] sched: Add nice value change notifier
Message-ID: <20210930183316.GC4323@worktop.programming.kicks-ass.net>
References: <20210930171552.501553-1-tvrtko.ursulin@linux.intel.com>
 <20210930171552.501553-2-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930171552.501553-2-tvrtko.ursulin@linux.intel.com>
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

On Thu, Sep 30, 2021 at 06:15:47PM +0100, Tvrtko Ursulin wrote:
>  void set_user_nice(struct task_struct *p, long nice)
>  {
>  	bool queued, running;
> -	int old_prio;
> +	int old_prio, ret;
>  	struct rq_flags rf;
>  	struct rq *rq;
>  
> @@ -6913,6 +6945,9 @@ void set_user_nice(struct task_struct *p, long nice)
>  	 */
>  	p->sched_class->prio_changed(rq, p, old_prio);
>  
> +	ret = atomic_notifier_call_chain(&user_nice_notifier_list, nice, p);
> +	WARN_ON_ONCE(ret != NOTIFY_DONE);
> +
>  out_unlock:
>  	task_rq_unlock(rq, p, &rf);
>  }

No, we're not going to call out to exported, and potentially unbounded,
functions under scheduler locks.
