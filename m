Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B190C5951A3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 07:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E45DC538;
	Tue, 16 Aug 2022 05:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F7FDC515;
 Tue, 16 Aug 2022 05:03:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L03iMUX1H2lUwwjSuABxfJtBGU5aFJWO3IKc8S1G7kOIZDuo8e4T/ENEMu5nmcF1WHmR0nqvEBbzliiRUIyoXvZuoIuYf7lRH0n7NV7Y0PtfaZHBVUorQP5XdqtORVfSDApm950g7KIuiWYNSwNFU7N/h1G/5weBTqQj2pvPtKX+koRsd2D/3rWVhoYU8RyAzqdyZHmH8y2m/sw9lm42Fks7gSIiEysBvCCUazOI/ZHtIhwn7poU33MKBBnbY61T+swazxqDJHOCH63wZdcoEXjp51HX5OUAg6Y95mBxOp6LHZJqpN90sgIK0w7QRytH1BuNuXbhHTTeL1DRVZHVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cu5tFSTkh/LGNyPZtjZdl/6Z+jSG0PFDl4ZkxEbfb0=;
 b=JJGwQ1Ht+QIFAQK+HM4Geaft1og9yddrlknRN8OJeuaW+xyLIeEPsCxFCrGVFRtn1VGWO0zBBieUFq7hD68+MKM+IuHH1OqRRjDnh5kCW9YC6W01SDRdxDGX4bKJ1/9qs/4/d7/UeiKY5KLX3jffsI0+sWRB3F1BzY1tU1ITai8uECDw59LlcuI5aZcrQ7m0plc9bdwxfybkLhq6x4xH0DUeByAn6Jn2we4QBj8CwnD/lw3D5xWGeIVXwqFtRsNw/h8I8x9rNy4SgSMDu713GUQnU5N+wV0H9pWx1nPlztV84SQQhjUS0CS5KYtEmLXFM+2czuodvXkpy2w1BwtRbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cu5tFSTkh/LGNyPZtjZdl/6Z+jSG0PFDl4ZkxEbfb0=;
 b=YlMG8E2HZd1MXZVFphdTxwgfSZ7Bs3HmVa3AQDPPPPbkQfkwpPGuP2JRMG7gsuabK5mBlLHP3v0Ob1NwLkuQJpQ2M+CeTjEWmHRP0TNU/dl728lREK12NdtVsLJqU/SsorNT81FazkPAV8CBJBWIt/UsZQ9sCU66IEhuh4dGFvQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by SA1PR12MB7342.namprd12.prod.outlook.com (2603:10b6:806:2b3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Tue, 16 Aug
 2022 05:03:25 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::a1d8:6a71:213b:6e14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::a1d8:6a71:213b:6e14%8]) with mapi id 15.20.5504.028; Tue, 16 Aug 2022
 05:03:25 +0000
Message-ID: <b0b4f3a0-0df5-8d2a-c1a0-ad6d721e9cba@amd.com>
Date: Tue, 16 Aug 2022 10:33:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 1/6] drm/ttm: Add new callbacks to ttm res mgr
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20220812133048.2814-1-Arunpravin.PaneerSelvam@amd.com>
 <b6ade0fe-367a-21f3-1942-a9d7eefcf1d3@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <b6ade0fe-367a-21f3-1942-a9d7eefcf1d3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::13) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ee21aed-b8c1-4cfe-c2d4-08da7f44a64e
