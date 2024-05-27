Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D39D8D0EA1
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 22:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C5210F1A0;
	Mon, 27 May 2024 20:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KK/AUkPD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0482810F1A0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 20:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716841989; x=1748377989;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eGuvLmAFDMBNic0R9NNNrwmtI2kmtPfEq4B6DQH8URA=;
 b=KK/AUkPDsAXAQayCQhTk10oHYqc0Hy2yzWQqBDvcmRVDp0G5H8vDJb3n
 fECOVof+jrLnrNfssALrn3AbbAF4bOzrhDcQHdh8oyBWheRRAzb3pjcW/
 q63Sai5LVL/MMTAdEogwqexecIJLqSCLaAx+OoBwpj6o14RolExr/Rjuh
 i6Vx0y+wAtom53RGluMnJ651YvMegpwNUxc3tnIbfswIF2SkUZA3fawWy
 eLdBTSQKuEcrSUeSc0pkn+b5rY5UO0PqtSZtEaZ/4obN7mw6tSNs8pVuN
 o8bCzJ4w0tFc938LnHfDBhu7Pj6NW7ciWEVHBq57Pg/ZYHDTzeyaSX0fa w==;
X-CSE-ConnectionGUID: oWeEFBFjSZiR5BrTyBil9w==
X-CSE-MsgGUID: 5S4+sXS5SKSa6NirHtcTYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="12944993"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="12944993"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 13:33:08 -0700
X-CSE-ConnectionGUID: VyQofwBuS9WLYkfeol/4jQ==
X-CSE-MsgGUID: WoN3zhSWQHOW6JVz220nkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="58037903"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 13:33:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sBh1d-0000000BMh0-3tYh; Mon, 27 May 2024 23:32:57 +0300
Date: Mon, 27 May 2024 23:32:57 +0300
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
Subject: Re: [PATCH v9 06/10] math.h: Add macros for rounding to closest value
Message-ID: <ZlTt-YWzyRyhmT9n@smile.fi.intel.com>
References: <20240526175655.1093707-1-devarsht@ti.com>
 <20240526180856.1124470-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240526180856.1124470-1-devarsht@ti.com>
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

On Sun, May 26, 2024 at 11:38:56PM +0530, Devarsh Thakkar wrote:
> Add below rounding related macros:
> 
> round_closest_up(x, y) : Rounds x to closest multiple of y where y is a
> power of 2, with a preference to round up in case two nearest values are
> possible.
> 
> round_closest_down(x, y) : Rounds x to closest multiple of y where y is a
> power of 2, with a preference to round down in case two nearest values are
> possible.
> 
> roundclosest(x, y) : Rounds x to closest multiple of y, this macro should
> generally be used only when y is not multiple of 2 as otherwise
> round_closest* macros should be used which are much faster.
> 
> Examples:
>  * round_closest_up(17, 4) = 16
>  * round_closest_up(15, 4) = 16
>  * round_closest_up(14, 4) = 16
>  * round_closest_down(17, 4) = 16
>  * round_closest_down(15, 4) = 16
>  * round_closest_down(14, 4) = 12
>  * roundclosest(21, 5) = 20
>  * roundclosest(19, 5) = 20
>  * roundclosest(17, 5) = 15

...

> +/**
> + * round_closest_up - round closest to be multiple of specified value (which is
> + *                    power of 2) with preference to rounding up
> +

Not that big deal, but missing '*' here. Personally I would not even put
a blank line between Summary and Field Descriptions.

> + * @x: the value to round
> + * @y: multiple to round closest to (must be a power of 2)
> + *
> + * Rounds @x to closest multiple of @y (which must be a power of 2).
> + * The value can be either rounded up or rounded down depending upon rounded
> + * value's closeness to the specified value. If there are two closest possible
> + * values, i.e. the difference between the specified value and it's rounded up
> + * and rounded down values is same then preference is given to rounded up
> + * value.
> + *
> + * To perform arbitrary rounding to closest value (not multiple of 2), use
> + * roundclosest().
> + *
> + * Examples :

What is this suppose to be rendered to?

> + * round_closest_up(17, 4) = 16
> + * round_closest_up(15, 4) = 16
> + * round_closest_up(14, 4) = 16

Btw, is kernel-doc validator happy about all kernel docs you added?

> + */

-- 
With Best Regards,
Andy Shevchenko


