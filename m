Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4CF69F65A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 15:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF7210E9CF;
	Wed, 22 Feb 2023 14:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFB310E9BD;
 Wed, 22 Feb 2023 14:20:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7rYirnGyAXrNEKO2YQTehgXYnWRbkR8vJM233aHReHvqB1A1d28IeptiQetfgEi9e5kvahfcwfVR4r8VnsB4zeW5BQTNK/CjR7ekZEHkIcB+qMSxK+3nO/sHPUZNBCTEUkgZAUt6n7oZ8PI94t8/EZZnjbxLKk57eLgel6/bXzRgUXnbBkwlq5CczmPd26OJ4FUlQ3gzzJdzmmyiu2IMnuzCNAC6s//qE+D68LhGiyd+XyFiHi2I9dDDVCIqrelJb3ODeJzxPXN45HiXkSqxbeFYr3q06rMhoTgMy+PMO1f4aRMDf4BNvCHKy/Jnro7n1NCtaWjImI/QGlg8Yx3wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+wILfUv/iZ6dFMa1RWrw8W7GnFr96O8J5o0H25WabA=;
 b=jDppel34rc1Wl72HwI+01WWP+mqtC7Vln8uwIdOg/MU4BA4pltaJ1+TPtzUcou4KdjqrHUKMcdtzf0KIdmo7huAt4Kf+Qf3/N5WboAFMrb8bOM9uFOs9dFd0/g0epvXkTDVbIANXOXs4q7Qo4VwGXzzN1jJQUMeBoCEPQSoCNPkxhSXa4M/rDVYXduDbi/kBjhxv6klH2Q/JCpSUSa72vD65+PzMROtESlNv4Xr01NrmMWF6qv6ewiDJKs76AZ5oos6bvDgnCi3RLbDU5y/Wq+bOD/R/OoD3rl0RIpNmyyiOtp1A2kDelYG2QZwLu11umjobo2kNUH+WA6neXAa7eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+wILfUv/iZ6dFMa1RWrw8W7GnFr96O8J5o0H25WabA=;
 b=mnFl4Nuzp5/Ra7sP6ViwTesK8DSGEP/QmF3/9Dx315ZRk8FJaJkn1IlNF24EUUo4Eq73v2T1dCwSPQPSW+fFY3OB4xTap0NV5/8BlWtiL8nJ5ijFjNAwBjCIXhdeTolGLlgjN6umAM84UT5vf3JcH8+qkl3+jDrmYZMCxtgbMKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 14:20:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 14:20:16 +0000
