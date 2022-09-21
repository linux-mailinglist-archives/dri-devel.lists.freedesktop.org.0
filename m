Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B98C95E53E9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 21:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275E910E0EA;
	Wed, 21 Sep 2022 19:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F25510E0EA;
 Wed, 21 Sep 2022 19:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663789426; x=1695325426;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9xsIRo49/cmAmKUaqNNyG0Tuko+qU0dN8U/eyshmog0=;
 b=COHQg3PygvMRKMQIAcO84LPyNj4+PehDJwEp1jPayGbSUTvpHtmWkk7I
 /NQUWLMdFTgpbYngryRjeZY5pkdIO91Ljokc82oC9r1jjF9aG9ctcF+vr
 amsTOL2yqoPYZhLd8G+y49a1CVcsHVOENhQGNvwtwzT2IxMuEbN8mPo0D
 4snbDhzHW66rnWYKulYd0c0g5oiTHucnXc/rn1qHm9cfRzJv1spQEE9Gr
 D2C02LEnauNo9TkeY7jlhP4YUbWd1ABGWt6KetkRGuMKhGiKe6FbIN+U7
 bRYHHtocOK9XioYre42cSJIDf2v4FHNXXUY4bVh5eRVtVzMf1CU44Z/gR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="301511650"
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; d="scan'208";a="301511650"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 12:43:46 -0700
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; d="scan'208";a="614937103"
Received: from pkumarva-server.jf.intel.com (HELO intel.com) ([10.165.21.199])
 by orsmga007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 12:43:45 -0700
Date: Wed, 21 Sep 2022 15:46:00 -0400
From: "Kumar Valsan, Prathap" <prathap.kumar.valsan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Split GAM and MSLICE steering
Message-ID: <20220921194600.GS7822@intel.com>
References: <20220916014345.3317739-1-matthew.d.roper@intel.com>
 <e5e70c4f-93af-a903-9bf0-df283b6e7eb9@linux.intel.com>
 <YySN9FWpDxKPRlld@mdroper-desk1.amr.corp.intel.com>
 <20220921165808.GR7822@intel.com>
 <YytlWVMl7fe9EYm3@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YytlWVMl7fe9EYm3@mdroper-desk1.amr.corp.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 21, 2022 at 12:26:17PM -0700, Matt Roper wrote:
> On Wed, Sep 21, 2022 at 12:58:08PM -0400, Kumar Valsan, Prathap wrote:
> > On Fri, Sep 16, 2022 at 07:53:40AM -0700, Matt Roper wrote:
> > > On Fri, Sep 16, 2022 at 10:02:32AM +0100, Tvrtko Ursulin wrote:
> > > > 
> > > > On 16/09/2022 02:43, Matt Roper wrote:
> > > > > Although the bspec lists several MMIO ranges as "MSLICE," it turns out
> > > > > that a subset of these are of a "GAM" subclass that has unique rules and
> > > > > doesn't followed regular mslice steering behavior.
> > > > > 
> > > > >   * Xe_HP SDV:  GAM ranges must always be steered to 0,0.  These
> > > > >     registers share the regular steering control register (0xFDC) with
> > > > >     other steering types
> > > > > 
> > > > >   * DG2:  GAM ranges must always be steered to 1,0.  GAM registers have a
> > > > >     dedicated steering control register (0xFE0) so we can set the value
> > > > >     once at startup and rely on implicit steering.  Technically the
> > > > >     hardware default should already be set to 1,0 properly, but it never
> > > > >     hurts to ensure that in the driver.
> > > > 
> > > > Do you have any data on whether the "technically should" holds in practice?
> > > > What would be the consequences of some platform/machine surprising us here?
> > > 
> > > The bspec indicates the hardware default value is already the necessary
> > > 1,0 value; I'm mostly paranoid about some kind of boot firmware wiping
> > > it to 0,0 by accident.  I don't have any evidence that has ever actually
> > > happened, but explicitly re-programming it to 1,0 in the patch here is a
> > > defensive measure just to be safe.
> > > 
> > > If we didn't have this patch _and_ some firmware screwed up the GAM
> > > steering target, then presumably we might read back garbage or 0 from
> > > GAM registers in places where we should have received a real value.
> > Will firmware ever touch the steering target registers. As i was going
> > through the respective hsd. The software driver impact is marked as none
> > so wondering if this change is really required ?
> 
> The GAM only has a dedicated steering register on DG2; on XEHPSDV it
> shares 0xFDC with all the other kinds of steering, so it is important to
> handle this range independently of the MSLICE range and make sure we
> properly re-steer GAM accesses to the primary instance (and not just any
> random MSLICE) there.
Ok. I missed that part.
> 
> On DG2, if we assume firmware behaves properly, the dedicated steering
> register is initialized properly and we don't need to explicitly
> re-steer.  However this patch will ensure that we don't needlessly
> re-program 0xFDC according to MSLICE rules when accessing a GAM
> register.
> 
> There's also the worry that firmware may try to "sanitize" the registers
> at startup by programming them to what it thinks are appropriate default
> values.  Given that DG2's primary GAM is unusual (instance 1, instead of
> instance 0 as on other platforms), this feels like a place where
> firmware bugs could creep in.  They hopefully/probably won't, but
> ensuring we forcefully initialize 0xFE0 to the proper value just ensures
> that we don't even have to worry about it.
Got it.
> 
> Finally, splitting the GAM from MSLICE ensures we get more accurate
> debug messages from the drm_printer in dmesg and debugfs.
> 
Looks good to me.

