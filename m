Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C235B620A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 22:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E9010E13F;
	Mon, 12 Sep 2022 20:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A24710E13D;
 Mon, 12 Sep 2022 20:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663013587; x=1694549587;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=w5H9Us6zbcQVkNKEWwIf8zg85XKigIFhLnv78ZY1Z+A=;
 b=Lrne74l/6+3kTagQMvlLyC6qi2HbQxLutXhYCtFwbz8LM/olsI2mVMb4
 iDDJuWV/Rc4R/QI4cHQoALyiE6jM8ahlyyHLXnvqx1uKItUqUHf3dzpWE
 UnqyngGX4F/7UftFS5MeikaW0Bt5ZuVWoNvAg8CKJTBReBJhaDpYhu5tZ
 pu7I5nCKSCGx7JEZK6O8a2jIq8pa8m0S64RgUhRqfnf7YcwF30CY2Wfre
 1zrcIVi08Zt2jHj4tMP5Xyz9hA/nk95bYl35D2OUq15vgwXn/7UFnWwbc
 PHW8D1dtrwe0p5B6CdW3l0dvxwTZreWPzAHrkDhLEnqNMBN4G8drVnoiw w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="299299182"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="299299182"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 13:13:06 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="678247695"
Received: from cbittigh-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.208.30])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 13:13:04 -0700
Date: Mon, 12 Sep 2022 22:12:57 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v1 1/1] drm/i915: Skip applying copy engine
 fuses
Message-ID: <Yx+KIOliWdMIAe/M@alfio.lan>
References: <20220912-copy-engine-v1-0-ef92fd81758d@intel.com>
 <20220912-copy-engine-v1-1-ef92fd81758d@intel.com>
 <Yx9liQu4JmnVmWVn@alfio.lan>
 <20220912181247.dfyupvp4qxbavnen@ldmartin-desk2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912181247.dfyupvp4qxbavnen@ldmartin-desk2.lan>
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On Mon, Sep 12, 2022 at 11:12:47AM -0700, Lucas De Marchi wrote:
> On Mon, Sep 12, 2022 at 06:59:53PM +0200, Andi Shyti wrote:
> > Hi Lucas,
> > 
> > On Mon, Sep 12, 2022 at 09:19:38AM -0700, Lucas De Marchi wrote:
> > > Support for reading the fuses to check what are the Link Copy engines
> > > was added in commit ad5f74f34201 ("drm/i915/pvc: read fuses for link
> > > copy engines"). However they were added unconditionally because the
> > > FUSE3 register is present since graphics version 10.
> > > 
> > > However the bitfield with meml3 fuses only exists since graphics version
> > > 12. Moreover, Link Copy engines are currently only available in PVC.
> > > Tying additional copy engines to the meml3 fuses is not correct for
> > > other platforms.
> > > 
> > > Make sure there is a check for  `12.60 <= ver < 12.70`. Later platforms
> > > may extend this function later if it's needed to fuse off copy engines.
> > > 
> > > Currently it's harmless as the Link Copy engines are still not exported:
> > > info->engine_mask only has BCS0 set and the register is only read for
> > > platforms that do have it.
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > index 814f83b5fe59..1f7188129cd1 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> > > @@ -764,6 +764,10 @@ static void engine_mask_apply_copy_fuses(struct intel_gt *gt)
> > >  	unsigned long meml3_mask;
> > >  	unsigned long quad;
> > > 
> > > +	if (!(GRAPHICS_VER_FULL(i915) >= IP_VER(12, 60) &&
> > > +	      GRAPHICS_VER_FULL(i915) < IP_VER(12, 70)))
> > > +		return;
> > > +
> > 
> > Isn't it easier if you wrote
> > 
> > 	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 60) ||
> > 	    GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> > 		return;
> > 
> > ?
> > 
> > You save a parenthesis and a negation '!'.
> 
> but that makes it wrong. I'd really want the range
> 12.60 <= version < 12.70, so it applies to PVC  but is then disabled
> again for MTL.

But it's negated... so that if it's not in the range, it's
outside of the range... right?

 NOT(12.60 <= ver < 12.70)   <--- you wrote

is the same as:

 ver < 12.60 or ver >= 12.70 <--- I suggested

and it would mean (just to see if I'm not getting confused by
something and the negations do always confuse me):


                 12.60          12.70
        return     |              |     return
  ver: ------------[--------------[---------------


But it's the same, taht's why I r-b it anyway.

> Depending on how this evolves for future platforms, we
> may change it to a feature flag or just check by platform
> name. For now I think this is the most future-proof option.

yes, I got the point and I think it's fine.

Andi

> Lucas De Marchi
> 
> > 
> > Anyway, looks good:
> > 
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> > 
> > Andi
> > 
> > >  	meml3_mask = intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3);
> > >  	meml3_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK, meml3_mask);
> > > 
> > > 
> > > --
> > > b4 0.10.0-dev-df873
