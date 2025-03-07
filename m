Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9A1A56FB5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 18:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E3110EC28;
	Fri,  7 Mar 2025 17:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZyB0eml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9784910EC23;
 Fri,  7 Mar 2025 17:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741370059; x=1772906059;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XCkRz2C+VBAY5TEjrnuDs2evKJARDhM5uRMblUwUFRY=;
 b=XZyB0emljxxEibr0NvY4xPCarlwEhBDGcxMNmJy+V1zJmdCPu/FqPF1p
 IF0KIhbDsJ5b/VpIh4yi1wLqStn0RNNgKZzG8eRNZpahB7fSF/ljjE95L
 Tuop2zp+0DUy1ksjJAQg58Bktsnd7KeQj+lkjK06CgxEobIr1E2kv4MNQ
 UREM1vmYybG4qKHVJVUvI31+Pw6e8kbsUDS8KsaGnVaVusq1yElLHIVEX
 T37tFmbwUpEswAXm1F3m5hNph2bRWJAZRZdjB+WJC869C+BFo9HYG/iPK
 +CG2x+7ZTr7L4Dp1yDJlHUgeM48q1AmSTYQ0nMWEvCCM/ivCMFGuCy6XE w==;
X-CSE-ConnectionGUID: jp7PTCjHSqKQYHSfayTw1w==
X-CSE-MsgGUID: c/BnhQH5TdKLxMgG1KCQmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42307747"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="42307747"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:54:19 -0800
X-CSE-ConnectionGUID: DTM8c2/QTWaTIKSAZno2rw==
X-CSE-MsgGUID: Y9fGCcfnRUufYjv0QwQAbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123577284"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:54:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tqbtk-00000000TeE-0Vfq; Fri, 07 Mar 2025 19:54:12 +0200
Date: Fri, 7 Mar 2025 19:54:11 +0200
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
Subject: Re: [PATCH v6 4/7] drm/i915: Convert REG_GENMASK*() to fixed-width
 GENMASK_U*()
Message-ID: <Z8syw47cN0eEW7lO@smile.fi.intel.com>
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
 <20250308-fixed-type-genmasks-v6-4-f59315e73c29@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308-fixed-type-genmasks-v6-4-f59315e73c29@wanadoo.fr>
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

On Sat, Mar 08, 2025 at 01:48:51AM +0900, Vincent Mailhol via B4 Relay wrote:
> From: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Now that include/linux/bits.h implements fixed-width GENMASK_U*(), use
> them to implement the i915/xe specific macros. Converting each driver
> to use the generic macros are left for later, when/if other
> driver-specific macros are also generalized.

...

> +/*
> + * Wrappers over the generic BIT_* and GENMASK_* implementations,

BIT_U*(), GENMASK_U*() as far as I can see.

Also "...generic fixed-width...".

> + * for compatibility reasons with previous implementation
>   */

-- 
With Best Regards,
Andy Shevchenko


