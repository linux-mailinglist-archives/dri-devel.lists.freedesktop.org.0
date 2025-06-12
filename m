Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C41AD6C58
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 11:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5759110E763;
	Thu, 12 Jun 2025 09:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNG5DXyu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B41810E763;
 Thu, 12 Jun 2025 09:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749720941; x=1781256941;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4TNCs982FiGs28ddr1bI8JP6JakPzEBXKdqbdOy47m8=;
 b=BNG5DXyugvqnfyCEn+1//nBFbGvTLzPAekCIEkhpeUf7mHLWeZCzMfgp
 umL0cBHL6vk73BgPGKi+njrgho0x7NIg0hJpqnAtvKwEX8gAAs8JR0lNN
 L18sWvvKy+7oXV7qEMzXqeKZvPfEuHocN4DxNJ0d0Bn2vZZ16SoEQkYXR
 Vj58iaQVgrz7EQ9NP76+06tjGLEC0v2W47xZOpxM7EVg4qrqv6r/4SqKG
 LkIUBI1ZV1fca64AyTrTQeHKvZtY9bdonmnVxrP+MDFbAO14vAmWopJTO
 Hj16fBtFkeuUGp0xOOjnyO1MRHXkYdn1MLSDtWP4IxgaT2ctyyMwkTqge w==;
X-CSE-ConnectionGUID: FFCf7X9/TbqjK+CpvxqZ/w==
X-CSE-MsgGUID: alnB1NaYSoWBdlqv+WUo8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51879801"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51879801"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 02:35:40 -0700
X-CSE-ConnectionGUID: CH2F8s9JTHuFH7wd1JD2Dg==
X-CSE-MsgGUID: HhU03jM7S0Ok4hhfizu58w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="147451451"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.242])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 02:35:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, "Gote, Nitin R"
 <nitin.r.gote@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Chris
 Wilson <chris.p.wilson@linux.intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 "Brzezinka, Sebastian" <sebastian.brzezinka@intel.com>, "Niemiec,
 Krzysztof" <krzysztof.niemiec@intel.com>, "Karas, Krzysztof"
 <krzysztof.karas@intel.com>, intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/ring_submission: Fix timeline left held on VMA
 alloc error
In-Reply-To: <8536974.T7Z3S40VBb@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250611104352.1014011-2-janusz.krzysztofik@linux.intel.com>
 <IA3PR11MB89873936B6D887A59ABD909CD075A@IA3PR11MB8987.namprd11.prod.outlook.com>
 <aEntEHqvZ10SaE8u@ashyti-mobl2.lan>
 <8536974.T7Z3S40VBb@jkrzyszt-mobl2.ger.corp.intel.com>
Date: Thu, 12 Jun 2025 12:35:31 +0300
Message-ID: <2765e513d57f59297300e19c394f1e2bd15da3ad@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 12 Jun 2025, Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> On Wednesday, 11 June 2025 22:54:40 CEST Andi Shyti wrote:
>> Hi Nitin,
>> 
>> On Wed, Jun 11, 2025 at 03:45:30PM +0000, Gote, Nitin R wrote:
>> > [...]
>> > > Subject: [PATCH] drm/i915/ring_submission: Fix timeline left held on VMA alloc
>> > > error
>> > >
>> > 
>> > Generally, it's preferred to use "drm/i915/gt:" file path over "drm/i915/ring_submission:"  file name in the commit title.
>> 
>> good observation, I missed it. I agree with Nitin on this, it can
>> be fixed before merging.
>
> I'm not sure.  I found no single word on the *subsystem* component of the 
> canonical patch format subject line (or commit message) expected to reflect 
> any directory structure in case of DRM.

It's not about the directory structure, though, but rather about
(admittedly unwritten) conventions. Usually about driver components,
features or platforms.

See:

$ git log --since={5years} --no-merges --pretty=%s -- "<PATH>" | sed 's/:.*//' | sort | uniq -c | sort -rn

Where "<PATH>" is drivers/gpu/drm/i915/gt/intel_ring_submission.c or
drivers/gpu/drm/i915/gt.

"ring" or "submission" is just not there in the prefix, at all.


BR,
Jani.

> However, if you think it should for 
> some reason, or you just don't recognize i915 ring submission as a good 
> candidate for the subsystem component of the commit message, then I'm OK with 
> drm/i915/gt, but then, the summary phrase of the commit message seems too 
> general for the whole GT subsystem, not pointing to ring submission as the 
> only submission method out of the three that's affected, and needs to be 
> rephrased, I believe, while still kept short enough.  Maybe "Fix *legacy* 
> timeline held on VMA alloc error" (with the 'left' word dropped)?
>
> Thanks,
> Janusz
>
>> 
>> Andi
>> 
>
>
>
>

-- 
Jani Nikula, Intel
