Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CDA9905F7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 16:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A7110E046;
	Fri,  4 Oct 2024 14:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5i78QYB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DE510E046;
 Fri,  4 Oct 2024 14:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728051929; x=1759587929;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oTHAQ15P9F9p+yse5XCZutqxQhRigAzsZoXWYihcX8c=;
 b=J5i78QYB4gKv3HkmHog6lhFB7a+MvkCy+6cVRQUfLgkirMlVd6FcKzSU
 M8fdUgFlHJpCHCqQ9RBKGP1KuVM1JcIvbtdNHPHvWRtE6aVeil/5GPIAY
 HDDWbzsIBRm3Znti5c4RUbeRqGbwCWYafu3cdFOGZVPu+EsGjluppGLt+
 HlLe1LK+S8a4koZ/qJu4zkzjish73zTObOjqtGjcdSlhbGZKtFDwyhjqD
 jN8GjGvC2N3u3sWkg9LvqspC6wfWY5y2ZIY70AhkYJBrBcsY2pIdfvQqU
 Prc9BcJdaipIjMzoFNOJN49Qs7Wt5VV/dOaQn8i4R4MvTYNJk/b0BCuhS w==;
X-CSE-ConnectionGUID: qoATD8viTr2NUysEhHRZSQ==
X-CSE-MsgGUID: ccDsxGdrSgq7ki5W2K2a+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27422675"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="27422675"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 07:25:28 -0700
X-CSE-ConnectionGUID: o/xYaLb1TMOeCeNbwI1JrA==
X-CSE-MsgGUID: hMQ7S8K7TKOLIQJfttz/3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74304731"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.57])
 ([10.245.245.57])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 07:25:27 -0700
Message-ID: <6b335b0f-d67e-43e0-928d-c44208043fa0@intel.com>
Date: Fri, 4 Oct 2024 15:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/tests: Fix the shrinker test compiler warnings.
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Nathan Chancellor <nathan@kernel.org>, dri-devel@lists.freedesktop.org
References: <20241004141121.186177-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241004141121.186177-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 04/10/2024 15:11, Thomas Hellström wrote:
> The xe_bo_shrink_kunit test has an uninitialized value and illegal
> integer size conversions on 32-bit. Fix.
> 
> v2:
> - Use div64_u64 to ensure the u64 division compiles everywhere. (Matt Auld)
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/20240913195649.GA61514@thelio-3990X/
> Fixes: 5a90b60db5e6 ("drm/xe: Add a xe_bo subtest for shrinking / swapping")
> Cc: dri-devel@lists.freedesktop.org
> Cc: Matthew Auld <matthew.auld@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v1
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Could probably use div_u64().

Anyway,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/tests/xe_bo.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 7d3fd720478b..cd811aa2b227 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -7,6 +7,7 @@
>   #include <kunit/visibility.h>
>   
>   #include <linux/iosys-map.h>
> +#include <linux/math64.h>
>   #include <linux/random.h>
>   #include <linux/swap.h>
>   
> @@ -440,7 +441,7 @@ static int shrink_test_run_device(struct xe_device *xe)
>   	LIST_HEAD(bos);
>   	struct xe_bo_link *link, *next;
>   	struct sysinfo si;
> -	size_t ram, ram_and_swap, purgeable, alloced, to_alloc, limit;
> +	u64 ram, ram_and_swap, purgeable = 0, alloced, to_alloc, limit;
>   	unsigned int interrupted = 0, successful = 0, count = 0;
>   	struct rnd_state prng;
>   	u64 rand_seed;
> @@ -469,7 +470,7 @@ static int shrink_test_run_device(struct xe_device *xe)
>   	ram_and_swap = ram + get_nr_swap_pages() * PAGE_SIZE;
>   	if (to_alloc > ram_and_swap)
>   		purgeable = to_alloc - ram_and_swap;
> -	purgeable += purgeable / 5;
> +	purgeable += div64_u64(purgeable, 5);
>   
>   	kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
>   		   (unsigned long)ram);
