Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AE575C426
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 12:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F035A10E649;
	Fri, 21 Jul 2023 10:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8008C10E649;
 Fri, 21 Jul 2023 10:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689934337; x=1721470337;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=94f/c9e2jGds0K48NOZiBOaKx9jBz5tEBVO3al2Tax4=;
 b=kGJWeHpzAaNrL/J96wgXJgglAbmHfmSk6diEajyrZ+xq9NOKP4wLA9Rw
 WR/H5rRVSSyzUjckymiAgmeCd/34IFkPfVkAS/kShSeh/nTUW9/tvEWeR
 /RI2Waawyp92qqrQA07+Gi0Vo7yfAjbmD0q1h2qOVQjChz4vDAOosAJHI
 ojKPnVm2pPS1lMAL3RCIoNbcLpImyWKfingIXehzLp/z9C/55dwqwOvML
 iJpeZZwNj8sxET4I2dWRhPgLkqLgC80XmpAGhc3h1RNIQpqO151a6XhF7
 2vwyvmVhfnm1IEoKzuCtP1mWgWZFM9WVCbeM8u3MJRuOVg4RoQr2iHNv/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="369662215"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="369662215"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 03:12:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="814890529"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="814890529"
Received: from hbockhor-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.54.104])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 03:12:13 -0700
Date: Fri, 21 Jul 2023 12:12:10 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v7 6/9] drm/i915/gt: Refactor
 intel_emit_pipe_control_cs() in a single function
Message-ID: <ZLpZ+m4rlTTUHHrO@ashyti-mobl2.lan>
References: <20230720210737.761400-1-andi.shyti@linux.intel.com>
 <20230720210737.761400-7-andi.shyti@linux.intel.com>
 <1cb56f45-cb68-82f2-dc43-b4706b2e12c1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cb56f45-cb68-82f2-dc43-b4706b2e12c1@intel.com>
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

On Fri, Jul 21, 2023 at 12:10:48PM +0200, Andrzej Hajda wrote:
> On 20.07.2023 23:07, Andi Shyti wrote:
> > Just a trivial refactoring for reducing the number of code
> > duplicate. This will come at handy in the next commits.
> > 
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: <stable@vger.kernel.org> # v5.8+
> > ---
> >   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 44 +++++++++++++-----------
> >   1 file changed, 23 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > index 9d050b9a19194..202d6ff8b5264 100644
> > --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > @@ -177,23 +177,31 @@ u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv
> >   	return cs;
> >   }
> > +static u32 *intel_emit_pipe_control_cs(struct i915_request *rq, u32 bit_group_0,
> > +				       u32 bit_group_1, u32 offset)
> 
> 
> s/intel/gen12/
> 
> but this and few other issues were raised already by Matt in v6.

Thanks!
Andi
