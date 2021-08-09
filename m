Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 188943E4D29
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 21:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF93089C6E;
	Mon,  9 Aug 2021 19:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B3589C6E;
 Mon,  9 Aug 2021 19:37:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="275799585"
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; d="scan'208";a="275799585"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 12:37:41 -0700
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; d="scan'208";a="671034983"
Received: from dut151-iclu.fm.intel.com ([10.105.23.43])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 12:37:41 -0700
Date: Mon, 9 Aug 2021 19:37:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/selftests: Fix memory
 corruption in live_lrc_isolation
Message-ID: <20210809193739.GA124301@DUT151-ICLU.fm.intel.com>
References: <20210808180757.81440-1-matthew.brost@intel.com>
 <20210808180757.81440-3-matthew.brost@intel.com>
 <YREv3mwWxH6cN9I7@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YREv3mwWxH6cN9I7@phenom.ffwll.local>
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

On Mon, Aug 09, 2021 at 03:38:38PM +0200, Daniel Vetter wrote:
> On Sun, Aug 08, 2021 at 11:07:56AM -0700, Matthew Brost wrote:
> > GuC submission has exposed an existing memory corruption in
> > live_lrc_isolation. We believe that some writes to the watchdog offsets
> > in the LRC (0x178 & 0x17c) can result in trashing of portions of the
> > address space. With GuC submission there are additional objects which
> > can move the context redzone into the space that is trashed. To
> > workaround this avoid poisoning the watchdog.
> 
> A Bspec reference here would be good (we can quote anything that's marked
> for public release, so doesn't have one of the IP markers).
>

Let me see what I dig up in the bspec.

BTW - Hopefully we can root cause this soon with a proper fix.
 
> Also I think the above should be replicated in condensed form instead of
> the XXX comment.
>

Sure.

Matt

> With those: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> since I
> definitely have enough clue here for a detailed review.
> -Daniel
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/selftest_lrc.c | 29 +++++++++++++++++++++++++-
> >  1 file changed, 28 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> > index b0977a3b699b..6500e9fce8a0 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> > @@ -1074,6 +1074,32 @@ record_registers(struct intel_context *ce,
> >  	goto err_after;
> >  }
> >  
> > +static u32 safe_offset(u32 offset, u32 reg)
> > +{
> > +	/* XXX skip testing of watchdog */
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
> >  static struct i915_vma *load_context(struct intel_context *ce, u32 poison)
> >  {
> >  	struct i915_vma *batch;
> > @@ -1117,7 +1143,8 @@ static struct i915_vma *load_context(struct intel_context *ce, u32 poison)
> >  		len = (len + 1) / 2;
> >  		*cs++ = MI_LOAD_REGISTER_IMM(len);
> >  		while (len--) {
> > -			*cs++ = hw[dw];
> > +			*cs++ = safe_offset(hw[dw] & get_offset_mask(ce->engine),
> > +					    hw[dw]);
> >  			*cs++ = poison;
> >  			dw += 2;
> >  		}
> > -- 
> > 2.28.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
