Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31420A70540
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 16:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168E710E596;
	Tue, 25 Mar 2025 15:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+fzEyku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2820410E595;
 Tue, 25 Mar 2025 15:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742917203; x=1774453203;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b+iYazaiK8rhMhyrqeOj6j3SD64/fcJKh2haitJrZDk=;
 b=m+fzEykusZmHWg9rub8MInoG/Sf/LuPouypvdt76imaYL9aoiQVWqFgL
 vo7ykGp5iyVNChY/pvBna4KfHzsm014jLO91zvqFTva4YEqKk/vZx7ozy
 Z1IzAfT3bk45ooJjWbOhghUsSgLpPG37MTsYLQswijjOk25XG5MsCPMBp
 MS6YhZe2soFDIf9/G3khH/og230vWbE7Z7k81NMj/7lAHqfH8JzX0Nzsh
 zwMFVcNSivxY80rbG4PUpKmuNv6v10oOU2mCq2IK60KtMU5s2UY6xRNZQ
 bVYBKjcvdPAjPtWBN6MeKZGon7RoXyBymLu+u4ZHR0R+yPHFzUPF46770 w==;
X-CSE-ConnectionGUID: 6+jSWAK1QX2OYxw5fAM13A==
X-CSE-MsgGUID: +zRdHXaZSJGeZp1wces12g==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="55538657"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="55538657"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 08:40:02 -0700
X-CSE-ConnectionGUID: RBiTdJBmQHiuWUFpakH/6A==
X-CSE-MsgGUID: CBLsAO1oTpum4hz+igpvoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="155324935"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.149])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 08:39:59 -0700
Date: Tue, 25 Mar 2025 16:39:57 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Arshad Mehmood <arshad.mehmood@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Avoid duplicating CCS mode workaround
Message-ID: <Z-LOTSaCEItvtSq1@ashyti-mobl2.lan>
References: <20250325120137.1302748-1-andi.shyti@linux.intel.com>
 <174290746252.1245393.5239853097693701739@DEV-409>
 <Z-K9EKc3v3rYdZhK@ashyti-mobl2.lan>
 <67d46monf24hohzznjfzlbuwslcd2b6b3kce6gn55co5izpave@q3ae33cawecp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67d46monf24hohzznjfzlbuwslcd2b6b3kce6gn55co5izpave@q3ae33cawecp>
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

Hi Lucas,

> > > > @@ -2897,7 +2897,9 @@ engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal
> > > >          */
> > > >         if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE) {
> > > >                 general_render_compute_wa_init(engine, wal);
> > > > -               ccs_engine_wa_mode(engine, wal);
> > > > +
> > > > +               if (engine->class == COMPUTE_CLASS)
> > > > +                       ccs_engine_wa_mode(engine, wal);
> > > 
> > > FIRST_RENDER_COMPUTE is meant to only be on the first engine of either
> > > rcs or ccs (which share certain register domains), one engine.
> > > 
> > > It looks like that was broken by
> > > 
> > > 	commit 1bfc03b1375244f9029bb448ee8224b3b6dae99f
> > > 	Author: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> yep, my bad.
> 
> > > 	Date:   Tue Mar 19 23:03:03 2024 -0700
> > > 
> > > 	    drm/i915: Remove special handling for !RCS_MASK()
> > 
> > Aha! So the logic here[*] breaks the meaning of
> > I915_ENGINE_FIRST_RENDER_COMPUTE, becasue, other than PVC, we
> > forgot that we have DG2 that needs the special check that uses
> > !RCS_MASK().
> 
> no, that would mean a DG2 without render engine.

OK, I don't know the history, I thought that the idea was to
remove support for PVC, the only multi-CCS machine that once i915
supported other than DG2.

> The previous check to enable I915_ENGINE_FIRST_RENDER_COMPUTE was:
> 
> 	if ((engine->class == COMPUTE_CLASS && !RCS_MASK(engine->gt) &&
> 	     __ffs(CCS_MASK(engine->gt)) == engine->instance) ||
> 	     engine->class == RENDER_CLASS)
> 
> i.e. if render is fused off, it enables it in the first compute engine.
> Otherwise it enables it in the render.
> 
> And assuming we don't have platforms with render fused off (which still
> holds true as far as I'm aware), that became:
> 
> 	if ((engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS) &&
> 	    __ffs(CCS_MASK(engine->gt) | RCS_MASK(engine->gt)) == engine->instance)

The difference is that this applies in two cases: it's true for
the first CCS we encounter and also for the only RCS. Arshad
noticed that we end up applying the workaround twice.

So the !RCS_MASK(gt) check is still needed.

Alternatively, as Matt suggested, we could assign
I915_ENGINE_FIRST_RENDER_COMPUTE only to the RCS.

I have a slight preference for the way it was done before because
it make the logic clearer.

Thanks,
Andi

> It was supposed to mean the same thing... but doesn't as engine->instance
> starts from 0 for each class.
