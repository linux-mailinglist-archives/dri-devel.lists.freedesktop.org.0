Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5240CA2ED19
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 14:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A7310E0CC;
	Mon, 10 Feb 2025 13:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eE1vYfIK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7FB10E0CC;
 Mon, 10 Feb 2025 13:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739192487; x=1770728487;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wnaoV5c704SJLyYs6aGPkBEQYorIEi92OyXM147ADyo=;
 b=eE1vYfIKPd7GhcL99G5UwDBc1d9039Q+WpPFxDvWluyi9DdkDzt1SVCb
 5uC9B3qROzoY7D9ADQvVuzucD6mkEJdhC4QSTZA9X11HB6A6Vidb/xEV0
 ZKnmf++V7U/a4F20CaHk5B5pE8bauT+DX3fbKTeLpCHHgZ1H3r+BnpxRs
 YZFNXXJMspzDkvxHfFVn8cYXmjGaimlI/Lgc580XUWbJFxtViPWxjn1hv
 hxpqvpmhQfhB/O2130/vxbUIyjaKPcz0yjd177NfE4E007w9MkusuAqSa
 eelnqh2At/9KYZYvGcWT5l2I673aceBQ2yiU7P+GvuJ187Y04zsR9yprS A==;
X-CSE-ConnectionGUID: LQVKCF8eRk+DhAq4vnrRuw==
X-CSE-MsgGUID: +bcrpljLQci7N+7rMOTJDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39636921"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="39636921"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 05:01:27 -0800
X-CSE-ConnectionGUID: E90ow1noTLKXqF1dzxTe7g==
X-CSE-MsgGUID: VRc4n6PbT6GB/JnYBmnK/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="112125929"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.212])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 05:01:22 -0800
Date: Mon, 10 Feb 2025 14:01:19 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH 0/3] drm/i915: Fix harmfull driver register/unregister
 assymetry
Message-ID: <Z6n4nx7V2D1z0zWA@ashyti-mobl2.lan>
References: <20250206180927.2237256-5-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206180927.2237256-5-janusz.krzysztofik@linux.intel.com>
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

On Thu, Feb 06, 2025 at 07:07:38PM +0100, Janusz Krzysztofik wrote:
> We return immediately from i915_driver_register() if drm_dev_register()
> fails, skipping remaining registration steps.  However, the _unregister()
> counterpart called at device remove knows nothing about that skip and
> executes reverts for all those steps.  For that to work correctly, those
> revert functions must be resistant to being called even on uninitialized
> objects, or we must not skip their initialization.
> 
> Three cases have been identified and fixes proposed.  Call traces are
> taken from CI results of igt@i915_driver_load@reload-with-fault-injection
> execution, reported to several separate Gitlab issues (links provided).
> 
> Immediate return was introduced to i915_driver_register() by commit
> ec3e00b4ee27 ("drm/i915: stop registering if drm_dev_register() fails"),
> however, quite a few things have changed since then.  That's why I haven't
> mentioned it in a Fixes: tag to avoid it being picked up by stable, which
> I haven't tested.

I'm not fully convinced about this series as I think that you are
fixing a subset of what needs to be handled properly. What about
hwmon? What about gt? what about debugfs?

In my opinion we need to check in _unregister whether the
drm_dev_register has succeded and one way would be, e.g., to
check for the drm minor value, or even set the drm device tu NULL
(first things that come to my mind, maybe there are smarter ways
of doing it). This way we could skip some of the _unregister()
steps.

Andi
