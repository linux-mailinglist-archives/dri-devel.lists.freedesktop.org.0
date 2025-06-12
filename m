Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 078B4AD6F0E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 13:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296B610E770;
	Thu, 12 Jun 2025 11:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwRkd3mE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB5B10E770;
 Thu, 12 Jun 2025 11:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749727849; x=1781263849;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DFafPJwGiRCe32M91hDM92wwi/i0KTwPEySPhRTW0/0=;
 b=WwRkd3mEUzzPti8yvIlf7N+e4J6qh2YhfkK2QX6gx3BTSESA6OohucD/
 T+j3awuWShHHwYfi+PtC1O8FkViiOd/TTWIxNOHRnR2FO176hFwjlPk30
 Ej7vNtodDEWCV40jk8Bvxj6fSQAqGkXIKNbQLjkmpxbnJjhXFtgW3Y4y3
 YvQbCNRZl4s6HMYTzlultpdpLjdInux4mgEmD9S0XvhW9kWAdnsICwCbH
 w/tjMZQi8eh5B6161ccRjfCFU1V3m+pmCyXNns3yXgcqxyo2l01EtpT58
 35L2DTlzdDTNyMFgFFDBKkd7EPM14DfEX82Pymd3xBza7vinmafmT4m/C Q==;
X-CSE-ConnectionGUID: y34WA5eAQluw6FfpABelVg==
X-CSE-MsgGUID: pkFp7oawQRSLyptTIXXFeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69470448"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="69470448"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:30:48 -0700
X-CSE-ConnectionGUID: 0x0GDJs5QuGwH2ozNK//hQ==
X-CSE-MsgGUID: 4EJl2qd8TfCRkKNo4i6i3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="147400888"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.108])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:30:45 -0700
Date: Thu, 12 Jun 2025 13:30:42 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: "Gote, Nitin R" <nitin.r.gote@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>,
 "Brzezinka, Sebastian" <sebastian.brzezinka@intel.com>,
 "Niemiec, Krzysztof" <krzysztof.niemiec@intel.com>,
 "Karas, Krzysztof" <krzysztof.karas@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/ring_submission: Fix timeline left held on VMA
 alloc error
Message-ID: <aEq6YquLee2oSt1i@ashyti-mobl2.lan>
References: <20250611104352.1014011-2-janusz.krzysztofik@linux.intel.com>
 <8536974.T7Z3S40VBb@jkrzyszt-mobl2.ger.corp.intel.com>
 <2765e513d57f59297300e19c394f1e2bd15da3ad@intel.com>
 <3881406.kQq0lBPeGt@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3881406.kQq0lBPeGt@jkrzyszt-mobl2.ger.corp.intel.com>
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

On Thu, Jun 12, 2025 at 11:45:46AM +0200, Janusz Krzysztofik wrote:
> On Thursday, 12 June 2025 11:35:31 CEST Jani Nikula wrote:
> > On Thu, 12 Jun 2025, Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> > > On Wednesday, 11 June 2025 22:54:40 CEST Andi Shyti wrote:
> > >> Hi Nitin,
> > >> 
> > >> On Wed, Jun 11, 2025 at 03:45:30PM +0000, Gote, Nitin R wrote:
> > >> > [...]
> > >> > > Subject: [PATCH] drm/i915/ring_submission: Fix timeline left held on VMA alloc
> > >> > > error
> > >> > >
> > >> > 
> > >> > Generally, it's preferred to use "drm/i915/gt:" file path over "drm/i915/ring_submission:"  file name in the commit title.
> > >> 
> > >> good observation, I missed it. I agree with Nitin on this, it can
> > >> be fixed before merging.
> > >
> > > I'm not sure.  I found no single word on the *subsystem* component of the 
> > > canonical patch format subject line (or commit message) expected to reflect 
> > > any directory structure in case of DRM.
> > 
> > It's not about the directory structure, though, but rather about
> > (admittedly unwritten) conventions. Usually about driver components,
> > features or platforms.
> > 
> > See:
> > 
> > $ git log --since={5years} --no-merges --pretty=%s -- "<PATH>" | sed 's/:.*//' | sort | uniq -c | sort -rn
> > 
> > Where "<PATH>" is drivers/gpu/drm/i915/gt/intel_ring_submission.c or
> > drivers/gpu/drm/i915/gt.
> > 
> > "ring" or "submission" is just not there in the prefix, at all.
> 
> I see.  Is there a convention for designating old, pre-execlists *platforms* 
> as affected subsystem / area?  Or is describing it in the summary phrase of 
> the commit message the only way?

it's an unwritten rule and my feeling is that these tings take
their own track without anyone deciding it officially.

Indeed every community has its own way of doing it. As you know
already, in i915 we have always used:

drm/i915:
drm/i915/gt:
drm/i915/gem:
drm/i915/gt/guc: (or drm/i915/guc:)
drm/i915/display:
...

pointing to the directory rather than the topic or the file.

In my opinion using "ring_submission:" is not wrong and it makes
sense, but it's out of the ordinary and this would be the only
patch doing it.

That's why this title is a little odd, unless we all agree to
change and set a convention.

Thanks,
Andi
