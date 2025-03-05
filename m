Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0FEA501FB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 15:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7614010E7B8;
	Wed,  5 Mar 2025 14:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d69aGtOv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBEE10E7B8;
 Wed,  5 Mar 2025 14:30:24 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-22349bb8605so132730125ad.0; 
 Wed, 05 Mar 2025 06:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741185023; x=1741789823; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IlwlCKrm1BqwlFcITao3/COM3kL1lolnoHqB6b1uB4E=;
 b=d69aGtOvP+nWBVYgwhs/XfUsUjYqK0fnpHUeXfYHm96Ab6AqOQWwt7ksODom+KbO6m
 Z48nJ+ZbBtQWsZMhRfbNZ+EKXMhfrfamc8otoD68J8yKOi8A34imZl+urrLBFFIqLKR3
 zysQEHY76BAfwRCrDx2lZxoLnRtPswXcjCCTFiFvPbcjfpaJqrJkHtMqotl5Tbe+ALzq
 tSl0qtgZceFGEIro+rDw1rRM48ZW/6W4sWn+wxt2IZ39vRGEFfUtx9Hq22gZahcdaIIn
 39e6g6OVq8rOvDA2lyeIH7dFPkkRGILHnDk937BKldgefZ4q8RmDqshcMClAv+T/KOFo
 ggUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741185023; x=1741789823;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IlwlCKrm1BqwlFcITao3/COM3kL1lolnoHqB6b1uB4E=;
 b=w3zgPO6eHI/N1IKS266eCZJI/lPq4a0BDk+5yQQt1ZU9D0PNUmQ7SNr3Zwv2qGK5VM
 HWbqmCKI808sa1v32KEWwifqV1gF5AIdM6bYKblD0UpJj1laAj24w396vGeuZXg+cmqJ
 ijwvzwZlthE8V/ln3LpmbUiWolFVqVMynPLoQo+dOubPzDnl6L61ySJFHDdwn4Wdr9si
 kqx3wJAfL2gOGp/Nwxz1GFBIWXHP/0DLzBtMxXKwMwM8FO1tPx/lacFsL+boZQ9Ga47w
 WiNd68Ez/+u1+mKJv8gkvQF5xxHbNGKm+lwdq8yuezNhj5WHSfcYPntfFm3H5SEeBWax
 xs1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnV7wm+N/+gBPfdAqJNXgf3FyR51T9JXcNmwOYqVl87FbhHYGNV3w9m5eQQSbr/Pw9KHuYHJNCd9gJ@lists.freedesktop.org,
 AJvYcCW8aUNOhJp2mIZcLq0afZKtzmuKwEakV/hz6V3gYobmEJMNpwAe0e/JPigW4C8tobdPph0jhWyMK18=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNE/41BE1mV4hSqfqNfqYXDgoSO/niVz/VFwvTISSZWPwtJzwu
 o2uYXoBd2GypFl2qsi8zi5A7qD7QqpLBaImviBFAHP833VycDHdP
X-Gm-Gg: ASbGncvp6lratBNDLa0QcP11Riztjt3sDp0o+nPznJLWDzh2y2vDj4ZGHMH712bxC6v
 PA+WCgPaxjvKLOvaImSD1HJ9lIKoocNk7ye8Lipm5VNfjKV4inITiNRW0XqPn+S3SlDQtmTxWpk
 7Pcie5sABW2+eABRgpNeqEWbur/OFZhBuNuhsQ9y9LvOioGTegDu2X98yN0rd4ABHauSiNboLeZ
 ubAKdSdbUjeRFFKE1eHo+Gh0oeRbWx52naPixQ+VTWLfVfIcdgNVyzhmNXJsY1TJCoNGFgUiMkb
 8zwmyHiKAtULQcgv8sxqjMavBwcnLoozRhIndcwDKnF2
X-Google-Smtp-Source: AGHT+IGOw7ho1UUAoxDldP562F3+Ghc7uXtkeFsOxJJC2qch+UBSxhGnmdxoaMccdDcCbb1p7rm4RQ==
X-Received: by 2002:aa7:88c1:0:b0:730:d5ca:aee with SMTP id
 d2e1a72fcca58-73682cd83c7mr5625290b3a.23.1741185023345; 
 Wed, 05 Mar 2025 06:30:23 -0800 (PST)
Received: from localhost ([216.228.125.131]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7349fe2a64bsm13411865b3a.11.2025.03.05.06.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 06:30:22 -0800 (PST)
Date: Wed, 5 Mar 2025 09:30:20 -0500
From: Yury Norov <yury.norov@gmail.com>
To: mailhol.vincent@wanadoo.fr
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 1/8] bits: fix typo 'unsigned __init128' -> 'unsigned
 __int128'
Message-ID: <Z8hf_MNL3MeoXW5O@thinkpad>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-1-1873dcdf6723@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-fixed-type-genmasks-v4-1-1873dcdf6723@wanadoo.fr>
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

Hi Vincent!

On Wed, Mar 05, 2025 at 10:00:13PM +0900, Vincent Mailhol via B4 Relay wrote:
> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> 
> "int" was misspelled as "init" in GENMASK_U128() comments. Fix the typo.
> 
> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

Thanks for respinning the series. I'll take this fix in bitmap-for-next, so
if you need v2, you'll not have to bear this thing too.

Thanks,
Yury

> ---
>  include/linux/bits.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/bits.h b/include/linux/bits.h
> index 61a75d3f294bfa96267383b5e2fd2a5d4593fcee..14fd0ca9a6cd17339dd2f69e449558312a8a001b 100644
> --- a/include/linux/bits.h
> +++ b/include/linux/bits.h
> @@ -40,7 +40,7 @@
>   * Missing asm support
>   *
>   * __GENMASK_U128() depends on _BIT128() which would not work
> - * in the asm code, as it shifts an 'unsigned __init128' data
> + * in the asm code, as it shifts an 'unsigned __int128' data
>   * type instead of direct representation of 128 bit constants
>   * such as long and unsigned long. The fundamental problem is
>   * that a 128 bit constant will get silently truncated by the
> 
> -- 
> 2.45.3
> 
