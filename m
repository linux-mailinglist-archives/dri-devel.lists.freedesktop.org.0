Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C45CD7DF6A5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 16:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6EE10E8F0;
	Thu,  2 Nov 2023 15:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8173510E8F0;
 Thu,  2 Nov 2023 15:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698939666; x=1730475666;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vCsjbKy17pRUpW2uJl+oxDqlEWApGz3EOPnZNeFhj5Q=;
 b=fBPWqmIlYWetVzTvkoCAt78Gf4IyZZ78Bha6TNqlXgLmP7ScycHQNruW
 BZrbbvNKDVsREw9dHtLeUH7RWdJ/HLGFvLMM8D4e2j9grbHF2YgRAlWJP
 O/MWZnJ3ICjvm3OU7FJjWmnq3/uwSq9YcLtc/SRF22enLBXqDqYJabxx3
 eLbIhY2vrE5bPQ3kGhAO1cdz6kWbg59FReGz1FEQHzo5tnD6fPxI1MW33
 ydtplVD+K74ixDaWaB206+RyaBM6/8ctu/OKoAeZTPFwAKjBZcB/yWzW2
 MnmMzGANv4ZQ8rD0rutUqACYbNBXfaSQywhC5FGN8cB5Znchw6UdkmyLj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="391605327"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="391605327"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 08:40:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="737794897"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="737794897"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 08:40:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [rft, PATCH v3 00/15] drm/i915/dsi: 2nd attempt to get rid of
 IOSF GPIO
In-Reply-To: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
Date: Thu, 02 Nov 2023 17:40:46 +0200
Message-ID: <87zfzw17up.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 02 Nov 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> DSI code for VBT has a set of ugly GPIO hacks, one of which is direct
> talking to GPIO IP behind the actual driver's back. A second attempt
> to fix that is here.
>
> If I understood correctly, my approach should work in the similar way as
> the current IOSF GPIO.
>
> Hans, I believe you have some devices that use this piece of code,
> is it possible to give a test run on (one of) them?
>
> In v3:
> - incorporated series by Jani
> - incorporated couple of precursor patches by Hans
> - added Rb tag for used to be first three patches (Andi)
> - rebased on top of the above changes
> - fixed indexing for multi-community devices, such as Cherry View
>
> In v2:
> - added a few cleanup patches
> - reworked to use dynamic GPIO lookup tables
> - converted CHV as well
>
> Andy Shevchenko (8):
>   drm/i915/dsi: Replace while(1) with one with clear exit condition
>   drm/i915/dsi: Get rid of redundant 'else'
>   drm/i915/dsi: Replace check with a (missing) MIPI sequence name
>   drm/i915/dsi: Extract common soc_gpio_set_value() helper
>   drm/i915/dsi: Replace poking of VLV GPIOs behind the driver's back
>   drm/i915/dsi: Prepare soc_gpio_set_value() to distinguish GPIO
>     communities
>   drm/i915/dsi: Replace poking of CHV GPIOs behind the driver's back
>   drm/i915/iosf: Drop unused APIs
>
> Hans de Goede (2):
>   drm/i915/dsi: Remove GPIO lookup table at the end of
>     intel_dsi_vbt_gpio_init()
>   drm/i915/dsi: Fix wrong initial value for GPIOs in bxt_exec_gpio()

Assuming it all still works, and I do trust Hans' testing here quite a
bit, the above is

Acked-by: Jani Nikula <jani.nikula@intel.com>

Thanks for doing this!

>
> Jani Nikula (5):
>   drm/i915/dsi: assume BXT gpio works for non-native GPIO
>   drm/i915/dsi: switch mipi_exec_gpio() from dev_priv to i915
>   drm/i915/dsi: clarify GPIO exec sequence
>   drm/i915/dsi: rename platform specific *_exec_gpio() to
>     *_gpio_set_value()
>   drm/i915/dsi: bxt/icl GPIO set value do not need gpio source
>
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 355 +++++++------------
>  drivers/gpu/drm/i915/vlv_sideband.c          |  17 -
>  drivers/gpu/drm/i915/vlv_sideband.h          |   3 -
>  3 files changed, 137 insertions(+), 238 deletions(-)

-- 
Jani Nikula, Intel
