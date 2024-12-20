Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 770859F9CCA
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 23:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2923910E500;
	Fri, 20 Dec 2024 22:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dryp4+Cz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C748B10E13F;
 Fri, 20 Dec 2024 22:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734734343; x=1766270343;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PJxQ1MFloA+O/vO25s1Uz2aF2q7mEgJGr2oUETHrMa0=;
 b=Dryp4+CzKNI37Yp4BcSoC4JeHMROee5OHPgbdx2lyp521Wexoy+9f59A
 BK5eT74Kh6UDi6JSaHhgh151VNnFeV+FbLzfm66eCxD+leNK59SzaZ5C5
 n9tpINAAHOwH7n7SJLb5fEso/hPV+0WsDarka2+HtT/wQUqjcJaXcyusz
 vnWnW8ZuO08s/vQ4sK0fFHOUZc6ej2ZDuJc+dTJLWQsuhaAP/1xtn+MCR
 XqAr9/dRjEB3gb0Adx1zb97ZoXOVgX3uowvCSHCTHckx2b/11RXpD17Bg
 kuUsi1MSG03MOtj4jUVl+D55qKzgtiQiUJYmhXRbXnfYJgAYfbUKCAQn9 A==;
X-CSE-ConnectionGUID: JxxgHJjlRAqhKrh9GYVCOQ==
X-CSE-MsgGUID: fUwv5LZpQRGd/QJ2yJznVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="39074368"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; d="scan'208";a="39074368"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 14:39:03 -0800
X-CSE-ConnectionGUID: 1cbWltSkTOee/mavFxHLqw==
X-CSE-MsgGUID: 9W0KcPudSF61MilTLvsXYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="103700044"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.245])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 14:38:59 -0800
Date: Fri, 20 Dec 2024 23:38:55 +0100
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
Message-ID: <Z2Xx_5JODMNQPIZL@ashyti-mobl2.lan>
References: <20241213190122.513709-2-janusz.krzysztofik@linux.intel.com>
 <Z2Gw6J1qteGPB3o4@ashyti-mobl2.lan>
 <2414218.NG923GbCHz@jkrzyszt-mobl2.ger.corp.intel.com>
 <6751685.4vTCxPXJkl@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6751685.4vTCxPXJkl@jkrzyszt-mobl2.ger.corp.intel.com>
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

> > > > > > +
> > > > > >  		cond_resched();
> > > > > >  
> > > > > > -		if (intel_gt_wait_for_idle(gt, HZ * 3) == -ETIME) {
> > > > > > +		if (intel_gt_wait_for_idle(gt, HZ * timeout_ms / 500) == -ETIME) {
> > > > > 
> > > > > where is this 500 coming from?
> > > > 
> > > > / 1000 would convert it to seconds as needed, and / 500 used instead was 
> > > > supposed to to mean that we are willing to wait for preempt_timeout_ms * 
> > 2.  
> > > > Sorry for that shortcut.  Would you like me to provide a clarifying comment, 
> > > > or maybe better use explicit 2 * preempt_timeout / 1000 ?
> > > 
> > > It was clear that you were doubling it, but what's more
> > > interesting to know (perhaps in a comment) is why you are
> > > choosing to use the double of the timeout_ms instead of other
> > > values.
> > > 
> > > Makes sense?
> > 
> > Yes, good question.
> > 
> > Is it possible for more than one bb to hang?  If yes then should we wait 
> > longer than the longest preemption timeout?  Before I assumed that maybe we 
> > should, just in case, but now, having that revisited and reconsidered, I tend 
> > to agree that the longest preempt timeout, perhaps with a small margin (let's 
> > say +100ms) should be enough to recover from a single failing test case.  Let 
> > me verify if that works for the linked case.
> 
> I've done some testing and got a confirmation that the issue I'm trying to 
> address in the first place requires a timeout almost twice as long as the 
> longest preemption timeout.
> 
> I propose the following correction:
> 
> -	if (intel_gt_wait_for_idle(gt, HZ * 3) == -ETIME) {
> +	/* 2 x longest preempt timeout, experimentally determined */
> +	if (intel_gt_wait_for_idle(gt, 2 * timeout_ms * HZ / 1000) == -ETIME) {

with this change, I merge your patch to drm-intel-next.

Thanks,
Andi
