Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECED280DD1
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 09:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C676E91C;
	Fri,  2 Oct 2020 07:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8E26E866;
 Thu,  1 Oct 2020 08:25:13 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1601540707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+xvOXvLyBhcZh28iSmIhtImffHIXHFigmRBOmHiNvSc=;
 b=JxdiFBScbyhL+2rSWc2dJraE+cBQoTZcjFfu7waNc5nZ+RIQE3pc5Px7zpPN48BQUVjpsy
 GK0di6MUV50qV1ANlXnhsr8qGaDXwxTgnPRGXmIGwLjdKk4LNAOsSTuaeU59iRkr53BMAr
 2RpdYmkHGqIvtXZSxR9FM/G12Jzkt6sSDxhEoZLF7/+YW4BatuIppVi1Df1pJZF4mf43GZ
 AqJtyNM8OdciXaxRg6XLyrKhfT8BTAYANYwcjizxLEsXuvKStNa4uYSUh8yy9X+hZ8555M
 PEzo7NNILM+vr/seispwSvj3Vn6mFwzKXlnFSd9tb3itoeCgdqVtKmVVpJhiiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1601540707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+xvOXvLyBhcZh28iSmIhtImffHIXHFigmRBOmHiNvSc=;
 b=mSaLvQC/HM+x5VEk0mzZYQb5fN5pd6UpdUVUe3141TsuNSllOAU41IVB7/QNyWBL54IH/L
 wQwUT1rqC7H7+dBA==
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, paulmck@kernel.org,
 rcu@vger.kernel.org
Subject: Re: [PATCH tip/core/rcu 11/15] drm/i915: Cleanup PREEMPT_COUNT
 leftovers
In-Reply-To: <160153665673.4398.6268028176406103680@jlahtine-mobl.ger.corp.intel.com>
References: <20200928233041.GA23230@paulmck-ThinkPad-P72>
 <20200928233102.24265-11-paulmck@kernel.org>
 <160153665673.4398.6268028176406103680@jlahtine-mobl.ger.corp.intel.com>
Date: Thu, 01 Oct 2020 10:25:06 +0200
Message-ID: <871riigxp9.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 02 Oct 2020 07:02:50 +0000
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
Cc: peterz@infradead.org, fweisbec@gmail.com, jiangshanlai@gmail.com,
 dri-devel@lists.freedesktop.org, oleg@redhat.com, dhowells@redhat.com,
 edumazet@google.com, joel@joelfernandes.org, mingo@kernel.org,
 David Airlie <airlied@linux.ie>, kernel-team@fb.com,
 "Paul E . McKenney" <paulmck@kernel.org>, intel-gfx@lists.freedesktop.org,
 josh@joshtriplett.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, mhocko@kernel.org,
 mgorman@techsingularity.net, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 01 2020 at 10:17, Joonas Lahtinen wrote:
> Quoting paulmck@kernel.org (2020-09-29 02:30:58)
>> CONFIG_PREEMPT_COUNT is now unconditionally enabled and will be
>> removed. Cleanup the leftovers before doing so.
>
> Change looks fine:
>
> Reviewed-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>
> Are you looking for us to merge or merge through another tree?
>
> If us, did the base patch always enabling PREEMPT_COUNT go into 5.9 or is
> it heading to 5.10? We can queue this earliest for 5.11 as drm-next closed
> for 5.10 at week of -rc5.

If at all it goes through rcu/tip because it depends on the earlier patches.

Thanks,

        tglx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
