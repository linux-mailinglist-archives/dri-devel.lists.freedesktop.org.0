Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1C6584B69
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 08:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB2410E1EB;
	Fri, 29 Jul 2022 06:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F4010E2CF;
 Fri, 29 Jul 2022 06:11:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAzveqO7rRMexrU5z95PZzXKuIwgGCnrMU+xDDmTNPEz0dAAv2rxnnFwe0AW6Mjcp84rsW2+Ldi1rJ8Jhlajo2ab4oXxdMxfqcBHpohz8TiWn53r7fs1o2idySUj1vCwksRaiG8eWlSAzAaBL3XP4btfHHG7nh6vQvdbyNoPA4ZwOobp06oleaCVbZYVmHTAfrmy/9Mthnp717B7kfu5CxRKn9hCC3Kuc5AYJOqTQn8mTmECzMGL1sR46+Qx7XUHQz7p8FAs07XrtfJdlSBRAumhJn+l7TPsu9iB6aaA2GCV8UpB++vUzpAV3xhmdz/MNXDSq92d/rWanHm+TOaRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLChjpw0JTcvOSEUGDo24K4rOFdGuCuyIINOPclIO9E=;
 b=SxkUKDPgTCim8bMBv4hS/UrDJFlcG5+HKslxXLlIP/x4JLqy/3arlRpjUjPyhaNkpwLA/Y//lLd+zTmhiiV395R14ubg0MQPacU93oPuhdtZ5i0MpLbtKLaNn99iJRsKSzuN0EvUwXotrvEWAr5aaduqV5VisIBUMEyuSFkqejDH908mWdkono6GSaVvkVFTkTmz9ASisa3JLEM8iVUsxAs5nc34hwYUebnQpERDWbs/cZCLgYylK2mA3imBH61jn14eyAiwWaADIIX1g87df3A3XR3X6b1/XhCdEu/Sj0uCxCrgfAui2lUzfGC3eiwIwTSlg1zHcpRjHakPS9zA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLChjpw0JTcvOSEUGDo24K4rOFdGuCuyIINOPclIO9E=;
 b=GXUns2z/vfGOBLwHNV9vpHaFibXjskxfhCYF42eLbWo+4oZNA8hTqTaQdLGJ9gZJTr43kk5fNPceyVxhnoJ8YJpjxN0JcJL2WxS3r/j4LbyY/c9yGgF2h57qxf0wuCyStYW8RZFSvUgcoHIK/IhurspROqQZRlFURAiwmulZFWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BYAPR12MB2677.namprd12.prod.outlook.com (2603:10b6:a03:69::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Fri, 29 Jul
 2022 06:11:10 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::a1d8:6a71:213b:6e14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::a1d8:6a71:213b:6e14%9]) with mapi id 15.20.5458.025; Fri, 29 Jul 2022
 06:11:09 +0000
Message-ID: <e26eb1d4-8758-b949-aa1b-767bb20a282d@amd.com>
Date: Fri, 29 Jul 2022 11:40:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 4/6] drm/i915: Implement intersect/compatible functions
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20220728143315.968590-1-Arunpravin.PaneerSelvam@amd.com>
 <20220728143315.968590-4-Arunpravin.PaneerSelvam@amd.com>
 <b2dc0312-2f4d-a593-30e4-68971c6cbca5@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <b2dc0312-2f4d-a593-30e4-68971c6cbca5@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::10) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea638451-12dd-43f4-35b9-08da71292168
