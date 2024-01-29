Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AB584093F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 16:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A8C11298F;
	Mon, 29 Jan 2024 15:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A698E10F75D;
 Mon, 29 Jan 2024 15:03:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVrhwjPLdtexjgePzhXm/mc/rNBbibak75SBqEMyJ74/tAbGNTXxxPm2eWBswz3OCdsd9H1NNxKUwhwZ9PzKdRHJYQOtM34OhIdg4QY9dcKxMMNYfntgVZYEXFg1yUSgGKvBDOou+VYE0TuqyO+BTxzEEd8tukm25RWuGWX6w+7Knza1YPfU7+y7rl4rHoIcDtA+84A1ss0jEhSyMxMZZMRS5XPmjlc788ThctFKiAnYU0g7yGJoK6nahVKvS//1omYRmv2+0F9Vit7Zj+42c0hR5aW+K+5AjMonYYH0+0ZYFTZf1fVaj7bKDtBzZ/ds7WRMpZ2wPSETGtRK2q3wKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcAmsGEqvOCH2ncYR3xdTx2Rp1mkCMlXWPN9I85sKsY=;
 b=m4yD2RKCLwhoY3NJSL4g4ikvnRzf3paO3Vy1yjWis9Mwhy9burHU52rc+k6tjbS6zXyFI98cy7u8W8amQ/2QcStACQeD6RvcfYL7Yx56eVk7M04JesTxhNfR3sJiIavBzM2OZZDuhvSpWGFppB1u3eWc+Y3+Vzm30C5xvgXg0DC/IQAzsWD0djOaJoksOjLy4n7sZLNaAtw5fIf2VlzBIQDGfFkdfx48AjUfZn5DEi6KEDsXzDurRwpgvhK1pJNCnE8uGowfQET59RMsffvx/5wP9bEWyBgjqXquFijyRSrQ65cMWcRME0dZ7dT0WPP4TufLJQca+sz/mSXig2Yr2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcAmsGEqvOCH2ncYR3xdTx2Rp1mkCMlXWPN9I85sKsY=;
 b=AMez8CC30oV7odQHkPpZVZM/TW7KXqdbUAXgq2VWziQ5JRvVRGlOynjUe8Xjuy1/rFWpSG5nUbrpt4LwjDuaBT44AkGClEX/e1KQasJIHww1YDAfDyB1e8+G0AmXNlY6rnixvjD4lldkYNxpQmuVTYvmXA7eMNh3ATwX2V/swQc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MW3PR12MB4411.namprd12.prod.outlook.com (2603:10b6:303:5e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 15:03:46 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::6f2f:7892:e9fe:c62b]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::6f2f:7892:e9fe:c62b%5]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 15:03:45 +0000