Message-ID: <b3c983d9-3359-6686-d01d-e2c01de26bbe@amd.com>
Date: Wed, 22 Feb 2023 15:20:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Intel-xe] [PATCH 1/3] drm/suballoc: Introduce a generic
 suballocation manager
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230216144847.216259-1-thomas.hellstrom@linux.intel.com>
 <20230216144847.216259-2-thomas.hellstrom@linux.intel.com>
 <35ba51b1-598e-8c43-0eca-8fd538ef2659@amd.com>
 <e44a861e-013b-d509-f3a5-b8973186e321@linux.intel.com>
 <91f82b8e-ff43-8b58-e55f-d1c55f13971f@amd.com>
 <95abe965-ae03-5213-abb3-92ee908e727c@linux.intel.com>
 <ad869cfc-baff-2c7a-7bf9-799c5f125aba@amd.com>
 <6ddd49d2-be2c-3b80-9e77-8cc24cbe64e2@linux.intel.com>
 <728a932c-d65e-9777-de50-6dd8fe9f5708@amd.com>
 <1ca4881b-c470-1f59-03c9-edcddbaa7a6a@linux.intel.com>
 <24ada492-c951-46ad-6771-3af88caf2fb3@linux.intel.com>
 <592a66a8-2265-ec51-b38e-baf7fd005e6e@amd.com>
 <b246a499-2d00-32a6-4e75-f31e311afa9a@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <b246a499-2d00-32a6-4e75-f31e311afa9a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b045a9-46ba-422e-0584-08db14dfeb62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pv09tJUrlnN9Cgg3kNH/6k9BPKWJIqWKl78GsvyTI/c3PvhHTlx0fKJSp5azzmUyOz3b5j14YE6oXcZw+YbKoCIhCrZUBUqldlRh67EwTXiLC94Wc7Wyk0njQsrZZ9eyJG5L6QTOIg5zoNMLBO4F3+ZGzAXPMeFCnK3/pE9IFixPxk4qFkfxa85kH1faUUDRjwalDhnrYGh56AOwQ+0IOEovph2HD3UghOkTzYGDyDnY+OhhyglP+7u0Ihuf5hoHp7n7N/ZcLqaqcy3tztJFpQASHHs4RY8F89eNPR/2MCyKX8gYX7L7klHv7q1vEiJDmiZaB8rq/nDN4Qp1lHYas4BIZ32gNzWutHD5lbH95fSPL+4AXbP23a1SYl8GYW8pvREmRpVof7YfGdqKoivxBZLq94AnDsHh4+wCfk0YBkjPxO8QGVnb3pFX1R8ruSGxrRIelf4WbFVVMlikZSufU9im3WxnHPnFPDYenqRsGiDDn0iudTaeW5qmZDjttfBdcMeGzSBeOoaZE0Y5x9t5aTGib15QMQlW1PgQITJRIGFkEgms0ejuC5hY4/YB8nBkGU6NlCm3MbmKpWvOw12XK43sqpQkNC2VnxtufTm50+6H4faDM+L1oGMz/C1EccU6jxw1L0FRGt6ncRLXHJZc0g8P2EEg8ocwl87ESvrz6/w+qun88y3BFvJHQkUoMyE4VwKsrUwqvL5sYJvBDXsw9jR7pARRGi3hBAAmMQIcCJuHN1QJpCTRS/JhurlgAFCw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199018)(66574015)(478600001)(86362001)(31696002)(2616005)(54906003)(6512007)(316002)(6666004)(6506007)(53546011)(6486002)(186003)(2906002)(66556008)(38100700002)(66476007)(41300700001)(5660300002)(4326008)(66946007)(36756003)(8676002)(83380400001)(8936002)(31686004)(66899018)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVNlVDNGY2N5NDlhNnRORWpsM1NraC9DaHhxdi92MFY0OFUvVVRJbW9mNFNG?=
 =?utf-8?B?NFhjVC92dElHL2N1TTlTcy8yemZBU201eHBmOGdMU0JTYWNXL3h5eTBvcmd0?=
 =?utf-8?B?cVRuNFpkVmJuV3BEOStUNm1IWFZVbVlnTGJVbWgwUzI4aDQ4eFBWSVRCZ0x2?=
 =?utf-8?B?eG5vdUZ3OFZQZ3BLWTZ1UkM5WTMrS25tTjVjdVdxK09wMFBpVzFEVlVRemxl?=
 =?utf-8?B?Y29FOTRaeFhuZXIzWExiaDlmRk9DK0xiQVVxTEN4RFNsTCt1ZVRRN3lrZ1Jr?=
 =?utf-8?B?WHBWZEN3ZUY3RkVGZTdKeS8vR2owM0d4dm1Wa3BIS0s5dGJzTUxjejhwblVm?=
 =?utf-8?B?VkVJaXFnVENxZVJXQzVGcWZzZ1l2bElOTTFaUTdzK0UzZnVvbDIxa3dCb3RF?=
 =?utf-8?B?aG1RTzRYWHR5Ry80bC9PRXFEUXRQZXlxZmRZQXBvRE82eEFWV3B3b0pzWi9x?=
 =?utf-8?B?SlJXRzRaV2haU1RxTEt6SmZVMWJiNmI5bnp0aGY0ZElPTkVwa0xBTWovWGpk?=
 =?utf-8?B?b1hnR3dsOFArVzhHcUc2M29HR1YwMm5kVnBnYk5QMUllc2JNdWM0MGFSSEN4?=
 =?utf-8?B?Z3liK0x3aDlyR0hWcUZxaTZhWVkrRmVrcnRqSzVieXN6TWt6OVo4YWcvUjBQ?=
 =?utf-8?B?THVyeUt4QjVsVEJmci9Jb0RZMG9TZVV5VHExZWNCMjlhZVVVWWZtNXhSK0xZ?=
 =?utf-8?B?Y0YxcDhjWUpuOVRZVnA3emtoejhyLzBrdWIyQ3FiZlB2Z05pVnZsa1VQenlU?=
 =?utf-8?B?ZmVSNEdFRElXaEZCSHY5RGpzZXJ6bWx3bXVnbWt4d1BiZXZJVEMxZXN2SlN0?=
 =?utf-8?B?NWVWalVaZlBiVmgwZ3Z0NSsyanlUaFQ0ZE1jem04bktFWW5vWE8rZUlFVHQ0?=
 =?utf-8?B?cnhkQnZibVhIN0pEemkvZ2NKNlAwbWE0U3YzNzVNSWpYSjV5ejF0U3RmTEND?=
 =?utf-8?B?OElGbytWZkJvZDFLUStlcU82NTM1bjZLQm04OXg0VFg4Z3VYWHFIUHJyVGxv?=
 =?utf-8?B?RnBINm1id2JVR1Q2MkVKUnNJbU10UGhHWmZ0V2hURkFmbkQwK05GNUkvTUFW?=
 =?utf-8?B?TXlkZFV1N1RYMmtYVkNpNFpXL1dOLzROM0xJWGtVZ0FqWXM1UmZZRnhLcEJT?=
 =?utf-8?B?QStsTW1CVGd6K2JtZ0RUQ1M5MTVRbi9OM3dWUGRMQmxqY2JBcE03RXc5T3VD?=
 =?utf-8?B?SWtML3ppZ3pkZUs4ejMrZkhXcHJRUW5BL2pqaW85RmdVMVY1THlrb25jQTlp?=
 =?utf-8?B?UVhIMTljbEFiK3IwWGJ1aG9lV1FnN3Bvck15eEY3K0pRSG5ESVFwSHl2U2xW?=
 =?utf-8?B?UEJ2SUJ1Q3JxalEzeDRoT3dKRGZxZEwwUzl6bTI5eERPMnhLMWF4MEt1NHVQ?=
 =?utf-8?B?b3AxQ1VRbGl1UGRObHFmd1Q1cmN1N3FGekhCRmNwYWF2UWh4SVJxYlp5SXVz?=
 =?utf-8?B?SGZyUngyUmNsMEZVenZTZCtiNnlkaWFld0FiVEhGTnZJdW9kaVZqcG1TNDBY?=
 =?utf-8?B?OG5sZXo5QUtzb2VtTW5BOGthY3dtMkZnVGhRN2Y5QXg5QWY1cUZHaUgrZXVx?=
 =?utf-8?B?VG92TTUvNjUzTjVac0V2TEhFMDBaZ1FhakQ1Z1dyVEwrd1dvUzRwZmJqcDAr?=
 =?utf-8?B?dGVEakg0d1J6SFlmTTNMMkR2ZW91cWt1MW5pWkNDZ1ZmVDk4TXJHNmJsbklQ?=
 =?utf-8?B?NEdZOXEyRnVyV1h0WkJBSXJtdDhEaVQ1WEVHYW15eldEZll5cUJuVTRwL3JE?=
 =?utf-8?B?emNjRkFGUXYwZ2d2dGFZR0FsOEwzcFBqNTlVSVU3SkxiQ0tEN3hjd0dGaWli?=
 =?utf-8?B?dDJtYlhNa2hQdE5BQTlFYXVScFVZWkJacXlhNVNiMmNpelhjSlZEOFdzcVB0?=
 =?utf-8?B?YXl5U3g3a3N3RU4ybjZHMTlUbjM5TU1hY0xuYUc5bmU1Qng2b092Y2Q1dDA4?=
 =?utf-8?B?elFDek1kbDhkcklpQzhvYjhkU05aNURlT3kzc3BraEJlTU9NMzYwMnZ1dnUz?=
 =?utf-8?B?TEdFS3N1Tms2ZGQraU55ZUhnNGc2NHRDMlpnbUloSUpaQ2d6aWt4aTVMaGNE?=
 =?utf-8?B?VHo5Vnl2cFRNdWwxWmovZU1rZHpiOFduSkFIN2JYemhnUHB2UGRFZ1A5Z0FE?=
 =?utf-8?B?TzRSeHdTTTEzSTdPaTdDeDIzMkhQVzRybUl1ekRBYXRNVENQRVZzblFNc2xT?=
 =?utf-8?Q?zCTf/b6aP6HpK+Bj70wmckS9Ck2v2T6XTpEvZ/2IyDIk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b045a9-46ba-422e-0584-08db14dfeb62
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 14:20:16.4420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xtdVf/Ds4vbNrcXXZc1betjH0IuvgSspi+t3fpjpVQQjC3rDvQk/xHfupQBAaWOn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7277
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.02.23 um 14:54 schrieb Thomas Hellström:
> Hi,
>
> On 2/22/23 12:39, Christian König wrote:
>> Hi Thomas,
>>
>> Am 22.02.23 um 12:00 schrieb Thomas Hellström:
>>> Hi, Christian,
>>>
>>> So I resurrected Maarten's previous patch series around this (the 
>>> amdgpu suballocator) slightly modified the code to match the API of 
>>> this patch series, re-introduced the per-allocation alignment as per 
>>> a previous review comment from you on that series, and made 
>>> checkpatch.pl pass mostly, except for pre-existing style problems, 
>>> and added / fixed some comments. No memory corruption seen so far on 
>>> limited Xe testing.
>>>
>>> To move this forward I suggest starting with that as a common drm 
>>> suballocator. I'll post the series later today. We can follow up 
>>> with potential simplifactions lif needed.
>>>
>>> I also made a kunit test also reporting some timing information. 
>>> Will post that as a follow up. Some interesting preliminary 
>>> conclusions:
>>>
>>> * drm_mm is per se not a cpu hog, If the rb tree processing is 
>>> disabled and the EVICT algorithm is changed from MRU to ring-like 
>>> LRU traversal, it's more or less just as fast as the ring suballocator.
>>>
>>> * With a single ring, and the suballocation buffer never completely 
>>> filled (no sleeps) the amd suballocator is a bit faster per 
>>> allocation / free. (Around 250 ns instead of 350). Allocation is 
>>> slightly slower on the amdgpu one, freeing is faster, mostly due to 
>>> the locking overhead incurred when setting up the fence callbacks, 
>>> and for avoiding irq-disabled processing on the one I proposed.
>>
>> For some more realistic numbers try to signal the fence from another 
>> CPU. Alternative you can invalidate all the CPU read cache lines 
>> touched by the fence callback so that they need to be read in again 
>> from the allocating CPU.
>
> Fences are signalled using hr-timer driven fake "ring"s, so should 
> probably be distributed among cpus in a pretty realistic way. But 
> anyway I agree results obtained from that kunit test can and should be 
> challenged before we actually use them for improvements.

