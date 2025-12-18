Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB35CCD686
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 20:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B9710E44E;
	Thu, 18 Dec 2025 19:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gCXnPqFy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9052B10E44E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 19:36:10 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so6901335e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 11:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766086569; x=1766691369; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cxp4Ie+boIejqpFbsPiC20+/Xw7M9cKxZsjEWRRRwds=;
 b=gCXnPqFyy4GO83wT2/gs9g+kvmyMV/6daUkzoJayXtqwSTQkDl7gNwoZv9vLhQIkVe
 4XyDsgimMZU2tCPcjWykjOErpEfWru/Ee3SNe/CzF5xsn5UpWpCQK6t1uD0wsukpUJJg
 uD3cymiWI2g+X5zjonfoyujXyQxAaX4HpyzjK9zNmY02hlkMQH4MhX0wEGw9OGGqK84V
 0DhCLdiw0Zo7Jx/7I5qRrW/83WjJ471x6cixBm9I5YgGj8q1U25+pdqBjW67dwb5ttxt
 BZ79tamt6qs5AyIIFA7Td+VkZ3W/n/1XRkuI82ecNk9puTc0iuqfLpm/GIbPqH7q/D3h
 Xvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766086569; x=1766691369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cxp4Ie+boIejqpFbsPiC20+/Xw7M9cKxZsjEWRRRwds=;
 b=gGearn4T99zdELgEMQohdgybply4z8OsKSxU3aT9MYk6aWjZImrQtrKn+BLQBDRJVk
 kCej2qT4aYCvlhEZ2iQ0cYiRiYPVlH8kbyN0jTB/ZzNqndg/Bhh45p1wuQdgMzHB7Fgp
 rdrjx4lX1o9+JrQlgzAXevx8Vsi1rgjxrpOuWxF2SNZb4a0JgzszJ6oKG/4vT1MUAdVr
 pup5P/UXi/J1YAFTPl48S5Z3kTXY981lK2Xr2oUffVur8UDcGAvwKLRGQCcUPTZC63kp
 4+pXNc/RuHNFCN0xfjq8ERMh4fGxThWYvk5KvAruzXTUx8mCSqW0pSpXVP9C0aEIChDp
 cxRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/plfiVoeJH8v+xyH96RscCwYYpjDV+ag7hv6C1VKXX5nkesgr7dM5lK8ky9gZtrG42RM+/9JwiWY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZeCal+KPgKF+7doODllLrWFWFCUbuhkVJpFm2r7P7XYesrWrV
 f/KS3b9RYS6iBaYg55J9ocAeXBlQweOlrL8p6HqXcsRb9wLaf3ctJoSyaqdaee5+pME=
X-Gm-Gg: AY/fxX7S94wVwjhKReLUlEb3IDWdT0SOn54B2ybSmY3Z0O5A/pYHQZYH0onft3iYjkr
 DD6TG8CdDmfhWzhGbHGKzapyYXner94buUIo3zY/Hw/T4n87vWQGFU/PJ88h1K3LyLlGg3C5vdR
 XM2IcYuhGgTlosJ/gpfTWxKzDGqiE8rMyHAMMj6xVKV5pG3FTgia1u5kqZl5TnF89Lsi8PAN7BF
 ChL5IB4+nBpt39QDphoKBg1RdeuRwUPf2onMNIJlUZYg8Xmu5Erhntxq+DK3leoC/zLZiqv5rEO
 obYoVkpqIpgqX3goQ+aoNDziMvDoWZHtOPD4XokUv5FhWKQjGhz8bgWPfoxyFaL7oS3O53OTOe4
 dShTAUh49mHvEiD3lSBUs08SobSWyjLPXrf2MPBQ7g+Ec10fBeP57A56EYzjuWAxs5N0m3oLFkR
 z00VEr2kjcBknavA/F3jZUSLvXi/8=
X-Google-Smtp-Source: AGHT+IEWnJ+smox+Awq4YY2u+tYf4kZjFoSNBjl69Zus1TVDvNF1T4vaSgqJeTV4pQlOkjzV9gYE1A==
X-Received: by 2002:a05:600c:818f:b0:477:7b16:5f77 with SMTP id
 5b1f17b1804b1-47d19538725mr2627515e9.3.1766086568848; 
 Thu, 18 Dec 2025 11:36:08 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa64cesm552594f8f.35.2025.12.18.11.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 11:36:08 -0800 (PST)
Date: Thu, 18 Dec 2025 22:36:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org
Subject: Re: [PATCH 1/2] kbuild: remove gcc's -Wtype-limits
Message-ID: <aURXpAwm-ITVlHMl@stanley.mountain>
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
 <20251218-remove_wtype-limits-v1-1-735417536787@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-remove_wtype-limits-v1-1-735417536787@kernel.org>
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

On Thu, Dec 18, 2025 at 07:50:01PM +0100, Vincent Mailhol wrote:
> W=2 builds are heavily polluted by the -Wtype-limits warning.
> 
> Here are some W=12 statistics on Linux v6.19-rc1 for an x86_64
> defconfig (with just CONFIG_WERROR set to "n") using gcc 14.3.1:
> 
> 	 Warning name			count	percent
> 	-------------------------------------------------
> 	 -Wlogical-op			    2	  0.00 %
> 	 -Wmaybe-uninitialized		  138	  0.20 %
> 	 -Wunused-macros		  869	  1.24 %
> 	 -Wmissing-field-initializers	 1418	  2.02 %
> 	 -Wshadow			 2234	  3.19 %
> 	 -Wtype-limits			65378	 93.35 %
> 	-------------------------------------------------
> 	 Total				70039	100.00 %
> 
> As we can see, -Wtype-limits represents the vast majority of all
> warnings. The reason behind this is that these warnings appear in
> some common header files, meaning that some unique warnings are
> repeated tens of thousands of times (once per header inclusion).
> 
> Add to this the fact that each warning is coupled with a dozen lines
> detailing some macro expansion. The end result is that the W=2 output
> is just too bloated and painful to use.
> 
> Three years ago, I proposed in [1] modifying one such header to
> silence that noise. Because the code was not faulty, Linus rejected
> the idea and instead suggested simply removing that warning.
> 
> At that time, I could not bring myself to send such a patch because,
> despite its problems, -Wtype-limits would still catch the below bug:
> 
> 	unsigned int ret;
> 
> 	ret = check();
> 	if (ret < 0)
> 		error();
> 
> Meanwhile, based on another suggestion from Linus, I added a new check
> to sparse [2] that would catch the above bug without the useless spam.
> 
> With this, remove gcc's -Wtype-limits. People who still want to catch
> incorrect comparisons between unsigned integers and zero can now use
> sparse instead.
> 
> On a side note, clang also has a -Wtype-limits warning but:
> 
>   * it is not enabled in the kernel at the moment because, contrary to
>     gcc, clang did not include it under -Wextra.
> 
>   * it does not warn if the code results from a macro expansion. So,
>     if activated, it would not cause as much spam as gcc does.
> 
>   * -Wtype-limits is split into four sub-warnings [3] meaning that if
>     it were to be activated, we could select which one to keep.
> 

Sounds good.  I like your Sparse check.

Maybe we should enable the Sparse checking as well because it sounds
like they are doing a lot of things right.  I think Smatch catches the
same bugs that Clang would but it would be good to have multiple
implementations.  The -Wtautological-unsigned-enum-zero-compare trips
people up because they aren't necessarily expecting enums to be
unsigned.

regards,
dan carpenter


