Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE55840B46
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 17:24:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC58910EFC8;
	Mon, 29 Jan 2024 16:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDD110ED4E;
 Mon, 29 Jan 2024 16:24:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5yA3WeKu6QUJxlealQjNSBF/EZqAch/Zd2dC1s1ET410vutDCUJiyGpNYSigpOBSMgqNu9D3RjXmsy4oqxgHRpwqBu0iPBlcsYgWPTTq576MuVz2OM4zMH/uz66m2UOn/gRryfA+fSz6UXzR6AJ+bJ5Se79qD2LHMA0bJCPQG1KtDKWYbCSJ7bBee08Qw26aaGeIiBCiBM9fwFV9sea2sc3ZpOu4tQTuKWzzExRmNCih4I3U6R4pjnhLZEDeR54L+Vfv6zrE1T4mu6NW8w44V3TnuqX15KUzosJRKLh2Ygy0z7HUXjbog/cHP+Ixt4MPDsgeQ9r0PQPzdrbHWP3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTb1q6VHZXz1QhHKpKzPOyIafN7GqU/EL6B22v+EJ5g=;
 b=I9y6XKIkcBXal+4Ii4KfbfpX64qvkz6RfrL8s+DtmVp5ILvW84DYFg9nozKd7ORRLVZXQAu9r2lbIWgjjWfLPxa6jlIxL/O4FWsYOu8eaSR96I2CFr27HVqqe0MOkNhO9B/E8o4JsXggP5V3FR/og1UL89ucFLjMw02lABkN8t39VgJcNQWxxzMx2YPDlzz1RgpGcu706hBFx9eFgT2A44+NV/TV3VvNiSHsmouwCWDI/0Gmo60z6sxUA223RaxjJRND/l6ax5oLbz6TOUln38xzPxMsCTnVNASAcpUYpNreLSC698GGjAlAPJ0kN1v73hcn5fauaagbE1QtPzZzwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTb1q6VHZXz1QhHKpKzPOyIafN7GqU/EL6B22v+EJ5g=;
 b=O9fzO3s942Pt2lcyc6V8/3ylKIUqg6ISr+0JO0HgEX3WXC3Wzj+n7sN//Qdpbnt0TnU5QhQU3qrYnBLBJ2NbAkJuYDMBwv5S3MmkH42fC0vqKZJ3un0R3aYPURGv9kVBe2X3F05ZPIgmyv6zTPeJi1X5wkiMSUzNvKIS/eSpYF8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MW6PR12MB8915.namprd12.prod.outlook.com (2603:10b6:303:23e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Mon, 29 Jan
 2024 16:24:35 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::6f2f:7892:e9fe:c62b]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::6f2f:7892:e9fe:c62b%5]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 16:24:35 +0000
