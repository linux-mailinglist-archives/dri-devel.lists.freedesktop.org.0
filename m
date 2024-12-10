Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FAF9EA3F2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 01:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CCF10E36D;
	Tue, 10 Dec 2024 00:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iPSosQTF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066C210E374
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 00:58:32 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30229d5b22fso10912921fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 16:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733792311; x=1734397111; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qA3kQRHwLNx/dBWpprz00JA3fWGQ8baI+DpIXaXrAR8=;
 b=iPSosQTFLUhwpaVuUIBfFwusO8ryQKGtPqaDfuf6c9p2CStIFMWu6rO2xHj4W96owm
 y4R2C2PkS2O3kN/r+FX8/zJu/6i4DDmJPEw/haHdE3qAi5nfUqwTnjt90sSnvV4pDXjI
 LqKuJvHiOvBhQBHaatxjNE7qEcs7Fnsb0JmhyuOzjoB5bXIWbk8jgvD5fruQaoQL9zWI
 NJfhXKVyuI+u/GX6q1Abd6ht3fj+iO1X/8OQM5KJ9TZB+cHqQuRsRxbCn9IJdsG69bsL
 owS3PMLbpal4UKWKnWcUsAlfYQE3qJ3qnWKSXKMlrcWBLEIYbpoGYcSKhAOmSMHTP0OG
 eO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733792311; x=1734397111;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qA3kQRHwLNx/dBWpprz00JA3fWGQ8baI+DpIXaXrAR8=;
 b=t0Pl7GuZz0LeIzZHbwdNENsdjTJwsXvqDjr+XeGfEoFYvfRMNCm0AVV4iW0+Ts3P1Y
 DUsNt+wfXP1A5IRBajIzeE0qHEvzokvBDhnSpMQJ9BGDOE7miy6AmhNSePr1N+gVnzQg
 QNc+poE+iPvWo801gqZ/bT4aRNLHTAxC35XDc9MxZwvHXoYCXSzhoqo8nu96JfwZoPgl
 8lVkgOWDOoOiNZa5ylDwHRu/4NrT/zTml6wIdAPGrIleMyM28Au3z00VpUAT42ZyAnvJ
 o1fxeOm1BjK/s5vlml1JXe+qUWGagAVKMz4b+dHIZrJRn1WotS27QmVleTaPHXV0rqKF
 5waA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNApEf0uMuOIgDENXzCJHP7orJTmvm1GWAq250uytk5JQxxnZQoFU5pTXIfToebG+x8HguG0ymzz0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK1VtuwoShWbST5kmpqVflqfCxamhie2tTRhMro4l1i1gfolRD
 wCLkTyIR99+2ML4Fp4KD7vlvtUWXnYP9XJS1+bmELRV05GIkr+Ny5anEC7WiJ2cjPx4KZVLJirv
 6bLq1Aw==
X-Gm-Gg: ASbGncvorpGovB69exB7gtli6vGt/ZoWRhbuJtdO8Yc+6VQ6UzvT7n2uaLP+XvbJ6PC
 QFm6+RHeWrWm+RQDR8SZneuYnqT2et1hCnfp/Zin3J6pD++KXSLiyLRL6l2PF6ozmTy3GG2UmzG
 2swecq2/6H8hpQIolVbYokSNlY2kUReIBwU0OcKfZtqeu65DdlLtvuCVFtWXOMIsO1/uhLIEAhq
 5cT9Bi/qF+g/8894DZdDXTNa7pRI+77J/R1OLv/Lzmi3JlTiZPe/ek4ZBELRyDQ/p0ydZVklzVy
 fJGglg8CbcdArybCebvg1kMLK+1RUz/TFA==
X-Google-Smtp-Source: AGHT+IH+ILwRShWeWXyUNY6NkTu4twrsP2fPiOhE+EcKn5AMtuWarD4sYCULeBspBFBcpZ2qPhS1aQ==
X-Received: by 2002:a2e:bea4:0:b0:2fa:cdac:8732 with SMTP id
 38308e7fff4ca-3022fd7d97emr11152981fa.30.1733792310820; 
 Mon, 09 Dec 2024 16:58:30 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-301366eedcesm7988731fa.3.2024.12.09.16.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 16:58:29 -0800 (PST)
Date: Tue, 10 Dec 2024 02:58:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCHv3 01/10] drm/crtc: Add histogram properties
Message-ID: <vicrfpm2rzc4nn5irw7buqobed4e47w53xkpjgkcncmnf3nce6@4zvkgbnpoeba>
References: <20241209162504.2146697-1-arun.r.murthy@intel.com>
 <20241209162504.2146697-2-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209162504.2146697-2-arun.r.murthy@intel.com>
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

