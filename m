Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0585464C8C
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 12:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0406FACD;
	Wed,  1 Dec 2021 11:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2CDC6FACA;
 Wed,  1 Dec 2021 11:25:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4oGeEh88phd5nXaQ5QeSA2/bQ2IcMT1jJS7TGp3X2/NPMEyfEtImmFS70u7G5jPKpr3JbmxbJhjrn7mi1dioaflSUaMomcKCV5oCHkq9jOmtwnsf5tECJzPsKY+YuUChwYXxl5HmNLG2CRK5IIqK1UwwL8GvlwpndIB/FkMbZDg1ZzIqBliZCTTTRaDHkcHAn3VwesxuOCBsuLMzJGZ33Ra3TAo7yCAcR/2DJ4rpJ4PJWJ+L0Sk2uDK4irlWzILDK9boRo3jxw/UDO3yQ3nNGsnVQisbh2wzbzRH+ssKffsyNjEMjz64OswveOfDXL1BZA+4j3tRESGigWZgAwx8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OA4xfcalksFxzWvbmWDTmUnZ54CZ6HC1CZz7fV8jJDQ=;
 b=ZHNLCISIInNV17wSMTZcFsv1p5A872/y0KiR23U73WUVNs65Tu2GPhcZD54u6vno2j7WE4Vn/aoSDJSYPSzb1nr+LLm1ep5uiFkSXlFFzkQLPZBHNlfddjiCbQReAQps/kkO2GiKIooib/hXqSJhXVFM3X4h6j1JL9Mqwadd4ezLhJBA4yvfhcL4fT+7yFxSACJuszEGbLocsRF9DFHE1PQ3Uhcb2R0HwwIE1CZMksO/DZxdPLauZPquDA69vmVCgUL+8cVoNXvkWi1fsBo57qW2vC8ttxHO8ABo348cymfF2n8jficpYLQPQCemQvaPhtwzXjJG5BR3SksnRe5NTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OA4xfcalksFxzWvbmWDTmUnZ54CZ6HC1CZz7fV8jJDQ=;
 b=ThkewRKN2GsrUWTwLhpO4EI/jquES4i7OcNI2fzbA/SZGlUT7/3fQ7sH6BDQiZHD1RRierzWciRHOfsyDHup3VzAFMDk+7Jpa6eBrc93ZDMdK/CHlvhNnP8j1I3KDUKEogyjWW0M+J+UiiilH/6CmDXh+nGdxh6zQ36fQsys9zc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW2PR12MB2428.namprd12.prod.outlook.com
 (2603:10b6:907:6::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 11:25:22 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4713.027; Wed, 1 Dec 2021
 11:25:15 +0000
Subject: Re: [Linaro-mm-sig] [RFC PATCH 1/2] dma-fence: Avoid establishing a
 locking order between fence classes
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211130121936.586031-1-thomas.hellstrom@linux.intel.com>
 <20211130121936.586031-2-thomas.hellstrom@linux.intel.com>
 <c7502701-e85c-39f0-c249-702d029faa9e@linux.intel.com>
 <b440cfbc-2b9a-1aa2-76d6-17337f835777@linux.intel.com>
 <52a7cf8c-59c7-fec0-2274-d19bdc505314@amd.com>
 <57df8b0b-1d65-155f-a9a6-8073bbd4f28f@linux.intel.com>
 <2551da4d-2e51-cc24-7d4a-84ae00a1547c@amd.com>
 <29d096c91d720fbe5d410124580a02b663155b56.camel@linux.intel.com>
 <250a8e47-2093-1a98-3859-0204ec4e60e6@amd.com>
 <712b54fa1c09ae5cc1d75739ad8a7286f1dae8db.camel@linux.intel.com>
 <49cf2d43-9a8a-7738-0889-7e16b0256249@linux.intel.com>
 <193e36bd-ba64-1358-8178-73ee3afc3c41@amd.com>
 <c9109ec6-4265-ba8f-238f-4c793d076825@shipmail.org>
 <d1ada94c-88d3-d34d-9c51-0d427c3aca06@amd.com>
 <7ef3db03-8ae2-d886-2c39-36f661cac9a6@shipmail.org>
 <4805074d-7039-3eaf-eb5d-5797278b7f31@amd.com>
 <94435e0e-01db-5ae4-e424-64f73a09199f@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a4df4d5f-ea74-8725-aca9-d0edae986e5c@amd.com>
Date: Wed, 1 Dec 2021 12:25:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <94435e0e-01db-5ae4-e424-64f73a09199f@shipmail.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0126.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::25) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.183.123) by
 AS9PR06CA0126.eurprd06.prod.outlook.com (2603:10a6:20b:467::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 1 Dec 2021 11:25:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8426e2ed-fd2e-4cef-4294-08d9b4bd3f46
X-MS-TrafficTypeDiagnostic: MW2PR12MB2428:
X-Microsoft-Antispam-PRVS: <MW2PR12MB242891C3FF4C9FAF4821188083689@MW2PR12MB2428.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hdCNdvExtcn1YI4330S+U71OiqlqVaGA7HTQR45htdce1xNSJyIFtb+xvfEeiL1nlQ6/LfyBNeoph7h/B0wILXHD8m1Y3josx+T2hhkPn79uka/oNDdc+g94MfQM8N7e7SSkzliOoToh8Sl7sRNa8VlQPfpj4gokIpFxjthdJSWcrN8LN6bg/C/mO4Ph2f9cTMEXBgkPK+f9oiX6u44RmLiJ96UfKdqRCsHsc5kZQy9BJ2qsjYdyNfSJ8eOOrBfBc10uvCuRf02CF+RDnKkSk31AJcxQ4i36wkuy5l5cLm0gZ7ao6BAm7JcrPk6Nr1jxUr1UKp0rVupsSU8sovh0pzdLJfCnIJRCQnJeUfAncV9UxauZzvCNIbA3n3kxbJnA9F41EkwBQS7NrKOmOhpS8JaE5xp07UDcTcx0PNXeICX7F7gJmw6WnKgYZLrhEYnu0SboQP3K1tmR2/uyvwvSszgdPwulRswO1MXUkUbQMmGrq0zB3ttT1PEIbQ3/m5q89xGOte1L9j/Dr2QYKze2qim8IbQ5e3fPJUkiGNZLqT/Us1bQ+A1qleqneR1chE6mkvBe1zM+HvGDdohSNGIngN4WY7+HBTIu28EHev15hrK9OqdEOzOnVdjUKZ7Nyglj8lh1jiPxbizhdaSOOgx18DnVltI6H5GAnMIF1TrpbNOJNfWGXbAqdQqMYeXaTctJYeAxA6diYoHHKwLnGkxFB906sOrqs9cWj6/k2HryldwFfy8epR6/C2lxnyY+4LHz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(6486002)(66946007)(2906002)(26005)(5660300002)(53546011)(186003)(66476007)(956004)(16576012)(508600001)(8936002)(6666004)(66574015)(31696002)(83380400001)(86362001)(36756003)(4326008)(38100700002)(8676002)(66556008)(31686004)(316002)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0F2am1QTVZqUzlYbUlYbWtsVFZSdFB6WFR5MXNkdnkraStWaEVObGdZMTNz?=
 =?utf-8?B?cEtIa0QwVmF3cHVQNDNObXNpcTYvb0hUZWJEeHB1Q0ZMb3YyZHQ4UHFMUnVu?=
 =?utf-8?B?ZHdld1Q1dWhKRDBCMWVjaGlIeVVKTnI2dzl3cDQ0bEtETk51bmtwZDl4Snlz?=
 =?utf-8?B?ZUdnWlRkRkhjM2FCRWd6Y3hzem56aGYwM0owSE9tdmdzQ0VkbTAzZFlHcGg4?=
 =?utf-8?B?bmh6UXFiZlBITHdNeGJyeVRGajV1T25IRkJLanJEbGRVdXlHZG5YMzk3eXp1?=
 =?utf-8?B?Z2JZM21BRG9JYStNbWdoVEVRc2VGeDdCbXpmWjgxT2d6dEhNM0dxVE81NTdP?=
 =?utf-8?B?V3h4YThrVkEvWkx6QXJOTXI2OFlVQndVZnlxbExSSlg0RG1MbWpOSUFXM0Jv?=
 =?utf-8?B?TU5nbUJvMVpjOTdISXo0Z25hdFN1Nm9veGhUS0pQcWlkSGllSmJsa1FVVnIv?=
 =?utf-8?B?ekpNczNSVXAwVk13UDZOSHZOYjRDbk53QVNKNlNhYW9KM2JrbTNNbnkydEVk?=
 =?utf-8?B?eUg1dEZJd1NKbERWYnBOaFAzYk10enVacmh1L3BxdFRlYThhSkIvWEhCWmFs?=
 =?utf-8?B?UDQyQmxmdGY3bzdzMk0wd1RSVk01dXNycHVnWGt5bTRENWl2UHpiRFJGTnkx?=
 =?utf-8?B?R0IvcHd5WmNIVUxSL3BQNmxpTEFya2FlMDJtd2hwU3NkQmEzSGdNMUtHZFlz?=
 =?utf-8?B?NEVSakJLeXMxNStRcnM2L05xOWdGV1BFNk9FV05KUHovK3NocXJrdUw4N3Fh?=
 =?utf-8?B?WUZQTjdNVHNxS2tXeDI1Y29ZdTU3a1hjK3EwTWFQYVlqeEtUQzlTSnRHckJl?=
 =?utf-8?B?UVBBdzBUZGd1ZHNmS2RKZlVWblNoRU5TbkxYRHhkdk9hazR0eCtFNm12MG1i?=
 =?utf-8?B?RXVhWWZjZC9mYjA2TkxTN0R0a2p3dzFSZFRVUDZ0bldiM3Zia01pSkZNaEE3?=
 =?utf-8?B?VnRVVmZDNWJ4YkhreisrcjdzeCtjcGZKbW1VTHRHbnlkWUVmZkpPT0RnSW5w?=
 =?utf-8?B?d3RMR21VQkJCTjd0cnFJdzc1UjZrK0t5RzVDTE8yZFh3NUplelREemNIY1J1?=
 =?utf-8?B?bDhJT2lhUjA1OWRvd05IVWFvZTBrcVJIYmFkVHhYWE11VERYUkpnRCtqbmtQ?=
 =?utf-8?B?NjdHK1lXQ1dsdmJvUE1LTVFZcSt0ZmZ3RndoVVFhMEFrdkNzKzA1QllxL2RT?=
 =?utf-8?B?ZEVCQXErZ3dNd21RZ2FhdHRHcVpVUjhkUjFtVjVuTHBUZWl1ZnJORGtQTDJ4?=
 =?utf-8?B?QXdoT0JLeVorSTVUOThna1lhQ2Jqa1NkbWFJTS9vbUw3SXlNUmpsRy9HaFBB?=
 =?utf-8?B?aDQrSDUzWmNVdDU2VDR4bWFPa3dBTGd1UkpMWGNsTEo3SVBGbHppNUZEVDRL?=
 =?utf-8?B?YjgvL1FPWWF1aTJvalRHU1dJZnM2ZS82RlV0cjJETXFFNS9RbUsyV0xONi9h?=
 =?utf-8?B?T3pGVFpka0dQUkJodno4NDF6UjZXeXhOZTd4SGNTZHJWZmxadnZvMGVTcUgx?=
 =?utf-8?B?UElLTTliK1h6cUpjZVpUSDJjRjZnT0RJS2xkZ2UvUDZYeFg2TG8wRkxjaGk3?=
 =?utf-8?B?WEVsMUZPUFM2eEM2TEsrbnYwNjArK0Z6VkNJUkVycy9yYisvaEs2Slhrekl5?=
 =?utf-8?B?Y1NTS3hOM3BhN09PTCt4b3ZxZytYVFZNdkxtV2dYenJ0eHNPcU50eDZLcHh4?=
 =?utf-8?B?RUNOTWJQRDk1V2Q2b25BTGQ4NGZzRm4wM0Z1OHErQjlnSkdyTnZYWmY3ODgy?=
 =?utf-8?B?Q1lCUmlKNTlyR213aitvY2I0Zy9mY0lBTkFsNzdWSGNMakVMQXFqeW1ob2pK?=
 =?utf-8?B?YVVhTk1MREpWYnBBNHZZbzhDMnRiNFVtWkxPaEtyYkZPTXJ2WXkvamUvand3?=
 =?utf-8?B?eXFRelNhNTM5VHM2UGZKV2orckVKVDRzcGxsZG9TNmtSUEIvWTJzMnJzNGEr?=
 =?utf-8?B?Zm11bHMzYk03d09wQ0RmM1RFRFRRRHlRek9qQnZOc0lhUHdzM0ZZMEVkK0ps?=
 =?utf-8?B?bHprV0Yyb1dqdnliSDNXU1JFSC9DNmpUTkR0N0FJOUszcE1BL0pyenk4Ulp5?=
 =?utf-8?B?eHJiYmV4UkhvU004Y25WM2NmMjZXQlRoak55UENRQnkzM0RQSTNoMUlsYXQw?=
 =?utf-8?Q?MR8M=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8426e2ed-fd2e-4cef-4294-08d9b4bd3f46
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 11:25:15.4612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40Q+qtg3PzIXKRw/BsiSFxXvCIgkAdBI15R19s4QA5shwsm1x3+bYi0Q1k9yAm/P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2428
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
Cc: linaro-mm-sig@lists.linaro.org, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.12.21 um 12:04 schrieb Thomas Hellström (Intel):
>
> On 12/1/21 11:32, Christian König wrote:
>> Am 01.12.21 um 11:15 schrieb Thomas Hellström (Intel):
>>> [SNIP]
>>>>
>>>> What we could do is to avoid all this by not calling the callback 
>>>> with the lock held in the first place.
>>>
>>> If that's possible that might be a good idea, pls also see below.
>>
>> The problem with that is 
>> dma_fence_signal_locked()/dma_fence_signal_timestamp_locked(). If we 
>> could avoid using that or at least allow it to drop the lock then we 
>> could call the callback without holding it.
>>
>> Somebody would need to audit the drivers and see if holding the lock 
>> is really necessary anywhere.
>>
>>>>
>>>>>>
>>>>>>>>
>>>>>>>> /Thomas
>>>>>>>
>>>>>>> Oh, and a follow up question:
>>>>>>>
>>>>>>> If there was a way to break the recursion on final put() (using 
>>>>>>> the same basic approach as patch 2 in this series uses to break 
>>>>>>> recursion in enable_signaling()), so that none of these 
>>>>>>> containers did require any special treatment, would it be worth 
>>>>>>> pursuing? I guess it might be possible by having the callbacks 
>>>>>>> drop the references rather than the loop in the final put. + a 
>>>>>>> couple of changes in code iterating over the fence pointers.
>>>>>>
>>>>>> That won't really help, you just move the recursion from the 
>>>>>> final put into the callback.
>>>>>
>>>>> How do we recurse from the callback? The introduced fence_put() of 
>>>>> individual fence pointers
>>>>> doesn't recurse anymore (at most 1 level), and any callback 
>>>>> recursion is broken by the irq_work?
>>>>
>>>> Yeah, but then you would need to take another lock to avoid racing 
>>>> with dma_fence_array_signaled().
>>>>
>>>>>
>>>>> I figure the big amount of work would be to adjust code that 
>>>>> iterates over the individual fence pointers to recognize that they 
>>>>> are rcu protected.
>>>>
>>>> Could be that we could solve this with RCU, but that sounds like a 
>>>> lot of churn for no gain at all.
>>>>
>>>> In other words even with the problems solved I think it would be a 
>>>> really bad idea to allow chaining of dma_fence_array objects.
>>>
>>> Yes, that was really the question, Is it worth pursuing this? I'm 
>>> not really suggesting we should allow this as an intentional 
>>> feature. I'm worried, however, that if we allow these containers to 
>>> start floating around cross-driver (or even internally) disguised as 
>>> ordinary dma_fences, they would require a lot of driver special 
>>> casing, or else completely unexpeced WARN_ON()s and lockdep splats 
>>> would start to turn up, scaring people off from using them. And that 
>>> would be a breeding ground for hairy driver-private constructs.
>>
>> Well the question is why we would want to do it?
>>
>> If it's to avoid inter driver lock dependencies by avoiding to call 
>> the callback with the spinlock held, then yes please. We had tons of 
>> problems with that, resulting in irq_work and work_item delegation 
>> all over the place.
>
> Yes, that sounds like something desirable, but in these containers, 
> what's causing the lock dependencies is the enable_signaling() 
> callback that is typically called locked.
>
>
>>
>> If it's to allow nesting of dma_fence_array instances, then it's most 
>> likely a really bad idea even if we fix all the locking order problems.
>
> Well I think my use-case where I hit a dead end may illustrate what 
> worries me here:
>
> 1) We use a dma-fence-array to coalesce all dependencies for ttm 
> object migration.
> 2) We use a dma-fence-chain to order the resulting dm_fence into a 
> timeline because the TTM resource manager code requires that.
>
> Initially seemingly harmless to me.
>
> But after a sequence evict->alloc->clear, the dma-fence-chain feeds 
> into the dma-fence-array for the clearing operation. Code still works 
> fine, and no deep recursion, no warnings. But if I were to add another 
> driver to the system that instead feeds a dma-fence-array into a 
> dma-fence-chain, this would give me a lockdep splat.
>
> So then if somebody were to come up with the splendid idea of using a 
> dma-fence-chain to initially coalesce fences, I'd hit the same problem 
> or risk illegaly joining two dma-fence-chains together.
>
> To fix this, I would need to look at the incoming fences and iterate 
> over any dma-fence-array or dma-fence-chain that is fed into the 
> dma-fence-array to flatten out the input. In fact all dma-fence-array 
> users would need to do that, and even dma-fence-chain users watching 
> out for not joining chains together or accidently add an array that 
> perhaps came as a disguised dma-fence from antother driver.
>
> So the purpose to me would be to allow these containers as input to 
> eachother without a lot of in-driver special-casing, be it by breaking 
> recursion on built-in flattening to avoid
>
> a) Hitting issues in the future or with existing interoperating drivers.
> b) Avoid driver-private containers that also might break the 
> interoperability. (For example the i915 currently driver-private 
> dma_fence_work avoid all these problems, but we're attempting to 
> address issues in common code rather than re-inventing stuff internally).

I don't think that a dma_fence_array or dma_fence_chain is the right 
thing to begin with in those use cases.

When you want to coalesce the dependencies for a job you could either 
use an xarray like Daniel did for the scheduler or some hashtable like 
we use in amdgpu. But I don't see the need for exposing the dma_fence 
interface for those.

And why do you use dma_fence_chain to generate a timeline for TTM? That 
should come naturally because all the moves must be ordered.

Regards,
Christian.



