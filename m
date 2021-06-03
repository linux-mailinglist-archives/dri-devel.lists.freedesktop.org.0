Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EADD39A5EF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 18:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7056E578;
	Thu,  3 Jun 2021 16:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DC16E578;
 Thu,  3 Jun 2021 16:41:06 +0000 (UTC)
IronPort-SDR: BgrMoBvaVOFH9oG9VmNVyIsQBaEa2/bgWRNOM+y2krMdEPebn742r20VuMZaN4UUjVP0hm04H/
 R8n6GDPr5JRw==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="184461039"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="184461039"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 09:41:03 -0700
IronPort-SDR: e8EFhY8JVRXvbzMqfCbD+XRkjdcqZ6J3eUrRcipyS1lLXrSkB359hUqT9Xy2Phsyz1Zut+chdA
 5fVluh4vI/hA==
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="468027800"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 09:41:02 -0700
Date: Thu, 3 Jun 2021 09:34:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 00/97] Basic GuC submission support in
 the i915
Message-ID: <20210603163402.GA3830@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <de3965d8-d997-5685-0399-646d8823a27f@linux.intel.com>
 <20210525164504.GA9971@sdutt-i7>
 <d76ab0ec-4f0c-19ed-adaa-ed227af63c0e@linux.intel.com>
 <20210603041020.GA10469@sdutt-i7>
 <0e95011d-2b68-d215-c2aa-2c95c4e4c466@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e95011d-2b68-d215-c2aa-2c95c4e4c466@linux.intel.com>
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 03, 2021 at 09:51:19AM +0100, Tvrtko Ursulin wrote:
> 
> On 03/06/2021 05:10, Matthew Brost wrote:
> > On Wed, Jun 02, 2021 at 04:27:18PM +0100, Tvrtko Ursulin wrote:
> > > 
> > > On 25/05/2021 17:45, Matthew Brost wrote:
> 
> [snip]
> 
> > > > >    * Kludgy way of interfacing with rest of the driver instead of refactoring
> > > > > to fit (idling, breadcrumbs, scheduler, tasklets, ...).
> > > > > 
> > > > 
> > > > Idling and breadcrumbs seem clean to me. Scheduler + tasklet are going
> > > > away once the DRM scheduler lands. No need rework those as we are just
> > > > going to rework this again.
> > > 
> > > Well today I read the breadcrumbs patch and there is no way that's clean. It
> > > goes and creates one object per engine, then deletes them, replacing with
> > > GuC special one. All in the same engine setup. The same pattern of bolting
> > > on the GuC repeats too much for my taste.
> > > 
> > 
> > I don't think creating a default object /w a ref count then decrementing
> > the ref count + replacing it with a new object is that hard to
> > understand. IMO that is way better than how things worked previously
> 
> It's not about it being hard to understand, although it certainly is far
> from the usual patterns, but about it being lazy design which in normal
> times would never be allowed. Because reduced and flattened to highlight the
> principal complaint it looks like this:
> 
> engine_setup_for_each_engine:
>    engine->breadcrumbs = create_breadcrumbs();
>    if (guc) {
>       if (!first_class_engine) {
>         kfree(engine->breadcrumbs);
>         engine->breadcrumbs = first_class_engine->breadcrumbs;
>       } else {
>         first_class_engine->breadcrumbs->vfuncs = guc_vfuncs;
>       }
>    }
> 

I think are diving way to deep into individual patches on the cover
letter.

Agree this could be refactored bit more. Let me try a rework on this
patch in particular before this patch gets posted again.

Matt 

> What I suggested is that patch should not break and hack the object oriented
> design and instead could do along the lines:
> 
> gt_guc_setup:
>    for_each_class:
>       gt->uc.breadcrumbs[class] = create_guc_breadcrumbs();
> 
> engine_setup_for_each_engine:
>    if (guc)
>       engine->breadcrumbs = get(gt->uc.breadcrumbs[class]);
>    else
>       engine->breadcrumbs = create_breadcrumbs();
> 
> > where we just made implicit assumptions all over the driver of the
> > execlists backend behavior. If this was done properly in the current
> > i915 code base this really wouldn't be an issue.
> 
> Don't really follow you here but it probably goes back to how upstream code
> was there available to be refactored all this time.
> 
> Regards,
> 
> Tvrtko
