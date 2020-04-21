Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7050B1B20EB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 10:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE3A89C51;
	Tue, 21 Apr 2020 08:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CE089C51;
 Tue, 21 Apr 2020 08:04:26 +0000 (UTC)
IronPort-SDR: Q5VodBK95ngYoBehKOCsCAEUOSMZLHiX7q7ALsT1MCIOOd94yaxp6MgTgfqiRL8RuXTEstJGgn
 wPlKYnHc3MpQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 01:04:25 -0700
IronPort-SDR: IXYg6SSpX7hdQQVYD8yzR/2w4auXjkQzvqwIEzbZzpYPW8bvZRFwA/pTyh7Xua1RY7e4nWklLV
 I+8o6hz+v5Eg==
X-IronPort-AV: E=Sophos;i="5.72,409,1580803200"; d="scan'208";a="402113649"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.214.210.219])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 01:04:17 -0700
MIME-Version: 1.0
In-Reply-To: <20200420154216.GA1963@sultan-box.localdomain>
References: <20200407065210.GA263852@kroah.com>
 <20200407071809.3148-1-sultan@kerneltoast.com>
 <20200410090838.GD1691838@kroah.com>
 <20200410141738.GB2025@sultan-box.localdomain>
 <20200411113957.GB2606747@kroah.com>
 <158685210730.16269.15932754047962572236@build.alporthouse.com>
 <20200414082344.GA10645@kroah.com>
 <158737335977.8380.15005528012712372014@jlahtine-desk.ger.corp.intel.com>
 <20200420154216.GA1963@sultan-box.localdomain>
Subject: Re: [PATCH v2] drm/i915: Fix ref->mutex deadlock in i915_active_wait()
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Sultan Alsawaf <sultan@kerneltoast.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 21 Apr 2020 11:04:13 +0300
Message-ID: <158745625375.5265.15743487643543685929@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.8.1
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Greg KH <gregkh@linuxfoundation.org>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, stable@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sultan Alsawaf (2020-04-20 18:42:16)
> On Mon, Apr 20, 2020 at 12:02:39PM +0300, Joonas Lahtinen wrote:
> > I think the the patch should be dropped for now before the issue is
> > properly addressed. Either by backporting the mainline fixes or if
> > those are too big and there indeed is a smaller alternative patch
> > that is properly reviewed. But the above patch is not, at least yet.
> 
> Why should a fix for a bona-fide issue be dropped due to political reasons? This
> doesn't make sense to me. This just hurts miserable i915 users even more. If my
> patch is going to be dropped, it should be replaced by a different fix at the
> same time.

There's no politics involved. It's all about doing the due diligence
that we're fixing upstream bugs, and we're fixing them in a way that
does not cause regressions to other users.

Without being able to reproduce a bug against vanilla kernel, there's
too high of a risk that the patch that was developed will only work
on the downstream kernel it was developed for. That happens for the
best of the developers, and that is exactly why the process is in
place, to avoid human error. So no politics, just due diligence.

If you could provide bug reproduction instructions by filing a bug,
we can make forward progress in solving this issue. After assessing
the severity of the bug and the amount of users involved, it will
be prioritized accordingly. That is the most efficient way to get
attention to a bug.

> Also, the mainline fixes just *happen* to fix this deadlock by removing the
> mutex lock from the path in question and creating multiple other bugs in the
> process that had to be addressed with "Fixes:" commits. The regression potential
> was too high to include those patches for a "stable" kernel, so I made this
> patch which fixes the issue in the simplest way possible.

The thing is that it may be that the patch fixes the exact issue you
have at hand in the downstream kernel you are testing against. But
in doing so it may as well break other usecases for other users of
vanilla kernel. That is what we're trying to avoid.

With the reproduction instructions, it'll be possible to check which
kernel versions are affected, and after applying a fix to make sure
that the bug is gone from those version. And if the reproduction can
be trivialized to a test, we can introduce a regression check to CI.

A patch that claims to fix a deadlock in upstream kernel should
include that splat from upstream kernel, not a speculated chain.
Again, this is just the regular due diligence, because we have
made errors in the past. It is for those self-made errors we
know not to merge fixes too quickly before we are able to
reproduce the error and make sure it is gone.

It's not about where the patch came from, it's about avoiding
errors.

> We put this patch into
> Ubuntu now as well, because praying for a response from i915 maintainers while
> the 20.04 release was on the horizon was not an option.
> 
> > There is an another similar thread where there's jumping into
> > conclusions and doing ad-hoc patches for already fixed issues:
> > 
> > https://lore.kernel.org/dri-devel/20200414144309.GB2082@sultan-box.localdomain/
> 
> Maybe this wouldn't have happened if I had received a proper response for that
> issue on gitlab from the get-go... Instead I got the run-around from Chris
> claiming that it wasn't an i915 bug:
> 
> https://gitlab.freedesktop.org/drm/intel/issues/1599
> 
> > I appreciate enthusiasm to provide fixes to i915 but we should
> > continue do the regular due diligence to make sure we're properly
> > fixing bugs in upstream kernels. And when fixing them, to make
> > sure we're not simply papering over them for a single use case.
> > 
> > It would be preferred to file a bug for the seen issues,
> > describing how to reproduce them with vanilla upstream kernels:
> > 
> > https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs
> 
> gitlab.freedesktop.org/drm/intel is where bugs go to be neglected, as noted
> above. I really see no reason to send anything there anymore, when the vast
> majority of community-sourced bug reports go ignored.

In the above bug, you claim to be booting vanilla kernel but the splat
clearly says "5.4.28-00007-g64bb42e80256-dirty", so the developer correctly
requested to bisect the error between 5.4.27 and 5.4.28 vanilla kernels, which
you seem to have ignored and simply jumped to provide a patch.

Apologies if it feels like the bugs do not get enough attention, but we
do our best to act on the reported bugs. You can best guarantee that
your bug is getting the attention by providing all the details requested
in the above link.

Without that information, it'll be hard to assess the severity of the
bug. Above bug is missing critical pieces of information which help us
in assessing the severity: 1. Is the bug reproducible on drm-tip?
2. How to reproduce? 3. How often does it reproduce? 4. Which hardware?

If that information is missing, it means that that some of our
developers needs to find out all those bits of information before
we can even assess the severity of the bug. And as we also have
bugs where the information is present, those are often acted on
first.

Again, no politics involved and no praying needed. We just have a
process to follow to make sure we don't repeat our past mistakes
as it's only humans who work on the bugs. At times it may feel
rigid and not suited for the specific case where you feel there
is a shorter route to produce a fix, but following the bug process
helps us understand the problem and avoid trivial mistakes.

Regards, Joonas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
