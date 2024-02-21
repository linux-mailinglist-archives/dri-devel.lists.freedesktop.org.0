Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 692A685EACE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 22:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6EF10E10E;
	Wed, 21 Feb 2024 21:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="WLqa4G9H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD48F10E4AA
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 21:29:56 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-7bc332d3a8cso370831939f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 13:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708550996; x=1709155796;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fHJzWSZbaUVkrjgtkdycbYKuoIbcz4QqReZXQuIUTd8=;
 b=WLqa4G9HcE7G1jITV6wmRdvh+yFD/8YnvT3pRmkc8GOFCFKVJkrf7cK9RLBzX6S9wK
 JJpINDeR3vGouiyEj0ARYBiU78eIT+v9HVDKHvcbUNvibTu9nM3AQLpSwZ42eB1TiFqF
 krra/xsqTMgo1P7QJO5ZiuyWvWPPytuEnkgTMzY234wzYvPdAgqa7AJmjz+x46VHi9hY
 spDRK6azthMJPXIdvzN6GuZk43oE85KlqpQsnCmzMDH5UcVjxLNwPk/FmvJsMIauE0JL
 eHt6Do1HlwsoXjZ1o7UZtROUNs8QaaMcAxzKP70BiQ2b+Ln3cdCVGp2QBiC+22YY75Qz
 kdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708550996; x=1709155796;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fHJzWSZbaUVkrjgtkdycbYKuoIbcz4QqReZXQuIUTd8=;
 b=eLkCZQZTJyQ9g2DcZW1bKJV8iUBsDOC9Tn7+5Pj9+AqY+i9a0rf5qAHpS2f8rM1VZQ
 FG7Sfd9HRAs4KNzAzyUGMetuuEZKqQXqB0FcJCp8YG1tNrMEWyl2R/YcD5ab0+KLP/Ss
 b0Q91hO44Of92cXzS4G9165gdeDUf5aTxL/FAkcFLSkIqXibQUBg4y+Rh3lIDc/ZlF1w
 Xt5s1hjH++qEXQnAEa2ajjHf/DUGZmeic5WEBAWEJpVOZrRb9NGPBpcr+1Od5nTF5JzX
 0t49YvKEMnKCPJ4u8mNGEMMhddRo7V84qyOfbJW39L/Ym78Yw2JlD8MORSpkVLVrsEqu
 lhFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtwC8LGEjOjUy72I9Tt0B1hnUqtOs0+Vk910fVhAsofK/UFpIfuPbVyuXU8vOwpZtEtBVMdxK8RjSd7Jo6iPBGtaMOCyh4kaVSSvFnJqSE
X-Gm-Message-State: AOJu0YyqvOZsz6dL/xy5PhyPNURgJu5yaHbkHVwwAsu+d/tjUm9WVKG3
 aY7aHlB0Xq9rp3LCnBdE+cmwus/6vKmwVYheeNsrVhcGYxlr+GZW4XW/0zO8Cg==
X-Google-Smtp-Source: AGHT+IH3xGOF+O0PatOjKRFVOXKn3+X8AKF5AtBxottFnw4acxjqjkkOFdnbYMdTb0txcBwNyBSoFw==
X-Received: by 2002:a05:6602:3fd1:b0:7c7:397c:6690 with SMTP id
 fc17-20020a0566023fd100b007c7397c6690mr17957645iob.17.1708550995732; 
 Wed, 21 Feb 2024 13:29:55 -0800 (PST)
Received: from google.com (161.74.123.34.bc.googleusercontent.com.
 [34.123.74.161]) by smtp.gmail.com with ESMTPSA id
 h21-20020a02c735000000b004742bbf11c0sm1712244jao.120.2024.02.21.13.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 13:29:54 -0800 (PST)
Date: Wed, 21 Feb 2024 21:29:52 +0000
From: Justin Stitt <justinstitt@google.com>
To: David Gow <davidgow@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Latypov <dlatypov@google.com>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org, linux-rtc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-hardening@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 7/9] drm: tests: Fix invalid printf format specifiers in
 KUnit tests
Message-ID: <20240221212952.bqw4rdz2i2yf3now@google.com>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-8-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221092728.1281499-8-davidgow@google.com>
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

Hi,

