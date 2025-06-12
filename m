Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00397AD6C81
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 11:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CCA10E10E;
	Thu, 12 Jun 2025 09:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YiKzH6zq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E4210E10E;
 Thu, 12 Jun 2025 09:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749721557; x=1781257557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=erdUAfCe9Pg2gYuWWS36x3dMtgItvntbFDOp6+sc27w=;
 b=YiKzH6zqrptE672pDovbT7vMrhg4376WPjP5toSMKyeGxd70kK94TWQI
 CwEE2Xeax/JxH2txZhQJVnBlviVFliN90Uaaaftm3VI0pT2t94ieApUzH
 coKSjqDIsVEVkNZn7AmKVQyWzQuilNexWG7r8w97pS3/r8+aopOMitshi
 cb/xlHV8IPmiRDi5ruPCaen6W24awOMhryHoaLeHdCGnKZDo7kptX4Vhc
 PxvPnoDsHm1gj1zBr1G7uXduTCgwBXbGJBTYpAuLRqCCuB8RbZRYm2TC2
 NhianTEmtrlWXyEQ295g3NZb7YkyXJZwj1V62d3lwLyAZuXY+KjmBrxgW w==;
X-CSE-ConnectionGUID: ku2dTm+0R/eqsAyFvyOJwQ==
X-CSE-MsgGUID: bgrLGCocRVm5ect+UarZ7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69330330"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="69330330"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 02:45:54 -0700
X-CSE-ConnectionGUID: 7Aa59CHjQA2+VUZ+zflTfQ==
X-CSE-MsgGUID: fqpP1R4ART6QjmtUEoPe4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="148377826"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.156])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 02:45:50 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 "Brzezinka, Sebastian" <sebastian.brzezinka@intel.com>,
 "Niemiec, Krzysztof" <krzysztof.niemiec@intel.com>,
 "Karas, Krzysztof" <krzysztof.karas@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/ring_submission: Fix timeline left held on VMA
 alloc error
Date: Thu, 12 Jun 2025 11:45:46 +0200
Message-ID: <3881406.kQq0lBPeGt@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <2765e513d57f59297300e19c394f1e2bd15da3ad@intel.com>
References: <20250611104352.1014011-2-janusz.krzysztofik@linux.intel.com>
 <8536974.T7Z3S40VBb@jkrzyszt-mobl2.ger.corp.intel.com>
 <2765e513d57f59297300e19c394f1e2bd15da3ad@intel.com>
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

On Thursday, 12 June 2025 11:35:31 CEST Jani Nikula wrote:
> On Thu, 12 Jun 2025, Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> > On Wednesday, 11 June 2025 22:54:40 CEST Andi Shyti wrote:
> >> Hi Nitin,
> >> 
> >> On Wed, Jun 11, 2025 at 03:45:30PM +0000, Gote, Nitin R wrote:
> >> > [...]
> >> > > Subject: [PATCH] drm/i915/ring_submission: Fix timeline left held on VMA alloc
> >> > > error
> >> > >
> >> > 
> >> > Generally, it's preferred to use "drm/i915/gt:" file path over "drm/i915/ring_submission:"  file name in the commit title.
> >> 
> >> good observation, I missed it. I agree with Nitin on this, it can
> >> be fixed before merging.
> >
> > I'm not sure.  I found no single word on the *subsystem* component of the 
> > canonical patch format subject line (or commit message) expected to reflect 
> > any directory structure in case of DRM.
> 
> It's not about the directory structure, though, but rather about
> (admittedly unwritten) conventions. Usually about driver components,
> features or platforms.
> 
> See:
> 
> $ git log --since={5years} --no-merges --pretty=%s -- "<PATH>" | sed 's/:.*//' | sort | uniq -c | sort -rn
> 
> Where "<PATH>" is drivers/gpu/drm/i915/gt/intel_ring_submission.c or
> drivers/gpu/drm/i915/gt.
> 
> "ring" or "submission" is just not there in the prefix, at all.

I see.  Is there a convention for designating old, pre-execlists *platforms* 
as affected subsystem / area?  Or is describing it in the summary phrase of 
the commit message the only way?

Thanks,
Janusz

> 
> 
> BR,
> Jani.
> 
> > However, if you think it should for 
> > some reason, or you just don't recognize i915 ring submission as a good 
> > candidate for the subsystem component of the commit message, then I'm OK with 
> > drm/i915/gt, but then, the summary phrase of the commit message seems too 
> > general for the whole GT subsystem, not pointing to ring submission as the 
> > only submission method out of the three that's affected, and needs to be 
> > rephrased, I believe, while still kept short enough.  Maybe "Fix *legacy* 
> > timeline held on VMA alloc error" (with the 'left' word dropped)?
> >
> > Thanks,
> > Janusz
> >
> >> 
> >> Andi
> >> 
> >
> >
> >
> >
> 
> 