Message-ID: <3e795468-1779-4100-a706-85be323e69f2@amd.com>
Date: Mon, 29 Jan 2024 11:24:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
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
 <7db48b59-f4cc-4b32-88c8-6461a7470b63@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <7db48b59-f4cc-4b32-88c8-6461a7470b63@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0384.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::13) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MW6PR12MB8915:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ce8ac2-18e8-4210-d7e3-08dc20e6c84d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UtNOi8xmvmasQdt/2wtPvjk600hp3OWam5IN+fdVhLRamwQhpm3/NkT8LuBZRxAlDfjGXZyfHkuvCl0MvnRltySOD7nljXQSZm1x0sBxhwXYi7JoyLJKmEU6WvcfIwh+1whrMudE/ElOG/6J/UV/JkK4ssLTNFeD6Auyc9XCE2DdvpoZj8M+Sc5GA1zzqZMvjZc9Y4kH4IZve/ZZczUYBovsIg1F0lGXWodAtlsd/aFW8IzPSdI5IywHzM9BKwbpkbeOD/OfEbVeghRF7zGIh3S0oGCJ1wxfc4Jocun76DW15Uc1wm5hA/t6fI/lxMHQCGvlxZHF3NxFo9QF3MwOCvn/ja/MHmQ80tOWzp6TOOsFQ8+rIelSkExgwXitMto50DOukvns5ZE1YzIVrDMcIAOJob0W026rjUzm0K+APt+b9mCgjRPESWIrYTGmg+MqvInoIryMODvoYvPCaG61R/yM/MnePLpeYX4zbpgvHbYIGU6o/9hH4Ek2GplXDJSEYe/TixFY7cwkQJ9B6BvP5jpa4hiVW5i1wJ3Rhe6fLsug7ofFWQ7fjAuyDAhcDlRfeFUA+10JsXB3zb1veE0ryqi2yxjHOi/Rnf7530Qrgr8P3a2lethYuVKL8XOIYzEIfSqd/Z7B+XdY3ETD0PzcKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(39860400002)(366004)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(31686004)(26005)(66946007)(54906003)(66476007)(66556008)(5660300002)(66574015)(83380400001)(7416002)(2906002)(6506007)(8676002)(36916002)(6486002)(316002)(8936002)(478600001)(110136005)(6512007)(53546011)(44832011)(2616005)(4326008)(38100700002)(86362001)(31696002)(41300700001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDRPYTgvTDhaVWthSFpsOWR4aWtjTnJLYmI1TE1JeEdYTlBEMkU3M1BHbi9Z?=
 =?utf-8?B?aGJua1VYV3d4bUIxMlAyWFVsSlZTNVdrejNOZHJwdDNRdHYvMG5ORmpYaFM3?=
 =?utf-8?B?YTZoUlc2VjJIaGlnRjlOb2VhcCtXYkF2WHhtdE1CUk5wTW44akxQeGYyL0tC?=
 =?utf-8?B?czRMTCt0Y3Y5TmowRzZ6dHkvTTZTeWtmYUJYV3NLRW5TckxGa3ZwNnlNWlBC?=
 =?utf-8?B?b1p3VkR1SWhqbkR4QmVJTm5KWndjclNOK0krU2dXQUR5RDJsWFdsZTZaUlls?=
 =?utf-8?B?S2FSam9xYWNkdXp3QnZrK3RQd1VEZDViKzc3Rnc0TmxqN24ya0FXYWUrbndD?=
 =?utf-8?B?cFkvVzZEZ3BRV24rbkZLYnhXbzdDWXBGNExBQU9oUXRIMGUvdHE2NjZqaHNW?=
 =?utf-8?B?a2dIZlIwa3RLUzFSd0hMTXFNMFgxVmk0ck9mSlpjK1VydXZLMHJwb0UrS3d6?=
 =?utf-8?B?ZTE0VzdsVkpNNUxsSVpKVERKa3g1WGhJZ1pVNXBUbUV1TFM2TEhCVUZOeDRm?=
 =?utf-8?B?b3o1U0w3cXpka0RMRkhSMnU0VEFPajlyQ1FHNUJsQWFWeDgrQ29MV2lycHhn?=
 =?utf-8?B?elhLT3pRRDJTYW5oSHVtQS9lUGJteG5ORER1ZkpZMjZrb2I4YUZ1M1VCR0tK?=
 =?utf-8?B?T2lqYnk2RTU1NWxPRW5qNC9OcGlBZ3NObzAwUyt4blp2Zjc0U1ByTWh3U1hO?=
 =?utf-8?B?NUE2R3EzdEl2KytPTFdUcmhoOWdZSU8yMHQzUWlqU1NmUnBBV2Z3Q01BQnNK?=
 =?utf-8?B?REZoWXhhT1NHVlpUSXcxeGJ1ZDFoR0w2b0FiaFVEZjNDaHBDMy81MHZ2QzB3?=
 =?utf-8?B?MndYdGhHanczYmQ1YUplNUpNODU2dmhCdlFUck9wY04vYi9CY00xeGI5ckM5?=
 =?utf-8?B?OWdwbS82SVl4aFBzUkZ6SUEwNVZuSElidkJYREVRTFlvWE93dEhFdHZOZlls?=
 =?utf-8?B?TVlrS3A1WnU1ajc4UDdMMHZZWm5VSC9xeTRkbUhHTXFEdVdLOW1EMzlRbjFp?=
 =?utf-8?B?WEI4NTlINUVkaWVoSlZ3TWpKUlRKWU9kS3VkY1JYMEhrVTd1UmIrSlFDaHFr?=
 =?utf-8?B?TUtLUVlwQ3J6TlZCdjNCWG4yQnc0SG5hcXhOUGpadWNkREp6MmN0QU45TjVH?=
 =?utf-8?B?cStmUVN4NG5rcEIxU24zN2g4T0Y1dGwyanlDdWpJQkJ0WWplWUZLSmRHeWdI?=
 =?utf-8?B?Q3NidnJ1dGF0Q1hBdWJiUVRWTFdwRjVSczFWUzBvOEFRY1dhMkRVZHZkSzJF?=
 =?utf-8?B?OFladFZmcWY3M2ZHZ201RjVoK29kTnN4K2ZldHBFZEZML25HM3JvVkgwUDZ0?=
 =?utf-8?B?Tmp0L3YvS01BeVl2bVhIYUZ5Ni9Nemk4TDhUODhVUG5hV3FZY2x0WitSWmlj?=
 =?utf-8?B?Zis0cGhXR0EvQ3FIY0YrVE1iNEdtb2YrSlNiMVBGSzJOdlFFaFlSTk1FdWFS?=
 =?utf-8?B?b0N4YVRYZ3BCNVlHYWpwRVpiV2hFSzhnU1k5ZnhFQzR6T3dIaEpQMC8vS0h2?=
 =?utf-8?B?bHRxSmwrT3RGSjlWanNEU05jbE04ZEw0cHlFR2k2YXMxcUFZSU5VRW1Oc0VG?=
 =?utf-8?B?aW1mbzN4K3l5NHhMQk41enpoSnJBNStRVEgzVmdEOFlMU0pzWnMzMldqeFNQ?=
 =?utf-8?B?STZsMEFHS2p0NDRNeFhKY1BUVFR1SldyeVVFVncyMXdKKzNxWmUzUVJpQmw1?=
 =?utf-8?B?LzkrZEZIYzA1SzViVlFtWXl1ZTM3ZWxrK2NJajdsNW5ITUpqTU1DN05DS3BQ?=
 =?utf-8?B?eFV5WjQ3MlliRElvM2xISi9hQWhIZzgzUkNyeTR3MjlMeUQvYnF4Q3pGM2Ry?=
 =?utf-8?B?MUM1OGdhTXVHSzVQbnJPUEpKR2FCNlNNaldnZEtLa0dkaUhCOWIvTkJzVjFB?=
 =?utf-8?B?N1pCSU9qMkNHL3JGTlhrVnRSUmFuTm5XQzJpbXZmSDI2dCtzbjQ3c0crdVUy?=
 =?utf-8?B?QlhnSEhUcEk1ZnluNzNNbGVoaGFUMzZSck5rbklPY280dUppVGkwN3VOcWY5?=
 =?utf-8?B?cUJWZjdLMVpIYXJ2eis0L0NSd0IxNDlmbGxWeURBdER0d1pkeWVRU0h0anpm?=
 =?utf-8?B?QTJoZktXRFJKWUJJbTY5WWxXVU1Wc00xbkVqeHFlRWR1NGpReURSVWFKTjZq?=
 =?utf-8?Q?vZdbStcVppm3YK+EM8IQiX79F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ce8ac2-18e8-4210-d7e3-08dc20e6c84d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 16:24:35.6226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: arSFrWUhJUwsNAEgTnCd+mP7kGLiUfyE1C/Co1F3gWs36K+ZOXsLIEPJ9MXazDgHpc26U5TwcWVZ9j4t8CDEgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8915
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


On 2024-01-29 10:33, Christian König wrote:
> Am 29.01.24 um 16:03 schrieb Felix Kuehling:
>> On 2024-01-25 13:32, Daniel Vetter wrote:
>>> On Wed, Jan 24, 2024 at 09:33:12AM +0100, Christian König wrote:
>>>> Am 23.01.24 um 20:37 schrieb Zeng, Oak:
>>>>> [SNIP]
>>>>> Yes most API are per device based.
>>>>>
>>>>> One exception I know is actually the kfd SVM API. If you look at 
>>>>> the svm_ioctl function, it is per-process based. Each kfd_process 
>>>>> represent a process across N gpu devices.
>>>> Yeah and that was a big mistake in my opinion. We should really not 
>>>> do that
>>>> ever again.
>>>>
>>>>> Need to say, kfd SVM represent a shared virtual address space 
>>>>> across CPU and all GPU devices on the system. This is by the 
>>>>> definition of SVM (shared virtual memory). This is very different 
>>>>> from our legacy gpu *device* driver which works for only one 
>>>>> device (i.e., if you want one device to access another device's 
>>>>> memory, you will have to use dma-buf export/import etc).
>>>> Exactly that thinking is what we have currently found as blocker for a
>>>> virtualization projects. Having SVM as device independent feature 
>>>> which
>>>> somehow ties to the process address space turned out to be an 
>>>> extremely bad
>>>> idea.
>>>>
>>>> The background is that this only works for some use cases but not 
>>>> all of
>>>> them.
>>>>
>>>> What's working much better is to just have a mirror functionality 
>>>> which says
>>>> that a range A..B of the process address space is mapped into a 
>>>> range C..D
>>>> of the GPU address space.
>>>>
>>>> Those ranges can then be used to implement the SVM feature required 
>>>> for
>>>> higher level APIs and not something you need at the UAPI or even 
>>>> inside the
>>>> low level kernel memory management.
>>>>
>>>> When you talk about migrating memory to a device you also do this 
>>>> on a per
>>>> device basis and *not* tied to the process address space. If you 
>>>> then get
>>>> crappy performance because userspace gave contradicting information 
>>>> where to
>>>> migrate memory then that's a bug in userspace and not something the 
>>>> kernel
>>>> should try to prevent somehow.
>>>>
>>>> [SNIP]
>>>>>> I think if you start using the same drm_gpuvm for multiple 
>>>>>> devices you
>>>>>> will sooner or later start to run into the same mess we have seen 
>>>>>> with
>>>>>> KFD, where we moved more and more functionality from the KFD to 
>>>>>> the DRM
>>>>>> render node because we found that a lot of the stuff simply 
>>>>>> doesn't work
>>>>>> correctly with a single object to maintain the state.
>>>>> As I understand it, KFD is designed to work across devices. A 
>>>>> single pseudo /dev/kfd device represent all hardware gpu devices. 
>>>>> That is why during kfd open, many pdd (process device data) is 
>>>>> created, each for one hardware device for this process.
>>>> Yes, I'm perfectly aware of that. And I can only repeat myself that 
>>>> I see
>>>> this design as a rather extreme failure. And I think it's one of 
>>>> the reasons
>>>> why NVidia is so dominant with Cuda.
>>>>
>>>> This whole approach KFD takes was designed with the idea of 
>>>> extending the
>>>> CPU process into the GPUs, but this idea only works for a few use 
>>>> cases and
>>>> is not something we should apply to drivers in general.
>>>>
>>>> A very good example are virtualization use cases where you end up 
>>>> with CPU
>>>> address != GPU address because the VAs are actually coming from the 
>>>> guest VM
>>>> and not the host process.
>>>>
>>>> SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This should 
>>>> not have
>>>> any influence on the design of the kernel UAPI.
>>>>
>>>> If you want to do something similar as KFD for Xe I think you need 
>>>> to get
>>>> explicit permission to do this from Dave and Daniel and maybe even 
>>>> Linus.
>>> I think the one and only one exception where an SVM uapi like in kfd 
>>> makes
>>> sense, is if the _hardware_ itself, not the software stack defined
>>> semantics that you've happened to build on top of that hw, enforces 
>>> a 1:1
>>> mapping with the cpu process address space.
>>>
>>> Which means your hardware is using PASID, IOMMU based translation, 
>>> PCI-ATS
>>> (address translation services) or whatever your hw calls it and has 
>>> _no_
>>> device-side pagetables on top. Which from what I've seen all devices 
>>> with
>>> device-memory have, simply because they need some place to store 
>>> whether
>>> that memory is currently in device memory or should be translated using
>>> PASID. Currently there's no gpu that works with PASID only, but 
>>> there are
>>> some on-cpu-die accelerator things that do work like that.
>>>
>>> Maybe in the future there will be some accelerators that are fully cpu
>>> cache coherent (including atomics) with something like CXL, and the
>>> on-device memory is managed as normal system memory with struct page as
>>> ZONE_DEVICE and accelerator va -> physical address translation is only
>>> done with PASID ... but for now I haven't seen that, definitely not in
>>> upstream drivers.
>>>
>>> And the moment you have some per-device pagetables or per-device memory
>>> management of some sort (like using gpuva mgr) then I'm 100% 
>>> agreeing with
>>> Christian that the kfd SVM model is too strict and not a great idea.
>>
>> That basically means, without ATS/PRI+PASID you cannot implement a 
>> unified memory programming model, where GPUs or accelerators access 
>> virtual addresses without pre-registering them with an SVM API call.
>>
>> Unified memory is a feature implemented by the KFD SVM API and used 
>> by ROCm. This is used e.g. to implement OpenMP USM (unified shared 
>> memory). It's implemented with recoverable GPU page faults. If the 
>> page fault interrupt handler cannot assume a shared virtual address 
>> space, then implementing this feature isn't possible.
>
> Why not? As far as I can see the OpenMP USM is just another funky way 
> of userptr handling.
>
> The difference is that in an userptr we assume that we always need to 
> request the whole block A..B from a mapping while for page fault based 
> handling it can be just any page in between A and B which is requested 
> and made available to the GPU address space.
>
> As far as I can see there is absolutely no need for any special SVM 
> handling.

It does assume a shared virtual address space between CPU and GPUs. 
There are no API calls to tell the driver that address A on the CPU maps 
to address B on the GPU1 and address C on GPU2. The KFD SVM API was 
designed to work with this programming model, by augmenting the shared 
virtual address mappings with virtual address range attributes that can 
modify the migration policy and indicate prefetching, prefaulting, etc. 
You could think of it as madvise on steroids.

Regards,
   Felix


>
> Regards,
> Christian.
>
>>
>> Regards,
>>   Felix
>>
>>
>>>
>>> Cheers, Sima
>
