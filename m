Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3DF9E0349
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 14:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CBC10E73B;
	Mon,  2 Dec 2024 13:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cb6ZlMgg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD69110E73A;
 Mon,  2 Dec 2024 13:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733145849; x=1764681849;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=S+QBCKrqrUgbhsqn8TU051HAOleFVkL4NjSIVNEwaMM=;
 b=cb6ZlMggIzlQEt32XZi2bOI5GE18bJcxJGFHbC1S7QrRpyMJJybAF1nW
 TcQbJS9U0h+KnKjZSVNfsxxlYb31tOL+ojexgbaNXe1EixMOH/4096vL5
 McMzgSW2QfrrzCDxLKf6a3lrIsCDGjwp2K3Xr0xxBH+6P0Aj2hL7TNMlX
 guLXiz2dB+Xw9KoePBAryR9qSWzSTsisde3J7KHOj/3kAjqWIm/Q84TLM
 E3eZXqerS9rqETnfW0U5TKu+cAmINO9Py1c95yFWPGmDPaiJjQ427W36u
 ceK/XGaMDNOFBisQTcJF5h9hVOwj3zb/PlPy/2J/N+cPEAuWXkhpWu4KV A==;
X-CSE-ConnectionGUID: yMQXbOrhSw+5K6x+WzRZgg==
X-CSE-MsgGUID: LGJUgggkSjS/svPqhUVvSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33446586"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="33446586"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 05:24:09 -0800
X-CSE-ConnectionGUID: NSsJ8aW8TjSW66AJ+jLYtA==
X-CSE-MsgGUID: UwJSmSVJQfqhUsIdKuy4zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="92936987"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 05:24:07 -0800
Date: Mon, 2 Dec 2024 15:24:43 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>
Cc: intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
Message-ID: <Z021G3tmmRTi4iyl@ideak-desk.fi.intel.com>
References: <20241126161859.1858058-1-imre.deak@intel.com>
 <20241126161859.1858058-2-imre.deak@intel.com>
 <Z0nO-bwpbWPVryd6@ideak-desk.fi.intel.com>
 <20241129-wild-cobra-of-thunder-829d1f@houat>
 <Z0nn0VzawSCdOCKY@ideak-desk.fi.intel.com>
 <20241202-real-benevolent-skunk-a9f5e0@houat>
 <87ldwy5lvb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldwy5lvb.fsf@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 02, 2024 at 02:07:36PM +0200, Jani Nikula wrote:
> On Mon, 02 Dec 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > It's not about whether we have a problem or not: you introduce new
> > framework functions, you need to have kunit tests to check their
> > behaviour.
> 
> I don't fundamentally disagree with that goal, but it does seem like a
> pretty drastic policy change. I don't recall a discussion where we made
> that decision, nor can I find any documentation stating this. Or what
> exactly the requirement is; it's totally unclear to me.
> 
> Had I been involved, I would've pointed out that while adding tests is
> good, it inevitably increases the friction of adding new stuff to drm
> core. It's super tempting for people to just get their jobs done. If
> doing the right thing adds yet another hurdle, we may see more stuff
> being added in drivers instead of drm core.
> 
> (Case in point, we already hacked around the problem being solved here
> with commit d58f65df2dcb ("drm/i915/dp_mst: Fix connector initialization
> in intel_dp_add_mst_connector()"). We could've just dropped the ball
> right there.)

Fwiw, in this case adding tests for drm_connector_init_core() and
drm_connector_add() looks simple enough.

IIUC it's the 3 testcases in drmm_connector_init_tests[] performed for
drm_connector_init_core() and additional 3 test cases checking that (1)
drm_connector_init_core() doesn't add the connector to the connector
list, (2) drm_connector_add() adds it and (3) drm_connector_add() fails
(by not adding the connector to the list and emitting a dmesg WARN) if
drm_connector_init_core() was not called for the connector previously.
For the last test I actually need to add the corresponding assert/early
return to drm_connector_add().

If Maxim could confirm the above, I could resend the patchset adding
these tests.

--Imre

> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel
