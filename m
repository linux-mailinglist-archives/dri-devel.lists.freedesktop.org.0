Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8187003DA
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 11:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B21910E65E;
	Fri, 12 May 2023 09:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB6910E65D;
 Fri, 12 May 2023 09:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683884021; x=1715420021;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Zzi+KvvP2mA1bQRxXad7qbjXitF7ZmVqJu89HhazqRI=;
 b=PWsltBpbRiq1ORWYz89I+ZgucOJatX8X2djd9NamW3wZ0UT4J6SqmFsN
 bFl92EoXjgphGP8cv8mwrmCAd2UoQRoH0l80JxIi5E2tx+wRFh4KPbXWr
 kPQw1F7a9sAKg1oI/hIcvvj6Ey2mEGXF5keT7MLP4FzyhRCVaWmDbxsBL
 d/BFVzM5/123O3Mqo5BQ8pIuGAh2HxkisyZJ1tISBXIUjSLfjDblNUmy4
 X9LYIcn+Ir2VyhWM/Gf+Yu2eCW3nCRVpItuvkJ01w3wgaph/IiNOjyNZN
 TdwZsl4O8KiKRF799dKQfVqNGX/JysX6+V7q5g9uZDZSIptlUNb3PghS8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="340062582"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="340062582"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 02:33:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="789753801"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="789753801"
Received: from mmilbred-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.219.202])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 02:33:37 -0700
Date: Fri, 12 May 2023 11:33:33 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/hwmon: Silence UBSAN uninitialized
 bool variable warning
Message-ID: <ZF4H7Q92rVoas3Hb@ashyti-mobl2.lan>
References: <20230510183606.2480777-1-ashutosh.dixit@intel.com>
 <87y1luepbx.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y1luepbx.wl-ashutosh.dixit@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ashutosh,

On Thu, May 11, 2023 at 10:43:30AM -0700, Dixit, Ashutosh wrote:
> On Wed, 10 May 2023 11:36:06 -0700, Ashutosh Dixit wrote:
> >
> > Loading i915 on UBSAN enabled kernels (CONFIG_UBSAN/CONFIG_UBSAN_BOOL)
> > causes the following warning:
> >
> >   UBSAN: invalid-load in drivers/gpu/drm/i915/gt/uc/intel_uc.c:558:2
> >   load of value 255 is not a valid value for type '_Bool'
> >   Call Trace:
> >    dump_stack_lvl+0x57/0x7d
> >    ubsan_epilogue+0x5/0x40
> >    __ubsan_handle_load_invalid_value.cold+0x43/0x48
> >    __uc_init_hw+0x76a/0x903 [i915]
> >    ...
> >    i915_driver_probe+0xfb1/0x1eb0 [i915]
> >    i915_pci_probe+0xbe/0x2d0 [i915]
> >
> > The warning happens because during probe i915_hwmon is still not available
> > which results in the output boolean variable *old remaining
> > uninitialized.
> 
> Note that the variable was uninitialized in this case but it was never used
> uninitialized (the variable was not needed when it was uninitialized). So
> there was no bug in the code. UBSAN warning is just complaining about the
> uninitialized variable being passed into a function (where it is not used).
> 
> Also the variable can be initialized in the caller (__uc_init_hw) too and
> it will fix this issue. However in __uc_init_hw the assumption is that the
> variable will be initialized in the callee (i915_hwmon_power_max_disable),
> so that is how I have done it in this patch.
> 
> I thought these clarifications will help with the review.

I think we should not just consider what's now but also what can
come later. The use of pl1en is not 100% future proof and
therefore your patch, even though now is not fixing anything,
might avoid wrong uses in the future.

I'm just wondering, though, why not initializing the variable at
it's declaration. As you wish.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi

> Thanks.
> --
> Ashutosh
> 
> > Silence the warning by initializing the variable to an arbitrary value.
> >
> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > ---
> >  drivers/gpu/drm/i915/i915_hwmon.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> > index a3bdd9f68a458..685663861bc0b 100644
> > --- a/drivers/gpu/drm/i915/i915_hwmon.c
> > +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> > @@ -502,8 +502,11 @@ void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old)
> >	struct i915_hwmon *hwmon = i915->hwmon;
> >	u32 r;
> >
> > -	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
> > +	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit)) {
> > +		/* Fix uninitialized bool variable warning */
> > +		*old = false;
> >		return;
> > +	}
> >
> >	mutex_lock(&hwmon->hwmon_lock);
> >
> > --
> > 2.38.0
> >
