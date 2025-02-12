Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2D5A32A1D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 16:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6C810E15C;
	Wed, 12 Feb 2025 15:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KssVxWi2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA8C10E0E5;
 Wed, 12 Feb 2025 15:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739374347; x=1770910347;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Zo9nrJFspdbBBfofYyJGi7b11uInHAMpm9QVdhcKQvs=;
 b=KssVxWi2iL3Qx9rhzYTKxCLtb77OvttPWRc0kkBX73YRQpZ+t2YnXk0c
 FHhsb19roNEjbdaxyaeXa8lQLCqYwLrz3zMVox6xUu8k7Mk9YQ5Z4d5lJ
 4+9zXwcwAqIfFCqA8m2aRuPFZsxMEj8WvBFjxw1BiZmLEzHA0e+YLAOfn
 YFGIG0ocARFbcj6rtgwW8hhYeUkpzazrnLTJVpKuhgobOh+1M4CzBve3a
 iIpVAqlTcQR5JnajY/FIDEPSCyaTUIrCu9lq7jouFO+42LUZYYGadfH0w
 FqDxtRvLBhEnCfGKWZQLFR3LXUcPsNpHA8yhsXkl4UCUMrS5Iw0q6cusG A==;
X-CSE-ConnectionGUID: sW3IsilmQWecVs8G9eFNRQ==
X-CSE-MsgGUID: 5ItoderaSWuSvQ5J6kA/kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="51431229"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="51431229"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 07:32:27 -0800
X-CSE-ConnectionGUID: qv5n21chQr62dCF7FkFBCg==
X-CSE-MsgGUID: ZXuwtN8LQ22uYUJ9omGTxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116975121"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.176])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 07:32:22 -0800
Date: Wed, 12 Feb 2025 16:32:18 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH 0/3] drm/i915: Fix harmfull driver register/unregister
 assymetry
Message-ID: <Z6y_Ap7eLszsKCtz@ashyti-mobl2.lan>
References: <20250206180927.2237256-5-janusz.krzysztofik@linux.intel.com>
 <Z6n4nx7V2D1z0zWA@ashyti-mobl2.lan>
 <13696895.uLZWGnKmhe@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13696895.uLZWGnKmhe@jkrzyszt-mobl2.ger.corp.intel.com>
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

On Tue, Feb 11, 2025 at 01:12:37PM +0100, Janusz Krzysztofik wrote:
> On Monday, 10 February 2025 14:01:19 CET Andi Shyti wrote:
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
> 
> For all of those, their _unregister() functions seem to be designed to be safe 
> to call even if not registered.  Like e.g. kfree() -- you can call it safely 
> even with NULL argument, you don't need to check for NULL and call it 
> conditionally.  However, ...
> 
> > 
> > In my opinion we need to check in _unregister whether the
> > drm_dev_register has succeded 
> 
> I agree with you that it would be more clear if we skipped not only 
> _register() but also _unregister() steps symmetrically, based on result of 
> drm_dev_register().
> 
> > and one way would be, e.g., to
> > check for the drm minor value, or even set the drm device tu NULL
> > (first things that come to my mind, maybe there are smarter ways
> > of doing it). 
> 
> As long as drm doesn't provide explicit support for checking if registration 
> succeeded other than examining the return value of drm_dev_register(), I would 
> rather store that value somewhere in our drm_i915_private structure instead of 
> depending on drm internals.  What do you think?

yes, I think we could have a local flag.

Andi

> Thanks,
> Janusz
> 
> 
> > This way we could skip some of the _unregister()
> > steps.
> > 
> > Andi
> > 
> 
> 
> 
