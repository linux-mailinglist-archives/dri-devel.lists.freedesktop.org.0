Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5B069E460
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 17:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2C610E33F;
	Tue, 21 Feb 2023 16:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5052F10E32F;
 Tue, 21 Feb 2023 16:17:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACca5XPjn9BLoJBuexIlbnNoiEuXW2fMtOxn3oyPopnC90/SlUvA0GvT867ftrXfeG+NxFkDHrpG9mIIMBx/gEmDiGTtWliMeRkfRcOWcWhf3JeS0Vpu9zEewFAIlLqotG4fGKams7T7GJbW+YYxnAkBUaHqjXyQ7adkr3a4FRKz7glLo3s0ErZ/+4Ynk+9aASyvD6lntbBa/8f0DPz5jOZY8LX72tQrO04+goo61T06+yu265PtpicjzcKLORyFqCLSMmSIYc2N9pAl7in2+1WMaPLpdgg2gb2FdBlgbCVhnEl4cHLGK+YOU8roOjy77B9J6KJyCJZaJcC+jji+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5lpYRTYbBVwyVyeBpJ+gbcAE2v/L1FZMkN2KcdZksQ=;
 b=YKL0vsfr/D+dJL6jPav1ruY6woS+mySPtqiywl6Y7lyjgydInE8V6qG43Jcv9v9TpyWLY9Qxh/hTSupKfrJBUh2bRHH9VtAdou5pJDIGRVr2zEwbzgV4Ch+DkDYI7xrGNiUzBNK8WEKN9pRdbtVybD4XszX510p9UU7D6AEgPOVrNsN0ss8/rsfUgvjBM8eVUObo44e9jDZP+KvdbMVkOZ9WAwpnCs5st8QC/oO04r1gidMkfdyiP/7mZl3Tq9bihuy7DCeGZcSMlnEkvmx8rnxe+vMpFrCfEPOwyJNOhbS+Otvycss87ri1NjlrlFg1e+QY2Aa5mkIFYtICQHpEKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5lpYRTYbBVwyVyeBpJ+gbcAE2v/L1FZMkN2KcdZksQ=;
 b=VIwmXdvTfrfhn9m0iq2sksDcVEKI0uePfhsgVPoOeQpMKEKbgVCCAVUBFKYafDDj2OSirPXfNC9qLxNw7MkIIYRUHQaxdyJw9IWjD9JbR/wzMbBbuGyc+llcba9lGiszYkj2SdcMIkt19Uj72gHIG49JTsmvA8768tYWNQyHb1s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4118.namprd12.prod.outlook.com (2603:10b6:610:a4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 16:17:38 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 16:17:37 +0000
Message-ID: <4fb0f24e-d8e7-5482-aa76-07c781d57ffe@amd.com>
Date: Tue, 21 Feb 2023 17:17:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] drm/gem-vram: handle NULL bo->resource in move
 callback
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230208145319.397235-1-matthew.auld@intel.com>
 <03b9cbee-e453-255b-923c-6b116b9e2cf1@amd.com>
 <bc166bdc-6f2f-d3a8-5496-e4af6fcc51ae@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <bc166bdc-6f2f-d3a8-5496-e4af6fcc51ae@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4118:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be78f1e-faae-4faa-34f4-08db14272558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A/snYB1k9vPxHBzPVcF+9XzH+Zmmt5mGaX2RZfM4jSXmPGAOBm45skGzAupUDj8eFGINKZRYkbI4ZeugkcNEX2aPXCxvoDwR+v8J1EIBJ9HWImy2OKYYt187Amy9MRfI2PLwhyzH4O4oXMYshGBhd++UX26dd94jdYGWsnvUUXGr4BUscaL0K+JTaClBmjRdVwRy1i0gogAWe3naNk1PyETW8PLUHrZ0ErJ1dmQsXKvVIezDFscr6nL5sNTfr4z/l03Yx8B2E+DptNgEwMwVYX6fGs/1jVADbsZj/ZrZECvcD8omLRrAOKd+zK+L2G/IJiUeEgU3QGDGVZhlhe3mbBAbZ2mwCC1owo4LdknuF0XfunbCzfIzedoIk/kaJEvrlYBplOTiNUb77zy4e6uMbMjdtmIZ4Ztmduzj1xfkMyueykWCyPhsaKWxN5m2L059p6qCDyL6DcgkHlccjqfYyOhi1ugz0K18QbUDFltKk47jtLpsTBC34k2oPBsHENLAof4Wkw3+6jh65/JzHbuoJ/VH9Rhkvum6Ok0IvsC+m88Q1BX1O9X6Rk9W5cmR+2KBfs9gh543q3KONgMjouByJWQZ1DYyn1Pj5NmeVhfmGGvmtRJkmCif/Ufvheop1YQyzOdzS+TpDAUyOZcO418nH5YA4vMxlbKHcXJAC5Bhd6leEmouOECXQ1xXHheOtvULNjHz2Kv1SgvZ8myYw2LYdKfoI/ZRu4+9fD3ru3ACL5E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199018)(31686004)(83380400001)(316002)(66574015)(36756003)(38100700002)(66946007)(66476007)(66556008)(8676002)(6506007)(2616005)(41300700001)(186003)(6512007)(6666004)(6486002)(53546011)(4326008)(5660300002)(478600001)(31696002)(8936002)(86362001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elRzc3J2bjliUlpDVlgrTGdFbnZJamd6WmNoNmJkZ1VWcUxMdGFqZkU1VU56?=
 =?utf-8?B?ak1vT0NWZVJoMkg4K04xSytGS0JFSjBWb0l5WUpIYzNzRkh1ZlF2d096bDJZ?=
 =?utf-8?B?ekhmK0dHVmZEZGhqNzE3UHlkRktBZUt0bEtVNmcxVDNJSmdVWXV3WEFkWWdI?=
 =?utf-8?B?VWJ4eEVtRFNYcXo0N2pPTFlCL2lwTmd1VkZneXFxY0JiSmJkMlViT2tUdHE1?=
 =?utf-8?B?RUNoQU5tRlQ5emp5TEpmTzVBRGFFR3UvU01rZTNJVHNrVFl0S0Jud0hGdVpF?=
 =?utf-8?B?NjJNbGhiS0txd3diWlljdjNoaEp0eTh5ekI1Z2NFTXA4OHJRNkdmWkxHbFY0?=
 =?utf-8?B?WUdNVGtoaCtXaGtwNVlUSmlPeWc4ckhjTzVLVkF6TXdvY1hnKzFKdnFzSWNV?=
 =?utf-8?B?Wjl3VU5xZ2ttMElEZS9wTVM0Y2xTditlTk5SR09ZRkVjMkkxZGk5TmhuQWdS?=
 =?utf-8?B?eUVGaXJGNjY5L3NUZHpoY0lhQmNMUGJnaHBzQ0NlTWI3Y0tiaHBpeGtVSWdk?=
 =?utf-8?B?N2FXS2Z6KzVZNmJFSkRWRTRucFk0MGhweEJ2Vnl1TmZwbHpJd04vY1RBZ28z?=
 =?utf-8?B?N0VzaHh0VXB6cHpZVndpWVl1c296djliWHJEbzg4enVKaTFpUHN3UnVZMEJV?=
 =?utf-8?B?QitNUk00MndmbVBTSkFpYWUwWkJ1VW9oZGkyZE5vbVNKZFFaTUtSZEwxYkc3?=
 =?utf-8?B?THJqM0NhT0xiY1hyWVZ0ZUhJN2JETHp2RVU4c1l0OUtRUGo1WlVyVVJ0SXlZ?=
 =?utf-8?B?UXNvWGJrTHk0M2lnb3JpazlHRGlyY3VtcFBDZ3lGWVhCYkQrRkx5VlppVzc1?=
 =?utf-8?B?d2t0QU5wdVlWS3JBaklXMFpqb3BWVldrVGpUcVdvK1dva3Q1U0FIVGlGaDZp?=
 =?utf-8?B?alMvWkdvako2eEgxd1RBYkxFR0dJSjZYVlZySDZ2OUJmQThZQndJSjN0NVFE?=
 =?utf-8?B?NndpWFVZTDNqcVRLNmk4WHMvMUlGVzluSWlEa29SSXlXWGdVWHFsL3RLbi9o?=
 =?utf-8?B?OW1YaTIrZ0pWdzV6Mm1uYTZzbmkvV3N2cUNyT1BQNUdWWVA1N09za0Y1bjFJ?=
 =?utf-8?B?cy96UWtmMUxCQ25mVXIrSkpEbXE0QldDQ280dDAwNnBkRzRJb3AxQ3B0ZnAy?=
 =?utf-8?B?eDFxc1BxTmlXVlA3bnVNSlJSNm9CZ1YrRmJockxsQWZpYmI1blpSTzhpdDFI?=
 =?utf-8?B?R1dCVDdaU3dMZ0pha29FWWNWUzN0SmtsY1lkdHEraXVDT2RZM01OMkRBYy80?=
 =?utf-8?B?UFQ1alprTG1mZFBCQ1JWUVh1WXJ5eVlBMTRNMGVjZ1lJRnJzbkVuTlRIaDFX?=
 =?utf-8?B?UzdqTGRUUGdoazhrSjRxLzFzZ1JZTkd2MW1ycWJ4YkVDMTFRSXpmVDZoenps?=
 =?utf-8?B?SG1nWGlTMjN0NHRqTzlVM2IxdHJqZEs2QWVHZUhnbzdTSW41cjhwRDZ0UlU3?=
 =?utf-8?B?WlpkQmUySzgyM040ZHpmSyt5MVFMaVhSOUdET2hTaDNFRCs4RXArY0p0TGdS?=
 =?utf-8?B?MlJadk92UGdqOHVFTmNIYXNaQkx5WFh6NmlZK1p1cEhsT3kzQmhCNkJWWXdQ?=
 =?utf-8?B?M21NWlpNdjJScTFuTWJiL1RodWR1ejFCNVNzZGYrcjUwK2RLWlBnWjd1aVNZ?=
 =?utf-8?B?aDdRSzM1UTZhYzc1RWlJTXZ1WlFHUnBuL0x6NHdDMExJcThGQjFzU28xOVhm?=
 =?utf-8?B?THJZQWVaS2g2YUF1cGdkeEV0NXQ0YW5td0l3dnVkS3pXL3FWVHdOWUcwWkFZ?=
 =?utf-8?B?M0VJa01Dbjg4LytkU05lSmJVempmajJvdGhvZmtMcXZPendBN1d6VVJqZE5B?=
 =?utf-8?B?QTNtL1BNcld3VkVxelhMdFRSNSs2VEJOZ2FSRzJOU01EYUt2TUhNem8razAy?=
 =?utf-8?B?dzU0VFA1YTlvTkxSM0FCdkwxdVJ6Ti8vZmpqSGxHTGU1WnRhUnRBd0xjSEJm?=
 =?utf-8?B?T2sySUR3LzVvTXVYVlZiT3Y2S011NEFiZTcxNktvUWd3OVhFQVpnMU1ycS9Y?=
 =?utf-8?B?blpHWDI5SUVFU3d5VTQ4TE1LWStTQ0RVUDI5bXgwa0RQNzkrQkhIMnEzakNa?=
 =?utf-8?B?OVVnMXlFU3VYRUxBQS9JVCtLOXQ3ZVpYcDU1ZDhMU0NmbnVFZ211TGkzM3Jz?=
 =?utf-8?B?VFNxU0pzSzVuczBNRXVpZnJ3NFRDdWZwaC9Mc1l4bkVKaEpBcUo1K1N3M2xo?=
 =?utf-8?Q?zAPbSZNxIV57JKsI/qGCCOr067XYv1BpGOtmIoBBvhQC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be78f1e-faae-4faa-34f4-08db14272558
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 16:17:36.9312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWyoaKzsvYqIS5PHtZIRGMdmRxig5LojSSr0NAaNxA1RJbgterD//Gkzw7nqMH4D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4118
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.02.23 um 17:13 schrieb Matthew Auld:
> On 10/02/2023 11:03, Christian König wrote:
>> Am 08.02.23 um 15:53 schrieb Matthew Auld:
>>> The ttm BO now initially has NULL bo->resource, and leaves the driver
>>> the handle that. However it looks like we forgot to handle that for
>>> ttm_bo_move_memcpy() users, like with vram-gem, since it just silently
>>> returns zero. This seems to then trigger warnings like:
>>>
>>> WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_gem_vram_helper.c:255 
>>> drm_gem_vram_offset (??:?)
>>>
>>> Fix this by calling move_null() if the new resource is TTM_PL_SYSTEM,
>>> otherwise do the multi-hop sequence to ensure can safely call into
>>> ttm_bo_move_memcpy(), since it might also need to clear the memory.
>>> This should give the same behaviour as before.
>>>
>>> While we are here let's also treat calling ttm_bo_move_memcpy() with
>>> NULL bo->resource as programmer error, where expectation is that upper
>>> layers should now handle it.
>>>
>>> Fixes: 180253782038 ("drm/ttm: stop allocating dummy resources 
>>> during BO creation")
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>
>> Oh, I wasn't aware that this broke at so many places. Especially 
>> radeon was tested earlier in the development of the patch set.
>>
>> Thanks for looking into that, the radeon patch has my rb and the rest 
>> of the series is Acked-by: Christian König <christian.koenig@amd.com>.
>
> Should we go ahead and land this? (minus patch 3 since that is already 
> fixed by vmware folks).

Yeah, sure go ahead.

Thanks,
Christian.

>
>>
>> Regards,
>> Christian.
>>
>>> ---
>>>   drivers/gpu/drm/drm_gem_vram_helper.c | 11 +++++++++++
>>>   drivers/gpu/drm/ttm/ttm_bo_util.c     |  4 ++--
>>>   2 files changed, 13 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c 
>>> b/drivers/gpu/drm/drm_gem_vram_helper.c
>>> index d40b3edb52d0..0bea3df2a16d 100644
>>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>>> @@ -916,6 +916,17 @@ static int bo_driver_move(struct 
>>> ttm_buffer_object *bo,
>>>   {
>>>       struct drm_gem_vram_object *gbo;
>>> +    if (!bo->resource) {
>>> +        if (new_mem->mem_type != TTM_PL_SYSTEM) {
>>> +            hop->mem_type = TTM_PL_SYSTEM;
>>> +            hop->flags = TTM_PL_FLAG_TEMPORARY;
>>> +            return -EMULTIHOP;
>>> +        }
>>> +
>>> +        ttm_bo_move_null(bo, new_mem);
>>> +        return 0;
>>> +    }
>>> +
>>>       gbo = drm_gem_vram_of_bo(bo);
>>>       return drm_gem_vram_bo_driver_move(gbo, evict, ctx, new_mem);
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c 
>>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> index d9d2b0903b22..fd9fd3d15101 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> @@ -157,8 +157,8 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object 
>>> *bo,
>>>       bool clear;
>>>       int ret = 0;
>>> -    if (!src_mem)
>>> -        return 0;
>>> +    if (WARN_ON(!src_mem))
>>> +        return -EINVAL;
>>>       src_man = ttm_manager_type(bdev, src_mem->mem_type);
>>>       if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
>>

