Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA39C52D3A0
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 15:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36F711A282;
	Thu, 19 May 2022 13:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3099E11A27A;
 Thu, 19 May 2022 13:09:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOBtUSbETe2NqYiqUQFvgSqD+lYgC+H3XY0qAcW1QlP91Tfoa+87YJaBM9PoeV4FKvLCC5K5BJfRKhgQWT3WCVWOo5jxUbhQ8JzoR9HvsIILcfb7OOoQTmoa2A5l9ahhthjKtVjsJ9uoJZjXfBXMaZJicM52kMHSe8sDqi6pfS9eo+QH9ZtM87cQPn6PZUoLqFUK9XUNFEeowCfCL/AoatsnJvh2HBT1GBwWT7L7yZadZwIUvSxfXYkTbvXO34VsoJkHH1598n9nIFRmeHDuLsv+mLJB1nlTXENzUR0LFWlp2mAuHRNAgHwbRpeEmbKvL00b2fw37Ieo4vYZrLfM8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXkGSf39A3ZPhZoK+hWfLGcAXVsegjy8o7PtKCTrTXs=;
 b=BCpWA48r8A2EO48/CO1OZnE/iYR6SOHsGf9OOS5nrCwifDnjjsU3eqXUqXnQqdm6PZBEztrG+j0Z8j/thnDTorf1UWDSw3MM8Y/Nq6q1Y+6ZL32AFQKaiLnYtaWK4ZYMbWy4fYMUOxkBeHSqdiMOHofvFCKxei4V25CxrvzQg6inw1AlF6DijK+usbiBdSufMRSNAhGuiBMuLffa7KHsz7Hd9Eh/WClv9yHr1EjXG+3PgjcpztJCl2BtCLUf7/4+f/t/wZkoZrjqr1TH5zaN07Ev3gwdNnBiJtWIodicGRP3Q9o1p2Met2sKxeAtubFtW0NsVaia/SWKH0ugD/9bdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXkGSf39A3ZPhZoK+hWfLGcAXVsegjy8o7PtKCTrTXs=;
 b=rrMr5I1Jf9afARtzg68kQjpLILaS25wNIJcnTy5zQ+uXZwA5wv8doo/21kOCFNoIikR4bNzcczxDktRsyzsQ46SsqouMDHeeE2KwVJLVNmGcphVi4qqu1vz2tm23T3hBreNwMF+f+0z5RlBtwk9g0+tamUnrcg7BW6w6DSJVFo8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN6PR12MB4736.namprd12.prod.outlook.com (2603:10b6:805:e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Thu, 19 May
 2022 13:09:44 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5273.015; Thu, 19 May 2022
 13:09:43 +0000
Message-ID: <7edcae40-025a-b82e-f5ee-4c51bf6cc5a5@amd.com>
Date: Thu, 19 May 2022 15:09:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 01/11] drm/radeon: switch over to ttm_bo_init_reserved
Content-Language: en-US
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20220519095508.115203-1-christian.koenig@amd.com>
 <20220519095508.115203-2-christian.koenig@amd.com>
 <DM5PR11MB1324EE629E070768A1E0E6ADC1D09@DM5PR11MB1324.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <DM5PR11MB1324EE629E070768A1E0E6ADC1D09@DM5PR11MB1324.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM7PR02CA0007.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fd81e15-99db-40e3-6d31-08da3998d759
