Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 473C9A7039E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 15:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945EA10E587;
	Tue, 25 Mar 2025 14:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jkc3AjHf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280B910E586;
 Tue, 25 Mar 2025 14:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742912793; x=1774448793;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tQqhUpeG8SF2/KnVwLfZIQuf1DtSyv0t4rIx7Q7xjrM=;
 b=Jkc3AjHfCU/vm6MdxREWwDXiE/sitOzJjCLzh4CEqL0Na8iIBxAEuj36
 6lVDSam6iW9kn6u6byo9U6NFPb22JO0d25ZddK7/v071WMgaGZCBTsIg4
 tf2kWmL0nxphcs+6+cplPi/0JE9nsSOZbJk6522evZHIRSeX/Qp+Oc0ye
 gXOBlJYWz9oz5Y20GgKsDc1ePvFpsa2V7BqFUVFSYSYxElnfkmD6adlwI
 YatU83vWXMlrDGHd7ZJaakY5PWKTmMAecV1qfbtnYdkGQz6cuEqL118MT
 c/jfPRqvm+NZ0hrdXSdZA3bQvt2qELrPaYXczGfcD5xlc6W1YnSBPid+p A==;
X-CSE-ConnectionGUID: kiOPgx3qRJ+QyE/C2erHJw==
X-CSE-MsgGUID: Y7B7IYHuRSWhlwFl00DruA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44088013"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="44088013"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 07:26:32 -0700
X-CSE-ConnectionGUID: 72B7rNLxRsWWh3gSbL0ZWg==
X-CSE-MsgGUID: O3RxF1smTxutf+sU17wOtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="129061752"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.149])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 07:26:30 -0700
Date: Tue, 25 Mar 2025 15:26:24 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Arshad Mehmood <arshad.mehmood@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Avoid duplicating CCS mode workaround
Message-ID: <Z-K9EKc3v3rYdZhK@ashyti-mobl2.lan>
References: <20250325120137.1302748-1-andi.shyti@linux.intel.com>
 <174290746252.1245393.5239853097693701739@DEV-409>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174290746252.1245393.5239853097693701739@DEV-409>
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

On Tue, Mar 25, 2025 at 01:57:42PM +0100, Chris Wilson wrote:
> Quoting Andi Shyti (2025-03-25 13:01:37)
> > When generating workarounds for the CCS engine, specifically for
> > setting the CCS mode related to compute load balancing, the
> > function 'ccs_engine_wa_mode()' is called twice: once for the
> > render engine and once for the compute engine.
> > 
> > Add a check to ensure the engine class is compute before applying
> > the workaround to avoid redundant programming.
> > 
> > Suggested-by: Arshad Mehmood <arshad.mehmood@intel.com>
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_workarounds.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > index 116683ebe074..37251546b755 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> > @@ -2897,7 +2897,9 @@ engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal
> >          */
> >         if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE) {
> >                 general_render_compute_wa_init(engine, wal);
> > -               ccs_engine_wa_mode(engine, wal);
> > +
> > +               if (engine->class == COMPUTE_CLASS)
> > +                       ccs_engine_wa_mode(engine, wal);
> 
> FIRST_RENDER_COMPUTE is meant to only be on the first engine of either
> rcs or ccs (which share certain register domains), one engine.
> 
> It looks like that was broken by
> 
> 	commit 1bfc03b1375244f9029bb448ee8224b3b6dae99f
> 	Author: Lucas De Marchi <lucas.demarchi@intel.com>
> 	Date:   Tue Mar 19 23:03:03 2024 -0700
> 
> 	    drm/i915: Remove special handling for !RCS_MASK()

Aha! So the logic here[*] breaks the meaning of
I915_ENGINE_FIRST_RENDER_COMPUTE, becasue, other than PVC, we
forgot that we have DG2 that needs the special check that uses
!RCS_MASK().

I need then to restore the original check.

Thanks Chris!
Andi

[*]
-       if ((engine->class == COMPUTE_CLASS && !RCS_MASK(engine->gt) &&
-            __ffs(CCS_MASK(engine->gt)) == engine->instance) ||
-            engine->class == RENDER_CLASS)
+       if ((engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS) &&
+           __ffs(CCS_MASK(engine->gt) | RCS_MASK(engine->gt)) == engine->instance)
