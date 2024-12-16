Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FB99F3856
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 19:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF9510E744;
	Mon, 16 Dec 2024 18:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2o4xGzp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A43F10E3FC;
 Mon, 16 Dec 2024 18:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734372367; x=1765908367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bcPQuxuNZ1l2bHG55HIRmoJDKyqIHFVp8Mfm0s9tqqw=;
 b=L2o4xGzpKkoROFtEYc2yBkNDu7JjUOu8PxbOklHLylCIiR9Ivjp7Lk7V
 KdqX4YXb86KAWJiMSo47Nu4DsKJBwltdU3s1wJJOez5ApsKabMbTfeIgu
 Y/C1efDp0smOC+Vi82rirV65QeeR4hIrDQTMDDSx9px1uPJwEt5/fe5ye
 jo8nysR9yrgZaRqQRfIriNOr/3oyvKbhCAezvAk2E68S/2FexE0IkJF5Y
 F3imIWtanSTWXY2Wmp+uSCYcQu8Vq2w1PBKJWApbs2ZYMaFKzDGZUhh1P
 YIneZCXMC137onv7Un9WUNDZYYxPzc5LxMa2i239OUJNFX3UdM1NkPMK7 w==;
X-CSE-ConnectionGUID: f89O6lhJSgehmPEhdVMibQ==
X-CSE-MsgGUID: jz/CC+NPTcmdF+QYdMhs4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="57251952"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="57251952"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 10:06:06 -0800
X-CSE-ConnectionGUID: 02eohsNFSDe0JkyrPCLT7A==
X-CSE-MsgGUID: ckHdXwtoQCqWAnXJCJ8+Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101422425"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.1])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 10:06:03 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Use preemption timeout on cleanup
Date: Mon, 16 Dec 2024 19:06:01 +0100
Message-ID: <1986305.PYKUYFuaPT@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Z2AqomipvnhZ0r1y@ashyti-mobl2.lan>
References: <20241213190122.513709-2-janusz.krzysztofik@linux.intel.com>
 <Z2AqomipvnhZ0r1y@ashyti-mobl2.lan>
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

Thanks for review.

On Monday, 16 December 2024 14:26:58 CET Andi Shyti wrote:
> Hi Janusz,
> 
> ...
> 
> >  	for_each_gt(gt, i915, i) {
> > +		struct intel_engine_cs *engine;
> > +		unsigned long timeout_ms = 0;
> > +		unsigned int id;
> > +
> >  		if (intel_gt_is_wedged(gt))
> >  			ret = -EIO;
> >  
> > +		for_each_engine(engine, gt, id) {
> > +			if (engine->props.preempt_timeout_ms > 
timeout_ms)
> > +				timeout_ms = engine-
>props.preempt_timeout_ms;
> > +		}
> 
> 
> the brackets are not really required here.

OK, I was not sure if for_each_if used inside for_each_engine is supposed to 
resolve potential issues with potentially confusing if nesting, but from your 
comment I conclude it does.  I'll fix it.

> 
> > +
> >  		cond_resched();
> >  
> > -		if (intel_gt_wait_for_idle(gt, HZ * 3) == -ETIME) {
> > +		if (intel_gt_wait_for_idle(gt, HZ * timeout_ms / 500) == -
ETIME) {
> 
> where is this 500 coming from?

/ 1000 would convert it to seconds as needed, and / 500 used instead was 
supposed to to mean that we are willing to wait for preempt_timeout_ms * 2.  
Sorry for that shortcut.  Would you like me to provide a clarifying comment, 
or maybe better use explicit 2 * preempt_timeout / 1000 ?

Thanks,
Janusz

> 
> Thanks,
> Andi
> 
> >  			pr_err("%pS timed out, cancelling all further 
testing.\n",
> >  			       __builtin_return_address(0));
> >  
> 




