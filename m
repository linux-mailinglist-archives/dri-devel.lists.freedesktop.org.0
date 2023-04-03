Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 354CD6D4E57
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 18:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035D910E527;
	Mon,  3 Apr 2023 16:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBCF10E51D;
 Mon,  3 Apr 2023 16:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680540540; x=1712076540;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rY/qfL2q1fSHFFVWdRI+1yAw3wVCMIvaKs/T2SwW/aE=;
 b=eyUN+mNfT9DehX956FMpOeR4PU0KXrmAqbTG0L4k3hy4ik7JzipHN/eF
 wpx8dwyvBHBFWxRtWCQsT9XFwYqU2h/8PvJ48h8WljQlFb4FoWTqT+Ux/
 HLpeSjRFWn1AilhYUv4N5ZOEAOXr3+EONZntLCKwGJaFKphSZ2aZabED8
 kjU/FUZgd4kYNmat5KbvH4k0s/yLu1CZS1Q3IMCCaJlgxDjixJT0gVKq+
 fAsV2SDrP8AyOZG7FP8hLPuEEYk+nb03B1qn4cccM7lFeOB9qfT9hE9RY
 RgE7To6PMTxCBahoeC2lUcaUeT914L13dWE+/2HIZv0ggM2qdJCt9XK7W g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="322352058"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="322352058"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 09:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829626990"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="829626990"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga001.fm.intel.com with SMTP; 03 Apr 2023 09:48:40 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 Apr 2023 19:48:40 +0300
Date: Mon, 3 Apr 2023 19:48:40 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 7/7] drm/i915: Allow user to set cache at BO creation
Message-ID: <ZCsDaDzyOyu9mYU3@intel.com>
References: <20230401063830.438127-1-fei.yang@intel.com>
 <20230401063830.438127-8-fei.yang@intel.com>
 <ZCr4gB8Q75+QWr19@intel.com>
 <20230403163532.GT4085390@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230403163532.GT4085390@mdroper-desk1.amr.corp.intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>, dri-devel@lists.freedesktop.org,
 fei.yang@intel.com, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 03, 2023 at 09:35:32AM -0700, Matt Roper wrote:
> On Mon, Apr 03, 2023 at 07:02:08PM +0300, Ville Syrjälä wrote:
> > On Fri, Mar 31, 2023 at 11:38:30PM -0700, fei.yang@intel.com wrote:
> > > From: Fei Yang <fei.yang@intel.com>
> > > 
> > > To comply with the design that buffer objects shall have immutable
> > > cache setting through out its life cycle, {set, get}_caching ioctl's
> > > are no longer supported from MTL onward. With that change caching
> > > policy can only be set at object creation time. The current code
> > > applies a default (platform dependent) cache setting for all objects.
> > > However this is not optimal for performance tuning. The patch extends
> > > the existing gem_create uAPI to let user set PAT index for the object
> > > at creation time.
> > 
> > This is missing the whole justification for the new uapi.
> > Why is MOCS not sufficient?
> 
> PAT and MOCS are somewhat related, but they're not the same thing.  The
> general direction of the hardware architecture recently has been to
> slowly dumb down MOCS and move more of the important memory/cache
> control over to the PAT instead.  On current platforms there is some
> overlap (and MOCS has an "ignore PAT" setting that makes the MOCS "win"
> for the specific fields that both can control), but MOCS doesn't have a
> way to express things like snoop/coherency mode (on MTL), or class of
> service (on PVC).  And if you check some of the future platforms, the
> hardware design starts packing even more stuff into the PAT (not just
> cache behavior) which will never be handled by MOCS.

Sigh. So the hardware designers screwed up MOCS yet again and
instead of getting that fixed we are adding a new uapi to work
around it?

The IMO sane approach (which IIRC was the situation for a few
platform generations at least) is that you just shove the PAT
index into MOCS (or tell it to go look it up from the PTE).
Why the heck did they not just stick with that?

> 
> Also keep in mind that MOCS generally applies at the GPU instruction
> level; although a lot of instructions have a field to provide a MOCS
> index, or can use a MOCS already associated with a surface state, there
> are still some that don't. PAT is the source of memory access
> characteristics for anything that can't provide a MOCS directly.

So what are the things that don't have MOCS and where we need
some custom cache behaviour, and we already know all that at
buffer creation time?

-- 
Ville Syrjälä
Intel
