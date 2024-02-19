Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9EF85A104
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 11:30:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA2710E0F5;
	Mon, 19 Feb 2024 10:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZrdbNcs7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EF010E0F5;
 Mon, 19 Feb 2024 10:30:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEm7FPOMfDE01moVyN8WyvGAy+vArZmk42/vHBM0nvTTyGIBy9mtqPZTl5MpeItDcXUSgC+iEiNkJpdNzd+monRvtAtXmMYncITs0P6iN2kS2rFObiFF1waP10baC1v227OQ5drBa6D4Dd/NymlG0JPZpXP9T+6MJVtW1PUQRU7NlVBYxruTs9jF5aedZKRctAXATAOD5oUhlljsFB6VcS3Q8J4Dls1uIU/S9AP6d73HvD9xGs5QFRffbBliTsUtvrskm7iKU+LIaGtNExnsK2Q2tCxq56a6OmDODlavoT5lO7rnpEdBHb/aZ2N9wSXTF6TfbOVqRZ2vrJm9IkgQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imm7SDA1L7miqvqtjWFFFebhdbqMT191dyjBiC3Vnus=;
 b=Q4aWJmFy0q/YXQSBbS/x1SSIYQqvnncwxvSuUhqBVZVhf+7Tjl1PTT9BcEYXDpXmiwoZl9qk3HTQ+RGJcNVjGhgpSNOba0t69UkDRAC9AZvHlVSndxnEgf2B/+LWr3/rlyMjGoxO/GWDRjMgx0fnOTDd2HDYBws/PNFerfQEFjgwzEiBG2hMrZL9rJjRkhv2VRF5f4rN6dZieROOq2D76hXlPEh2aPOB6R8En9eYDUIWeD22XVgif+xUTcqX7NK1N7/lXOv0V5whQnldJ3NL6q6rJud6Ko1QStNBJFjvRs15OvGaXDXdYmNoyUfEwbbeZpluJT0043JukxoDVe4fvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imm7SDA1L7miqvqtjWFFFebhdbqMT191dyjBiC3Vnus=;
 b=ZrdbNcs7iI3JpS6d1DRTDrJ1E5MniTzuGJ9nJo0SqCkL2239R/5u+HqPWS7jJ6vwNl1p79OGnf6fhIlSLTAFpHxVmr+WHuUh3akDpMvebD+F149fJiXtHOs6L7aateZKwrH+9N7EJtmGDB+8ZmtSv3lOsH9/SQJvMDvq+fnXPwk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYXPR12MB9426.namprd12.prod.outlook.com (2603:10b6:930:e3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Mon, 19 Feb
 2024 10:30:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7316.018; Mon, 19 Feb 2024
 10:30:36 +0000
Message-ID: <45059d66-6e80-406b-aae2-72f8b8d142cb@amd.com>
Date: Mon, 19 Feb 2024 11:30:31 +0100
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
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <4aea62d4-8c2a-4406-b81e-240dca772da4@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYXPR12MB9426:EE_
X-MS-Office365-Filtering-Correlation-Id: 3255e3cc-470d-47e5-d7e4-08dc3135cfaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zCSk2LgL94vdy/bWyBgyDh4rQiHyup2RqrzaeaAmdSEqLw+JVtP4XPp4+e+2a/UxJJGh3+uV35Dt+u/eIQxnVpb7tSUJOTWf+l1CLSBXzsQ+I04m7zIJCKK9W0h6Sovw49fr1YfL9GEPIrQQMungWdz/xc0DmsmmeJkwOqOZotvrhht3z1hwIZ2AnH5uj/nIO/8KNA8eEumJn31/BySFRdta2obtVzzfTS/U+2gFFBG4FKbwgFXpXAMRHPDLz01ZdYb+zamPbLYlR3BqlP+xNtNgpDtdhmNb1Ckjm+r7YYiUJIiYo8yJc5zPAKSjgY3RQi/Cubv4fbZ8Ns2sqycHlk6A205wWuvUBv4jkTmUm+91Oe0BF3fwfqYwARQGh6oC7MzZqlOlpPEWut8zkQxARkVf/lgOBJcvExpFJwpfUfZkN8DEb0rGJJvy5zh9ANHxEsvuNUybZ4PGvQzNPuZ0lh3KP0XuSdoDxEA4z4XfJ44wiwLCSFGTT9f1N0Ky4jWkSkgYM7hMS++PcVBGMni5Agmn6LX3jt8lvOi6se6aIOY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDNNMVloMEtDdUpFMENNdXI2VVR5OER6NXk3MU9vUThQeGMxb2pacUJCOTRx?=
 =?utf-8?B?Qzg5QVNmZWJjWk93VTl5ZWt4c1VNL0Q2aENBb3RubVhCQjVpdHU1dG56UlA3?=
 =?utf-8?B?bWJpYndid2dWR08wQTlBdlI5UjB6bExTRHVtNFdFNDByek9aSDNmMy9tbGY3?=
 =?utf-8?B?L0tKR1BDWFFodEpzZXlHNmVuSGRmUDhIN0FwWk9XSTZzNW5qekVtTVNOaDU5?=
 =?utf-8?B?cVhXSzNYc0YxN0hOQzN1V3psSzYvRTFkRXBQeXdkUnVEODRHS01QZDRuTVpa?=
 =?utf-8?B?OTJUcUJKQVlFOXhWSUtUd00yOUcvQUJiQ2J1OTlTakZkclFvZzlnWDRNRGxC?=
 =?utf-8?B?SDVzaDZ4aGwzQWRlUloxSWZTbTZ6N2txZjdUS1dXSWIrZ1pEK2hZN01kZFQz?=
 =?utf-8?B?R0lhbS9tcHRQemVjODlNQklHeDhuaGd6dlgvRU85U1BEeHNkV2pycU83VlRY?=
 =?utf-8?B?U0o1ODFsYVBpcTQ0bjFucHR2enBMS2dIR2ZTcGpaVHRpZmE1dW9PTkxYWHFC?=
 =?utf-8?B?clVGYmRkNXdacUsvRXdFNTRaMmhlcEN2S3JIWmt6NFhYRXUrajVoQWRFOFE4?=
 =?utf-8?B?RTZYaXpMUnBJSHRmRDJra21RQzgxeXpnUWF5UTNWVVBWcXlQaXFRU3NJZEw0?=
 =?utf-8?B?QXJZSFJhRHFBSHhrY3RIajlVSDcxUlJ4VW95Q3JRUzZPY2ppQTJHSUxwTTM3?=
 =?utf-8?B?cVMzcElVZ2VFbWhxbDh1UjZKM2prZkI2bHA4L1RVV0pMODZ2K1ZZcTkvK2Fz?=
 =?utf-8?B?ejRXUXozR2dHVWxnTThUYXN4L3RzWTlNS0ZYUnU2ME9ZWjhMSGtSbnB4N1Jo?=
 =?utf-8?B?QitsSnRSTnE0V2hYMm93Z0I5eUVSakpTT2dNeVVHaUlDTUp1LytSdDJ2cXow?=
 =?utf-8?B?enRnSWFpQnVybUZ1dDdtZERYdnRxWWlLSi92Qk00a1BrUERodERySG16SzlV?=
 =?utf-8?B?ZW1vNjVvL0ZQWDNrSFJJaVYrR0JucU16WkZ5WmNPSjBoZGdFQ2tNR0V5V0Uv?=
 =?utf-8?B?Rnd4MnNuSmprcG1jWEdhNE1JS1F4N2dWRHR1d284cmswOUFhUThlSkdOTVpu?=
 =?utf-8?B?YWswZzQxdnQ2cFlHZUJXT3pNOHVkL1FrV2phWHBNa0M5TjJwSmpCTEhzWG1r?=
 =?utf-8?B?YW8xTmVhUFlwRHFVazA5NGN5TzI5bTlqaytZdU9QelhCSFhmWktRRDl6MVdH?=
 =?utf-8?B?b2VYYzhnL1JveXFmK1JrcXdPOFNKa3hGTUZpTm02eDB2ZkREZHNxcjAxRUZK?=
 =?utf-8?B?TXQ1blczN0dLam1TWktPc21naEgzRHA1NjNoT2I5cVBQbCtFdXVLVi92NGwv?=
 =?utf-8?B?eVd5aWJnMnFyU1BsVlZ6bGtqOTFXby94MW81eFA1WDI4a3E2SEFuaHZMREpt?=
 =?utf-8?B?T0dqK1BhcmI1TytaM3U2VkhhVGErVENKOTROc1ZKaG5GOWNCQXB3RWdEQjht?=
 =?utf-8?B?bGhudmtIQTIvK0hKZVB6WEsrWW8vUWhKZ29IRUtwS1VtQjVyeHNMTWtBK1dq?=
 =?utf-8?B?bndwMWNjNnliT0lqZC9peFJhUk9IcFZCOEZiVlFIUEZhRHJINUVudDcyVTdO?=
 =?utf-8?B?MklYeVZwT0ZJRGt5MXNnTGJGaDZTckNyekcwZjdKOE8wOStoQ0R2YWRROVBa?=
 =?utf-8?B?STRjNHgxb3NheEZ5bUJzNHQ0cGZ0cisyTUxuNnhMRDNYbWNBSWMwZzZzRjB5?=
 =?utf-8?B?ajV6Yk15alJLTFRoMmZzZXhRS01Rb0RmeldsUXpGSms5RDQ1QkhXS1BxLzRo?=
 =?utf-8?B?a25QcmJLRTZBemVDYjlZbXVscUpNbmxFM0p3aUtnVDg2TCtmcEg1U0t5WnVr?=
 =?utf-8?B?VWNZSTFyejVFMXA0ZjRwbUF6QnZMYUczMHBNZE9vK01PeDRGSWR3MHNackI3?=
 =?utf-8?B?VTd6NnJocHFyS2JLY3BMY1VxTTZxUFVKV3djWTJiOGloVWF0M3ZINUp4SzVO?=
 =?utf-8?B?TWMyVDRuZXpOSHVlMXFYKy9JNWFNUnUwVHd3OU9panVLcjNTeWQxRmVZeVRX?=
 =?utf-8?B?dklLSnc2Zkw4RmRJYW82RFNZcXVQaHhHQVdCdWxGQ290dk0xajh2NlZ0bGVh?=
 =?utf-8?B?UHJTVjNJWFAxcmttcmRXQ1VxcGZjbENJUElmK3F5WXR0bDhiTmUrY3oxR1oz?=
 =?utf-8?Q?ziv/PPVZfPVTTDgUyqNmA8qHY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3255e3cc-470d-47e5-d7e4-08dc3135cfaf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 10:30:36.8330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+XyJK5fOkkn+Gf7DFPN4+tHMVymYHn8P4SX+0iIuLvhFliSuP2r2iCHoQJfZLss
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9426
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

Am 19.02.24 um 11:28 schrieb Matthew Auld:
> On 19/02/2024 09:53, Christian König wrote:
>> Am 19.02.24 um 10:42 schrieb Matthew Auld:
>>> On 15/02/2024 17:44, Matthew Auld wrote:
>>>> Doesn't seem to compile on 32b, presumably due to u64 mod/division.
>>>> Simplest is to just switch over to u32 here. Also make print modifiers
>>>> consistent with that.
>>>>
>>>> Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous test")
>>>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Maxime Ripard <mripard@redhat.com>
>>>
>>> Any chance someone can push just this single patch here, since it 
>>> fixes 32b build? It already has an r-b from Arun.
>>
>> Already working on this. Just give me a few more minutes.
>
> Thanks.

No, problem. I would have pushed this earlier, but my build server 
doesn't want to work any more. Looks like the SSD has passed its warranty :(

Should I push the other three patches to drm-misc-fixes as well? I 
currently can't even build test them.

Thanks,
Christian.

>
>>
>> Thanks,
>> Christian.
>>
>>>
>>>> ---
>>>>   drivers/gpu/drm/tests/drm_buddy_test.c | 16 ++++++++--------
>>>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c 
>>>> b/drivers/gpu/drm/tests/drm_buddy_test.c
>>>> index fee6bec757d1..edacc1adb28f 100644
>>>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>>>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>>>> @@ -21,7 +21,7 @@ static inline u64 get_size(int order, u64 
>>>> chunk_size)
>>>>     static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>>>>   {
>>>> -    u64 mm_size, ps = SZ_4K, i, n_pages, total;
>>>> +    u32 mm_size, ps = SZ_4K, i, n_pages, total;
>>>>       struct drm_buddy_block *block;
>>>>       struct drm_buddy mm;
>>>>       LIST_HEAD(left);
>>>> @@ -56,30 +56,30 @@ static void 
>>>> drm_test_buddy_alloc_contiguous(struct kunit *test)
>>>>           KUNIT_ASSERT_FALSE_MSG(test,
>>>>                          drm_buddy_alloc_blocks(&mm, 0, mm_size,
>>>>                                     ps, ps, list, 0),
>>>> -                       "buddy_alloc hit an error size=%d\n",
>>>> +                       "buddy_alloc hit an error size=%u\n",
>>>>                          ps);
>>>>       } while (++i < n_pages);
>>>>         KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>>>> mm_size,
>>>>                                  3 * ps, ps, &allocated,
>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>> -                   "buddy_alloc didn't error size=%d\n", 3 * ps);
>>>> +                   "buddy_alloc didn't error size=%u\n", 3 * ps);
>>>>         drm_buddy_free_list(&mm, &middle);
>>>>       KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>>>> mm_size,
>>>>                                  3 * ps, ps, &allocated,
>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>> -                   "buddy_alloc didn't error size=%llu\n", 3 * ps);
>>>> +                   "buddy_alloc didn't error size=%u\n", 3 * ps);
>>>>       KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>>>> mm_size,
>>>>                                  2 * ps, ps, &allocated,
>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>> -                   "buddy_alloc didn't error size=%llu\n", 2 * ps);
>>>> +                   "buddy_alloc didn't error size=%u\n", 2 * ps);
>>>>         drm_buddy_free_list(&mm, &right);
>>>>       KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>>>> mm_size,
>>>>                                  3 * ps, ps, &allocated,
>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>> -                   "buddy_alloc didn't error size=%llu\n", 3 * ps);
>>>> +                   "buddy_alloc didn't error size=%u\n", 3 * ps);
>>>>       /*
>>>>        * At this point we should have enough contiguous space for 2 
>>>> blocks,
>>>>        * however they are never buddies (since we freed middle and 
>>>> right) so
>>>> @@ -88,13 +88,13 @@ static void 
>>>> drm_test_buddy_alloc_contiguous(struct kunit *test)
>>>>       KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>>>> mm_size,
>>>>                                   2 * ps, ps, &allocated,
>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>> -                   "buddy_alloc hit an error size=%d\n", 2 * ps);
>>>> +                   "buddy_alloc hit an error size=%u\n", 2 * ps);
>>>>         drm_buddy_free_list(&mm, &left);
>>>>       KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>>>> mm_size,
>>>>                                   3 * ps, ps, &allocated,
>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>> -                   "buddy_alloc hit an error size=%d\n", 3 * ps);
>>>> +                   "buddy_alloc hit an error size=%u\n", 3 * ps);
>>>>         total = 0;
>>>>       list_for_each_entry(block, &allocated, link)
>>

