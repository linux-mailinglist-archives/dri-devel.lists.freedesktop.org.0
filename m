Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD2A88F8B2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 08:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EF711212C;
	Thu, 28 Mar 2024 07:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4BVs9SU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFDF10F858;
 Thu, 28 Mar 2024 07:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711610996; x=1743146996;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=77IiDGiqWNm2GwozOTYuAavXa//plkIspLecSN3lveg=;
 b=G4BVs9SUssdxomMZjpqjZYYthQcQOtKNvyIAiesrFG8ayEUoGgjyCcaI
 Lu6z2aqawwxXQ0ftKlS9CLYzFroMJ/e0Fs/MPp+ED9b41ZSa3C7Ev+L5X
 l63J56e4h7cSIkCXO+ipuJkr6UtohhLEr1y5zyXldmp9aOURmrNcnCXem
 5R10zb0wChHkbRT6ram9OxGXpvanlWwVYBKhItOjNEyvlplE0BZe97pHI
 5aNRwQvdjCptgyBd7+Dw8LbETC2svKD0vLe/FKEtbK5Lrf7K47V0hU+3S
 uNd+AV2N6f6zYx0BDzrnKOG2mpMtFMpWP6Sj4ifRL9S7zOW62ZAzkw6Y/ g==;
X-CSE-ConnectionGUID: vTTQn+2ATpiomgW0gyNbzQ==
X-CSE-MsgGUID: wI5gixgNTTuRQVvsOWMicQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="10531612"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="10531612"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 00:29:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="16628525"
Received: from unknown (HELO intel.com) ([10.247.118.221])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 00:29:48 -0700
Date: Thu, 28 Mar 2024 08:29:42 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 John Harrison <John.C.Harrison@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Michal Mrozek <michal.mrozek@intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v7 2/3] drm/i915/gt: Do not generate the command streamer
 for all the CCS
Message-ID: <ZgUcZpUn5S5Vmgqu@ashyti-mobl2.lan>
References: <20240327155622.538140-1-andi.shyti@linux.intel.com>
 <20240327155622.538140-3-andi.shyti@linux.intel.com>
 <20240327220858.GG718896@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327220858.GG718896@mdroper-desk1.amr.corp.intel.com>
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

> > +	/*
> > +	 * Do not create the command streamer for CCS slices beyond the first.
> > +	 * All the workload submitted to the first engine will be shared among
> > +	 * all the slices.
> > +	 *
> > +	 * Once the user will be allowed to customize the CCS mode, then this
> > +	 * check needs to be removed.
> > +	 */
> > +	if (IS_DG2(gt->i915)) {
> > +		intel_engine_mask_t first_ccs = BIT((CCS0 + __ffs(CCS_MASK(gt))));
> > +		intel_engine_mask_t all_ccs = CCS_MASK(gt) << CCS0;
> > +
> > +		info->engine_mask &= ~(all_ccs &= ~first_ccs);
> 
> Shouldn't the second "&=" just be an "&" since there's no need to modify
> the all_ccs variable that never gets used again?

yes, that's a leftover from me trying different ways of removing
all the non first CCS engines.

> In fact since this is DG2-specific, it seems like it might be more
> intuitive to just write the whole thing more directly as
> 
>         if (IS_DG2(gt->i915)) {
>                 int first_ccs = __ffs(CCS_MASK(gt));
> 
>                 info->engine_mask &= ~GENMASK(CCS3, CCS0);
>                 info->engine_mask |= BIT(_CCS(first_ccs));
>         }

yes, looks a bit simpler. Will use this way.

> But up to you; if you just want to remove the unnecessary "=" that's
> fine too.  Either way,
> 
>         Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Thanks!

Andi
