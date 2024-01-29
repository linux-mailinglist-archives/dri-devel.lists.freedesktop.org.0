Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D489F840A22
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 16:34:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9831129B1;
	Mon, 29 Jan 2024 15:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2077.outbound.protection.outlook.com [40.107.95.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F49A1129B1;
 Mon, 29 Jan 2024 15:33:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqW7fZSKK7p2idzAyxk+o27GVaC73PxUisJHY3uUj3JQWf0EEHpEHMb5orsVjeJDzaCYE8ZmQA/yFAtgbaVSrW2OVq3UDzbPJHcO5Qt1gRYcov2ePS2aaL/0s1VuQQMUBYbHSvDUYu42iqGIh4EGfhNp6Ma6MNPWFGn2h1Oq3RA+zJNJ7KSp/3uPu/l1fCTQomF47a9+KJctuXkECC34QqFZ9n9rN66Vtpsv5PBMGTQg1xGzE2FcXZTv1u91IFCXPisz7Cr++3y7fLHla7yiyBwOGQxKEc6jJLFikrnMsPAxfIGoH8e5Z25LA+t5CM/i8IgoGB5sujndaVOpYDeg/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRON+ubsgZGwkn6E+s3bOM0FOlUg/mnW4ku9VvG7GGg=;
 b=hxfydb2WhQqffzDGw2Sj0rU30uZSkKFkNSfyfcyLGoUzNo/Etvl/m1FaihMvqvfumba8NSFV5wa18jvRa/YyQsf1r9pguTJEX76zEZVwpkUlhLoEY2eSk1ZRZSM+IvEt85Gd3jLGUBr0njBJgVFA1Mp1JxQNt6NaGkl07jFGYdZ9Pdy5egrQpl0mKAJg7LeiLSVKPrK01MxWv1bMmh2nfRHlOLZpF5WeLgccyhbR7AM068mhzOu/sGO+RtAyVY+a5yRRxP9pO1CgSktRjvA6iZoDdODgRXAqCJrv0qom9IOB2YZMjGU5G+MPKM6c59GwFz/dJr+Knjc89+8JieNOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRON+ubsgZGwkn6E+s3bOM0FOlUg/mnW4ku9VvG7GGg=;
 b=IHa/hpjRX05N4BHBFGUKOADtmYFS5O+AFqDvsozaVXDOb6X00CARYNI7hunFRJnxM8oreQ2tXX8Pie/MI3WY4HXVNoaUcz0E8m7FDM9QHxjBHBfEQ8cbLC4mO60zX4mM5iRxHbbnZJ2i5B5JzcwX/Df3k826yuUBYEjSz0dKmT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BN9PR12MB5049.namprd12.prod.outlook.com (2603:10b6:408:132::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 29 Jan
 2024 15:33:43 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 15:33:42 +0000
Message-ID: <7db48b59-f4cc-4b32-88c8-6461a7470b63@amd.com>
Date: Mon, 29 Jan 2024 16:33:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <ZbKpWpOGuNKLJ6sA@phenom.ffwll.local>
 <a3a5d6b3-3aa6-4d94-90e8-a6b4b8eeb3a2@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a3a5d6b3-3aa6-4d94-90e8-a6b4b8eeb3a2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BN9PR12MB5049:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f8f69e6-0026-4829-5388-08dc20dfac82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gofczEO7I7E8e3sbDZ1/2uiq4XWCDO8bl6cN5WpSspgFezgzZtO9igBqop3eqBOKIazEq3Av0Mg1jofRlfWFwV3IdC53Dmbe8WWQj1aScBLs1zN8MkiMnLzXbc4ZF2f5DgUePUiGd8Humzi5brS9JcMpY8zsEhMnzgXvDSNUHmMHagS7uMX2EAA0EKdcaOR7d4FG8ePQpPZkWK5/D9r3JjvciuB0V3GoepqqMlCYmHU5SD8HLFQ29l0cVUKy4cZU9SYATA+IXoEbjB/+VwcAg1efw84JGl1+uircFHgvJtxGXIDZkaM7gYVPgXOhsY8oeP8WOQww7Tc6zUDUzcU4TUHK2fYzdXTBXgWZiQ2SvhLyb/nPVw5FS7lMekyygzmkZv3d5huPpcLCGEXKcPo1lTwH3hvPIlgKrIck9LtxemOCOJNzYWJXp7Evx2gyMF7IFGhVCfRzehHCwCNRGgvtKXbgdUGTIGg01RAVsoFfjkA2xodjIHaj9SdCvQl7FKpa4WW7hbM0PMraUy8pGIpNWJntpRoOpk1MJCDua6HRrfXpjyc4g3mG231jWZ803d8ZQtTWjjhblyjpz/2REwlNcth7YBCSYfzGGRHaTIG8oQ2r3M/IvvPEdz8LyHOP3mo/WLIdtUn7pbnEcHmWzWyEQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(366004)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(6666004)(26005)(66574015)(6512007)(53546011)(6506007)(2616005)(38100700002)(5660300002)(7416002)(8676002)(4326008)(8936002)(41300700001)(6486002)(478600001)(316002)(110136005)(2906002)(54906003)(66946007)(66556008)(66476007)(36756003)(31696002)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3NQQlJMbTl5azNaZTNET1Z5akRWTDZuNEVqSGhxUjdDZXhManlwRUVRVFR6?=
 =?utf-8?B?R1NnRDZlejZlVzdjbXNFTkw3NThtUUx2TjFTb3pFdFc0b2JZWHJhZUVkKzg4?=
 =?utf-8?B?ZXhqQ2ZKdnY1S2xvd2xZTGRHaVFtVmRtYjBnNS9KOU5LcTUxYnNoMHNYblVC?=
 =?utf-8?B?NXJibnd2aTJ6OUdlaFBtdFoxS3NlallmWmNNWWRBa0haMXN5WEVCNytaNlU2?=
 =?utf-8?B?UzFpbnZWbEFLcXJtdGFnQzRSUkc1Wmo2K0NtQXYrTzBoNEFhL1YrRWRtZFN2?=
 =?utf-8?B?WkdYNUZIam0xa3pxbFpVZmRYYTVTL3FibkIxdXRVTVBTMkxkdUtKZzlQb1Jz?=
 =?utf-8?B?eDQ0emdEa0F4dlkrR0I0dWpMVXlSbzRlUW1sMG1QbWplMVNWd0htVGJlQllw?=
 =?utf-8?B?Um91NHRkd01YYjl3NTZVR0luS3JReHJQSll4V01nK0hhRkFmUXlxSkdoZitC?=
 =?utf-8?B?ajJyZXpYcmdDckhHWTI0L2hTRm9oSHNCMWs4UUVDMlluRCs2OVZ6WTNGLy9O?=
 =?utf-8?B?YVVVVG1MdFFsYk9pQitoUGw5Q1ZJVEdNODYrb0djcmRFWWNZSEpKLzJlMCtm?=
 =?utf-8?B?ZUsvZXExN2gxdStrZGRPeXNyOFJaeUFHQWpuOTBmUHpRM29aQlhORHZ6YkJ6?=
 =?utf-8?B?V1hYYkpVenI2bmZVQytobDlIb1pLZjlFZEtSeVJXUnVieVMvaEpnSEdYaFpt?=
 =?utf-8?B?ellQc09DTCtiV2RVUXQ5RWFwenpMWHBMQzRjQ1haZGswT3k0RkhManJWN0JE?=
 =?utf-8?B?K3VKdG1zUGhRdWFMOHRRTC9yME01emlhdGwyUFlJVXVrQkh4UTVDY2ppbkpp?=
 =?utf-8?B?NHZzMTM4ZzIwU3hWOG5jMHBnWVhxaFdyUDlsNWVoTG1OdkxGV0Q1YktrTG8y?=
 =?utf-8?B?NmZmYVRTeWRpSTFUeCtkWjhLYUpqcGVNUmVTL0xNdWc5TUxlWkdzSjZvUnpP?=
 =?utf-8?B?LytpcWVKcTdXeCtQZ09VL1VNSE91b2JndE80ZHN6U3ZWcHpCanFaa2dranBh?=
 =?utf-8?B?ck11SG5IRDl0STNOTllTOTZXRVBhRVl6S1p1dWxWbkVXSllORmFBUWtkOVdW?=
 =?utf-8?B?SENVR05TNXB2eGJyRlEyUXB5emxtdGgrUjYvK1FTTEsvWUlSNFZDaEJQVS9p?=
 =?utf-8?B?QUo1Rm1uMUdza1VhblhSTUNhaTM5dFRPQTI1NHF0OUNoaElENHpiRlBsN2V1?=
 =?utf-8?B?dFlycnRWM04vM3MxdjZmZEVWSC9rRnNyNnlleXZZd1FIUXVCQjZ1THg4b2hD?=
 =?utf-8?B?ZDA2OGJqdjRPRTlHME4wZkdDelFyTE9pbGFWckszRk9BVC9FYXRFaFRCTTcv?=
 =?utf-8?B?NVFJTkNuRFc0aVFWSWdsTmhmUXA0WkxSdHJGQXZRVXVTazJicXRrUnZmd2p4?=
 =?utf-8?B?QWVnZkZvNElndEN0c3lCRjJ6a3NMWGdFMlJiQi9jaGVRSG42cGE3aXFnRXlm?=
 =?utf-8?B?RXVYamRXbXRNNXd5UEluTmJzd0tXbXRRQmFNV0NYOXRoNWl2Qkl5b1J0WGJm?=
 =?utf-8?B?RmwxblpQNzFTZFYrNmN5ZHNkSzA5WjZuWmZ4NHdadGNsTmNwTUt3am4vb0h6?=
 =?utf-8?B?ditnM3QydHBsbXdIdjZDbWF3L0IzM1k5dzNHK1U4MWY0NW9PRzYvRGRPWHc4?=
 =?utf-8?B?RWRRNFpJRmhSVHdPMEhPSDZkc0hQbkh4N3dKOTlkQ1JXRE9UNnRLS2E0Qk9k?=
 =?utf-8?B?TUNjWGhqU3VUR0FOQnoyQUZCSVdtVmUreEF2SVY1cXVkTU8zdUJOQmxCdkYw?=
 =?utf-8?B?dnBUejYvN1o2NG9HNHN5aCs1RTRDSHEyMTNUYUowZVhuUTdJbzJaMWhrOTRB?=
 =?utf-8?B?ZC9TSU5vVGUvZzNLa1dtUkRZOW9ycFhvNjMwM1YwNU56WEpnLzBEbnB4ay80?=
 =?utf-8?B?Ull2SUN2djlKQ2RtdUM3Unk3SURtdzRlWFNWWnRoT1lBV3NpMVNjQXRUVXk2?=
 =?utf-8?B?YVN5RTVNNzdNQXJyL2ltUlJRZEV6NmFrOW9OUmg0am1LQTJBSVNWOWNWYTA5?=
 =?utf-8?B?NGgrUVBWU3hrK2lkVlRGTWdVVEJWc1Y1R1Nvck9RNURVcm42NmY1THRITG4r?=
 =?utf-8?B?di9WMlQvcFZ2dk52WVRsTEpYUHhncFpDYjFyRjBjQVhRSWpKWE90bEVRUUNK?=
 =?utf-8?Q?GQ8FyPiUEctVcRe+dq2thLULd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8f69e6-0026-4829-5388-08dc20dfac82
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 15:33:42.7377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCIZmldfNFqL5VhpL9e4VG5em1jjgyPGmLrSRnYEs8FbwTtlP5Sywa/riDHb3Gi7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5049
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

Am 29.01.24 um 16:03 schrieb Felix Kuehling:
> On 2024-01-25 13:32, Daniel Vetter wrote:
>> On Wed, Jan 24, 2024 at 09:33:12AM +0100, Christian König wrote:
>>> Am 23.01.24 um 20:37 schrieb Zeng, Oak:
>>>> [SNIP]
>>>> Yes most API are per device based.
>>>>
>>>> One exception I know is actually the kfd SVM API. If you look at 
>>>> the svm_ioctl function, it is per-process based. Each kfd_process 
>>>> represent a process across N gpu devices.
>>> Yeah and that was a big mistake in my opinion. We should really not 
>>> do that
>>> ever again.
>>>
>>>> Need to say, kfd SVM represent a shared virtual address space 
>>>> across CPU and all GPU devices on the system. This is by the 
>>>> definition of SVM (shared virtual memory). This is very different 
>>>> from our legacy gpu *device* driver which works for only one device 
>>>> (i.e., if you want one device to access another device's memory, 
>>>> you will have to use dma-buf export/import etc).
>>> Exactly that thinking is what we have currently found as blocker for a
>>> virtualization projects. Having SVM as device independent feature which
>>> somehow ties to the process address space turned out to be an 
>>> extremely bad
>>> idea.
>>>
>>> The background is that this only works for some use cases but not 
>>> all of
>>> them.
>>>
>>> What's working much better is to just have a mirror functionality 
>>> which says
>>> that a range A..B of the process address space is mapped into a 
>>> range C..D
>>> of the GPU address space.
>>>
>>> Those ranges can then be used to implement the SVM feature required for
>>> higher level APIs and not something you need at the UAPI or even 
>>> inside the
>>> low level kernel memory management.
>>>
>>> When you talk about migrating memory to a device you also do this on 
>>> a per
>>> device basis and *not* tied to the process address space. If you 
>>> then get
>>> crappy performance because userspace gave contradicting information 
>>> where to
>>> migrate memory then that's a bug in userspace and not something the 
>>> kernel
>>> should try to prevent somehow.
>>>
>>> [SNIP]
>>>>> I think if you start using the same drm_gpuvm for multiple devices 
>>>>> you
>>>>> will sooner or later start to run into the same mess we have seen 
>>>>> with
>>>>> KFD, where we moved more and more functionality from the KFD to 
>>>>> the DRM
>>>>> render node because we found that a lot of the stuff simply 
>>>>> doesn't work
>>>>> correctly with a single object to maintain the state.
>>>> As I understand it, KFD is designed to work across devices. A 
>>>> single pseudo /dev/kfd device represent all hardware gpu devices. 
>>>> That is why during kfd open, many pdd (process device data) is 
>>>> created, each for one hardware device for this process.
>>> Yes, I'm perfectly aware of that. And I can only repeat myself that 
>>> I see
>>> this design as a rather extreme failure. And I think it's one of the 
>>> reasons
>>> why NVidia is so dominant with Cuda.
>>>
>>> This whole approach KFD takes was designed with the idea of 
>>> extending the
>>> CPU process into the GPUs, but this idea only works for a few use 
>>> cases and
>>> is not something we should apply to drivers in general.
>>>
>>> A very good example are virtualization use cases where you end up 
>>> with CPU
>>> address != GPU address because the VAs are actually coming from the 
>>> guest VM
>>> and not the host process.
>>>
>>> SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This should 
>>> not have
>>> any influence on the design of the kernel UAPI.
>>>
>>> If you want to do something similar as KFD for Xe I think you need 
>>> to get
>>> explicit permission to do this from Dave and Daniel and maybe even 
>>> Linus.
>> I think the one and only one exception where an SVM uapi like in kfd 
>> makes
>> sense, is if the _hardware_ itself, not the software stack defined
>> semantics that you've happened to build on top of that hw, enforces a 
>> 1:1
>> mapping with the cpu process address space.
>>
>> Which means your hardware is using PASID, IOMMU based translation, 
>> PCI-ATS
>> (address translation services) or whatever your hw calls it and has _no_
>> device-side pagetables on top. Which from what I've seen all devices 
>> with
>> device-memory have, simply because they need some place to store whether
>> that memory is currently in device memory or should be translated using
>> PASID. Currently there's no gpu that works with PASID only, but there 
>> are
>> some on-cpu-die accelerator things that do work like that.
>>
>> Maybe in the future there will be some accelerators that are fully cpu
>> cache coherent (including atomics) with something like CXL, and the
>> on-device memory is managed as normal system memory with struct page as
>> ZONE_DEVICE and accelerator va -> physical address translation is only
>> done with PASID ... but for now I haven't seen that, definitely not in
>> upstream drivers.
>>
>> And the moment you have some per-device pagetables or per-device memory
>> management of some sort (like using gpuva mgr) then I'm 100% agreeing 
>> with
>> Christian that the kfd SVM model is too strict and not a great idea.
>
> That basically means, without ATS/PRI+PASID you cannot implement a 
> unified memory programming model, where GPUs or accelerators access 
> virtual addresses without pre-registering them with an SVM API call.
>
> Unified memory is a feature implemented by the KFD SVM API and used by 
> ROCm. This is used e.g. to implement OpenMP USM (unified shared 
> memory). It's implemented with recoverable GPU page faults. If the 
> page fault interrupt handler cannot assume a shared virtual address 
> space, then implementing this feature isn't possible.

Why not? As far as I can see the OpenMP USM is just another funky way of 
userptr handling.

The difference is that in an userptr we assume that we always need to 
request the whole block A..B from a mapping while for page fault based 
handling it can be just any page in between A and B which is requested 
and made available to the GPU address space.

As far as I can see there is absolutely no need for any special SVM 
handling.

Regards,
Christian.

>
> Regards,
>   Felix
>
>
>>
>> Cheers, Sima

