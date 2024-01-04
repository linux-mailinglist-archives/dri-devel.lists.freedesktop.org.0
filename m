Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 574A9824A39
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 22:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7A710E53D;
	Thu,  4 Jan 2024 21:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96B110E535;
 Thu,  4 Jan 2024 21:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704403418; x=1735939418;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wb7ijdHgHnJEfEsuOwjNDXvWl4i2rAUXEun3IQbD24k=;
 b=QcOgPxqEjYpduOTitV47fpnPR80+i6HG7Su78YgWauAl4bp3ce0FzVo1
 LVh6yXK5nxFdrGn0Dm3eUfTu9irTHJ/SMC8MbFg1GAvjGpek3e1RRJJ7p
 W3rJWyxvagZ3BTWpiIDvUxkK+D9zLzbWV5fIcGlrGyO+lwMf0zw8Z4q6w
 GiW6bvddfyESbRHppXJJD6DEzmJWeix/CZoKdETDB3G7hMxF/MpwboEok
 Mxjd7BIk6oWo735APxJE7f+SoJ4djWvZrX7BtyRcx/MydO1pNREAAr+Z9
 nZWLdJQIfbrk7VcmuFceNHDBOFPpdsAd6sKuVNGY9I3DrunK2Vv7k6yYX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="461670620"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="461670620"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 13:23:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="850943929"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="850943929"
Received: from aooumar-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.252.52.118])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 13:23:17 -0800
Date: Thu, 4 Jan 2024 22:23:11 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v2 1/3] drm/i915/gt: Support fixed CCS mode
Message-ID: <ZZchsRQ5Kc-x9dlk@ashyti-mobl2.lan>
References: <20240104143558.193694-1-andi.shyti@linux.intel.com>
 <20240104143558.193694-2-andi.shyti@linux.intel.com>
 <98e56d3e-ebf0-42b9-928b-0dcc4303658c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98e56d3e-ebf0-42b9-928b-0dcc4303658c@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

[1]

> > +	/*
> > +	 * Loop over all available slices and assign each a user engine.
> > +	 *
> > +	 * With 1 engine (ccs0):
> > +	 *   slice 0, 1, 2, 3: ccs0
> > +	 *
> > +	 * With 2 engines (ccs0, ccs1):
> > +	 *   slice 0, 2: ccs0
> > +	 *   slice 1, 3: ccs1
> > +	 *
> > +	 * With 4 engines (ccs0, ccs1, ccs2, ccs3):
> > +	 *   slice 0: ccs0
> > +	 *   slice 1: ccs1
> > +	 *   slice 2: ccs2
> > +	 *   slice 3: ccs3
> > +	 *
> > +	 * Since the number of slices and the number of engines is
> > +	 * known, and we ensure that there is an exact multiple of
> > +	 * engines for slices, the double loop becomes a loop over each
> > +	 * slice.
> > +	 */
> > +	for (i = num_slices / num_engines; i < num_slices; i++) {
> > +		struct intel_engine_cs *engine;
> > +		intel_engine_mask_t tmp;
> > +
> > +		for_each_engine_masked(engine, gt, ALL_CCS(gt), tmp) {
> > +			/* If a slice is fused off, leave disabled */
> > +			while (!(CCS_MASK(gt) & BIT(slice)))
> > +				slice++;
> > +
> > +			mode &= ~XEHP_CCS_MODE_CSLICE(slice, XEHP_CCS_MODE_CSLICE_MASK);
> > +			mode |= XEHP_CCS_MODE_CSLICE(slice, engine->instance);
> > +
> > +			/* assign the next slice */
> > +			slice++;
> > +		}
> > +	}
> > +
> > +	intel_uncore_write(gt->uncore, XEHP_CCS_MODE, mode);
> > +}
> > +
> > +void intel_gt_apply_ccs_mode(struct intel_gt *gt)
> > +{
> > +	mutex_lock(&gt->ccs.mutex);
> > +	__intel_gt_apply_ccs_mode(gt);
> > +	mutex_unlock(&gt->ccs.mutex);
> > +}
> > +
> > +void intel_gt_init_ccs_mode(struct intel_gt *gt)
> > +{
> > +	mutex_init(&gt->ccs.mutex);
> > +	gt->ccs.mode = 1;
> 
> What is '1'? And this question carries over to the sysfs interface in the
> following patch - who will use it and where it is documented how to use it?

The value '1' is explained in the comment above[1] and in the
comment below[2]. Maybe we should give it an enum meaning? But
that would be something like CCS_MODE_1/2/4, I thinks
ccs.mode = 1/2/4 is more understandable.

> Also, should this setting somehow be gated by an applicable platform? Or if
> not on setting then when acting on it in __intel_gt_apply_ccs_mode?
> 
> Creation of sysfs files as well should be gated by platform too in the
> following patch?

The idea of this series is to disable the CCS load balancing
(which automatically chooses between mode 1/2/4) and used the
a fixed scheme chosen by the user.

(I'm preparing v3 as Chris was so kind to recommend some changes
offline)

Thanks,
Andi

[2]

> > +	/*
> > +	 * Track fixed mapping between CCS engines and compute slices.
> > +	 *
> > +	 * In order to w/a HW that has the inability to dynamically load
> > +	 * balance between CCS engines and EU in the compute slices, we have to
> > +	 * reconfigure a static mapping on the fly. We track the current CCS
> > +	 * configuration (set by thr user through a sysfs interface) and compare
> > +	 * it against the current CCS_MODE (which maps CCS engines to compute
> > +	 * slices). If there is only a single engine selected, we can map it to
> > +	 * all available compute slices for maximal single task performance
> > +	 * (fast/narrow). If there are more then one engine selected, we have to
> > +	 * reduce the number of slices allocated to each engine (wide/slow),
> > +	 * fairly distributing the EU between the equivalent engines.
> > +	 */
> > +	struct {
> > +		struct mutex mutex;
> > +		u32 mode;
> > +	} ccs;