X-MS-TrafficTypeDiagnostic: SA1PR12MB7342:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ol9SyVyDkQ0noYLvsV6fqgjrrFnEJEJjrZviemQ21CZtVgZxnwE6z0uZfuykMspADlpZFNO/A2LCHo7jcDi9A1BGRRV5b2u+5cChkn5RDlHEdAS3A4JxWXf8UFpApmiXuTUNUG9bAR+11htrQXJNg7aOYYM8NMRn3ooHTr/EJhzWSpiMxWQiWJo1DvX3WquryPm6ZpvbI/xabrM5LCkqD9rVFN67BZdXzyDdSNPIiO2T4xCmyG+xzBE3O9Td0Ur719gFplKZOZjRQEf4EUEYfovCN0icHGnGv6Ryu5s3KbdNXmi6HSHHcO6SStrT3zSdBLwIkZoOKuaoXxTYup4+Po4V5oAhzuiQ+zxp1B2xL1yhgvrL+dj9NuXBgb3FbqW/0agsBO5C1RsAEDi8NFyKHdKivac0HSojkE6h2lUB2blcK2fBbUejVu6eLhonOhsewWziCIl6PHVYHu8+/fWsP2u6BEhkkWHVyrMdKWSLYLUsdtZLdC0tOQVkYxwAXD+34i0HYof+g4tOJfoSYA3erWmw0SLzPJZjEXvCeaLVWg0fD/UQrPmsfoeEtuBNmrXMDGpwWHNix7WYL6DxaF3OKHgTcfsanCxBRUWsdN8VE2+UjMC3ULCFJrX50amoTEliLf+s2nJ96yjIo17oSNKaz3b4eV2qGCBHiloYZOfY8IjTYUmQK73qMzWmh3yiReHyHPgIZGFrRaKt9f/L8sdusqD87BQCJpvQoYclVgkyay98YprsJ2JxCSrDImlhwUeYn4eZ3PWLsOOX5YzxIzstS0v0OOV+eyijVQcsIIDSJLUaxO3CjeUjZuCkr3NrxVDErwj3Rx0X1MIfB8Zobqc/8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(66556008)(5660300002)(8676002)(316002)(4326008)(66476007)(8936002)(66946007)(38100700002)(86362001)(31696002)(478600001)(2906002)(6506007)(53546011)(36756003)(6666004)(2616005)(6486002)(83380400001)(66574015)(41300700001)(26005)(6512007)(31686004)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHpYSFBpU29oWXo2bkh1WTdFWmR4TXBPajE1MVJacG9teHlaK1ZGM3Q1WDlE?=
 =?utf-8?B?K0tKaUtKc09mcTVuV2ZBcXo1Rnd2RDZ1TElVZGptWGZaajc2QWNwbFpEeE9T?=
 =?utf-8?B?NDBoWVZTM1I5SjFPbEhFTTM2K2d3U0hET3ZRWDN6RnEwditBWWp6bHRzYTRB?=
 =?utf-8?B?UUV1NFYzSDQvN2Y5Y1AvbUR6UzNiTmViQXI5TGFOUTQ2RzkxS3VQRXU2Q1JX?=
 =?utf-8?B?aEZWZmRtN0lWdHpxL0x5OVV5eGZYeWZYUTRvTUNUMCtSd3Q4bUhVTk85UWhT?=
 =?utf-8?B?bEFkazJaUVpIdU01SFBWS3ZPbGFpYXI3WHdWNlpnZHVYelZ5Mmt4RHV1WEdF?=
 =?utf-8?B?MHZwM0IrVWt5d0VzS2pYQnY4WUhoV2w2SUhHdGZSVkJ1WDFSeUVXSnVxWjhL?=
 =?utf-8?B?Mm1wYzVGR3E2L2VDd04zV1hPdXRIWmkrWTA1bmcrSXFqOXFlUkZHSlRlN0hJ?=
 =?utf-8?B?dmFSMDBsSkNHdCswZ0FObS9XQ3FFUTRsa2RtNW9GcVNzK1MrSkQ4dFdPUWNL?=
 =?utf-8?B?YXFZbk1Cb0YyUTR1a3A5S0VvSkU1VGJtQlI1Q2tvd2h2cU0wSHJUV05KcjFD?=
 =?utf-8?B?d3c2bWNKL20xQmttT1YydEdhakxOUDl0YjB3eXYrc1JWZDhSdXZ0aHRBa3hu?=
 =?utf-8?B?ai9qNzdyajNNTE1vc1FoM3lvQ05wZmh1SC9vZlpsQk5TS29seGRuUkk1bkUz?=
 =?utf-8?B?SW11T0J2NmpBRWVaa0xMRlJKekg5VVRsWEl3empVVjMzc2JkK2c1cEtnTG5O?=
 =?utf-8?B?VmFNWVFaaGx1eEZCdk5PbjBEbW44SDFnTTRsSEdLcDJrRWtRa3lhOFpYZWps?=
 =?utf-8?B?N2FmNnhRbndQTmhMbm5rLzd0M05kOW5xcjVwb0dqd25kaXg5eXVpTGUyZ2R0?=
 =?utf-8?B?T0xGaHFWeDdsVmJySnNjUFhHNXB1VDVtUGUvdUJCUDI5ck5JbkFoM0hvTzRl?=
 =?utf-8?B?NEVIdUZpVys2bjBhOCswb3d4SjE4a1VDZ21WYy9mNU1TUVNybkhMSlJNMVFa?=
 =?utf-8?B?U2hKbVhmTi91eW93aWpZaHpyZE1vRkpBcEZRbW10SUZrMngxVDl1cVdzWWtk?=
 =?utf-8?B?TEE4RVJtSzBWN1RZNlR4SElGV2lGaExLWTdhT3grdFVWZGhlZUJIVXRXQlpi?=
 =?utf-8?B?TFh3VEZwSUR2ZWgwbzYvVWdFdkh1WkxCT2czTlJNQ29EZUlEVnMxTVVqTjdK?=
 =?utf-8?B?UFFBbkpxNllXYVZTSmdjK1psRjhBWU1aamhiNlAzRWJWMkJ5UGhpR3IzL29U?=
 =?utf-8?B?Y1ZYQUlmU3lVb0VBaDEwMm8wL1R0eUJieW02VjZhVG0xOTlUaHNXQ2ZDMmVk?=
 =?utf-8?B?SVNKWDh6eTlBMHlUazA1L0h5UkZXcG00RGcyMkdybm9KOXlzKy8vVDg4NEQv?=
 =?utf-8?B?QWxVVTNlT1ozWUppeUsvY1NweU1lUGFlVmxvNGU5TjZrTEZPZE9tZUZTVFRX?=
 =?utf-8?B?RlVyOFZrUlp1eTF4YVVtOVZHTE9nS0VPZE1SS0dIRlNnWS9DdEU3VExmd0dY?=
 =?utf-8?B?UnlEOTdjSVdiU2YxN1dseGkybTNYdFYxRUZkZHpGRW43UzRualRqOHgwc1p0?=
 =?utf-8?B?enBHSlJ6Q3FKUlN6SGl6SjgvTk5VOWJ5aTZlS2tPTnVESjd1M3pXMXNKTXhl?=
 =?utf-8?B?TFNQRUZZRGhKdmsyR09pWk5UTjVWYVBkU01EUnJxeW5oMzBXUzZ6cVlZMmFT?=
 =?utf-8?B?VENCalNmcHIzZVZuM1VBc3RVNUlSYk9lZkZmREt5NFl0NWJjVHJ2ZnJkaXFl?=
 =?utf-8?B?YWZoejc2c1VqUlY4a1VmZnBNWU44N0Q3V3VtdWJUVmoxM2dzZGhRV2FBZkhx?=
 =?utf-8?B?d1JEYzdsWVd6c3M3Qi9wSDV3QnJvSnVBVTVuM0JINXVBanhQQkx4eGtNWjFm?=
 =?utf-8?B?eXZsZDVUQldtUlhta2JKeldmVS9Zamx4WlJjSy9qS3hkRFkrUlRXQ2V6Rzlo?=
 =?utf-8?B?amFBd2pSTGliR0FxcFNLOEVrazA1RTdoemN4SmNSbFhGNEloK0JZQ1JsMGlw?=
 =?utf-8?B?Y1g3cFdNWmtLcGJ1ZDk0YmNWOHRYU1c3aUJySTdwMCtPK0doM1p5cWYyZHlK?=
 =?utf-8?B?T2huZXQvSHA5NUpuN1QrdWNwVVpRVGYzcUJ1S1VLaFBLT3k4TzJGcU1TM1NG?=
 =?utf-8?Q?UWUblDsUI+ArumM/HGhI4SWGV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee21aed-b8c1-4cfe-c2d4-08da7f44a64e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 05:03:25.4947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XY+Sm6bIa2CsK+MzcEOXjtz8YUk9YR2iUCAZwjYZcNJsd4W0oIzErBtnbrj0WSMaqqWdQeegzrhH/ywhWTi0Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7342
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
Cc: alexander.deucher@amd.com, luben.tuikov@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/15/2022 4:35 PM, Christian König wrote:
> Am 12.08.22 um 15:30 schrieb Arunpravin Paneer Selvam:
>> We are adding two new callbacks to ttm resource manager
>> function to handle intersection and compatibility of
>> placement and resources.
>>
>> v2: move the amdgpu and ttm_range_manager changes to
>>      separate patches (Christian)
>> v3: rename "intersect" to "intersects" (Matthew)
>> v4: move !place check to the !res if and return false
>>      in ttm_resource_compatible() function (Christian)
>> v5: move bits of code from patch number 6 to avoid
>>      temporary driver breakup (Christian)
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>
> Patch #6 could still be cleaned up more now that we have the 
> workaround code in patch #1, but that not really a must have.
>
> Reviewed-by: Christian König <christian.koenig@amd.com> for the entire 
> series.
>
> Do you already have commit rights?

