Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E59A67A8F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 18:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E83310E4B3;
	Tue, 18 Mar 2025 17:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DvIDF/O6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5996710E231;
 Tue, 18 Mar 2025 17:16:09 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2243803b776so79944725ad.0; 
 Tue, 18 Mar 2025 10:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742318166; x=1742922966; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Fv88hBBxZboXJONdl4LSqe3F+xHiocOTgQ4YrefHaSc=;
 b=DvIDF/O6/UQY03yxQIgYDMTCsGaRAokbk0wv+4s4Hl0zMC7xzqQ8IbqonTdVwHsepi
 3vWNlnbo2TMjeNkOVmvpltaih0rJrtMMXtpTu/KBu+yiZMBPQT0ShN7PO/PeUBFBhAXV
 hjeyF7wecEIBPxjlNb83jS6d4aV4QImRvsPX5PClNr0Et6rG8j4UGzS6i7XCL5rhRQ+n
 kP9d56ovTQRhx65ZuO0sqXTWAJNihV0QjZtsHkJcq5W0MHZ7Md4Wu3XY5Lk8AKR1cdjY
 lj+6M5aXGdKBrA+23n0kHMU17UyAW+U1Q6R1tC6fAdDzEFc9c6DRvbm7EEMeVehv3RZq
 D+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742318166; x=1742922966;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fv88hBBxZboXJONdl4LSqe3F+xHiocOTgQ4YrefHaSc=;
 b=NIYf8QZUWoku2Ule5WzejkYXqeZQN8oAbkL8e6uubgO3p7LBb1fDY7DDLI8S8yYeuX
 Q+zIgyyzRVZGuEOYYiCdpo7VUKa/rwGNG4tyViql4qhsEgkYRwj+PCwwkh0C5hl7fedm
 ka7fuBSgs1HvQyZF2R8I33f3fh8feJ5EFeiyilRiMsWs2/0okwn6HhbaOFIpLu3E03mg
 JES6YK1q8IhI843tSOtymgVQDNoP8sn3fb46ldXPxu32eUAWaWeLhquf4JZVuU45inYm
 Q45kGsfzJ2tOOndE4HzEDD34+pOX8//27JEs7A2d16hvC8mjfy3FZOsSF4oOBx1yqa1Y
 ZCLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeosnB+9fby+pWQFeBxv0FHngx1iTvnSFA4fhOkCG7t5A7NO2YkzrLrsUWQHRyTsAfw1DWiwrJ9ks=@lists.freedesktop.org,
 AJvYcCXtbt59dD7XqiUhQbMIwlCEHzEtH7jxxyhEWubRC0diBAUmx0GSIA7pTQswtN1/cgULoqqRXd15j9WS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzySHxwajZMYyohsLqcW949BaxnRhuCWAeJ8rJzAuZZDf2dwV0o
 Xynt+eG53gqQVeRUjGQ11M80l8xRUdIn3qO8dU5B7tcuyBaYZUB1
X-Gm-Gg: ASbGncta9VsA33IPuYPr6i3gx2JgQWsT0tuO5sScWCYnDN/fy/XiSes3N0GSacd99Hp
 A+SW2ppgCvIVKP9WvRfKnDvaO3fONnAnMZ6oRJzT1PZRGjrE3tzSWr2hL1eGF52kOCE1TFy4IFp
 YBs9WCwCA7feDdJFZegzjDw2vslQ/hgbnuJS1lEXc9oYHPV2uPo0F02bypseh3Vsel81MLwldv6
 eq+k4YxcTPF62g+oqTJXm+fS0Xzhr4vfiSD7pP3XbBBdpHT5k7orIYdzUqg5YcDXw0HEFqb8e1f
 PCriX8+ua+p/FevY+2vSHtzotxZQuqdBFDcGSH5kp8HNyaaZWlKN6qJ5juf+l3H+DmsJ
X-Google-Smtp-Source: AGHT+IEiuxfM7CMCU8uN8rrGdd6ky409oPSqP147XRFz3wH1huV0wzqx/w2kjY4U0AMw0iZ6RBeVxQ==
X-Received: by 2002:a17:903:2287:b0:21f:52e:939e with SMTP id
 d9443c01a7336-2262c580c48mr65250955ad.28.1742318165591; 
 Tue, 18 Mar 2025 10:16:05 -0700 (PDT)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6bbca45sm97083145ad.166.2025.03.18.10.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 10:16:05 -0700 (PDT)
Date: Tue, 18 Mar 2025 13:16:01 -0400
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v6 4/7] drm/i915: Convert REG_GENMASK*() to fixed-width
 GENMASK_U*()
Message-ID: <Z9mqUZX4H-CzqbW4@thinkpad>
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
 <20250308-fixed-type-genmasks-v6-4-f59315e73c29@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308-fixed-type-genmasks-v6-4-f59315e73c29@wanadoo.fr>
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
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> ---
> Changelog:
> 
>   v5 -> v6:
> 
>     - No changes.
> 
>   v4 -> v5:
> 
>     - Add braket to macro names in patch description,
>       e.g. 'REG_GENMASK*' -> 'REG_GENMASK*()'
> 
>   v3 -> v4:
> 
>     - Remove the prefixes in macro parameters,
>       e.g. 'REG_GENMASK(__high, __low)' -> 'REG_GENMASK(high, low)'
> ---
>  drivers/gpu/drm/i915/i915_reg_defs.h | 108 ++++-------------------------------
>  1 file changed, 11 insertions(+), 97 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
> index e251bcc0c89f5710125bc70f07851b2cb978c89c..39e5ed9511174b8757b9201bff735fa362651b34 100644
> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
> @@ -9,76 +9,19 @@
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
>  
> -/**
> - * REG_BIT() - Prepare a u32 bit value
> - * @__n: 0-based bit number
> - *
> - * Local wrapper for BIT() to force u32, with compile time checks.
> - *
> - * @return: Value with bit @__n set.
> +/*
> + * Wrappers over the generic BIT_* and GENMASK_* implementations,
> + * for compatibility reasons with previous implementation
>   */
> -#define REG_BIT(__n)							\
> -	((u32)(BIT(__n) +						\
> -	       BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&		\
> -				 ((__n) < 0 || (__n) > 31))))
> +#define REG_GENMASK(high, low)		GENMASK_U32(high, low)
> +#define REG_GENMASK64(high, low)	GENMASK_U64(high, low)
> +#define REG_GENMASK16(high, low)	GENMASK_U16(high, low)
> +#define REG_GENMASK8(high, low)		GENMASK_U8(high, low)

Nit. Maybe just

 #define REG_GENMASK		GENMASK_U32
