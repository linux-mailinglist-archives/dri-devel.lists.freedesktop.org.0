Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81E275EEDF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 11:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95A210E297;
	Mon, 24 Jul 2023 09:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0823C10E297;
 Mon, 24 Jul 2023 09:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690190220; x=1721726220;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JSxNWSDjJyd0g6MAfn3yUQULlcxcG2xVrI6FN+vIjQA=;
 b=JdrX5CIpi2qsS3n/HvERpyCEjgL6Gic7RbReGtzNPVTuxwOYeARq36ca
 Xg4iykn9oz/sAOtCaSbYSxM+MI2HgPjOHeQSsAM4Lxa3oaoQD+SQ86yfS
 +TtNdQ8mREOtoO4voSpABSJE/hXfAn4NU2/K7NabGLn7xtGYdXdVB91v/
 no262iCDunqWVB2PKCczOqM4/kigGjOGO0IlQudft+ydtS1yFgN/um+VQ
 pkhaDsm4qreL5TMwVvrCBEZrVW/tjgA1M4GNai3f/gtr/LkaXud2fxB2Y
 ewN6Mf5howVuzh6spFcnhDaoCycFBsBs7XeZhx9FEnpZszTxUM0jPnEFX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="364853614"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="364853614"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 02:16:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="849560489"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="849560489"
Received: from avmoskal-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.57.166])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 02:16:56 -0700
Date: Mon, 24 Jul 2023 11:16:53 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
Subject: Re: [PATCH v8 6/9] drm/i915/gt: Refactor
 intel_emit_pipe_control_cs() in a single function
Message-ID: <ZL5BhY6C2uzqd/bU@ashyti-mobl2.lan>
References: <20230721161514.818895-1-andi.shyti@linux.intel.com>
 <20230721161514.818895-7-andi.shyti@linux.intel.com>
 <dc09292f-e2e8-c800-b39e-99f5364a8a76@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc09292f-e2e8-c800-b39e-99f5364a8a76@linux.intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 linux-stable <stable@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

>      static int mtl_dummy_pipe_control(struct i915_request *rq)
>      {
>             /* Wa_14016712196 */
>             if (IS_MTL_GRAPHICS_STEP(rq->engine->i915, M, STEP_A0, STEP_B0) ||
>     -           IS_MTL_GRAPHICS_STEP(rq->engine->i915, P, STEP_A0, STEP_B0)) {
>     -               u32 *cs;
>     -
>     -               /* dummy PIPE_CONTROL + depth flush */
>     -               cs = intel_ring_begin(rq, 6);
>     -               if (IS_ERR(cs))
>     -                       return PTR_ERR(cs);
>     -               cs = gen12_emit_pipe_control(cs,
>     -                                            0,
>     -                                            PIPE_CONTROL_DEPTH_CACHE_FLUSH,
>     -                                            LRC_PPHWSP_SCRATCH_ADDR);
>     -               intel_ring_advance(rq, cs);
>     -       }
>     +           IS_MTL_GRAPHICS_STEP(rq->engine->i915, P, STEP_A0, STEP_B0))
>     +               return gen12_emit_pipe_control_cs(rq, 0,
>     +                                       PIPE_CONTROL_DEPTH_CACHE_FLUSH,
>     +                                       LRC_PPHWSP_SCRATCH_ADDR);
> 
> Don't think this will get backported to 5.8+. I think mtl introduced after
> that.
> 
> If that is not an issue for rest of the series and then

to be honest I don't think I fully understood the stable
policies, as in this series only two are the patches that are
really fixing things and the rest are only support.

In this case I think this will produce a conflict that will be
eventually fixed (... I guess!).

> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Thanks,
Andi
