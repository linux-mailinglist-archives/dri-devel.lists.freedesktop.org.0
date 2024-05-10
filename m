Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7558C273F
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA00410E4C2;
	Fri, 10 May 2024 15:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwvST95I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546A910EDA6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 15:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715353290; x=1746889290;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dMN3JddNCU2TCtaus7k5EYytVw6hgfYHO3cWEFNdI7w=;
 b=MwvST95IbpIMG4njNBrQY+2x6UC1MOw3N3LQ1qTEeF2pzIV1Hy7MQ1Jn
 +N2hEVZQ+RgAAXD6wb54E3zVc4kJQs+KTxaqengb0a7TLQ2uQnqnHQWVY
 OnJfIp4QuiuL5iifKxTlyMulIApUdgq7ZDMes7HSqQOk47Uhx/3vi1Fg9
 c8sPrD2DmcFuJ8G8SChzjlHsnDBxRv+4X6r6Tw6ISVYhAN3IYee799M0P
 G5gJxfA1TESf0PUsxleaoOpwhzAuNPNRKT+mJBmqnJi6Kf2uNhckEcP1C
 enzzEwHrP1DuuRUvy995Rp/z6fxiVtV1Uz9nTjvI3dJyg/fJrtOZIn5+a A==;
X-CSE-ConnectionGUID: Uda4BrUJQzCUxaaLavWMxQ==
X-CSE-MsgGUID: vWp/EugwRg6TzG8M/w4JHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11189306"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11189306"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:01:29 -0700
X-CSE-ConnectionGUID: /PStARpCQnOn9LyomMB+qw==
X-CSE-MsgGUID: dtewjjKuS5WbMxK+3Las3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="34288929"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:01:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s5RkM-000000068XT-0pEH; Fri, 10 May 2024 18:01:18 +0300
Date: Fri, 10 May 2024 18:01:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
 akpm@linux-foundation.org, gregkh@linuxfoundation.org,
 adobriyan@gmail.com, jani.nikula@intel.com, p.zabel@pengutronix.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
 vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
 detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
 andrzej.p@collabora.com, nicolas@ndufresne.ca
Subject: Re: [PATCH v7 6/8] math.h Add macros to round to closest specified
 power of 2
Message-ID: <Zj42vTpyH71TWeTk@smile.fi.intel.com>
References: <20240509183952.4064331-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509183952.4064331-1-devarsht@ti.com>
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

On Fri, May 10, 2024 at 12:09:52AM +0530, Devarsh Thakkar wrote:
> Add macros to round to nearest specified power of 2.

This is not what they are doing. For the above we already have macros defined.

> Two macros are added :

(Yes, after I wrapped to comment this line looks better on its own,
 so whatever will be the first sentence, this line should be separated
 from.)

> round_closest_up and round_closest_down which round up to nearest multiple

round_closest_up() and round_closest_down()


> of 2 with a preference to round up or round down respectively if there are
> two possible nearest values to the given number.

You should reformulate, because AFAICS there is the crucial difference
from these and existing round_*_pow_of_two().

> This patch is inspired from the Mentor Graphics IPU driver [1] which uses
> similar macro locally and which can be updated to use this generic macro
> instead along with other drivers having similar requirements.
> 
> [1]:
> https://elixir.bootlin.com/linux/v6.8.9/source/drivers/gpu/ipu-v3/ipu-image-convert.c#L480

Instead of this, just add a patch to convert that driver to use this new macro.
Besides, this paragraph should go to the comment/changelog area below.

> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> V1->V6 (No change, patch introduced in V7)
> ---

-- 
With Best Regards,
Andy Shevchenko


