Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2E6756F24
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 23:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DDB10E057;
	Mon, 17 Jul 2023 21:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCC510E057;
 Mon, 17 Jul 2023 21:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689630774; x=1721166774;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GIu/1sTBWNqQVdXog3kMitlUfCk5qxXNdX74p4fnTsQ=;
 b=Yqdc8PX23F2cSA61oWruxC3zdGWUaTLWV/dLOr+B00/ltmZYXmG9utff
 hHHhIHa/phYsiXGnv46dHKWrWeH0uOKy033LLoY/Ac76+CmUN9m4jDs7O
 ZKrxUCr6/yl7qVYQb/mxe5R6+ZSkgwofnPGZx9HuPHMDFQEtMkSZnODsi
 j77dhytBmz6OyKRpQYfC0KFqPm0n8QPQARugLvuroC6+XB8c2wKfjWNuQ
 UKkU7Gh1lqADDHREEzHOLgdiE5GF3ec9WxxY3bgWBxi21yKs8bHMb4Gno
 ys1ciCeecKYy/XC/Q60N3zVEislkOPBPrk5b2KVMbf22xsTmdd/XwHKEg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="345641885"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="345641885"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 14:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="700650224"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="700650224"
Received: from jplazoni-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.55.169])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 14:52:33 -0700
Date: Mon, 17 Jul 2023 23:52:25 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 2/6] drm/i915/gt: Ensure memory quiesced before
 invalidation
Message-ID: <ZLW4GXM17rdep1Ex@ashyti-mobl2.lan>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
 <20230717173059.422892-3-andi.shyti@linux.intel.com>
 <20230717175425.GB138014@mdroper-desk1.amr.corp.intel.com>
 <20230717203103.GG138014@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717203103.GG138014@mdroper-desk1.amr.corp.intel.com>
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

On Mon, Jul 17, 2023 at 01:31:03PM -0700, Matt Roper wrote:
> On Mon, Jul 17, 2023 at 10:54:37AM -0700, Matt Roper wrote:
> > On Mon, Jul 17, 2023 at 07:30:55PM +0200, Andi Shyti wrote:
> > > From: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > 
> > > All memory traffic must be quiesced before requesting
> > > an aux invalidation on platforms that use Aux CCS.
> > > 
> > > Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > Cc: <stable@vger.kernel.org> # v5.8+
> > > ---
> > >  drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > > index 563efee055602..bee3b7dc595cf 100644
> > > --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > > +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > > @@ -202,6 +202,13 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
> > >  {
> > >  	struct intel_engine_cs *engine = rq->engine;
> > >  
> > > +	/*
> > > +	 * Aux invalidations on Aux CCS platforms require
> > > +	 * memory traffic is quiesced prior.
> > > +	 */
> > > +	if ((mode & EMIT_INVALIDATE) && !HAS_FLAT_CCS(engine->i915))
> > 
> > It's a pre-existing mistake in drm-tip at the moment, but we shouldn't
> > assume !flatccs always implies auxccs.  PVC has neither, and there may
> > be other similar platforms in the future.  We should probably add a
> > helper function for AuxCCS, similar to what we added to the Xe driver
> > recently:
> > 
> > https://patchwork.freedesktop.org/patch/539304/?series=118334&rev=1

Currently that is done in patch 6...

> BTW, since this patch didn't handle it I was expecting to see another
> patch in the series that quiesces memory for the non-RCS/CCS engines,
> but it looks like there isn't one yet.  So we should probably add the
> necessary MI_FLUSH_DW logic for the other engines to this patch as well.

... where also other engines are handles as well. I left this
patch as it is in order to preserve the authorship and it's
original form.

Maybe in patch 6 I can add the extra check for PVC as you did for
XE.

Thanks,
Andi
