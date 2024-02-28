Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFBC86A8CA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 08:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D8210E6AB;
	Wed, 28 Feb 2024 07:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="28uZf1F0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2055.outbound.protection.outlook.com [40.107.95.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A072710E373;
 Wed, 28 Feb 2024 07:20:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTTN4NLLbtZgSdtYybslnRxbAezVUGBgcNxIbKQYine/uy2F0al27RGqm5SFn/I7vW6gfMSH13jumOg/cr/YjCzSY39IRR2ZmVfIqYjSf+hm8OE6QuLqaj++Pb43uCT4hsHJS09TsFTc/r9/G96I4jy49kRhxrmIXyWJuCak1EAA4YSB0eKEqiGNUXCYPww3CafUUjDnxv2bi7TgZB+wVqo7/nInmxXM1/pvQqYTvMl9GPbEFc14ddFzHcMIo28ZhEgT2Map1NGadEaj4GG++kDCxcNSyrosvEctvixn+JZkfQk+dmc16O46sSyqefAe4uGUrB+BQV/nrQZzf1aWdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPrwFvMYb0XYNYZN9O6f765iL/6iFKFMtYmLr5qiWMA=;
 b=nPppBOBSADoLF2hii4RvCfK3rH42doGsDMzQkp02oODHEBHYtAoiO13Uxz0Xy2N8pp8W3PedYpT23ljHq7h2/KGZuwdcGRLoWZ0w9YzciigUxh+EF4YyZ++N7jCBm7NJyqwCFhXZRARmL35rv2g6ekiVNzbRUB9lC7qQR5CaxLGPb6+IvBVJz8yASkQLYmxYVROQmUCLyYeA0ZAErvqzqzNeAiVrw3mQI3WaWfPMyY5VNIAWjWEHZ2Wh6Tz3Pb17FoKfRFbswhFKvHOh2En16DKw69ws4Jabuv4NW4TeSObS+hr31JDMVSl0coI8i5vAdzzaJBWvGodHOJwg/8HeTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPrwFvMYb0XYNYZN9O6f765iL/6iFKFMtYmLr5qiWMA=;
 b=28uZf1F0mpmjYgH00HpAMm/T6gEgKYg6mGfH8NZNqST4tmOXNYqvMnRJt46JUVnMNoYySGgIKqr/xNNc/pf163h9d4bazdZpuWTJ3Xk/58WBwTGxvW+09J9yjrQNuc8kti6gPNjk9aW3O1TXi3A64RGcvILU7F5AwpvGwVcbFWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4241.namprd12.prod.outlook.com (2603:10b6:a03:20c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Wed, 28 Feb
 2024 07:20:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7316.031; Wed, 28 Feb 2024
 07:20:17 +0000
Message-ID: <0616a372-b2ec-470d-8cc6-e8520b53c763@amd.com>
Date: Wed, 28 Feb 2024 08:20:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/tests/drm_buddy: fix 32b build
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Maxime Ripard <mripard@redhat.com>
References: <20240215174431.285069-7-matthew.auld@intel.com>
 <96bb6e97-34d9-4e4a-b618-85c17e809738@intel.com>
 <5a9e1f30-19fc-486f-b7f5-016d82580d2f@amd.com>
 <4aea62d4-8c2a-4406-b81e-240dca772da4@intel.com>
 <45059d66-6e80-406b-aae2-72f8b8d142cb@amd.com>
 <dc8c7d2b-4c2f-41dd-9812-3699444d5273@intel.com>
 <94afe80c-9e4f-47a7-a758-17ab26eb4c00@intel.com>
 <58e423e8-316e-40e0-b622-136ca6cc0189@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <58e423e8-316e-40e0-b622-136ca6cc0189@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4241:EE_
X-MS-Office365-Filtering-Correlation-Id: c1f67638-b0f3-4767-3219-08dc382db6d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q/moXOkWE1atO58P291FQeQQlMP0qA+tk/OgbArPcbV0kV/U0lEHO+5NOvu7W81+4wj2RtxZsAc2IuuvTXMkk3qqTe6rTqPZjXAwPbgIdjveH1QxeH7TgAJt4RNVKhW6tokresgRHCJoDbZdAsRoP8yrcdKaBOiW+zd0fnlRUpOa+nN0UEPnhHloEXeaplFHdr1DUmyBJjDbLlBoYCvRW2BIMrO91vx1Opve7Mjy0l3SPi2GeXIupEwtPaOh+Lt8hJHO72wxhX2uulpyNj4qbNCl95kb3/cx6EHVauvAFtzdCHJ/AgPNAHBuqUXm6PuNWj69p5Nv3UWhH1fk07k/kUPXgRCiEDKdegtexeha4MfIq+6F/iAZ7RUgRsuW6wWHWzEFweup3jQKS8T3eg4gjrH/qus2ROA2tLs3sp/F4z23mE6SKOxcWATpibPZIS0uu7rse6EDHaPkzeJ4P7FHQ3K2ywi5bEXzFhinJBYhS867qrA2MAFtG9FeTIDKaCqxnAxx2R0Fkug9o3OR2thXoooxo0ZktSlHYwnW3P/3iTTtNc/eSZ4LLeRJuVLDZug/QW2eCL2LKYyOMosVYyWqRu6NV6xwaKoU8zv3RDXnGelRV4SkT/7I6eOFvT3qk54q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmVkRnI3aVlsQUs4aytPeFhUVEl2eFVGNmRxaDByT0hoM0Z4Ulg5ZTVOWU5n?=
 =?utf-8?B?MUR1R2x4Sm53b0NNL0FydUorK1NhRDNaMXFnQ0RvU21EYURpSFNKRmFqdGRG?=
 =?utf-8?B?cFVCYWNKWVY0WVhiTUpmL3Q1MlVzNkR3eXdsbSs0YXloVUNOS3N4TG9kRVcr?=
 =?utf-8?B?emRmZFIrRHU2c0ZpQUxuVTUxL0hlRkl4cW1iL3RpYnlzV01kdTAvWGJSZUNj?=
 =?utf-8?B?cGRuTnF2NWVyMWR3c3ErcEVXSFJTYlpiaG95YTFLZ1pvbTlzRnVLUWxFSHha?=
 =?utf-8?B?L1BZbXNyak1tUGdIWm5neFpYcDVydXV2N3BjRnpZMDhqN1UraUtYcHJHT013?=
 =?utf-8?B?cjFXTFJkY2c3TTAvQ0RHb2psc09LZG5JNFdWblpXN0lNWUg2aDdGQktLeFlM?=
 =?utf-8?B?TkZlWlRxV0wyTlJiZ0JtNnRZcFpoQXM1MTFoNHpGamZLb3NEa0hnOUR1Qlpv?=
 =?utf-8?B?eWpHaHFqOFpoWm95cjVsQ0Q0YXYvWExiTFNvZkZWV2R3aUQ3b0pRUXk1am5D?=
 =?utf-8?B?Q1BwRkpuNG5neWh0Mm1Ya0ZRdkFNQ05qZnEzNDNEcUp0Wnpla3NtN01obk9B?=
 =?utf-8?B?RGM3QXp2V2gzUlJZTWFVVGdZSXRVV2dRVzBQa2VBQ3V3Qk9OQTFzN0RQVTk0?=
 =?utf-8?B?bTNIdkRzSldoMXoyVkd5WU9qYVNvU3Vrclp4MHBDTENMV2VXRmM2NUNqdDZx?=
 =?utf-8?B?d3JOUUNPYk9hcFFEZStTSldOdlg0UkQydnV5ekNxVDJOWEcyemxWWDZGRHNV?=
 =?utf-8?B?RHBQMk4yQ3p6TGw0U1hUbm1UelpGd1VIY0tLVmx2UUtVNHFnMm1mU05FUUVo?=
 =?utf-8?B?RFdBSjczQ1FtTTNFWVg2VVVLczlTU0MxU3ZoN3hUQ3dYY0taMXl6eVRyUlFu?=
 =?utf-8?B?VHZ6L3V5bkNGb0hYNE5wcXE1MlV6V1N3bFRrbi9SRXkyZkxoVDRDeGtrRXN0?=
 =?utf-8?B?c1RpMWpPaU9NNjlKMnhibjdScG54S2grTUVsblB4RFJnQTgzT2liaVlxSWk5?=
 =?utf-8?B?Z2o3dlVsVy9SZ1ZxRHhyaUNVZTc3aHJkZnNobk5SbmtKVFF3WlJnMlEwMVht?=
 =?utf-8?B?dGEyWHZyUkpGeHlhL056a3pKNmtGWHI5WmpZVTByK2Vac1psRTdJbmF0M3l0?=
 =?utf-8?B?VHFFdnEwRU9rL2lDbmQwUHpWZlBSZFZFaUFweHA4SWpkQ0VxSTdsT053Y1pK?=
 =?utf-8?B?bGZNUkpWSWdiS2hYUkF5THFoZytCQ1VMalJTRmYvb0RsNHpSdGYyZlJvT21F?=
 =?utf-8?B?QkNDK28vRzJkdytoOUFmUUdVRndSVUtUYVQzTXRUcmxhUlkrYzdJa0xDT2pz?=
 =?utf-8?B?SmJiL2Z2clhodG03bVMrSlpQU29aSFpqazQ1TllWNjQraHNQWGd5eUhRT3FE?=
 =?utf-8?B?M1k3Q2h0R1hLV0JnbFRreU9mbG5RNGNkN3NVRVY4T1N0emVBWG1FWEtmQ3BQ?=
 =?utf-8?B?d000cm5vbUVCeW0wYzE0ekYwcHR1VmhxSnFNc3hxQTZuT3JBYzZJb2hYc2sx?=
 =?utf-8?B?dDlodVIzMnFQV0pRS3pScW5qRWZQMkJsMDRtU3YrbkpSWWF1ZGtOQUZTZHk2?=
 =?utf-8?B?NG5UNjhUbDVpazJSU2JjM3VsWWRJUTFEdjVXNVl0emgvZ2lHWUhuMnBnK2VV?=
 =?utf-8?B?NEV5Zm4vZkd3YVg0WVZKYVk4d2VtUkFYRlFaMHVncU54MFF3b2JMcjFKU281?=
 =?utf-8?B?WTNtOXg0d0VwSS9wT0ZHTzVKRnErQ3ptVG5GV21Zem1TZFJ6QzhOdmVGZCtV?=
 =?utf-8?B?ZS9pUXRxZ0hzb0o2SGJzV0QrbjBCNy92bCtTQjdUY3YyMEpSaDNObGhHdDBE?=
 =?utf-8?B?REpLdzRsMGhFZStCTk9CcHFwdlVudXNqeGZQbkt1KzNCT3k0WWUxWkJvbGxH?=
 =?utf-8?B?UTJza0sxaXFIWXNscEZRR1VEQ2ZSeVlYYytPTkNkQnhlcnFNK0dMLzRuVml5?=
 =?utf-8?B?bWh2V1BPdFJLMDc5dGFNTEVwcitzRkx1TXZLZUVDTFQ5T285NVkwMzREWkg1?=
 =?utf-8?B?eWRxWGdqRWVEZ3FPV1RnaUV1bzVFbVBwcktFN3Y3OWRGTjFpM2lUTGZISlRY?=
 =?utf-8?B?U0piUE1BL3hScnczS3R1bVR4LzR1RVg4SlFUOUdMYS9yQmphN05yb3NJSGVu?=
 =?utf-8?Q?m9UYWycuxw7l6lHusd9D+xgxS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f67638-b0f3-4767-3219-08dc382db6d5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 07:20:17.4736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVLZuPh5Fh8rh7yKqfuwKc06jIW8NJ0zZ60w8GN0YmA+OGz0Aafl2Y2adGpYwnll
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4241
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

Am 26.02.24 um 10:58 schrieb Matthew Auld:
> On 19/02/2024 12:24, Matthew Auld wrote:
>> On 19/02/2024 10:48, Matthew Auld wrote:
>>> On 19/02/2024 10:30, Christian König wrote:
>>>> Am 19.02.24 um 11:28 schrieb Matthew Auld:
>>>>> On 19/02/2024 09:53, Christian König wrote:
>>>>>> Am 19.02.24 um 10:42 schrieb Matthew Auld:
>>>>>>> On 15/02/2024 17:44, Matthew Auld wrote:
>>>>>>>> Doesn't seem to compile on 32b, presumably due to u64 
>>>>>>>> mod/division.
>>>>>>>> Simplest is to just switch over to u32 here. Also make print 
>>>>>>>> modifiers
>>>>>>>> consistent with that.
>>>>>>>>
>>>>>>>> Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous 
>>>>>>>> test")
>>>>>>>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>>>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>>>>> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>>> Cc: Maxime Ripard <mripard@redhat.com>
>>>>>>>
>>>>>>> Any chance someone can push just this single patch here, since 
>>>>>>> it fixes 32b build? It already has an r-b from Arun.
>>>>>>
>>>>>> Already working on this. Just give me a few more minutes.
>>>>>
>>>>> Thanks.
>>>>
>>>> No, problem. I would have pushed this earlier, but my build server 
>>>> doesn't want to work any more. Looks like the SSD has passed its 
>>>> warranty :(
>>>>
>>>> Should I push the other three patches to drm-misc-fixes as well? I 
>>>> currently can't even build test them.
>>>
>>> Need to send a v2 for that. One minor change in the test just to be 
>>> consistent with using u32. Thanks.
>>
>> Sent v2. If you could push that when you get a chance. Thanks.
>>
>> https://patchwork.freedesktop.org/series/130075/
>
> Gentle ping on merging v2.

Pushed all three to drm-misc-fixes.

Regards,
Christian.

>
>>
>>>
>>>>
>>>> Thanks,
>>>> Christian.
>>>>
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Christian.
>>>>>>
>>>>>>>
>>>>>>>> ---
>>>>>>>>   drivers/gpu/drm/tests/drm_buddy_test.c | 16 ++++++++--------
>>>>>>>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c 
>>>>>>>> b/drivers/gpu/drm/tests/drm_buddy_test.c
>>>>>>>> index fee6bec757d1..edacc1adb28f 100644
>>>>>>>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>>>>>>>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>>>>>>>> @@ -21,7 +21,7 @@ static inline u64 get_size(int order, u64 
>>>>>>>> chunk_size)
>>>>>>>>     static void drm_test_buddy_alloc_contiguous(struct kunit 
>>>>>>>> *test)
>>>>>>>>   {
>>>>>>>> -    u64 mm_size, ps = SZ_4K, i, n_pages, total;
>>>>>>>> +    u32 mm_size, ps = SZ_4K, i, n_pages, total;
>>>>>>>>       struct drm_buddy_block *block;
>>>>>>>>       struct drm_buddy mm;
>>>>>>>>       LIST_HEAD(left);
>>>>>>>> @@ -56,30 +56,30 @@ static void 
>>>>>>>> drm_test_buddy_alloc_contiguous(struct kunit *test)
>>>>>>>>           KUNIT_ASSERT_FALSE_MSG(test,
>>>>>>>> drm_buddy_alloc_blocks(&mm, 0, mm_size,
>>>>>>>>                                     ps, ps, list, 0),
>>>>>>>> -                       "buddy_alloc hit an error size=%d\n",
>>>>>>>> +                       "buddy_alloc hit an error size=%u\n",
>>>>>>>>                          ps);
>>>>>>>>       } while (++i < n_pages);
>>>>>>>>         KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 
>>>>>>>> 0, mm_size,
>>>>>>>>                                  3 * ps, ps, &allocated,
>>>>>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>>>>>> -                   "buddy_alloc didn't error size=%d\n", 3 * ps);
>>>>>>>> +                   "buddy_alloc didn't error size=%u\n", 3 * ps);
>>>>>>>>         drm_buddy_free_list(&mm, &middle);
>>>>>>>>       KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 
>>>>>>>> 0, mm_size,
>>>>>>>>                                  3 * ps, ps, &allocated,
>>>>>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>>>>>> -                   "buddy_alloc didn't error size=%llu\n", 3 * 
>>>>>>>> ps);
>>>>>>>> +                   "buddy_alloc didn't error size=%u\n", 3 * ps);
>>>>>>>>       KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 
>>>>>>>> 0, mm_size,
>>>>>>>>                                  2 * ps, ps, &allocated,
>>>>>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>>>>>> -                   "buddy_alloc didn't error size=%llu\n", 2 * 
>>>>>>>> ps);
>>>>>>>> +                   "buddy_alloc didn't error size=%u\n", 2 * ps);
>>>>>>>>         drm_buddy_free_list(&mm, &right);
>>>>>>>>       KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 
>>>>>>>> 0, mm_size,
>>>>>>>>                                  3 * ps, ps, &allocated,
>>>>>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>>>>>> -                   "buddy_alloc didn't error size=%llu\n", 3 * 
>>>>>>>> ps);
>>>>>>>> +                   "buddy_alloc didn't error size=%u\n", 3 * ps);
>>>>>>>>       /*
>>>>>>>>        * At this point we should have enough contiguous space 
>>>>>>>> for 2 blocks,
>>>>>>>>        * however they are never buddies (since we freed middle 
>>>>>>>> and right) so
>>>>>>>> @@ -88,13 +88,13 @@ static void 
>>>>>>>> drm_test_buddy_alloc_contiguous(struct kunit *test)
>>>>>>>>       KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 
>>>>>>>> 0, mm_size,
>>>>>>>>                                   2 * ps, ps, &allocated,
>>>>>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>>>>>> -                   "buddy_alloc hit an error size=%d\n", 2 * ps);
>>>>>>>> +                   "buddy_alloc hit an error size=%u\n", 2 * ps);
>>>>>>>>         drm_buddy_free_list(&mm, &left);
>>>>>>>>       KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 
>>>>>>>> 0, mm_size,
>>>>>>>>                                   3 * ps, ps, &allocated,
>>>>>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>>>>>> -                   "buddy_alloc hit an error size=%d\n", 3 * ps);
>>>>>>>> +                   "buddy_alloc hit an error size=%u\n", 3 * ps);
>>>>>>>>         total = 0;
>>>>>>>>       list_for_each_entry(block, &allocated, link)
>>>>>>
>>>>

