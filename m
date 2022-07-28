Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 566FA5841C7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 16:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19B010E902;
	Thu, 28 Jul 2022 14:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44810112E5B;
 Thu, 28 Jul 2022 14:36:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1R1Cq4RyjezzqDdf47P7X10QwwLvtaK1SE4o/kyVvK/6bvoGtUyCN0T0aL7Vq44JOPyNEDMMIQ7xQirSylSUn+KTDMtgvd+myVc+UifT9FI2YyTR1lgVLQo3dh/kZ6XBvbV51GOXPtUK5frDr6+tt87sdGqsT5fsgxCeX19autnLDnCUTIivNKXNT3S6lTk92KeTf/UKf5pW0pT/o/7PDqsupttGQKaTL7YWzjISrmuEMn3kUwhhzGfESvZSKoTagADqJvZbIFp30MutpyQbhQi2GERcvZxb5CJgTg3A+OVKJfvpf61WeUn7FqHK88pxjYQw67OpV/FT9aJJIFQig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuDmai9Tn2VDUBbGz/BvYu/B07WaI6FG5I7LYUHsP24=;
 b=ZgvP5yXF8tCmjM6u46gtgKvPWDny18zQ48LMHDPyJiLjdutxcGIrBSGUodsYiV8elQETAp3VeW5pqUsZmJE8PUZgAOUMvZQoHbZYVgR8qAylrBQHj226+d10ZuBajcZIvov71j6NxqtpoAJ7CombZGjEDooOEoJwbl0bZsVgCE+xXFZH1AYeANYIEwfTAREVXG+SNo7xK69Hw2WFuJSNdCf0qtnmUv68Xs5Ec63xuECUjiNEYKAi+AF9Tcppa0JR8ovTeFC9Ishpb2yuAyjTEblnMoLEswp770FKd0HDfJw/kElWjYL3o/KLFRwl14QzbSjQOP51Nh4vJ8OBI0jKAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wuDmai9Tn2VDUBbGz/BvYu/B07WaI6FG5I7LYUHsP24=;
 b=NOABGGcMl2wmxH+dtr1DPyNph1RUuJmWxZ9ap2CcYDU4t81/JI/HCaz1YexuQWRHcn++1I1hqaAAgrkg90GQDm/Ylq7mJ/YyObs43AEl8QgSjaqJopQ/OMRt8Oa2JNh8sAfMbeI/OD8eZsBW+lZmgfpqZLM64UBDWaQq7nLXjBc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by DM4PR12MB6232.namprd12.prod.outlook.com (2603:10b6:8:a5::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.6; Thu, 28 Jul 2022 14:36:32 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::a1d8:6a71:213b:6e14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::a1d8:6a71:213b:6e14%9]) with mapi id 15.20.5458.025; Thu, 28 Jul 2022
 14:36:31 +0000
Message-ID: <2010b60f-7ef3-abe9-129b-af718d821ff7@amd.com>
Date: Thu, 28 Jul 2022 20:06:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 4/6] drm/i915: Implement intersect/compatible functions
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20220725114240.4844-1-Arunpravin.PaneerSelvam@amd.com>
 <20220725114240.4844-4-Arunpravin.PaneerSelvam@amd.com>
 <41eea55c-93d6-6406-d279-0583e17ab56c@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <41eea55c-93d6-6406-d279-0583e17ab56c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0130.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::15) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4445f4cc-2595-4f27-a2ea-08da70a69071