Reviewed-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> 
> Matt
> 
> > 
> > Thanks,
> > Prathap
> > > 
> > > 
> > > Matt
> > > 
> > > > 
> > > > Regards,
> > > > 
> > > > Tvrtko
> > > > 
> > > > > 
> > > > > Bspec: 66534
> > > > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > > > ---
> > > > >   drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 24 +++++++++++++++++++--
> > > > >   drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  1 +
> > > > >   drivers/gpu/drm/i915/gt/intel_gt_types.h    |  1 +
> > > > >   drivers/gpu/drm/i915/gt/intel_workarounds.c | 10 +++++++++
> > > > >   4 files changed, 34 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > > index e79405a45312..a2047a68ea7a 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > > > > @@ -40,6 +40,7 @@ static const char * const intel_steering_types[] = {
> > > > >   	"L3BANK",
> > > > >   	"MSLICE",
> > > > >   	"LNCF",
> > > > > +	"GAM",
> > > > >   	"INSTANCE 0",
> > > > >   };
> > > > > @@ -48,14 +49,23 @@ static const struct intel_mmio_range icl_l3bank_steering_table[] = {
> > > > >   	{},
> > > > >   };
> > > > > +/*
> > > > > + * Although the bspec lists more "MSLICE" ranges than shown here, some of those
> > > > > + * are of a "GAM" subclass that has special rules.  Thus we use a separate
> > > > > + * GAM table farther down for those.
> > > > > + */
> > > > >   static const struct intel_mmio_range xehpsdv_mslice_steering_table[] = {
> > > > > -	{ 0x004000, 0x004AFF },
> > > > > -	{ 0x00C800, 0x00CFFF },
> > > > >   	{ 0x00DD00, 0x00DDFF },
> > > > >   	{ 0x00E900, 0x00FFFF }, /* 0xEA00 - OxEFFF is unused */
> > > > >   	{},
> > > > >   };
> > > > > +static const struct intel_mmio_range xehpsdv_gam_steering_table[] = {
> > > > > +	{ 0x004000, 0x004AFF },
> > > > > +	{ 0x00C800, 0x00CFFF },
> > > > > +	{},
> > > > > +};
> > > > > +
> > > > >   static const struct intel_mmio_range xehpsdv_lncf_steering_table[] = {
> > > > >   	{ 0x00B000, 0x00B0FF },
> > > > >   	{ 0x00D800, 0x00D8FF },
> > > > > @@ -114,9 +124,15 @@ void intel_gt_mcr_init(struct intel_gt *gt)
> > > > >   	} else if (IS_DG2(i915)) {
> > > > >   		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
> > > > >   		gt->steering_table[LNCF] = dg2_lncf_steering_table;
> > > > > +		/*
> > > > > +		 * No need to hook up the GAM table since it has a dedicated
> > > > > +		 * steering control register on DG2 and can use implicit
> > > > > +		 * steering.
> > > > > +		 */
> > > > >   	} else if (IS_XEHPSDV(i915)) {
> > > > >   		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
> > > > >   		gt->steering_table[LNCF] = xehpsdv_lncf_steering_table;
> > > > > +		gt->steering_table[GAM] = xehpsdv_gam_steering_table;
> > > > >   	} else if (GRAPHICS_VER(i915) >= 11 &&
> > > > >   		   GRAPHICS_VER_FULL(i915) < IP_VER(12, 50)) {
> > > > >   		gt->steering_table[L3BANK] = icl_l3bank_steering_table;
> > > > > @@ -351,6 +367,10 @@ static void get_nonterminated_steering(struct intel_gt *gt,
> > > > >   		*group = __ffs(gt->info.mslice_mask) << 1;
> > > > >   		*instance = 0;	/* unused */
> > > > >   		break;
> > > > > +	case GAM:
> > > > > +		*group = IS_DG2(gt->i915) ? 1 : 0;
> > > > > +		*instance = 0;
> > > > > +		break;
> > > > >   	case INSTANCE0:
> > > > >   		/*
> > > > >   		 * There are a lot of MCR types for which instance (0, 0)
> > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > > > index 2275ee47da95..2343b26e0e21 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> > > > > @@ -42,6 +42,7 @@
> > > > >   #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
> > > > >   #define SF_MCR_SELECTOR				_MMIO(0xfd8)
> > > > >   #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
> > > > > +#define GAM_MCR_SELECTOR			_MMIO(0xfe0)
> > > > >   #define   GEN8_MCR_SLICE(slice)			(((slice) & 3) << 26)
> > > > >   #define   GEN8_MCR_SLICE_MASK			GEN8_MCR_SLICE(3)
> > > > >   #define   GEN8_MCR_SUBSLICE(subslice)		(((subslice) & 3) << 24)
> > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > > > > index f19c2de77ff6..30003d68fd51 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > > > > @@ -59,6 +59,7 @@ enum intel_steering_type {
> > > > >   	L3BANK,
> > > > >   	MSLICE,
> > > > >   	LNCF,
> > > > > +	GAM,
> > > > >   	/*
> > > > >   	 * On some platforms there are multiple types of MCR registers that
> > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > > > > index 6d2003d598e6..d04652a3b4e5 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > > > > +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > > > > @@ -1181,6 +1181,9 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
> > > > >   		gt->steering_table[MSLICE] = NULL;
> > > > >   	}
> > > > > +	if (IS_XEHPSDV(gt->i915) && slice_mask & BIT(0))
> > > > > +		gt->steering_table[GAM] = NULL;
> > > > > +
> > > > >   	slice = __ffs(slice_mask);
> > > > >   	subslice = intel_sseu_find_first_xehp_dss(sseu, GEN_DSS_PER_GSLICE, slice) %
> > > > >   		GEN_DSS_PER_GSLICE;
> > > > > @@ -1198,6 +1201,13 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
> > > > >   	 */
> > > > >   	__set_mcr_steering(wal, MCFG_MCR_SELECTOR, 0, 2);
> > > > >   	__set_mcr_steering(wal, SF_MCR_SELECTOR, 0, 2);
> > > > > +
> > > > > +	/*
> > > > > +	 * On DG2, GAM registers have a dedicated steering control register
> > > > > +	 * and must always be programmed to a hardcoded groupid of "1."
> > > > > +	 */
> > > > > +	if (IS_DG2(gt->i915))
> > > > > +		__set_mcr_steering(wal, GAM_MCR_SELECTOR, 1, 0);
> > > > >   }
> > > > >   static void
> > > 
> > > -- 
> > > Matt Roper
> > > Graphics Software Engineer
> > > VTT-OSGC Platform Enablement
> > > Intel Corporation
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> VTT-OSGC Platform Enablement
> Intel Corporation
