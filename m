Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7F294CE4F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 12:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A7B10E713;
	Fri,  9 Aug 2024 10:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNRj8lcu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A472610E0A5;
 Fri,  9 Aug 2024 10:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723198202; x=1754734202;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ykVOXO+wOK/NjMSY18FDWeiDIfP7H/4eAYVkVXPbzyQ=;
 b=HNRj8lcuMjDPnVYWEYmmEksvKInyadO1GrcK+2cCsQJLVPQHCDCvwgpc
 UpDzpd0GiXF0LPZLE65mEvl/8ENdDscKoLbfSTVJpD+YbvwQ8kTBdNtyE
 9KQkufGUNc0YHyGB3DiyPv++QgYDg8ZmC0fyXkbkV/GZDkjL7pGNDV0FF
 YS/qgtzikZnR1rkBlpMoXR60+RlF5ZaKLcC3lPHp4NOnuOkh+iCyDJ3Vw
 /ChKyUaAXIicGhBTJLKAjWZ+lmBNlDdKi1fqMC/COoP9FjlbWJl0cmAUh
 tYZktu3y/jJFLaKdM+i/2p3IVz9wPFYhOhrv7vHMF4w2F3V8nNUTWg0xg A==;
X-CSE-ConnectionGUID: JEqqdonWRrCSg+bRyl3qgw==
X-CSE-MsgGUID: r5NAIKo8RrKjNGeol2u3OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21525713"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="21525713"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 03:10:02 -0700
X-CSE-ConnectionGUID: PEHc35qGTfCf+SYewlOSwQ==
X-CSE-MsgGUID: FOfprsgNQHywNMxpVJsXdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="80762734"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO [10.245.245.147])
 ([10.245.245.147])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 03:10:00 -0700
Message-ID: <3fdd9175-832a-4113-8aaa-6039925c5a4d@intel.com>
Date: Fri, 9 Aug 2024 11:09:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: fix issue that force_merge cannot free all
 roots
To: "Lin.Cao" <lincao12@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, Arunpravin.PaneerSelvam@amd.com
Cc: Horace.Chen@amd.com
References: <20240808063812.1293955-1-lincao12@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240808063812.1293955-1-lincao12@amd.com>
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

Hi,

On 08/08/2024 07:38, Lin.Cao wrote:
> If buddy manager have more than one roots and each root have sub-block
> need to be free. When drm_buddy_fini called, the first loop of
> force_merge will merge and free all of the sub block of first root,
> which offset is 0x0 and size is biggest(more than have of the mm size).
> In subsequent force_merge rounds, if we use 0 as start and use remaining
> mm size as end, the block of other roots will be skipped in
> __force_merge function. It will cause the other roots can not be freed.
> 
> Solution: use roots' offset as the start could fix this issue.
> 
> Signed-off-by: Lin.Cao <lincao12@amd.com>

Nice catch.

> ---
>   drivers/gpu/drm/drm_buddy.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 94f8c34fc293..5379687552bc 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -327,12 +327,14 @@ void drm_buddy_fini(struct drm_buddy *mm)
>   	u64 root_size, size;
>   	unsigned int order;
>   	int i;
> +	u64 start = 0;

Nit: We could maybe move this into root_size, size or even into the loop 
body below? Also no need to init.

>   
>   	size = mm->size;
>   
>   	for (i = 0; i < mm->n_roots; ++i) {
>   		order = ilog2(size) - ilog2(mm->chunk_size);
> -		__force_merge(mm, 0, size, order);
> +		start = drm_buddy_block_offset(mm->roots[i]);
> +		__force_merge(mm, start, start + size, order);
>   
>   		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));

We do seem to have a testcase for this at the bottom of 
drm_test_buddy_alloc_clear(), so either it is not triggering the 
WARN_ON() here in which case we should maybe improve that. Or it is, but 
kunit doesn't treat that as a test failure? Maybe we can call something 
like kunit_fail_current_test() here if that WARN_ON is triggered?

For reference our CI is just running all drm selftests with:

/kernel/tools/testing/kunit/kunit.py run --kunitconfig 
/kernel/drivers/gpu/drm/tests/.kunitconfig

>   		drm_block_free(mm, mm->roots[i]);
