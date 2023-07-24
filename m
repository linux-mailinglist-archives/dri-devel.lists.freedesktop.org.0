Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB6C75F9FB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 16:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA7210E329;
	Mon, 24 Jul 2023 14:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022CA10E324;
 Mon, 24 Jul 2023 14:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690209345; x=1721745345;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZkxaMWwZVIw+LW0WgBwy1SdhMTK4GEQ3AEQu3X0icZY=;
 b=jBcKgTUXQ0f4Ixc913js0C4+vhVbN4aJHJS/hKNw8fT8a2GFTBgT9S51
 nKXwlA/fzI9MQiqmzMT9Ckvccsy8FSih0oYH4gvynCxGUo/r8MUONo2Cv
 AaQ3g+Z2iv2znQNCPcDSVrXzTKenthPRtMi38F/AVcc4tp00Nv+WP0XXO
 LylsWk3enw3DkB4P/vsVV5pQ7QMaQ22x+Rk/yEmifwWfcgiXiTA2ZPPZE
 4PxMld2GVyfpmMcPvnP1jgYHETcqZFpNTsm+m5aW6D4qwB8hKhV1TCqbR
 KOacCdQA4ecjK6NFJYgnNXXi+4K30Lu1H27odz1p4jn6tKd+tSFWlmYSg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347060115"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="347060115"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 07:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="702913913"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="702913913"
Received: from avmoskal-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.57.166])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 07:35:14 -0700
Date: Mon, 24 Jul 2023 16:35:11 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v8 9/9] drm/i915/gt: Support aux invalidation
 on all engines
Message-ID: <ZL6MH3Hi8+Ore+w0@ashyti-mobl2.lan>
References: <20230721161514.818895-1-andi.shyti@linux.intel.com>
 <20230721161514.818895-10-andi.shyti@linux.intel.com>
 <5f846260-8416-fb19-bd46-ced39153a92a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f846260-8416-fb19-bd46-ced39153a92a@intel.com>
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
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 linux-stable <stable@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Mon, Jul 24, 2023 at 11:42:16AM +0200, Andrzej Hajda wrote:
> On 21.07.2023 18:15, Andi Shyti wrote:
> > Perform some refactoring with the purpose of keeping in one
> > single place all the operations around the aux table
> > invalidation.
> > 
> > With this refactoring add more engines where the invalidation
> > should be performed.
> > 
> > Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: <stable@vger.kernel.org> # v5.8+
> > ---
> >   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 53 ++++++++++++++----------
> >   drivers/gpu/drm/i915/gt/gen8_engine_cs.h |  3 +-
> >   drivers/gpu/drm/i915/gt/intel_lrc.c      | 17 +-------
> >   3 files changed, 36 insertions(+), 37 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > index 6daf7d99700e0..d33462387d1c6 100644
> > --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > @@ -178,9 +178,36 @@ static bool gen12_needs_ccs_aux_inv(struct intel_engine_cs *engine)
> >   	return !HAS_FLAT_CCS(engine->i915);
> >   }
> > -u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv_reg)
> > +static i915_reg_t gen12_get_aux_inv_reg(struct intel_engine_cs *engine)
> > +{
> > +	if (!gen12_needs_ccs_aux_inv(engine))
> > +		return INVALID_MMIO_REG;
> > +
> > +	switch (engine->id) {
> > +	case RCS0:
> > +		return GEN12_CCS_AUX_INV;
> > +	case BCS0:
> > +		return GEN12_BCS0_AUX_INV;
> 
> Shouldn't be MTL only?
> With that explained/fixed:

this is actually difficult to be called by the wrong engine, so
that the MTL check is a bit pedantic... I can still add it
though.

> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Thanks,
Andi
