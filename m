Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F384DCE82
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 20:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F93310E6D2;
	Thu, 17 Mar 2022 19:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD2B10E6D2;
 Thu, 17 Mar 2022 19:11:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwKSoL5bdYJ7cxwUpRmhdgUBepAwfqtmiQmjEhhkic5GaIKFH3JAssqtwUVlj5aKBDRUQpG8BAQrt4lgdYsqtVZn5XPXkXaTzFteNOdV2B1qf+lMk3Gb9SEAznFfWeAuyg9MgFdBj/D3hXJQB2msy4mkrIZ1ZszPoVp7LquDJYkLzL5NvOikv61dgmnS4exoz4wU9x37uEiCT8fWlo/YTj25+I6tvi8b936FPF9g5UZJVrzOw8ykMBnGZ5RKXUPu+wsNJVwgSmwGr9s8WGJx8sv2zm0q6J6391Me8Y2QrJiQ7wlenZmHWm6A9+vQJFVDkwZzUNzzKqAEfbobWMp5bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vW3XCLQd4simJm4VWv3fLHQWQdX6Px0vplvjV1f+s1Y=;
 b=NUsYVQ9bLLSjs94qVvMC1HO4jOuRe7RtduZ+elwok9WQ49KHKpzubvBGP/drmwgMP4Utgh+P1SNAIkRi3nzzOciDfF9dyBDeCKzGIgC9zMZA6orVVOkcCxIFa5DqSzbdj9bP8Vl5sa2z6qV8uOXuLo3zYEpkqzDgWZCdoTcgrby44fyjv3+4X7BfVwNFw+ON0tL2L+DnPcWX+7FWs+0ump+TtCzefT4w7Cr9NbqE+GOffib+Lsrxg4E39wyzfOyDtRCz6IN9b7LxcScpAiVZU9oDLuzaA5upd+skjK3zxT+zTsUDRfU1V6ARSDYDBz2ZqmB7S6w54kxbNxTTmouPTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vW3XCLQd4simJm4VWv3fLHQWQdX6Px0vplvjV1f+s1Y=;
 b=NcWNAAFsaGLy2zEItS52PML4ImIBFvekSnDjToJm/5GVeojqchxiuJO0vFB2S+LtE0fQaSKTeV6Kuu8Ukv2wItfJdeVTVavyBWnFRU9Uwx6D8BhafKd2yTz8dlrcMBdrW1rfKc/a5fOCuTJ1I9inXfslXfQxXHYUa9tcGQpNJuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH7PR12MB5687.namprd12.prod.outlook.com (2603:10b6:510:13e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 17 Mar
 2022 19:11:38 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5%4]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 19:11:38 +0000
Message-ID: <f9f2bbdb-74bc-e286-07d6-4f1972f0e743@amd.com>
Date: Thu, 17 Mar 2022 15:11:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 1/4] drm/amdkfd: Improve amdgpu_vm_handle_moved
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20220317002006.342457-1-Felix.Kuehling@amd.com>
 <20220317002006.342457-2-Felix.Kuehling@amd.com>
 <5054ada1-9f2d-1297-5f37-0b05ec2ae37f@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <5054ada1-9f2d-1297-5f37-0b05ec2ae37f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0078.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::9) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7779fcd1-002b-464c-c322-08da0849f61f