On Mon, Dec 09, 2024 at 09:54:55PM +0530, Arun R Murthy wrote:
> Add variables for histogram drm_property, its corrsponding crtc_state
> variables and define the structure pointed by the blob property.
> 
> struct drm_histogram and drm_iet defined in include/uapi/drm/drm_mode.h
> 
> The property HISTOGRAM_ENABLE allows user to enable/disable the
> histogram feature in the hardware. Upon KMD enabling by writing to the
> hardware registers, a histogram is generated. Histogram is composed of
> 'n' bins with each bin being an integer(pixel count).
> An event HISTOGRAM will be sent to the user. User upon recieving this
> event user can read the hardware generated histogram using crtc property
> HISTOGRAM_DATA. User can use this histogram data, apply various
> equilization techniques to come up with a pixel factor. This pixel
> factor is an array of integer with 'n+1' elements. This is fed back to
> the KMD by crtc property HISTOGRAM_IET. KMD will write this IET data
> back to the hardware to see the enhancement/equilization done to the
> images on that pipe.
> The crtc property HISTOGRAM_DATA and HISTOGRAM_IET is of type blob.
> 
> For crtc property HISTOGRAM_DATA,
> the blob data pointer will be the address of the struct drm_histogram.
> struct drm_histogram {
> 	u64 data_ptr;
> 	u32 nr_elements;
> }
> Histogram is composed of @nr_elements of bins with each bin being an
> integer value, referred to as pixel_count.
> The element @data_ptr holds the address of histogam.
> Sample:
> Historgram[0] = 2050717
> Historgram[1] = 244619
> Historgram[2] = 173368
> ....
> Historgram[31] = 21631

Further question: it seems that GHE library has hardcoded 32 bins in the
histogram and 33 bins in the IET. Is that also a part of the property
format? Can VKMS implement 2 bins? 64 bins? Will that break the
userspace if VKMS uses 64 bins? (Hint: yes)

I'm asking all these questions, because I can easily foresee developers
wokring on using HISTOGRAM properties to implement support for contrast
enhancement by other vendors. It should be possible to do it in away
that new implementations do not break the existing userspace.  And
ensuring such compatibility is impossible without a proper documentation
on the data format.

> 
> For crtc_property HISTOGRAM_IET,
> the blob data pointer will be the address of the struct drm_iet.
> struct drm_iet {
> 	u64 data_ptr;
> 	u32 nr_elements;
> }
> ImageEnhancemenT(IET) is composed of @nr_elements of bins with each bin
> being an integer value, referred to as pixel factor.
> The element @data_ptr holds the addess of pixel factor.
> Sample:
> Pixel Factor[0] = 1023
> Pixel Factor[1] = 695
> Pixel Factor[2] = 1023
> ....
> Pixel Factor[32] = 512
> 
> Histogram is the statistics generated with 'n' number of frames on a
> pipe.
> Usually the size of pixel factor is one more than the size of histogram
> data.
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  include/drm/drm_crtc.h      | 51 +++++++++++++++++++++++++++++++++++++
>  include/uapi/drm/drm_mode.h | 24 +++++++++++++++++
>  2 files changed, 75 insertions(+)
> 
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 8b48a1974da3..f0f4a73e2e31 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -274,6 +274,41 @@ struct drm_crtc_state {
>  	 */
>  	struct drm_property_blob *gamma_lut;
>  
> +	/**
> +	 * @histogram_enable:
> +	 *
> +	 * This will be set if histogram needs to be enabled for the CRTC.
> +	 */
> +	bool histogram_enable;
> +
> +	/**
> +	 * @histogram_data:
> +	 *
> +	 * The blob points to the structure drm_histogram.
> +	 * The element data in drm_histogram will hold the pointer to the
> +	 * histogram data generated by the hardware. This histogram data is
> +	 * an array of integer. This integer value is the pixel count of the
> +	 * incoming frames.
> +	 */
> +	struct drm_property_blob *histogram_data;
> +
> +	/**
> +	 * @histogram_iet:
> +	 *
> +	 * The blob points to the struct drm_iet.
> +	 * The element data_ptr in drm_iet will hold the pointer to the
> +	 * image enhancement generated by the algorithm that is to
> +	 * be fed back to the hardware. This IET data is an array of type
> +	 * integer and is referred to as a pixel factor.
> +	 */
> +	struct drm_property_blob *histogram_iet;
> +	/**
> +	 * @histogram_iet_updates:
> +	 *
> +	 * Convey that the image enhanced data has been updated by the user
> +	 */
> +	bool histogram_iet_updated;
> +
>  	/**
>  	 * @target_vblank:
>  	 *
> @@ -1088,6 +1123,22 @@ struct drm_crtc {
>  	 */
>  	struct drm_property *scaling_filter_property;
>  
> +	/**
> +	 * @histogram_enable_property: Optional CRTC property for enabling or
> +	 * disabling global histogram.
> +	 */
> +	struct drm_property *histogram_enable_property;
> +	/**
> +	 * @histogram_data_proeprty: Optional CRTC property for getting the
> +	 * histogram blob data.
> +	 */
> +	struct drm_property *histogram_data_property;
> +	/**
> +	 * @histogram_iet_proeprty: Optional CRTC property for writing the
> +	 * image enhanced blob data
> +	 */
> +	struct drm_property *histogram_iet_property;
> +
>  	/**
>  	 * @state:
>  	 *
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index c082810c08a8..c384ed8452c7 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -1355,6 +1355,30 @@ struct drm_mode_closefb {
>  	__u32 pad;
>  };
>  
> +/**
> + * struct drm_histogram
> + * @data_ptr: pointer to the array of bins which is of type integer. This
> + *	      is the histogram data termed as pixel count.
> + * @nr_elements: number of elements pointed by the data @data_ptr
> + */
> +struct drm_histogram {
> +	__u64 data_ptr;
> +	__u32 nr_elements;
> +};
> +
> +/**
> + * struct drm_iet
> + * @data_ptr: pointer to the array of bins which is of type integer. This
> + *	      is the image enhanced data, termed as pixel factor.
> + * @nr_elements: number of elements pointed by the data @data_ptr
> + * @reserved: reserved for future use
> + */
> +struct drm_iet {
> +	__u64 data_ptr;
> +	__u32 nr_elements;
> +	__u32 reserved;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