I would double check that. My expectation is that hr-timers execute by 
default on the CPU from which they are started.

>
>>
>>>
>>> * With multiple rings and varying allocation sizes and signalling 
>>> times creating fragmentation, the picture becomes different as the 
>>> amdgpu allocator starts to sleep/throttle already round 50% - 75% 
>>> fill. The one I proposed between 75% to 90% fill, and once that 
>>> happens, the CPU cost of putting to sleep and waking up should 
>>> really shadow the above numbers.
>>>
>>> So it's really a tradeoff. Where IMO also code size and 
>>> maintainability should play a role.
>>>
>>> Also I looked at the history of the amdgpu allocator originating 
>>> back to Radeon 2012-ish, but couldn't find any commits mentioning 
>>> fence callbacks nor problem with those. Could you point me to that 
>>> discussion?
>>
>> Uff that was ~10 years ago. I don't think I can find that again.
>
> OK, fair enough. But what was the objective reasoning against using 
> fence callbacks for this sort of stuff, was it unforeseen locking 
> problems, caching issues or something else?

Well caching line bouncing is one major problem. Also take a look at the 
discussion about using list_head in interrupt handlers, that should be 
easy to find on LWN.

The allocator usually manages enough memory so that it never runs into 
waiting for anything, only in extreme cases like GPU resets we actually 
wait for allocations to be freed.

