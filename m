Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DAAAD6BB0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 11:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB2D10E793;
	Thu, 12 Jun 2025 09:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fiXjbYES";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE8210E793;
 Thu, 12 Jun 2025 09:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749719311; x=1781255311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vPDeoOnUG9T7WpDp8aMQporpD7A0NAgX7Ug3eOgz77E=;
 b=fiXjbYESt6gGlTNp4hXl1+ego66JPRs7WUql2FHGM+yiRfQ0XmqcAlvL
 /BPs4UFm/UEELs1/n/l3lvMctmTWSKevP5t9GGKo9YoW8gpNRZKO2uHHi
 wIoAa0tFPR8sJj5GPMQBZg3PCcfqbTmFrgLINsQTcVlO1aaagqC7J6Dpy
 XLbBVJQGd3FAQ2aJIpYibXKburZolrWErCSxVD34XVMLJa1c91zM7AJcQ
 9z2AwhBHF9dHDTlxU0cAKIugbjiSupjrd2m30IJnAnEEaaxNSPPJw+/g+
 kc+2GD6T01MIjdaQXMaE7CMp+vUKGAqhIYJA/gqLij5vbnBcL/yrXUveW Q==;
X-CSE-ConnectionGUID: K1dXX67zSqKlOzGoMDhPNw==
X-CSE-MsgGUID: 7D8W3Qy0RUGdzZdSc/OM3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="39500915"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="39500915"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 02:08:24 -0700
X-CSE-ConnectionGUID: ligeonFMTCuMLQMkH4LxqQ==
X-CSE-MsgGUID: U0GmRdzyRMeS7MRNtOkkCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152606712"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.156])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 02:08:21 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
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
Date: Thu, 12 Jun 2025 11:08:18 +0200
Message-ID: <8536974.T7Z3S40VBb@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <aEntEHqvZ10SaE8u@ashyti-mobl2.lan>
References: <20250611104352.1014011-2-janusz.krzysztofik@linux.intel.com>
 <IA3PR11MB89873936B6D887A59ABD909CD075A@IA3PR11MB8987.namprd11.prod.outlook.com>
 <aEntEHqvZ10SaE8u@ashyti-mobl2.lan>
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

On Wednesday, 11 June 2025 22:54:40 CEST Andi Shyti wrote:
> Hi Nitin,
> 
> On Wed, Jun 11, 2025 at 03:45:30PM +0000, Gote, Nitin R wrote:
> > [...]
> > > Subject: [PATCH] drm/i915/ring_submission: Fix timeline left held on VMA alloc
> > > error
> > >
> > 
> > Generally, it's preferred to use "drm/i915/gt:" file path over "drm/i915/ring_submission:"  file name in the commit title.
> 
> good observation, I missed it. I agree with Nitin on this, it can
> be fixed before merging.

I'm not sure.  I found no single word on the *subsystem* component of the 
canonical patch format subject line (or commit message) expected to reflect 
any directory structure in case of DRM.  However, if you think it should for 
some reason, or you just don't recognize i915 ring submission as a good 
candidate for the subsystem component of the commit message, then I'm OK with 
drm/i915/gt, but then, the summary phrase of the commit message seems too 
general for the whole GT subsystem, not pointing to ring submission as the 
only submission method out of the three that's affected, and needs to be 
rephrased, I believe, while still kept short enough.  Maybe "Fix *legacy* 
timeline held on VMA alloc error" (with the 'left' word dropped)?

Thanks,
Janusz

> 
> Andi
> 




