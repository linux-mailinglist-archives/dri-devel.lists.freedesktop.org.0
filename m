Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39725153262
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 15:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1C56F5B3;
	Wed,  5 Feb 2020 14:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610B16F5B3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 14:01:39 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ED7AC293653;
 Wed,  5 Feb 2020 14:01:37 +0000 (GMT)
Date: Wed, 5 Feb 2020 15:01:34 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 1/2] drm/panfrost: Make sure MMU context lifetime is not
 bound to panfrost_priv
Message-ID: <20200205150134.340a72c8@collabora.com>
In-Reply-To: <b798bc8f-e8a9-01e9-e234-a8fdef290259@arm.com>
References: <20200204143504.135388-1-boris.brezillon@collabora.com>
 <b798bc8f-e8a9-01e9-e234-a8fdef290259@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Icecream95 <ixn@keemail.me>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 5 Feb 2020 13:39:21 +0000
Steven Price <steven.price@arm.com> wrote:

> On 04/02/2020 14:35, Boris Brezillon wrote:
> > Jobs can be in-flight when the file descriptor is closed (either because
> > the process did not terminate properly, or because it didn't wait for
> > all GPU jobs to be finished), and apparently panfrost_job_close() does
> > not cancel already running jobs. Let's refcount the MMU context object
> > so it's lifetime is no longer bound to the FD lifetime and running jobs
> > can finish properly without generating spurious page faults.  
> 
> Is there any good reason not to just make panfrost_job_close() kill off
> any running jobs?

Nope, I just didn't know how to do that without stopping all other jobs
(should have looked at how mali_kbase is doing that before posting this
patch :)).

> I'm not sure what the benefit is of allowing the jobs
> to still run after the file descriptor has closed.

None that I can think of.

> 
> In particular this could cause problems when(/if) Panfrost starts trying
> to deal with "compute" work loads that might have long runtimes. It's
> quite possible to produce a job which never (naturally) exits, currently
> we have a simplistic timeout which kills anything which doesn't complete
> promptly. However there is nothing conceptually wrong with a job which
> takes seconds (or even minutes) to complete.

Absolutely. That was also one of my concerns.

> The hardware has support
> for task switching ('soft stopping') between jobs so this can be done to
> prevent blocking other applications.

Okay. I guess it's implemented in mali_kbase. I'll have a look.

> 
> If panfrost_job_close() doesn't kill the jobs then removing the timeouts
> could lead to the situation where there is an 'infinite' job with no
> owner and no way of killing it off. Which doesn't seem like a great
> feature ;)

Didn't know you were planning to remove the timeouts.

> 
> Another approach could be simply to silence the page fault output in
> this case - switching the address space to UNMAPPED is actually an
> effective way of killing jobs - at some point I think this was a
> workaround to a hardware bug, but IIRC that was unreleased hardware :)

Okay. I'll check how it's done in mali_kbase.

Thanks for the feedback.

Boris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