X-MS-TrafficTypeDiagnostic: PH7PR12MB5687:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB56873FA3CC4FA626A99AE6D892129@PH7PR12MB5687.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ecjwkMSSa9q0rkCS/YiOUcTONKZOTq0AOhs25of/dYRqY78cb0YhdyMrH6sa9gTsauVv2jNVFd++lGJunsnff3/UlUDAwAm+09UrbmiRb6oP9H0lWbQNjiSQWUK0qUq3fBAE6tlXu92hWS3/p1zOht1fLh5+1s83x2cZq/zNUV2wNCxHPgjLsJpnNvWoqoJMwE6WeYm6VG8YqX0SvspQjXATh1VDNF2MEUiRjKmUQQgZE95ufj3Rl9BkAjkCJwNyfUU8lE9A4onxGoukXc3bIh9oGS7G1PhHG6VREyxE5nB86ATk3untv8CvHALbsuqqJswS0Rs/8WI/I4kjqJ37h3yauVS1yVhtMZqQimbyJxwmp6Vwks9GKVOfz8fRsdzk55EgdUjz9RW/GnL9H2g3dMGKVhuxVkVzk+I3RQaGwPhx26q0QRR/64PptaV1N8eXnD/o16o1RNi865BcbGC3im9tRmhd/ZWYcXiAtsxWMngOkCg0b+ATHgso1XSN7BHaC9QL6D5NSNgXzJDKmawAB3HLZcSq0aiCAT8bjscVcDw2kY41aHDsPmuCxhx4spXg+QqCteEg/E0yFapPQzyHd7Bf8qgwCceNg14cygYFt08e9zmcOOkwZIVbHQG8aw9UI9WPNL51sFc2DT5jEpFjxu0o8Ziu8yekmkyggznRUW2+um8l37kXb2K6gxZ/GQjz+3bi7wO0mITilv/mgdyBFpUnVhb5I2k3DZCDr7w+wmWCF5mjOWPL5BQsB3TAuM09
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(38100700002)(508600001)(86362001)(66476007)(31696002)(450100002)(6486002)(8936002)(316002)(4326008)(36756003)(66946007)(31686004)(8676002)(66556008)(2906002)(44832011)(2616005)(26005)(186003)(66574015)(5660300002)(6512007)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azU0T0JiQmtsd1RYZGhwQTlKRFlUTGNpUnNpTG9OclhOZmlGSmI1dW9URGJN?=
 =?utf-8?B?eVFKcXg1dEV5cTFwbHdGWjVQUnVldmpORmtoQk9OYTVrU094WWkzbXdWdU5z?=
 =?utf-8?B?VXNnd3RHNnFBMkFPU1ZMTUJOazBMZTM2aVQ4T25rcVNJYmI1YlBxOXkrZ0gw?=
 =?utf-8?B?dkpmWlpZR3BhaGQ2RUVkWFNwalcvL21kRi9UL09ucWFLbmtnVGp5WEowV1Jn?=
 =?utf-8?B?UkU5NjlRY1lFZ1NLeEwzbnNGN2UzSTdITVhIU1JaS29CeWx4bTZTMkp6OTRF?=
 =?utf-8?B?UnZSMVJtUlJXWHczNkpPUmt6RkRSM0JFL0U1VU1JaXVlYkQzZmxvMElvcmxH?=
 =?utf-8?B?U3QyRlpCWWdWOHhIcFczaFE3em5SVEtZd3hvdkhoSXgwZzVibDJmQjJmbkxH?=
 =?utf-8?B?SFkvQnpEeG10Q0lGVk5XTk9hQnVBc1JDMysvWFE2L3VFb3BNbXd6Ly9LSUZP?=
 =?utf-8?B?WTJ6endmS21Zb0EvVm5VTnc0a1Nlblc1WUxRN0wwb1pjQzNiakdXR3FrZnBU?=
 =?utf-8?B?YUI1QjEyWGZwcTBLeFdQMXFuOVg5OFJQOE9TZHUrclJZVXhRenVueVgvM1BK?=
 =?utf-8?B?WXZIc2FUR0RiQjZ2SXVxVEx2MjZzWVpieHJzKzVOdHBSZTdMZDhjSlMvMXBP?=
 =?utf-8?B?am9FQTEwRXJLOU8yd09VSjdCalBYTTVxcUovSHA0MzFvWTQ1bmpXbkVHcDdz?=
 =?utf-8?B?dU1mQ0ZvYk80bU96aEtycVlkRm1tbW5FY0VmdHg1SXM2cGFneEw3U3J4cTJa?=
 =?utf-8?B?RWJXWGpQR3h0eTNubmxsL0lTRG9WdzJrK3VCdnBqYUw0R2VSbVA3c1hhUWlv?=
 =?utf-8?B?VXdvZXFhcmJ4TTZqUE9JYnI1R0JVdGJMazdRU0tEZDEyN1Y5N0tRZ2M3bmNK?=
 =?utf-8?B?S2xVTHc3NXhTQTFYUjBmc0k3dUZmQUpUOERJY2RwNlZmcTVsblQ4ek9YdFkz?=
 =?utf-8?B?dU9TbkE3MTh4MjVwVmx5N1psVUJnQURZSjJQaXpYYWtSOEdpYVdjdE5zUHAz?=
 =?utf-8?B?ejI1dXFwemxnU3ZLQVF5anpyclhqRi9qZkdMUnc4Z3I3Q2xKRmJoaG84eHdk?=
 =?utf-8?B?akNVVldMb3RFZ0Zld3lqWWNLMWZzYkozdDRmbWIwUXlNVjBQMmJiYldURWJj?=
 =?utf-8?B?TXdldmNkeGt6TEM3anZMWmVzUGF6cUVZNU56UVo0K256M1VYRmVzTW91eEF6?=
 =?utf-8?B?ekhRVVFCSEM2clZMVm5hN0hmZlRrUFNCek5VVWtKMzBRdG5VM1R4UHpTbHRl?=
 =?utf-8?B?L0xzSEEreTFuTlV4bG41MXNYQWxoaEdYY1BxZnNvUDhleGpVWGNTOThWb21Y?=
 =?utf-8?B?SXU2dGpxMEM3aGMvSXlxT0JtRE02anErTFl1clI1dVFDOEJ4cTNBeE9Ra24r?=
 =?utf-8?B?aS9sdlU3VzFJUGo4QTcyaXVRNlpHbFJ6S0RXMmRxUzQ3M2RMdFhkT0dyZG9D?=
 =?utf-8?B?YXROaDRHQUZNTzVZRDBaZjUzTmVpSi9pU1p2OEQwazhwc040Z25UQ1NiMkU5?=
 =?utf-8?B?SDZOeVM1WnJmalJCZFcwdFJPRWZqRDRlc3g4Y24zRUE3M0NYUzlGZXZ5eVBS?=
 =?utf-8?B?ZFl0MkZpMFo2QkFQTm9ROFBHS2V1ZUhIYU9WcGt4cmU5aHZpOW5JZEM0ODRF?=
 =?utf-8?B?RE45dFZVc0VPVFp2dTdyalMrbEVxNldjQ2ZpVTVCR0VpREJZVG5OV2Vyemli?=
 =?utf-8?B?WkFldG9USFVITlUrYlMrTXRvZERwR0RVTDdobUNkNHRjdk9UUzV0ZlpKKzBo?=
 =?utf-8?B?K1oya2RzM2ZkWXZkR1hocmRlY2tvblZJcTV1SGpadUcvbnliS3JqTWw2Uloz?=
 =?utf-8?B?WDNJcnlZQkZvb1B3RngrK3NNbktWZmtnSElsSzhHUlhXTGIyWC9KNGlsUzlW?=
 =?utf-8?B?WEtvUUo5TDZPaE1LNkRDMlc2THdsTzluY1pFWExXNGZWT0FjRkNTVWtTeUNF?=
 =?utf-8?Q?oSWMmIXOcodFLBpLOcJfgK+s55iO6InG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7779fcd1-002b-464c-c322-08da0849f61f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 19:11:38.3913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lz8tsD6OOopJ/y/O0wZC78QUqmA0SVZhYrBWO6D/bT6uwNKnYSVXkHsFOIvxj7V7ajsA+2AY2dPKy0/xW+sA4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5687
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


