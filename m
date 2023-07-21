Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBD775C48F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 12:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5E710E650;
	Fri, 21 Jul 2023 10:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F73910E64B;
 Fri, 21 Jul 2023 10:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689934989; x=1721470989;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=roGcLwE29qARgCVUB/cKB+LGRXB3cs5flNEyabnZoJQ=;
 b=lfeW+c9iI5XeEmXOqwIvZEG2xMApQM35LB8P6uzOxsl++ejLXDd4cnJb
 nh5bWevZhsECNxcIVgmSHH3j8Qq0gYUExGDmd3K8Z7iqIWlLoDTV/69S6
 WLioaWTRamgzRs8RbHQgLIlgv7HyMfwFG5ltKwHYPGi3pqf/MRu2Mt5LN
 TxC4Hns4uKOzGHfx8UBSlGnd9fXhv365aPJz5pVXaHvznp/1joWBn8N2Y
 LxDZnzwp7SICG4oJMz9vkcOUuE3aP8w2km4hEGD6mdnn3kry6h7pLFh/6
 R2e/vCS4LrPkSkoTLNu5CQRovA9sitPXYeaXBzI1kNugtM8FbkkzDvGWC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="367027385"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="367027385"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 03:23:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="702001407"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="702001407"
Received: from hbockhor-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.54.104])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 03:23:05 -0700
Date: Fri, 21 Jul 2023 12:23:02 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v7 5/9] drm/i915/gt: Enable the CCS_FLUSH bit
 in the pipe control
Message-ID: <ZLpchtXWBYtF3bLl@ashyti-mobl2.lan>
References: <20230720210737.761400-1-andi.shyti@linux.intel.com>
 <20230720210737.761400-6-andi.shyti@linux.intel.com>
 <bb22e634-03ed-7c51-8211-8fb6d5a52570@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb22e634-03ed-7c51-8211-8fb6d5a52570@intel.com>
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

> > diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > index 7566c89d9def3..9d050b9a19194 100644
> > --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > @@ -218,6 +218,13 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
> >   		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
> > +		/*
> > +		 * When required, in MTL+ platforms we need to
> > +		 * set the CCS_FLUSH bit in the pipe control
> > +		 */
> > +		if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
> > +			bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
> > +
> 
> 
> Btw, not for this patch, but related: rcs and ccs have slightly different
> set of flushes according to bspec but this functions is the same for both.
> Is it sth we should address, or just safe simplification.

I guess this is not only used for ccs aux invalidation. I think
the BSPEC is specifying the minimum set of bits that need to be
set in the pipe control. So that I left it as it is and just
added this bit for MTL+.

Thanks,
Andi
