Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE357FA169
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E68710E293;
	Mon, 27 Nov 2023 13:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A3310E293
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:53:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5aDj8nD5rG3DWBnBVkPsHKkzJSTn8+Ji5n8Ir/A/es5jMs19hJ8hgsRhPTV5RrQeXxCpO5kks5/y7Tu5UO3YZoqHt06sUzuXyYaEykLhoSRXjOTEwOV0hSxEOAYIhHrpkbhWHWPragg6cZ9xFt+ZcgsyyLkgpNaVUN8/nwgFuLOMHjHltLAFyUFJ4Qk0UShjPn2GrdIL8/Nxp+M4dlT5rq56sgwKIdR9X7hHnKBoM0VvbYMYae+morQxYznCgmljN5hVYsa/AHlVP9jYyiimfGvtEcoy8imBFWyrJADKLat5fGNZWIoB51H2vesAOfjqLSsVncbZ9lqEhBSgYiP1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bD3ddLFmXpoAuHUmcYxbnmU2hJRIUZGxn3Sk/7JLWlY=;
 b=Qk8hLjp/pJe26qZC7tp+1Rxfh2ljPBVxdl8+2BB2j6jqYhmLvQtmV+4UkWK4j/lYFG5IYrcx8VEObHrqO9+hBSD8WATV0PvnmXA4Uc9j886kABwkWy+vrl8zNMeShC+D4UVyaPqllrHR0Cx8fU4dcSnmyHs1sLoTsANyIOxdxhZS8MWCCjaSd7q1kgzPMUtF4Fxmp4zTdlQ8lCb5PyJ7llYdpDXTw5pjFGC/WpUDIG8pO68qsgRJbn/TOR856/svC5Tg9AxCRuU4KMSBNdU9L1r9Yn8Fpus/995PlkmDLqgp/FwyaUFQ4I83c6ZpUNxtVdE/WsKkFP2QjhioiyFBNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bD3ddLFmXpoAuHUmcYxbnmU2hJRIUZGxn3Sk/7JLWlY=;
 b=ZMqaUUwRPz+Qwt74Pz/BY1NXktsjJ/4ev/mndxZGFfk1+2eCcAZ6KwZe7qG72vYUnJ4uRqejovQ086KkkX6M/N6tT9fv+hNth8hcrZQfZTopSxoBTOTdYPIJ8TPqktU3gjg1cqGe9OaUS1O/SGq/fMDU4pPdPvLO4BTo2qXsgK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Mon, 27 Nov
 2023 13:52:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 13:52:56 +0000
Message-ID: <762bb5f4-f9f5-4ebc-84d3-5465df3ffbf6@amd.com>
Date: Mon, 27 Nov 2023 14:52:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next 4/5] drm/gpuvm: fall back to
 drm_exec_lock_obj()
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>
References: <20231124233650.152653-1-dakr@redhat.com>
 <20231124233650.152653-5-dakr@redhat.com>
 <3c7b7683-da36-4ffe-a250-91eef019499f@redhat.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3c7b7683-da36-4ffe-a250-91eef019499f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0291.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4390:EE_
