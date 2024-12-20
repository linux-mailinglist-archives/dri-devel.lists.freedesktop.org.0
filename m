Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2199F93DE
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 15:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0CA10E394;
	Fri, 20 Dec 2024 14:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MdigE332";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610CB10E010;
 Fri, 20 Dec 2024 14:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734703329; x=1766239329;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4cTIKXr1S1dEJ782PWHvr044+s65lxE3k2QJ4qEbKHQ=;
 b=MdigE332V2c1JQd4CFIucKVGNUHLlHIUkxGqt329/RxcOU1orqK2yH/u
 WIJks4HOIPCYQmTYrkbml+Cspza0NLvU4/4KLrwR+OZxji3qAcoXdsctu
 Wt5E3wn+KJpWdppwLCRclkpPh1973BGtvqwQPnRUkIFSMTruBkFsAbLZb
 dgAJTWoboBT4yDSV1O6JWMGOmNLULwAriBcTSml5BoqTALKyErq6Z5N7t
 Z07Ggpo7jbhnP+Yuz81g1mllAyl+Z3wsXWewbkIB3exWQ7XHNPqG12ey8
 pJ+PvPoBrbTwkQUjKka96y6jJGuv1jbZ3/0syBMBOA0vv+y4wdQGVwwSN Q==;
X-CSE-ConnectionGUID: NqTNQAh4St+ZbWD7A9MGDw==
X-CSE-MsgGUID: kho6JT6+RWuwd3xtafPahg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="46259679"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="46259679"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 06:02:09 -0800
X-CSE-ConnectionGUID: Pbahd9JTSDytOOvvW74VwA==
X-CSE-MsgGUID: L0bhNJO4TSeHIMXV2MnrPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135863035"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.245])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 06:02:06 -0800
Date: Fri, 20 Dec 2024 15:02:01 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Use preemption timeout on cleanup
Message-ID: <Z2V42dj-XvHF-bvN@ashyti-mobl2.lan>
References: <20241213190122.513709-2-janusz.krzysztofik@linux.intel.com>
 <1986305.PYKUYFuaPT@jkrzyszt-mobl2.ger.corp.intel.com>
 <Z2Gw6J1qteGPB3o4@ashyti-mobl2.lan>
 <2414218.NG923GbCHz@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2414218.NG923GbCHz@jkrzyszt-mobl2.ger.corp.intel.com>
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

Hi Janusz,

> > > > > +
> > > > >  		cond_resched();
> > > > >  
> > > > > -		if (intel_gt_wait_for_idle(gt, HZ * 3) == -ETIME) {
> > > > > +		if (intel_gt_wait_for_idle(gt, HZ * timeout_ms / 500) == -
> > > ETIME) {
> > > > 
> > > > where is this 500 coming from?
> > > 
> > > / 1000 would convert it to seconds as needed, and / 500 used instead was 
> > > supposed to to mean that we are willing to wait for preempt_timeout_ms * 
> 2.  
> > > Sorry for that shortcut.  Would you like me to provide a clarifying 
> comment, 
> > > or maybe better use explicit 2 * preempt_timeout / 1000 ?
> > 
> > It was clear that you were doubling it, but what's more
> > interesting to know (perhaps in a comment) is why you are
> > choosing to use the double of the timeout_ms instead of other
> > values.
> > 
> > Makes sense?
> 
> Yes, good question.
> 
> Is it possible for more than one bb to hang?  If yes then should we wait 
> longer than the longest preemption timeout?  Before I assumed that maybe we 
> should, just in case, but now, having that revisited and reconsidered, I tend 
> to agree that the longest preempt timeout, perhaps with a small margin (let's 
> say +100ms) should be enough to recover from a single failing test case.  Let 
> me verify if that works for the linked case.

As we agreed offline, I'm going to add this comment you suggested
to your change as a justification to the "/ 500":

/* 2x longest preempt timeout, experimentally determined */

With this:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
