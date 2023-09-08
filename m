Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D8B79849E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 11:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1CE10E04E;
	Fri,  8 Sep 2023 09:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6972810E04E;
 Fri,  8 Sep 2023 09:14:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fyk2SVeLrjztqoT877o51432Hwr3xD263n7J9u9CIcfvjN45FsjRmTHMMy+s2XkwartKmk/Oc5LR3o5g69Baay2mm3GoSL2BBMYS0WMV/28fcYwlWLWCK8UK4bM3coFLpLnTZnGYcfv76FJEClHTUzNNdVDEGZx+uBr+sgg2j9caqSqZFLqPWLsY1PqD9ShtRpkEDa/Ji+i86dxI+5KWS2v+ruGJxEKWWwm9eGkBcZcU46x+V9a2xqXF2cNYezTxaPJX8IdJMzLJmA1CzOJ4d9wHGM0FJo38eLcKtJDQ/ednG6frAuc77VVuGJMW2EoFCF77g3OpzYEn2gjwrkT0Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZvQ9swKLqXpaL1QLKMxIfhR1uZwJSMqC9MRmp5Ufxw=;
 b=BmqlF5Z+KXt2xjjrcePboybmS6LxCTz2NKUMyzDka0q5ghhX0eCrKr/tGgwJz0Lcxnf8RHrKfxViAdMaDZkUyq2pJuggW0eb9FUy92bJHclmqFQVR5ZgLua7jbhpMHDaQOC0nuvAiCsqTfb0n2dwv7RkLXxnjgCRPOcvwlHCcom+oCwCO3Msb6EKk5+NT/a8p7xFfLIvmFZRcKEQpJge/GeF74RMlyFF7F/z1jIUCW+Hmc9Hncx1fOcF48FmtM5nSd8b2ClXLb4zcV0tDnt747SLvTwgrBpD5ti6UGdf7+YSt67L58zjXzWbkUyWKpZWcI8P7dAORuH8p4oOLZNJgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZvQ9swKLqXpaL1QLKMxIfhR1uZwJSMqC9MRmp5Ufxw=;
 b=Ggbb68L8H4m32JtCiX8T/ubaBDS9coXmyeVHvBizYo4PviwtmlWer6j14/ROIB+ZVoRZJUeqUznkVQuIeukLV86mataI3x+6H0jiNhBAdjVG4pxGpoGU5vhWqQo+Q0Y3p0mK0jbktlLJe/gRc/oey+nYR1FyyaGB29l1Tid5FgY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB8415.namprd12.prod.outlook.com (2603:10b6:8:fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Fri, 8 Sep
 2023 09:14:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 09:14:34 +0000
Message-ID: <59839d43-c19c-e27a-51e6-fec44ac09936@amd.com>
Date: Fri, 8 Sep 2023 11:14:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 0/2] drm/tests: Fix for UAF and a test for drm_exec
 lock alloc tracking warning
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230907135339.7971-1-thomas.hellstrom@linux.intel.com>
 <b3ab850d-9da2-0b19-2aa1-fa5a2c3dc079@amd.com>
 <2a9310b5-cf08-d4fe-c08e-c3fc9d25653c@linux.intel.com>
 <95610a20-4364-7ba8-88be-3e303018ea79@amd.com>
 <84b2736f-c225-1421-f245-2de042345dea@linux.intel.com>
 <ab9f3c50-8098-bbbf-50e2-a1ba63595a47@amd.com>
 <b831c9f3-97e6-6cbd-0e3c-b1dfc8c71ec1@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <b831c9f3-97e6-6cbd-0e3c-b1dfc8c71ec1@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB8415:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f842ea-5267-456c-b7c8-08dbb04c0427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r5sca8T1smq8iYnCio5BojrwnuVkahvMeTuMQ/Vn1q7xrVc8RXC+PQj3j6Ky7Feodgyn6FKsarYgKab7bcBUDEwKQZ5evWI7aLXcmfbFMH2tteEpWbGEfBmRA5JOgkRrq9w6rsSAvMei13XCeTFr9+/cBCASf/HGxGKM6BGg0M1TDo+6Qc//ARt83D/3IaarXKBwUM8zFZFgaUUzN7vLT0Q0V2mZaRpATcTAIQyS87ewlKc08WNpBaBmqWgXAe2uWULeKObmTmi1qvxNnwmzxkMaXmgJNclVFm9Fu8p8jQbVocjISkwFzB8kTtVcJAbYEuWI9+cgpKvgx4EmjY+cFKJxp2sJWuzb/4rJ1+nkdoJyQYYyeU2AoUj/R0nyX01mCwGkfWxsjp9GLtOS5dJJTuaLtqs2RUdZov8+kfdPdj7tfSSwGuNJuB94xvHkwoFijN7q5fPmv5wbZHVwXnTajr4HHI9bUN2e5+HV9kwbCso0Aw2J8dUYG4MHPV7vOZDhWbgq57MnESvNGjIFHk08aL1E+jXjW2M0UEzi2E4p793vsnsKcjIH8fgjzoAbq/D+YL2r2mHna4z7ntEvcyASGw2mb4n+Ujv1txKcZyX6IffgQozEKUh6TW4M8NTgp67kiQh/OlTzB6ZRTbVAUjVs8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199024)(1800799009)(186009)(41300700001)(66574015)(5660300002)(83380400001)(316002)(6666004)(2906002)(478600001)(66946007)(4326008)(8936002)(8676002)(66476007)(66556008)(31686004)(6506007)(6486002)(53546011)(66899024)(2616005)(26005)(6512007)(38100700002)(86362001)(31696002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0FNdkFNYWUxZjRXSCtpM2kvQ3ZGZUc3RnlEQmZScVliUmxxL2hEVjhra01L?=
 =?utf-8?B?TlZYdDIvNXlEQ0JKaTdMRm13Y1ZGMVNwaFU1ZHNCb2cwd0NnSkRjMnQyVmwx?=
 =?utf-8?B?czFaVy9vWTBkempzdk41NCtRZWVBaVByVmV1Yk9RLzRGVklWNFAzeGR3K3h3?=
 =?utf-8?B?NU5iVFpMc1BocXlhdDlIaS92R2lUZUJWQ2FFNm1nNFRkcDFkaDRMNit3TkNT?=
 =?utf-8?B?SCtNVlZyVDlNSmNPdlRSTUh4emxrdnk5UUkrNWNmdlVqL0pEdEdldDhXc0Rp?=
 =?utf-8?B?RldwQk1lZ05ZbUU5YjhhcEJ5ay91SWFCSTVTa2VZaTBWRUdJK1BYOEVTQ1J6?=
 =?utf-8?B?dU9pMkJaRm9nZVVPUzNFSVpEa055a1FOdmx5VkJyVWhMN09MdUQ4V1Q4bUU3?=
 =?utf-8?B?Q1dVQnFIejU3UTQ4TUcwMmtWaHp4T0xXaGFvOVkzb0NnbVZWajNxb25YOXFH?=
 =?utf-8?B?RDR6K2NqbEdORy9iTUFYL2N6a0NmODBUeFZjZzNhQXRreXdmVWRZb2dxcTdi?=
 =?utf-8?B?dTBiK3NGczBOWDgrYmkzUEpJV09OZFdjcDhkMkphaVlFdit1V211UjlmSVBj?=
 =?utf-8?B?TW5IdTR6SkNTQW12L3NKV3I4N2J6ajFXaE9pOEJCNkwrVkZIMmVBUjNrZWJp?=
 =?utf-8?B?bXNyWXZKcS9aVGQ4NmNMWWl2SVI5cXhGQmptYWdEZFp0QkgvcnZXSFFKRjdw?=
 =?utf-8?B?RW91R3kyWmwzKzZsSDJQSFZaWWtZRzJKUXVhaDVIUUdxa05UMWRSV3NBSGpJ?=
 =?utf-8?B?K0NUanJsN3A0WFZCejZyR3pnOHdOYW5uV1dSRk9UNExHVmJCd1A2UVJxU1Iy?=
 =?utf-8?B?QVZjbktwRVVZeDdodXduMkpxRVlTL0xIWGl2YmpNaE5acDFMMHQyNUplMVVP?=
 =?utf-8?B?M2RKSFlJaU1RZHorZ1lFWG9OS09ucE1CWnpCWkdBYmtHeExtZkJ5UVpQcEhV?=
 =?utf-8?B?SUc0eFNQTVM2dks1akVSdlVpc01hSG85ZlRQQ29aZjhncWdlMXp0T2pXUmxu?=
 =?utf-8?B?MExXMEtQcDJZSTF1Vi9va0RHNEhFakVCVitqd205dE9LU2p3K3NkYVIzVExL?=
 =?utf-8?B?RVF6OSszakJzcHNjdVVic3YyVlN4R2NlWXRMTklBZUtEc1ZqOHdtOVUxN2px?=
 =?utf-8?B?ZEdtMDdmd2poNVNhYWM5eEVxY2M1Rks0NmpyaWdVWmtiVnBmUVV4RGJoNzg0?=
 =?utf-8?B?aVdkZzBRRGRzUnpRR3F4YVlQY21valVWUkovZGlIdVFkK3BhSG41KzMvamk1?=
 =?utf-8?B?QVBzL2oyVm9LRjhBMHIxMy9HaXZ0MGVqOEJpay9tMXJNMWRuZnV3QVJWRFZP?=
 =?utf-8?B?Vi9rU0IvQUNQWG5ycUJrZVJBbm4zcnp1UEZ4VTdrclo0U3lBc0JhSmoyMGRH?=
 =?utf-8?B?QVdXNDdFN2JEVFloU1duK2cyRVhEZkxuT2dTUWluY2RWaWo3em5tdEplaEtS?=
 =?utf-8?B?WnAzNytzY0pwV1lrTUFqMFV6OFd3dElYNmo1c3pwU3ltUTBwNFVtS2o2WlFJ?=
 =?utf-8?B?Zi9yc0tTUTd3OWl0aXdwb2lvdFNZaXA2ZFBVNVZCT1hyVEh1WTY2WStKQ3ds?=
 =?utf-8?B?WTZnZWFubS9oc1hQUy90cGxhYzJCNmxFK3F6eUpMUTMxTDBYTHFubkhlK1B0?=
 =?utf-8?B?UTYveTBsd1lNQ3NxRlF4ZXZWaDJiblFCckVmeUdpWVpBbTRSVGJreGl3Y3pa?=
 =?utf-8?B?ckpYZDkwUEg0ck1CdGwrQjhIamdJYnZUcVZGR2RWOElEQ25aZDdDMlVaUkpP?=
 =?utf-8?B?MlQ2VTZMc2gxMTNqOWwzQ2prUTltaTBwNkNBbk9FWVZHSld0bFl4VHpETXNs?=
 =?utf-8?B?OWhITXFVWE1lcU5TUUQwRHU1RC9rbXNqODNZN0VOWUNTTi85Qm9tNU82Umdp?=
 =?utf-8?B?QWhHY0hjSmlDNFNXS21kNzJ5UTJWMGFYUmQvTkp5Z1o0bWhuQ0Q4V1pKVUZS?=
 =?utf-8?B?cVhqUTVZRFJkVWJ6VFdEK2NMZVM2SU5GbERobktiUWJxZXQrK2FFcisySkhW?=
 =?utf-8?B?OTBGZHVtbC95MFJEaUYvSVNYcnorN2hsaER6enB2WTRXZ1BWZlJ6VHBrdnpa?=
 =?utf-8?B?Yjhxd21ndGI3T0NBQnpwVHdkYUxqdHorbkh2NFBCL1loZVZPM255TjJRWlRH?=
 =?utf-8?Q?QuISEgtpPw9ldgganpYFVakpd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f842ea-5267-456c-b7c8-08dbb04c0427
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 09:14:33.9059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bM9xg9XMvPnvBFRn0tZ7rrVnVWEJRvgs1Dc+vbMvCDZAjyCuhaTqIS0/IbjQVlqo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8415
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
Cc: Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.09.23 um 11:04 schrieb Thomas Hellström:
>
> On 9/8/23 10:52, Christian König wrote:
>> Am 08.09.23 um 09:37 schrieb Thomas Hellström:
>>> Hi,
>>>
>>> On 9/7/23 16:49, Christian König wrote:
>>>> Am 07.09.23 um 16:47 schrieb Thomas Hellström:
>>>>> Hi,
>>>>>
>>>>> On 9/7/23 16:37, Christian König wrote:
>>>>>> Am 07.09.23 um 15:53 schrieb Thomas Hellström:
>>>>>>> While trying to replicate a weird drm_exec lock alloc tracking 
>>>>>>> warning
>>>>>>> using the drm_exec kunit test, the warning was shadowed by a UAF 
>>>>>>> warning
>>>>>>> from KASAN due to a bug in the drm kunit helpers.
>>>>>>>
>>>>>>> Patch 1 fixes that drm kunit UAF.
>>>>>>> Patch 2 introduces a drm_exec kunit subtest that fails if the 
>>>>>>> conditions
>>>>>>>        for the weird warning are met.
>>>>>>>
>>>>>>> The series previously also had a patch with a drm_exec 
>>>>>>> workaround for the
>>>>>>> warning but that patch has already been commited to 
>>>>>>> drm_misc_next_fixes.
>>>>>>
>>>>>> Thinking more about this what happens when somebody calls 
>>>>>> drm_exec_unlock_obj() on the first locked object?
>>>>>>
>>>>> Essentially the same thing. I've been thinking of the best way to 
>>>>> handle that, but not sure what's the best one.
>>>>
>>>> Well what does lockdep store in that object in the first place? 
>>>> Could we fix that somehow?
>>>
>>> Lockdep maintains an array of held locks (lock classes) for each 
>>> task. Upon freeing, that list is traversed to see if the address 
>>> matches the stored memory address. This also has the interesting 
>>> side effect that IICR dma_resv_assert_held() checks if *any* 
>>> dma_resv is held....
>>>
>>> Ideally each object would have its own class instance, but I think 
>>> some applications would then exhaust the array size.
>>
>> IIRC Daniel once explained to me that he designed lockdep for 
>> ww_mutexes like this for some reason, but I don't remember the 
>> details any more.
>>
>> Maybe lockdep wouldn't otherwise be able to deal with the fact that 
>> you could lock them in any order or something like that.
>
> Oh, that's well handled with the mutex_lock_nest_lock()  type of 
> annotation that's used for WW mutexes. IIRC the problem is that 
> lockdep can't really deal with either that vast number of locks 
> overall or the vast number of held locks per process.