X-MS-TrafficTypeDiagnostic: DM4PR12MB6232:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JMEre4mlizmCTB8d8DDShXrku8py3gktYp0Rj+FYPLKflmKOeeWrsR/DETfazv7rukCHpjswgahv/q8vpxAtqi+yxFZvqLtU2W2iLa8ry+Cm92YRZF/Q0y/nfOtD006QAt+/o5z5i2/Yz+EOFT3hUu52I8PMBmy9nnilvXKnh9jkZCTfpa2xAfvpwuOOZaa6WqmNbuKKLc3pbbwyogzdGrfKI921JZah3tubS6SY6xb/A+FCevezkHRG7RTdDZ66xxhsTET+4ZJxf7Z37zhXDEg3fwCEPNIVNf9MrSL9ibRAd3HxTIP41IfQ8BqKdlgy+JUUsaWTL8wkiSBci6wE+xL1+S9eyugo2woYCwQLiGdmfTm0N7LtdcuvvXnQ0zviXgxOMCI7sTwlsqM483gJDfcjTahwLUk3AWGjMQSoSeUIMX3fo4gZjMu373rDY0MscY0YUq1kbD2bufNDsAkXwVXiYMdU7GCrv2agp+E7oVRGwKRJXmkr0IPNIrnkI6kdcgyIb8++OX7mP4uxrFHFQKZKoCKO7uAqeZ90m3AfDs/BBQ7vE/tr6iAREPIFU4vg9OsaOwPXC4AvCxvm41x7cLtvio2Ec7d3PqjFIZMnUhK5EGRfKr4JeQM3clMQ8SvXngOgeai/qU6IGNPZrMjW+4K16dBS6KEMnlgtNBh5fsOWozXzyxNKnNyd5ez5Mmn1ZdQSCo+/s7M/uy882aGf3ekDa0TUnzB6cPtIm/gx/cYbWJbJNaVV9K41NIF8hlVqUk8pYsoyGv6Fd/ENH8gFfoWoAyLeYtdQNw5zuOTUoBJfUOg+SM03KC/8iY7jdu1e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(366004)(396003)(39860400002)(376002)(136003)(8936002)(5660300002)(66946007)(66476007)(66556008)(8676002)(2906002)(186003)(83380400001)(4326008)(86362001)(6486002)(316002)(36756003)(31696002)(38100700002)(2616005)(6512007)(41300700001)(6506007)(26005)(66574015)(53546011)(478600001)(6666004)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTFGcHFSUVZJVkMrdkVjVmMvV2FCRnpjUTQxTEhBN2ZXQmhBNFVkb24vbXc1?=
 =?utf-8?B?V1ZNV1R6SGt2M0czOFF6UjhaM2FDaVFabVMwQXBvSUVMQXBKT1RLUUpDYitp?=
 =?utf-8?B?Uy9JSVROOHBPMG9MY0hRODN4TDJkb2RvS0JROGc2U0FCQUdnTUo0eGtPaHBE?=
 =?utf-8?B?VXFPU0h3OUx2TWdOSUdOWEswdjJwVWZwdGV3TGllNWU4eUNqM05FNEp4UjJQ?=
 =?utf-8?B?ZWxkV0gzZmdYcjBiZXhuaXQ1Q1VXUGwwYzZsYVl5M3JzYUZlemhzYkNHT3Vr?=
 =?utf-8?B?UWtBclU5eU10WDEzWHh1cDVsT2FnazdyRGcyeWp3M2NaN2JGMDFGNFVydmgy?=
 =?utf-8?B?QzFiN0hiOE0ybVFyY1JqU01pN011R3d5YkR3N3lnMHR0dnd5alYweVljdWt6?=
 =?utf-8?B?RUh4VVludW8vYm90NXF2OHNRUGQwcStUMmZWbVdRZ2VHNStZS3dxd1VZMEU2?=
 =?utf-8?B?TktBSjRSZytCSnQxYnhXTytEZjVpTzA2RFRsYjFJdXd4K1dNZUZyWkRPSURT?=
 =?utf-8?B?WTdhaEJjTm04bnFaa2RaWjZ0Y2NEblpKYmt3SUl3Z1FDc0ptL1RvS0R5cnJ0?=
 =?utf-8?B?cWxVaEZFZjUzWEFJQS8zVU1VbGFXUTVGdHFZQUhCd1ZGZU04dUs2cytUdndt?=
 =?utf-8?B?OGVxaVV6Ym9VQ0J4VUh0ZXFxZW1ZU0hsNnpwbEJDUE1UZExXWGJiZUk0Ulhi?=
 =?utf-8?B?dmdPMXNkZll6ajBNV3lkMHB1UTBmL3ZZakZFSDdoSUsxdno1d3hXOUV0RTdq?=
 =?utf-8?B?V2NBS0M3cm5ZV0ZKRVR6VFp0Mmdha1ZQbjBDa1ZmOEprYkN4Nm9qdXVNWm5F?=
 =?utf-8?B?dzhjd2FFRnpPTjJQaElxblFxL0g2VXdnSHBEUWlmcDhQeWNCNmpqUTNNb0Nu?=
 =?utf-8?B?a25lVmhnRzJ5aXYzNGJyN3gxc0RRWE1MOU1OK0JZdm1zUVN6VzFjdUdzdDl6?=
 =?utf-8?B?RktMYTdXS1NqU0ZlOC91M1pqaDBtaTRjREtQYVVVRVE0SFU4YzZEV00vOUtD?=
 =?utf-8?B?MWlMbExySzE5RWNaQ2piT082S24vanNqQUZxUVZzUnJJTEJQMFNtTGVhMUNj?=
 =?utf-8?B?d2JmOGszSFBkN1R4MTFVcDgzcG1OSlU1UHlPU29CcDdOU0pkNG5XR1hHMnRY?=
 =?utf-8?B?Wmh1ZnY5WHd0QXZTNmpsMWQzU2VyQ09XNFQvb2tMNFg3VmNQOCs3eEUxKzJF?=
 =?utf-8?B?cFFkSmFUanFxV0FYZGFvR1JSZ2Q1RjNBclpKSHhZSEE2NzlZWkZhUkxlSHI0?=
 =?utf-8?B?NTJMRmRUYTNNenVEWG1YczR5UjByZ1BZVVpNVEpZUnNmb1JTbys0MjZzWmZC?=
 =?utf-8?B?aExJMU5rd2c3UXovQVNZcVBEaDhhcXBlajdTQUgzK3lKZzBtb0IzcjcxV0Er?=
 =?utf-8?B?bnJaL1ZkYXR4OGY1cm5VcGd5YTh5T0h1NGVlWDdvQ0hMaVFhdGxoc3hvMmcy?=
 =?utf-8?B?eE52MFlJYUErTzJuWTFOV1BXY2NiT0NtRnJhOGQxazBxVWZLdHpsYjNjQlZa?=
 =?utf-8?B?MHIzT2NjK2R3VGRKT0s5d0pyT3RmQ2h5amxYRHJyRFhsY3I5aUkxbXpVUllp?=
 =?utf-8?B?WlpnMXJrY1QwK3UzY3ZoTE0rYVczeTFpQmJWclJkOE43TmRMQ1VIZDBDeTly?=
 =?utf-8?B?Vi8vOHlPaFRrQ3JNU3F1WGJRQ09jMzhaVjh3WmtGQllOYVRXQ1ZMdmFiSXFD?=
 =?utf-8?B?dkpobHBRTVZLTWM3eXV0MkJ4Rm5RQTBIMGYvWklWTTlLUDZRdFd0NVA2TzdT?=
 =?utf-8?B?VGRpNW1iRkRzZmhUM29pT1haU0JadDF0WG1BSHU4SVRrYlY0RjR0VVBUS1c2?=
 =?utf-8?B?MVpXN0pVLzdqcXhEU3RZRk5kWTd1UFZnY3ZCSGpzWEY2cFMyR1pHY1NZWWRJ?=
 =?utf-8?B?eDMraG51NVRieFNIV3ErdnErYVZiU2dIYjlSU3hLVGZ6dzZMNU9mcUlwK2p5?=
 =?utf-8?B?MEZ6cDlkcXBqNmF0K0lCR0hCeWhHeElHd3lubk9JN2szL1I1bnljSExwL3F2?=
 =?utf-8?B?aXRWbys0cUZGZzczUlZFTDhSVU9HK2hrQ3ZkQ1ZUNEJNbG1jUjYxbjlsYS8z?=
 =?utf-8?B?eFpZMVR6bTlWMlNPN2xtWElMTWY0clF6bVFvSUJvWWxwYmhLOFNPWUFoZExD?=
 =?utf-8?Q?ts/a4i5lo2NSQhYP5AhSR+zMB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4445f4cc-2595-4f27-a2ea-08da70a69071
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 14:36:31.7688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYxxQ6/fjMQ2E/wrkApN4w8myrB4t6dMmBnWPvSSqkkDFs/l5LcfeAXjoe1l4XVCQA/UWlunnUMJWaEbkMs67w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6232
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

