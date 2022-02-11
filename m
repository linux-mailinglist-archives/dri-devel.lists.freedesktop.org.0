Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDF44B2406
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 12:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A673A10EAC0;
	Fri, 11 Feb 2022 11:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF7110EAC0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 11:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644577916; x=1676113916;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bjy30kX/4V6OcKJVIXtHnRN0SCGIE0PkHV4hkmZDB68=;
 b=n1/8D8QsOYVeWRfP5rqSF/Z2B6vzBm9XH759/n+aqBUHUsjBepnUT6sp
 H+JOtgnFmRQj8Rxf7kNCpgYGJWGpep9WmrRfQWDe3P1Px6zT/XOV84eVq
 vt+z9fttMMDTNkZDbl/7pZLeKUU6dq2+kFo2HMxggBHlo2YkC8tINRCkm
 2a7zhXr0UaBmJYBc7kTWNCZmnH+h+h/SAwmz9jaf/S3Salh204QRrpVLg
 wB+9c9C/xwWHXtC0ZvNGsjU3mns9kXWWmXhjirry/L2WMzhUJav99Nebe
 Z9yto4loEQZPtJBL+BL5FUaIM5oQOJrIBlybN5osyAawPScMgBA19LjnU w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="310449410"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="310449410"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:11:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="623191994"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:11:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nITpG-003PxN-S9; Fri, 11 Feb 2022 13:10:54 +0200
Date: Fri, 11 Feb 2022 13:10:54 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 2/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_mono_reversed()
Message-ID: <YgZEPo0ERFRloDyA@smile.fi.intel.com>
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-3-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211091927.2988283-3-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 10:19:23AM +0100, Javier Martinez Canillas wrote:
> Add support to convert from XR24 to reversed monochrome for drivers that
> control monochromatic display panels, that only have 1 bit per pixel.
> 
> The function does a line-by-line conversion doing an intermediate step
> first from XR24 to 8-bit grayscale and then to reversed monochrome.
> 
> The drm_fb_gray8_to_mono_reversed_line() helper was based on code from
> drivers/gpu/drm/tiny/repaper.c driver.

...

> +static void drm_fb_gray8_to_mono_reversed_line(u8 *dst, const u8 *src, unsigned int pixels,
> +					       unsigned int start_offset, unsigned int end_len)
> +{
> +	unsigned int xb, i;
> +
> +	for (xb = 0; xb < pixels; xb++) {
> +		unsigned int start = 0, end = 8;
> +		u8 byte = 0x00;

> +		if (xb == 0 && start_offset)
> +			start = start_offset;

This is invariant to the loop, can be moved out.

> +		if (xb == pixels - 1 && end_len)
> +			end = end_len;

Ditto. However it may require to factor out the following loop to a helper.

> +		for (i = start; i < end; i++) {
> +			unsigned int x = xb * 8 + i;
> +
> +			byte >>= 1;
> +			if (src[x] >> 7)
> +				byte |= BIT(7);
> +		}
> +		*dst++ = byte;
> +	}
> +}

...

> +	/*
> +	 * The reversed mono destination buffer contains 1 bit per pixel
> +	 * and destination scanlines have to be in multiple of 8 pixels.
> +	 */
> +	if (!dst_pitch)
> +		dst_pitch = DIV_ROUND_UP(linepixels, 8);

round_up() ?

> +	WARN_ONCE(dst_pitch % 8 != 0, "dst_pitch is not a multiple of 8\n");


I would move this to the if conditional, i.e.

	if (dst_pitch)
		WARN_ONCE(dst_pitch % 8 != 0, "dst_pitch is not a multiple of 8\n");
	else
		dst_pitch = round_up(linepixels, 8);

> +	/*
> +	 * The cma memory is write-combined so reads are uncached.

CMA

> +	 * Speed up by fetching one line at a time.
> +	 *
> +	 * Also, format conversion from XR24 to reversed monochrome
> +	 * are done line-by-line but are converted to 8-bit grayscale
> +	 * as an intermediate step.
> +	 *
> +	 * Allocate a buffer to be used for both copying from the cma
> +	 * memory and to store the intermediate grayscale line pixels.
> +	 */
> +	src32 = kmalloc(len_src32 + linepixels, GFP_KERNEL);

size_add() ?

> +	if (!src32)
> +		return;

...

> +	/*
> +	 * For damage handling, it is possible that only parts of the source
> +	 * buffer is copied and this could lead to start and end pixels that
> +	 * are not aligned to multiple of 8.
> +	 *
> +	 * Calculate if the start and end pixels are not aligned and set the
> +	 * offsets for the reversed mono line conversion function to adjust.
> +	 */
> +	start_offset = clip->x1 % 8;
> +	end_len = clip->x2 % 8;

ALIGN() ?

-- 
With Best Regards,
Andy Shevchenko


