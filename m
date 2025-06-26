Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A34DAEA4B7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 19:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808AC10E2DB;
	Thu, 26 Jun 2025 17:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UC5BfVPU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC4910E2DB
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 17:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750960250; x=1782496250;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UZMd0+T4IhN2y3yokYchi5TGSxLvyBXEE27ktOgfKvc=;
 b=UC5BfVPUfbgNwR5ZJ1IGqz40S/FvjTdN+yPHwW1Ep4r/YRL4eK34Cj/l
 ADN2V+5fSCrcioWFn3TweuNl2D8FxGSvVpXPGVYyTv9vHiZOMBcHb7rPz
 /z0wDiLENS3ATT8HspO9HbWBDWDzceasaS7ipucCG+p6Yv6VE5L/GjpnB
 RXFeJmYNNuYFC2FI2Cx+hO39GQoSZfgMk+GOsw7wk4mWM6GuZe9dbURdL
 RwK1ti0XmMuHQ6zjHXIp/t+AAZN4wxNnlkpJi9McboMjiCQc05A2E0bjj
 bGLQAcOZAWIf0kVigBxfIKkeaZUH0dmNInoC/mxHNChk7FIsx2RTjyMmU A==;
X-CSE-ConnectionGUID: D8F+4mUHRNO1VQ3iTwYdzw==
X-CSE-MsgGUID: PD8+7BDCTB6cgb590nCt3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="75813418"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="75813418"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 10:50:50 -0700
X-CSE-ConnectionGUID: 1DP5BoyNS6mdfTCO+7FL5Q==
X-CSE-MsgGUID: hnaHcBa6SSqTfeOWKmlQyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="153312962"
Received: from smile.fi.intel.com ([10.237.72.52])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 10:50:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1uUqkF-0000000AFCS-2MyF; Thu, 26 Jun 2025 20:50:43 +0300
Date: Thu, 26 Jun 2025 20:50:43 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix potential memory leak in
 fbtft_framebuffer_alloc()
Message-ID: <aF2Ic8BP0zWS6R19@smile.fi.intel.com>
References: <20250626172412.18355-1-abdun.nihaal@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626172412.18355-1-abdun.nihaal@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Thu, Jun 26, 2025 at 10:54:10PM +0530, Abdun Nihaal wrote:
> In the error paths after fb_info structure is successfully allocated,
> the memory allocated in fb_deferred_io_init() for info->pagerefs is not
> freed. Fix that by adding the cleanup function on the error path.

Thanks for the report and the fix! My comments below.

...

>  release_framebuf:
> +	fb_deferred_io_cleanup(info);
>  	framebuffer_release(info);

While the fix sounds good, there are still problems in the driver in this area:

1) managed resources allocation is mixed up with plain allocations
(as you discovery hints);

2) the order in fbtft_framebuffer_release() is asymmetrical to what
we have in fbtft_framebuffer_alloc().

I would recommend to study this code a bit more and provide the following
patches as a result:

1) fixing the order in fbtft_framebuffer_release();

2) moving vmem allocation closer to when it's needed, i.e. just after
successful allocation of the info; at the same time move txbuf allocation
from managed to unmanaged (drop devm, add respective kfree() calls where
it's required);

3) this patch.

All three should have the respective Fixes tags and hence may be backported.


-- 
With Best Regards,
Andy Shevchenko


