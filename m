Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 907087570E2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 02:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E801310E2BB;
	Tue, 18 Jul 2023 00:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AE810E2BB;
 Tue, 18 Jul 2023 00:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689640118; x=1721176118;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gLggTVJAkctyJjeZE88PhBO2TEV7EcdnHGLiNiQfr3Y=;
 b=juk6bN4Uw/W6jo1/VcmmNAsw0obAwhLFLIGsTd3SPqkYykekO52k8fHM
 hdfu6O+e6zZIxW2ekn2UgEb04eDy6XO74BhLB7QRccVgv//zsQ54Puior
 Dx4pF/iKcnuRd/Gd4Biexa7Kh97wGpHDCS2t7hqVFLhO/CUEi9dd7bT0S
 xDuCtk1FKoFfA1ugg7ZCg0eOgbTVmhxtc6OhyV+nIK086a+6WjsTSdHi9
 FLev8n5uP+tlbUjv6RUXfwJ16t8pet8P0+LUPgcEpjaM3m5s0ngfdQho7
 ZjBQYyiT9YWnPXZYavQIbnPP+l6viwQ8IDqfCs2qV8ymtYqr3R0P0FwM3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="368713924"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="368713924"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 17:28:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="970041076"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="970041076"
Received: from ygaydayc-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.242])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 17:28:35 -0700
Date: Tue, 18 Jul 2023 02:28:26 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 2/6] drm/i915/gt: Ensure memory quiesced before
 invalidation
Message-ID: <ZLXcnTS1oN3Rh1pU@ashyti-mobl2.lan>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
 <20230717173059.422892-3-andi.shyti@linux.intel.com>
 <20230717175425.GB138014@mdroper-desk1.amr.corp.intel.com>
 <20230717203103.GG138014@mdroper-desk1.amr.corp.intel.com>
 <ZLW4GXM17rdep1Ex@ashyti-mobl2.lan>
 <20230717220018.GH138014@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717220018.GH138014@mdroper-desk1.amr.corp.intel.com>
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

> > > > > +	/*
> > > > > +	 * Aux invalidations on Aux CCS platforms require
> > > > > +	 * memory traffic is quiesced prior.
> > > > > +	 */
> > > > > +	if ((mode & EMIT_INVALIDATE) && !HAS_FLAT_CCS(engine->i915))
> > > > 
> > > > It's a pre-existing mistake in drm-tip at the moment, but we shouldn't
> > > > assume !flatccs always implies auxccs.  PVC has neither, and there may
> > > > be other similar platforms in the future.  We should probably add a
> > > > helper function for AuxCCS, similar to what we added to the Xe driver
> > > > recently:
> > > > 
> > > > https://patchwork.freedesktop.org/patch/539304/?series=118334&rev=1
> > 
> > Currently that is done in patch 6...
> 
> Are you sure?  Patch #6 consolidates things a bit, but is still incorrectly
> assuming flatccs = !auxccs:
> 
>        if (HAS_FLAT_CCS(engine->i915))                                                                                                            
>                return _MMIO(0);                                                                                                                   

But isn't it the same the patch you linked is doing?

	return !xe->info.has_flat_ccs;

And
