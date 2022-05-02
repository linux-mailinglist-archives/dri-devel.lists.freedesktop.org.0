Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBDE5178F4
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 23:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F056410F4ED;
	Mon,  2 May 2022 21:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B1B10F4E8;
 Mon,  2 May 2022 21:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651526044; x=1683062044;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=R5FI6UfeAEkGTmcaZkNQ0s0viFwWlNgfT/c+PyuVAv4=;
 b=VxqCoOiqI0dQSZ86LDbgJAT74zwn5ztJ8xhzOR032iLiGSTHPDuamnh9
 +hH4NgAe+vnENazFcGXW7s/cNYOi0W+SpGf0P35lddh56PFCHMQi6FtkU
 oG0pIVAcLR0H/0dZPnSuw5kDmGugPgLxxXq3Bl3jcIAZQ2PR5cEZJaD/a
 FjkBnvpuDNQ5Nf9NDE09uV8Dy8JP4pmfpHQ8O5ugDw5bQOd8jDt+0qk7N
 RQgRmfhTj71u/MBMMQLYjpkiJ8++ls60alsdQ3IrdCgy0if/IasFfJGnB
 5+pWotPxDWsjjMsrek1xFPaQEJlQsIDUqfsL72cuh2BHHmTXSjMfj4gPk A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="267484969"
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; d="scan'208";a="267484969"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 14:14:03 -0700
X-IronPort-AV: E=Sophos;i="5.91,193,1647327600"; d="scan'208";a="652991769"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 14:14:03 -0700
Date: Mon, 2 May 2022 14:14:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 03/11] drm/i915/pvc: Define MOCS table for PVC
Message-ID: <YnBJmselMqaM3zNE@mdroper-desk1.amr.corp.intel.com>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
 <20220502163417.2635462-4-matthew.d.roper@intel.com>
 <20220502210328.x6jvlln2e6x7zxlc@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502210328.x6jvlln2e6x7zxlc@ldmartin-desk2>
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
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>, Fei Yang <fei.yang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 02, 2022 at 02:03:28PM -0700, Lucas De Marchi wrote:
> On Mon, May 02, 2022 at 09:34:09AM -0700, Matt Roper wrote:
> > From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
...
> > @@ -2002,11 +2002,18 @@ engine_fake_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
> > 	 * Streamers on Gen12 onward platforms.
> > 	 */
> > 	if (GRAPHICS_VER(engine->i915) >= 12) {
> > -		mocs = engine->gt->mocs.uc_index;
> > +		if (HAS_L3_CCS_READ(engine->i915) &&
> > +		    engine->class == COMPUTE_CLASS)
> > +			mocs_r = engine->gt->mocs.wb_index;
> > +		else
> > +			mocs_r = engine->gt->mocs.uc_index;
> 
> shouldn't we add a warning in get_mocs_settings() if HAS_L3_CCS_READ(engine->i915)
> and mocs.wb_index is 0 (since index 0 shouldn't really be used in latest
> platforms)?

We should be careful about that assumption...index 0 is valid on DG2
today, although HAS_L3_CCS_READ() doesn't apply there.  And a couple
platforms in the future we're also going to have index 0 being valid on
a platform where HAS_L3_CCS_READ() is true (bspec 71582).  Index 0 would
still be the wrong entry to pick for WB behavior there, but it is a
legitimate entry in general.


Matt

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
