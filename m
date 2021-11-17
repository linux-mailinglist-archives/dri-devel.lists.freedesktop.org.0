Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE839454B73
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 17:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F55389FF9;
	Wed, 17 Nov 2021 16:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EA189FF9;
 Wed, 17 Nov 2021 16:56:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ClwRL8qJXS+qA/eGOexOiMNz7CxKVxbpz4oQQMs6hVOF/2rZyJYk4EIRDS50KYUjNtl+J0Lkmn5AhAwCmJrtLUXbJiq8JLTnLmQujbK4R02r0hadfMeAafaNODmviLH2PQm0+L7N6M6hAdxiaXPN5stTiVFLkxCKjq1i28+igQaugmyoi3QSlDefKuR59DxAHh90NXwUxsKqTjjo55sPVj/zQiLj8ikRvSHaFSiApBwHPZQR+Wn1DCCtJtTokt5RnfDKTsZ5zAGGH3GBWkW2Jj2B027r/R5p2BepIAisPBqtDMilFyxxwpB2w43C7ksNvyxw4Q3I1zgV6e8+jCSd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whFwNd7vAmo3Z9sZcALh2GuoRCZ9UzsJxqeUrzWYwcg=;
 b=ahzHZ6QsJas26NGsgKIBV6LT9RUfSti/znIl8eZZ47mAdAQE4VOVKomKl61oR7KuJllfE4WMntaDGIxaKpDXFgj87IzdMAWMKgAJdighxfGRSjnR052WbzREabGtEAOgUwH2K2Lf5Qp/prCfYmj4QP5B1H6TzZbt2I+DxbD8xgcfHPW1DxDWT+/oGnxDbsoxLlERZNCSJUANLBu0/L8Rwc4tRG/oytHMzoTtXRvDGh3aGcXS8eqJ07HGlfh+oiBcVHCTZWOgUqGTg4WZyqW6n8EZUUzNi94JD3uA30c7l2zj3lHWlvuoJTCY8l+7He9DY9jhntRpEsR/TT8Ico8rLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whFwNd7vAmo3Z9sZcALh2GuoRCZ9UzsJxqeUrzWYwcg=;
 b=amE4O3tXhQAbrOAyNkQ0xT6IO/Q/qQ0OvLALrp3gmALcZug9aQkZYpiQfBGkGWi7ae3NepRPKEqvYEdIU2Di1LbCLwgeVyJOM+5z5yAPAZOWrsYmGFn6dH25KWptJN2nRY7UiGSJlZ/XxM4Y6VKKqz9yL7envXlQNTwHbG6yVu0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BL0PR12MB2515.namprd12.prod.outlook.com (2603:10b6:207:40::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 17 Nov
 2021 16:56:06 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6972:7084:df02:6dc3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6972:7084:df02:6dc3%9]) with mapi id 15.20.4713.021; Wed, 17 Nov 2021
 16:56:06 +0000
Message-ID: <011b4df2-4463-6d2e-3ad8-3f8002031405@amd.com>
Date: Wed, 17 Nov 2021 22:35:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 1/6] drm: move the buddy allocator from i915 into
 common drm
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20211116201807.147486-1-Arunpravin.PaneerSelvam@amd.com>
 <6b7a9695-1c38-3295-4097-90cbca4e6d27@gmail.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <6b7a9695-1c38-3295-4097-90cbca4e6d27@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN1PR0101CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:e::17) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
Received: from [10.138.142.32] (165.204.156.251) by
 PN1PR0101CA0007.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Wed, 17 Nov 2021 16:56:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fbe3f9a-804d-44a3-ce35-08d9a9eb2561
X-MS-TrafficTypeDiagnostic: BL0PR12MB2515:
X-Microsoft-Antispam-PRVS: <BL0PR12MB251569F18C816EAEBE64EA75E49A9@BL0PR12MB2515.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:568;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yvyEFwOxPikDM7szF1IiRw+R1g93HuVrWMc4WypYGVFqTrhiCVkh4PTgGjD2vM3FrKL+dPQ8dny/4jud9L21c2jGx27b173BF5lRRqj72ukBBRgwibbVVoajOevDWECpqLMF2uzzgj4xPHRnkIAIAXrRSu2mRmz2XPSNxYtvXBIoXvkmmIaeRe3mopDFm1ymi3EYWfghYvdrTpG7ni3MkOkaE8ZL3GBqGjbFA2bBaX44Oc4hlyuwfKOXQ1hR8TPzp7xiku1AgAWXdQpPV/q6gbbdqWFdDy6sBD1UdAM9TRjZGlBLpIoLNUerY9bkWMiLaHvbDp0KG54Ca4iqs8ZC/5MeJuTzHCiGg6IolQsNBn4eE6LIyYwA/iqWFfZSSHMEqUTS+HWusdICF+d/T3tz2xy1ThAqbEJqbO5CwHQ02rvnzfm1ttLlVIbya5+uMIn0n0gRlhYE8p4DDICznvNnBBKleJrBPCe27ER2VpKAiflKbTG6EuGWjqQyLr3XBzQq5rnt018dIRQmXV08gSYsSLelpNVTkXLAYBc0H38JUXRhtqboLVIZ0b2aOMTjbTMxKWsJ59+e/w+zTEUYGm2iiLd8dV+oCJkijc7qPvLIfzI2Ug8CCZby5R4Jhs2c3MHCVeIPr5ztg9fpZKMkm3gcmNP3rCsi6Xf60SVVILZYvTB0q2ua6sKRg/sqz5J0Epra4squk/TpqxsvzrqD7ovXC2I9ifJkfzj9PCl61w9+0Ieyw//RC0fUBgnT/jMgUZzsLgF718qPYGQ4EcOcBATEmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(4326008)(30864003)(31696002)(316002)(6486002)(6666004)(186003)(31686004)(508600001)(2906002)(66476007)(66556008)(26005)(38100700002)(66946007)(36756003)(5660300002)(8676002)(66574015)(86362001)(956004)(8936002)(2616005)(53546011)(83380400001)(134034003)(43740500002)(45980500001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tmp5SGR0YXZCaDdtZkRoV1VuaWQxTXZtSUF0emxIcE5WZnkrY3ZDbzd1MzRO?=
 =?utf-8?B?NVVJNzkwYW1lNVJzbXZ4ZnJNem55VHlWUjM4Y0VZVXFRbWtCcUpibDFIcXVU?=
 =?utf-8?B?RnVuQ2w2UFRxNU9odFhlTlF0TTBFR0lyazNsZHVPWlZmamNlMFlkaWdpeUd3?=
 =?utf-8?B?L2d4emQ2d3FBYmRCZjRQRldqVFNmYUVJOS91Q3ZLTjN2VTMwdkdBVmVaeXAx?=
 =?utf-8?B?MndDUWgzWGEvZG1pRmRQTVlOT2FTOHJBQml5dytlREpDOG5VeXhYcVl5OFRk?=
 =?utf-8?B?S0pFVnh2dEY3NFZ4bDZab2ZYcjFhSlFvcWY4am9UR3hMYXNZS0Z4ZXlka1c1?=
 =?utf-8?B?ZkhwbEpuYmR4aXZTcEFXaDhVMzA0eGM1dFdnVjExbThxdmxHdC8rbnBUMnEz?=
 =?utf-8?B?S2ZESkNsc2lhU0p3ZmZOQURaRmhuZ0pxZzhqTHdIMWZudzdZWEhBZU1zdU4v?=
 =?utf-8?B?S0dMOTdiOFU4eU9Tei9uRkV6TWh2NitwVWNOekpnS0VnV01LNE1tMC9kVHQ5?=
 =?utf-8?B?bitKNUhrdytqVUpkUmdnQW9PaEwxOUJYdWNCN0FueHlWalpMY0s4Qkh1WEkz?=
 =?utf-8?B?RGJ3SzhrcGpiTytOWDhyU0dldnlpV1ZxT2M3UTdIVHpBOUNkcnc3VlllZTk2?=
 =?utf-8?B?aFFIdVZ4MG9NWmhsZ2UrcW9KdUdvamZ2em9OMSt4anh5amNpekMzamZDdkhR?=
 =?utf-8?B?d2NtbXh4MTUyc2QvaEN0RVZ5TWVDZ2RVK3ZpOStPOHgyNGFiWExqdlpZcXVV?=
 =?utf-8?B?bnB3cFR6dStLcXEvWjRmYVlwUXZIT2Z6cHZjc1g0RC93QUJJc3JFVy9jK3B0?=
 =?utf-8?B?OWo0VGxLR3ZBUDhnRjk1VUZNcjlET2s4YzJ6TE1hRUlmUHBPdFFHOFlQZjUv?=
 =?utf-8?B?N0ZBY0o0UHlhKzhiWlZxQlNqZThSc0QzK3c5SzBuMDNmUDdncUtpVGFUTXZm?=
 =?utf-8?B?dE5TOXBiU1A2R09DL2VvVkxYSytEN0hPTUMyYVFuOFFiNnc3ekxENk85dUoy?=
 =?utf-8?B?TnRIelJPam82M2xpenpFMWJNQjIyNFN5N3RkN28ySUh1em1Zc3hvVWoyRFRR?=
 =?utf-8?B?RkRneDhqNXVsMTByRncwcEJyZjJlNkMwOG5kaWpWbzJ5QUNmNnltS2tmaXdD?=
 =?utf-8?B?T1p0a2JVSG5qQ1lXeGpYZUxtbHRmdFpETlNoeUtxMVVqdlZ2NlhVeXRQenFy?=
 =?utf-8?B?SXNLMzlHQjUzc1loWlZXUFNtTnQvWjlmS0VCZWU3L2dNWHp1TkM4cmk4NERp?=
 =?utf-8?B?U1JHOTNhQ0RwaXRWd0J6RituRm9PNmgyd2hoeGJyZVd3QXduZVo3bjM1RWto?=
 =?utf-8?B?d2srZWZVRHRTUnVpSTJDakVZL3NZd3J1dHdPWVMrdW9VdU4xTnJKTklzOWxj?=
 =?utf-8?B?aUxQQVY2SFp3dFM5S2txM3RsWk9QNHNxQkU1RUlWTXNZN3YrNG13NnNPS1d2?=
 =?utf-8?B?d2ZEOGRZRmEveUJzVWVzZVlvUlE3ZEVBYTRwbFdhUkIvRHdCNDhhQ0pONmdB?=
 =?utf-8?B?QlpETVNXdGVnTzNNZFlDQ0lGcU1SL2p2R3RHUTE2QjFtUmJ5M1M1bVVxdUFW?=
 =?utf-8?B?c0RuNGYvR3l3YWxneGx2VERORGRIY2ZibTUvZGRKbVNub2lwMDVJT25ZZnRH?=
 =?utf-8?B?bEJXR09Hay9TNmpIS01oa2J6UEM1SG5MTm9wamJ1djU5Vm9UMHQxM3NHWW1W?=
 =?utf-8?B?SFMyOWg1S3FEUmZLUkJWWVV6UWxSeWV6cGRjbUZxRm9hQ1oxdDl6SW9MZkw3?=
 =?utf-8?B?N1ltUEhNK0V4MkQzNVc3ZFFuaHhvQitJZTBvQ1gvMFNQZDR2MU9zMkVDQWR3?=
 =?utf-8?B?cUp4SVMzaWlCejM3S3JheWZQekRMVkZCN0J6OE1leWJSVWoxRmNPeHE1aWdP?=
 =?utf-8?B?MjBMTkJ0YVRlSkIzN2lHaEFYdVdpL3Y0QnNwMmI2QW40UnM2ZTBJRXdJSDhN?=
 =?utf-8?B?cWI1V1ZCdDdCcUVOWlVxQldXWXBpcGM4WXBBNXhTYVBUOUt2T2szZm9GTm9u?=
 =?utf-8?B?TmxBU0xodGxzRlJ5czd0Yml3RkdLT2JpcUNBZjJlc2twSHFxZGgwbGU2RkhV?=
 =?utf-8?B?SUVrTkV4YVB5VDY1Qk9MTHc1NUlvUk04bEthU0ZGNHYyL2JubGsvUy9SM2Nt?=
 =?utf-8?B?ME9FRk5nM3ZUcytnQjRRckRTcDdJWU5LRlNQVmEybUJUNW82eTRUdVVCN3Zm?=
 =?utf-8?Q?b+r5fnczuM9BOGOCCr7hwAc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fbe3f9a-804d-44a3-ce35-08d9a9eb2561
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 16:56:06.3253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fDVprxj7nQCpFjX3Ejam/WkffyyXUEH4Ytf85538vJughJNV+hFNb0UKtTaA0jRBYIsdbNGWaIgeM2yD0geBXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2515
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
Cc: matthew.auld@intel.com, tzimmermann@suse.de, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,
I will make this a separate module.

