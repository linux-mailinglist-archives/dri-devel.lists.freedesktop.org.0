Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BE78C8D38
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 22:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C68610EEFB;
	Fri, 17 May 2024 20:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SnPeFEJF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0EE10E23D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 20:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715976879; x=1747512879;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CMo0WJMBF0rNZkT1/Sd8atUX0pOmKxbrbHh8DwrNGLM=;
 b=SnPeFEJF/Wq8eeLncbQick1leaqbI/KiQGFX+wFcJ9+hIz5wHlmO28+9
 7wZIpnjiCnHUGhzDGkI/WlqtOqXaBUtLOgpRB3HxwfyZ2vAnMzT8juAx2
 tTMoriFBT5lPTSOIFhZmxyILYy8W+V6uxQydGfBXinN0q7N1jUSBFVEd5
 KpkHa/gIqnYzvUH+C6J65AeYmcs93xwhjstglNrWpYavlPBbZvKhzCGv+
 ptWf5hOhBFfyfZxOJnNPp9xxcn2nbk4yjF6OMU8e2Ui+04ClDHIRBSJKS
 42stdx06DN1j5eUvizPACU+khEMFnHtOjqoH8BeoFFwKMcKsVzuN20Fo+ Q==;
X-CSE-ConnectionGUID: ZEsu+MrBRCuSw2DDXasmCA==
X-CSE-MsgGUID: XRjqXxtsSP6xZj/PHg/CcQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12363858"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="12363858"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 13:14:38 -0700
X-CSE-ConnectionGUID: uQN1YsdERpalYkIRHbnWkw==
X-CSE-MsgGUID: VzG7v7+/Rdy7n3ygv6cxLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="62739448"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 13:14:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s83yG-00000008cHX-0b7U; Fri, 17 May 2024 23:14:28 +0300
Date: Fri, 17 May 2024 23:14:27 +0300
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
 andrzej.p@collabora.com, nicolas@ndufresne.ca, davidgow@google.com,
 dlatypov@google.com
Subject: Re: [PATCH v8 07/10] lib: add basic KUnit test for lib/math
Message-ID: <Zke6o3HYnUrgtD0K@smile.fi.intel.com>
References: <20240517171532.748684-1-devarsht@ti.com>
 <20240517173607.800549-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517173607.800549-1-devarsht@ti.com>
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

On Fri, May 17, 2024 at 11:06:07PM +0530, Devarsh Thakkar wrote:
> From: Daniel Latypov <dlatypov@google.com>
> 
> Add basic test coverage for files that don't require any config options:
> * part of math.h (what seem to be the most commonly used macros)
> * gcd.c
> * lcm.c
> * int_sqrt.c
> * reciprocal_div.c
> (Ignored int_pow.c since it's a simple textbook algorithm.)
> 
> These tests aren't particularly interesting, but they
> * provide short and simple examples of parameterized tests
> * provide a place to add tests for any new files in this dir
> * are written so adding new test cases to cover edge cases should be
>   easy
>   * looking at code coverage, we hit all the branches in the .c files

...

> [devarsht: Rebase to 6.9 and change license to GPL]

I'm not sure that you may change license. It needs the author's confirmation.

> ---
> Changes since v6:
> * Rebase to linux-next, change license to GPL as suggested by checkpatch.

Note, checkpatch.pl is not false positives free. Be careful
with what it suggests.

> +#include <kunit/test.h>
> +#include <linux/gcd.h>

> +#include <linux/kernel.h>

Do you know why this header is included?

> +#include <linux/lcm.h>

+ math.h // obviously
+ module.h

> +#include <linux/reciprocal_div.h>

+ types.h

...

Other than above, LGTM.

-- 
With Best Regards,
Andy Shevchenko


