Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 196E585A03E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 10:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A609F10E114;
	Mon, 19 Feb 2024 09:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hIn9GaN/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFCF10E114;
 Mon, 19 Feb 2024 09:53:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqvCtZU0L7XB/H5AjJeq9SyYnqqyUsvauXwlDWNJJnRUs2+9npC1uHr8TH2h9HCS5Nt4lhIL1aDoO6WhMpYdyQy1+ZzYIg5kGKtjFowoEDhCWMKLHzJZG8iaMC1WZhcNboYF6U7rrsDfKNQ0aeCCcXyG5IYovPy6/WpKMQ0Wjhn0NSdLMaxf9zFeescbWSOwy4fbcmdwLakZEFenShFEzcxHft9R1q4I7cXrlRqZET9JybQnBXpTzSialWccP6verFFLWEXJmdy6Z63vffyXhlNLXwK+Oz7SCIZ6/h+ZFi0GzSPhDG/tYUuBcBnvFuvPb9WXyXgclgt44KYBh3zk6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXaV4/+52m15zUgV3JsORZ3KbujFLnR95sIBFc7ZxCQ=;
 b=RehN6YSEh6unlp2unmGMIYTMJXWbJndCFbGyjKSqm5SuiBUA4Cxt/L6xR5gvWNmN6b5OPIhURsJE/bXGLTB1v+21PkWjHwyF+nO/4o/OfMG44WRikAv2+sFG53IwqCTaZhXej7Dg7ZBpxylWyAmCgSbM9WsjaK/OhM2gGY3Yn8R1XtEJyu6wDEbt5gKC37NkGJoKtySVuV6Kx22jkF0iZ0VWFJaC8I78NYbkHZHSFB2myMtFjvdYcos4XxGWobosxuK7pfi2lo8RgysYe3bKs9zCYmrQXi9S7mHhXH8xI8pvVSDChuFsA1WO7G5MKBnCwuKow9k1K5ltbOz//d6jSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXaV4/+52m15zUgV3JsORZ3KbujFLnR95sIBFc7ZxCQ=;
 b=hIn9GaN/PkBDMarM1kJ5wEFAlpIvDuUp3Iz+chL68D4tYWW4DX+jww4nYE+ixohXOs1pGJlsTKPAUFejnTVk2WUFDc9PxG9ySw5Qa+YSkU456Co0SJLG2+XraF2ARTd/UEpyW5MfdRIy7G1wH7DgKD5gDaz0SToiB1WhE7w/o7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB8699.namprd12.prod.outlook.com (2603:10b6:806:389::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.17; Mon, 19 Feb
 2024 09:53:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7316.018; Mon, 19 Feb 2024
 09:53:30 +0000
Message-ID: <5a9e1f30-19fc-486f-b7f5-016d82580d2f@amd.com>
Date: Mon, 19 Feb 2024 10:53:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/tests/drm_buddy: fix 32b build
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Maxime Ripard <mripard@redhat.com>
References: <20240215174431.285069-7-matthew.auld@intel.com>
 <96bb6e97-34d9-4e4a-b618-85c17e809738@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <96bb6e97-34d9-4e4a-b618-85c17e809738@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB8699:EE_
X-MS-Office365-Filtering-Correlation-Id: 72c8d794-d208-46dd-985c-08dc3130a0cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: muDDhw+YMjn9Ac0+qhhgVVnJsUkab5hXfLUGG+UeNuEXViaCOJbCSYWqW1YvKa5OdbZLbTNhCpa8Uvid66mSuePMjDffxRHHhQY9fiVA4PNk/cy3jw2umVYIJ6A1OGZbUcnSUFF5tt1yy295Xnxb3eBev3HM6HSbpxMGBBwJYMh8cO1x/AB+7zjkUXEPeWcJNHgv5TILUaPEB5R1spJjqHfGOzrUMYHIU+CXi4Zcngtu7amaf4zrofIXbBSmLxHcShlbQUfRpS+pMy3RHvAwAZith6cFwTyu2sSc/Jog6kJAiWCkf1/9WqOxdPddt7t4atjLkLHYgdiiGWaVAX1MMy0dlU+4ZkVWj3H9AmwdGGJli8HQXsY5NFYX+YBAZbdBqs4wgAQ0pcA6zjla756zyYb1VDzMS4DqHaw85dzLeCBFyMHqnxl3nPiC4ex8cc34BufBcD/W35Q/7P60FEWfaphvXuEq9RWvqnWznF+LDs089jSYMzlUKadvl0WHBj2ds6TM4PLvPumyRDsFLh6t8bADz5gLIQ2ARWW+NSHH4rMHSnBV6EaXTPTZBLTd0yJn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(346002)(39860400002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(31686004)(316002)(54906003)(6666004)(5660300002)(2906002)(8936002)(4326008)(8676002)(86362001)(31696002)(66946007)(66476007)(66556008)(6506007)(53546011)(6486002)(478600001)(41300700001)(2616005)(36756003)(26005)(6512007)(83380400001)(66574015)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1RiTTNyaWsvdHFibVR5cVY2U1B0Y0Y3aTd3dWFPdmpxam40dDVaWThJV3Ur?=
 =?utf-8?B?QmY5ZHFiajBxTFg4VGQ1VjJZTy81ck9pSnYxcm1VVCt0ZVJaN1k3VjZGRWZG?=
 =?utf-8?B?bkFHeHZKbUxvV3hmUlZuMms1dkxrK2xFM3o3Yk5URC9DaHliY0FnZjMwNEhI?=
 =?utf-8?B?cFN4VmYraW95MmZhSVdyTGhvSERjUlBlWjZnYXJ6WlVaLysyZCtzZGcweGlB?=
 =?utf-8?B?UEJRYVFySGg3bExpKy9vMno3bFMzSXV5NnNmbm9wdU03SDlUZ01xbjJQYUdJ?=
 =?utf-8?B?blhNc092dWRkSDVNSXJTQXBZMGNUMzRHSzJ6OXd0d1g0cVpBSFdrRThtV09N?=
 =?utf-8?B?aGJ5cUZnNklKREJKQXgySEMyOGFJbnREdFVIMll2YmNnbjVaS2dBQVZiOGJY?=
 =?utf-8?B?SUg0ekZabmdXcHFCc0lQZGxNUlBZaEtyQndwWFJPV3UrN3FMK2lESUxqb0VB?=
 =?utf-8?B?YnBmL2pLVjZmU1JHRFd5aXlRdklEOEVYZkNnQjdhRTZMaFFDYkF3NkdjcExR?=
 =?utf-8?B?NnZqWkJqbjU1MHJRY0FYam5IeFFEV01vTkxMcFRyeWgrd2haNFdISkNKeFNS?=
 =?utf-8?B?YjJiaVNzQTZwYkpsd3RoUlVRVndnM1AxQ0NLcWNUTXdsc3UrOG9WVkc5cm4z?=
 =?utf-8?B?TzlndlBjOFdoODRQdGJXTi9xcUxGNFJVT0wyNEY3OGtwWjFuWm0xSGl1dkNJ?=
 =?utf-8?B?OU9GUkJhVkhoTVlxMjRnbGRjL2RDYUMyQlJiKzVSWVVXM25aTG03SkN6UEdh?=
 =?utf-8?B?cGZydVlHYmxIZCtXK3ErcnNVRFhVYVAyZ3BIQnV2dGxBUy94U01WMFdOME04?=
 =?utf-8?B?NkRGM2lpeEswTWljMWVBY1NsOW9FL2RxOEtIVThBb2JJTFFueE1CeDNNdjVK?=
 =?utf-8?B?RDRyNzVYZWh3MTBFTXdPOTRIUXI5aFNGSi9vakNpZzBQSGc5V1h3VHRFZU4r?=
 =?utf-8?B?bjFxbkF4TEw1K2NPR251RDVoNmpJNEdLY3VLU21IcEFscG5Kb21JSXR6UnZi?=
 =?utf-8?B?RmlyTG5TcXFJUUtHR3R0Uy9WcElqVWx0MWowdk13NkdBdFNrZE5lMjdMMElI?=
 =?utf-8?B?dXp3eEoxNUcxazVFQU0zVER3VXN0Z3NWNjJpSFFUVncvNlhjZ0ttQ3FPZ2s0?=
 =?utf-8?B?M1E0dEVITjF6Y2JDd1k0cWg0Yi8veHZnMWNMQ3dlaUlZS2FSVTdDUVhHOERW?=
 =?utf-8?B?Z21vRVNnZlh4WWsvSk91azRIL3hidjJnOFp5Mys1NHZFbmptWEU4RkVzZXZn?=
 =?utf-8?B?MHJnNXRXNWViNUtxYTRhVVAwVU9OMmZBcVQwRmcvWnNpc25nbm4ybDljVkJy?=
 =?utf-8?B?LzhmMUtkREQvZWRNdDVUVFJlSS9iSC9ITTdGalU5a2w0OHc0bldrR0xzR1Rs?=
 =?utf-8?B?WVdYZmhIRGRWcUdaUkR3RlBZTXF1VURxVGFoQk5XOUZEU3p1UTlTbXFCblhD?=
 =?utf-8?B?WHpIMjFncmQ3K2kyd1ptODdYSkhkZldKOFBtU3hFU3ZsTS9lMkRuUlFEdGN3?=
 =?utf-8?B?eXVvZjU5aktFN2oxTGZCTG9LeUp5M2lhQ2phTGxvbk1xcFg1YWdxMHBpem5O?=
 =?utf-8?B?NUl6Rlhma0tsOFRSc1lSV21vTGUvWU5tRjdZSW16TE1VZHd1Umh0bnRmaUxq?=
 =?utf-8?B?M1JyVy8zNEhJdjQzS2h2KzFNZm5LWWxBOVlocEZvbW1oMmhzbGtZcW1SKzZr?=
 =?utf-8?B?WFJ5SFpPWmVYU0sxcUJxQlBsbHB6ZGF0bkRHRTVDRWp0RmJjVldqNzl5OUMz?=
 =?utf-8?B?Y3gxckRsQmJxMWZGSmJQaFNDRFZ1SEJwcXBlNWJMUHRZSlMzRVZvTHIzS0Fz?=
 =?utf-8?B?cWZvKzBJbjRqaUlKdU93TUpvWTh2eFAzOVVRa2JUc3dOY1pSZzFFQVBxekRp?=
 =?utf-8?B?SWtVK1did1Y1TlZNdExYaHovcmlaU0RaY1RUQkgrTXY3VmU0N2V4dXZ1ZEw5?=
 =?utf-8?B?VUFBYklzMDdPT0phK0xvNXJGV2lmK3ZxaDVFMDJkN2NOSFU2WDZyWjhua29P?=
 =?utf-8?B?V0hXMmQzelJPNzNDN01PdnhrbEVwR0VQMmVJTUlhVk9MZXJQQ3UrSjdpaWJN?=
 =?utf-8?B?bGVHQ0Zhb3R2SXRRR1ErT1pYcmg5d0tYbGhHcnNYVnc4ZjQ2S2NXYWluRm01?=
 =?utf-8?Q?X+vA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c8d794-d208-46dd-985c-08dc3130a0cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 09:53:30.7191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6UU+czXPKNbMOf5+EGxUoiHzj0jskGgDumOiZuX2STH3v72KxpTRA0M3na1pSrlV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8699
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

Am 19.02.24 um 10:42 schrieb Matthew Auld:
> On 15/02/2024 17:44, Matthew Auld wrote:
>> Doesn't seem to compile on 32b, presumably due to u64 mod/division.
>> Simplest is to just switch over to u32 here. Also make print modifiers
>> consistent with that.
>>
>> Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous test")
>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Maxime Ripard <mripard@redhat.com>
>
> Any chance someone can push just this single patch here, since it 
> fixes 32b build? It already has an r-b from Arun.

Already working on this. Just give me a few more minutes.

Thanks,
Christian.

>
>> ---
>>   drivers/gpu/drm/tests/drm_buddy_test.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c 
>> b/drivers/gpu/drm/tests/drm_buddy_test.c
>> index fee6bec757d1..edacc1adb28f 100644
>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>> @@ -21,7 +21,7 @@ static inline u64 get_size(int order, u64 chunk_size)
>>     static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>>   {
>> -    u64 mm_size, ps = SZ_4K, i, n_pages, total;
>> +    u32 mm_size, ps = SZ_4K, i, n_pages, total;
>>       struct drm_buddy_block *block;
>>       struct drm_buddy mm;
>>       LIST_HEAD(left);
>> @@ -56,30 +56,30 @@ static void 
>> drm_test_buddy_alloc_contiguous(struct kunit *test)
>>           KUNIT_ASSERT_FALSE_MSG(test,
>>                          drm_buddy_alloc_blocks(&mm, 0, mm_size,
>>                                     ps, ps, list, 0),
>> -                       "buddy_alloc hit an error size=%d\n",
>> +                       "buddy_alloc hit an error size=%u\n",
>>                          ps);
>>       } while (++i < n_pages);
>>         KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>> mm_size,
>>                                  3 * ps, ps, &allocated,
>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> -                   "buddy_alloc didn't error size=%d\n", 3 * ps);
>> +                   "buddy_alloc didn't error size=%u\n", 3 * ps);
>>         drm_buddy_free_list(&mm, &middle);
>>       KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>> mm_size,
>>                                  3 * ps, ps, &allocated,
>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> -                   "buddy_alloc didn't error size=%llu\n", 3 * ps);
>> +                   "buddy_alloc didn't error size=%u\n", 3 * ps);
>>       KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>> mm_size,
>>                                  2 * ps, ps, &allocated,
>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> -                   "buddy_alloc didn't error size=%llu\n", 2 * ps);
>> +                   "buddy_alloc didn't error size=%u\n", 2 * ps);
>>         drm_buddy_free_list(&mm, &right);
>>       KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>> mm_size,
>>                                  3 * ps, ps, &allocated,
>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> -                   "buddy_alloc didn't error size=%llu\n", 3 * ps);
>> +                   "buddy_alloc didn't error size=%u\n", 3 * ps);
>>       /*
>>        * At this point we should have enough contiguous space for 2 
>> blocks,
>>        * however they are never buddies (since we freed middle and 
>> right) so
>> @@ -88,13 +88,13 @@ static void 
>> drm_test_buddy_alloc_contiguous(struct kunit *test)
>>       KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>> mm_size,
>>                                   2 * ps, ps, &allocated,
>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> -                   "buddy_alloc hit an error size=%d\n", 2 * ps);
>> +                   "buddy_alloc hit an error size=%u\n", 2 * ps);
>>         drm_buddy_free_list(&mm, &left);
>>       KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>> mm_size,
>>                                   3 * ps, ps, &allocated,
>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> -                   "buddy_alloc hit an error size=%d\n", 3 * ps);
>> +                   "buddy_alloc hit an error size=%u\n", 3 * ps);
>>         total = 0;
>>       list_for_each_entry(block, &allocated, link)

