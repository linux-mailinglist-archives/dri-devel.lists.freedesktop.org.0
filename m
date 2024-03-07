Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55AD8757CE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 21:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BF010F69B;
	Thu,  7 Mar 2024 20:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B5lOPuK5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2307B11381B;
 Thu,  7 Mar 2024 20:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709841754; x=1741377754;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dBHrMs2pjMffipgnmu56a/VvK+7UcCZDn3xvMn1i9DY=;
 b=B5lOPuK5Wy6mg19em5h6EBNrj6QFnGBFXnyf6EzX5eDtYbu8ILSKNzsv
 dI7Nz4f4tRlALmC5kzrm//+Rrajln4jdFSRkusV2F7Rlmsz28ADddut8H
 GvH8OTbjHEIF9uKbL0Q332HUo7hDqSq1xLlO+4OB+OKB74guVP9nNw6Sf
 mu3LkepCob3AWlWPnd4zqxUumaDvz75Rxpev6IUtwnWYVlVmqsI9N8lvN
 WwNeD/wobnL/M0yC+lgswmNaBAPlc9E+r7KVwfBsyx+1VM4XVN+xHsJW3
 S/0x9D3PuvDRDwtCeAz8dq33Lpl4P1ZGEO/PoIYBB8jy1tsKa9T6Jzn0+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15945884"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="15945884"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:02:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="10670374"
Received: from unknown (HELO intel.com) ([10.247.118.98])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:02:24 -0800
Date: Thu, 7 Mar 2024 21:02:17 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 John Harrison <John.C.Harrison@intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v4 1/3] drm/i915/gt: Disable HW load balancing for CCS
Message-ID: <ZeodSUrgZXL_pjy0@ashyti-mobl2.lan>
References: <20240306012247.246003-1-andi.shyti@linux.intel.com>
 <20240306012247.246003-2-andi.shyti@linux.intel.com>
 <20240306234609.GF718896@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306234609.GF718896@mdroper-desk1.amr.corp.intel.com>
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

On Wed, Mar 06, 2024 at 03:46:09PM -0800, Matt Roper wrote:
> On Wed, Mar 06, 2024 at 02:22:45AM +0100, Andi Shyti wrote:
> > The hardware should not dynamically balance the load between CCS
> > engines. Wa_14019159160 recommends disabling it across all
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
> >  drivers/gpu/drm/i915/gt/intel_workarounds.c | 5 +++++
> >  2 files changed, 6 insertions(+)
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
> > index d67d44611c28..a2e78cf0b5f5 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > @@ -2945,6 +2945,11 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
> >  
> >  		/* Wa_18028616096 */
> >  		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0_UDW, UGM_FRAGMENT_THRESHOLD_TO_3);
> > +
> > +		/*
> > +		 * Wa_14019159160: disable the automatic CCS load balancing
> 
> I'm still a bit concerned that this doesn't really match what this
> specific workaround is asking us to do.  There seems to be an agreement
> on various internal email threads that we need to disable load
> balancing, but there's no single specific workaround that officially
> documents that decision.
> 
> This specific workaround asks us to do a bunch of different things, and
> the third item it asks for is to disable load balancing in very specific
> cases (i.e., while the RCS is active at the same time as one or more CCS
> engines).  Taking this workaround in isolation, it would be valid to
> keep load balancing active if you were just using the CCS engines and
> leaving the RCS idle, or if balancing was turned on/off by the GuC
> scheduler according to engine use at the moment, as the documented
> workaround seems to assume will be the case.
> 
> So in general I think we do need to disable load balancing based on
> other offline discussion, but blaming that entire change on
> Wa_14019159160 seems a bit questionable since it's not really what this
> specific workaround is asking us to do and someone may come back and try
> to "correct" the implementation of this workaround in the future without
> realizing there are other factors too.  It would be great if we could
> get hardware teams to properly document this expectation somewhere
> (either in a separate dedicated workaround, or in the MMIO tuning guide)
> so that we'll have a more direct and authoritative source for such a
> large behavioral change.

On one had I think you are right, on the other hand I think this
workaround has not properly developed in what we have been
describing later.

Perhaps, one solution would be to create a new generic workaround
for all platforms with more than one CCS and put everyone at
peace. But I don't know the process.

Are you able to help here? Or Joonas?

Thanks, Matt!
Andi