X-MS-TrafficTypeDiagnostic: SN6PR12MB4736:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB47360E922392466E5110120C83D09@SN6PR12MB4736.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PhX5ZckrHJAlelCzEf3Dvyw7dwfrE70BgxMYvsEyrt5INL8UKiDzIt4ZvUVUDwvIF78niPfIQs4GevAwyMsLuW1dDXiYQ53OxIMozP1QPsprGyMU/tUVi0I+eHyKLw9OtipqVUmwm3Heu7mmAOOHjD72xu9VRiWYRABcMxSr5uc8/zj3nLPA3DD5YJYBWiWB+VfKWAvGaK3aQIfmTXA+yh24Hn/XQBCmIpr1yKINZA/SC2N9vHKmbZbUd8jOM76HQS9PR9OGqOiBJGfmbJSQH6NogZiIH/7Szp+jh73c8npyMBbe4EUvZ7Uqx1cKLnD2cNdXDD/U4jtbMf3yLaJxJnzSltT+OIFpRHksEMxQ/NvfdTp2La4KYcnu40QCL6dRA+3n2ma8Vt+twSCcqfHvylj0CxQHAyZuv3wxtbGVDTXOSFbSp20BP/gvsZkxkAv+8qbYqDdj7nLpvZ0OS+axprUfcF5iSs7gzUFiAXLHt4rKUvxm8kXrn6OsLrIohtsrqkdUGcVzFekThtXyvx/PQK7dd1yrfnP5hQdxQvXC3aEgMTo9g0/2rMkzpqQuKCglXVNn114JjzcuUyIbAIPllZqZbLrauIXq3HRKyqViLZeQUqXcYf6dMC7gJZL1Lk0U0Er2Q8z7M4dQrDGrs7bsudUN3ptPRDW89DOcrTfrPFOcHvk2psPRElV2pDiOapvDAmCJ1hGSoqggMfjc33quhoICV8dkV5aEqMjaxWJSOzQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(508600001)(66476007)(53546011)(4326008)(5660300002)(66556008)(66946007)(186003)(2616005)(66574015)(31686004)(83380400001)(316002)(110136005)(54906003)(36756003)(6486002)(8936002)(6506007)(6512007)(26005)(8676002)(38100700002)(86362001)(6666004)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXA2WDNvUGJVcm1wQUhlV2tlemMrN3JiQU02OGRLOFpiUE5WU1ljNUdJMGxQ?=
 =?utf-8?B?ZzBBYXg5b2tuc2V4QXNtaHI5SWdwSEF0SmRlTjA3NXlnZ0hnZXAzeWJzOEw5?=
 =?utf-8?B?T3ZYUmpEOXhTcFFGakQwelhaMFpJSFk2U0NyVUlOWWVOdHh0WUFQckgvWEk4?=
 =?utf-8?B?VjBTZW9pck1JdWNaME9Ob1FHWmM0YS9ZSDlpREc0dEdUVWhrZmRvVWgxa1dO?=
 =?utf-8?B?L1VZVDIycTFDVGZnODF6MWgwbHVPVmpuZTlCNE1GVTdqZFE4cjBvcUZXbkUr?=
 =?utf-8?B?YmlqRW1OeVFISyt6bzkrdmFvMGZZOGxCL0R0R21GMmx2SGJaS3NreExXUllD?=
 =?utf-8?B?ZFlHcXdQL1hTV05qYnZFc0cwSWp0eHBiT1RHZi9Pcm50by9kd3RFeGFmN1Z6?=
 =?utf-8?B?Q1k4QXBMM3ExK1VIODd4cEJJOGlXTGxHeHEvWnhENHBqbFUyZjB2U1AzYWd2?=
 =?utf-8?B?Q055cFhWV3dReFVKdkZ4SHdsaVVWancza2RFaEowa0huMkozNHRYd2pIc2JY?=
 =?utf-8?B?cVFIcDN2T3VRV1c2S3M4dmhGWlRjbXNvdEJYV0dmd2FNc1VaT0NoMVZBRjZG?=
 =?utf-8?B?LzR5NXhHR0dwRVRUejZaSEM0NEZMcy9hQWppdEd2NGtobXRFbXNzZVpTdHpz?=
 =?utf-8?B?dmFXUnBndkhrckpXZU0zaXFOTlBNMFJwcFZHengxdHNKTzN1Qzl3TUdUVUhn?=
 =?utf-8?B?a3dOV2xHMEs3ejE4WUZJdkRxaXMxUmhUblU0dkFtVGxDNk5FV1ppdVVnazhk?=
 =?utf-8?B?aEtKd2hoUllwa2NVUkwvaEJqSmsrV3QvZWtyS01mdFVuTnNISjdaZFhLdlBY?=
 =?utf-8?B?b1NwY08xRTBld1ZRMGo3Y3FYMldZOFNUbEhBWVFuWlc4U25nRExKdXlyeXZJ?=
 =?utf-8?B?cmVaQW5xN09HV2F2VnJGWDVGNk10cGJGc0txdjFFQ2NVZThaZEk5Wlc1TmVt?=
 =?utf-8?B?TnNSMG9Mbm5ZUDRoL1NOVFlORFljTExSUFpQcHFmb1BIUng1QzVGOEFJcnNM?=
 =?utf-8?B?ZkFkZzM1RzB5d3hDVnZpbWw4dndlRGhLd1BOQ01RazlWeC9pTVBQK2pURXBT?=
 =?utf-8?B?YVJzWmVsQS9hSzVHUkVZaG9rdWd5eDNOOHpqUTAyR0lKQkZVOVRveHo2YVZz?=
 =?utf-8?B?bENXS1pvNEUvellPbURVaG1JelZNN2E1T09xZy9zSVBIVmtiT3BNcUVnWDh0?=
 =?utf-8?B?RnZGb3RwV2hhZVZ5Qm1GUmwvWklZNnRMclp6WjY4OGdnaCt2RHlabGErRUl0?=
 =?utf-8?B?Y3h2MXh6eDZWV1NPa2k3QnhrYUpnWi9MR0tKcFNTczF4MVFZZ0RIL0RwTTBY?=
 =?utf-8?B?aTVVelhDLzZPMFhxZ3JEb0QvazZRdlJqeVhXcE56b21wWFBXS21JdFpmRUgw?=
 =?utf-8?B?NkZnSjM0ZmdPV20xeFNEOEtGNGNXZlBlWlovOTRwUVB3WHdrcERONzVGS3ZQ?=
 =?utf-8?B?RXF5QVVzeUlibmdqTnptZG9LLzdNYTNiR0FrU1hmd0szY0llMVJYdlY4dzJ5?=
 =?utf-8?B?bzBsOXJFZzZOcFRONGFYQ2VSamV4bHVHQnBBb005MnlsY0kxUkJMdDFWZ2Qv?=
 =?utf-8?B?bnpVOGQ3VVM2aGhJK0dEdTI3MVZtOGUrYldxTXhlTTBrSHFFTHFhb3RNUzNM?=
 =?utf-8?B?eWQ0a1dqZVlseEd1Vk9tYzNQMVpZL2tIbGpGc0Uya3RudFd4bW92cFBBeDZz?=
 =?utf-8?B?bUxnQjdQbmJneFk3cENaNmp5OU1RUGFwejRMaG9IdFhsWmFURnZRTVJ2SVRE?=
 =?utf-8?B?ckVkeHNkQlFicThXWTAyMUxuZFZ4c3VHUjIyQ1BkS1I2MERFdVUrZUZXTWNl?=
 =?utf-8?B?L3NrN0NoVk1wNllmSHdMdW9mNDYzaG0rMm1ZNnBMcHNjNndXR3ptS0RxeGpG?=
 =?utf-8?B?OE9aeXdiTUhsZ2w0RjA2dU1meGpNQlRJRFE5elU2dE9rZmF0RlQyUnB0K2cv?=
 =?utf-8?B?K1l3MENiTmh2R2k1YXdIVXhEdGRuSlBvY2d6TmVpbzFZZGFEYzkyR1R5TmhW?=
 =?utf-8?B?TC84OWtaVEhYMzlyeUlrbm1CcngyVjdFRko3TTl3QUE1ODdPdlNmdGZzLzFY?=
 =?utf-8?B?a0lDMVJnRHU1Mk5VZHBMcFM2Um1vRXJzTDNlYk1aRmNQQ2xWcW53QksrQzlZ?=
 =?utf-8?B?RWRVa2tJMkJuUTNuRGw5Rlp2allTaWdlVGZDNS9LMXppaUdaNC8rVFN1QWFJ?=
 =?utf-8?B?b0kyeWd6NWUwLzkyQkREQzhHcWFDMHdaRUhEczI4c2tvR1Y4RjB0ZGNxbzI0?=
 =?utf-8?B?UkwrUXVENEt2MjRRck55a3RCTG03WCt1V2F0clFCcXdEbnVoL1lKVlJxcmtx?=
 =?utf-8?B?eGZRQmRjWUxKTmZiam02dXpOUG1ScjJHd2o0NU8rSGxBRUtnUVdOZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd81e15-99db-40e3-6d31-08da3998d759
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 13:09:43.8526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m++cIrLbBvYtFBGkRuKYteMntso5XPDRzsdQlxruWiVWugPodGgZAxCHdjtD/aUY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4736
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
Cc: "matthew.william.auld@gmail.com" <matthew.william.auld@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.05.22 um 14:54 schrieb Ruhl, Michael J:
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>> Christian König
>> Sent: Thursday, May 19, 2022 5:55 AM
>> To: intel-gfx@lists.freedesktop.org
>> Cc: matthew.william.auld@gmail.com; Christian König
>> <christian.koenig@amd.com>; dri-devel@lists.freedesktop.org
>> Subject: [PATCH 01/11] drm/radeon: switch over to ttm_bo_init_reserved
>>
>> Use the new interface instead.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>> drivers/gpu/drm/radeon/radeon_object.c | 17 +++++++++++------
>> 1 file changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_object.c
>> b/drivers/gpu/drm/radeon/radeon_object.c
>> index 6c4a6802ca96..1d414ff4ab0c 100644
>> --- a/drivers/gpu/drm/radeon/radeon_object.c
>> +++ b/drivers/gpu/drm/radeon/radeon_object.c
>> @@ -133,9 +133,12 @@ int radeon_bo_create(struct radeon_device *rdev,
>> 		     struct dma_resv *resv,
>> 		     struct radeon_bo **bo_ptr)
>> {
>> -	struct radeon_bo *bo;
>> -	enum ttm_bo_type type;
>> 	unsigned long page_align = roundup(byte_align, PAGE_SIZE) >>
>> PAGE_SHIFT;
>> +
>> +	/* Kernel allocation are uninterruptible */
>> +	struct ttm_operation_ctx ctx = { !kernel, false };
>> +	enum ttm_bo_type type;
>> +	struct radeon_bo *bo;
>> 	int r;
>>
>> 	size = ALIGN(size, PAGE_SIZE);
>> @@ -200,11 +203,13 @@ int radeon_bo_create(struct radeon_device *rdev,
>> #endif
>>
>> 	radeon_ttm_placement_from_domain(bo, domain);
>> -	/* Kernel allocation are uninterruptible */
>> 	down_read(&rdev->pm.mclk_lock);
>> -	r = ttm_bo_init(&rdev->mman.bdev, &bo->tbo, size, type,
>> -			&bo->placement, page_align, !kernel, sg, resv,
>> -			&radeon_ttm_bo_destroy);
>> +	r = ttm_bo_init_reserved(&rdev->mman.bdev, &bo->tbo, size, type,
>> +				 &bo->placement, page_align, &ctx, sg, resv,
>> +				 &radeon_ttm_bo_destroy);
>> +        if (!r)
>> +		ttm_bo_unreserve(&bo->tbo);
>> +
> Hi Christian,
>
> I am not understanding this unreserve.
>
> The original code path does not have it.  It looks like tt_bo_init will do this, but only if !resv.
>
> Should this be:
>      if (!resv)
>            ttm_bo_unreserve(&bo->tbo);

Ah, yes good point. That's a bug.

Thanks,
Christian.

>
> ?
>
> M
>
>
>> 	up_read(&rdev->pm.mclk_lock);
>> 	if (unlikely(r != 0)) {
>> 		return r;
>> --
>> 2.25.1