X-MS-TrafficTypeDiagnostic: BYAPR12MB2677:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IySYEsx6WF8cOdm6dPNEsZtGKZScaFt322CC1IKEHx6xGwkoSSTUAaVHleCpp4A5qEjYj2htbJ4YmGpQTZR+s15niFURhUEn3VqZR50Gp05M4KUXLlTLkU4xu/ncoSIm5ABmrhkaznk7cCgOowPbbmPB7tfNlOfsnAsK/80QCX8zuCB3Hzi8FANTGSZwmOW2uotC6DfEKMgajpv92QNHFgKWJNm0TvWdZQcP3fih989YyldKmSPRg5LXGI2Ggaf8ajFkOttGhG3zPCzE+2fto16fuexE53r01lMykhXu/GHvhQ2lH42OFdFBqovludKm7L903OllsbucQHKFMigw1NFLw+EGopRWfAfgCVWlplCU6Noyir4cw1An75E6eiSQAdc3MQWL+6+i+2hMHcu+zePfDWdBwIFNqfKnmOHmaSyrRHSFm3Bg/QxceniNySyml9jQCfdOkTQdJcdwU5KLqq3mGCCVLbqYj9MxleeOhGPFxAYycer0o8MhJ5nGOP3p0zKkr/iTmxfWPUoB2Uzfm4pz5j7ugQ0OnNLLLHktcJqKGLSfF4vi6D908tAhMQlusGnOiDuStr0CGvv+gzSgSUy8k5s+NaE11FfPhtiGIdUi4DCgotk1pT/uEFm9t2OuF7xYCmeD97NjuuFbIRJMketcm/cu07z/3FYLJD8r9hliN5GnLh4LTFB1cK73zeBWEVoEiu8vqIHcGjHt3TPJmUeJ5ovQk5LxwOrHbIiOINSeE86kFsg5JtkbfZhyqQHxj41Hd1TSlgUD1tVBYg875vrr3e+k6NSrJJ6YGiF9T1uwBJqdPuxWFtEvNOwQ7ouS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(6666004)(6506007)(66574015)(53546011)(2616005)(186003)(2906002)(36756003)(86362001)(31686004)(6512007)(26005)(31696002)(41300700001)(38100700002)(8676002)(66556008)(66476007)(4326008)(66946007)(83380400001)(316002)(5660300002)(8936002)(6486002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUdOdUZ1cFNuc2MyOTA4QzRUVGZOUmtkclRSaXI3K1lXWFY4Mkk2Qzk4QTJW?=
 =?utf-8?B?UkI4ZmNGY2RuTHBYZFdqem52ZEpKZWg5eVdyVnVhazE4MG1mY1FtRlhmUDJh?=
 =?utf-8?B?YUZwOG42VkErZ01rUy9scUdOcXh0MVFoekRpdnZrblVHelUrTSs1SnMxaUx1?=
 =?utf-8?B?UmJublFBRnlKWm91Y0ZhdnpyUmZmb2JxMjZvS1VXNit5bHdDaHcrR1lPWm5j?=
 =?utf-8?B?YlJNQk1hWWFnMXhEckkvRXpTTThIWHdMa2tYSGJWaVp0MExoN0ZHdW9RTUJR?=
 =?utf-8?B?eW9rVkN2MnRJRjFMdm9GRlM4NDZLYUhnWUc1Ly9lL2ExZVVFVldLRE9acnl0?=
 =?utf-8?B?WWJXRFhDUkVFVEQxRElpUmRKalFNWFdhMEdFM0E1TjFaVWVtQk1DazA4dDhO?=
 =?utf-8?B?OWZDaW9Wb2s4emlUb0VtK2RSYW5MMnp0YW1CZVRUcGRndVVVb3hpaHlQVFQ5?=
 =?utf-8?B?T3pzL2RqRC9KVmRIK2luSzVaK0krMG5wYTBnOHVSVExQT2NMV0lhWmdFZkxO?=
 =?utf-8?B?VjJ5YjFlbU5ZTWtzZTZGZFJGdjZ3SjlGa2Mzc1NZWHJGYXgwL1hlVngvbSs4?=
 =?utf-8?B?TU5UMm5xdUlKZTJHWlBKaDJJQVlNM3dVK3dBcDlEQUllYVBodHd2WC9YNlN1?=
 =?utf-8?B?YnJMZ2RGNDRGR3VHVVFJOTBlVEtPNmdFZ2NUTUFyaE9nazc2U2FWWG1nbnhk?=
 =?utf-8?B?ZWNtWnQ5Ky9PbGlaNjE5cVcwdlM1Z0ZXR3IzT0NyaHNoQlJQUU4vdFVJbnlV?=
 =?utf-8?B?dmd6Q2hXZ2JkT0dHWldPTittYk91NzQ3THZ4SVRySHNGZWhVazA1aGRhV0Ft?=
 =?utf-8?B?eXRSREppN0ZVY25yTkVNTWt0VU9qckY2TUtyUmdPVzR6dUh6TzA4aHM2V1cw?=
 =?utf-8?B?WCtQR3NKV3o4VkNITEhTMlhrdFc3bFcyT3ltSjVXa2lQRkZiMTdqbnUrcHVm?=
 =?utf-8?B?cHBOcm9KSkVQazZoYU1CckUrcWVWNHM2Wnl5RVlhcDFPckFidW5ndFlrY0tv?=
 =?utf-8?B?MnhsSS9yQTRqMG5OcHF5MDVBbjdKTkEyYlNZazd1aFR4UzJLbklqZk9YcUg5?=
 =?utf-8?B?RG5LbWxiUWthZXA4UW5rWmQwU0J6ZUZLZFJKd3ZLbTVUaEd5clFyWU1sZFho?=
 =?utf-8?B?RCtBTzhkV0VZS3dwZlRneE5WczhpWnpDQU5TMUw2VUUzSEQ3UEZ3emNSSG10?=
 =?utf-8?B?V0dFWDhWdVZVaCtCYU9oZmdHTE1paDlNL1d1Y2d3czZhT0oyK2kxcjFsM3dl?=
 =?utf-8?B?cm9lNDZuWVk0RkhSREYyZFJvaTFYS3RGa1pFTjY0N2szYlk3SlQvZ3NUVUJj?=
 =?utf-8?B?K0NlVVNacmlxMzk0S0pMT0t2ZUM4TjhMaS82c2VuVjMvL1VzdnVzNEpEeHow?=
 =?utf-8?B?RU96TkJaWkZRM3dSMktwTGdlODFtbnkrOVdjSEw3VWx0REt0S3VrTm1CZ0R2?=
 =?utf-8?B?aXNCWktabU4rUlBEbUZ3c2N0T2tHU0wzWERTWEFJaUt1MHduNTNObjN1ejU5?=
 =?utf-8?B?YnhFRDY2bHNNVzZaR0prWXUzSjVzU0Nna2wxeUkydG1XUGtyZkl4d2lYRWg4?=
 =?utf-8?B?MmdXNHRSTmVUcjJtMmEwdlRrOWxwRlRnWHdTVy8rMUhVR3JsazlESTRrL0Jo?=
 =?utf-8?B?U1lYcXZXbG9FY2ZGTmoxR0ZTMU9EeHh4TDNYU2JOcjVsbnpQdGp2SlFnN1JB?=
 =?utf-8?B?QTF0Ung3OUJYTmxZb3k5bzhuTmxUTm5MRUhHc1QrR3JBQ3ZHT21aU2NHbGc1?=
 =?utf-8?B?RjRkNUd2c0luWkplcDlzdHFaYTczODVsakFmSzFXYWpRVDFrMWZTZFZ1eFNa?=
 =?utf-8?B?NDczcC8venlLa1hhYWZrNGIxYW53ZXFYMHdRUEVqZ2E0RWFSTjdKbDNIRGx3?=
 =?utf-8?B?dDdXd2NUWE9PN2RWdlVoMHJjdW92OWZrajM3WVE1dnVzTyt2N2RWRy9IV3Za?=
 =?utf-8?B?NVdYL3JBMHN4WDRMM3Y0OVlvQ2V5VjV4OVZVa1JyaFRvTTc5amZRMDJFZEcr?=
 =?utf-8?B?OUU1NXZxck50cXQ1Wlo5eW5hdmM4cEVlaU51SU5jb2tDSVZYS1k0d24wVk16?=
 =?utf-8?B?bDVIcjNOejRqVlJpaUdJNlErbDh1R24ycktXM2NwQ25CRDZYbUVLalVkeUo3?=
 =?utf-8?Q?0qf6d5BMeUuqDVEWozPBs20Lm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea638451-12dd-43f4-35b9-08da71292168
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 06:11:09.7102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Hgn4Wvmxw55b5ieKDYiBKrhZOa6h+ubTF/X6UUlIH5OeaPKxoZnUbv7npMLlCJDWYtxt6XQMUNmxxK87nQlBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2677
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
Cc: alexander.deucher@amd.com, luben.tuikov@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/28/2022 8:57 PM, Matthew Auld wrote:
> On 28/07/2022 15:33, Arunpravin Paneer Selvam wrote:
>> Implemented a new intersect and compatible callback function
>> fetching start offset from drm buddy allocator.
>>
>> v2: move the bits that are specific to buddy_man (Matthew)
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 39 +-----------
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 62 +++++++++++++++++++
>>   2 files changed, 64 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index 70e2ed4e99df..54eead15d74b 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -396,43 +396,8 @@ static bool i915_ttm_eviction_valuable(struct 
>> ttm_buffer_object *bo,
>>       if (!i915_gem_object_evictable(obj))
>>           return false;
>>   -    switch (res->mem_type) {
>> -    case I915_PL_LMEM0: {
>> -        struct ttm_resource_manager *man =
>> -            ttm_manager_type(bo->bdev, res->mem_type);
>> -        struct i915_ttm_buddy_resource *bman_res =
>> -            to_ttm_buddy_resource(res);
>> -        struct drm_buddy *mm = bman_res->mm;
>> -        struct drm_buddy_block *block;
>> -
>> -        if (!place->fpfn && !place->lpfn)
>> -            return true;
>> -
>> -        GEM_BUG_ON(!place->lpfn);
>> -
>> -        /*
>> -         * If we just want something mappable then we can quickly check
>> -         * if the current victim resource is using any of the CPU
>> -         * visible portion.
>> -         */
>> -        if (!place->fpfn &&
>> -            place->lpfn == i915_ttm_buddy_man_visible_size(man))
>> -            return bman_res->used_visible_size > 0;
>> -
>> -        /* Real range allocation */
>> -        list_for_each_entry(block, &bman_res->blocks, link) {
>> -            unsigned long fpfn =
>> -                drm_buddy_block_offset(block) >> PAGE_SHIFT;
>> -            unsigned long lpfn = fpfn +
>> -                (drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
>> -
>> -            if (place->fpfn < lpfn && place->lpfn > fpfn)
>> -                return true;
>> -        }
>> -        return false;
>> -    } default:
>> -        break;
>> -    }
>> +    if (res->mem_type == I915_PL_LMEM0)
>> +        return ttm_bo_eviction_valuable(bo, place);
>
> We should be able to drop the mem_type == I915_PL_LMEM0 check here I 
> think, and just unconditionally do:
>
> return ttm_bo_eviction_valuable(bo, place);
okay
>
>>         return true;
>>   }
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c 
>> b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> index a5109548abc0..9d2a31154d58 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> @@ -178,6 +178,66 @@ static void i915_ttm_buddy_man_free(struct 
>> ttm_resource_manager *man,
>>       kfree(bman_res);
>>   }
>>   +static bool i915_ttm_buddy_man_intersect(struct 
>> ttm_resource_manager *man,
>
> Nit: intersects
ok
>
>> +                     struct ttm_resource *res,
>> +                     const struct ttm_place *place,
>> +                     size_t size)
>> +{
>> +    struct i915_ttm_buddy_resource *bman_res = 
>> to_ttm_buddy_resource(res);
>> +    u32 start, num_pages = PFN_UP(size);
>> +    struct drm_buddy_block *block;
>> +
>> +    if (!place->fpfn && !place->lpfn)
>> +        return true;
I place bug_on check here
GEM_BUG_ON(!place->lpfn);
>> +
>> +    /*
>> +     * If we just want something mappable then we can quickly check
>> +     * if the current victim resource is using any of the CP
>> +     * visible portion.
>> +     */
>> +    if (!place->fpfn &&
>> +        place->lpfn == i915_ttm_buddy_man_visible_size(man))
>> +        return bman_res->used_visible_size > 0;
>> +
>> +    /* Check each drm buddy block individually */
>> +    list_for_each_entry(block, &bman_res->blocks, link) {
>> +        start = drm_buddy_block_offset(block) >> PAGE_SHIFT;
>> +        /* Don't evict BOs outside of the requested placement range */
>> +        if (place->fpfn >= (start + num_pages) ||
>> +            (place->lpfn && place->lpfn <= start))
>> +            return false;
>> +    }
>> +
>> +    return true;
>
> We need to account for the block size somewhere. Also same bug in the 
> amdgpu patch it seems. We also need to do this the other way around 
> and keep checking until we find something that overlaps, for example 
> if the first block doesn't intersect/overlap we will incorrectly 
> return false here, even if one of the other blocks does intersect.
>
> list_for_each_entry() {
>     fpfn = drm_buddy_block_size(mm, block) >> PAGE_SHIFT;
>     lpfn = fpfn + drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
>
>     if (place->fpfn < lpfn && place->lpfn > fpfn)
>         return true;
> }
>
> return false;
yes, here the final code looks like,
list_for_each_entry(block, &bman_res->blocks, link) {
                 unsigned long fpfn =
                         drm_buddy_block_offset(block) >> PAGE_SHIFT;
                 unsigned long lpfn = fpfn +
                         (drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
                 /* Don't evict BOs outside of the requested placement 
range */
                 if (place->fpfn < lpfn && place->lpfn > fpfn)
                         return true;
         }

return false;

>
>> +}
>> +
>> +static bool i915_ttm_buddy_man_compatible(struct 
>> ttm_resource_manager *man,
>> +                      struct ttm_resource *res,
>> +                      const struct ttm_place *place,
>> +                      size_t size)
>> +{
>> +    struct i915_ttm_buddy_resource *bman_res = 
>> to_ttm_buddy_resource(res);
>> +    u32 start, num_pages = PFN_UP(size);
>> +    struct drm_buddy_block *block;
>> +
>> +    if (!place->fpfn && !place->lpfn)
>> +        return true;
I place bug_on check here
GEM_BUG_ON(!place->lpfn);
>> +
>> +    if (!place->fpfn &&
>> +        place->lpfn == i915_ttm_buddy_man_visible_size(man))
>> +        return bman_res->used_visible_size == res->num_pages;
>> +
>> +    /* Check each drm buddy block individually */
>> +    list_for_each_entry(block, &bman_res->blocks, link) {
>> +        start = drm_buddy_block_offset(block) >> PAGE_SHIFT;
>> +        if (start < place->fpfn ||
>> +            (place->lpfn && (start + num_pages) > place->lpfn))
>
> Same here. We need to consider the block size/range.
ahh somehow missed the block size, here the final code looks like,

/* Check each drm buddy block individually */
     list_for_each_entry(block, &bman_res->blocks, link) {
                 unsigned long fpfn =
                         drm_buddy_block_offset(block) >> PAGE_SHIFT;
                 unsigned long lpfn = fpfn +
                         (drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
                 if (fpfn < place->fpfn || lpfn > place->lpfn)
                         return false;
         }
return true;
>
> Otherwise I think looks good.
>
>> +            return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
>>                        struct drm_printer *printer)
>>   {
>> @@ -205,6 +265,8 @@ static void i915_ttm_buddy_man_debug(struct 
>> ttm_resource_manager *man,
>>   static const struct ttm_resource_manager_func 
>> i915_ttm_buddy_manager_func = {
>>       .alloc = i915_ttm_buddy_man_alloc,
>>       .free = i915_ttm_buddy_man_free,
>> +    .intersects = i915_ttm_buddy_man_intersect,
>> +    .compatible = i915_ttm_buddy_man_compatible,
>>       .debug = i915_ttm_buddy_man_debug,
>>   };