On Wed, Feb 21, 2024 at 05:27:20PM +0800, David Gow wrote:
> The drm_buddy_test's alloc_contiguous test used a u64 for the page size,
> which was then updated to be an 'unsigned long' to avoid 64-bit
> multiplication division helpers.
>
> However, the variable is logged by some KUNIT_ASSERT_EQ_MSG() using the
> '%d' or '%llu' format specifiers, the former of which is always wrong,
> and the latter is no longer correct now that ps is no longer a u64. Fix
> these to all use '%lu'.
>
> Also, drm_mm_test calls KUNIT_FAIL() with an empty string as the
> message. gcc warns if a printf format string is empty (apparently), so

clang does too; under -Wformat-zero-length

> give these some more detailed error messages, which should be more
> useful anyway.
>
> Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous test")
> Fixes: fca7526b7d89 ("drm/tests/drm_buddy: fix build failure on 32-bit targets")
> Fixes: fc8d29e298cf ("drm: selftest: convert drm_mm selftest to KUnit")
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  drivers/gpu/drm/tests/drm_buddy_test.c | 14 +++++++-------
>  drivers/gpu/drm/tests/drm_mm_test.c    |  6 +++---
>  2 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 8a464f7f4c61..3dbfa3078449 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -55,30 +55,30 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>  		KUNIT_ASSERT_FALSE_MSG(test,
>  				       drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							      ps, ps, list, 0),
> -				       "buddy_alloc hit an error size=%d\n",
> +				       "buddy_alloc hit an error size=%lu\n",
>  				       ps);
>  	} while (++i < n_pages);
>
>  	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							   3 * ps, ps, &allocated,
>  							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc didn't error size=%d\n", 3 * ps);
> +			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
>
>  	drm_buddy_free_list(&mm, &middle);
>  	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							   3 * ps, ps, &allocated,
>  							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
> +			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
>  	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							   2 * ps, ps, &allocated,
>  							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc didn't error size=%llu\n", 2 * ps);
> +			       "buddy_alloc didn't error size=%lu\n", 2 * ps);
>
>  	drm_buddy_free_list(&mm, &right);
>  	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							   3 * ps, ps, &allocated,
>  							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
> +			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
>  	/*
>  	 * At this point we should have enough contiguous space for 2 blocks,
>  	 * however they are never buddies (since we freed middle and right) so
> @@ -87,13 +87,13 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>  	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							    2 * ps, ps, &allocated,
>  							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc hit an error size=%d\n", 2 * ps);
> +			       "buddy_alloc hit an error size=%lu\n", 2 * ps);
>
>  	drm_buddy_free_list(&mm, &left);
>  	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>  							    3 * ps, ps, &allocated,
>  							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc hit an error size=%d\n", 3 * ps);
> +			       "buddy_alloc hit an error size=%lu\n", 3 * ps);
>
>  	total = 0;
>  	list_for_each_entry(block, &allocated, link)
> diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
> index 1eb0c304f960..f37c0d765865 100644
> --- a/drivers/gpu/drm/tests/drm_mm_test.c
> +++ b/drivers/gpu/drm/tests/drm_mm_test.c
> @@ -157,7 +157,7 @@ static void drm_test_mm_init(struct kunit *test)
>
>  	/* After creation, it should all be one massive hole */
>  	if (!assert_one_hole(test, &mm, 0, size)) {
> -		KUNIT_FAIL(test, "");
> +		KUNIT_FAIL(test, "mm not one hole on creation");
>  		goto out;
>  	}
>
> @@ -171,14 +171,14 @@ static void drm_test_mm_init(struct kunit *test)
>
>  	/* After filling the range entirely, there should be no holes */
>  	if (!assert_no_holes(test, &mm)) {
> -		KUNIT_FAIL(test, "");
> +		KUNIT_FAIL(test, "mm has holes when filled");
>  		goto out;
>  	}
>
>  	/* And then after emptying it again, the massive hole should be back */
>  	drm_mm_remove_node(&tmp);
>  	if (!assert_one_hole(test, &mm, 0, size)) {
> -		KUNIT_FAIL(test, "");
> +		KUNIT_FAIL(test, "mm does not have single hole after emptying");
>  		goto out;
>  	}
>
> --
> 2.44.0.rc0.258.g7320e95886-goog
>

Thanks
Justin