Hi Matthew,

On 7/26/2022 4:11 PM, Matthew Auld wrote:
> On 25/07/2022 12:42, Arunpravin Paneer Selvam wrote:
>> Implemented a new intersect and compatible callback function
>> fetching start offset from drm buddy allocator.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 43 +++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c 
>> b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> index a5109548abc0..b5801c05bd41 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> @@ -178,6 +178,47 @@ static void i915_ttm_buddy_man_free(struct 
>> ttm_resource_manager *man,
>>       kfree(bman_res);
>>   }
>>   +static bool i915_ttm_buddy_man_intersect(struct 
>> ttm_resource_manager *man,
>> +                     struct ttm_resource *res,
>> +                     const struct ttm_place *place,
>> +                     size_t size)
>> +{
>> +    struct i915_ttm_buddy_resource *bman_res = 
>> to_ttm_buddy_resource(res);
>> +    u32 start, num_pages = PFN_UP(size);
>> +    struct drm_buddy_block *block;
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
>> +}
>
> This looks like a nice idea. We should be able to clean up 
> i915_ttm_eviction_valuable() a fair bit I think, if we now call 
> ttm_bo_eviction_valuable() at the end (like in amdgpu), and move the 
> bits that are specific to buddy_man here?
>
> So something like:
>
> if (!place->fpfn && !place->lpfn)
>     return true;
>
> if (!place->fpfn &&
>     place->lpfn == i915_buddy_man_visible_size(man))
>     return bman_res->used_visible_size > 0;
>
> /* Check each drm buddy block individually */
> ....
> modified in v3
>> +
>> +static bool i915_ttm_buddy_man_compatible(struct 
>> ttm_resource_manager *man,
>> +                      struct ttm_resource *res,
>> +                      const struct ttm_place *place,
>> +                      size_t size)
>
> Is it not possible to derive the size from res->num_pages?
I think it is possible, I will check with Christian for any specific 
case that might
require ttm_buffer_object->base.size
>
>> +{
>> +    struct i915_ttm_buddy_resource *bman_res = 
>> to_ttm_buddy_resource(res);
>> +    u32 start, num_pages = PFN_UP(size);
>> +    struct drm_buddy_block *block;
>> +
>> +    /* Check each drm buddy block individually */
>> +    list_for_each_entry(block, &bman_res->blocks, link) {
>> +        start = drm_buddy_block_offset(block) >> PAGE_SHIFT;
>> +        if (start < place->fpfn ||
>> +            (place->lpfn && (start + num_pages) > place->lpfn))
>> +            return false;
>> +    }
>
> if (!place->fpfn && !place->lpfn)
>     return true;
>
> if (!place->fpfn &&
>     place->lpfn == i915_buddy_man_visible_size(man))
>     return bman_res->used_visible_size == res->num_pages;
>
> /* Check each drm buddy block individually */
> ...
> modified in v3
>> +
>> +    return true;
>> +}
>> +
>>   static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
>>                        struct drm_printer *printer)
>>   {
>> @@ -205,6 +246,8 @@ static void i915_ttm_buddy_man_debug(struct 
>> ttm_resource_manager *man,
>>   static const struct ttm_resource_manager_func 
>> i915_ttm_buddy_manager_func = {
>>       .alloc = i915_ttm_buddy_man_alloc,
>>       .free = i915_ttm_buddy_man_free,
>> +    .intersect = i915_ttm_buddy_man_intersect,
>
> s/intersect/intersects/ ?
> okay.
>> +    .compatible = i915_ttm_buddy_man_compatible,
>>       .debug = i915_ttm_buddy_man_debug,
>>   };

