Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BA09F5552
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 19:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3480510EA49;
	Tue, 17 Dec 2024 18:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6JLxOKD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBD010E643;
 Tue, 17 Dec 2024 18:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734458449; x=1765994449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rw0lIlfploREEOJl+obv+/ylG29gzDvVZDl/myq9IZo=;
 b=M6JLxOKD+6YkPi/8mmDP5gZcTtrb5/3jl8wGRX5VvTV8IXFhg2d+xftC
 BfFIvbxHBlco8T6ITuEFKwXgfELu+8W3YrGTqJfCNU2O8uIQrX2ZapKFE
 pT4BkqBjW9xVi1FLk6Y/FShq3o1dVTPqu1XvxtLPQhSSTJSGFXlBIaLpZ
 uSVJJIlq96itezQ5pu7ot0H5UCfvqzI7vGcwzdg+72Sf4ifvxvzat/9jI
 y5O1Yv3XdhF49g0Xz4WgA6bU3c/NL1a1lagB+adu41nLfF8O3lPq8X9yX
 zQQDZsVdUpiVayL0q8UXcElqcQiF6Q5DYCQbmjKIA7hvDEE+f6HRb38P+ A==;
X-CSE-ConnectionGUID: cCIFGcm4SBCVvjntFR3fpw==
X-CSE-MsgGUID: joEC3U10TQ2KTXyMFp30ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="60284469"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="60284469"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 10:00:47 -0800
X-CSE-ConnectionGUID: x2WlMvxdRhiBUSABU5bnQQ==
X-CSE-MsgGUID: O+fA/JxDRiW6KMOERuqiFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="97491848"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.62])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 10:00:43 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Use preemption timeout on cleanup
Date: Tue, 17 Dec 2024 19:00:40 +0100
Message-ID: <2414218.NG923GbCHz@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Z2Gw6J1qteGPB3o4@ashyti-mobl2.lan>
References: <20241213190122.513709-2-janusz.krzysztofik@linux.intel.com>
 <1986305.PYKUYFuaPT@jkrzyszt-mobl2.ger.corp.intel.com>
 <Z2Gw6J1qteGPB3o4@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi Andi,

On Tuesday, 17 December 2024 18:12:08 CET Andi Shyti wrote:
> Hi Janusz,
> 
> ...
> 
> > > > +
> > > >  		cond_resched();
> > > >  
> > > > -		if (intel_gt_wait_for_idle(gt, HZ * 3) == -ETIME) {
> > > > +		if (intel_gt_wait_for_idle(gt, HZ * timeout_ms / 500) == -
> > ETIME) {
> > > 
> > > where is this 500 coming from?
> > 
> > / 1000 would convert it to seconds as needed, and / 500 used instead was 
> > supposed to to mean that we are willing to wait for preempt_timeout_ms * 
2.  
> > Sorry for that shortcut.  Would you like me to provide a clarifying 
comment, 
> > or maybe better use explicit 2 * preempt_timeout / 1000 ?
> 
> It was clear that you were doubling it, but what's more
> interesting to know (perhaps in a comment) is why you are
> choosing to use the double of the timeout_ms instead of other
> values.
> 
> Makes sense?

Yes, good question.

Is it possible for more than one bb to hang?  If yes then should we wait 
longer than the longest preemption timeout?  Before I assumed that maybe we 
should, just in case, but now, having that revisited and reconsidered, I tend 
to agree that the longest preempt timeout, perhaps with a small margin (let's 
say +100ms) should be enough to recover from a single failing test case.  Let 
me verify if that works for the linked case.

Thanks,
Janusz

> 
> Thanks,
> Andi
> 