X-MS-Office365-Filtering-Correlation-Id: 5175c31b-ccca-4586-585e-08dbef5028ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NSGwF48MJ9o733LEOGcjVman7SdHewQu+BSog1MGUblS/H2Q4jpfytTn6uYo95RlXQ5uFqEljHRiLNMH7AuapKOWBY4qQWMVO22xLFrPSGHIhSSkpLCy4ckzehfbmGpR07lEiVxWppvylOyiVKSrbFzczmBwzK468Pe+Lf3+XdLd6P8b0ynZhesIjv+etAULKxCxSqVNb6w1WKkf5Rba23cWH3kytOMzjbXfJcXYkwiSWaHFV2Fw6UbkDo4xk088XRtchzakCttQZwpkH7W5TMb18RBbQPYeXT8uebOtm9eRGZRqs+JBEJspXdY/2ESTjreC6B0/1CyzHfRB+5Lx9jhyq10ThPjY4eWEZRlJufFVGlEZq0cNpBrvI5KAPwrI04QHh62dD2bBPdjY4y6xPYwPILtncQoFZrcYydiCN2748NzfQMUd/JxCJZ/rGDObT28TbV4aMA7VWS7dVh2gQeE8exaLztkmDNNseAriQ9w/FNx3hN+NGa2hMrpA/yehhdSgrO0T3UuleD8ji/iwkv2skbgS+K1pqO78LcNnQVIPLz3KEq4iUZMiUj4guzNU6IiSYxRlsUQWl8wx+cjNtNSVaMJxd5beII8oSFpvAjI1uGKV4OFi7wivf0Lijf4d7QYP5mcz9ORNtC84Rov5htokpK4C42x/+kxWyyPvK/nq21zNbOjOftQieE1DyJrM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(366004)(376002)(396003)(230173577357003)(230922051799003)(230273577357003)(451199024)(64100799003)(1800799012)(186009)(31686004)(26005)(6486002)(2616005)(6506007)(53546011)(6666004)(478600001)(6512007)(38100700002)(86362001)(31696002)(36756003)(5660300002)(41300700001)(7416002)(2906002)(66946007)(66574015)(83380400001)(66556008)(316002)(6916009)(66476007)(4326008)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHlHSmVGemdRaGljWkwxTTBudjQvaTJjNUlDK0JmZkVIbDk4R3JRNkwzMStY?=
 =?utf-8?B?N1ZjWEVJYzdLWndSRTF5K1dHTlZyc1NLQ1NxMngzcGx6MjV4VktZQ3djKzR5?=
 =?utf-8?B?YjlWWWFQTEhpRllxOURObjIxR08xdjNDOTEzN0FzWE9QUjVpOEZIV2NMZDgr?=
 =?utf-8?B?UmdyWXk5Q1dUMno4SUR4S25IcVdsbU9jWkRqNjhlWGhRRGlkcGxTOGJGNGhL?=
 =?utf-8?B?cjlhZk9WZWQ5UUgrVWFiNTNBcStCSEI1NS9DS24rblNnWGFOQUlvTzJrT0dl?=
 =?utf-8?B?WWRiVy9QTXE2ZzhKUFVMU2w2Wkc0L0kvMnViZlVkcFk1aGI4bUJVanBRaUNU?=
 =?utf-8?B?NlFmWVVSaHNDVlZ3REplTTdUd2Zvd1c2WTU4OE5XbVRlSFNZTE5YUmVoNWF4?=
 =?utf-8?B?Z0JHdWlOMTFYNU1oTlhVYUt5YnVzakQvTDF0cjYwMHY0WFgySy9jcTljaTht?=
 =?utf-8?B?VUZpdGZBMitUODN6dXZwWVNObytRT1FlTUl5dXJ1bHFJWDdubFdDdlZpY01a?=
 =?utf-8?B?SUxsakc4RzArMGtYSWtHSkFqQUx4VGdpamJLOHZRWlFZMWF0ckpxNVhiSTQw?=
 =?utf-8?B?RWdHZkUreE91S1JWdk1FVjVGY0RxZVhBZStHakJYSTBNWXRMT1lLaWtROGRO?=
 =?utf-8?B?TzR0WnU5ZTZlUWorNEhJK3djMmNQeEtzRTRua251cXQvYWc1ZFVUWVl1b0c2?=
 =?utf-8?B?S2xwMzh6V0pRL0R6ODZ3TzBaaEt4eWpucW00bytPRG50aGc4RTRtMG0xMEdT?=
 =?utf-8?B?WHRWQXNoOTdmZnVPb0lma3ZDOXVBWmNDTzBVblQvNzZ4ZXlFV1ZvbjRONk90?=
 =?utf-8?B?N2NVUXJIUWJ1TjB0WTNadWtIeS94dmVaM3VrVFp2cFlkZFdhQWtUbmhTRjBO?=
 =?utf-8?B?bGwwZTBVaFV3ZU1CaFJ5d281blBJVmFZUjhqRHJ6ajNMU09STEdibGxIcDBO?=
 =?utf-8?B?VVRuQTM4ejVjUFJ2d3RUQlIvS2phTHNwcXk5TFJNdTN3TUFFMXlaY1FKcG1m?=
 =?utf-8?B?ZWp3NnUwVk1McUJLL0d3SjhUN0FHRk92R0RQMkxMeGR0S2RKSktKVDBWYVVV?=
 =?utf-8?B?eFpFbmlVVUhHZklnemtmbDlPS0YxSjBxMEpNeTcyRCs2aFYyZVF6Mk9PL05O?=
 =?utf-8?B?bnVETlJPWGFnd0t5V2RUTUtJVkdoZ09CekE1QWFCZ280M05KbXV0QUZHblBR?=
 =?utf-8?B?eVNWTEUwbGdTT29LUHRLWTNtYi9mNmxuUnkxbjZ0YWxyenJHWThyM0xBSjdZ?=
 =?utf-8?B?SHVnL2U5YzJDbHh5VkxsbXEwazN1anhIRFY5Tlhwb1FaSWpxb3BLc3UyeXNJ?=
 =?utf-8?B?eU1hb3RSNkFDcUJGUkFVR3ZwQkhKVmwvSmIyMXU5VVNGWG1FZkFSMkM5eEhJ?=
 =?utf-8?B?Mmg1K0NmWWJHSXhRV3ZSbUtFNmY4Z2plUUhpbWVPUVU3bVNQWjlSeVFNakpw?=
 =?utf-8?B?UEg2OG4vbWtVdGhLRWtWSHhVbyt3elkwRVMzK3ltYzdGbEtGZ3RkL1dJOS9q?=
 =?utf-8?B?ZXhZZWxjRUIyTE43cjF4SWZndWRRbTltWHlPSTRHMVEwM2FKRDduYk5LRHVj?=
 =?utf-8?B?dHBDVGgxd1B5cmZDUmZsemVJZjArbW1xTVcra1hNTm9lMlNVU0VOOHNJSFBw?=
 =?utf-8?B?bGlOSVExZE1oVFVoRWdGcXUzcWtkNGdKNm5jWVVXdVdVOWtnNWxYUDlkcmNs?=
 =?utf-8?B?bkdOVFlQelVyZXJVdkxGZ2l2dTNxWTVEd040RDh3TGlMWVREa1NHaTFkL3NR?=
 =?utf-8?B?RGg3dVJhV2dPV3lQWGt1UXR4U2RFTlZoV0xQVHlxaXUveUgxUWVmcitzWEVl?=
 =?utf-8?B?UjJJMjByaXFiejhMMDZFdVFvMmJqaXJTY0tMQWJOeDhpdWIzeTFHaGpXcExw?=
 =?utf-8?B?ZVBOa1BqMlJqazJEQ0wvS3NCY0c5OTZUM3RoYXNVOWtSbG5wZnJ0OW43SHBt?=
 =?utf-8?B?VVJuQUNoQ3J3U1dvTDVvY0NpRkdTVjFyQnQyZnVXRGVoV2FDbloybG1WcHVq?=
 =?utf-8?B?akdhQ2p1WUlYMWRMZ01aYXJUelNRU2hHelU1dElaMjlpSWltRmJVVHZPRWpD?=
 =?utf-8?B?N0ZWazczN2NDZVViOHgrbGtXVktCUjU1U01ISHJCaExvSXlyd0VJZ29HeHZl?=
 =?utf-8?Q?S/NdWurMLR6K5pH4PTY0UA911?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5175c31b-ccca-4586-585e-08dbef5028ad
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 13:52:56.4132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYG2vBXgQYqOz4EWQEyARcvWE0byHc1js4il6Bc9TMDGdePcg5Otms5GGA4qKxtp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
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
Cc: sarah.walker@imgtec.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mripard@kernel.org, matt.coster@imgtec.com,
 donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.11.23 um 00:40 schrieb Danilo Krummrich:
> Hi Christian,
>
> do you think it makes sense to handle this in drm_exec_prepare_obj() or
> even dma_resv_reserve_fences() even?

IIRC for drm_exec the discussion has gone a bit back and forth between 
handling 0 and having a separate function which doesn't allocate fences.

We ended up with the solution using separate calls since you either know 
that you don't need fences (because you for example only need to look 
something up) or you need fences and eventually calculate the number you 
need dynamically and if you then end up with 0 it's a bug.

So to sum it up the conclusion was that it's more defensive to complain 
about 0 fences to reserve (which reminds me that 
dma_resv_reserve_fences() still needs to get a warning for 0 fences as 
well).

Regards,
Christian.

>
> - Danilo
>
> On 11/25/23 00:36, Danilo Krummrich wrote:
>> Fall back to drm_exec_lock_obj() if num_fences is zero for the
>> drm_gpuvm_prepare_* function family.
>>
>> Otherwise dma_resv_reserve_fences() would actually allocate slots even
>> though num_fences is zero.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_gpuvm.c | 36 +++++++++++++++++++++++++++++++++---
>>   include/drm/drm_gpuvm.h     | 23 +++--------------------
>>   2 files changed, 36 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>> index 54f5e8851de5..d1d1c2379e44 100644
>> --- a/drivers/gpu/drm/drm_gpuvm.c
>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>> @@ -1085,6 +1085,36 @@ drm_gpuvm_put(struct drm_gpuvm *gpuvm)
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gpuvm_put);
>>   +static int
>> +exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
>> +         unsigned int num_fences)
>> +{
>> +    return num_fences ? drm_exec_prepare_obj(exec, obj, num_fences) :
>> +                drm_exec_lock_obj(exec, obj);
>> +}
>> +
>> +/**
>> + * drm_gpuvm_prepare_vm() - prepare the GPUVMs common dma-resv
>> + * @gpuvm: the &drm_gpuvm
>> + * @exec: the &drm_exec context
>> + * @num_fences: the amount of &dma_fences to reserve
>> + *
>> + * Calls drm_exec_prepare_obj() for the GPUVMs dummy &drm_gem_object.
>> + *
>> + * Using this function directly, it is the drivers responsibility to 
>> call
>> + * drm_exec_init() and drm_exec_fini() accordingly.
>> + *
>> + * Returns: 0 on success, negative error code on failure.
>> + */
>> +int
>> +drm_gpuvm_prepare_vm(struct drm_gpuvm *gpuvm,
>> +             struct drm_exec *exec,
>> +             unsigned int num_fences)
>> +{
>> +    return exec_prepare_obj(exec, gpuvm->r_obj, num_fences);
>> +}
>> +EXPORT_SYMBOL_GPL(drm_gpuvm_prepare_vm);
>> +
>>   static int
>>   __drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
>>                   struct drm_exec *exec,
>> @@ -1095,7 +1125,7 @@ __drm_gpuvm_prepare_objects(struct drm_gpuvm 
>> *gpuvm,
>>       int ret = 0;
>>         for_each_vm_bo_in_list(gpuvm, extobj, &extobjs, vm_bo) {
>> -        ret = drm_exec_prepare_obj(exec, vm_bo->obj, num_fences);
>> +        ret = exec_prepare_obj(exec, vm_bo->obj, num_fences);
>>           if (ret)
>>               break;
>>       }
>> @@ -1116,7 +1146,7 @@ drm_gpuvm_prepare_objects_locked(struct 
>> drm_gpuvm *gpuvm,
>>         drm_gpuvm_resv_assert_held(gpuvm);
>>       list_for_each_entry(vm_bo, &gpuvm->extobj.list, 
>> list.entry.extobj) {
>> -        ret = drm_exec_prepare_obj(exec, vm_bo->obj, num_fences);
>> +        ret = exec_prepare_obj(exec, vm_bo->obj, num_fences);
>>           if (ret)
>>               break;
>>   @@ -1186,7 +1216,7 @@ drm_gpuvm_prepare_range(struct drm_gpuvm 
>> *gpuvm, struct drm_exec *exec,
>>       drm_gpuvm_for_each_va_range(va, gpuvm, addr, end) {
>>           struct drm_gem_object *obj = va->gem.obj;
>>   -        ret = drm_exec_prepare_obj(exec, obj, num_fences);
>> +        ret = exec_prepare_obj(exec, obj, num_fences);
>>           if (ret)
>>               return ret;
>>       }
>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>> index f94fec9a8517..b3f82ec7fb17 100644
>> --- a/include/drm/drm_gpuvm.h
>> +++ b/include/drm/drm_gpuvm.h
>> @@ -544,26 +544,9 @@ struct drm_gpuvm_exec {
>>       } extra;
>>   };
>>   -/**
>> - * drm_gpuvm_prepare_vm() - prepare the GPUVMs common dma-resv
>> - * @gpuvm: the &drm_gpuvm
>> - * @exec: the &drm_exec context
>> - * @num_fences: the amount of &dma_fences to reserve
>> - *
>> - * Calls drm_exec_prepare_obj() for the GPUVMs dummy &drm_gem_object.
>> - *
>> - * Using this function directly, it is the drivers responsibility to 
>> call
>> - * drm_exec_init() and drm_exec_fini() accordingly.
>> - *
>> - * Returns: 0 on success, negative error code on failure.
>> - */
>> -static inline int
>> -drm_gpuvm_prepare_vm(struct drm_gpuvm *gpuvm,
>> -             struct drm_exec *exec,
>> -             unsigned int num_fences)
>> -{
>> -    return drm_exec_prepare_obj(exec, gpuvm->r_obj, num_fences);
>> -}
>> +int drm_gpuvm_prepare_vm(struct drm_gpuvm *gpuvm,
>> +             struct drm_exec *exec,
>> +             unsigned int num_fences);
>>     int drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
>>                     struct drm_exec *exec,
>