So the only cache lines which is accessed from more than one CPU should 
be the signaled flag of the fence.

With moving list work into the interrupt handler you have at least 3 
cache lines which start to bounce between different CPUs.

Regards,
Christian.

>
> Thanks,
>
> Thomas
>
>
>
>>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Thanks,
>>>
>>> Thomas
>>>
>>>
>>>
>>> On 2/17/23 14:51, Thomas Hellström wrote:
>>>>
>>>> On 2/17/23 14:18, Christian König wrote:
>>>>> Am 17.02.23 um 14:10 schrieb Thomas Hellström:
>>>>>> [SNIP]
>>>>>>>>>>
>>>>>>>>>> Any chance you could do a quick performance comparison? If 
>>>>>>>>>> not, anything against merging this without the amd / radeon 
>>>>>>>>>> changes until we can land a simpler allocator?
>>>>>>>>>
>>>>>>>>> Only if you can stick the allocator inside Xe and not drm, 
>>>>>>>>> cause this seems to be for a different use case than the 
>>>>>>>>> allocators inside radeon/amdgpu.
>>>>>>>>
>>>>>>>> Hmm. No It's allocating in a ring-like fashion as well. Let me 
>>>>>>>> put together a unit test for benchmaking. I think it would be a 
>>>>>>>> failure for the community to end up with three separate 
>>>>>>>> suballocators doing the exact same thing for the same problem, 
>>>>>>>> really.
>>>>>>>
>>>>>>> Well exactly that's the point. Those allocators aren't the same 
>>>>>>> because they handle different problems.
>>>>>>>
>>>>>>> The allocator in radeon is simpler because it only had to deal 
>>>>>>> with a limited number of fence timelines. The one in amdgpu is a 
>>>>>>> bit more complex because of the added complexity for more fence 
>>>>>>> timelines.
>>>>>>>
>>>>>>> We could take the one from amdgpu and use it for radeon and 
>>>>>>> others as well, but the allocator proposed here doesn't even 
>>>>>>> remotely matches the requirements.
>>>>>>
>>>>>> But again, what *are* those missing requirements exactly? What is 
>>>>>> the pathological case you see for the current code?
>>>>>
>>>>> Well very low CPU overhead and don't do anything in a callback.
>>>>
>>>> Well, dma_fence_wait_any() will IIRC register callbacks on all 
>>>> affected fences, although admittedly there is no actual allocator 
>>>> processing in them.
>>>>
>>>>>
>>>>>>
>>>>>> From what I can tell the amdgpu suballocator introduces excessive 
>>>>>> complexity to coalesce waits for fences from the same contexts, 
>>>>>> whereas the present code just frees from the fence callback if 
>>>>>> the fence wasn't already signaled.
>>>>>
>>>>> And this is exactly the design we had previously which we removed 
>>>>> after Dave stumbled over tons of problems with it.
>>>>
>>>> So is the worry that those problems have spilled over in this code 
>>>> then? It's been pretty extensively tested, or is it you should 
>>>> never really use dma-fence callbacks?
>>>>
>>>>>
>>>>>> The fence signalling code that fires that callback is typcally 
>>>>>> always run anyway on scheduler fences.
>>>>>>
>>>>>> The reason we had for not using the amdgpu suballocator as 
>>>>>> originally planned was that this complexity made it very hard for 
>>>>>> us to undertand it and to fix issues we had with it.
>>>>>
>>>>> Well what are those problems? The idea is actually not that 
>>>>> hardware to understand.
>>>>
>>>> We hit memory corruption, and we spent substantially more time 
>>>> trying to debug it than to put together this patch, while never 
>>>> really understanding what  happened, nor why you don't see that 
>>>> with amdgpu.
>>>>
>>>>>
>>>>> We could simplify it massively for the cost of only waiting for 
>>>>> the oldest fence if that helps.
>>>>
>>>> Let me grab the latest version from amdgpu and give it a try again, 
>>>> but yes I think that to make it common code we'll need it simpler 
>>>> (and my personal wish would be to separate the allocator 
>>>> functionality a bit more from the fence waiting, which I guess 
>>>> should be OK if the fence waiting is vastly simplified).
>>>>
>>>> /Thomas
>>>>
>>>>
>>>>>
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> Thomas
>>>>>
>>

