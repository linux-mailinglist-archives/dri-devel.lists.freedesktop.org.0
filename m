Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C2C36F4C7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 06:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DC46E455;
	Fri, 30 Apr 2021 04:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7006E455;
 Fri, 30 Apr 2021 04:11:19 +0000 (UTC)
IronPort-SDR: iuD6L89Iuzmxi2ZGNlg+wN28ySh9BtZIx02CkL4PWIuKh9NsTEycEKDg3aTy6LWed80bqg6WrX
 Gppny1xCEdxg==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="197238345"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="197238345"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 21:11:17 -0700
IronPort-SDR: BR8pofiamQLjBz0PrMKvuhXMhmszYARRSae1g29YS8fNCy7xKHShqQ8ejBz/3R/9C7e4fHKgly
 KLwbk6CVdFoA==
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="424670486"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 21:11:17 -0700
Date: Thu, 29 Apr 2021 21:03:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 08/21] drm/i915/gem: Disallow bonding of
 virtual engines
Message-ID: <20210430040348.GA27630@sdutt-i7>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-9-jason@jlekstrand.net>
 <CAOFGe958Y6eq1qcPPS-h8Swca8kMy39Vp-gGv6irXdS_8xje5w@mail.gmail.com>
 <YIk1YEXjvaDN+feW@phenom.ffwll.local>
 <CAOFGe97PUT8Ns0bVhHi6D+21yA3=v0QkhdmmKBm=dCn4CizwiA@mail.gmail.com>
 <20210428171853.GA3260@sdutt-i7>
 <CAOFGe96Qy8hXsJCemgDJtZYCbwqxvUS4j-SEKKnLQjE6dmRP2w@mail.gmail.com>
 <20210428175525.GA7224@sdutt-i7>
 <CAOFGe96i7GPvQ8yDreTGF-K5pr_GRNkofQhH7W6Wxr-F8qmxrQ@mail.gmail.com>
 <YIqjG9l30ZmuN1Wg@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIqjG9l30ZmuN1Wg@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 02:14:19PM +0200, Daniel Vetter wrote:
> On Wed, Apr 28, 2021 at 01:17:27PM -0500, Jason Ekstrand wrote:
> > On Wed, Apr 28, 2021 at 1:02 PM Matthew Brost <matthew.brost@intel.com> wrote:
> > >
> > > On Wed, Apr 28, 2021 at 12:46:07PM -0500, Jason Ekstrand wrote:
> > > > On Wed, Apr 28, 2021 at 12:26 PM Matthew Brost <matthew.brost@intel.com> wrote:
> > > > > Jumping on here mid-thread. For what is is worth to make execlists work
> > > > > with the upcoming parallel submission extension I leveraged some of the
> > > > > existing bonding code so I wouldn't be too eager to delete this code
> > > > > until that lands.
> > > >
> > > > Mind being a bit more specific about that?  The motivation for this
> > > > patch is that the current bonding handling and uAPI is, well, very odd
> > > > and confusing IMO.  It doesn't let you create sets of bonded engines.
> > > > Instead you create engines and then bond them together after the fact.
> > > > I didn't want to blindly duplicate those oddities with the proto-ctx
> > > > stuff unless they were useful.  With parallel submit, I would expect
> > > > we want a more explicit API where you specify a set of engine
> > > > class/instance pairs to bond together into a single engine similar to
> > > > how the current balancing API works.
> > > >
> > > > Of course, that's all focused on the API and not the internals.  But,
> > > > again, I'm not sure how we want things to look internally.  What we've
> > > > got now doesn't seem great for the GuC submission model but I'm very
> > > > much not the expert there.  I don't want to be working at cross
> > > > purposes to you and I'm happy to leave bits if you think they're
> > > > useful.  But I thought I was clearing things away so that you can put
> > > > in what you actually want for GuC/parallel submit.
> > > >
> > >
> > > Removing all the UAPI things are fine but I wouldn't delete some of the
> > > internal stuff (e.g. intel_virtual_engine_attach_bond, bond
> > > intel_context_ops, the hook for a submit fence, etc...) as that will
> > > still likely be used for the new parallel submission interface with
> > > execlists. As you say the new UAPI wont allow crazy configurations,
> > > only simple ones.
> > 
> > I'm fine with leaving some of the internal bits for a little while if
> > it makes pulling the GuC scheduler in easier.  I'm just a bit
> > skeptical of why you'd care about SUBMIT_FENCE. :-)  Daniel, any
> > thoughts?
> 
> Yeah I'm also wondering why we need this. Essentially your insight (and
> Tony Ye from media team confirmed) is that media umd never uses bonded on
> virtual engines.
>

Well you should use virtual engines with parallel submission interface 
if are you using it correctly.

e.g. You want a 2 wide parallel submission and there are 4 engine
instances.

You'd create 2 VEs:

A: 0, 2
B: 1, 3
set_parallel

For GuC submission we just configure context and the GuC load balances
it.

For execlists we'd need to create bonds.

Also likely the reason virtual engines wasn't used with the old
interface was we only had 2 instances max per class so no need for
virtual engines. If they used it for my above example if they were using
the interface correctly they would have to use virtual engines too.
 
> So the only thing we need is the await_fence submit_fence logic to stall
> the subsequent patches just long enough. I think that stays.
>

My implementation, for the new parallel submission interface, with
execlists used a bonds + priority boosts to ensure both are present at
the same time. This was used for both non-virtual and virtual engines.
This was never reviewed though and the code died on the list.

> All the additional logic with the cmpxchg lockless trickery and all that
> isn't needed, because we _never_ have to select an engine for bonded
> submission: It's always the single one available.
> 
> This would mean that for execlist parallel submit we can apply a
> limitation (beyond what GuC supports perhaps) and it's all ok. With that
> everything except the submit fence await logic itself can go I think.
> 
> Also one for Matt: We decided to ZBB implementing parallel submit on
> execlist, it's going to be just for GuC. At least until someone starts
> screaming really loudly.

If this is the case, then bonds can be deleted.

Matt

> 
> Cheers, Daniel
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
