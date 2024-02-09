Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB4884FA2E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 17:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B349D10F78D;
	Fri,  9 Feb 2024 16:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RQMmyu93";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2018F10F78D;
 Fri,  9 Feb 2024 16:53:27 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-604aaf2d047so13073677b3.0; 
 Fri, 09 Feb 2024 08:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707497606; x=1708102406; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0YeJ1Scdeu8JC0fSedQWunMCPmGv7Rv5FN5QxfX78yE=;
 b=RQMmyu932mXBR8UEGtnJJ+Vej3txoRerIYuntJcGhCaIBb4EvVpt5N0uVEqjVHxbgO
 SycmZ3etpD5olN+z+iAqONouvQdpc2s5OmfEWaquZttPBp2OC9CvgtTbcw5BlDnRi5t3
 nnYP7VyCp6MxnBx+Bhs63tuud41j/x2gitzODlsqJw0yxatFMZbbFRNsJA4H7d6ARgt4
 z0dZJfsnElHNtGVreKfwWKSjoVV5o9Bgsqv+68UwR3CA4B3N3TIpd4mqGkLbPKc0rlqt
 mID9OBSLU9A6pBUVqB7sOPcL69GPUd9xqGdqOI3GAt432ZfheVtbkz3PO3cm9DUNkpMA
 uvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707497606; x=1708102406;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0YeJ1Scdeu8JC0fSedQWunMCPmGv7Rv5FN5QxfX78yE=;
 b=lGRQuN2hU4ElnHQWDyIxRI01fdZJQSTIWy4P270t3kdPhqGBgoCB3Mh4Po6kn5CVzt
 BmuxqfsbyINQzEGbRdcv6kHWoypPkHsy+qpFtx00q6KjOb+xFXKXj7GFhVQ4r4PC4mFH
 dZVnwexDKd/5wTi1+jemJAtqKY7LDSeUYIo2w0Taa5qH2tyyTmi946fF63FieiGsBACV
 jQ1s6sQfzdDyIes+o+bk/K9vweGFu9hqiGNJuoDOTGDluOk46v8xtwTORcQIc/e3q3g5
 CNxieHadLb8Y4qJuidp3iif8VRpwVXfTVmzBEIJPJ+PKiWy+HIamkKjXfWgTHDdS6iSU
 PAjg==
X-Gm-Message-State: AOJu0YzIQR7votQ3YHpzsgg2HVfYnRJElxRZE9VsoNWGHfDQBm4iJ0tx
 GISNtZRaFcE2KggsUVDTCNRxWex5Q8bAJ6SiDmkgH1oRBLeAdxXuC08rcB8/l4c=
X-Google-Smtp-Source: AGHT+IHrF/8wgQd8JNTUcMtQGIGtbwT7TsJq0XQLER+HELEUGnHbgwEyGR8OSowd2xtSlMfgTxJ8oA==
X-Received: by 2002:a81:8541:0:b0:604:aaac:99f7 with SMTP id
 v62-20020a818541000000b00604aaac99f7mr1933729ywf.37.1707497606183; 
 Fri, 09 Feb 2024 08:53:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUm/ZAq2lpYcT7dz8z8nZVu6F1n/rO1gEfLAC5EvkaTQlVEvagzv67AwSjqvZ2iBWBS6mgBykFYKG5VO7aeJhbTvhEuFSLJJ6q2ZyizC2xlwYJSNYNlTqR8rFAuxG2r71EiJu4fl2YHgkcKSORZ5MZ+U/t5ozjwe8m2eDJjwQAWIFy6XhRCB22wMTK5oeEcsJoSXFwITHJmf7AFR3Vnnqnm3Kdhkyd8G5XqPvv+cHpTcegoufYgIzK2Wg1+h95DlLusLABVfgwftTwwTkrrZNH5okindowqDagtKUTQReqod4NiM52SmLw=
Received: from localhost ([2601:344:8301:57f0:be3a:6fd4:1110:3284])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a814a07000000b006040a13db84sm384525ywa.48.2024.02.09.08.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 08:53:25 -0800 (PST)
Date: Fri, 9 Feb 2024 08:53:25 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 2/3] bits: Introduce fixed-type BIT
Message-ID: <ZcZYhZbLyzSXX8PU@yury-ThinkPad>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208074521.577076-3-lucas.demarchi@intel.com>
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

On Wed, Feb 07, 2024 at 11:45:20PM -0800, Lucas De Marchi wrote:
> Implement fixed-type BIT() to help drivers add stricter checks, like was
> done for GENMASK.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>

So I get v1 from Jan.23 in my mailbox, and this one is v3. Did I miss
a v2? Anyways, please bear my reviewed-by from v1 for this patch.

Thanks,
Yury

> ---
>  include/linux/bits.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/include/linux/bits.h b/include/linux/bits.h
> index bd56f32de44e..811846ce110e 100644
> --- a/include/linux/bits.h
> +++ b/include/linux/bits.h
> @@ -24,12 +24,16 @@
>  #define GENMASK_INPUT_CHECK(h, l) \
>  	(BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
>  		__is_constexpr((l) > (h)), (l) > (h), 0)))
> +#define BIT_INPUT_CHECK(type, b) \
> +	((BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
> +		__is_constexpr(b), (b) >= BITS_PER_TYPE(type), 0))))
>  #else
>  /*
>   * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
>   * disable the input check if that is the case.
>   */
>  #define GENMASK_INPUT_CHECK(h, l) 0
> +#define BIT_INPUT_CHECK(type, b) 0
>  #endif
>  
>  /*
> @@ -54,4 +58,17 @@
>  #define GENMASK_U32(h, l)	__GENMASK(u32, h, l)
>  #define GENMASK_U64(h, l)	__GENMASK(u64, h, l)
>  
> +/*
> + * Fixed-type variants of BIT(), with additional checks like __GENMASK().  The
> + * following examples generate compiler warnings due to shift-count-overflow:
> + *
> + * - BIT_U8(8)
> + * - BIT_U32(-1)
> + * - BIT_U32(40)
> + */
> +#define BIT_U8(b)		((u8)(BIT_INPUT_CHECK(u8, b) + BIT(b)))
> +#define BIT_U16(b)		((u16)(BIT_INPUT_CHECK(u16, b) + BIT(b)))
> +#define BIT_U32(b)		((u32)(BIT_INPUT_CHECK(u32, b) + BIT(b)))
> +#define BIT_U64(b)		((u64)(BIT_INPUT_CHECK(u64, b) + BIT(b)))
> +
>  #endif	/* __LINUX_BITS_H */
> -- 
> 2.43.0
