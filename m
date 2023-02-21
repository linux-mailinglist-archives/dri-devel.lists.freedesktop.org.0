Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6273969E492
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 17:27:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8244810E874;
	Tue, 21 Feb 2023 16:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA8B10E874;
 Tue, 21 Feb 2023 16:27:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekbIPORR1IUeiwijpneFYI4b+hf8VmGvfCPDdWq/Dp7MoZCpz2qy2GEyg6bjrwom/B9HamHBrJ1L2x8po5kYTMwkvI7cml69JbZEf68BS/hVRis1rTlTZBjFDv+I/+I9Jahocl7V3zEYGEWfZvttR3SIW+mL9miVCByDnUZEY3+PpzWHxUVDoMXT6dssY8MdbNxz4gI2f485Y7dwopvGe62bnin1rImCOGD25l1w6DHYEvaTNGIwE2GS01ycChBky8VnEuWFvqvGhIDU+oqppygOWbZyOTjdH10s0/8l6yGA16XCdhR6p9VnY93UJeM9Un5G09CUK/K25mNKsnuHdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYbipgBjPVJlkehmXFpIAVcdbbw4pdwQKn86dGBIXAI=;
 b=NosX8EtWMYa1hW+6iBB3EHZO7FWavArJlLJxcHfj9/3w6EReLHmSIyUBoLTOkwSdXvYuNJcK6XNYLG0IUJnawVz70ryeUNgOVTUWJw309XzOQIxR4B4AR1J6OVnFcnhY4IrWwWHALKgHoYQj0IEumpGCbQYb9MLvtGutsLwZ/K2nnUzEuwK6Ata1IliszMbQIP3IPbj4vo2b1KADYxdIKGp8amKGBxsOWvbDqMbciC+oqPeQFbrAEiCtLvcUKqtXKpsATC/e+vP8Am6c7jgWW696eugu9Qp5wFdgeoofcZBQ0E4wuvoyJFf1hhDNO5F4Bq7pr54wRcMrC+LoGMlXMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYbipgBjPVJlkehmXFpIAVcdbbw4pdwQKn86dGBIXAI=;
 b=fSlvmVmhSNJ/2IvRlqxYYodURnBsZSbJYBJYqpz3l47lh5SU1Fm3xSAs1aY8rHR0Ozgqiaj0VoFrtwv/BDsz3AqlniEVr6pSuGTPP8thfA+ctcX47H5IjgDSXCws1WrMWFJe8PyAJTJraAocxXzXRsQav/S+4pnKaLclCSLQdrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL3PR12MB6572.namprd12.prod.outlook.com (2603:10b6:208:38f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Tue, 21 Feb
 2023 16:27:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 16:27:14 +0000
Message-ID: <1250fbf2-5bed-e7e3-7eac-56183b25f08d@amd.com>
Date: Tue, 21 Feb 2023 17:27:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] drm/gem-vram: handle NULL bo->resource in move
 callback
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230208145319.397235-1-matthew.auld@intel.com>
 <03b9cbee-e453-255b-923c-6b116b9e2cf1@amd.com>
 <bc166bdc-6f2f-d3a8-5496-e4af6fcc51ae@intel.com>
 <4fb0f24e-d8e7-5482-aa76-07c781d57ffe@amd.com>
 <e667ed26-ce67-56e4-c4ae-ea005a081624@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <e667ed26-ce67-56e4-c4ae-ea005a081624@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL3PR12MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dec40f4-41be-443c-d36c-08db14287dc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 33zHIcBLVJZHa1ImTzXNtej+dDKzDVo/tVbk/pbY/7795tuy4axnUhPO5tefFFzERMknduhjY1sgOmD7BjT+yBAxGC5XNuSw5l2Zqn6OEzGoFNr4PNHJczLrhRU1HOiJlnQGnFBzAa6nHGHed9psg5k4p5F1FztnJm6Tu7feHL1pP7nxuok/IOz4mfkOuGuFnBU8o8LKKUXWEfm2NeK3JkafEO22aWYuzFC1eL02nUpmAkGzr0MLJfceGDRD4Ha3fgz42BU3CoOn3OwBrB8vayXx5noyhBcrr5ZhRqCj6XbUyNpRULw/Iujbc2wqWWmkLS1mUKIaMb9at1q6Rt6QE9uyq/9LJR49MNNTy0V01jp2vUNzjL5GxJlzsQFrdhjTinY/RwVZ1JpTWDH5Nvglzp6H/sScu74unQx04C6QD8y5o9EJVqI766EqG7di2L8W0m1iTDCaGmZKsoUstFnqwltJUGsj8tno4GVkh9rAdyxddIvU61rZfBah+SK1h5xVVzcFk3vjpGxkcoI42JpZR6NVYjgO1yLRBvbePfZMsw2M1EXCKzcvlOWLSNG8H8kjoaif/iq2d1cKNfnYUz306b5jgJpaacqCIlOKNUcOpA4ePYpzTkZ+npEKb1k6i6wZ4tJ/BYMbpxcu45gnhwpXE8vjXkzVeouobu2F81B0oWBTykGyEoMa78cJLA0OJK8XFplL/WPRciAtKQI+WtGl/gUKBu+x5pH5AARx/8anQ4M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(84040400005)(451199018)(6486002)(38100700002)(83380400001)(31696002)(86362001)(66574015)(6506007)(6666004)(36756003)(2616005)(6512007)(186003)(53546011)(478600001)(41300700001)(5660300002)(316002)(31686004)(66476007)(4326008)(2906002)(8936002)(66556008)(66946007)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2t2b01NQ05CUjBsd2NDcnB1eFkzbmJwbFBkVnhrb2NldGVOMGJET2FJYjFD?=
 =?utf-8?B?REJMTzhrTUZFQStJUEFkanFCWnkwdDRYa042Z3krZTdkZjBQMElLZkVmcUV4?=
 =?utf-8?B?REp2L2h6T041UGFyQXpJQ0dNQ243SE5XOUMxYUlTeGxTT0VDWllmRjdvQ1RZ?=
 =?utf-8?B?d09FMXl5azI4dkRiaFlqUFpEUXh0TWE1YzJmYU9iQzlKR2FUN3VMdU0vczVs?=
 =?utf-8?B?dUFRUGtpYStJdXdmU01ScGw0MnBLaG9aWk43VEJxajZONUZHM3crb1M0b1dj?=
 =?utf-8?B?Y3hxcFpaQzk0SklQL3M4L3M0MXlESFc1RjBMMGdTS2hyazNScmlHSHQ0OTRZ?=
 =?utf-8?B?amw1c1hqLytVcEdjdmRtN08rQ3ZyZ0E1Z3B3ZEcrTEJhU2JQdTFwUnZCdm5o?=
 =?utf-8?B?OFVLUGxqbUdSYzNsNW5sVms0cmJ6Y0ZhUkpaNVZ1d1VtaHFFZW5uTjNJY3Rk?=
 =?utf-8?B?YkI3OVpSRTdGQVljNnlGTE5LT3pDeVYwRVl6RFhpR3Jwb2VvRHBUa0RUSVVB?=
 =?utf-8?B?TkxJaE16aCsycXZUY2g5REdiUUxXR1B1Vi9BZ1ZhOWF5QWxpVjEzaFgza2JH?=
 =?utf-8?B?bFdncUl1Q2Y4TC9PTFNyak9KUStkbDNiZnZUamRHOFc1ajFzL25GVVFxbk9X?=
 =?utf-8?B?Nnd0ZGlqNUV3cGxQME10M0NrSnBVMFlPMUZwNS9SY1Nvb1liNlNiM25LSCtp?=
 =?utf-8?B?eFcrN2pDdGQrblBOb29sNVlhaThMR044Q1lnTlYrNTR2ZnE2aW94ZDYyY2Z2?=
 =?utf-8?B?YlhMVmdEMXJ4bVcwcXdLV1Q2UW85NWRSdC92TDI1aVFqWjdMeTFXaXZMVjd3?=
 =?utf-8?B?aFpIcHJpaEV3NEpjR0NtQnRsUlU0Z3BLVG51UFUwYmJQcEszZ0pnd3U5aHRy?=
 =?utf-8?B?WkRKYlNwaTI3NUVuSllabmlXZkFGQXFsOXdyZjFGdlc3UHNqSmpBb2dnZ2JR?=
 =?utf-8?B?UDh0VHpaSWZLOTRvdENYRG1rVk5GOU9QaXd0ZXE5SnhCSHFZSVRLamxIZlVh?=
 =?utf-8?B?RmErWlVrSTRzd2dxUTN4Nk8zSEVzRXh6QkkyYTdXK2NrT2JXS3VxaG16aGo3?=
 =?utf-8?B?SVZWVWN2WWJJN3lUYmFmVjBwQWxsRU1ieDVnSTd1S1hXNjNvdWVQTnoxUWJ2?=
 =?utf-8?B?cWJZWURKLzZWaVd6RWJSMzlGSVVzaVNWVkFXYXlqY00xQi9nSTN1cGhVcnF5?=
 =?utf-8?B?ZXdGZzlYNFdpRm0zcDY0YUZTQ2t0VlM1TEJKVEc4MkoyeFlFQWtmZHA5S0do?=
 =?utf-8?B?bjNsS0NzWjFaTVFielRHQ1p1RXR1dG83QiszSFVpb0VZK1VOZ3d2SzhqMzV1?=
 =?utf-8?B?Q21DNktxai9YM3JReTNDL3JyNjYyaldzSTFXTm85QUkvWGhNbWpHMVdnbU1R?=
 =?utf-8?B?bXIyLzkrZHRsNmRzZktiSm1HVENIYWZRSzZicTVhTE1XUE1Oem9WQ1VNdXdk?=
 =?utf-8?B?ME1mNm83OEppSExZcU1kRkoxRFYxTVZKV0tCMWp6MlFBYzhKVzc4MHA5VDB0?=
 =?utf-8?B?RUl6N3Nxays2WEl2Y2x3Q25GU2RpQ1lVS0lCbzRuWW5LaWdON0Y4Zi9kMHFy?=
 =?utf-8?B?cURVTmdFeE1yelFOd0FsMndTdUo4R0lKUFNhQjZYeW4rN3NQV2c3amJsWU85?=
 =?utf-8?B?aFFTRGsrdndremZScVBPWUhEOVFocUxkeGRMNHhETEhJNzZ5VWZxWk1jZDli?=
 =?utf-8?B?eU1iVWh2OXFmR1Y0TlMwUytSRHpvRno3eVVBdmJ2czdaaUpkM2pQQ05CSW52?=
 =?utf-8?B?dGEwTnNXbnBtQS8wYllhdkxqc25LVXBnQnFXSytKSmdqbCtKVTZmQjhQbzI4?=
 =?utf-8?B?OVFOZDFNS1JWRlRqaFZDMkdSTDYyblptaXMvVmlxdzFiRlpiWU5ML0VCYTFi?=
 =?utf-8?B?QlFVR0hmcldyZjNpQTk1Rk5URndIMlc5bWp1V00rUk1kWm5HTHFyV2R6NWpT?=
 =?utf-8?B?a015UXpjbllhbTBjV3JBN2xyMlhYWGxFTjNtcCszdWJIWlJIUG92OW9yTVZJ?=
 =?utf-8?B?NTI1OFJvd1dwU1lQeDZGWVZnRVFCOHpHMFNndm8vTDJHMmZ0SUFlV08vQks5?=
 =?utf-8?B?KzludE44dExpUnFWL01zOTJhNWloeDRVcUlLbU5zYmFoS011S3RRT0Y2TEJN?=
 =?utf-8?B?N00vQ1ZsYWl4SU5XbDA0K0FxbDQwdFNMZC9VamVxbklSM3ZuS1B6cU1XQ21m?=
 =?utf-8?Q?HmEYG/dfqqbZBkIlTG5gBmWfUMnWqi/FCxm5jhiGGBFG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dec40f4-41be-443c-d36c-08db14287dc2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 16:27:14.5787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ysvwEK6aIAJIX8sZZgOd8U2vvs5fY8+bTFzTZ7dzt7v/uvHAhohFYsprcliqLmRi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6572
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

