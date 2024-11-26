Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E757F9D9739
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 13:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E95410E1C2;
	Tue, 26 Nov 2024 12:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnh/O4oi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38F810E1C2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 12:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732623862; x=1764159862;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZTHfXgFGRlIILfuHL+qBGlAm9C8PxmMo8Z9AFzfvBdw=;
 b=mnh/O4oiXq+T4TKhBnSOYeEt1fuyU4SjKO6VaT2zQjI37a+wSYDXtDye
 /p72QAMT1n02mVzIpBkJCFS9OV1FBgncKWDXXGCi8cr9AIptqXEPR7BoM
 znummhB9lagQByjOrZLvZq9m4eSxfabtCXiD+qTWA6zx5vXKMMGOujb0q
 TaqAoBwi1jMeahV1da2cWU+xMgM+vnjIlEuMwjBkmfC0V+EhmhceCehR4
 x5QNFz0NeXjT9s/b9xn/Cal4hxShTOdooglCr5xN6MzW2YvWyua4CsEpm
 3BHof8Hjm22m/Z9nDGxyKq2JyCVie5E2nzrgCnuufXcSUm2qbTIhQurbF g==;
X-CSE-ConnectionGUID: QpDJXvyVS7WNAgZyRw4M3A==
X-CSE-MsgGUID: pbgtUA29TTOj/lzjInDPKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="55278917"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="55278917"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 04:24:22 -0800
X-CSE-ConnectionGUID: p7mmBzIqQaSRBB7X5+uHcw==
X-CSE-MsgGUID: wzxtY/mSSE24Fp3vXFkb0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="96661073"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.49])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 04:24:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Sean Nyekjaer <sean@geanix.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Yannick
 Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
In-Reply-To: <20241126-spry-wildebeest-of-cubism-da0a9e@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <874j3uxptp.fsf@intel.com>
 <20241126-spry-wildebeest-of-cubism-da0a9e@houat>
Date: Tue, 26 Nov 2024 14:24:12 +0200
Message-ID: <871pyyxjwz.fsf@intel.com>
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

On Tue, 26 Nov 2024, Maxime Ripard <mripard@kernel.org> wrote:
> On Tue, Nov 26, 2024 at 12:16:34PM +0200, Jani Nikula wrote:
>> On Mon, 25 Nov 2024, Maxime Ripard <mripard@kernel.org> wrote:
>> > I wonder about the naming though (and prototype). I doesn't really
>> > validates a mode, but rather makes sure that a given rate is a good
>> > approximation of a pixel clock. So maybe something like
>> > drm_mode_check_pixel_clock?
>> 
>> Quoting myself from a few weeks back:
>> 
>> """
>> Random programming thought of the day: "check" is generally a terrible
>> word in a function name.
>> 
>> Checking stuff is great, but what do you expect to happen if the check
>> passes/fails? Do you expect the function to return on fail, or throw an
>> exception? Or just log about it? If you return a value, what should the
>> return value mean? It's hard to know without looking it up.
>> 
>> Prefer predicates instead, is_stuff_okay() is better than
>> check_stuff(). Or assert_stuff() if you don't return on failures.
>> """
>
> Both is_stuff_okay() or assert_stuff() return a boolean in my mind. If
> you want to return a mode status enum, I don't think they are better
> names.

Most functions returning enum drm_mode_status are called
something_something_mode_valid(). Not check something.

BR,
Jani.


-- 
Jani Nikula, Intel