Message-ID: <a3a5d6b3-3aa6-4d94-90e8-a6b4b8eeb3a2@amd.com>
Date: Mon, 29 Jan 2024 10:03:43 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <ZbKpWpOGuNKLJ6sA@phenom.ffwll.local>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <ZbKpWpOGuNKLJ6sA@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXP288CA0027.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::35) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MW3PR12MB4411:EE_
X-MS-Office365-Filtering-Correlation-Id: a154e729-d2f6-4fea-dd4b-08dc20db7da6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9sj4uN7zungjUjQVacgbsk26riiGAXqCvzgMAevPTZJbhGX+ZFCEgLvC7Gs8mkXrHFFTWxqoFthkGHYtRJxNXNlpPJBFPql2p5Sxjz1UZ8Fu9CNRVkr62dsjyn+l16kn4j2RQHbklfnQXys7vRb6bGfwHmLU/UpqGkavAhBMTfr9jj/gunrDLRMw5h4SScaeGEo46c64aJF9sRvJ6P2KkBIuBKnH+ht+m7sk0t+8gGV9EN4CxneatlYKbNQw/NC0zh4po8pFdIZClDACrMLYdnCyauAdgHxXERJ8AlwG3aSQlrlGahUK/wwa8467ennfWGvtUXifIjlToiwcfoiR/RPHyMf8RoDaX2yMjmu6++5RKlm6R9gSh6ot6H2g6ectt1meX1yOk0JatFBN3ScvQAMdWSkPK2laDJ8ZZuedjrrHq5VuAlvHY7Homc/UHHzNxQ9IQ6r8N/1GcPNUU/SCoII1bpzZ+Xj3FSvAo0TLeNrci431so3Ser9ohnGkj3EytdHGV7h1k6RwPjm+4C+VUBVIJui9u65Nsaox3tYbKuf67+Yti2gHWj3L1QGiEX9Jzie5t9xPpSZr1Az+/j42ax4CrVaXogOr5Su7ViGu72Rj9xlX4sWfvkIsA0rzgQdRFCjw+uiGhF59Cm5f+gGGbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(316002)(83380400001)(31696002)(54906003)(110136005)(66476007)(6636002)(66946007)(86362001)(66556008)(6486002)(478600001)(53546011)(6512007)(38100700002)(31686004)(2616005)(66574015)(26005)(8676002)(8936002)(6506007)(4326008)(44832011)(7416002)(5660300002)(2906002)(41300700001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjVmNElRUC83NytPU0t1dWVVWlpheElTdEVsUVNkbGVBY0hsWXQrcHRobDBF?=
 =?utf-8?B?TEJnR3RQRmkyWHc3a213YUNNNVBLNnlTOVlQQTB1NDdWQkJ6VStCSEFCZVhk?=
 =?utf-8?B?ZXNHRS94Nm0xR0dSS1hNMVgrWk5UK3hRb2VoMXJKSWtBV2o1ZlRpYWJpRDhq?=
 =?utf-8?B?dVFVRGd3dEErZlUwdTF5MXZreUpoMUIyckRtRDlhYllWNm42U011MVB3ODFQ?=
 =?utf-8?B?a3lxMnBsbGpQa1l6ZkFRSTZoUGoxZERmQytTUkpiTTVJTVo1VHNpbnp6c3pN?=
 =?utf-8?B?U0pwMk4yRWdOczVTVEVSRHRhbmhCUUFIbG9aUFFMdjd3MEJCY2xRTGp0dHND?=
 =?utf-8?B?enJnNFc3TEJhQ0VwSWEyNUxYMEdDS1J0UlhWL0M1OXovM05EQWZRRCtyOXJw?=
 =?utf-8?B?OTRKWlErTGR0UTYzREpTRzN5YWhZZ05NcU8vcWxZNDVya0w0cDRUSGdtWUtx?=
 =?utf-8?B?ZGNlaVVlTDQycDZVVVZBQ1c3VmtkUHBCMUJRNFc2SUtHRGt4TlVKalY0VXFx?=
 =?utf-8?B?Y01yYjBPL2RvczdGSmRsZXNSYVkrRnZ2U2RlMlRrRFo0VXAxVkF5L3FWTmlU?=
 =?utf-8?B?OEExVXdUQnJ5ZnkranN3RUNKZENmb2tTZmx0VmNTeUVHYVVaTThjOENYOHVE?=
 =?utf-8?B?NFV2cXBOR3dZaG1PalplMmhjU0E2Rk5nNklQTmk0a1IrZVl1MnhRcngycERv?=
 =?utf-8?B?bkhRM2ttTnhMa00wdXp1Q1AyWTd5K0VjcGxxVGFHa3REVEVtN2tTSzRHMmRG?=
 =?utf-8?B?T3BwMXY2VUVLTzhXcjQvRGNQbUlpTEZvSW1RNWtEbGFFQk5lTEo0Um9ZOGs2?=
 =?utf-8?B?T09XRlNJUElsc3hNTkIvTnJTaXRSN2d0UUZyWGhxZXBiRlBSMDhpRWJyc21I?=
 =?utf-8?B?L29hTVAya1ZYMnFQT2E3M1lTSjhuaWk5UGhWR1lKc2ZqU1pzNlhuMEs0QWEz?=
 =?utf-8?B?cUVtSlNjQmg2NFc4Z1NhL0NqV0ozOTMzZExRdzFJSjBtdnZmcWFMa1VRZStG?=
 =?utf-8?B?ZkJ6dlVtQ1NkdlRDYWc5TmxCaE1zN2cyaFI0TmxZZllORkp3WVdyZWg0NUtY?=
 =?utf-8?B?WkhZOHNNdTNmaGlFazJTUFloaFJBZE1xc090Nk8wZDViSkpwcDJoMnZjNHVy?=
 =?utf-8?B?UnpoL3FUVHBlaEZRdzBEYk5rbHZCVzZSd0RWZElhMDlvVjQ3SUhhaUgwRFd2?=
 =?utf-8?B?TDFTUHIvZ1A0V2VsRXJaN1VkRUtpcit5WCtqUnhnMmJUdmJnTHhLdmhKb0kx?=
 =?utf-8?B?SXdZcjJLemh0RmFBbWpZT1R6TmhpSmxXSXJsMXAwZWNsWVVwcnUrb2MvQiti?=
 =?utf-8?B?UmRub2ZScVVOaFFTM0s2c3doamtNdThXcjZLcVljTG5rdFU2dnZKZlJaR2Rt?=
 =?utf-8?B?enRoYTlGTVAvQXVUeG84ZzlON2VkeGRBam5XdXdVUDg0aXVLTjRKSW85bk5p?=
 =?utf-8?B?eDBxK1A2NlJybHVEMHh1ZEdYY2VHSUpScldNN2ZHQ0YwY1dXNkVURDB6dzNF?=
 =?utf-8?B?cmsvbm5LdmRiWVIwSHNWdFRpNEczK1gwbjVSbzE2dHNuNGU2TjdyZUttQUxN?=
 =?utf-8?B?WG1mU0s0WS9uVko3cW5Qck9HbXZ3SFZlM2lWbk83RVlsQ0hLaXZTTmlYb0U3?=
 =?utf-8?B?MXNMeTNlRkVJOFcxN20zMEMzWHJINlZ2UzNXYWN0MlVvNWhqNWxockVQMHB1?=
 =?utf-8?B?a2JRRndjQmxsYlN0ZjRZb2RIdDhXTlR1TG03U1l0LzJhbGFTckZqd2hsS1Bx?=
 =?utf-8?B?WTY4NUxkdFNjS2NFUjZYa0ZKRXZ0VHUvYi9WYkdwQUYwR29qeUV3djZ4dmt1?=
 =?utf-8?B?MElqaGplVDhCSk1oS3hEMUdrOFhtNmV0c3ZMNitHcGVHejVTTGpDa0RRRVlO?=
 =?utf-8?B?T2ZzNTFQeFJuZFR0WDZ1elVSWE85blN2NFdNWVVYczFjVjAyVVhMR1dLY2hP?=
 =?utf-8?B?VDhSQS9OaUZmQjZZRUpLeEF4R1pwVFg1SWw1aVFnZDVmamsxQS9TYUZ6SDhv?=
 =?utf-8?B?TDJSb3NmZmxSVEdnSFBaVnF4b2dPZFArNHlIdjJBSGdYT1RjY3dWL0trdGFp?=
 =?utf-8?B?YzBaTkdGSUx3NHVONHNlMm4rdWZqMU0vY2ZHQUNVMzZIalJXVnRCVFZqRkRr?=
 =?utf-8?Q?oArTWNv4ZFXDwWlZDOVI5x5o4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a154e729-d2f6-4fea-dd4b-08dc20db7da6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 15:03:45.9092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ve7gHhPHye95YF091U8ALz2wvKHBVfOryFpuDwCp4yxhFlDdDcRP00JJhZjgN5VxXi2kO7Pa9PlRoChDBg9CEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4411
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>, "Welty,
 Brian" <brian.welty@intel.com>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 "Zeng, Oak" <oak.zeng@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, Dave Airlie <airlied@redhat.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024-01-25 13:32, Daniel Vetter wrote:
> On Wed, Jan 24, 2024 at 09:33:12AM +0100, Christian König wrote:
>> Am 23.01.24 um 20:37 schrieb Zeng, Oak:
>>> [SNIP]
>>> Yes most API are per device based.
>>>
>>> One exception I know is actually the kfd SVM API. If you look at the svm_ioctl function, it is per-process based. Each kfd_process represent a process across N gpu devices.
>> Yeah and that was a big mistake in my opinion. We should really not do that
>> ever again.
>>
>>> Need to say, kfd SVM represent a shared virtual address space across CPU and all GPU devices on the system. This is by the definition of SVM (shared virtual memory). This is very different from our legacy gpu *device* driver which works for only one device (i.e., if you want one device to access another device's memory, you will have to use dma-buf export/import etc).
>> Exactly that thinking is what we have currently found as blocker for a
>> virtualization projects. Having SVM as device independent feature which
>> somehow ties to the process address space turned out to be an extremely bad
>> idea.
>>
>> The background is that this only works for some use cases but not all of
>> them.
>>
>> What's working much better is to just have a mirror functionality which says
>> that a range A..B of the process address space is mapped into a range C..D
>> of the GPU address space.
>>
>> Those ranges can then be used to implement the SVM feature required for
>> higher level APIs and not something you need at the UAPI or even inside the
>> low level kernel memory management.
>>
>> When you talk about migrating memory to a device you also do this on a per
>> device basis and *not* tied to the process address space. If you then get
>> crappy performance because userspace gave contradicting information where to
>> migrate memory then that's a bug in userspace and not something the kernel
>> should try to prevent somehow.
>>
>> [SNIP]
>>>> I think if you start using the same drm_gpuvm for multiple devices you
>>>> will sooner or later start to run into the same mess we have seen with
>>>> KFD, where we moved more and more functionality from the KFD to the DRM
>>>> render node because we found that a lot of the stuff simply doesn't work
>>>> correctly with a single object to maintain the state.
>>> As I understand it, KFD is designed to work across devices. A single pseudo /dev/kfd device represent all hardware gpu devices. That is why during kfd open, many pdd (process device data) is created, each for one hardware device for this process.
>> Yes, I'm perfectly aware of that. And I can only repeat myself that I see
>> this design as a rather extreme failure. And I think it's one of the reasons
>> why NVidia is so dominant with Cuda.
>>
>> This whole approach KFD takes was designed with the idea of extending the
>> CPU process into the GPUs, but this idea only works for a few use cases and
>> is not something we should apply to drivers in general.
>>
>> A very good example are virtualization use cases where you end up with CPU
>> address != GPU address because the VAs are actually coming from the guest VM
>> and not the host process.
>>
>> SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This should not have
>> any influence on the design of the kernel UAPI.
>>
>> If you want to do something similar as KFD for Xe I think you need to get
>> explicit permission to do this from Dave and Daniel and maybe even Linus.
> I think the one and only one exception where an SVM uapi like in kfd makes
> sense, is if the _hardware_ itself, not the software stack defined
> semantics that you've happened to build on top of that hw, enforces a 1:1
> mapping with the cpu process address space.
>
> Which means your hardware is using PASID, IOMMU based translation, PCI-ATS
> (address translation services) or whatever your hw calls it and has _no_
> device-side pagetables on top. Which from what I've seen all devices with
> device-memory have, simply because they need some place to store whether
> that memory is currently in device memory or should be translated using
> PASID. Currently there's no gpu that works with PASID only, but there are
> some on-cpu-die accelerator things that do work like that.
>
> Maybe in the future there will be some accelerators that are fully cpu
> cache coherent (including atomics) with something like CXL, and the
> on-device memory is managed as normal system memory with struct page as
> ZONE_DEVICE and accelerator va -> physical address translation is only
> done with PASID ... but for now I haven't seen that, definitely not in
> upstream drivers.
>
> And the moment you have some per-device pagetables or per-device memory
> management of some sort (like using gpuva mgr) then I'm 100% agreeing with
> Christian that the kfd SVM model is too strict and not a great idea.

That basically means, without ATS/PRI+PASID you cannot implement a 
unified memory programming model, where GPUs or accelerators access 
virtual addresses without pre-registering them with an SVM API call.

Unified memory is a feature implemented by the KFD SVM API and used by 
ROCm. This is used e.g. to implement OpenMP USM (unified shared memory). 
It's implemented with recoverable GPU page faults. If the page fault 
interrupt handler cannot assume a shared virtual address space, then 
implementing this feature isn't possible.

Regards,
   Felix


>
> Cheers, Sima
