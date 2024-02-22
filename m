Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BCB860558
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 23:03:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C9210EA9D;
	Thu, 22 Feb 2024 22:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ha9ClGg0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD64010EA9D;
 Thu, 22 Feb 2024 22:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708639414; x=1740175414;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2bWLD0gAzSAswzGVkZR88xSzDcgMwjQhkt761LIirtA=;
 b=ha9ClGg08ApQCh8++WMCrtrsVA8ZKpB2k+TtxGT6C/CnP+8DupbTqglV
 aDokbd4pGb9L5HQ4T6gcOiTw0WEMXOx6FVwv+NtP2JXce72bT864G2Q7J
 5D3cAcc0iKE1TnevfYiL0bYXkvZ5grq+JgSKiTOawyttFVu7sMquL2HZ6
 K2ci6D/XjYX//jfPCCSNjQ0vrhSaFHroc+Z++3gBIZdAxK0tx/8AmdpZZ
 l8C6NTGjq8LABsn0E8EO41Y53SbRgxAL3Dbm+/O+zi8pn7Cf7Y7gkHTpr
 R9rXvwuabp4WqIrrRvqBJ/QYIMIu5eFlw5ENhBqN1FhM9YB6R0MwWs0fj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="28340410"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="28340410"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 14:03:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="936910190"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="936910190"
Received: from nkomlevx-mobl.ccr.corp.intel.com (HELO intel.com)
 ([10.246.32.165])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 14:03:30 -0800
Date: Thu, 22 Feb 2024 23:03:27 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 John Harrison <John.C.Harrison@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 stable@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 2/2] drm/i915/gt: Enable only one CCS for compute
 workload
Message-ID: <ZdfEr2AyPNaq2Xh_@ashyti-mobl2.lan>
References: <20240220143526.259109-1-andi.shyti@linux.intel.com>
 <20240220143526.259109-3-andi.shyti@linux.intel.com>
 <20240220233918.GG5347@mdroper-desk1.amr.corp.intel.com>
 <ZdU_4okr8GcSpTtm@ashyti-mobl2.lan>
 <20240221205104.GM718896@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221205104.GM718896@mdroper-desk1.amr.corp.intel.com>
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

Hi Matt,

first of all thanks a lot for the observations you are raising.

On Wed, Feb 21, 2024 at 12:51:04PM -0800, Matt Roper wrote:
> On Wed, Feb 21, 2024 at 01:12:18AM +0100, Andi Shyti wrote:
> > On Tue, Feb 20, 2024 at 03:39:18PM -0800, Matt Roper wrote:
> > > On Tue, Feb 20, 2024 at 03:35:26PM +0100, Andi Shyti wrote:

...

> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> > > > index a425db5ed3a2..e19df4ef47f6 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> > > > @@ -168,6 +168,14 @@ static void init_unused_rings(struct intel_gt *gt)
> > > >  	}
> > > >  }
> > > >  
> > > > +static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
> > > > +{
> > > > +	if (!IS_DG2(gt->i915))
> > > > +		return;
> > > > +
> > > > +	intel_uncore_write(gt->uncore, XEHP_CCS_MODE, 0);
> > > 
> > > This doesn't look right to me.  A value of 0 means every cslice gets
> > > associated with CCS0.
> > 
> > Yes, that's what I'm trying to do. The behavior I'm looking for
> > is this one:
> > 
> > 	 /*
> > 	  ...
> >           * With 1 engine (ccs0):
> >           *   slice 0, 1, 2, 3: ccs0
> >           *
> >           * With 2 engines (ccs0, ccs1):
> >           *   slice 0, 2: ccs0
> >           *   slice 1, 3: ccs1
> >           *
> >           * With 4 engines (ccs0, ccs1, ccs2, ccs3):
> >           *   slice 0: ccs0
> >           *   slice 1: ccs1
> >           *   slice 2: ccs2
> >           *   slice 3: ccs3
> > 	  ...
> > 	  */
> > 
> > where the user can configure runtime the mode, making sure that
> > no client is connected to i915.
> > 
> > But, this needs to be written 
> > 
> > As we are now forcing mode '1', then all cslices are connected
> > with ccs0.
> 
> Right --- and that's what I'm pointing out as illegal.  I think that
> code comment above was taken out of context from a different RFC series;
> that's not an accurate description of the behavior we want here.
> 
> First, the above comment is using ccs# to refer to userspace engines,
> not hardware engines.  As a simple example, DG2-G11 only ever has a
> single CCS which userspace sees as "instance 0" but which is actually
> CCS1 at the hardware level.  If you try to follow the comment above when
> programming CCS_MODE, you've assigned all of the cslices to a
> non-existent engine and assigned no cslices to the CCS engine that
> actually exists.  For DG2-G10 (and I think DG2-G12), there are different
> combinations of fused-off / not-fused-off engines that will always show
> up in userspace as CCS0-CCSn, even if those don't match the hardware
> IDs.
> 
> Second, the above comment is assuming that you have a part with a
> maximum fusing config (i.e., all cslices present).  Using DG2-G11 again
> as an example, there's also only a single cslice (cslice1), so if you
> tell CCS1 that it's allowed to use EUs from non-existent cslice0,
> cslice2, and cslice3, you might not get the behavior you were hoping
> for.

if the hardware slices are fused off we wouldn't see them in a
first place, right? And that's anyway a permanent configuration
that wouldn't affect the patch.

BTW, is there any machine I can test this scenario?

> > > On a DG2-G11 platform, that will flat out break
> > > compute since CCS0 is never present (G11 only has a single CCS and it's
> > > always the hardware's CCS1).  Even on a G10 or G12 this could also break
> > > things depending on the fusing of your card if the hardware CCS0 happens
> > > to be missing.
> > > 
> > > Also, the register says that we need a field value of 0x7 for each
> > > cslice that's fused off.  By passing 0, we're telling the CCS engine
> > > that it can use cslices that may not actually exist.
> > 
> > does it? Or do I need to write the id (0x0-0x3) of the user
> > engine? That's how the mode is calculated in this algorithm.
> 
> 0x0 - 0x3 are how you specify that a specific CCS engine can use the
> cslice.  If the cslice can't be used at all (i.e., it's fused off), then
> you need to program a 0x7 to ensure no engines try to use the
> non-existent DSS/EUs.

I planned to limit this to the only DG2 (and ATSM, of course).
Do you think it would it help?

Andi