Hi Christian,
I applied for drm-misc commit rights, waiting for the project 
maintainers to approve my request.

Thanks,
Arun
>
> Regards,
> Christian.
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c       |  9 ++--
>>   drivers/gpu/drm/ttm/ttm_resource.c | 77 +++++++++++++++++++++++++++++-
>>   include/drm/ttm/ttm_resource.h     | 40 ++++++++++++++++
>>   3 files changed, 119 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index c1bd006a5525..f066e8124c50 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -518,6 +518,9 @@ static int ttm_bo_evict(struct ttm_buffer_object 
>> *bo,
>>   bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>                     const struct ttm_place *place)
>>   {
>> +    struct ttm_resource *res = bo->resource;
>> +    struct ttm_device *bdev = bo->bdev;
>> +
>>       dma_resv_assert_held(bo->base.resv);
>>       if (bo->resource->mem_type == TTM_PL_SYSTEM)
>>           return true;
>> @@ -525,11 +528,7 @@ bool ttm_bo_eviction_valuable(struct 
>> ttm_buffer_object *bo,
>>       /* Don't evict this BO if it's outside of the
>>        * requested placement range
>>        */
>> -    if (place->fpfn >= (bo->resource->start + 
>> bo->resource->num_pages) ||
>> -        (place->lpfn && place->lpfn <= bo->resource->start))
>> -        return false;
>> -
>> -    return true;
>> +    return ttm_resource_intersects(bdev, res, place, bo->base.size);
>>   }
>>   EXPORT_SYMBOL(ttm_bo_eviction_valuable);
>>   diff --git a/drivers/gpu/drm/ttm/ttm_resource.c 
>> b/drivers/gpu/drm/ttm/ttm_resource.c
>> index 20f9adcc3235..0d1f862a582b 100644
>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>> @@ -253,10 +253,84 @@ void ttm_resource_free(struct ttm_buffer_object 
>> *bo, struct ttm_resource **res)
>>   }
>>   EXPORT_SYMBOL(ttm_resource_free);
>>   +/**
>> + * ttm_resource_intersects - test for intersection
>> + *
>> + * @bdev: TTM device structure
>> + * @res: The resource to test
>> + * @place: The placement to test
>> + * @size: How many bytes the new allocation needs.
>> + *
>> + * Test if @res intersects with @place and @size. Used for testing 
>> if evictions
>> + * are valueable or not.
>> + *
>> + * Returns true if the res placement intersects with @place and @size.
>> + */
>> +bool ttm_resource_intersects(struct ttm_device *bdev,
>> +                 struct ttm_resource *res,
>> +                 const struct ttm_place *place,
>> +                 size_t size)
>> +{
>> +    struct ttm_resource_manager *man;
>> +
>> +    if (!res)
>> +        return false;
>> +
>> +    if (!place)
>> +        return true;
>> +
>> +    man = ttm_manager_type(bdev, res->mem_type);
>> +    if (!man->func->intersects) {
>> +        if (place->fpfn >= (res->start + res->num_pages) ||
>> +            (place->lpfn && place->lpfn <= res->start))
>> +            return false;
>> +
>> +        return true;
>> +    }
>> +
>> +    return man->func->intersects(man, res, place, size);
>> +}
>> +
>> +/**
>> + * ttm_resource_compatible - test for compatibility
>> + *
>> + * @bdev: TTM device structure
>> + * @res: The resource to test
>> + * @place: The placement to test
>> + * @size: How many bytes the new allocation needs.
>> + *
>> + * Test if @res compatible with @place and @size.
>> + *
>> + * Returns true if the res placement compatible with @place and @size.
>> + */
>> +bool ttm_resource_compatible(struct ttm_device *bdev,
>> +                 struct ttm_resource *res,
>> +                 const struct ttm_place *place,
>> +                 size_t size)
>> +{
>> +    struct ttm_resource_manager *man;
>> +
>> +    if (!res || !place)
>> +        return false;
>> +
>> +    man = ttm_manager_type(bdev, res->mem_type);
>> +    if (!man->func->compatible) {
>> +        if (res->start < place->fpfn ||
>> +            (place->lpfn && (res->start + res->num_pages) > 
>> place->lpfn))
>> +            return false;
>> +
>> +        return true;
>> +    }
>> +
>> +    return man->func->compatible(man, res, place, size);
>> +}
>> +
>>   static bool ttm_resource_places_compat(struct ttm_resource *res,
>>                          const struct ttm_place *places,
>>                          unsigned num_placement)
>>   {
>> +    struct ttm_buffer_object *bo = res->bo;
>> +    struct ttm_device *bdev = bo->bdev;
>>       unsigned i;
>>         if (res->placement & TTM_PL_FLAG_TEMPORARY)
>> @@ -265,8 +339,7 @@ static bool ttm_resource_places_compat(struct 
>> ttm_resource *res,
>>       for (i = 0; i < num_placement; i++) {
>>           const struct ttm_place *heap = &places[i];
>>   -        if (res->start < heap->fpfn || (heap->lpfn &&
>> -            (res->start + res->num_pages) > heap->lpfn))
>> +        if (!ttm_resource_compatible(bdev, res, heap, bo->base.size))
>>               continue;
>>             if ((res->mem_type == heap->mem_type) &&
>> diff --git a/include/drm/ttm/ttm_resource.h 
>> b/include/drm/ttm/ttm_resource.h
>> index ca89a48c2460..5afc6d664fde 100644
>> --- a/include/drm/ttm/ttm_resource.h
>> +++ b/include/drm/ttm/ttm_resource.h
>> @@ -88,6 +88,38 @@ struct ttm_resource_manager_func {
>>       void (*free)(struct ttm_resource_manager *man,
>>                struct ttm_resource *res);
>>   +    /**
>> +     * struct ttm_resource_manager_func member intersects
>> +     *
>> +     * @man: Pointer to a memory type manager.
>> +     * @res: Pointer to a struct ttm_resource to be checked.
>> +     * @place: Placement to check against.
>> +     * @size: Size of the check.
>> +     *
>> +     * Test if @res intersects with @place + @size. Used to judge if
>> +     * evictions are valueable or not.
>> +     */
>> +    bool (*intersects)(struct ttm_resource_manager *man,
>> +               struct ttm_resource *res,
>> +               const struct ttm_place *place,
>> +               size_t size);
>> +
>> +    /**
>> +     * struct ttm_resource_manager_func member compatible
>> +     *
>> +     * @man: Pointer to a memory type manager.
>> +     * @res: Pointer to a struct ttm_resource to be checked.
>> +     * @place: Placement to check against.
>> +     * @size: Size of the check.
>> +     *
>> +     * Test if @res compatible with @place + @size. Used to check of
>> +     * the need to move the backing store or not.
>> +     */
>> +    bool (*compatible)(struct ttm_resource_manager *man,
>> +               struct ttm_resource *res,
>> +               const struct ttm_place *place,
>> +               size_t size);
>> +
>>       /**
>>        * struct ttm_resource_manager_func member debug
>>        *
>> @@ -329,6 +361,14 @@ int ttm_resource_alloc(struct ttm_buffer_object 
>> *bo,
>>                  const struct ttm_place *place,
>>                  struct ttm_resource **res);
>>   void ttm_resource_free(struct ttm_buffer_object *bo, struct 
>> ttm_resource **res);
>> +bool ttm_resource_intersects(struct ttm_device *bdev,
>> +                 struct ttm_resource *res,
>> +                 const struct ttm_place *place,
>> +                 size_t size);
>> +bool ttm_resource_compatible(struct ttm_device *bdev,
>> +                 struct ttm_resource *res,
>> +                 const struct ttm_place *place,
>> +                 size_t size);
>>   bool ttm_resource_compat(struct ttm_resource *res,
>>                struct ttm_placement *placement);
>>   void ttm_resource_set_bo(struct ttm_resource *res,
>>
>> base-commit: 730c2bf4ad395acf0aa0820535fdb8ea6abe5df1
>