Am 21.02.23 um 17:26 schrieb Matthew Auld:
> On 21/02/2023 16:17, Christian König wrote:
>> Am 21.02.23 um 17:13 schrieb Matthew Auld:
>>> On 10/02/2023 11:03, Christian König wrote:
>>>> Am 08.02.23 um 15:53 schrieb Matthew Auld:
>>>>> The ttm BO now initially has NULL bo->resource, and leaves the driver
>>>>> the handle that. However it looks like we forgot to handle that for
>>>>> ttm_bo_move_memcpy() users, like with vram-gem, since it just 
>>>>> silently
>>>>> returns zero. This seems to then trigger warnings like:
>>>>>
>>>>> WARNING: CPU: 0 PID: 1 at 
>>>>> drivers/gpu/drm/drm_gem_vram_helper.c:255 drm_gem_vram_offset (??:?)
>>>>>
>>>>> Fix this by calling move_null() if the new resource is TTM_PL_SYSTEM,
>>>>> otherwise do the multi-hop sequence to ensure can safely call into
>>>>> ttm_bo_move_memcpy(), since it might also need to clear the memory.
>>>>> This should give the same behaviour as before.
>>>>>
>>>>> While we are here let's also treat calling ttm_bo_move_memcpy() with
>>>>> NULL bo->resource as programmer error, where expectation is that 
>>>>> upper
>>>>> layers should now handle it.
>>>>>
>>>>> Fixes: 180253782038 ("drm/ttm: stop allocating dummy resources 
>>>>> during BO creation")
>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>
>>>> Oh, I wasn't aware that this broke at so many places. Especially 
>>>> radeon was tested earlier in the development of the patch set.
>>>>
>>>> Thanks for looking into that, the radeon patch has my rb and the 
>>>> rest of the series is Acked-by: Christian König 
>>>> <christian.koenig@amd.com>.
>>>
>>> Should we go ahead and land this? (minus patch 3 since that is 
>>> already fixed by vmware folks).
>>
>> Yeah, sure go ahead.
>
> I assume this has to go via some drm-misc type tree, for which I don't 
> currently have commit rights. Can you help with merging this?

Sure, going to push the series tomorrow.

Thanks,
Christian.

>
>>
>> Thanks,
>> Christian.
>>
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> ---
>>>>>   drivers/gpu/drm/drm_gem_vram_helper.c | 11 +++++++++++
>>>>>   drivers/gpu/drm/ttm/ttm_bo_util.c     |  4 ++--
>>>>>   2 files changed, 13 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c 
>>>>> b/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>> index d40b3edb52d0..0bea3df2a16d 100644
>>>>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>>>>> @@ -916,6 +916,17 @@ static int bo_driver_move(struct 
>>>>> ttm_buffer_object *bo,
>>>>>   {
>>>>>       struct drm_gem_vram_object *gbo;
>>>>> +    if (!bo->resource) {
>>>>> +        if (new_mem->mem_type != TTM_PL_SYSTEM) {
>>>>> +            hop->mem_type = TTM_PL_SYSTEM;
>>>>> +            hop->flags = TTM_PL_FLAG_TEMPORARY;
>>>>> +            return -EMULTIHOP;
>>>>> +        }
>>>>> +
>>>>> +        ttm_bo_move_null(bo, new_mem);
>>>>> +        return 0;
>>>>> +    }
>>>>> +
>>>>>       gbo = drm_gem_vram_of_bo(bo);
>>>>>       return drm_gem_vram_bo_driver_move(gbo, evict, ctx, new_mem);
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c 
>>>>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>>> index d9d2b0903b22..fd9fd3d15101 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>>> @@ -157,8 +157,8 @@ int ttm_bo_move_memcpy(struct 
>>>>> ttm_buffer_object *bo,
>>>>>       bool clear;
>>>>>       int ret = 0;
>>>>> -    if (!src_mem)
>>>>> -        return 0;
>>>>> +    if (WARN_ON(!src_mem))
>>>>> +        return -EINVAL;
>>>>>       src_man = ttm_manager_type(bdev, src_mem->mem_type);
>>>>>       if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
>>>>
>>