Am 2022-03-17 um 04:21 schrieb Christian König:
> Am 17.03.22 um 01:20 schrieb Felix Kuehling:
>> Let amdgpu_vm_handle_moved update all BO VA mappings of BOs reserved by
>> the caller. This will be useful for handling extra BO VA mappings in
>> KFD VMs that are managed through the render node API.
>
> Yes, that change is on my TODO list for quite a while as well.
>
>> TODO: This may also allow simplification of amdgpu_cs_vm_handling. See
>> the TODO comment in the code.
>
> No, that won't work just yet.
>
> We need to change the TLB flush detection for that, but I'm already 
> working on those as well.

Your TLB flushing patch series looks good to me.

There is one other issue, though. amdgpu_vm_handle_moved doesn't update 
the sync object, so I couldn't figure out I can wait for all the page 
table updates to finish.

Regards,
   Felix


>
>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>
> Please update the TODO, with that done: Reviewed-by: Christian König 
> <christian.koenig@amd.com>
>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |  6 +++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 18 +++++++++++++-----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  3 ++-
>>   4 files changed, 21 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index d162243d8e78..10941f0d8dde 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@ -826,6 +826,10 @@ static int amdgpu_cs_vm_handling(struct 
>> amdgpu_cs_parser *p)
>>               return r;
>>       }
>>   +    /* TODO: Is this loop still needed, or could this be handled by
>> +     * amdgpu_vm_handle_moved, now that it can handle all BOs that are
>> +     * reserved under p->ticket?
>> +     */
>>       amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>>           /* ignore duplicates */
>>           bo = ttm_to_amdgpu_bo(e->tv.bo);
>> @@ -845,7 +849,7 @@ static int amdgpu_cs_vm_handling(struct 
>> amdgpu_cs_parser *p)
>>               return r;
>>       }
>>   -    r = amdgpu_vm_handle_moved(adev, vm);
>> +    r = amdgpu_vm_handle_moved(adev, vm, &p->ticket);
>>       if (r)
>>           return r;
>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> index 579adfafe4d0..50805613c38c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>> @@ -414,7 +414,7 @@ amdgpu_dma_buf_move_notify(struct 
>> dma_buf_attachment *attach)
>>             r = amdgpu_vm_clear_freed(adev, vm, NULL);
>>           if (!r)
>> -            r = amdgpu_vm_handle_moved(adev, vm);
>> +            r = amdgpu_vm_handle_moved(adev, vm, ticket);
>>             if (r && r != -EBUSY)
>>               DRM_ERROR("Failed to invalidate VM page tables (%d))\n",
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> index fc4563cf2828..726b42c6d606 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> @@ -2190,11 +2190,12 @@ int amdgpu_vm_clear_freed(struct 
>> amdgpu_device *adev,
>>    * PTs have to be reserved!
>>    */
>>   int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
>> -               struct amdgpu_vm *vm)
>> +               struct amdgpu_vm *vm,
>> +               struct ww_acquire_ctx *ticket)
>>   {
>>       struct amdgpu_bo_va *bo_va, *tmp;
>>       struct dma_resv *resv;
>> -    bool clear;
>> +    bool clear, unlock;
>>       int r;
>>         list_for_each_entry_safe(bo_va, tmp, &vm->moved, 
>> base.vm_status) {
>> @@ -2212,17 +2213,24 @@ int amdgpu_vm_handle_moved(struct 
>> amdgpu_device *adev,
>>           spin_unlock(&vm->invalidated_lock);
>>             /* Try to reserve the BO to avoid clearing its ptes */
>> -        if (!amdgpu_vm_debug && dma_resv_trylock(resv))
>> +        if (!amdgpu_vm_debug && dma_resv_trylock(resv)) {
>>               clear = false;
>> +            unlock = true;
>> +        /* The caller is already holding the reservation lock */
>> +        } else if (ticket && dma_resv_locking_ctx(resv) == ticket) {
>> +            clear = false;
>> +            unlock = false;
>>           /* Somebody else is using the BO right now */
>> -        else
>> +        } else {
>>               clear = true;
>> +            unlock = false;
>> +        }
>>             r = amdgpu_vm_bo_update(adev, bo_va, clear, NULL);
>>           if (r)
>>               return r;
>>   -        if (!clear)
>> +        if (unlock)
>>               dma_resv_unlock(resv);
>>           spin_lock(&vm->invalidated_lock);
>>       }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> index a40a6a993bb0..120a76aaae75 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> @@ -396,7 +396,8 @@ int amdgpu_vm_clear_freed(struct amdgpu_device 
>> *adev,
>>                 struct amdgpu_vm *vm,
>>                 struct dma_fence **fence);
>>   int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
>> -               struct amdgpu_vm *vm);
>> +               struct amdgpu_vm *vm,
>> +               struct ww_acquire_ctx *ticket);
>>   int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
>>                   struct amdgpu_device *bo_adev,
>>                   struct amdgpu_vm *vm, bool immediate,
>
