Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4F685D559
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 11:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D4210E6CA;
	Wed, 21 Feb 2024 10:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mMesgpWK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA6C10E54D;
 Wed, 21 Feb 2024 10:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708510913; x=1740046913;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zLzzvJfbVa6ODHn00Dyc4JUBC3zDKDHRQgbVtNkryF0=;
 b=mMesgpWKO0GrBe8QopdddWMI6vmHEKz3TcO/0ejEkO4j7hawWtW4JqKu
 QjlPx1x6y4YJHLJCkM159CxIkkGfRxxgItrJ0ag+ryInkIdG1v8wCsgKL
 L8/MsIRz+ofRKdlbxqYtGO1L9bkZmZTGC9JbQEwlTPSqspRUfb0vRQuco
 TpM0uNWhuMnmzXGJ57I+gG7/R5O8YNE3iTxZBtMv039kQkjj0pDQdSyRZ
 rRJigHycyVqCJwWCV83iS83xcjDfBAnJ0cdBm+n+85zP/l+XFooeZz1LG
 eJGny+zqWJIVHn+EU26L13qzKUMF7jv94GaNrDErRrMo0AKCAHS3ZZ7hD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="3141155"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="3141155"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 02:21:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="9717365"
Received: from conorwoo-mobl1.ger.corp.intel.com (HELO [10.252.22.137])
 ([10.252.22.137])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 02:21:47 -0800
Message-ID: <391b3603-52bc-4b07-9a50-7261971ee39f@intel.com>
Date: Wed, 21 Feb 2024 10:21:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] drm: tests: Fix invalid printf format specifiers in
 KUnit tests
To: David Gow <davidgow@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>,
 Rae Moar <rmoar@google.com>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Latypov <dlatypov@google.com>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-hardening@vger.kernel.org,
 netdev@vger.kernel.org
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-8-davidgow@google.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240221092728.1281499-8-davidgow@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 21/02/2024 09:27, David Gow wrote:
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
> give these some more detailed error messages, which should be more
> useful anyway.
> 
> Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous test")
> Fixes: fca7526b7d89 ("drm/tests/drm_buddy: fix build failure on 32-bit targets")
> Fixes: fc8d29e298cf ("drm: selftest: convert drm_mm selftest to KUnit")
> Signed-off-by: David Gow <davidgow@google.com>
> ---
>   drivers/gpu/drm/tests/drm_buddy_test.c | 14 +++++++-------
>   drivers/gpu/drm/tests/drm_mm_test.c    |  6 +++---
>   2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 8a464f7f4c61..3dbfa3078449 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -55,30 +55,30 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>   		KUNIT_ASSERT_FALSE_MSG(test,
>   				       drm_buddy_alloc_blocks(&mm, 0, mm_size,
>   							      ps, ps, list, 0),
> -				       "buddy_alloc hit an error size=%d\n",
> +				       "buddy_alloc hit an error size=%lu\n",
>   				       ps);
>   	} while (++i < n_pages);
>   
>   	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>   							   3 * ps, ps, &allocated,
>   							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc didn't error size=%d\n", 3 * ps);
> +			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
>   
>   	drm_buddy_free_list(&mm, &middle);
>   	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>   							   3 * ps, ps, &allocated,
>   							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
> +			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
>   	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>   							   2 * ps, ps, &allocated,
>   							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc didn't error size=%llu\n", 2 * ps);
> +			       "buddy_alloc didn't error size=%lu\n", 2 * ps);
>   
>   	drm_buddy_free_list(&mm, &right);
>   	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>   							   3 * ps, ps, &allocated,
>   							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
> +			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
>   	/*
>   	 * At this point we should have enough contiguous space for 2 blocks,
>   	 * however they are never buddies (since we freed middle and right) so
> @@ -87,13 +87,13 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>   	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>   							    2 * ps, ps, &allocated,
>   							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc hit an error size=%d\n", 2 * ps);
> +			       "buddy_alloc hit an error size=%lu\n", 2 * ps);
>   
>   	drm_buddy_free_list(&mm, &left);
>   	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>   							    3 * ps, ps, &allocated,
>   							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> -			       "buddy_alloc hit an error size=%d\n", 3 * ps);
> +			       "buddy_alloc hit an error size=%lu\n", 3 * ps);

There was also a fix for this in: 335126937753 ("drm/tests/drm_buddy: 
fix 32b build"), but there everything was made u32.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   
>   	total = 0;
>   	list_for_each_entry(block, &allocated, link)
> diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
> index 1eb0c304f960..f37c0d765865 100644
> --- a/drivers/gpu/drm/tests/drm_mm_test.c
> +++ b/drivers/gpu/drm/tests/drm_mm_test.c
> @@ -157,7 +157,7 @@ static void drm_test_mm_init(struct kunit *test)
>   
>   	/* After creation, it should all be one massive hole */
>   	if (!assert_one_hole(test, &mm, 0, size)) {
> -		KUNIT_FAIL(test, "");
> +		KUNIT_FAIL(test, "mm not one hole on creation");
>   		goto out;
>   	}
>   
> @@ -171,14 +171,14 @@ static void drm_test_mm_init(struct kunit *test)
>   
>   	/* After filling the range entirely, there should be no holes */
>   	if (!assert_no_holes(test, &mm)) {
> -		KUNIT_FAIL(test, "");
> +		KUNIT_FAIL(test, "mm has holes when filled");
>   		goto out;
>   	}
>   
>   	/* And then after emptying it again, the massive hole should be back */
>   	drm_mm_remove_node(&tmp);
>   	if (!assert_one_hole(test, &mm, 0, size)) {
> -		KUNIT_FAIL(test, "");
> +		KUNIT_FAIL(test, "mm does not have single hole after emptying");
>   		goto out;
>   	}
>   
