Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19178A32A2B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 16:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D98D10E8F4;
	Wed, 12 Feb 2025 15:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFm21eyB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237AB10E1B4;
 Wed, 12 Feb 2025 15:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739374523; x=1770910523;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rQ3TldLRiVyp0kSi7T/ZG7Y2zghjDJKkitr1rne4T4Y=;
 b=jFm21eyBous4pQczzXA84sCH3zuqdpxL3zx9KVs6HnM85xycG0TV6DjD
 Yol3ggF8Ayl9atXdXz1ASaVVBX8WPteTVLdSB3smjzYv+5fIVrPnFX0LO
 VSxj18YTCfpDbNI6naoCstyYzrugZ8SFNLviZPOiG7FOEqO5fOcs+CfOK
 Cj4zKFy7Ar5dqGGNvT8BKSLkAMZN5YwC8WxW5+IrbivPFKyYg/FMbFAof
 VawFmTyrSZwxKlhySd4rBIO0ziNtuqGj8yXs9f2hT2Dvh/h4e//h0yFQk
 ZQvnln0WN5/V/l3yEBDW4u+UnCsmwRZd4jAyNv+VX5B4bOj1tt+1UFbnL A==;
X-CSE-ConnectionGUID: Vf3dkCyhSq+YvAhmA82POQ==
X-CSE-MsgGUID: k6zcvNCmQkK7YEQt/VuwPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="43803298"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="43803298"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 07:35:23 -0800
X-CSE-ConnectionGUID: 7Hol4WQSSsW0UAyqo2p0HQ==
X-CSE-MsgGUID: vH6O1icBSrqtSj09sjzRXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="112811721"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.176])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 07:35:19 -0800
Date: Wed, 12 Feb 2025 16:35:16 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH 0/3] drm/i915: Fix harmfull driver register/unregister
 assymetry
Message-ID: <Z6y_tE7DvfirNwLh@ashyti-mobl2.lan>
References: <20250206180927.2237256-5-janusz.krzysztofik@linux.intel.com>
 <Z6n4nx7V2D1z0zWA@ashyti-mobl2.lan>
 <tdyxqxcuigkc54zrrue4e6nqdhczgwbhn7z4bbw4h4kgfqmata@uckh7vqzx6ua>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tdyxqxcuigkc54zrrue4e6nqdhczgwbhn7z4bbw4h4kgfqmata@uckh7vqzx6ua>
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

On Wed, Feb 12, 2025 at 12:50:17PM +0100, Krzysztof Niemiec wrote:
> On 2025-02-10 at 14:01:19 GMT, Andi Shyti wrote:
> > On Thu, Feb 06, 2025 at 07:07:38PM +0100, Janusz Krzysztofik wrote:
> > > We return immediately from i915_driver_register() if drm_dev_register()
> > > fails, skipping remaining registration steps.  However, the _unregister()
> > > counterpart called at device remove knows nothing about that skip and
> > > executes reverts for all those steps.  For that to work correctly, those
> > > revert functions must be resistant to being called even on uninitialized
> > > objects, or we must not skip their initialization.
> > > 
> > > Three cases have been identified and fixes proposed.  Call traces are
> > > taken from CI results of igt@i915_driver_load@reload-with-fault-injection
> > > execution, reported to several separate Gitlab issues (links provided).
> > > 
> > > Immediate return was introduced to i915_driver_register() by commit
> > > ec3e00b4ee27 ("drm/i915: stop registering if drm_dev_register() fails"),
> > > however, quite a few things have changed since then.  That's why I haven't
> > > mentioned it in a Fixes: tag to avoid it being picked up by stable, which
> > > I haven't tested.
> > 
> > I'm not fully convinced about this series as I think that you are
> > fixing a subset of what needs to be handled properly. What about
> > hwmon? What about gt? what about debugfs?
> > 
> > In my opinion we need to check in _unregister whether the
> > drm_dev_register has succeded and one way would be, e.g., to
> > check for the drm minor value, or even set the drm device tu NULL
> > (first things that come to my mind, maybe there are smarter ways
> > of doing it). This way we could skip some of the _unregister()
> > steps.
> > 
> 
> Is there any situation in which having the driver loaded after failing
> drm_dev_register() is of any use? Because if not, instead of recording
> the fact of registration failure, we can just stop the driver from
> loading altogether by checking drm_dev_register()'s return value,
> then calling _only_ the required _unregister steps as cleanup in an
> error path, and propagating the result up to driver probe. This way we
> don't need to store any additional information at all.

as long as the driver works, why pushing it to fail? Janusz's
patch is really showing the case.

Andi
