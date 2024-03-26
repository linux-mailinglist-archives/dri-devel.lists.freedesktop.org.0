Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A292088D2BD
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 00:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47B410F4C0;
	Tue, 26 Mar 2024 23:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dzs43hVL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8BA10F4C0;
 Tue, 26 Mar 2024 23:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711494983; x=1743030983;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xSeQZGWNTgZFAsZBhQPy/UL/WO1JBSkDZmSypsvOpqU=;
 b=Dzs43hVL2BKium6wkVfg3VO6NizE/efMOBxm9fS6HBtgk421bh/YsHXo
 lANN09wK9UvYkraQykdh2ogX+fdDF6JjgAgVEEG92Ow/8lCAQ4ZbuSZs/
 45/Qy2cfTCcCLxOnWDnsPCLTPzSG6+xJ2riiI5D+fzFgYVxMN/t7flqn8
 k1jEV73MotjosHfLKSp8zsKDB/O6zqBPiV6DS6YgVDq3d+csx5GNnJefz
 xFEvbjeHC8la9M9pszmoOYTN4aovVQgS1vvfnjBLOQikOYVTQKIMeCvwc
 ZwR0Bb9MktoxT8TX02PO+abA31GrcazuyeeMDkV3mIC58+2/Bzjf0RK6G g==;
X-CSE-ConnectionGUID: ZDvi2QKST/q9QXqNlqxHEg==
X-CSE-MsgGUID: D7zQmVglRayDT0vgVkiaKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17304195"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="17304195"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 16:16:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="47291647"
Received: from unknown (HELO intel.com) ([10.247.118.210])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 16:16:16 -0700
Date: Wed, 27 Mar 2024 00:16:09 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 John Harrison <John.C.Harrison@intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v6 2/3] drm/i915/gt: Do not generate the command streamer
 for all the CCS
Message-ID: <ZgNXOfBm5RK4oG9r@ashyti-mobl2.lan>
References: <20240313201955.95716-1-andi.shyti@linux.intel.com>
 <20240313201955.95716-3-andi.shyti@linux.intel.com>
 <20240326160310.GC718896@mdroper-desk1.amr.corp.intel.com>
 <ZgMXGlfsGSOhbC0b@ashyti-mobl2.lan>
 <20240326213033.GA1332995@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326213033.GA1332995@mdroper-desk1.amr.corp.intel.com>
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

On Tue, Mar 26, 2024 at 02:30:33PM -0700, Matt Roper wrote:
> On Tue, Mar 26, 2024 at 07:42:34PM +0100, Andi Shyti wrote:
> > On Tue, Mar 26, 2024 at 09:03:10AM -0700, Matt Roper wrote:
> > > On Wed, Mar 13, 2024 at 09:19:50PM +0100, Andi Shyti wrote:
> > > > +			/*
> > > > +			 * Do not create the command streamer for CCS slices
> > > > +			 * beyond the first. All the workload submitted to the
> > > > +			 * first engine will be shared among all the slices.
> > > > +			 *
> > > > +			 * Once the user will be allowed to customize the CCS
> > > > +			 * mode, then this check needs to be removed.
> > > > +			 */
> > > > +			if (IS_DG2(i915) &&
> > > > +			    class == COMPUTE_CLASS &&
> > > > +			    ccs_instance++)
> > > > +				continue;
> > > 
> > > Wouldn't it be more intuitive to drop the non-lowest CCS engines in
> > > init_engine_mask() since that's the function that's dedicated to
> > > building the list of engines we'll use?  Then we don't need to kill the
> > > assertion farther down either.
> > 
> > Because we don't check the result of init_engine_mask() while
> > creating the engine's structure. We check it only after and
> > indeed I removed the drm_WARN_ON() check.
> > 
> > I think the whole process of creating the engine's structure in
> > the intel_engines_init_mmio() can be simplified, but this goes
> > beyong the scope of the series.
> > 
> > Or am I missing something?
> 
> The important part of init_engine_mask isn't the return value, but
> rather that it's what sets up gt->info.engine_mask.  The HAS_ENGINE()
> check that intel_engines_init_mmio() uses is based on the value stored
> there, so updating that function will also ensure that we skip the
> engines we don't want in the loop.

Yes, can do like this, as well. After all this is done I'm going
to do some cleanup here, as well.

Thanks,
Andi
