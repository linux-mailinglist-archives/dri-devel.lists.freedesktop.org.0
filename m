Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B44DDAD6F5C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 13:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D37710E7DF;
	Thu, 12 Jun 2025 11:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BaaOE7kA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259B510E7D7;
 Thu, 12 Jun 2025 11:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749728825; x=1781264825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NPb4X0LOu9QVzEwMLi/R6aw15Y4Kot6+gfJYzUpTj4o=;
 b=BaaOE7kAW2kA4PHvVYFMPsvmcSQW86jOgacJ5qTy3iT0jLD5n2bcsXCx
 zO4f1el0q19XjqmgtPtVdIpGAhytpjBiCXP32n6xgRCgO3Hcw1k3IKGTg
 7KDywfepi8uLWvXhoZy5kLeIgAdPfk7OsXs8IDIYIQsRlFFWHcKoAE3DT
 InYpBpoBv0pb4D5CdMG337LkPDENGdL+nV0vDTfx1LaG+G9D5ZdXhMGzF
 q0CTvilfqcm2StXIPCzi3JRaGb4Z1bsCwTYPb7U3tQel7OEH58Ha9GKH7
 M3ET6IiQyFI5oSWqsvV/RwHNCKLUVFQsvCch95MOW2lwkSxw2NzgMxhaM A==;
X-CSE-ConnectionGUID: uoqfRWITSeyUHuSruNye1A==
X-CSE-MsgGUID: PkzD0lMeQhKLJeTVaQ2l2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63248097"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="63248097"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:47:04 -0700
X-CSE-ConnectionGUID: /wpDZiuJSzaXgV6JIn9ByA==
X-CSE-MsgGUID: SOzdLKywTnijvpG9xhmWWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="147381524"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.156])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:47:00 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
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
Date: Thu, 12 Jun 2025 13:46:58 +0200
Message-ID: <8578860.NyiUUSuA9g@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <aEq6YquLee2oSt1i@ashyti-mobl2.lan>
References: <20250611104352.1014011-2-janusz.krzysztofik@linux.intel.com>
 <3881406.kQq0lBPeGt@jkrzyszt-mobl2.ger.corp.intel.com>
 <aEq6YquLee2oSt1i@ashyti-mobl2.lan>
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

On Thursday, 12 June 2025 13:30:42 CEST Andi Shyti wrote:
> Hi Janusz,
> 
> On Thu, Jun 12, 2025 at 11:45:46AM +0200, Janusz Krzysztofik wrote:
> > On Thursday, 12 June 2025 11:35:31 CEST Jani Nikula wrote:
> > > On Thu, 12 Jun 2025, Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> > > > On Wednesday, 11 June 2025 22:54:40 CEST Andi Shyti wrote:
> > > >> Hi Nitin,
> > > >> 
> > > >> On Wed, Jun 11, 2025 at 03:45:30PM +0000, Gote, Nitin R wrote:
> > > >> > [...]
> > > >> > > Subject: [PATCH] drm/i915/ring_submission: Fix timeline left held on VMA alloc
> > > >> > > error
> > > >> > >
> > > >> > 
> > > >> > Generally, it's preferred to use "drm/i915/gt:" file path over "drm/i915/ring_submission:"  file name in the commit title.
> > > >> 
> > > >> good observation, I missed it. I agree with Nitin on this, it can
> > > >> be fixed before merging.
> > > >
> > > > I'm not sure.  I found no single word on the *subsystem* component of the 
> > > > canonical patch format subject line (or commit message) expected to reflect 
> > > > any directory structure in case of DRM.
> > > 
> > > It's not about the directory structure, though, but rather about
> > > (admittedly unwritten) conventions. Usually about driver components,
> > > features or platforms.
> > > 
> > > See:
> > > 
> > > $ git log --since={5years} --no-merges --pretty=%s -- "<PATH>" | sed 's/:.*//' | sort | uniq -c | sort -rn
> > > 
> > > Where "<PATH>" is drivers/gpu/drm/i915/gt/intel_ring_submission.c or
> > > drivers/gpu/drm/i915/gt.
> > > 
> > > "ring" or "submission" is just not there in the prefix, at all.
> > 
> > I see.  Is there a convention for designating old, pre-execlists *platforms* 
> > as affected subsystem / area?  Or is describing it in the summary phrase of 
> > the commit message the only way?
> 
> it's an unwritten rule and my feeling is that these tings take
> their own track without anyone deciding it officially.
> 
> Indeed every community has its own way of doing it. As you know
> already, in i915 we have always used:
> 
> drm/i915:
> drm/i915/gt:
> drm/i915/gem:
> drm/i915/gt/guc: (or drm/i915/guc:)
> drm/i915/display:
> ...

I find this convention as more oriented on designating an area of 
responsibility rather than a component / feature / platform that is affected / 
fixed.  My feeling is that it should rather be the latter.

Anyway, in this particular case I propose to follow the current convention and 
add the word 'legacy' to the summary phrase, as I suggested before, unless you 
are able to propose something better.  We may discuss the convention doubts 
independently.

Thanks,
Janusz

> 
> pointing to the directory rather than the topic or the file.
> 
> In my opinion using "ring_submission:" is not wrong and it makes
> sense, but it's out of the ordinary and this would be the only
> patch doing it.
> 
> That's why this title is a little odd, unless we all agree to
> change and set a convention.
> 
> Thanks,
> Andi
> 




