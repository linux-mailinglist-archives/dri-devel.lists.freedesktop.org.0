Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B6EA5025A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 15:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFEF7890EB;
	Wed,  5 Mar 2025 14:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kKTremse";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA091890EB;
 Wed,  5 Mar 2025 14:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741185480; x=1772721480;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CSy21FFYCfkrs1Vebz77But+YBdPWb0R0yTM3O4u1EQ=;
 b=kKTremse5eyg9ZXtDJuecfydhipXilq3j1a/MRaUuHOu1LuY3hFMM7US
 rIIxvQ1XAnIEeTlIhrhxafshUDZGctRkbPpxg+IWEb+i0QyYbOv70Eb4H
 PGG9tzo0RmOi9L5gh6enU8xl6/AcznhngW4vdpsIvsbppfLGYdPSHYDHr
 WY+iPthxwkL425XQ4mC85lbS5ntI+ZlLmWwsPNhTDT0ZKDnBs/k234l/I
 hOGKG9q7u8Gd1/AB2sGbgn+nKhDHsBtJrcomVefjTAKh0/rAglmVGIab9
 AInQ2s8AA9A9k1reoQ42TIDBFA+Xcf2EctEf4POwwFV6ncOHS2WTmxmTh w==;
X-CSE-ConnectionGUID: 3vO4Zn0sRIeCm1mGw52Tvw==
X-CSE-MsgGUID: 3J6tIF+tSGuPKAzTRwPZjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42350768"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="42350768"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 06:37:58 -0800
X-CSE-ConnectionGUID: yba5WHXCRs6NCv7yprlgGg==
X-CSE-MsgGUID: /XxRzxeSShWGF56o44N/DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118526770"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 06:37:54 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tppsc-0000000HRDU-3UrN; Wed, 05 Mar 2025 16:37:50 +0200
Date: Wed, 5 Mar 2025 16:37:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: mailhol.vincent@wanadoo.fr
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 5/8] drm/i915: Convert REG_GENMASK* to fixed-width
 GENMASK_*
Message-ID: <Z8hhvovVmX-xLStQ@smile.fi.intel.com>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-5-1873dcdf6723@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-fixed-type-genmasks-v4-5-1873dcdf6723@wanadoo.fr>
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

On Wed, Mar 05, 2025 at 10:00:17PM +0900, Vincent Mailhol via B4 Relay wrote:
> From: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Now that include/linux/bits.h implements fixed-width GENMASK_*, use them

GENMASK_*()

and in the Subject

REG_GENMASK*()

> to implement the i915/xe specific macros. Converting each driver to use
> the generic macros are left for later, when/if other driver-specific
> macros are also generalized.

-- 
With Best Regards,
Andy Shevchenko


