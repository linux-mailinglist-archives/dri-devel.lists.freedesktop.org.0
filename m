Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD4F9D954B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 11:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CA010E815;
	Tue, 26 Nov 2024 10:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RFYztgLF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EE910E815
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 10:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732616204; x=1764152204;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=G6ISiKyYNdfCX1O1jSv9YCVzyH3xaVsB7/c5w8mAdLM=;
 b=RFYztgLFhI4+YJq8oWBZ1xwPO7eA4IQOhYGknjzz7lsh54yZJHDnj3ED
 mL/FxOmc40H1QpWBqmK+dWLYq7Agwmy1JjLpDjX/8Nc5ZAYiterHiwuJ6
 pBUrgIbTAjfqkSD6B9eqEkLiIQNfQdJuv1dqVIYsmkPuAlFXZuHwowh8y
 POyV5ZUVTTa5XgLFA3qOAs3XOx75oucDE9+OBDLSeFLGIzd/U90YzurDS
 EkCfkkX38LEFdXXgBvTutI7NsjcN/1MrXfREjoRJCOsOVnrucjlwPbTmN
 rLtL9RR/dCYNvbukZkatfXsAja9+37Fad+n+JlLoiKj+q/gXkK0r+hb51 Q==;
X-CSE-ConnectionGUID: MQPN/M96QuKNzF6gku0Law==
X-CSE-MsgGUID: OFAdHB0LRoO46opIGmtxOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="36428242"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="36428242"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 02:16:43 -0800
X-CSE-ConnectionGUID: UPr7mqOHTa+cmtoDfqjH7w==
X-CSE-MsgGUID: 1LK8FOPvQtWU825GVRcwKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="91511370"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.49])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 02:16:37 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Sean Nyekjaer <sean@geanix.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
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
In-Reply-To: <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
Date: Tue, 26 Nov 2024 12:16:34 +0200
Message-ID: <874j3uxptp.fsf@intel.com>
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

On Mon, 25 Nov 2024, Maxime Ripard <mripard@kernel.org> wrote:
> I wonder about the naming though (and prototype). I doesn't really
> validates a mode, but rather makes sure that a given rate is a good
> approximation of a pixel clock. So maybe something like
> drm_mode_check_pixel_clock?

Quoting myself from a few weeks back:

"""
Random programming thought of the day: "check" is generally a terrible
word in a function name.

Checking stuff is great, but what do you expect to happen if the check
passes/fails? Do you expect the function to return on fail, or throw an
exception? Or just log about it? If you return a value, what should the
return value mean? It's hard to know without looking it up.

Prefer predicates instead, is_stuff_okay() is better than
check_stuff(). Or assert_stuff() if you don't return on failures.
"""


BR,
Jani.


-- 
Jani Nikula, Intel
