Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A93A96D7CC1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 14:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A256310E93B;
	Wed,  5 Apr 2023 12:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C4110E938;
 Wed,  5 Apr 2023 12:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680698197; x=1712234197;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lAbGCAPKZ9vvWne6PxTI0jq1JoZ52vkaL+wiXgh6pbg=;
 b=DNqxjGlRsNTtseOlOswhF4ZPmk7GyQH0Ss7Oo4E9xEU/EIQTddvuJkdj
 lMARPvoW+I57eX/+7LQcFMpOgXQ/7C+d3NINiOnWm/HDdUbf3sgCJrVEo
 peMXwgTU4z6T4r4VM6c7AM50p4n4iaH9Am6nqCYDn3jG+Ru3lZGryoFUM
 Uut3zHh6VU1Eex+Cvifos50g+tCa8vFuufIv2KJSNLXQI8oOfaubce4/j
 Mf1Um3lLS+mwJdo0GC4glIYAT1pCVlumEXyvkV14lQ3KQVFzOS18TY61E
 mDDWUabzU+kHd0UpCR152wcshM0Vsm7Bu4ZaHb+VWu7APsBBTottFmOdx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="322097390"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="322097390"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 05:36:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="751243259"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="751243259"
Received: from dcolomor-mobl1.ger.corp.intel.com (HELO [10.249.33.69])
 ([10.249.33.69])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 05:36:33 -0700
Message-ID: <c9a76f79-d769-5eb4-c294-1df14d266ee4@linux.intel.com>
Date: Wed, 5 Apr 2023 14:36:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RESEND v3 0/3] drm/ttm: Small fixes / cleanups in prep for
 shrinking
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
 <42f30a99-a259-91d6-8fb9-25eb85e7b2a1@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <42f30a99-a259-91d6-8fb9-25eb85e7b2a1@amd.com>
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
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/5/23 14:32, Christian König wrote:
> Am 04.04.23 um 22:06 schrieb Thomas Hellström:
>> I collected the, from my POW, uncontroversial patches from V1 of the TTM
>> shrinker series, some corrected after the initial patch submission, one
>> patch added from the Xe RFC ("drm/ttm: Don't print error message if
>> eviction was interrupted"). It would be nice to have these reviewed and
>> merged while reworking the rest.
>>
>> v2:
>> - Simplify __ttm_pool_free().
>> - Fix the TTM_TT_FLAG bit numbers.
>> - Keep all allocation orders for TTM pages at or below PMD order
>>
>> v3:
>> - Rename __tm_pool_free() to ttm_pool_free_range(). Document.
>> - Compile-fix.
>
> Reviewed-by: Christian König <christian.koenig@amd.com> for the series.

Thanks, Christian.

/Thomas


>
>>
>> Thomas Hellström (3):
>>    drm/ttm/pool: Fix ttm_pool_alloc error path
>>    drm/ttm: Reduce the number of used allocation orders for TTM pages
>>    drm/ttm: Make the call to ttm_tt_populate() interruptible when
>>      faulting
>>
>>   drivers/gpu/drm/ttm/ttm_bo_vm.c |  13 +++-
>>   drivers/gpu/drm/ttm/ttm_pool.c  | 111 ++++++++++++++++++++------------
>>   2 files changed, 80 insertions(+), 44 deletions(-)
>>
>
