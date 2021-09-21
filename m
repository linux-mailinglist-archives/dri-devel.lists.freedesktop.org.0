Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F39413AD3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 21:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1364B6E948;
	Tue, 21 Sep 2021 19:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A124D6E948;
 Tue, 21 Sep 2021 19:33:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="220255993"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="220255993"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 12:33:36 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="701806817"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 12:33:35 -0700
Date: Tue, 21 Sep 2021 12:28:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: John Harrison <john.c.harrison@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
Subject: Re: [Intel-gfx] [PATCH 19/27] drm/i915: Fix bug in user
 proto-context creation that leaked contexts
Message-ID: <20210921192840.GA5239@jons-linux-dev-box>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-20-matthew.brost@intel.com>
 <008b1b3f-9aa8-fe64-a967-091f7170ded1@intel.com>
 <cf77f6d3-a941-a58a-9662-e3d132bcedde@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf77f6d3-a941-a58a-9662-e3d132bcedde@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 21, 2021 at 03:49:53PM +0100, Tvrtko Ursulin wrote:
> 
> On 20/09/2021 23:57, John Harrison wrote:
> > On 8/20/2021 15:44, Matthew Brost wrote:
> > > Set number of engines before attempting to create contexts so the
> > > function free_engines can clean up properly.
> > > 
> > > Fixes: d4433c7600f7 ("drm/i915/gem: Use the proto-context to handle
> > > create parameters (v5)")
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Cc: <stable@vger.kernel.org>
> > > ---
> > >   drivers/gpu/drm/i915/gem/i915_gem_context.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > index dbaeb924a437..bcaaf514876b 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > @@ -944,6 +944,7 @@ static struct i915_gem_engines
> > > *user_engines(struct i915_gem_context *ctx,
> > >       unsigned int n;
> > >       e = alloc_engines(num_engines);
> > This can return null when out of memory. There needs to be an early exit
> > check before dereferencing a null pointer. Not sure if that is a worse
> > bug or not than leaking memory! Either way, it would be good to fix that
> > too.
> 
> Pull out from the series and send a fix standalone ASAP? Also suggest adding

Sure, will do.

Matt

> author and reviewer to cc for typically quicker turnaround time.
> 
> Regards,
> 
> Tvrtko
> 
> 
> > John.
> > 
> > > +    e->num_engines = num_engines;
> > >       for (n = 0; n < num_engines; n++) {
> > >           struct intel_context *ce;
> > >           int ret;
> > > @@ -977,7 +978,6 @@ static struct i915_gem_engines
> > > *user_engines(struct i915_gem_context *ctx,
> > >               goto free_engines;
> > >           }
> > >       }
> > > -    e->num_engines = num_engines;
> > >       return e;
> > 
