Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4589E071B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 16:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF70410E7AA;
	Mon,  2 Dec 2024 15:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DpKl0AmQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD39210E7A6;
 Mon,  2 Dec 2024 15:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733153487; x=1764689487;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=xy9bm06E42vnVMbka6YhC0lCJPaiurRtpUSaXv5qyNE=;
 b=DpKl0AmQhgRpTd8Z0vKawt2DSlxsWIveV6Ytn3S9nV2f9W/5fytseU9r
 iYXO+/rheoDs6a1hfxXiRDZAHeQue8eXigI5qApszFjvAskRjpdCaq44O
 Yfs0AScF+d+MeVn3LmwjOFLcjZjxostrvDhHm2Z+LpZuMXpmdcOyvLTpL
 oUtX6j+e7xezYIpgICrLNFYtjg+SysxhSX047jaG3c2yHd8wHlkidBcPJ
 ScnpH3gqleb/Pn8w9NFNk+fFMX8iIJ00Yvy/HRJs5xMHX+NMzDUIa8LHz
 EFu7xoXmDm9DNCCYhl1/tMMaGzLY56vT0CPJM0GanwzldTTSgOVNvctm1 Q==;
X-CSE-ConnectionGUID: B9zZmsE4RuCOiXbOy7AyUA==
X-CSE-MsgGUID: eCpbrZLoTUGdIR/U0uRcNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33204325"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="33204325"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 07:31:09 -0800
X-CSE-ConnectionGUID: IbnHEAmQQP6iKGMiB9P4nA==
X-CSE-MsgGUID: kySFOHf8SlmLkDSxZuDvTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="116396332"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 07:31:04 -0800
Date: Mon, 2 Dec 2024 17:31:43 +0200
From: Imre Deak <imre.deak@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
Message-ID: <Z03S35Z-Vj94cW_7@ideak-desk.fi.intel.com>
References: <20241126161859.1858058-1-imre.deak@intel.com>
 <20241126161859.1858058-2-imre.deak@intel.com>
 <Z0nO-bwpbWPVryd6@ideak-desk.fi.intel.com>
 <20241129-wild-cobra-of-thunder-829d1f@houat>
 <Z0nn0VzawSCdOCKY@ideak-desk.fi.intel.com>
 <20241202-real-benevolent-skunk-a9f5e0@houat>
 <87ldwy5lvb.fsf@intel.com>
 <Z021G3tmmRTi4iyl@ideak-desk.fi.intel.com>
 <20241202-bald-finicky-coyote-e9ff4c@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-bald-finicky-coyote-e9ff4c@houat>
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

On Mon, Dec 02, 2024 at 04:07:56PM +0100, Maxime Ripard wrote:
> On Mon, Dec 02, 2024 at 03:24:43PM +0200, Imre Deak wrote:
> > On Mon, Dec 02, 2024 at 02:07:36PM +0200, Jani Nikula wrote:
> > > On Mon, 02 Dec 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > > > It's not about whether we have a problem or not: you introduce new
> > > > framework functions, you need to have kunit tests to check their
> > > > behaviour.
> > > 
> > > I don't fundamentally disagree with that goal, but it does seem like a
> > > pretty drastic policy change. I don't recall a discussion where we made
> > > that decision, nor can I find any documentation stating this. Or what
> > > exactly the requirement is; it's totally unclear to me.
> > > 
> > > Had I been involved, I would've pointed out that while adding tests is
> > > good, it inevitably increases the friction of adding new stuff to drm
> > > core. It's super tempting for people to just get their jobs done. If
> > > doing the right thing adds yet another hurdle, we may see more stuff
> > > being added in drivers instead of drm core.
> > > 
> > > (Case in point, we already hacked around the problem being solved here
> > > with commit d58f65df2dcb ("drm/i915/dp_mst: Fix connector initialization
> > > in intel_dp_add_mst_connector()"). We could've just dropped the ball
> > > right there.)
> > 
> > Fwiw, in this case adding tests for drm_connector_init_core() and
> > drm_connector_add() looks simple enough.
> > 
> > IIUC it's the 3 testcases in drmm_connector_init_tests[] performed for
> > drm_connector_init_core() and additional 3 test cases checking that (1)
> > drm_connector_init_core() doesn't add the connector to the connector
> > list, (2) drm_connector_add() adds it and (3) drm_connector_add() fails
> > (by not adding the connector to the list and emitting a dmesg WARN) if
> > drm_connector_init_core() was not called for the connector previously.
> > For the last test I actually need to add the corresponding assert/early
> > return to drm_connector_add().
> > 
> > If Maxim could confirm the above, I could resend the patchset adding
> > these tests.
> 
> Yep, sounds great, thanks!

Ok. The subtest (3) above checking if drm_connector_add() fails as
expected if drm_connector_init_core() was not called before would also
generate a dmesg warn, via a

	if (drm_WARN_ON(dev, !connector->funcs))
		return;

early return I'm adding to drm_connector_add() in the new version of the
patchset. This fails the kunit test, as always when an error or warn is
printed to the log. I couldn't find a good way to suppress this warn
(don't want to modify the function being tested) to make the testcase
pass. I think this test case could be omitted, since it's tested by all
users implicitly anyway via the above assert. Is this acceptable?

> Maxime
