Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C17797326
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 16:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7A810E7F9;
	Thu,  7 Sep 2023 14:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F25C10E7F8;
 Thu,  7 Sep 2023 14:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694098077; x=1725634077;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QqXlOsOA/vYIWx0W5XIpdzXyr2DINiodyn3bHIZecMY=;
 b=Qu+Ne/WasHAJYvDdC8CMQk1ZDjg3qySgSanrozw8SIgj5R69ICRnHeNC
 IYFuwBt4tqI6pod+oFFL5izRDP5s4FiBrbWcyvSuKWm+vy4pfQG8yJpKb
 sDVgBLNvxxOapG8qc45aHFpPCPvMDkDZJyj2ojw6Wg7WnR2IRw/ieGx8O
 nZ9nxeKgSQqh8ChmUGvnQnGZtd4ghD9rW8M2vfDwk+b9uky7QlN0Fp344
 icPGwVjBY+0oUmsb0nEQEN9fxCyr2bX8zV90fITOirOXW0X/b+JmFZRx+
 2uYd+TdwwZhh3794c0RYLPFbnRryCgmtAQqLWfyLxPc+OnIOkGV/F0M0r g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="374760253"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="374760253"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 07:47:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="1072912946"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="1072912946"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO [10.249.254.26])
 ([10.249.254.26])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 07:47:54 -0700
Message-ID: <2a9310b5-cf08-d4fe-c08e-c3fc9d25653c@linux.intel.com>
Date: Thu, 7 Sep 2023 16:47:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 0/2] drm/tests: Fix for UAF and a test for drm_exec
 lock alloc tracking warning
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230907135339.7971-1-thomas.hellstrom@linux.intel.com>
 <b3ab850d-9da2-0b19-2aa1-fa5a2c3dc079@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <b3ab850d-9da2-0b19-2aa1-fa5a2c3dc079@amd.com>
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
Cc: Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/7/23 16:37, Christian König wrote:
> Am 07.09.23 um 15:53 schrieb Thomas Hellström:
>> While trying to replicate a weird drm_exec lock alloc tracking warning
>> using the drm_exec kunit test, the warning was shadowed by a UAF warning
>> from KASAN due to a bug in the drm kunit helpers.
>>
>> Patch 1 fixes that drm kunit UAF.
>> Patch 2 introduces a drm_exec kunit subtest that fails if the conditions
>>        for the weird warning are met.
>>
>> The series previously also had a patch with a drm_exec workaround for 
>> the
>> warning but that patch has already been commited to drm_misc_next_fixes.
>
> Thinking more about this what happens when somebody calls 
> drm_exec_unlock_obj() on the first locked object?
>
Essentially the same thing. I've been thinking of the best way to handle 
that, but not sure what's the best one.

/Thomas


> Christian.
>
>>
>> v2:
>> - Rewording of commit messages
>> - Add some commit message tags
>> v3:
>> - Remove an already committed patch
>> - Rework the test to not require dmesg inspection (Maxime Ripard)
>> - Condition the test on CONFIG_LOCK_ALLOC
>> - Update code comments and commit messages (Maxime Ripard)
>>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Christian König <christian.koenig@amd.com>
>>
>> Thomas Hellström (2):
>>    drm/tests: helpers: Avoid a driver uaf
>>    drm/tests/drm_exec: Add a test for object freeing within
>>      drm_exec_fini()
>>
>>   drivers/gpu/drm/tests/drm_exec_test.c | 82 +++++++++++++++++++++++++++
>>   include/drm/drm_kunit_helpers.h       |  4 +-
>>   2 files changed, 85 insertions(+), 1 deletion(-)
>>
>
