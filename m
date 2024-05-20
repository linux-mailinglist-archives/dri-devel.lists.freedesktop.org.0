Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E789F8C9EE1
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 16:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8A110E22D;
	Mon, 20 May 2024 14:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U5u7d1NX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9414A10E22D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 14:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716215714; x=1747751714;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yCoPR1d+Zt+QtoUbnC3otqSv3QoByt1aVGPymXoVu5Y=;
 b=U5u7d1NXhq4z7FMTINQmbgMHKIHAiZ8OarvD4hIpHE8Cba9PCjWn1C8w
 GGv0AteNCSIQlMkpe6NPOXtoAwQf6l7rmXyYOWj8kBHRFsCRm2s+YoGzY
 J4JGrfSyNtVGNGK2Ez/bNRBtYuF8lGLUYA4V9dKjQPboZs6veT3KlVfrN
 a11ifo05wzrPePviDMU92Gyu4awXnbqfoIb8N6wE1ctOKkUEKzEoFLsVx
 4vo5AiUVqylIpmNHYbz37/cXNXyQTBjz6s85PQwg0ReGr02qc7HdbljWa
 iMighBxHslfh499uG5BCx9xgsEO1v0Oda4niYRN/agRaMr7lLg2l+yWhg w==;
X-CSE-ConnectionGUID: piAmpckWS32UmsJwdwQXRA==
X-CSE-MsgGUID: NBZDsUwhQteWSg1cGHksxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="29866683"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="29866683"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 07:35:13 -0700
X-CSE-ConnectionGUID: 8ZK9kJk8RlmKxp8jpC69jA==
X-CSE-MsgGUID: SsWd1+giTGaMnFnAdrEnAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32588040"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 07:35:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s946S-00000009L88-12iK; Mon, 20 May 2024 17:35:04 +0300
Date: Mon, 20 May 2024 17:35:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: Daniel Latypov <dlatypov@google.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
 sebastian.fricke@collabora.com, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, adobriyan@gmail.com,
 jani.nikula@intel.com, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
 vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
 detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
 andrzej.p@collabora.com, nicolas@ndufresne.ca, davidgow@google.com
Subject: Re: [PATCH v8 07/10] lib: add basic KUnit test for lib/math
Message-ID: <ZktfmF1a7gzc-hqB@smile.fi.intel.com>
References: <20240517171532.748684-1-devarsht@ti.com>
 <20240517173607.800549-1-devarsht@ti.com>
 <Zke6o3HYnUrgtD0K@smile.fi.intel.com>
 <7b8cd37b-5b16-2d99-ab62-5d6876e6571c@ti.com>
 <ZktAlza1zEke1eCx@smile.fi.intel.com>
 <01bd1d88-2cff-ad12-c7fb-3f2eddcfd899@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01bd1d88-2cff-ad12-c7fb-3f2eddcfd899@ti.com>
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

On Mon, May 20, 2024 at 07:51:24PM +0530, Devarsh Thakkar wrote:
> On 20/05/24 17:52, Andy Shevchenko wrote:
> > On Mon, May 20, 2024 at 05:11:18PM +0530, Devarsh Thakkar wrote:
> >> On 18/05/24 01:44, Andy Shevchenko wrote:
> >>> On Fri, May 17, 2024 at 11:06:07PM +0530, Devarsh Thakkar wrote:

[..]

> > Yes, and one should follow IWYU principle and not cargo cult or whatever
> > arbitrary lists.
> 
> Agreed.

> >>>> +#include <linux/lcm.h>
> >>>
> >>> + math.h // obviously
> >>> + module.h
> >>>
> >>>> +#include <linux/reciprocal_div.h>
> >>>
> >>> + types.h
> >>
> >> All the above headers are already included as part of kernel.h
> > 
> > Yes, that's why you should not use "proxy" headers.
> > Have you read the top comment in the kernel.h?
> 
> Yes, it says it is not recommended to include this inside another header file.
> Although here we are adding it inside c file, but I can still try avoid it and
> include only the required headers instead of kernel.h as you recommended.

Right, but the first sentence there is
"This header has combined a lot of unrelated to each other stuff."

Can you explain how you use in your code all that unrelated stuff?
For example, how do you use *trace_*() calls? Or maybe might_*() calls?
or anything else that is directly provided by kernel.h?

Besides IWYU principle above, it's good to have a justification for each
inclusion the C file has. I believe there is no a such in _this_ case.

-- 
With Best Regards,
Andy Shevchenko


