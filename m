Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D45A55378
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 18:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533C510EA4D;
	Thu,  6 Mar 2025 17:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W+Utj4D1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A099510E2B2;
 Thu,  6 Mar 2025 17:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741283495; x=1772819495;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p2iSreTYKbljOg3NhjKET7agWJ9OBLv8elOeZggvxJo=;
 b=W+Utj4D11vxlJc0sG0dBb5DDKJSHZboHE6J9JVEwS2vIQCJsChSEoR2w
 c34WuFnly4O+//7DcVW4nVLE6mD2T51Ncv5ry6RUg6rZvFkqp2uAVDyGN
 Edi5XTOwLOmZ8++8H+us48fx9gNIDoxiYw9MLto/EMq0FtUZgR24Rp2cW
 NWSVz6KIeO4672ZfNpdmHduGY+oFxonIzcWmFvHh4/GIt3t/hXzgiRBs5
 NcAUV+FEvX3GKzHGG9H+JYpZxstuH0uIjAmrppNLu15dQlj7aT848dJmD
 tznYtwbG+/GC5RX8dtHnBLqNIgVqzA0OF/sS7uDvAnvMy0zQgMY0TXDg0 A==;
X-CSE-ConnectionGUID: 9IJ0mye6RMiAWlX8o1+ICA==
X-CSE-MsgGUID: o9Y09kJvR2CViEugygSaqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42451571"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="42451571"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 09:51:33 -0800
X-CSE-ConnectionGUID: TCVBOzqsQ/qZJgtD7x6Kew==
X-CSE-MsgGUID: jcaAc1YpR7ezFh9fO3B40g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="124187676"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 09:51:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tqFNV-00000000B38-3Uf7; Thu, 06 Mar 2025 19:51:25 +0200
Date: Thu, 6 Mar 2025 19:51:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Yury Norov <yury.norov@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 1/7] bits: split the definition of the asm and non-asm
 GENMASK()
Message-ID: <Z8ngnTDqsNAiZDIz@smile.fi.intel.com>
References: <20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr>
 <20250306-fixed-type-genmasks-v5-1-b443e9dcba63@wanadoo.fr>
 <Z8mdk3z7t42CWfmZ@smile.fi.intel.com>
 <84abfaef-0fb9-4fd4-a657-0cc80eb1de0f@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84abfaef-0fb9-4fd4-a657-0cc80eb1de0f@wanadoo.fr>
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

On Fri, Mar 07, 2025 at 12:07:45AM +0900, Vincent Mailhol wrote:
> On 06/03/2025 at 22:05, Andy Shevchenko wrote:
> > On Thu, Mar 06, 2025 at 08:29:52PM +0900, Vincent Mailhol via B4 Relay wrote:
> >> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

...

> >> -/*
> >> - * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
> >> - * disable the input check if that is the case.
> >> - */
> > 
> > I believe this comment is still valid...
> > 
> >> +#else /* defined(__ASSEMBLY__) */
> > 
> > 
> > ...here.
> > 
> > Otherwise justify its removal in the commit message.
> 
> OK. I will restore the comment in v6, but will move it to the #else
> branch,

Isn't it what I suggested? :-)

> like this:

>   #else /* defined(__ASSEMBLY__) */
> 
>   /*
>    * BUILD_BUG_ON_ZERO is not available in h files included from asm
>    * files, so no input checks in assembly.
>    */
>   #define GENMASK(h, l)		__GENMASK(h, l)
>   #define GENMASK_ULL(h, l)	__GENMASK_ULL(h, l)
> 
>   #endif /* !defined(__ASSEMBLY__) */
> 
> >> +#define GENMASK(h, l)		__GENMASK(h, l)
> >> +#define GENMASK_ULL(h, l)	__GENMASK_ULL(h, l)
> >> +
> >> +#endif /* !defined(__ASSEMBLY__) */

-- 
With Best Regards,
Andy Shevchenko


