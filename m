Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2992783CF6
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 11:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A6710E1C2;
	Tue, 22 Aug 2023 09:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7896110E1C2;
 Tue, 22 Aug 2023 09:35:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTMUAqjNdwn2SeNwcMTY0opqFtxnC6xQgdqdlp46W2/MkInDnX0YcYwJxGgrI/ryDnd9c/44A9Elcj+oc+HmI/xd+y8eFTuJbiGSz38ytJC7QHtWrG4S/n1A7+0npkpIbUK85IEb4Uwhrv3XmjJO/sNkszycm88IvzQU25EXKU1jzC3VLfgEMmdYFP+NQ4mTi25PuVaclQxDYlS5NkdkNjfon3IvhuWJXtuXc3jJ8PXXwYCS7nfihH5zgf7hE1qQYIW9RUxlGxeGDbJbG+vcksPYwSEBQ/tMm2NDtiRmobXUoVsqvL1n3Wdkz7qvxP5PuD/OEQqR32gewA7k6UkcKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTST6AxeXudTLU9HlxpFwrm2icOcx8WHexEbZSnbccc=;
 b=Qlorh4tcRy5jRGc2p9TfX5ebQ/VwXfb1rWZ93NrmrhiQIo7JIq7wFti4/hP1+aCnk2fNbIyD6UOK9oNmaN1bPvjHJju1l+KDOdan9GoD+TvXS6nrDjI6rjIOL+ANbQU6HnVDvN5sMCHaWVF43uKsKfNhlLPB2IfSze/Cd6uZ5bBZIOp40Q/NwY4XGgmSD4ckeYQqReEKmJh8xQNMhgggCmeA2TslClVMJBSQ67DO68dRVLe9gdNZZlC8UAhN5Qv8CPMSUTkNxB1MCtYnvGbjoBFnbiG140t6kWNvB42rYP9Dk2Bvf1uQE/nruzi1WFz0OXAbAPKbva4utqHfmwHTbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTST6AxeXudTLU9HlxpFwrm2icOcx8WHexEbZSnbccc=;
 b=d9fYvsp7hiK31DJDKrLfaIZc+1oPdZzGnab3Hwk+xtueOMO9rCX0Esr6GQFLlR2DWqYVQMMMJizGzqc/USrdXVp1M1x6eeZhPXAmsQoC/xPlqxiCcH8Dj64UfmGpmMQu10hG6h4T3Ts037S28txu1qP3+D9PGamH5j33EpCY7jc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB6235.namprd12.prod.outlook.com (2603:10b6:208:3e5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 09:35:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 09:35:19 +0000
Message-ID: <1cc74496-6c99-3ef5-3710-a092091ef2ea@amd.com>
Date: Tue, 22 Aug 2023 11:35:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
 <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
 <982800c1-e7d3-f276-51d0-1a431f92eacb@amd.com>
 <5fdf7d59-3323-24b5-a35a-bd60b06b4ce5@redhat.com>
 <0bf839df-db7f-41fa-8b34-59792d2ba8be@amd.com>
 <e8fa305a-0ac8-ece7-efeb-f9cec2892d44@redhat.com>
 <ef4d2c78-6927-3d3b-7aac-27d013af7ea6@amd.com>
 <a80be2c1-132e-5ee1-4278-47655916494a@redhat.com>
 <0d5af79a-ba3a-d4be-938f-81627db65b50@amd.com>
 <a3937c17-eaa5-e0e9-e0ac-1610e0652982@redhat.com>
 <1820cb54-5f1e-d2e6-38fa-7161465ed061@amd.com>
 <9072642e-f4f6-4ff1-e11f-9bda8730750c@redhat.com>
 <85107169-8a24-441f-6631-d99472d810f0@amd.com>
 <faecd15e-020b-6b06-acf7-1dd4c5a2b4fc@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <faecd15e-020b-6b06-acf7-1dd4c5a2b4fc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::24)
 To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA1PR12MB6235:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ee39df-8d87-4247-720f-08dba2f3199b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Q2E0EEI6PBdKqK9Gt1aHU8UEEmSb4ZT0yzHoA/CV6VOgSh35fz+muGX5WYTKu86LNRRYW7WBiLcDpkCgvL3kzRQPY95ONl+oEkp+jDm5mM8gELSaiO7p/lXsJx+yhZGx+j1OXwJMwpJCGO8Y09zTclEE3wnbGcISmNTvN6BIS5WvJXbdr6layqJ9n4cuYIN8XcAgOIcg2IrEKTLcS9udANTj2jRQqey7PNwDkttvaMvUxeic5nqW2c55zibo8ywQZVPhHXIhyiXplTykFh/8xh5LnZ8YHeDPvN1ovG+jkZwi0w7mOtRQwVEdAW3sfzrA/2D6nbNSpRM4nK83p7Ob4ger2sJYrDUfLcSnxgpIGF1BvSKLstT6368SxImJc6+9AEm0kItTIT2ZLYYbvEBou7TmwLxv5G5eCYGVE6VFWwCSNJtiKwjZbuGnjSCFemF4YZGWEC3VIln8JJ48kpLg6XhVoCLcswbwQMSUj2i0T4voCktT/PSHt8y0Z2RckBOG91mmVnZbUD6JoUidOpZc26JF4tVTVKF7jjyt5LVlhwQhOfIfes37GcvUn6HEu4jE2A0l1DZsdFr1Zo2BM08NHEs9BoMEU/tPE+IDmFZFLgeyAE28FZHmFH8mECS3wD6sg8ypadtFwiwXAtAAW62Jg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(376002)(346002)(366004)(1800799009)(186009)(451199024)(66556008)(66946007)(66476007)(316002)(6512007)(110136005)(8936002)(8676002)(2616005)(4326008)(41300700001)(36756003)(478600001)(6666004)(6486002)(6506007)(38100700002)(53546011)(66574015)(2906002)(7416002)(83380400001)(86362001)(31696002)(31686004)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1VxL2I2eTJDUGpWUVN5MXluenlLdXN5S3Jjc2t0WHBsaGRBS2h4TVVlZ1hC?=
 =?utf-8?B?Z3hXcmg1ODY3eWZhZEFpSHYzN1JUdEQvdUYwN0ZTSFFKd3JWbXBsZ0N4Mkt6?=
 =?utf-8?B?bW9aZVVEYjlpa3JyalVxN01oeEIyeVR5VnkrRWxscW0yQzduUjByWUNUK0ZI?=
 =?utf-8?B?enBqM3NUTVU0dWltc01rZGU2T3dwQmoySnN2eTFKYTh5SXVLSGh5UnFjNEY5?=
 =?utf-8?B?VjFJZ2F3MjZpdXdMU2RFNFYrSVo5K0JDWHJGNElMWTNENi9HUnpWSlE3LzRF?=
 =?utf-8?B?Z0gva1ZUcDNXTmxYbDVEdm81RXBoWEJSREJtQ3hoZW9SbnlkQWE2bjE2eUw2?=
 =?utf-8?B?MTNhMUF6RkVvMXpxWFMvTEU1RDBaTm1UTUxYN3ZFTzl1N2kwK0FGQjhoWHlJ?=
 =?utf-8?B?eWR2a1BhQVZSNmNGTklOQzhoaVd1a0lUZUtJZXpTVEZNSk51Qkk4QzlDZlNr?=
 =?utf-8?B?ZHVRVjhVU1pGT2taZC9sZjN6OHRKOUFCWWJpaXUwVXdBY2FaM1VJbFdHbHNZ?=
 =?utf-8?B?OGNWOTFodTEyZzR2S0dNTGRXZy9rWjd0dEloRDMwRkhOQkgva1pyczVHMkdu?=
 =?utf-8?B?ekphWmtKc2Jzb2JSM2ZOSW9wRDdscXdybGduYWZZY3VMT2F0aU15cHA4M1R0?=
 =?utf-8?B?ZzRoMWlEeHNuUGtFOGVLSkVEQmRwQytVWWhSU1pnNU5IR2FJM0RpMDZSZzd4?=
 =?utf-8?B?WUxuUEJWRndnbHc5NjB2NnFpR1BIeHdnQyt3U0E3MFJMQ0h2Y1Z2R2FvMGp6?=
 =?utf-8?B?R3BXS3ZJQTFnZVJqT3NiY0cwdzl5eVZyWnc1bVRINVcvMHNHSjJuVU9BK0NT?=
 =?utf-8?B?aFowVEMyOTducVFvNno4OXZLaFNmajhOaVNmTUNnK3hoZzlPS1Vld0w5VzdQ?=
 =?utf-8?B?RFVNMk1uUzVFUHowYWdPSFdKZG8rV0d1akcvYXc1S1I5ZlB6V1V2NjBHaXJM?=
 =?utf-8?B?dC83YTJyWjlsMkpsOFNpY3BFNVRlaUZjYW5hUWpKRlg3NWJvWlJWOHdsZU5Z?=
 =?utf-8?B?TmxHRllhNUdvTG0xdE9GSjNER0NOK0k1YllaT0dpbVZwczZaV2l5UjBRU0xl?=
 =?utf-8?B?VlVMenA0bDFKTHpwNzFzNm1FL0NKdGVOM0FnNGxZWEZjTGxDYnBwVHIraEdU?=
 =?utf-8?B?L0FCNmM1YTFETTlrbDM0NzlqeHdaMnNoZy9TTXB3OUx6dlFWY0xHbHc5WXlT?=
 =?utf-8?B?ZGlhMDdpZHBoOGhtVDVtWDFWWDlPVlg2bllXcVJBZG1palJ3UGpFRW1mUDVL?=
 =?utf-8?B?eW5YOEZjZzA1b2VocEhOK3ZqaW5TQ3NvZE9pQmhZWk91cUFVakdVMjRBRjVO?=
 =?utf-8?B?NGdEZEVtNXVCWm1jMEU1Rlp5MW1Oc0xFU2x6RW5GVmYyNllialdHSGdKS0Rs?=
 =?utf-8?B?NnBic3JZQk9DcWVyRUdKY0IxNDhsbkVMdkFDV09UNGFSSllkS1NDYmhqbGlY?=
 =?utf-8?B?NnI3RU1uR3dWckt1UEEyLzIxb201c2JCRUlZYTN4VFd0cVJrQlJEZjRjV2Rz?=
 =?utf-8?B?RWs1L0ZuMUhmTDh3cDVZQjVMWVN6TDI4clZ0QlNWeFA2L1o2L2xQSW10NU0w?=
 =?utf-8?B?MGlCNGRDRk5WNDhUdmhCRk9VOW5vQmZYSCtLNlEvdWF0MkU1TDEwMU1KWXRX?=
 =?utf-8?B?UDlSVDB6YTB0Z21PeTVWSjM0dy85TmVzNWN2SHhzbGd2UmhQY3phbkNobnZY?=
 =?utf-8?B?bXJOamIzb3dxNmo4RDlOWVZzZmVUTU9JWktXZlcyK3U4bnN5bmJVYXVuLzJ0?=
 =?utf-8?B?R1FkMVpVaXJTbG9rSFV4N0tDZUFsa0QrU2RkQmN6dUpHR2I2SVJDcC93d3lv?=
 =?utf-8?B?ZmFSRktrZXo3dGZqRENzOEUvek1CSnRSMkhTWGZWU0RLYVZ5ek5ocktGMDJZ?=
 =?utf-8?B?bHRFSEhrYTFtZ3BrMVhwdHFpZStSUVpkMkxKWDU1QmNoNXJ2cVRxTXUzYyty?=
 =?utf-8?B?OUNsVjRRK2VHUFozT3gvMTJIQVBWbERYbkRzZnVyWFh0WmZ5R0E3RVJYSTVN?=
 =?utf-8?B?OXk4aFRTWTlQdUg4MnlBOVlhalY0aWo2VHRjRzFkUDBqeVJZdXJBNnlxMjE5?=
 =?utf-8?B?UlVSV08wUEhzUG9PYzlyU3MzaklBMUdhZDQ5QjR1WWpVQ1hxOHpER1UyZFlP?=
 =?utf-8?Q?bGdKXrSNspW2vZhS7pHUxuN1q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ee39df-8d87-4247-720f-08dba2f3199b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 09:35:19.5863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOAjoJZkqGpuhhc0IC53mt0OPKShjR3SEILHS52SEIjUtSLNVGipmFzIfRSabTrC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6235
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.08.23 um 21:07 schrieb Danilo Krummrich:
> On 8/21/23 20:12, Christian König wrote:
>> Am 21.08.23 um 20:01 schrieb Danilo Krummrich:
>>> On 8/21/23 16:07, Christian König wrote:
>>>> Am 18.08.23 um 13:58 schrieb Danilo Krummrich:
>>>>> [SNIP]
>>>>>> I only see two possible outcomes:
>>>>>> 1. You return -EBUSY (or similar) error code indicating the the 
>>>>>> hw can't receive more commands.
>>>>>> 2. Wait on previously pushed commands to be executed.
>>>>>> (3. Your driver crash because you accidentally overwrite stuff in 
>>>>>> the ring buffer which is still executed. I just assume that's 
>>>>>> prevented).
>>>>>>
>>>>>> Resolution #1 with -EBUSY is actually something the UAPI should 
>>>>>> not do, because your UAPI then depends on the specific timing of 
>>>>>> submissions which is a really bad idea.
>>>>>>
>>>>>> Resolution #2 is usually bad because it forces the hw to run dry 
>>>>>> between submission and so degrade performance.
>>>>>
>>>>> I agree, that is a good reason for at least limiting the maximum 
>>>>> job size to half of the ring size.
>>>>>
>>>>> However, there could still be cases where two subsequent jobs are 
>>>>> submitted with just a single IB, which as is would still block 
>>>>> subsequent jobs to be pushed to the ring although there is still 
>>>>> plenty of space. Depending on the (CPU) scheduler latency, such a 
>>>>> case can let the HW run dry as well.
>>>>
>>>> Yeah, that was intentionally not done as well. The crux here is 
>>>> that the more you push to the hw the worse the scheduling 
>>>> granularity becomes. It's just that neither Xe nor Nouveau relies 
>>>> that much on the scheduling granularity at all (because of hw queues).
>>>>
>>>> But Xe doesn't seem to need that feature and I would still try to 
>>>> avoid it because the more you have pushed to the hw the harder it 
>>>> is to get going again after a reset.
>>>>
>>>>>
>>>>> Surely, we could just continue decrease the maximum job size even 
>>>>> further, but this would result in further overhead on user and 
>>>>> kernel for larger IB counts. Tracking the actual job size seems to 
>>>>> be the better solution for drivers where the job size can vary 
>>>>> over a rather huge range.
>>>>
>>>> I strongly disagree on that. A larger ring buffer is trivial to 
>>>> allocate 
>>>
>>> That sounds like a workaround to me. The problem, in the case above, 
>>> isn't that the ring buffer does not have enough space, the problem 
>>> is that we account for the maximum job size although the actual job 
>>> size is much smaller. And enabling the scheduler to track the actual 
>>> job size is trivial as well.
>>
>> That's what I agree on, so far I just didn't see the reason for doing 
>> it but at least a few reason for not doing it.
>>
>>>
>>>> and if userspace submissions are so small that the scheduler can't 
>>>> keep up submitting them then your ring buffer size is your smallest 
>>>> problem.
>>>>
>>>> In other words the submission overhead will completely kill your 
>>>> performance and you should probably consider stuffing more into a 
>>>> single submission.
>>>
>>> I fully agree and that is also the reason why I want to keep the 
>>> maximum job size as large as possible.
>>>
>>> However, afaik with Vulkan it's the applications themselves deciding 
>>> when and with how many command buffers a queue is submitted (@Faith: 
>>> please correct me if I'm wrong). Hence, why not optimize for this 
>>> case as well? It's not that it would make another case worse, right?
>>
>> As I said it does make both the scheduling granularity as well as the 
>> reset behavior worse.
>
> As you already mentioned Nouveau (and XE) don't really rely much on 
> scheduling granularity. For Nouveau, the same is true for the reset 
> behavior; if things go south the channel is killed anyway. Userspace 
> would just request a new ring in this case.
>
> Hence, I think Nouveau would profit from accounting the actual job 
> size. And at the same time, other drivers having a benefit of always 
> accounting for the maximum job size would still do so, by default.
>
> Arbitrary ratios of how much the job size contributes to the ring 
> being considered as full would also be possible.

That would indeed be rather interesting since for a bunch of drivers the 
limiting part is not the ring buffer size, but rather the utilization of 
engines.

But no idea how to properly design that. You would have multiple values 
to check instead of just one.

Christian.

>
> - Danilo
>
>>
>> In general I think we should try to push just enough work to the 
>> hardware to keep it busy and not as much as possible.
>>
>> So as long as nobody from userspace comes and says we absolutely need 
>> to optimize this use case I would rather not do it.
>>
>> Regards,
>> Christian.
>>
>>>
>>> - Danilo
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> - Danilo
>>>>
>>>
>>
>

