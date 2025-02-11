Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8072A30B79
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 13:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175A010E08F;
	Tue, 11 Feb 2025 12:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xv8jvP/x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BBF10E08F;
 Tue, 11 Feb 2025 12:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739276094; x=1770812094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yRU+veMeZ9dU+2UI+YbuMheNYBlmGSBDgyhRUucGsBg=;
 b=Xv8jvP/xy3F/UkDGSv5a+v/PugpzBWXY9F0cLuXEmkmH7oLIzDwlRxq+
 SEN64TdKqbJkg3NM4+ixeL37/WL4LHkQV0fyRvmgPQo43dGoIK+Zyc95A
 KPtVKfSMTRcBe/t3Xc5ACSKvc/Mg0udl4n8q7KC2vbTq7IKfpm2NhuzJU
 Jy/+ieX4HpAoIa9NZjLLYWQA/bVMoh4p5y7UGZZtsH29o7LV1KhiM06qf
 fO+PR/JT/aeXg4rJ3fY6mxvy/JojZJC5T2W0pt8MJUkwUQRqaDcrFrAjf
 a/d6A6L/sBi8XEU4TGsEdh/HDgbSrO22yzFuJMJnAckf/e2qtkcI2m6Wp g==;
X-CSE-ConnectionGUID: Sk/U8Zx1QXW4VIJVBNUKnA==
X-CSE-MsgGUID: kZ2aNMy9SWi/V7nXLxYcQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="62361159"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="62361159"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 04:14:54 -0800
X-CSE-ConnectionGUID: JKP2L97PRqySfnLi+MfuvA==
X-CSE-MsgGUID: aRlKtyb4S9O2WcldvUXWmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117410182"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.85])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 04:14:51 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH 0/3] drm/i915: Fix harmfull driver register/unregister
 assymetry
Date: Tue, 11 Feb 2025 13:12:37 +0100
Message-ID: <13696895.uLZWGnKmhe@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Z6n4nx7V2D1z0zWA@ashyti-mobl2.lan>
References: <20250206180927.2237256-5-janusz.krzysztofik@linux.intel.com>
 <Z6n4nx7V2D1z0zWA@ashyti-mobl2.lan>
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

Thank you for review.

On Monday, 10 February 2025 14:01:19 CET Andi Shyti wrote:
> Hi Janusz,
> 
> On Thu, Feb 06, 2025 at 07:07:38PM +0100, Janusz Krzysztofik wrote:
> > We return immediately from i915_driver_register() if drm_dev_register()
> > fails, skipping remaining registration steps.  However, the _unregister()
> > counterpart called at device remove knows nothing about that skip and
> > executes reverts for all those steps.  For that to work correctly, those
> > revert functions must be resistant to being called even on uninitialized
> > objects, or we must not skip their initialization.
> > 
> > Three cases have been identified and fixes proposed.  Call traces are
> > taken from CI results of igt@i915_driver_load@reload-with-fault-injection
> > execution, reported to several separate Gitlab issues (links provided).
> > 
> > Immediate return was introduced to i915_driver_register() by commit
> > ec3e00b4ee27 ("drm/i915: stop registering if drm_dev_register() fails"),
> > however, quite a few things have changed since then.  That's why I haven't
> > mentioned it in a Fixes: tag to avoid it being picked up by stable, which
> > I haven't tested.
> 
> I'm not fully convinced about this series as I think that you are
> fixing a subset of what needs to be handled properly. What about
> hwmon? What about gt? what about debugfs?

For all of those, their _unregister() functions seem to be designed to be safe 
to call even if not registered.  Like e.g. kfree() -- you can call it safely 
even with NULL argument, you don't need to check for NULL and call it 
conditionally.  However, ...

> 
> In my opinion we need to check in _unregister whether the
> drm_dev_register has succeded 

I agree with you that it would be more clear if we skipped not only 
_register() but also _unregister() steps symmetrically, based on result of 
drm_dev_register().

> and one way would be, e.g., to
> check for the drm minor value, or even set the drm device tu NULL
> (first things that come to my mind, maybe there are smarter ways
> of doing it). 

As long as drm doesn't provide explicit support for checking if registration 
succeeded other than examining the return value of drm_dev_register(), I would 
rather store that value somewhere in our drm_i915_private structure instead of 
depending on drm internals.  What do you think?

Thanks,
Janusz


> This way we could skip some of the _unregister()
> steps.
> 
> Andi
> 




