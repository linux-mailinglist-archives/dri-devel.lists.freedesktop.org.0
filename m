Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A1D3F7D04
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 22:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3AD6E41A;
	Wed, 25 Aug 2021 20:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532A86E419;
 Wed, 25 Aug 2021 20:08:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="278616376"
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; d="scan'208";a="278616376"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 13:08:30 -0700
X-IronPort-AV: E=Sophos;i="5.84,351,1620716400"; d="scan'208";a="684633803"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 13:08:30 -0700
Date: Wed, 25 Aug 2021 13:03:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [Intel-gfx] [PATCH 11/27] drm/i915/selftests: Fix memory
 corruption in live_lrc_isolation
Message-ID: <20210825200319.GA2751@jons-linux-dev-box>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-12-matthew.brost@intel.com>
 <1b23ca1d-7fc1-b812-8e1b-144ee2bc8b8a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b23ca1d-7fc1-b812-8e1b-144ee2bc8b8a@intel.com>
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

On Tue, Aug 24, 2021 at 05:07:13PM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 8/18/2021 11:16 PM, Matthew Brost wrote:
> > GuC submission has exposed an existing memory corruption in
> > live_lrc_isolation. We believe that some writes to the watchdog offsets
> > in the LRC (0x178 & 0x17c) can result in trashing of portions of the
> > address space. With GuC submission there are additional objects which
> > can move the context redzone into the space that is trashed. To
> > workaround this avoid poisoning the watchdog.
> 
> This is kind of a worrying explanation, as it implies an HW issue. AFAICS we
> no longer increase the context size with GuC submission, so the redzone
> should be in the same place relative to the base address of the context;
> although it is true that we have more objects in memory due to support the
> GuC, hitting the redzone consistently feels too much like a coincidence.
> When we write the watchdog regs there is a risk we're triggering a watchdog
> interrupt, which will cause the GuC to handle that; on a media reset, the
> GuC overwrites the context with the golden context in the ADS, are we sure
> that's not what is causing this problem?
> Looking in the ADS we set the context memcpy size to:
> 
> real_size = intel_engine_context_size(gt, engine_class);
> 
> but then we only initialize real_size - SKIP_SIZE(gt->i915), which IMO could
> be the real cause of the bug as the GuC memcpy starts at SKIP_SIZE().
> 

Good analysis Daniele. This definitely seems to be the issue as the
below patch appears to have fixed the failing selftest:

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 9f5f43a16182..c19ce71c9de9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -358,6 +358,11 @@ static int guc_prep_golden_context(struct intel_guc *guc,
        u8 engine_class, guc_class;
        struct guc_gt_system_info *info, local_info;

+       /* Skip execlist and PPGTT registers + HWSP */
+       const u32 lr_hw_context_size = 80 * sizeof(u32);
+       const u32 skip_size = LRC_PPHWSP_SZ * PAGE_SIZE +
+               lr_hw_context_size;
+
        /*
         * Reserve the memory for the golden contexts and point GuC at it but
         * leave it empty for now. The context data will be filled in later
@@ -396,7 +401,7 @@ static int guc_prep_golden_context(struct intel_guc *guc,
                if (!blob)
                        continue;

-               blob->ads.eng_state_size[guc_class] = real_size;
+               blob->ads.eng_state_size[guc_class] = real_size - skip_size;
                blob->ads.golden_context_lrca[guc_class] = addr_ggtt;
                addr_ggtt += alloc_size;
        }
@@ -476,7 +481,8 @@ static void guc_init_golden_context(struct intel_guc *guc)
                        continue;
                }

-               GEM_BUG_ON(blob->ads.eng_state_size[guc_class] != real_size);
+               GEM_BUG_ON(blob->ads.eng_state_size[guc_class] !=
+                          real_size - skip_size);
                GEM_BUG_ON(blob->ads.golden_context_lrca[guc_class] != addr_ggtt);
                addr_ggtt += alloc_size;

This being said, IMO this actually a bug in the GuC firmware as it
basically is doing:

memcpy(some_guc_dest, blob->ads.golden_context_lrca +
       guc_calculated_skip_size,
       blob->ads.eng_state_size);

IMO if the GuC is applying an internally calculated offset to
blob->ads.golden_context_lrca it should substract that calculated size
from blob->ads.eng_state_size.

e.g. the GuC should be doing:

memcpy(some_guc_dest, blob->ads.golden_context_lrca +
       guc_calculated_skip_size,
       blob->ads.eng_state_size - guc_calculated_skip_size);

We can bring this up with the GuC firmware team today, but in the
meantime I'll include the above patch in the respin of this series as a
workaround.

Matt 	

> Daniele
> 
> > 
> > v2:
> >   (Daniel Vetter)
> >    - Add VLK ref in code to workaround
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/selftest_lrc.c | 29 +++++++++++++++++++++++++-
> >   1 file changed, 28 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> > index b0977a3b699b..cdc6ae48a1e1 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> > @@ -1074,6 +1074,32 @@ record_registers(struct intel_context *ce,
> >   	goto err_after;
> >   }
> > +static u32 safe_offset(u32 offset, u32 reg)
> > +{
> > +	/* XXX skip testing of watchdog - VLK-22772 */
> > +	if (offset == 0x178 || offset == 0x17c)
> > +		reg = 0;
> > +
> > +	return reg;
> > +}
> > +
> > +static int get_offset_mask(struct intel_engine_cs *engine)
> > +{
> > +	if (GRAPHICS_VER(engine->i915) < 12)
> > +		return 0xfff;
> > +
> > +	switch (engine->class) {
> > +	default:
> > +	case RENDER_CLASS:
> > +		return 0x07ff;
> > +	case COPY_ENGINE_CLASS:
> > +		return 0x0fff;
> > +	case VIDEO_DECODE_CLASS:
> > +	case VIDEO_ENHANCEMENT_CLASS:
> > +		return 0x3fff;
> > +	}
> > +}
> > +
> >   static struct i915_vma *load_context(struct intel_context *ce, u32 poison)
> >   {
> >   	struct i915_vma *batch;
> > @@ -1117,7 +1143,8 @@ static struct i915_vma *load_context(struct intel_context *ce, u32 poison)
> >   		len = (len + 1) / 2;
> >   		*cs++ = MI_LOAD_REGISTER_IMM(len);
> >   		while (len--) {
> > -			*cs++ = hw[dw];
> > +			*cs++ = safe_offset(hw[dw] & get_offset_mask(ce->engine),
> > +					    hw[dw]);
> >   			*cs++ = poison;
> >   			dw += 2;
> >   		}
> 