Thanks,
Arun

On 17/11/21 1:33 pm, Christian König wrote:
> I've looked a bit more into this and I think we should just follow 
> Thomas Zimmermann's idea to make this a separate module.
> 
> Otherwise we just have the code around all the time even if it is unused 
> and implementing this should be trivial.
> 
> See how DRM_GEM_CMA_HELPER or DRM_VRAM_HELPER are done in 
> drivers/gpu/drm/Kconfig and then have the desired effect in 
> drivers/gpu/drm/Makefile
> 
> Should be something like ~15 lines of additional configuration which 
> saves a bit of memory on embedded systems which just need a fbdev 
> replacement.
> 
> Thanks,
> Christian.
> 
> Am 16.11.21 um 21:18 schrieb Arunpravin:
>> Move the base i915 buddy allocator code into drm
>> - Move i915_buddy.h to include/drm
>> - Move i915_buddy.c to drm root folder
>> - Rename "i915" string with "drm" string wherever applicable
>> - Rename "I915" string with "DRM" string wherever applicable
>> - Fix header file dependencies
>> - Fix alignment issues
>> - add Makefile support for drm buddy
>> - export functions and write kerneldoc description
>> - Remove i915 selftest config check condition as buddy selftest
>>    will be moved to drm selftest folder
>>
>> cleanup i915 buddy references in i915 driver module
>> and replace with drm buddy
>>
>> v2:
>>    - include header file in alphabetical order (Thomas)
>>    - merged changes listed in the body section into a single patch
>>      to keep the build intact (Christian, Jani)
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/Makefile                      |   2 +-
>>   drivers/gpu/drm/drm_buddy.c                   | 521 ++++++++++++++++++
>>   drivers/gpu/drm/drm_drv.c                     |   3 +
>>   drivers/gpu/drm/i915/Makefile                 |   1 -
>>   drivers/gpu/drm/i915/i915_buddy.c             | 466 ----------------
>>   drivers/gpu/drm/i915/i915_buddy.h             | 143 -----
>>   drivers/gpu/drm/i915/i915_module.c            |   3 -
>>   drivers/gpu/drm/i915/i915_scatterlist.c       |  11 +-
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  33 +-
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   4 +-
>>   include/drm/drm_buddy.h                       | 153 +++++
>>   11 files changed, 702 insertions(+), 638 deletions(-)
>>   create mode 100644 drivers/gpu/drm/drm_buddy.c
>>   delete mode 100644 drivers/gpu/drm/i915/i915_buddy.c
>>   delete mode 100644 drivers/gpu/drm/i915/i915_buddy.h
>>   create mode 100644 include/drm/drm_buddy.h
>>
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 0dff40bb863c..dc61e91a3154 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -18,7 +18,7 @@ drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
>>   		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
>>   		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
>>   		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
>> -		drm_managed.o drm_vblank_work.o
>> +		drm_managed.o drm_vblank_work.o drm_buddy.o
>>   
>>   drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
>>   			    drm_legacy_misc.o drm_lock.o drm_memory.o drm_scatter.o \
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> new file mode 100644
>> index 000000000000..39eb1d224bec
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -0,0 +1,521 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2021 Intel Corporation
>> + */
>> +
>> +#include <linux/kmemleak.h>
>> +#include <linux/sizes.h>
>> +
>> +#include <drm/drm_buddy.h>
>> +
>> +static struct kmem_cache *slab_blocks;
>> +
>> +static struct drm_buddy_block *drm_block_alloc(struct drm_buddy_mm *mm,
>> +					       struct drm_buddy_block *parent,
>> +					       unsigned int order,
>> +					       u64 offset)
>> +{
>> +	struct drm_buddy_block *block;
>> +
>> +	BUG_ON(order > DRM_BUDDY_MAX_ORDER);
>> +
>> +	block = kmem_cache_zalloc(slab_blocks, GFP_KERNEL);
>> +	if (!block)
>> +		return NULL;
>> +
>> +	block->header = offset;
>> +	block->header |= order;
>> +	block->parent = parent;
>> +
>> +	BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
>> +	return block;
>> +}
>> +
>> +static void drm_block_free(struct drm_buddy_mm *mm,
>> +			   struct drm_buddy_block *block)
>> +{
>> +	kmem_cache_free(slab_blocks, block);
>> +}
>> +
>> +static void mark_allocated(struct drm_buddy_block *block)
>> +{
>> +	block->header &= ~DRM_BUDDY_HEADER_STATE;
>> +	block->header |= DRM_BUDDY_ALLOCATED;
>> +
>> +	list_del(&block->link);
>> +}
>> +
>> +static void mark_free(struct drm_buddy_mm *mm,
>> +		      struct drm_buddy_block *block)
>> +{
>> +	block->header &= ~DRM_BUDDY_HEADER_STATE;
>> +	block->header |= DRM_BUDDY_FREE;
>> +
>> +	list_add(&block->link,
>> +		 &mm->free_list[drm_buddy_block_order(block)]);
>> +}
>> +
>> +static void mark_split(struct drm_buddy_block *block)
>> +{
>> +	block->header &= ~DRM_BUDDY_HEADER_STATE;
>> +	block->header |= DRM_BUDDY_SPLIT;
>> +
>> +	list_del(&block->link);
>> +}
>> +
>> +/**
>> + * drm_buddy_init - init memory manager
>> + *
>> + * @mm: DRM buddy manager to initialize
>> + * @size: size in bytes to manage
>> + * @chunk_size: minimum page size in bytes for our allocations
>> + *
>> + * Initializes the memory manager and its resources.
>> + *
>> + * Returns:
>> + * 0 on success, error code on failure.
>> + */
>> +int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size)
>> +{
>> +	unsigned int i;
>> +	u64 offset;
>> +
>> +	if (size < chunk_size)
>> +		return -EINVAL;
>> +
>> +	if (chunk_size < PAGE_SIZE)
>> +		return -EINVAL;
>> +
>> +	if (!is_power_of_2(chunk_size))
>> +		return -EINVAL;
>> +
>> +	size = round_down(size, chunk_size);
>> +
>> +	mm->size = size;
>> +	mm->avail = size;
>> +	mm->chunk_size = chunk_size;
>> +	mm->max_order = ilog2(size) - ilog2(chunk_size);
>> +
>> +	BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
>> +
>> +	mm->free_list = kmalloc_array(mm->max_order + 1,
>> +				      sizeof(struct list_head),
>> +				      GFP_KERNEL);
>> +	if (!mm->free_list)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i <= mm->max_order; ++i)
>> +		INIT_LIST_HEAD(&mm->free_list[i]);
>> +
>> +	mm->n_roots = hweight64(size);
>> +
>> +	mm->roots = kmalloc_array(mm->n_roots,
>> +				  sizeof(struct drm_buddy_block *),
>> +				  GFP_KERNEL);
>> +	if (!mm->roots)
>> +		goto out_free_list;
>> +
>> +	offset = 0;
>> +	i = 0;
>> +
>> +	/*
>> +	 * Split into power-of-two blocks, in case we are given a size that is
>> +	 * not itself a power-of-two.
>> +	 */
>> +	do {
>> +		struct drm_buddy_block *root;
>> +		unsigned int order;
>> +		u64 root_size;
>> +
>> +		root_size = rounddown_pow_of_two(size);
>> +		order = ilog2(root_size) - ilog2(chunk_size);
>> +
>> +		root = drm_block_alloc(mm, NULL, order, offset);
>> +		if (!root)
>> +			goto out_free_roots;
>> +
>> +		mark_free(mm, root);
>> +
>> +		BUG_ON(i > mm->max_order);
>> +		BUG_ON(drm_buddy_block_size(mm, root) < chunk_size);
>> +
>> +		mm->roots[i] = root;
>> +
>> +		offset += root_size;
>> +		size -= root_size;
>> +		i++;
>> +	} while (size);
>> +
>> +	return 0;
>> +
>> +out_free_roots:
>> +	while (i--)
>> +		drm_block_free(mm, mm->roots[i]);
>> +	kfree(mm->roots);
>> +out_free_list:
>> +	kfree(mm->free_list);
>> +	return -ENOMEM;
>> +}
>> +EXPORT_SYMBOL(drm_buddy_init);
>> +
>> +/**
>> + * drm_buddy_fini - tear down the memory manager
>> + *
>> + * @mm: DRM buddy manager to free
>> + *
>> + * Cleanup memory manager resources and the freelist
>> + */
>> +void drm_buddy_fini(struct drm_buddy_mm *mm)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < mm->n_roots; ++i) {
>> +		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
>> +		drm_block_free(mm, mm->roots[i]);
>> +	}
>> +
>> +	WARN_ON(mm->avail != mm->size);
>> +
>> +	kfree(mm->roots);
>> +	kfree(mm->free_list);
>> +}
>> +EXPORT_SYMBOL(drm_buddy_fini);
>> +
>> +static int split_block(struct drm_buddy_mm *mm,
>> +		       struct drm_buddy_block *block)
>> +{
>> +	unsigned int block_order = drm_buddy_block_order(block) - 1;
>> +	u64 offset = drm_buddy_block_offset(block);
>> +
>> +	BUG_ON(!drm_buddy_block_is_free(block));
>> +	BUG_ON(!drm_buddy_block_order(block));
>> +
>> +	block->left = drm_block_alloc(mm, block, block_order, offset);
>> +	if (!block->left)
>> +		return -ENOMEM;
>> +
>> +	block->right = drm_block_alloc(mm, block, block_order,
>> +					offset + (mm->chunk_size << block_order));
>> +	if (!block->right) {
>> +		drm_block_free(mm, block->left);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	mark_free(mm, block->left);
>> +	mark_free(mm, block->right);
>> +
>> +	mark_split(block);
>> +
>> +	return 0;
>> +}
>> +
>> +static struct drm_buddy_block *
>> +get_buddy(struct drm_buddy_block *block)
>> +{
>> +	struct drm_buddy_block *parent;
>> +
>> +	parent = block->parent;
>> +	if (!parent)
>> +		return NULL;
>> +
>> +	if (parent->left == block)
>> +		return parent->right;
>> +
>> +	return parent->left;
>> +}
>> +
>> +static void __drm_buddy_free(struct drm_buddy_mm *mm,
>> +			     struct drm_buddy_block *block)
>> +{
>> +	struct drm_buddy_block *parent;
>> +
>> +	while ((parent = block->parent)) {
>> +		struct drm_buddy_block *buddy;
>> +
>> +		buddy = get_buddy(block);
>> +
>> +		if (!drm_buddy_block_is_free(buddy))
>> +			break;
>> +
>> +		list_del(&buddy->link);
>> +
>> +		drm_block_free(mm, block);
>> +		drm_block_free(mm, buddy);
>> +
>> +		block = parent;
>> +	}
>> +
>> +	mark_free(mm, block);
>> +}
>> +
>> +void drm_buddy_free(struct drm_buddy_mm *mm,
>> +		    struct drm_buddy_block *block)
>> +{
>> +	BUG_ON(!drm_buddy_block_is_allocated(block));
>> +	mm->avail += drm_buddy_block_size(mm, block);
>> +	__drm_buddy_free(mm, block);
>> +}
>> +
>> +/**
>> + * drm_buddy_free_list - free blocks
>> + *
>> + * @mm: DRM buddy manager
>> + * @objects: input list head to free blocks
>> + */
>> +void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects)
>> +{
>> +	struct drm_buddy_block *block, *on;
>> +
>> +	list_for_each_entry_safe(block, on, objects, link) {
>> +		drm_buddy_free(mm, block);
>> +		cond_resched();
>> +	}
>> +	INIT_LIST_HEAD(objects);
>> +}
>> +EXPORT_SYMBOL(drm_buddy_free_list);
>> +
>> +/**
>> + * drm_buddy_alloc - allocate power-of-two blocks
>> + *
>> + * @mm: DRM buddy manager to allocate from
>> + * @order: size of the allocation
>> + *
>> + * The order value here translates to:
>> + *
>> + * 0 = 2^0 * mm->chunk_size
>> + * 1 = 2^1 * mm->chunk_size
>> + * 2 = 2^2 * mm->chunk_size
>> + *
>> + * Returns:
>> + * allocated ptr to the &drm_buddy_block on success
>> + */
>> +struct drm_buddy_block *
>> +drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order)
>> +{
>> +	struct drm_buddy_block *block = NULL;
>> +	unsigned int i;
>> +	int err;
>> +
>> +	for (i = order; i <= mm->max_order; ++i) {
>> +		block = list_first_entry_or_null(&mm->free_list[i],
>> +						 struct drm_buddy_block,
>> +						 link);
>> +		if (block)
>> +			break;
>> +	}
>> +
>> +	if (!block)
>> +		return ERR_PTR(-ENOSPC);
>> +
>> +	BUG_ON(!drm_buddy_block_is_free(block));
>> +
>> +	while (i != order) {
>> +		err = split_block(mm, block);
>> +		if (unlikely(err))
>> +			goto out_free;
>> +
>> +		/* Go low */
>> +		block = block->left;
>> +		i--;
>> +	}
>> +
>> +	mark_allocated(block);
>> +	mm->avail -= drm_buddy_block_size(mm, block);
>> +	kmemleak_update_trace(block);
>> +	return block;
>> +
>> +out_free:
>> +	if (i != order)
>> +		__drm_buddy_free(mm, block);
>> +	return ERR_PTR(err);
>> +}
>> +EXPORT_SYMBOL(drm_buddy_alloc);
>> +
>> +static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
>> +{
>> +	return s1 <= e2 && e1 >= s2;
>> +}
>> +
>> +static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>> +{
>> +	return s1 <= s2 && e1 >= e2;
>> +}
>> +
>> +/**
>> + * drm_buddy_alloc_range - allocate range
>> + *
>> + * @mm: DRM buddy manager to allocate from
>> + * @blocks: output list head to add allocated blocks
>> + * @start: start of the allowed range for this block
>> + * @size: size of the allocation
>> + *
>> + * Intended for pre-allocating portions of the address space, for example to
>> + * reserve a block for the initial framebuffer or similar, hence the expectation
>> + * here is that drm_buddy_alloc() is still the main vehicle for
>> + * allocations, so if that's not the case then the drm_mm range allocator is
>> + * probably a much better fit, and so you should probably go use that instead.
>> + *
>> + * Note that it's safe to chain together multiple alloc_ranges
>> + * with the same blocks list
>> + *
>> + * Returns:
>> + * 0 on success, error code on failure.
>> + */
>> +int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>> +			  struct list_head *blocks,
>> +			  u64 start, u64 size)
>> +{
>> +	struct drm_buddy_block *block;
>> +	struct drm_buddy_block *buddy;
>> +	LIST_HEAD(allocated);
>> +	LIST_HEAD(dfs);
>> +	u64 end;
>> +	int err;
>> +	int i;
>> +
>> +	if (size < mm->chunk_size)
>> +		return -EINVAL;
>> +
>> +	if (!IS_ALIGNED(size | start, mm->chunk_size))
>> +		return -EINVAL;
>> +
>> +	if (range_overflows(start, size, mm->size))
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < mm->n_roots; ++i)
>> +		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>> +
>> +	end = start + size - 1;
>> +
>> +	do {
>> +		u64 block_start;
>> +		u64 block_end;
>> +
>> +		block = list_first_entry_or_null(&dfs,
>> +						 struct drm_buddy_block,
>> +						 tmp_link);
>> +		if (!block)
>> +			break;
>> +
>> +		list_del(&block->tmp_link);
>> +
>> +		block_start = drm_buddy_block_offset(block);
>> +		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
>> +
>> +		if (!overlaps(start, end, block_start, block_end))
>> +			continue;
>> +
>> +		if (drm_buddy_block_is_allocated(block)) {
>> +			err = -ENOSPC;
>> +			goto err_free;
>> +		}
>> +
>> +		if (contains(start, end, block_start, block_end)) {
>> +			if (!drm_buddy_block_is_free(block)) {
>> +				err = -ENOSPC;
>> +				goto err_free;
>> +			}
>> +
>> +			mark_allocated(block);
>> +			mm->avail -= drm_buddy_block_size(mm, block);
>> +			list_add_tail(&block->link, &allocated);
>> +			continue;
>> +		}
>> +
>> +		if (!drm_buddy_block_is_split(block)) {
>> +			err = split_block(mm, block);
>> +			if (unlikely(err))
>> +				goto err_undo;
>> +		}
>> +
>> +		list_add(&block->right->tmp_link, &dfs);
>> +		list_add(&block->left->tmp_link, &dfs);
>> +	} while (1);
>> +
>> +	list_splice_tail(&allocated, blocks);
>> +	return 0;
>> +
>> +err_undo:
>> +	/*
>> +	 * We really don't want to leave around a bunch of split blocks, since
>> +	 * bigger is better, so make sure we merge everything back before we
>> +	 * free the allocated blocks.
>> +	 */
>> +	buddy = get_buddy(block);
>> +	if (buddy &&
>> +	    (drm_buddy_block_is_free(block) &&
>> +	     drm_buddy_block_is_free(buddy)))
>> +		__drm_buddy_free(mm, block);
>> +
>> +err_free:
>> +	drm_buddy_free_list(mm, &allocated);
>> +	return err;
>> +}
>> +EXPORT_SYMBOL(drm_buddy_alloc_range);
>> +
>> +/**
>> + * drm_buddy_block_print - print block information
>> + *
>> + * @mm: DRM buddy manager
>> + * @block: DRM buddy block
>> + * @p: DRM printer to use
>> + */
>> +void drm_buddy_block_print(struct drm_buddy_mm *mm,
>> +			   struct drm_buddy_block *block,
>> +			   struct drm_printer *p)
>> +{
>> +	u64 start = drm_buddy_block_offset(block);
>> +	u64 size = drm_buddy_block_size(mm, block);
>> +
>> +	drm_printf(p, "%#018llx-%#018llx: %llu\n", start, start + size, size);
>> +}
>> +EXPORT_SYMBOL(drm_buddy_block_print);
>> +
>> +/**
>> + * drm_buddy_print - print allocator state
>> + *
>> + * @mm: DRM buddy manager
>> + * @p: DRM printer to use
>> + */
>> +void drm_buddy_print(struct drm_buddy_mm *mm, struct drm_printer *p)
>> +{
>> +	int order;
>> +
>> +	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB\n",
>> +		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20);
>> +
>> +	for (order = mm->max_order; order >= 0; order--) {
>> +		struct drm_buddy_block *block;
>> +		u64 count = 0, free;
>> +
>> +		list_for_each_entry(block, &mm->free_list[order], link) {
>> +			BUG_ON(!drm_buddy_block_is_free(block));
>> +			count++;
>> +		}
>> +
>> +		drm_printf(p, "order-%d ", order);
>> +
>> +		free = count * (mm->chunk_size << order);
>> +		if (free < SZ_1M)
>> +			drm_printf(p, "free: %lluKiB", free >> 10);
>> +		else
>> +			drm_printf(p, "free: %lluMiB", free >> 20);
>> +
>> +		drm_printf(p, ", pages: %llu\n", count);
>> +	}
>> +}
>> +EXPORT_SYMBOL(drm_buddy_print);
>> +
>> +void drm_buddy_module_exit(void)
>> +{
>> +	kmem_cache_destroy(slab_blocks);
>> +}
>> +
>> +int __init drm_buddy_module_init(void)
>> +{
>> +	slab_blocks = KMEM_CACHE(drm_buddy_block, 0);
>> +	if (!slab_blocks)
>> +		return -ENOMEM;
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 7a5097467ba5..5d5e46e60586 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -35,6 +35,7 @@
>>   #include <linux/slab.h>
>>   #include <linux/srcu.h>
>>   
>> +#include <drm/drm_buddy.h>
>>   #include <drm/drm_cache.h>
>>   #include <drm/drm_client.h>
>>   #include <drm/drm_color_mgmt.h>
>> @@ -1034,6 +1035,7 @@ static void drm_core_exit(void)
>>   	drm_sysfs_destroy();
>>   	idr_destroy(&drm_minors_idr);
>>   	drm_connector_ida_destroy();
>> +	drm_buddy_module_exit();
>>   }
>>   
>>   static int __init drm_core_init(void)
>> @@ -1043,6 +1045,7 @@ static int __init drm_core_init(void)
>>   	drm_connector_ida_init();
>>   	idr_init(&drm_minors_idr);
>>   	drm_memcpy_init_early();
>> +	drm_buddy_module_init();
>>   
>>   	ret = drm_sysfs_init();
>>   	if (ret < 0) {
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index 467872cca027..fc5ca8c4ccb2 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -161,7 +161,6 @@ gem-y += \
>>   i915-y += \
>>   	  $(gem-y) \
>>   	  i915_active.o \
>> -	  i915_buddy.o \
>>   	  i915_cmd_parser.o \
>>   	  i915_gem_evict.o \
>>   	  i915_gem_gtt.o \
>> diff --git a/drivers/gpu/drm/i915/i915_buddy.c b/drivers/gpu/drm/i915/i915_buddy.c
>> deleted file mode 100644
>> index 6e2ad68f8f3f..000000000000
>> --- a/drivers/gpu/drm/i915/i915_buddy.c
>> +++ /dev/null
>> @@ -1,466 +0,0 @@
>> -// SPDX-License-Identifier: MIT
>> -/*
>> - * Copyright © 2021 Intel Corporation
>> - */
>> -
>> -#include <linux/kmemleak.h>
>> -#include <linux/sizes.h>
>> -
>> -#include "i915_buddy.h"
>> -
>> -#include "i915_gem.h"
>> -#include "i915_utils.h"
>> -
>> -static struct kmem_cache *slab_blocks;
>> -
>> -static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
>> -						 struct i915_buddy_block *parent,
>> -						 unsigned int order,
>> -						 u64 offset)
>> -{
>> -	struct i915_buddy_block *block;
>> -
>> -	GEM_BUG_ON(order > I915_BUDDY_MAX_ORDER);
>> -
>> -	block = kmem_cache_zalloc(slab_blocks, GFP_KERNEL);
>> -	if (!block)
>> -		return NULL;
>> -
>> -	block->header = offset;
>> -	block->header |= order;
>> -	block->parent = parent;
>> -
>> -	GEM_BUG_ON(block->header & I915_BUDDY_HEADER_UNUSED);
>> -	return block;
>> -}
>> -
>> -static void i915_block_free(struct i915_buddy_mm *mm,
>> -			    struct i915_buddy_block *block)
>> -{
>> -	kmem_cache_free(slab_blocks, block);
>> -}
>> -
>> -static void mark_allocated(struct i915_buddy_block *block)
>> -{
>> -	block->header &= ~I915_BUDDY_HEADER_STATE;
>> -	block->header |= I915_BUDDY_ALLOCATED;
>> -
>> -	list_del(&block->link);
>> -}
>> -
>> -static void mark_free(struct i915_buddy_mm *mm,
>> -		      struct i915_buddy_block *block)
>> -{
>> -	block->header &= ~I915_BUDDY_HEADER_STATE;
>> -	block->header |= I915_BUDDY_FREE;
>> -
>> -	list_add(&block->link,
>> -		 &mm->free_list[i915_buddy_block_order(block)]);
>> -}
>> -
>> -static void mark_split(struct i915_buddy_block *block)
>> -{
>> -	block->header &= ~I915_BUDDY_HEADER_STATE;
>> -	block->header |= I915_BUDDY_SPLIT;
>> -
>> -	list_del(&block->link);
>> -}
>> -
>> -int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
>> -{
>> -	unsigned int i;
>> -	u64 offset;
>> -
>> -	if (size < chunk_size)
>> -		return -EINVAL;
>> -
>> -	if (chunk_size < PAGE_SIZE)
>> -		return -EINVAL;
>> -
>> -	if (!is_power_of_2(chunk_size))
>> -		return -EINVAL;
>> -
>> -	size = round_down(size, chunk_size);
>> -
>> -	mm->size = size;
>> -	mm->avail = size;
>> -	mm->chunk_size = chunk_size;
>> -	mm->max_order = ilog2(size) - ilog2(chunk_size);
>> -
>> -	GEM_BUG_ON(mm->max_order > I915_BUDDY_MAX_ORDER);
>> -
>> -	mm->free_list = kmalloc_array(mm->max_order + 1,
>> -				      sizeof(struct list_head),
>> -				      GFP_KERNEL);
>> -	if (!mm->free_list)
>> -		return -ENOMEM;
>> -
>> -	for (i = 0; i <= mm->max_order; ++i)
>> -		INIT_LIST_HEAD(&mm->free_list[i]);
>> -
>> -	mm->n_roots = hweight64(size);
>> -
>> -	mm->roots = kmalloc_array(mm->n_roots,
>> -				  sizeof(struct i915_buddy_block *),
>> -				  GFP_KERNEL);
>> -	if (!mm->roots)
>> -		goto out_free_list;
>> -
>> -	offset = 0;
>> -	i = 0;
>> -
>> -	/*
>> -	 * Split into power-of-two blocks, in case we are given a size that is
>> -	 * not itself a power-of-two.
>> -	 */
>> -	do {
>> -		struct i915_buddy_block *root;
>> -		unsigned int order;
>> -		u64 root_size;
>> -
>> -		root_size = rounddown_pow_of_two(size);
>> -		order = ilog2(root_size) - ilog2(chunk_size);
>> -
>> -		root = i915_block_alloc(mm, NULL, order, offset);
>> -		if (!root)
>> -			goto out_free_roots;
>> -
>> -		mark_free(mm, root);
>> -
>> -		GEM_BUG_ON(i > mm->max_order);
>> -		GEM_BUG_ON(i915_buddy_block_size(mm, root) < chunk_size);
>> -
>> -		mm->roots[i] = root;
>> -
>> -		offset += root_size;
>> -		size -= root_size;
>> -		i++;
>> -	} while (size);
>> -
>> -	return 0;
>> -
>> -out_free_roots:
>> -	while (i--)
>> -		i915_block_free(mm, mm->roots[i]);
>> -	kfree(mm->roots);
>> -out_free_list:
>> -	kfree(mm->free_list);
>> -	return -ENOMEM;
>> -}
>> -
>> -void i915_buddy_fini(struct i915_buddy_mm *mm)
>> -{
>> -	int i;
>> -
>> -	for (i = 0; i < mm->n_roots; ++i) {
>> -		GEM_WARN_ON(!i915_buddy_block_is_free(mm->roots[i]));
>> -		i915_block_free(mm, mm->roots[i]);
>> -	}
>> -
>> -	GEM_WARN_ON(mm->avail != mm->size);
>> -
>> -	kfree(mm->roots);
>> -	kfree(mm->free_list);
>> -}
>> -
>> -static int split_block(struct i915_buddy_mm *mm,
>> -		       struct i915_buddy_block *block)
>> -{
>> -	unsigned int block_order = i915_buddy_block_order(block) - 1;
>> -	u64 offset = i915_buddy_block_offset(block);
>> -
>> -	GEM_BUG_ON(!i915_buddy_block_is_free(block));
>> -	GEM_BUG_ON(!i915_buddy_block_order(block));
>> -
>> -	block->left = i915_block_alloc(mm, block, block_order, offset);
>> -	if (!block->left)
>> -		return -ENOMEM;
>> -
>> -	block->right = i915_block_alloc(mm, block, block_order,
>> -					offset + (mm->chunk_size << block_order));
>> -	if (!block->right) {
>> -		i915_block_free(mm, block->left);
>> -		return -ENOMEM;
>> -	}
>> -
>> -	mark_free(mm, block->left);
>> -	mark_free(mm, block->right);
>> -
>> -	mark_split(block);
>> -
>> -	return 0;
>> -}
>> -
>> -static struct i915_buddy_block *
>> -get_buddy(struct i915_buddy_block *block)
>> -{
>> -	struct i915_buddy_block *parent;
>> -
>> -	parent = block->parent;
>> -	if (!parent)
>> -		return NULL;
>> -
>> -	if (parent->left == block)
>> -		return parent->right;
>> -
>> -	return parent->left;
>> -}
>> -
>> -static void __i915_buddy_free(struct i915_buddy_mm *mm,
>> -			      struct i915_buddy_block *block)
>> -{
>> -	struct i915_buddy_block *parent;
>> -
>> -	while ((parent = block->parent)) {
>> -		struct i915_buddy_block *buddy;
>> -
>> -		buddy = get_buddy(block);
>> -
>> -		if (!i915_buddy_block_is_free(buddy))
>> -			break;
>> -
>> -		list_del(&buddy->link);
>> -
>> -		i915_block_free(mm, block);
>> -		i915_block_free(mm, buddy);
>> -
>> -		block = parent;
>> -	}
>> -
>> -	mark_free(mm, block);
>> -}
>> -
>> -void i915_buddy_free(struct i915_buddy_mm *mm,
>> -		     struct i915_buddy_block *block)
>> -{
>> -	GEM_BUG_ON(!i915_buddy_block_is_allocated(block));
>> -	mm->avail += i915_buddy_block_size(mm, block);
>> -	__i915_buddy_free(mm, block);
>> -}
>> -
>> -void i915_buddy_free_list(struct i915_buddy_mm *mm, struct list_head *objects)
>> -{
>> -	struct i915_buddy_block *block, *on;
>> -
>> -	list_for_each_entry_safe(block, on, objects, link) {
>> -		i915_buddy_free(mm, block);
>> -		cond_resched();
>> -	}
>> -	INIT_LIST_HEAD(objects);
>> -}
>> -
>> -/*
>> - * Allocate power-of-two block. The order value here translates to:
>> - *
>> - *   0 = 2^0 * mm->chunk_size
>> - *   1 = 2^1 * mm->chunk_size
>> - *   2 = 2^2 * mm->chunk_size
>> - *   ...
>> - */
>> -struct i915_buddy_block *
>> -i915_buddy_alloc(struct i915_buddy_mm *mm, unsigned int order)
>> -{
>> -	struct i915_buddy_block *block = NULL;
>> -	unsigned int i;
>> -	int err;
>> -
>> -	for (i = order; i <= mm->max_order; ++i) {
>> -		block = list_first_entry_or_null(&mm->free_list[i],
>> -						 struct i915_buddy_block,
>> -						 link);
>> -		if (block)
>> -			break;
>> -	}
>> -
>> -	if (!block)
>> -		return ERR_PTR(-ENOSPC);
>> -
>> -	GEM_BUG_ON(!i915_buddy_block_is_free(block));
>> -
>> -	while (i != order) {
>> -		err = split_block(mm, block);
>> -		if (unlikely(err))
>> -			goto out_free;
>> -
>> -		/* Go low */
>> -		block = block->left;
>> -		i--;
>> -	}
>> -
>> -	mark_allocated(block);
>> -	mm->avail -= i915_buddy_block_size(mm, block);
>> -	kmemleak_update_trace(block);
>> -	return block;
>> -
>> -out_free:
>> -	if (i != order)
>> -		__i915_buddy_free(mm, block);
>> -	return ERR_PTR(err);
>> -}
>> -
>> -static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
>> -{
>> -	return s1 <= e2 && e1 >= s2;
>> -}
>> -
>> -static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>> -{
>> -	return s1 <= s2 && e1 >= e2;
>> -}
>> -
>> -/*
>> - * Allocate range. Note that it's safe to chain together multiple alloc_ranges
>> - * with the same blocks list.
>> - *
>> - * Intended for pre-allocating portions of the address space, for example to
>> - * reserve a block for the initial framebuffer or similar, hence the expectation
>> - * here is that i915_buddy_alloc() is still the main vehicle for
>> - * allocations, so if that's not the case then the drm_mm range allocator is
>> - * probably a much better fit, and so you should probably go use that instead.
>> - */
>> -int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
>> -			   struct list_head *blocks,
>> -			   u64 start, u64 size)
>> -{
>> -	struct i915_buddy_block *block;
>> -	struct i915_buddy_block *buddy;
>> -	LIST_HEAD(allocated);
>> -	LIST_HEAD(dfs);
>> -	u64 end;
>> -	int err;
>> -	int i;
>> -
>> -	if (size < mm->chunk_size)
>> -		return -EINVAL;
>> -
>> -	if (!IS_ALIGNED(size | start, mm->chunk_size))
>> -		return -EINVAL;
>> -
>> -	if (range_overflows(start, size, mm->size))
>> -		return -EINVAL;
>> -
>> -	for (i = 0; i < mm->n_roots; ++i)
>> -		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>> -
>> -	end = start + size - 1;
>> -
>> -	do {
>> -		u64 block_start;
>> -		u64 block_end;
>> -
>> -		block = list_first_entry_or_null(&dfs,
>> -						 struct i915_buddy_block,
>> -						 tmp_link);
>> -		if (!block)
>> -			break;
>> -
>> -		list_del(&block->tmp_link);
>> -
>> -		block_start = i915_buddy_block_offset(block);
>> -		block_end = block_start + i915_buddy_block_size(mm, block) - 1;
>> -
>> -		if (!overlaps(start, end, block_start, block_end))
>> -			continue;
>> -
>> -		if (i915_buddy_block_is_allocated(block)) {
>> -			err = -ENOSPC;
>> -			goto err_free;
>> -		}
>> -
>> -		if (contains(start, end, block_start, block_end)) {
>> -			if (!i915_buddy_block_is_free(block)) {
>> -				err = -ENOSPC;
>> -				goto err_free;
>> -			}
>> -
>> -			mark_allocated(block);
>> -			mm->avail -= i915_buddy_block_size(mm, block);
>> -			list_add_tail(&block->link, &allocated);
>> -			continue;
>> -		}
>> -
>> -		if (!i915_buddy_block_is_split(block)) {
>> -			err = split_block(mm, block);
>> -			if (unlikely(err))
>> -				goto err_undo;
>> -		}
>> -
>> -		list_add(&block->right->tmp_link, &dfs);
>> -		list_add(&block->left->tmp_link, &dfs);
>> -	} while (1);
>> -
>> -	list_splice_tail(&allocated, blocks);
>> -	return 0;
>> -
>> -err_undo:
>> -	/*
>> -	 * We really don't want to leave around a bunch of split blocks, since
>> -	 * bigger is better, so make sure we merge everything back before we
>> -	 * free the allocated blocks.
>> -	 */
>> -	buddy = get_buddy(block);
>> -	if (buddy &&
>> -	    (i915_buddy_block_is_free(block) &&
>> -	     i915_buddy_block_is_free(buddy)))
>> -		__i915_buddy_free(mm, block);
>> -
>> -err_free:
>> -	i915_buddy_free_list(mm, &allocated);
>> -	return err;
>> -}
>> -
>> -void i915_buddy_block_print(struct i915_buddy_mm *mm,
>> -			    struct i915_buddy_block *block,
>> -			    struct drm_printer *p)
>> -{
>> -	u64 start = i915_buddy_block_offset(block);
>> -	u64 size = i915_buddy_block_size(mm, block);
>> -
>> -	drm_printf(p, "%#018llx-%#018llx: %llu\n", start, start + size, size);
>> -}
>> -
>> -void i915_buddy_print(struct i915_buddy_mm *mm, struct drm_printer *p)
>> -{
>> -	int order;
>> -
>> -	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB\n",
>> -		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20);
>> -
>> -	for (order = mm->max_order; order >= 0; order--) {
>> -		struct i915_buddy_block *block;
>> -		u64 count = 0, free;
>> -
>> -		list_for_each_entry(block, &mm->free_list[order], link) {
>> -			GEM_BUG_ON(!i915_buddy_block_is_free(block));
>> -			count++;
>> -		}
>> -
>> -		drm_printf(p, "order-%d ", order);
>> -
>> -		free = count * (mm->chunk_size << order);
>> -		if (free < SZ_1M)
>> -			drm_printf(p, "free: %lluKiB", free >> 10);
>> -		else
>> -			drm_printf(p, "free: %lluMiB", free >> 20);
>> -
>> -		drm_printf(p, ", pages: %llu\n", count);
>> -	}
>> -}
>> -
>> -#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>> -#include "selftests/i915_buddy.c"
>> -#endif
>> -
>> -void i915_buddy_module_exit(void)
>> -{
>> -	kmem_cache_destroy(slab_blocks);
>> -}
>> -
>> -int __init i915_buddy_module_init(void)
>> -{
>> -	slab_blocks = KMEM_CACHE(i915_buddy_block, 0);
>> -	if (!slab_blocks)
>> -		return -ENOMEM;
>> -
>> -	return 0;
>> -}
>> diff --git a/drivers/gpu/drm/i915/i915_buddy.h b/drivers/gpu/drm/i915/i915_buddy.h
>> deleted file mode 100644
>> index 7077742112ac..000000000000
>> --- a/drivers/gpu/drm/i915/i915_buddy.h
>> +++ /dev/null
>> @@ -1,143 +0,0 @@
>> -/* SPDX-License-Identifier: MIT */
>> -/*
>> - * Copyright © 2021 Intel Corporation
>> - */
>> -
>> -#ifndef __I915_BUDDY_H__
>> -#define __I915_BUDDY_H__
>> -
>> -#include <linux/bitops.h>
>> -#include <linux/list.h>
>> -#include <linux/slab.h>
>> -
>> -#include <drm/drm_print.h>
>> -
>> -struct i915_buddy_block {
>> -#define I915_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>> -#define I915_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
>> -#define   I915_BUDDY_ALLOCATED	   (1 << 10)
>> -#define   I915_BUDDY_FREE	   (2 << 10)
>> -#define   I915_BUDDY_SPLIT	   (3 << 10)
>> -/* Free to be used, if needed in the future */
>> -#define I915_BUDDY_HEADER_UNUSED GENMASK_ULL(9, 6)
>> -#define I915_BUDDY_HEADER_ORDER  GENMASK_ULL(5, 0)
>> -	u64 header;
>> -
>> -	struct i915_buddy_block *left;
>> -	struct i915_buddy_block *right;
>> -	struct i915_buddy_block *parent;
>> -
>> -	void *private; /* owned by creator */
>> -
>> -	/*
>> -	 * While the block is allocated by the user through i915_buddy_alloc*,
>> -	 * the user has ownership of the link, for example to maintain within
>> -	 * a list, if so desired. As soon as the block is freed with
>> -	 * i915_buddy_free* ownership is given back to the mm.
>> -	 */
>> -	struct list_head link;
>> -	struct list_head tmp_link;
>> -};
>> -
>> -/* Order-zero must be at least PAGE_SIZE */
>> -#define I915_BUDDY_MAX_ORDER (63 - PAGE_SHIFT)
>> -
>> -/*
>> - * Binary Buddy System.
>> - *
>> - * Locking should be handled by the user, a simple mutex around
>> - * i915_buddy_alloc* and i915_buddy_free* should suffice.
>> - */
>> -struct i915_buddy_mm {
>> -	/* Maintain a free list for each order. */
>> -	struct list_head *free_list;
>> -
>> -	/*
>> -	 * Maintain explicit binary tree(s) to track the allocation of the
>> -	 * address space. This gives us a simple way of finding a buddy block
>> -	 * and performing the potentially recursive merge step when freeing a
>> -	 * block.  Nodes are either allocated or free, in which case they will
>> -	 * also exist on the respective free list.
>> -	 */
>> -	struct i915_buddy_block **roots;
>> -
>> -	/*
>> -	 * Anything from here is public, and remains static for the lifetime of
>> -	 * the mm. Everything above is considered do-not-touch.
>> -	 */
>> -	unsigned int n_roots;
>> -	unsigned int max_order;
>> -
>> -	/* Must be at least PAGE_SIZE */
>> -	u64 chunk_size;
>> -	u64 size;
>> -	u64 avail;
>> -};
>> -
>> -static inline u64
>> -i915_buddy_block_offset(struct i915_buddy_block *block)
>> -{
>> -	return block->header & I915_BUDDY_HEADER_OFFSET;
>> -}
>> -
>> -static inline unsigned int
>> -i915_buddy_block_order(struct i915_buddy_block *block)
>> -{
>> -	return block->header & I915_BUDDY_HEADER_ORDER;
>> -}
>> -
>> -static inline unsigned int
>> -i915_buddy_block_state(struct i915_buddy_block *block)
>> -{
>> -	return block->header & I915_BUDDY_HEADER_STATE;
>> -}
>> -
>> -static inline bool
>> -i915_buddy_block_is_allocated(struct i915_buddy_block *block)
>> -{
>> -	return i915_buddy_block_state(block) == I915_BUDDY_ALLOCATED;
>> -}
>> -
>> -static inline bool
>> -i915_buddy_block_is_free(struct i915_buddy_block *block)
>> -{
>> -	return i915_buddy_block_state(block) == I915_BUDDY_FREE;
>> -}
>> -
>> -static inline bool
>> -i915_buddy_block_is_split(struct i915_buddy_block *block)
>> -{
>> -	return i915_buddy_block_state(block) == I915_BUDDY_SPLIT;
>> -}
>> -
>> -static inline u64
>> -i915_buddy_block_size(struct i915_buddy_mm *mm,
>> -		      struct i915_buddy_block *block)
>> -{
>> -	return mm->chunk_size << i915_buddy_block_order(block);
>> -}
>> -
>> -int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size);
>> -
>> -void i915_buddy_fini(struct i915_buddy_mm *mm);
>> -
>> -struct i915_buddy_block *
>> -i915_buddy_alloc(struct i915_buddy_mm *mm, unsigned int order);
>> -
>> -int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
>> -			   struct list_head *blocks,
>> -			   u64 start, u64 size);
>> -
>> -void i915_buddy_free(struct i915_buddy_mm *mm, struct i915_buddy_block *block);
>> -
>> -void i915_buddy_free_list(struct i915_buddy_mm *mm, struct list_head *objects);
>> -
>> -void i915_buddy_print(struct i915_buddy_mm *mm, struct drm_printer *p);
>> -void i915_buddy_block_print(struct i915_buddy_mm *mm,
>> -			    struct i915_buddy_block *block,
>> -			    struct drm_printer *p);
>> -
>> -void i915_buddy_module_exit(void);
>> -int i915_buddy_module_init(void);
>> -
>> -#endif
>> diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
>> index c7507266aa83..355681dbd7a8 100644
>> --- a/drivers/gpu/drm/i915/i915_module.c
>> +++ b/drivers/gpu/drm/i915/i915_module.c
>> @@ -9,7 +9,6 @@
>>   #include "gem/i915_gem_context.h"
>>   #include "gem/i915_gem_object.h"
>>   #include "i915_active.h"
>> -#include "i915_buddy.h"
>>   #include "i915_params.h"
>>   #include "i915_pci.h"
>>   #include "i915_perf.h"
>> @@ -50,8 +49,6 @@ static const struct {
>>   	{ .init = i915_check_nomodeset },
>>   	{ .init = i915_active_module_init,
>>   	  .exit = i915_active_module_exit },
>> -	{ .init = i915_buddy_module_init,
>> -	  .exit = i915_buddy_module_exit },
>>   	{ .init = i915_context_module_init,
>>   	  .exit = i915_context_module_exit },
>>   	{ .init = i915_gem_context_module_init,
>> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
>> index 4a6712dca838..84d622aa32d2 100644
>> --- a/drivers/gpu/drm/i915/i915_scatterlist.c
>> +++ b/drivers/gpu/drm/i915/i915_scatterlist.c
>> @@ -5,10 +5,9 @@
>>    */
>>   
>>   #include "i915_scatterlist.h"
>> -
>> -#include "i915_buddy.h"
>>   #include "i915_ttm_buddy_manager.h"
>>   
>> +#include <drm/drm_buddy.h>
>>   #include <drm/drm_mm.h>
>>   
>>   #include <linux/slab.h>
>> @@ -126,9 +125,9 @@ struct sg_table *i915_sg_from_buddy_resource(struct ttm_resource *res,
>>   	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
>>   	const u64 size = res->num_pages << PAGE_SHIFT;
>>   	const u64 max_segment = rounddown(UINT_MAX, PAGE_SIZE);
>> -	struct i915_buddy_mm *mm = bman_res->mm;
>> +	struct drm_buddy_mm *mm = bman_res->mm;
>>   	struct list_head *blocks = &bman_res->blocks;
>> -	struct i915_buddy_block *block;
>> +	struct drm_buddy_block *block;
>>   	struct scatterlist *sg;
>>   	struct sg_table *st;
>>   	resource_size_t prev_end;
>> @@ -151,8 +150,8 @@ struct sg_table *i915_sg_from_buddy_resource(struct ttm_resource *res,
>>   	list_for_each_entry(block, blocks, link) {
>>   		u64 block_size, offset;
>>   
>> -		block_size = min_t(u64, size, i915_buddy_block_size(mm, block));
>> -		offset = i915_buddy_block_offset(block);
>> +		block_size = min_t(u64, size, drm_buddy_block_size(mm, block));
>> +		offset = drm_buddy_block_offset(block);
>>   
>>   		while (block_size) {
>>   			u64 len;
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> index d59fbb019032..c4b70cb8c248 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> @@ -8,14 +8,15 @@
>>   #include <drm/ttm/ttm_bo_driver.h>
>>   #include <drm/ttm/ttm_placement.h>
>>   
>> +#include <drm/drm_buddy.h>
>> +
>>   #include "i915_ttm_buddy_manager.h"
>>   
>> -#include "i915_buddy.h"
>>   #include "i915_gem.h"
>>   
>>   struct i915_ttm_buddy_manager {
>>   	struct ttm_resource_manager manager;
>> -	struct i915_buddy_mm mm;
>> +	struct drm_buddy_mm mm;
>>   	struct list_head reserved;
>>   	struct mutex lock;
>>   	u64 default_page_size;
>> @@ -34,7 +35,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   {
>>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>   	struct i915_ttm_buddy_resource *bman_res;
>> -	struct i915_buddy_mm *mm = &bman->mm;
>> +	struct drm_buddy_mm *mm = &bman->mm;
>>   	unsigned long n_pages;
>>   	unsigned int min_order;
>>   	u64 min_page_size;
>> @@ -73,7 +74,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   	n_pages = size >> ilog2(mm->chunk_size);
>>   
>>   	do {
>> -		struct i915_buddy_block *block;
>> +		struct drm_buddy_block *block;
>>   		unsigned int order;
>>   
>>   		order = fls(n_pages) - 1;
>> @@ -82,7 +83,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   
>>   		do {
>>   			mutex_lock(&bman->lock);
>> -			block = i915_buddy_alloc(mm, order);
>> +			block = drm_buddy_alloc(mm, order);
>>   			mutex_unlock(&bman->lock);
>>   			if (!IS_ERR(block))
>>   				break;
>> @@ -106,7 +107,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   
>>   err_free_blocks:
>>   	mutex_lock(&bman->lock);
>> -	i915_buddy_free_list(mm, &bman_res->blocks);
>> +	drm_buddy_free_list(mm, &bman_res->blocks);
>>   	mutex_unlock(&bman->lock);
>>   err_free_res:
>>   	kfree(bman_res);
>> @@ -120,7 +121,7 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
>>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>   
>>   	mutex_lock(&bman->lock);
>> -	i915_buddy_free_list(&bman->mm, &bman_res->blocks);
>> +	drm_buddy_free_list(&bman->mm, &bman_res->blocks);
>>   	mutex_unlock(&bman->lock);
>>   
>>   	kfree(bman_res);
>> @@ -130,17 +131,17 @@ static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
>>   				     struct drm_printer *printer)
>>   {
>>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>> -	struct i915_buddy_block *block;
>> +	struct drm_buddy_block *block;
>>   
>>   	mutex_lock(&bman->lock);
>>   	drm_printf(printer, "default_page_size: %lluKiB\n",
>>   		   bman->default_page_size >> 10);
>>   
>> -	i915_buddy_print(&bman->mm, printer);
>> +	drm_buddy_print(&bman->mm, printer);
>>   
>>   	drm_printf(printer, "reserved:\n");
>>   	list_for_each_entry(block, &bman->reserved, link)
>> -		i915_buddy_block_print(&bman->mm, block, printer);
>> +		drm_buddy_block_print(&bman->mm, block, printer);
>>   	mutex_unlock(&bman->lock);
>>   }
>>   
>> @@ -190,7 +191,7 @@ int i915_ttm_buddy_man_init(struct ttm_device *bdev,
>>   	if (!bman)
>>   		return -ENOMEM;
>>   
>> -	err = i915_buddy_init(&bman->mm, size, chunk_size);
>> +	err = drm_buddy_init(&bman->mm, size, chunk_size);
>>   	if (err)
>>   		goto err_free_bman;
>>   
>> @@ -228,7 +229,7 @@ int i915_ttm_buddy_man_fini(struct ttm_device *bdev, unsigned int type)
>>   {
>>   	struct ttm_resource_manager *man = ttm_manager_type(bdev, type);
>>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>> -	struct i915_buddy_mm *mm = &bman->mm;
>> +	struct drm_buddy_mm *mm = &bman->mm;
>>   	int ret;
>>   
>>   	ttm_resource_manager_set_used(man, false);
>> @@ -240,8 +241,8 @@ int i915_ttm_buddy_man_fini(struct ttm_device *bdev, unsigned int type)
>>   	ttm_set_driver_manager(bdev, type, NULL);
>>   
>>   	mutex_lock(&bman->lock);
>> -	i915_buddy_free_list(mm, &bman->reserved);
>> -	i915_buddy_fini(mm);
>> +	drm_buddy_free_list(mm, &bman->reserved);
>> +	drm_buddy_fini(mm);
>>   	mutex_unlock(&bman->lock);
>>   
>>   	ttm_resource_manager_cleanup(man);
>> @@ -264,11 +265,11 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
>>   			       u64 start, u64 size)
>>   {
>>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>> -	struct i915_buddy_mm *mm = &bman->mm;
>> +	struct drm_buddy_mm *mm = &bman->mm;
>>   	int ret;
>>   
>>   	mutex_lock(&bman->lock);
>> -	ret = i915_buddy_alloc_range(mm, &bman->reserved, start, size);
>> +	ret = drm_buddy_alloc_range(mm, &bman->reserved, start, size);
>>   	mutex_unlock(&bman->lock);
>>   
>>   	return ret;
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>> index 0722d33f3e14..fa644b512c2e 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>> @@ -13,7 +13,7 @@
>>   
>>   struct ttm_device;
>>   struct ttm_resource_manager;
>> -struct i915_buddy_mm;
>> +struct drm_buddy_mm;
>>   
>>   /**
>>    * struct i915_ttm_buddy_resource
>> @@ -28,7 +28,7 @@ struct i915_buddy_mm;
>>   struct i915_ttm_buddy_resource {
>>   	struct ttm_resource base;
>>   	struct list_head blocks;
>> -	struct i915_buddy_mm *mm;
>> +	struct drm_buddy_mm *mm;
>>   };
>>   
>>   /**
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> new file mode 100644
>> index 000000000000..5ce3fc702f80
>> --- /dev/null
>> +++ b/include/drm/drm_buddy.h
>> @@ -0,0 +1,153 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2021 Intel Corporation
>> + */
>> +
>> +#ifndef __DRM_BUDDY_H__
>> +#define __DRM_BUDDY_H__
>> +
>> +#include <linux/bitops.h>
>> +#include <linux/list.h>
>> +#include <linux/slab.h>
>> +#include <linux/sched.h>
>> +
>> +#include <drm/drm_print.h>
>> +
>> +#define range_overflows(start, size, max) ({ \
>> +	typeof(start) start__ = (start); \
>> +	typeof(size) size__ = (size); \
>> +	typeof(max) max__ = (max); \
>> +	(void)(&start__ == &size__); \
>> +	(void)(&start__ == &max__); \
>> +	start__ >= max__ || size__ > max__ - start__; \
>> +})
>> +
>> +struct drm_buddy_block {
>> +#define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>> +#define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
>> +#define   DRM_BUDDY_ALLOCATED	   (1 << 10)
>> +#define   DRM_BUDDY_FREE	   (2 << 10)
>> +#define   DRM_BUDDY_SPLIT	   (3 << 10)
>> +/* Free to be used, if needed in the future */
>> +#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(9, 6)
>> +#define DRM_BUDDY_HEADER_ORDER  GENMASK_ULL(5, 0)
>> +	u64 header;
>> +
>> +	struct drm_buddy_block *left;
>> +	struct drm_buddy_block *right;
>> +	struct drm_buddy_block *parent;
>> +
>> +	void *private; /* owned by creator */
>> +
>> +	/*
>> +	 * While the block is allocated by the user through drm_buddy_alloc*,
>> +	 * the user has ownership of the link, for example to maintain within
>> +	 * a list, if so desired. As soon as the block is freed with
>> +	 * drm_buddy_free* ownership is given back to the mm.
>> +	 */
>> +	struct list_head link;
>> +	struct list_head tmp_link;
>> +};
>> +
>> +/* Order-zero must be at least PAGE_SIZE */
>> +#define DRM_BUDDY_MAX_ORDER (63 - PAGE_SHIFT)
>> +
>> +/*
>> + * Binary Buddy System.
>> + *
>> + * Locking should be handled by the user, a simple mutex around
>> + * drm_buddy_alloc* and drm_buddy_free* should suffice.
>> + */
>> +struct drm_buddy_mm {
>> +	/* Maintain a free list for each order. */
>> +	struct list_head *free_list;
>> +
>> +	/*
>> +	 * Maintain explicit binary tree(s) to track the allocation of the
>> +	 * address space. This gives us a simple way of finding a buddy block
>> +	 * and performing the potentially recursive merge step when freeing a
>> +	 * block.  Nodes are either allocated or free, in which case they will
>> +	 * also exist on the respective free list.
>> +	 */
>> +	struct drm_buddy_block **roots;
>> +
>> +	/*
>> +	 * Anything from here is public, and remains static for the lifetime of
>> +	 * the mm. Everything above is considered do-not-touch.
>> +	 */
>> +	unsigned int n_roots;
>> +	unsigned int max_order;
>> +
>> +	/* Must be at least PAGE_SIZE */
>> +	u64 chunk_size;
>> +	u64 size;
>> +	u64 avail;
>> +};
>> +
>> +static inline u64
>> +drm_buddy_block_offset(struct drm_buddy_block *block)
>> +{
>> +	return block->header & DRM_BUDDY_HEADER_OFFSET;
>> +}
>> +
>> +static inline unsigned int
>> +drm_buddy_block_order(struct drm_buddy_block *block)
>> +{
>> +	return block->header & DRM_BUDDY_HEADER_ORDER;
>> +}
>> +
>> +static inline unsigned int
>> +drm_buddy_block_state(struct drm_buddy_block *block)
>> +{
>> +	return block->header & DRM_BUDDY_HEADER_STATE;
>> +}
>> +
>> +static inline bool
>> +drm_buddy_block_is_allocated(struct drm_buddy_block *block)
>> +{
>> +	return drm_buddy_block_state(block) == DRM_BUDDY_ALLOCATED;
>> +}
>> +
>> +static inline bool
>> +drm_buddy_block_is_free(struct drm_buddy_block *block)
>> +{
>> +	return drm_buddy_block_state(block) == DRM_BUDDY_FREE;
>> +}
>> +
>> +static inline bool
>> +drm_buddy_block_is_split(struct drm_buddy_block *block)
>> +{
>> +	return drm_buddy_block_state(block) == DRM_BUDDY_SPLIT;
>> +}
>> +
>> +static inline u64
>> +drm_buddy_block_size(struct drm_buddy_mm *mm,
>> +		     struct drm_buddy_block *block)
>> +{
>> +	return mm->chunk_size << drm_buddy_block_order(block);
>> +}
>> +
>> +int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size);
>> +
>> +void drm_buddy_fini(struct drm_buddy_mm *mm);
>> +
>> +struct drm_buddy_block *
>> +drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order);
>> +
>> +int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>> +			  struct list_head *blocks,
>> +			  u64 start, u64 size);
>> +
>> +void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
>> +
>> +void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects);
>> +
>> +void drm_buddy_print(struct drm_buddy_mm *mm, struct drm_printer *p);
>> +void drm_buddy_block_print(struct drm_buddy_mm *mm,
>> +			   struct drm_buddy_block *block,
>> +			   struct drm_printer *p);
>> +
>> +void drm_buddy_module_exit(void);
>> +int drm_buddy_module_init(void);
>> +
>> +#endif
> 
