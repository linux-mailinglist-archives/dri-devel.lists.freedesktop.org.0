Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9D9C242B4
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 10:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E28B10EA60;
	Fri, 31 Oct 2025 09:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DdEHhi+T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256FE10E065;
 Fri, 31 Oct 2025 09:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/AMJv4Pj/Cps2XPHHVCkKT8qdENxmbdXHKou5ANN1DI=; b=DdEHhi+TxJQwshFGfiuNJPyj2n
 /djBwQbjX+5AfauMA9nRyg31ceSGtEZgAlsN2Af6Fj7/TytclEuEwmntH4xKmiMlQL3G6k6AQCIY5
 vqBviOoS18JyItuZid9KR6DOGyhLRWu5oPdR356GcYjknnp+va/ESYkRdB923eZ02C1OgIDi8dh/u
 nqd85PEp9yAGBxXWNUPOi4yc556yGu2sC3eZD1D0DKeXJPebJs4j66kq3h63boSn0pTcPzkBjhY9G
 m+MCmRV1GjFWsNYhrZ0RyWrnOfnU2emE2nk1E+Z2mNkRo1004o7FeuqhHenWHO6n/34ABpYj6wrpW
 Z5ibmhGg==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vElUM-00HPSn-RL; Fri, 31 Oct 2025 10:32:06 +0100
Message-ID: <ae11f332-e7c1-4083-9ac8-7a9b54a38f0a@igalia.com>
Date: Fri, 31 Oct 2025 09:32:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] Improving the worst case TTM large allocation
 latency
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zack Rusin <zack.rusin@broadcom.com>
References: <20251020115411.36818-1-tvrtko.ursulin@igalia.com>
 <02741c46-ae85-4242-b623-f38bb82f6b43@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <02741c46-ae85-4242-b623-f38bb82f6b43@amd.com>
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


On 27/10/2025 10:21, Christian König wrote:
> Where not applied yet or superseeded by a newer version Reviewed-by: Christian König <christian.koenig@amd.com> for the entire series.

Thank you all for reviews and acks! I have now pushed this to drm-misc-next.

Xe can follow up with the ENOSPC, and probably 2M beneficial order, at 
their leisure.

Regards,

Tvrtko

> On 10/20/25 13:54, Tvrtko Ursulin wrote:
>> Disclaimer:
>> Please note that as this series includes a patch which touches a good number of
>> drivers I will only copy everyone in the cover letter and the respective patch.
>> Assumption is people are subscribed to dri-devel so can look at the whole series
>> there. I know someone is bound to complain for both the case when everyone is
>> copied on everything for getting too much email, and also for this other case.
>> So please be flexible.
>>
>> Description:
>>
>> All drivers which use the TTM pool allocator end up requesting large order
>> allocations when allocating large buffers. Those can be slow due memory pressure
>> and so add latency to buffer creation. But there is often also a size limit
>> above which contiguous blocks do not bring any performance benefits. This series
>> allows drivers to say when it is okay for the TTM to try a bit less hard.
>>
>> We do this by allowing drivers to specify this cut off point when creating the
>> TTM device and pools. Allocations above this size will skip direct reclaim so
>> under memory pressure worst case latency will improve. Background reclaim is
>> still kicked off and both before and after the memory pressure all the TTM pool
>> buckets remain to be used as they are today.
>>
>> This is especially interesting if someone has configured MAX_PAGE_ORDER to
>> higher than the default. And even with the default, with amdgpu for example,
>> the last patch in the series makes use of the new feature by telling TTM that
>> above 2MiB we do not expect performance benefits. Which makes TTM not try direct
>> reclaim for the top bucket (4MiB).
>>
>> End result is TTM drivers become a tiny bit nicer mm citizens and users benefit
>> from better worst case buffer creation latencies. As a side benefit we get rid
>> of two instances of those often very unreadable mutliple nameless booleans
>> function signatures.
>>
>> If this sounds interesting and gets merge the invidual drivers can follow up
>> with patches configuring their thresholds.
>>
>> v2:
>>   * Christian suggested to pass in the new data by changing the function signatures.
>>
>> v3:
>>   * Moved ttm pool helpers into new ttm_pool_internal.h. (Christian)
>>
>> v4:
>>   * Fixed TTM unit test build.
>>
>> v5:
>>   * Renamed pool_flags to alloc_flags and moved to TTM_ALLOCATION_ namespace.
>>   * Added last patch (propagate ENOSPC) from Thomas' related series for reference.
>>
>> v1 thread:
>> https://lore.kernel.org/dri-devel/20250919131127.90932-1-tvrtko.ursulin@igalia.com/
>>
>> v3 thread:
>> https://lore.kernel.org/dri-devel/20251008115314.55438-1-tvrtko.ursulin@igalia.com/
>>
>> v4 thread:
>> https://lore.kernel.org/dri-devel/20251013082240.55263-1-tvrtko.ursulin@igalia.com/
>>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Dave Airlie <airlied@redhat.com>
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Sui Jingfeng <suijingfeng@loongson.cn>
>> Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Zack Rusin <zack.rusin@broadcom.com>
>>
>> Tvrtko Ursulin (6):
>>    drm/ttm: Add getter for some pool properties
>>    drm/ttm: Replace multiple booleans with flags in pool init
>>    drm/ttm: Replace multiple booleans with flags in device init
>>    drm/ttm: Allow drivers to specify maximum beneficial TTM pool size
>>    drm/amdgpu: Configure max beneficial TTM pool allocation order
>>    drm/ttm: Add an allocation flag to propagate -ENOSPC on OOM
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  9 ++--
>>   drivers/gpu/drm/drm_gem_vram_helper.c         |  2 +-
>>   drivers/gpu/drm/i915/intel_region_ttm.c       |  2 +-
>>   drivers/gpu/drm/loongson/lsdc_ttm.c           |  3 +-
>>   drivers/gpu/drm/nouveau/nouveau_ttm.c         |  6 ++-
>>   drivers/gpu/drm/qxl/qxl_ttm.c                 |  2 +-
>>   drivers/gpu/drm/radeon/radeon_ttm.c           |  6 ++-
>>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 16 +++----
>>   .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  2 +-
>>   drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 33 ++++++--------
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 22 ++++-----
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  7 +--
>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 24 +++++-----
>>   drivers/gpu/drm/ttm/ttm_bo.c                  |  4 +-
>>   drivers/gpu/drm/ttm/ttm_device.c              |  9 ++--
>>   drivers/gpu/drm/ttm/ttm_pool.c                | 45 +++++++++++--------
>>   drivers/gpu/drm/ttm/ttm_pool_internal.h       | 25 +++++++++++
>>   drivers/gpu/drm/ttm/ttm_tt.c                  | 10 +++--
>>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  4 +-
>>   drivers/gpu/drm/xe/xe_device.c                |  2 +-
>>   include/drm/ttm/ttm_allocation.h              | 12 +++++
>>   include/drm/ttm/ttm_device.h                  |  8 +++-
>>   include/drm/ttm/ttm_pool.h                    |  8 ++--
>>   23 files changed, 154 insertions(+), 107 deletions(-)
>>   create mode 100644 drivers/gpu/drm/ttm/ttm_pool_internal.h
>>   create mode 100644 include/drm/ttm/ttm_allocation.h
>>
> 

