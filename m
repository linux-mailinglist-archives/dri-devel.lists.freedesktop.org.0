Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63200A549A9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 12:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B34510E949;
	Thu,  6 Mar 2025 11:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="keckk8NZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3B310E950;
 Thu,  6 Mar 2025 11:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741261255; x=1772797255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bTEUk+6VnBTihhXT4Le7u457efB+7ppYZXXke7+ATxM=;
 b=keckk8NZ6IoSBwFLqniaRNeMso1jJaH+1GJQyD0K0eoFmuTQ4sj8Gbup
 t4U6VKZ3txdv34QHiJ/UQe6l6L1h4oDOGv0Fre0UhkQMFOdmxMkGtVFrA
 s8hXus87FLQwqqXZscO5TLhv3+l5mLne1BT/27pJH2sPQex0aGELQuimc
 YJouiDAEx7oKfrAEo41Y63zYiuTeQFWSQxC63i+UiIDj4cJyUzOGGhYmm
 nI4Wi3Yy1TpW55tuw4Vv9xcxNegxAPbtRbtrwPuJu4wuy5IFjxBNzlWil
 qlHkkX9mV8wKgP8P31vwg3SQmPHgzl/4NqwUEV03Ce4CzNI4TX6GPZE5E g==;
X-CSE-ConnectionGUID: QUqxeQp1T4u3xfHZuovJ3Q==
X-CSE-MsgGUID: RH/XiryzROGZWe0SHf3tnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41514795"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="41514795"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 03:40:55 -0800
X-CSE-ConnectionGUID: +WQR3oquQES/0SENHI01Zw==
X-CSE-MsgGUID: 1ftJT9LkSkG7XVshHF9WwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="124010411"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.151])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 03:40:52 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v3 0/4] drm/i915: Fix harmfull driver register/unregister
 assymetry
Date: Thu, 06 Mar 2025 12:40:48 +0100
Message-ID: <2748512.BddDVKsqQX@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <3de2rgkr5lwzqs2v3rvmyds5zsjtj4eoitsojs5kd4bl545nn4@rzkcinr6f2bi>
References: <20250305191152.164615-6-janusz.krzysztofik@linux.intel.com>
 <3de2rgkr5lwzqs2v3rvmyds5zsjtj4eoitsojs5kd4bl545nn4@rzkcinr6f2bi>
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

Hi Krzysztof,

Thank you for looking at it.

On Thursday, 6 March 2025 12:00:40 CET Krzysztof Karas wrote:
> Hi Janusz,
> 
> throughout the series you modify the code right after
> introducing it. 

Yes, that split among patches reflects my way of getting to a solution that 
not only resolves the issue but also tries to address comments I got and take 
care of resulting code clarity.  That's why I mentioned the possibility of 
squashing one or more follow-ups with the initial patch.  Patch 1/4 alone is a 
minimal fix that actually resolves the issues.  The rest is only about 
satisfying Andi's comments (patch 2/4) and simplifying the code (patches 
3-4/4) that we may or may not want to apply or squash.

> How about changing the order of things a bit:
>  1) order the functions in a symmetrical way between
>   register/unregister steps and group them as you see necessary,
>   (At that point you would not be fixing the issue yet, but
>   prepare the code for further changes)

Please note that I still haven't achieved full symmetry.  If I only had clues 
from authors of patches that introduced asymmetry on why they did it that way 
then I would think of reordering the steps to achieve full symmetry, each in a 
separate patch, together with meaningful justification and possibly 
alternative solutions to issues that asymmetry was trying to address.  Without 
those clues, more work on analysis and more testing is needed, I believe, and 
that would be still more beyond the scope of a quick fix I initially intended.

> 
>  2) then introduce the new flag along with all the labels needed
>   for clean unregistration.

The flag, or a single global point of indication if device registration 
succeeded or not, was an idea suggested by Andi, and now objected by Jani from 
the display code PoV, so not a final solution.

BTW, have you seen v1 of the series[1]?  How do you find it, compared to v2/3?

Thanks,
Janusz

[1] https://lore.kernel.org/dri-devel/20250206180927.2237256-5-janusz.krzysztofik@linux.intel.com/

> 
> I think that way you could reduce number of patches (and changes
> in code needing review) while also fixing the original issue.
> 
> Overall, I believe this is a good effort and much needed change
> in registration and unregistering process.
> 
> Best Regards,
> Krzysztof
> 
> > Starting with commit ec3e00b4ee27 ("drm/i915: stop registering if
> > drm_dev_register() fails"), we may return from i915_driver_register()
> > immediately, skipping remaining registration steps.  However, the
> > _unregister() counterpart called at device remove knows nothing about that
> > skip and executes reverts of all those steps.  As a consequence, a number
> > of kernel warnings that taint the kernel are triggered.
> > 
> > Introduce a flag that indicates device registration status and raise it on
> > device registration success.  As a minimum (first patch), when that flag
> > is found not set while unregistering the driver, jump over those reverts
> > of registration steps omitted after device registration failure that are
> > not ready for being called unconditionally (and trigger the kernel
> > warnings).
> > 
> > With the second patch, also jump over reverts of other driver registration
> > steps that were not called due to device registration failure.  Some
> > unregister function calls, found implementing additional steps beyond the
> > register reverts, are still executed.
> > 
> > To simplify i915_driver_unregister() code, the third patch makes sure
> > reverts of driver registration steps executed before potentially
> > unsuccessful device registration are symmetrically called after
> > the device unplug.
> > 
> > Finally, the last patch further simplifies the i915_driver_unregister()
> > code by moving two required steps down, right after device unplug.
> > 
> > The first patch may be squashed with one or more of its follow-ups if so
> > decided.
> > 
> > Janusz Krzysztofik (4):
> >   drm/i915: Skip harmful unregister steps if not registered
> >   drm/i915: Omit unnecessary driver unregister steps
> >   drm/i915: Fix asymmetry in PMU register/unregister step order
> >   drm/i915: Group not skipped unregister steps
> > 
> >  drivers/gpu/drm/i915/gt/intel_gt.c |  6 ++++++
> >  drivers/gpu/drm/i915/i915_driver.c | 18 ++++++++++++------
> >  drivers/gpu/drm/i915/i915_drv.h    |  2 ++
> >  3 files changed, 20 insertions(+), 6 deletions(-)
> > 
> 




