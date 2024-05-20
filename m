Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9B28C9D17
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 14:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2D610E2AE;
	Mon, 20 May 2024 12:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESZzYUld";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F14510E238
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 12:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716207781; x=1747743781;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FIHPzrYBeBwApuNIfaSlsYWDNvGy7ZbVQrqLmZ/82pg=;
 b=ESZzYUldxLB3sNapFojSLiB66WseEOXPKtt7F3n0kf9a8S1KFOcNTV0x
 NdpUbGszxJjKubNDSRFWZ9MRwg32v7AUOQ45zPEwE7MiN5PM2X3of5Ddl
 VEFaeivgQYO5dpIW4rbsejvCmDNbuDLKCv7fPXWEGs74Ue7vllL1IS9Gf
 GjmUBJM0xhjqwb8vv65u/DInPLlwKSXJ9o6IryK7UTyBR8A5X6yT3gO57
 FDbtUUO+ZunUt0Z7Oyk9ihMxlKrlmAKQZK+j8Q1yzo1/aqizuE7jpnp40
 TltcwxVXc2+fQqkAc4sXCAw6rzeCw+/v4I/jM7/6C8bTgUXIESwEmGTVU A==;
X-CSE-ConnectionGUID: EGTDy9EUT0GLGn18fmS6cA==
X-CSE-MsgGUID: SefXA20JQFGWFe10qWk6sw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16121085"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="16121085"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 05:22:57 -0700
X-CSE-ConnectionGUID: BwU7Y7GMQkeBw3e/17TV/w==
X-CSE-MsgGUID: BjQEzPg3QwSQCXAimCM+iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32652526"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 05:22:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s922R-00000009J9i-2ohd; Mon, 20 May 2024 15:22:47 +0300
Date: Mon, 20 May 2024 15:22:47 +0300
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
Message-ID: <ZktAlza1zEke1eCx@smile.fi.intel.com>
References: <20240517171532.748684-1-devarsht@ti.com>
 <20240517173607.800549-1-devarsht@ti.com>
 <Zke6o3HYnUrgtD0K@smile.fi.intel.com>
 <7b8cd37b-5b16-2d99-ab62-5d6876e6571c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b8cd37b-5b16-2d99-ab62-5d6876e6571c@ti.com>
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

On Mon, May 20, 2024 at 05:11:18PM +0530, Devarsh Thakkar wrote:
> On 18/05/24 01:44, Andy Shevchenko wrote:
> > On Fri, May 17, 2024 at 11:06:07PM +0530, Devarsh Thakkar wrote:

[..]

> >> +#include <kunit/test.h>
> >> +#include <linux/gcd.h>
> > 
> >> +#include <linux/kernel.h>
> > 
> > Do you know why this header is included?
> 
> It includes all the other required headers (including those you mentioned
> below), and header list is probably copied from other files in same directory.
> But it does suffice the requirements as I have verified the compilation.

Yes, and one should follow IWYU principle and not cargo cult or whatever
arbitrary lists.

> >> +#include <linux/lcm.h>
> > 
> > + math.h // obviously
> > + module.h
> > 
> >> +#include <linux/reciprocal_div.h>
> > 
> > + types.h
> 
> All the above headers are already included as part of kernel.h

Yes, that's why you should not use "proxy" headers.
Have you read the top comment in the kernel.h?

-- 
With Best Regards,
Andy Shevchenko


