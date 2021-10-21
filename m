Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F06C435A65
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 07:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0826EB39;
	Thu, 21 Oct 2021 05:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582BF6EB34;
 Thu, 21 Oct 2021 05:36:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="216113635"
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; d="scan'208";a="216113635"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 22:36:47 -0700
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; d="scan'208";a="632056808"
Received: from mstribae-mobl1.ger.corp.intel.com (HELO [10.249.254.146])
 ([10.249.254.146])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 22:36:46 -0700
Message-ID: <401588a77ff025c3ad85296f5ccaca9f1775abc6.camel@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: Increase timeout in
 requests perf selftest
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Thu, 21 Oct 2021 07:36:43 +0200
In-Reply-To: <bd22680e-1a4e-7a14-1ec9-d8301b6ab073@intel.com>
References: <20211011175704.28509-1-matthew.brost@intel.com>
 <bd22680e-1a4e-7a14-1ec9-d8301b6ab073@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Wed, 2021-10-20 at 13:34 -0700, John Harrison wrote:
> On 10/11/2021 10:57, Matthew Brost wrote:
> > perf_parallel_engines is micro benchmark to test i915 request
> > scheduling. The test creates a thread per physical engine and
> > submits
> > NOP requests and waits the requests to complete in a loop. In
> > execlists
> > mode this works perfectly fine as powerful CPU has enough cores to
> > feed
> > each engine and process the CSBs. With GuC submission the uC gets
> > overwhelmed as all threads feed into a single CTB channel and the
> > GuC
> > gets bombarded with CSBs as contexts are immediately switched in
> > and out
> > on the engines due to the zero runtime of the requests. When the
> > GuC is
> > overwhelmed scheduling of contexts is unfair due to the nature of
> > the
> > GuC scheduling algorithm. This behavior is understood and deemed
> > acceptable as this micro benchmark isn't close to real world use
> > case.
> > Increasing the timeout of wait period for requests to complete.
> > This
> > makes the test understand that is ok for contexts to get starved in
> > this
> > scenario.
> > 
> > A future patch / cleanup may just delete these micro benchmark
> > tests as
> > they basically mean nothing. We care about real workloads not made
> > up
> > ones.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

Also
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

I think one important thing to keep in mind here is that this selftest
actually *did* find a flaw, Albeit it upon analysis turned out not to
be significant.

But given that, user-space clients like, for example, gem_exec_suspend
seems to be able to trigger similar delays as well at least to some
extend with a huge amount of small requests submitted from user-space
we shold probably verify at some point that this isn't exploitable by a
malicious client starving other clients on the same system.

/Thomas


> 
> > ---
> >   drivers/gpu/drm/i915/selftests/i915_request.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c
> > b/drivers/gpu/drm/i915/selftests/i915_request.c
> > index d67710d10615..6496671a113c 100644
> > --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> > +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> > @@ -2805,7 +2805,7 @@ static int p_sync0(void *arg)
> >                 i915_request_add(rq);
> >   
> >                 err = 0;
> > -               if (i915_request_wait(rq, 0, HZ / 5) < 0)
> > +               if (i915_request_wait(rq, 0, HZ) < 0)
> >                         err = -ETIME;
> >                 i915_request_put(rq);
> >                 if (err)
> > @@ -2876,7 +2876,7 @@ static int p_sync1(void *arg)
> >                 i915_request_add(rq);
> >   
> >                 err = 0;
> > -               if (prev && i915_request_wait(prev, 0, HZ / 5) < 0)
> > +               if (prev && i915_request_wait(prev, 0, HZ) < 0)
> >                         err = -ETIME;
> >                 i915_request_put(prev);
> >                 prev = rq;
> 


