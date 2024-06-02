Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF968D76CD
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 17:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E6E10E069;
	Sun,  2 Jun 2024 15:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezwjcvfo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D1710E069;
 Sun,  2 Jun 2024 15:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717342713; x=1748878713;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TIaUFkf0FFnEzNfQE0w20WGmR2pdMyWXT29kVZamx3I=;
 b=ezwjcvfoeGtxGtCSeTrpCgr81aYB2oByzUQEAip2jVnER+ESuP/oABib
 Yt2f4PS4RRbANC1f04AolYcuVWFkGl/QEH6a/IYN5Fx4EyFkGV8gdzxOT
 vEz/MTpPIftlzXDM9Ubx17fsixFX7rlUt3M5c9sGOGxJhEnuFqaOU+8/E
 c2pJFBOgvUvopXrfhpQyJo5Qz67rM1mCyS6HRIJwb/3XpPxYlORCCcv0b
 FgZyK8645/uAHVXFYbVTl0hiR5kuyXwfWCjep2EqIPao8rr4qHDoeJBo+
 9DcHbLnFBXy4Q4j2auGxIOwfQd8qavHeBcVgtvZPuGGZbiM97dP8jM6q1 Q==;
X-CSE-ConnectionGUID: 4IO7dlJdQoCGvLSzuvak8g==
X-CSE-MsgGUID: wIUVJlVuRfupHvDrNvcIJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="24495333"
X-IronPort-AV: E=Sophos;i="6.08,209,1712646000"; d="scan'208";a="24495333"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2024 08:38:32 -0700
X-CSE-ConnectionGUID: tOhcpZ8iQ9KhzLvCFM4ENg==
X-CSE-MsgGUID: gWx3hshVRbeRybVixBv/qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,209,1712646000"; d="scan'208";a="67482848"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2024 08:38:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sDnHu-0000000D3Hp-2jgD; Sun, 02 Jun 2024 18:38:26 +0300
Date: Sun, 2 Jun 2024 18:38:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Lewis Huang <lewis.huang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 1/1] drm/amd/display: Fix too big frame size
Message-ID: <ZlyR8rohohgp-DD4@smile.fi.intel.com>
References: <20240602142103.3259613-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240602142103.3259613-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Sun, Jun 02, 2024 at 05:21:03PM +0300, Andy Shevchenko wrote:
> Compilation fails on arm with:
> 
>   link_factory.c:743:1: error: the frame size of 1032 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]
> 
> Fix the frame size by allocation one of the big structures.

Fixed even in better way in 0b6dc64b4e22 ("drm/amd/display: Refactor
construct_phy function in dc/link/link_factory.c").

-- 
With Best Regards,
Andy Shevchenko


