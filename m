Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4296A35E78
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 14:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDB310EC7D;
	Fri, 14 Feb 2025 13:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0p+ej/5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2349910EC7D;
 Fri, 14 Feb 2025 13:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739538741; x=1771074741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LQwnMV0d0+05gKz2LKoXRWQ1J9l2MVCrgOdIQ4OHQvc=;
 b=M0p+ej/5PYeky5X3HNvmd7HgRBDpQR55Npc8tdmZqzVGey0Eyb8CwHFM
 kSiAQ/iPOwsFviOfdo3m/3wD97OMTSmaTxhJbBbZZifC4VottznPYeSJY
 ZafBsVt4+pRYbQMuSBuCoGR4Rk/cG7YAcAhGoG+u5VgPKky3nVniytO+q
 /3lb+z6OZZrPC5yIR+P4Fs20T3sDuO1+OgpSecW4SmcSaHby1PpbyQylL
 N1KG5x4yO+8xdRm6dZw2d9vnqa2+UJ7eyzeVMjyH+FRh3zJeARiH8wC2D
 MYOAsUw7eq7AzRFj0ocWE1oZnrb+okV8ZPYdDijGV/8/BvOoHOd1kmL9w A==;
X-CSE-ConnectionGUID: JPMHVRcEQae8nXcvVpQ6TA==
X-CSE-MsgGUID: 2F0rGwaETcWvrmAzAShxsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50930437"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="50930437"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 05:12:21 -0800
X-CSE-ConnectionGUID: g43u8gNDS9+90VvJOQ8/Mg==
X-CSE-MsgGUID: AV6cnYDGRNOfSbpr8PMrqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="114092763"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.78])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 05:12:18 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH 0/3] drm/i915: Fix harmfull driver register/unregister
 assymetry
Date: Fri, 14 Feb 2025 14:12:16 +0100
Message-ID: <7767606.EvYhyI6sBW@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Z6y_Ap7eLszsKCtz@ashyti-mobl2.lan>
References: <20250206180927.2237256-5-janusz.krzysztofik@linux.intel.com>
 <13696895.uLZWGnKmhe@jkrzyszt-mobl2.ger.corp.intel.com>
 <Z6y_Ap7eLszsKCtz@ashyti-mobl2.lan>
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

On Wednesday, 12 February 2025 16:32:18 CET Andi Shyti wrote:
> Hi Janusz,
> 
> On Tue, Feb 11, 2025 at 01:12:37PM +0100, Janusz Krzysztofik wrote:
> > On Monday, 10 February 2025 14:01:19 CET Andi Shyti wrote:
> > > On Thu, Feb 06, 2025 at 07:07:38PM +0100, Janusz Krzysztofik wrote:
> > > > We return immediately from i915_driver_register() if drm_dev_register()
> > > > fails, skipping remaining registration steps.  However, the _unregister()
> > > > counterpart called at device remove knows nothing about that skip and
> > > > executes reverts for all those steps.  For that to work correctly, those
> > > > revert functions must be resistant to being called even on uninitialized
> > > > objects, or we must not skip their initialization.
> > > > 
> > > > Three cases have been identified and fixes proposed.  Call traces are
> > > > taken from CI results of igt@i915_driver_load@reload-with-fault-injection
> > > > execution, reported to several separate Gitlab issues (links provided).
> > > > 
> > > > Immediate return was introduced to i915_driver_register() by commit
> > > > ec3e00b4ee27 ("drm/i915: stop registering if drm_dev_register() fails"),
> > > > however, quite a few things have changed since then.  That's why I haven't
> > > > mentioned it in a Fixes: tag to avoid it being picked up by stable, which
> > > > I haven't tested.
> > > 
> > > I'm not fully convinced about this series as I think that you are
> > > fixing a subset of what needs to be handled properly. What about
> > > hwmon? What about gt? what about debugfs?
> > 
> > For all of those, their _unregister() functions seem to be designed to be safe 
> > to call even if not registered.  Like e.g. kfree() -- you can call it safely 
> > even with NULL argument, you don't need to check for NULL and call it 
> > conditionally.  However, ...
> > 
> > > 
> > > In my opinion we need to check in _unregister whether the
> > > drm_dev_register has succeded 
> > 
> > I agree with you that it would be more clear if we skipped not only 
> > _register() but also _unregister() steps symmetrically, based on result of 
> > drm_dev_register().
> > 
> > > and one way would be, e.g., to
> > > check for the drm minor value, or even set the drm device tu NULL
> > > (first things that come to my mind, maybe there are smarter ways
> > > of doing it). 
> > 
> > As long as drm doesn't provide explicit support for checking if registration 
> > succeeded other than examining the return value of drm_dev_register(), I would 
> > rather store that value somewhere in our drm_i915_private structure instead of 
> > depending on drm internals.  What do you think?
> 
> yes, I think we could have a local flag.

OK, I've tried that approach, but that revealed issues with some unregister 
steps still needed for clean driver unbind even if their counterpart register 
steps were skipped on probe.  Then, to make things working cleanly, we need to 
review and test each register/unregister pair of functions for their potential 
asymmetry, detect potential issues, invent and implement solutions, and only 
then we may feel free to skip unregister steps safely if their register 
counterparts were not called.  And that scope doesn't sound like a quick fix, 
especially as those problematic register/unregister steps may belong to 
different driver features, then may need attention and participation of more 
than one team.

With that in mind, what steps you think we should take now?

Thanks,
Janusz

> 
> Andi
> 
> > Thanks,
> > Janusz
> > 
> > 
> > > This way we could skip some of the _unregister()
> > > steps.
> > > 
> > > Andi
> > > 
> > 
> > 
> > 
> 




