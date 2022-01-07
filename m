Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B380487A04
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 16:58:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8F211A76B;
	Fri,  7 Jan 2022 15:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD7811A74B;
 Fri,  7 Jan 2022 15:57:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5RhiTgFg+tJwlz4Pzk1Pba/ITgI9gre0F/TIv+fBJTm/klAwbAOSH+5eDcI9qbjFu2VUhUHbIQLwx+N0jXozsyYOXIKgH4KBy5ZWv0ZD+guzeUncIozM3LdSbhZ8PJF65XyD5uKRsvyrCKOt1zbiCqGePcVQSt/2ocBZl/C8QjQOB8Ht+nA6pwbLqPoaT84WTgVgc1jg2T0HNaIKypAygIYqjpPSSHU0LMoE+uqddKZbR7vJjo//dFLs1/ML2qghtiU+ki8bia82yf5UFw7zVH7/b6l5c0/wtLIZ0SIn9xNglQk2dpCaiwMs/aqqfHT06g6p3HjrKSGv8afOjCyng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WV5U2Ds3uuXOEMKCAazASENJCVm/9k4zpIqcI7w2+E=;
 b=mALvO07bO4XzQsVyMEc+3RLa5qMLq16X+buYH8m1OnR7REohDjBZBlU5FznqEUY0rcTHcOTS+Cx2XoLy51WhI9xo/UBuo+1dxBQlM/2stgQA6BB4M+N8JL3cbHbABuihwotRTeuY43oapMoBNrAcU/Of2GbvBbi2ZOXIjmABe2UnyxKQ9Ov+C5WYWAsTigqf9wFeqEaz26IGHsU12K+2TGE7GaOWlDNAP1+wIkzlPWurkoikK1RFtnUMQ4/4l/LUr1pec3/75UqYfVuYnRmpzKzuo68d8UofwyJbN+M8tmYrdx+8Ho2GVrKcX9GTmb85cHcYI9YyMrjXUQcR1MPHSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WV5U2Ds3uuXOEMKCAazASENJCVm/9k4zpIqcI7w2+E=;
 b=lLAXr3UTw+/4dNpfA2M3PkRP0OWe11g1yvGjkFyUbmfR33l08Ftvq1RkYmMhG41JLiUHJSX0Dwe3XYc6Zw6dccAaRsS8B/iJT2Iy3XZYfs6AuourdZgmnZSm6EbAmaxWb9XuUwRjrJaTTy7KM+P5cCe6O48CzOhGU1XCoS+VMV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com (10.174.101.14) by
 MWHPR12MB1343.namprd12.prod.outlook.com (10.169.200.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.9; Fri, 7 Jan 2022 15:57:55 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 15:57:55 +0000
Subject: Re: [PATCH v6 1/6] drm: move the buddy allocator from i915 into
 common drm
To: Matthew Auld <matthew.auld@intel.com>,
 Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20211226222425.544863-1-Arunpravin.PaneerSelvam@amd.com>
 <1d1a4278-5aee-20d5-b536-7ca199e85e93@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4053214f-bbb2-b6ad-37e9-4a579792a4b3@amd.com>
Date: Fri, 7 Jan 2022 16:57:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1d1a4278-5aee-20d5-b536-7ca199e85e93@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6P194CA0059.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::36) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd211785-b197-4c54-385c-08d9d1f677aa
X-MS-TrafficTypeDiagnostic: MWHPR12MB1343:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1343EB0F70AA803CA326567E834D9@MWHPR12MB1343.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tAgXV75sfDQrq4fcekoiTtsqjrlExh06Kqc/alFi6CbSuQ3Q/t0ctXsqzZpGRmUuHKhXR3HlkB5nzIM3RqfIlZfUltylZ00zJUCsczZYGqfusIWJn2eOF3XPRiCGyo5KqpSgKm4IWNI2jvy8a4Y5cMmmi4kLvR1b4PNlyzgoMZAQ9eoWS1FW5WGgUBeYROW9EUE+9jqxYTdeiBoIARxu8TQl4nJ2URNTjIxvRu0HHXWWq7y4KqJ/lXB0dr7AwpA3493bjOLY73hTAnfXUDqaBbMADvtrs7qI517TKWGPioBTOvYZ5yQtEfbu+dONsFXbq44s3cvIWnaA+W4DaUq1FvX1htR55xUp38q2Hp31wQCpZfF/loTYJervZlxpyHSa35Jcr9C1WNqZdaHbSOKoXE6KvJzRJ3vH+fi7FP0NXVrSQpGZZML3W8c14WjiszF7xYtkP3p7aj4FJb3IcHUaFlmtNORKLJRNrLqnSpLc9PeRDLCqhNErvX/eAgtaVy2+lKABMVZQRRycE2ib2eUzhptFdCnH79qzPlFr01AaegMYZ046WkX/8is5vANlNbds6hJma0XgF1jLnVDSV64HWsEFhzGACn+GKJcoIbvXP73HgUyBK9iPIWaA56ebNVfZBMfObsxHne2fpkeJqZdIOwe7O0T38Xqg51h6C9XuLPuRnvUaykfkK5yC6OLNfoFV4VQsFT4y8dasPiXUyzgbjXmpNFNgkdfN5/CnGrt561X59A5o6tpKsNDmz3e/G9TCK44oY/knxbrMFVHnaBlrQssGXqDUPh16EnzbpKijLrdj5ZpPHhVEuY3UxOOh9kms
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(4326008)(6506007)(53546011)(6666004)(316002)(38100700002)(36756003)(110136005)(8676002)(6486002)(31696002)(66476007)(2616005)(31686004)(8936002)(66946007)(66556008)(186003)(2906002)(45080400002)(508600001)(966005)(86362001)(5660300002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1U5TnJzUHRkb3FOL2pxU1ZUWkhOWko1dzhUaWp3OWNEWGV6bC9UTkV3UDlY?=
 =?utf-8?B?UWhrMkQ0K0pyTU40VGpwYk9wcXNhdWQzU05oUG56RzBRU0dNOThzUFZsZkRW?=
 =?utf-8?B?clJKdHNzVzJSZ3FucjJCYmJHd3NrSFJTRVlNdkd6VXplQWdPSVBKQ25md2Mz?=
 =?utf-8?B?VzhpSVYyVHRPblJyVGhJVmxvTVA0SnNLT2N4dndZdFQrbVBRYjhrTmUrdjkw?=
 =?utf-8?B?d3Y4cTV6L1VJT1BrTkk3ci9iZEpJZExtMlV0bHJYYkF3UFRHQ2dabVQzcXQx?=
 =?utf-8?B?KzJZVmFWakt2NTQ4RytseFhPcm1iQVlTNUJhb25LQ0ZiU205TkFmTmZ0eVBV?=
 =?utf-8?B?bkUxY0Y5MnYwQ0xYQmpHUU5kUFJtdVF4QzJ4YzhtVjBjQ2FzRTRZYXJXNVhy?=
 =?utf-8?B?VDl1a1NSUTNoN3ZPVzVSS0dhQnUyWEZLWGx0c1dmZFEza1gycUJWZDczaHpE?=
 =?utf-8?B?U0xraXZXbmVDMS9xTjZqQjlyQU54VUdhMDh1Q29nTTNuQzJrQ0lQMWxMbkNU?=
 =?utf-8?B?RzkySlRveUNaYXBsQlhFMTRiL0llWFBKS3hRbnJxMnlpaStVUW0rUVViRlZo?=
 =?utf-8?B?SkhzTllYUENLMjAyR1NRZGhRUkY3Ym5nZ3VJbGU4ZGY4SmZJbllHQ0MxaW9P?=
 =?utf-8?B?dEtaSGllU0owd0RMZ1dOZVFrZDEvVy9NWG8wRUVpck40NjJxS0tXNUI0T2V2?=
 =?utf-8?B?YjMyVTFRTmZiK3NnOGVxTXVGaTNGT213SU85VFVKckJUZFU1VWo0V0w2dXBX?=
 =?utf-8?B?RUVyT2tOSkpDem56bnJCYldMRUhBSUJsS2Y5aWlVUVdFR0Q0K0VWK3h3eGFL?=
 =?utf-8?B?SmgxL0czWGIwVzJkd1lWWExRMDdGNEZBdTFqczVMcU9BNVVhQk5QdTRiZUNE?=
 =?utf-8?B?Y2UrVGlpNDRyOGVzWnV4OU1LVXB0ZVVvZk1udnl0cmlmb0lEb0xVYk82Y1NZ?=
 =?utf-8?B?WGh0aFRDc0hrWW1vb0Z5S2c2eDRKZDB6UGxXZGUvZmlISkdiMWd5VVRHNm5z?=
 =?utf-8?B?YnR1V1puWlgzczBtM0FZOVNwV05lZ0dXcnFhKy9DcDRyUnJNTmQ0WWpXRGMr?=
 =?utf-8?B?cG8yMDZySEwyT0g0WHUvem1pTnY4VytERitJSWUzSUw2bmxXZWR2TzRZYU5Q?=
 =?utf-8?B?bThLUVUzelZGR1FSMFN5bnBreEJ4RUFXTElQRERpaURvQVBqRlJ5RXhaRWVD?=
 =?utf-8?B?WTdmcGVpMXpubUFCZXk5N2czbXFuN0tGTDZiMWdrOWVRcStaVyt4Sm40S0pj?=
 =?utf-8?B?Y0ZiYmlFanJkUHZRMytIRG1FaC92VFF1c2dMWXBIZTJQY2VUWkVCSkhRd3Zl?=
 =?utf-8?B?MnBTam5DcFBrNXFoaUF6MThNNW1wQzExLzZHU2w5MmIwaGp1QnRaTGtmSlpQ?=
 =?utf-8?B?YzNYVCtsc0xSd1QrZ0NqNk4vRnNKMUZmQW5KSXUxVWNlYldNT0FTN1lvVDdL?=
 =?utf-8?B?cUdEQ0lqTThYc0NDekZHMmU1cXJDU2tLSnAyVkEwSFZxQVpmOENvTWlMYXUv?=
 =?utf-8?B?QVlaM3B2dktURmhwQVY1aHl3UncrM3dCOXBBNWM3ZE1IZDFHWkp0WE5uYkY0?=
 =?utf-8?B?VjBQbzRqY2NEMVpBZkw1RU42YkhjbnRhM0lmN0ViY0FjalJaN1FmVVFreThk?=
 =?utf-8?B?aGk3ZEdLMzVYeTFEUWFQQllxeUVwSDU4OEtEaUdEQVdEdGFTUm10TmVCRDR3?=
 =?utf-8?B?dkxBaGltenRWZW5KZTkzQlB0anZKcE15OTIxT1lYV1F0N3dwZGdsc0J0SFlU?=
 =?utf-8?B?UXRsaURCVGtkY2RObkx4T2xseG8wYTVjUXFoMG96RldPWE5hNVBWZEFRdE9t?=
 =?utf-8?B?VE0zMkdVcjB5RjVBVDUvdGdYOEMzcUlYMUtBeE9FalZ6cWZsclFHMW9kV3A1?=
 =?utf-8?B?QXBpbk9HU2srODIwU2hRQWNHMThmb3NqL1Z2bHlvMXdrWkpucko5cXVIT3Vq?=
 =?utf-8?B?MC8va3JsRWk0dkpXMHdIT0hLUUVLTU5NOE9RVTNRZ2plbDlRd0d4RE4reG81?=
 =?utf-8?B?Vk5ibS9WTldQZThrbUtjMWVTRVhzdmhlZUZWaWM1WWhaZ1ZzRk9VNllVZjgx?=
 =?utf-8?B?QjVXOWM5N0F5R3Uxc2xQSjhXc21YQU82ZWdlSzBKSWQrZWVoWjNQNnN4aUpD?=
 =?utf-8?B?enZaeWRBem5GdmVlNm9NdnF4MkY0WVJJZ0dJZ25Ta0N5dGJEMnZ3NHl6OUdP?=
 =?utf-8?Q?LNG7PnjWBMfuRj2yCQpeuv0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd211785-b197-4c54-385c-08d9d1f677aa
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 15:57:55.0846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZUbjzYjQkOzvaFCTKSnay8VhSXWSg0nvoicpAAtgVh07EYosLlwVPRvqSdDGeCsj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1343
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.01.22 um 16:49 schrieb Matthew Auld:
> On 26/12/2021 22:24, Arunpravin wrote:
>> Move the base i915 buddy allocator code into drm
>> - Move i915_buddy.h to include/drm
>> - Move i915_buddy.c to drm root folder
>> - Rename "i915" string with "drm" string wherever applicable
>> - Rename "I915" string with "DRM" string wherever applicable
>> - Fix header file dependencies
>> - Fix alignment issues
>> - add Makefile support for drm buddy
>> - export functions and write kerneldoc description
>> - Remove i915 selftest config check condition as buddy selftest
>>    will be moved to drm selftest folder
>>
>> cleanup i915 buddy references in i915 driver module
>> and replace with drm buddy
>>
>> v2:
>>    - include header file in alphabetical order(Thomas)
>>    - merged changes listed in the body section into a single patch
>>      to keep the build intact(Christian, Jani)
>>
>> v3:
>>    - make drm buddy a separate module(Thomas, Christian)
>>
>> v4:
>>    - Fix build error reported by kernel test robot <lkp@intel.com>
>>    - removed i915 buddy selftest from i915_mock_selftests.h to
>>      avoid build error
>>    - removed selftests/i915_buddy.c file as we create a new set of
>>      buddy test cases in drm/selftests folder
>>
>> v5:
>>    - Fix merge conflict issue
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>
> <snip>
>
>> +int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size)
>> +{
>> +    unsigned int i;
>> +    u64 offset;
>> +
>> +    if (size < chunk_size)
>> +        return -EINVAL;
>> +
>> +    if (chunk_size < PAGE_SIZE)
>> +        return -EINVAL;
>> +
>> +    if (!is_power_of_2(chunk_size))
>> +        return -EINVAL;
>> +
>> +    size = round_down(size, chunk_size);
>> +
>> +    mm->size = size;
>> +    mm->avail = size;
>> +    mm->chunk_size = chunk_size;
>> +    mm->max_order = ilog2(size) - ilog2(chunk_size);
>> +
>> +    BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
>> +
>> +    mm->slab_blocks = KMEM_CACHE(drm_buddy_block, 0);
>> +    if (!mm->slab_blocks)
>> +        return -ENOMEM;
>
> It looks like every KMEM_CACHE() also creates a debugfs entry? See the 
> error here[1]. I guess because we end with multiple instances in i915. 
> If so, is it possible to have a single KMEM_CACHE() as part of the 
> buddy module, similar to what i915 was doing previously?

Oh, that is a really good point, this code here doesn't make to much sense.

The value of a KMEM_CACHE() is to allow speeding up allocation of the 
same structure size between different drm_buddy object. If you allocate 
one cache per drm_buddy that makes the whole functionality useless.

Please fix, this is actually a bug.

Christian.

>
> [1] 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fintel-gfx-ci.01.org%2Ftree%2Fdrm-tip%2FTrybot_8217%2Fshard-skl4%2Figt%40i915_selftest%40mock%40memory_region.html&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C56202fbe886f415c3b8308d9d1f5409c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637771673545453215%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=ZnRmAQo%2BjX414hbqHigL4R18oBDKLIugUQIVcwhFI%2BY%3D&amp;reserved=0

