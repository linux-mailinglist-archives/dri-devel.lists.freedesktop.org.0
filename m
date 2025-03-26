Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE3A71520
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 11:53:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE30910E6A2;
	Wed, 26 Mar 2025 10:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U0GykQKR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531F910E6A2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 10:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742986421; x=1774522421;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=CybyUmm4j5DDvIal5SPPlJBkJ/xFcZDgoJdRqLuQoKU=;
 b=U0GykQKRzYTO2+zBfx6OAfEIJNp4LjJ4pPS28WWU4DTsjZL6DJIgENbF
 s52uKg2UqJNXuL0VK0CIanWOZhkEcm43+4C2qyXcO4isQHZCCGTjAIDRL
 NheXw/Bqs99Rl8ialmAcsQS96n5zGXSb6KpTwiPSvDC6AFFNsVObyPZSo
 gh7/D7YL8Pes1hIByJ6rThGKZ0mlcthLNjJmkiP+EYcwuBiTJA1TMYIBW
 5wSG8cPRu4vzonK0AfuCX5MTSzg6VzY5tWoAERNnH4zkIn3hYNsK4/Yiz
 C3n/4BCYo2clrqwEZt6tey6h2BpLBvWkuvCAsWVXv63j/g49UnD5au4c0 Q==;
X-CSE-ConnectionGUID: lDie3dCDRuWKAwpp1UTcYQ==
X-CSE-MsgGUID: pMT3v1TpSlm9P8Z2ToiOmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="31870046"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="31870046"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 03:53:40 -0700
X-CSE-ConnectionGUID: z+oXJZDBSBSwFHtFt8BU5g==
X-CSE-MsgGUID: NgceAeSDRc2XBgMJDRhNWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="124640515"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.210])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 03:53:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 7/8] drm/format-helper: Optimize 32-to-16-bpp conversion
In-Reply-To: <20250325110407.81107-8-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250325110407.81107-1-tzimmermann@suse.de>
 <20250325110407.81107-8-tzimmermann@suse.de>
Date: Wed, 26 Mar 2025 12:53:33 +0200
Message-ID: <87sen06p1u.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 25 Mar 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> For ease of implementation, existing line-conversion functions
> for 16-bit formats write each pixel individually. Optimize the
> performance by writing mulitple pixels in single 64-bit and 32-bit
> stores.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_format_helper.c | 40 ++++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index b9c9c712aa9c..66137df85725 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -262,10 +262,48 @@ static __always_inline void drm_fb_xfrm_line_32to16(void *dbuf, const void *sbuf
>  						    unsigned int pixels,
>  						    u32 (*xfrm_pixel)(u32))
>  {
> -	__le16 *dbuf16 = dbuf;
> +	__le64 *dbuf64 = dbuf;
> +	__le32 *dbuf32;
> +	__le16 *dbuf16;
>  	const __le32 *sbuf32 = sbuf;
>  	const __le32 *send32 = sbuf32 + pixels;
>  
> +#if defined(CONFIG_64BIT)
> +	/* write 4 pixels at once */
> +	send32 -= pixels & GENMASK(1, 0);
> +	while (sbuf32 < send32) {

I find the adjusting of send32 before and after the loop with different
masks a bit confusing. Would it not suffice to:

	while (sbuf32 < ALIGN_DOWN(send32, 4))

and leave send32 untouched? With different alignments for 2 pixels at a
time.


BR,
Jani.


> +		u32 pix[4] = {
> +			le32_to_cpup(sbuf32++),
> +			le32_to_cpup(sbuf32++),
> +			le32_to_cpup(sbuf32++),
> +			le32_to_cpup(sbuf32++),
> +		};
> +		/* write output bytes in reverse order for little endianness */
> +		u64 val64 = ((u64)xfrm_pixel(pix[0])) |
> +			    ((u64)xfrm_pixel(pix[1]) << 16) |
> +			    ((u64)xfrm_pixel(pix[2]) << 32) |
> +			    ((u64)xfrm_pixel(pix[3]) << 48);
> +		*dbuf64++ = cpu_to_le64(val64);
> +	}
> +	send32 += pixels & GENMASK(1, 1);
> +#endif
> +
> +	/* write 2 pixels at once */
> +	dbuf32 = (__le32 __force *)dbuf64;
> +	while (sbuf32 < send32) {
> +		u32 pix[2] = {
> +			le32_to_cpup(sbuf32++),
> +			le32_to_cpup(sbuf32++),
> +		};
> +		/* write output bytes in reverse order for little endianness */
> +		u32 val32 = xfrm_pixel(pix[0]) |
> +			   (xfrm_pixel(pix[1]) << 16);
> +		*dbuf32++ = cpu_to_le32(val32);
> +	}
> +	send32 += pixels & GENMASK(0, 0);
> +
> +	/* write trailing pixel */
> +	dbuf16 = (__le16 __force *)dbuf32;
>  	while (sbuf32 < send32)
>  		*dbuf16++ = cpu_to_le16(xfrm_pixel(le32_to_cpup(sbuf32++)));
>  }

-- 
Jani Nikula, Intel
