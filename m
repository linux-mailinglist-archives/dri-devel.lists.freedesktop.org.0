Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B925751B4BD
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 02:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CEC10F35D;
	Thu,  5 May 2022 00:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55D910F35A;
 Thu,  5 May 2022 00:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651710899; x=1683246899;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Vyx8PwJFYdyw3Xm5V+SWm/wRzdl+NKwqcWLjCqoBFWI=;
 b=ElljHgtaZQAgQ+3hmdEDea/y8aVIvRxdKI+bZyzSTW9QvTra66/nbEBp
 C8RiuwsGbPelU/ASg6zIiUgFmcN4iV8Pg5Cnl3DhlYEbR31P0pSrf/5zL
 GZuZo6nq9VdeTFniu2wEpUDFfmSeuHQKrcDCSepqtvmmcIX1/50DYIVri
 clflC3LLZTnY0tJdvkiWVOYvlgMzBJz8wBLQojWwCGDudeczX9kV9fSC7
 ckaVsABoaRSer4zT50v0bczPhYewABTf2+27xp2bFQ5Xo2YtdO7QQVh8g
 wIs7sfkNN8NFXVoXCkTQliGmvxcHrJpYchuwYOMg7bR62LHEL1ar7w/Zs w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="293138635"
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; d="scan'208";a="293138635"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 17:34:59 -0700
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; d="scan'208";a="537084080"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 17:34:58 -0700
Date: Wed, 4 May 2022 17:34:57 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
Subject: Re: [PATCH 02/11] drm/i915/pvc: Add forcewake support
Message-ID: <YnMbseBnh8lnpH4+@mdroper-desk1.amr.corp.intel.com>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
 <20220502163417.2635462-3-matthew.d.roper@intel.com>
 <f3996e1efb75450f95908d8f9a05a4e16dc16f37.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3996e1efb75450f95908d8f9a05a4e16dc16f37.camel@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 02, 2022 at 03:33:53PM -0700, Summers, Stuart wrote:
> On Mon, 2022-05-02 at 09:34 -0700, Matt Roper wrote:
> > Add PVC's forcewake ranges.
> >
> > Bspec: 67609
> > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/i915/intel_uncore.c           | 150
> > +++++++++++++++++-
> >  drivers/gpu/drm/i915/selftests/intel_uncore.c |   2 +
> >  2 files changed, 151 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/intel_uncore.c
> > b/drivers/gpu/drm/i915/intel_uncore.c
> > index 83517a703eb6..3352065635e8 100644
> > --- a/drivers/gpu/drm/i915/intel_uncore.c
> > +++ b/drivers/gpu/drm/i915/intel_uncore.c
> > @@ -1080,6 +1080,45 @@ static const struct i915_range
> > dg2_shadowed_regs[] = {
> >       { .start = 0x1F8510, .end = 0x1F8550 },
> >  };
> >
> > +static const struct i915_range pvc_shadowed_regs[] = {
> > +     { .start =   0x2030, .end =   0x2030 },
> > +     { .start =   0x2510, .end =   0x2550 },
> > +     { .start =   0xA008, .end =   0xA00C },
> > +     { .start =   0xA188, .end =   0xA188 },
> > +     { .start =   0xA278, .end =   0xA278 },
> > +     { .start =   0xA540, .end =   0xA56C },
> > +     { .start =   0xC4C8, .end =   0xC4C8 },
> > +     { .start =   0xC4E0, .end =   0xC4E0 },
> > +     { .start =   0xC600, .end =   0xC600 },
> > +     { .start =   0xC658, .end =   0xC658 },
> > +     { .start =  0x22030, .end =  0x22030 },
> > +     { .start =  0x22510, .end =  0x22550 },
> > +     { .start = 0x1C0030, .end = 0x1C0030 },
> > +     { .start = 0x1C0510, .end = 0x1C0550 },
> > +     { .start = 0x1C4030, .end = 0x1C4030 },
> > +     { .start = 0x1C4510, .end = 0x1C4550 },
> > +     { .start = 0x1C8030, .end = 0x1C8030 },
> > +     { .start = 0x1C8510, .end = 0x1C8550 },
> > +     { .start = 0x1D0030, .end = 0x1D0030 },
> > +     { .start = 0x1D0510, .end = 0x1D0550 },
> > +     { .start = 0x1D4030, .end = 0x1D4030 },
> > +     { .start = 0x1D4510, .end = 0x1D4550 },
> > +     { .start = 0x1D8030, .end = 0x1D8030 },
> > +     { .start = 0x1D8510, .end = 0x1D8550 },
> > +     { .start = 0x1E0030, .end = 0x1E0030 },
> > +     { .start = 0x1E0510, .end = 0x1E0550 },
> > +     { .start = 0x1E4030, .end = 0x1E4030 },
> > +     { .start = 0x1E4510, .end = 0x1E4550 },
> > +     { .start = 0x1E8030, .end = 0x1E8030 },
> > +     { .start = 0x1E8510, .end = 0x1E8550 },
> > +     { .start = 0x1F0030, .end = 0x1F0030 },
> > +     { .start = 0x1F0510, .end = 0x1F0550 },
> > +     { .start = 0x1F4030, .end = 0x1F4030 },
> > +     { .start = 0x1F4510, .end = 0x1F4550 },
> > +     { .start = 0x1F8030, .end = 0x1F8030 },
> > +     { .start = 0x1F8510, .end = 0x1F8550 },
> > +};
> > +
> >  static int mmio_range_cmp(u32 key, const struct i915_range *range)
> >  {
> >       if (key < range->start)
> > @@ -1490,6 +1529,111 @@ static const struct intel_forcewake_range
> > __dg2_fw_ranges[] = {
> >       XEHP_FWRANGES(FORCEWAKE_RENDER)
> >  };
> >
> > +/*
> > + * *Must* be sorted by offset ranges! See intel_fw_table_check().
> > + *
> > + * Note that the spec lists several reserved/unused ranges that
> > don't actually
> > + * contain any registers.  In the table below we'll combine those
> > reserved
> > + * ranges with either the preceding or following range to keep the
> > table small
> 
> Looks like not just the reserved ranges are being used here. Maybe add
> "combine all ranges with preceding or following range with similar FW
> unit" or something similar.

The comment here is a duplicate of the one on the TGL table.  We've been
copy/pasting it onto new forcewake tables, but we should probably just
delete all except one of those comments and clarify that it applies to
all tables now (and possibly tweak the wording if necessary).

By "similar FW unit" are you referring to where the bspec has table rows
like:

        0x1000 - 0x1fff:  GT
        0x2000 - 0x2fff:  GT

so the same domain shows up on consecutive rows?  The fact that those
even show up as two rows in the bspec is a relatively new change due to
the hardware people starting to document additional information in the
same table (e.g., multicast register characteristics); back when the
comment was written the extra information hadn't been added so there
really was only a single consolidated range in the spec for cases like
this.


Matt

> 
> Thanks,
> Stuart
> 
> > + * and lookups fast.
> > + */
> > +static const struct intel_forcewake_range __pvc_fw_ranges[] = {
> > +     GEN_FW_RANGE(0x0, 0xaff, 0),
> > +     GEN_FW_RANGE(0xb00, 0xbff, FORCEWAKE_GT),
> > +     GEN_FW_RANGE(0xc00, 0xfff, 0),
> > +     GEN_FW_RANGE(0x1000, 0x1fff, FORCEWAKE_GT),
> > +     GEN_FW_RANGE(0x2000, 0x26ff, FORCEWAKE_RENDER),
> > +     GEN_FW_RANGE(0x2700, 0x2fff, FORCEWAKE_GT),
> > +     GEN_FW_RANGE(0x3000, 0x3fff, FORCEWAKE_RENDER),
> > +     GEN_FW_RANGE(0x4000, 0x813f, FORCEWAKE_GT), /*
> > +             0x4000 - 0x4aff: gt
> > +             0x4b00 - 0x4fff: reserved
> > +             0x5000 - 0x51ff: gt
> > +             0x5200 - 0x52ff: reserved
> > +             0x5300 - 0x53ff: gt
> > +             0x5400 - 0x7fff: reserved
> > +             0x8000 - 0x813f: gt */
> > +     GEN_FW_RANGE(0x8140, 0x817f, FORCEWAKE_RENDER),
> > +     GEN_FW_RANGE(0x8180, 0x81ff, 0),
> > +     GEN_FW_RANGE(0x8200, 0x94cf, FORCEWAKE_GT), /*
> > +             0x8200 - 0x82ff: gt
> > +             0x8300 - 0x84ff: reserved
> > +             0x8500 - 0x887f: gt
> > +             0x8880 - 0x8a7f: reserved
> > +             0x8a80 - 0x8aff: gt
> > +             0x8b00 - 0x8fff: reserved
> > +             0x9000 - 0x947f: gt
> > +             0x9480 - 0x94cf: reserved */
> > +     GEN_FW_RANGE(0x94d0, 0x955f, FORCEWAKE_RENDER),
> > +     GEN_FW_RANGE(0x9560, 0x967f, 0), /*
> > +             0x9560 - 0x95ff: always on
> > +             0x9600 - 0x967f: reserved */
> > +     GEN_FW_RANGE(0x9680, 0x97ff, FORCEWAKE_RENDER), /*
> > +             0x9680 - 0x96ff: render
> > +             0x9700 - 0x97ff: reserved */
> > +     GEN_FW_RANGE(0x9800, 0xcfff, FORCEWAKE_GT), /*
> > +             0x9800 - 0xb4ff: gt
> > +             0xb500 - 0xbfff: reserved
> > +             0xc000 - 0xcfff: gt */
> > +     GEN_FW_RANGE(0xd000, 0xd3ff, 0),
> > +     GEN_FW_RANGE(0xd400, 0xdbff, FORCEWAKE_GT),
> > +     GEN_FW_RANGE(0xdc00, 0xdcff, FORCEWAKE_RENDER),
> > +     GEN_FW_RANGE(0xdd00, 0xde7f, FORCEWAKE_GT), /*
> > +             0xdd00 - 0xddff: gt
> > +             0xde00 - 0xde7f: reserved */
> > +     GEN_FW_RANGE(0xde80, 0xe8ff, FORCEWAKE_RENDER), /*
> > +             0xde80 - 0xdeff: render
> > +             0xdf00 - 0xe1ff: reserved
> > +             0xe200 - 0xe7ff: render
> > +             0xe800 - 0xe8ff: reserved */
> > +     GEN_FW_RANGE(0xe900, 0x11fff, FORCEWAKE_GT), /*
> > +              0xe900 -  0xe9ff: gt
> > +              0xea00 -  0xebff: reserved
> > +              0xec00 -  0xffff: gt
> > +             0x10000 - 0x11fff: reserved */
> > +     GEN_FW_RANGE(0x12000, 0x12fff, 0), /*
> > +             0x12000 - 0x127ff: always on
> > +             0x12800 - 0x12fff: reserved */
> > +     GEN_FW_RANGE(0x13000, 0x23fff, FORCEWAKE_GT), /*
> > +             0x13000 - 0x135ff: gt
> > +             0x13600 - 0x147ff: reserved
> > +             0x14800 - 0x153ff: gt
> > +             0x15400 - 0x19fff: reserved
> > +             0x1a000 - 0x1ffff: gt
> > +             0x20000 - 0x21fff: reserved
> > +             0x22000 - 0x23fff: gt */
> > +     GEN_FW_RANGE(0x24000, 0x2417f, 0), /*
> > +             24000 - 0x2407f: always on
> > +             24080 - 0x2417f: reserved */
> > +     GEN_FW_RANGE(0x24180, 0x3ffff, FORCEWAKE_GT), /*
> > +             0x24180 - 0x241ff: gt
> > +             0x24200 - 0x251ff: reserved
> > +             0x25200 - 0x252ff: gt
> > +             0x25300 - 0x25fff: reserved
> > +             0x26000 - 0x27fff: gt
> > +             0x28000 - 0x2ffff: reserved
> > +             0x30000 - 0x3ffff: gt */
> > +     GEN_FW_RANGE(0x40000, 0x1bffff, 0),
> > +     GEN_FW_RANGE(0x1c0000, 0x1c3fff, FORCEWAKE_MEDIA_VDBOX0), /*
> > +             0x1c0000 - 0x1c2bff: VD0
> > +             0x1c2c00 - 0x1c2cff: reserved
> > +             0x1c2d00 - 0x1c2dff: VD0
> > +             0x1c2e00 - 0x1c3eff: reserved
> > +             0x1c3f00 - 0x1c3fff: VD0 */
> > +     GEN_FW_RANGE(0x1c4000, 0x1cffff, FORCEWAKE_MEDIA_VDBOX1), /*
> > +             0x1c4000 - 0x1c6aff: VD1
> > +             0x1c6b00 - 0x1c7eff: reserved
> > +             0x1c7f00 - 0x1c7fff: VD1
> > +             0x1c8000 - 0x1cffff: reserved */
> > +     GEN_FW_RANGE(0x1d0000, 0x23ffff, FORCEWAKE_MEDIA_VDBOX2), /*
> > +             0x1d0000 - 0x1d2aff: VD2
> > +             0x1d2b00 - 0x1d3eff: reserved
> > +             0x1d3f00 - 0x1d3fff: VD2
> > +             0x1d4000 - 0x23ffff: reserved */
> > +     GEN_FW_RANGE(0x240000, 0x3dffff, 0),
> > +     GEN_FW_RANGE(0x3e0000, 0x3effff, FORCEWAKE_GT),
> > +};
> > +
> >  static void
> >  ilk_dummy_write(struct intel_uncore *uncore)
> >  {
> > @@ -2125,7 +2269,11 @@ static int uncore_forcewake_init(struct
> > intel_uncore *uncore)
> >
> >       ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
> >
> > -     if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 55)) {
> > +     if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 60)) {
> > +             ASSIGN_FW_DOMAINS_TABLE(uncore, __pvc_fw_ranges);
> > +             ASSIGN_SHADOW_TABLE(uncore, pvc_shadowed_regs);
> > +             ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
> > +     } else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 55)) {
> >               ASSIGN_FW_DOMAINS_TABLE(uncore, __dg2_fw_ranges);
> >               ASSIGN_SHADOW_TABLE(uncore, dg2_shadowed_regs);
> >               ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
> > diff --git a/drivers/gpu/drm/i915/selftests/intel_uncore.c
> > b/drivers/gpu/drm/i915/selftests/intel_uncore.c
> > index cdd196783535..fda9bb79c049 100644
> > --- a/drivers/gpu/drm/i915/selftests/intel_uncore.c
> > +++ b/drivers/gpu/drm/i915/selftests/intel_uncore.c
> > @@ -69,6 +69,7 @@ static int intel_shadow_table_check(void)
> >               { gen11_shadowed_regs, ARRAY_SIZE(gen11_shadowed_regs)
> > },
> >               { gen12_shadowed_regs, ARRAY_SIZE(gen12_shadowed_regs)
> > },
> >               { dg2_shadowed_regs, ARRAY_SIZE(dg2_shadowed_regs) },
> > +             { pvc_shadowed_regs, ARRAY_SIZE(pvc_shadowed_regs) },
> >       };
> >       const struct i915_range *range;
> >       unsigned int i, j;
> > @@ -115,6 +116,7 @@ int intel_uncore_mock_selftests(void)
> >               { __gen11_fw_ranges, ARRAY_SIZE(__gen11_fw_ranges),
> > true },
> >               { __gen12_fw_ranges, ARRAY_SIZE(__gen12_fw_ranges),
> > true },
> >               { __xehp_fw_ranges, ARRAY_SIZE(__xehp_fw_ranges), true
> > },
> > +             { __pvc_fw_ranges, ARRAY_SIZE(__pvc_fw_ranges), true },
> >       };
> >       int err, i;
> >

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