Could we somehow teach lockdep that multiple locks of a lock class can 
be held at the same time? E.g. like a reference count in the lockclass 
or something like that?

>
>>
>>>
>>> I'll dig a bit deeper into this.
>>>
>>>
>>> Meanwhile for the unlock problem, looking at how the unlocks are 
>>> used in i915 it's typically locks that are grabbed during eviction 
>>> and released again once validation of a single object succeeded. The 
>>> risk of them ending up at the first lock is small, unless they are 
>>> prelocked as the contended lock. But for these "temporary" objects, 
>>> the prelocked lock is immediately dropped after locking and are only 
>>> used to find something suitable to wait for to relax the ww 
>>> transaction.
>>
>> Yeah, I don't see this as an use case in reality. It's more of a 
>> "what if?" thing.
>
> Oh, it's a real use-case. As soon as you start having sleeping locks 
> for eviction you hit it, in particular with WW mutex slowpath 
> debugging. And we will need to work on improving TTM support for that 
> for xe.

Oh, good point! When we have contention on a lock, rollback and take 
that lock then first it can be that this lock then needs to be unlocked 
again. Unlikely, but certainly possible.

Sounds like we really need to fix this in lockdep then.

Christian.

>
>>
>>>
>>> If we were to implement something similar in drm_exec, we'd need an 
>>> interface to mark an object as "temporary" when locking, and make 
>>> sure we drop those objects if they end up as "prelocked". Personally 
>>> I think this solution works well and would be my preferred choice.
>>>
>>> Yet another alternative would be to keep a reference even of the 
>>> unlocked objects...
>>>
>>> But these workarounds ofc only push the problem out of drm_exec. 
>>> Users of raw dma-resv or ww mutexes would still wonder what's going on.
>>
>> Agree, completely. This is really a bug in lockdep or rather how we 
>> designed to implement ww_mutexes in lockdep and should therefore be 
>> fixed there I think.
>
>
>>
>> Christian.
>>
>>>
>>> /Thomas
>>>
>>>
>>>
>>>>
>>>> Christian.
>>>>
>>>>>
>>>>> /Thomas
>>>>>
>>>>>
>>>>>> Christian.
>>>>>>
>>>>>>>
>>>>>>> v2:
>>>>>>> - Rewording of commit messages
>>>>>>> - Add some commit message tags
>>>>>>> v3:
>>>>>>> - Remove an already committed patch
>>>>>>> - Rework the test to not require dmesg inspection (Maxime Ripard)
>>>>>>> - Condition the test on CONFIG_LOCK_ALLOC
>>>>>>> - Update code comments and commit messages (Maxime Ripard)
>>>>>>>
>>>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>>
>>>>>>> Thomas Hellström (2):
>>>>>>>    drm/tests: helpers: Avoid a driver uaf
>>>>>>>    drm/tests/drm_exec: Add a test for object freeing within
>>>>>>>      drm_exec_fini()
>>>>>>>
>>>>>>>   drivers/gpu/drm/tests/drm_exec_test.c | 82 
>>>>>>> +++++++++++++++++++++++++++
>>>>>>>   include/drm/drm_kunit_helpers.h       |  4 +-
>>>>>>>   2 files changed, 85 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>
>>>>
>>

