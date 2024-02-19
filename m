Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F85285A0CC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 11:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D2410E2BB;
	Mon, 19 Feb 2024 10:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQBrq7jh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698F510E29E;
 Mon, 19 Feb 2024 10:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708337854; x=1739873854;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Wo/cNfnRrJVS7u+9kX0Gzt5RyUK2/nq8mBV3ntj6ZzU=;
 b=MQBrq7jhFydFjm2Y8ZzWNlzYfu+kqzf0BcQ5bYEzRPd7jFAv8LkPfo9h
 g6rsAZxaDdsjnzHjaipe9V0LkmRvLhAjzY2brdEp+5A+ubBkdhByByVn4
 caS8NbKI5Ro9I2ma9exufT/3Xp0iKViA0uToLMnYRliUqQ6VM5FJlSaUJ
 nzNCwCqeDrwunYA9LzXD1APpmrFaLGoEv7LDRRvHtx54t1ZB8nCscfTXG
 LJGhTgO2vyeeUF3V3FYLUkaJ+SVpa37cRiaVcoH9fNqWXbJb3w2UW+3RP
 Xhc1F4yUqr9yHLBuNCiEfRebvom3ImHtKZidsVhHF47LqyLIHXnaZ+UAu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2533691"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2533691"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 02:17:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4609644"
Received: from samathah-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.246.48.149])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 02:17:31 -0800
Date: Mon, 19 Feb 2024 11:17:28 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 stable@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH 1/2] drm/i915/gt: Disable HW load balancing for CCS
Message-ID: <ZdMquCAXtNdbJHbW@ashyti-mobl2.lan>
References: <20240215135924.51705-1-andi.shyti@linux.intel.com>
 <20240215135924.51705-2-andi.shyti@linux.intel.com>
 <20240215165541.GJ718896@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215165541.GJ718896@mdroper-desk1.amr.corp.intel.com>
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

On Thu, Feb 15, 2024 at 08:55:41AM -0800, Matt Roper wrote:
> On Thu, Feb 15, 2024 at 02:59:23PM +0100, Andi Shyti wrote:
> > The hardware should not dynamically balance the load between CCS
> > engines. Wa_16016805146 recommends disabling it across all
> 
> Is this the right workaround number?  When I check the database, this
> workaround was rejected on both DG2-G10 and DG2-G11, and doesn't even
> have an entry for DG2-G12.
> 
> There are other workarounds that sound somewhat related to load
> balancing (e.g., part 3 of Wa_14019159160), but what's asked there is
> more involved than just setting one register bit and conflicts a bit
> with the second patch of this series.

thanks for checking it. Indeed the WA I mentioned is limited to
a specific platform. This recommendation comes in different WA,
e.g. this one: Wa_14019186972 (3rd point). Will start using that
as a reference.

Thank you.
Andi

> 
> 
> Matt
> 
> > platforms.
> > 
> > Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: <stable@vger.kernel.org> # v6.2+
> > ---
> >  drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 1 +
> >  drivers/gpu/drm/i915/gt/intel_workarounds.c | 6 ++++++
> >  2 files changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > index 50962cfd1353..cf709f6c05ae 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > @@ -1478,6 +1478,7 @@
> >  
> >  #define GEN12_RCU_MODE				_MMIO(0x14800)
> >  #define   GEN12_RCU_MODE_CCS_ENABLE		REG_BIT(0)
> > +#define   XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE	REG_BIT(1)
> >  
> >  #define CHV_FUSE_GT				_MMIO(VLV_GUNIT_BASE + 0x2168)
> >  #define   CHV_FGT_DISABLE_SS0			(1 << 10)
> > diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > index d67d44611c28..7f42c8015f71 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > @@ -2988,6 +2988,12 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
> >  		wa_mcr_masked_en(wal, GEN8_HALF_SLICE_CHICKEN1,
> >  				 GEN7_PSD_SINGLE_PORT_DISPATCH_ENABLE);
> >  	}
> > +
> > +	/*
> > +	 * Wa_16016805146: disable the CCS load balancing
> > +	 * indiscriminately for all the platforms
> > +	 */
> > +	wa_masked_en(wal, GEN12_RCU_MODE, XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE);
> >  }
> >  
> >  static void
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
