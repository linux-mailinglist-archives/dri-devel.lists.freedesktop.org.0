Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74719840B65
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 17:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D3210E419;
	Mon, 29 Jan 2024 16:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4937410E190;
 Mon, 29 Jan 2024 16:28:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmmayslky+BnKkrEvH/K6a3uyRnrxPY/6YCsNQA51fdalZ7OTRvxxtBD+XCx8aEH0oLMTBOiF5efZXGC3Fvxf8d2VkILFitx9PTxP93MF/dBfnLCiPix7DtuVS0eYOX9HYLFWKEvYMqnZ/m4ME4i4+3Y47cPkXcG4zXObfXwJZqoQ0pwkWdNvHVSEPEs31TdzvRhVX7zB3AMU+Hxv9ZswuR577Oqn0hMYUOzlLN6b8FjjyI4kK2r5aOgN44EGVLDVCI8jfiJpZ9ZKmYcHPad3XyofTaw4HGYlpTW4rMkskH4/tgjfdimwnrlJfle0Cbd6PhH4IOacDeriiZKDINwvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ta2verHlT4YJhVYuTUKOkc3ubYT5CM+gCG9cPa9gNk=;
 b=EdNPGVf8fsy9FokE0AYO4oiJTfsAk5GoM4kgLzSelP8+sa6n+KBIjsEGJqBKwQzPAuuZ9U9Dsw5F4RTf+pGI2/STcnDp8eVKwr3+zsI/rrvqOG//+UZLRlG7ooFsVAMap+T5vLNkZYDEkTUvUIAJZJ459kf2rcN+Dl/tj9ET6oL/xLAwq2WmRbRQ/SZge6dJaQJonet90cPdq983JsybfyqsqQT6fSKs1K7JzCjTRi4G0fsVyJ99dw40x32hyJDRb+LqPyg115Norg4SCLZnCfrMJ+oAgZSunA6f2i7UA0qpqA7lJmTiwDD1xJD6VqQl2q1HK1Gf7NwtLhYecijpMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ta2verHlT4YJhVYuTUKOkc3ubYT5CM+gCG9cPa9gNk=;
 b=P7Q4JATHsnnpDlR2XVofu/W/cm/F2Oj4DF5X9SyS3+RZegBfRzfY15SYLNT/7Z4mvjM79E0/gbqdMDeMtGY3R1c8Naj75JljhuO/EUSLryt055dNCSd2lccG9wJ2/dyRtOseZm+fZWI78NHE7iw49/YB8vknBxPs5v0Sryeo8nY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB7789.namprd12.prod.outlook.com (2603:10b6:510:283::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 16:28:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 16:28:44 +0000
Message-ID: <2444da7e-be62-4538-b42e-b234c763f3bd@amd.com>
Date: Mon, 29 Jan 2024 17:28:38 +0100
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
 <7db48b59-f4cc-4b32-88c8-6461a7470b63@amd.com>
 <3e795468-1779-4100-a706-85be323e69f2@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3e795468-1779-4100-a706-85be323e69f2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ce486aa-544e-4da4-013d-08dc20e75c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P+GHJOnZeSRNslq/qP9UaW0Rx8x0bR/vkZc7OfQLODEIdkrU2ngn56IP5ZvNnkQ//bp8jstX4jIiTXjfvo6DSYSh9LGuqh4+daHPwa9oivKmrimXB1aTY4+q1f8NnIvgSWXABvxVBHkEsclmFQd51Qfimz5B+fc6CIHZX3jrWMPNy3fLQALMFlGpOA7v/15Gnl1Fy/bQ7tyhxgrgy3D4Tnzjo6f0xR+B8DH3vsgPCypltYU8Rr7fsUtHBKyE2w9I1ed7P5hMi124rRpMyUuiXYAy3SD0TJXKX+q3pD1Ed/iEIbpPNcSEW2V4X89XzOOwd6F1QaaomzB5uVixMzK+o5iHSSngFIVHcHMv7bm3W27oG4bXdK4JsaiAw2YC9QriCNFzzlXPEfK8j5w96+NGPy15io7ul7GVbLeXlb+H+7Qwy3WlCoSStS1iz4svhZsb9ZIZxzSnUdofmgqI7FGJiPIqriMVfE9envrTuyzhkMC9W94jX7SLTYmZ8yaf1vvp2E3JM070QyVS5T9O1ugnd6IJsoVZ6lj6juIMAkMU2nyjRZ2f9DP8vaenwE9rP4g2nAxZHQ/7fjeR62Hoi34zqzSuftjZ+iphT63F5S0iGH50OE78Rk9HuWyp61FCdLGx5peYo0tKHxzrqoIPcril3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(366004)(136003)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(31686004)(38100700002)(2906002)(36756003)(41300700001)(83380400001)(66574015)(2616005)(6666004)(26005)(6512007)(53546011)(6506007)(478600001)(54906003)(316002)(110136005)(6486002)(66556008)(66476007)(66946007)(8936002)(8676002)(4326008)(31696002)(86362001)(5660300002)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlE5dXp3R0ZQYlk1bUI3WnB3b1FEdVROdTkrSGU4ZTZqdTBRSGFuZEJtWndz?=
 =?utf-8?B?ekRJcFMvcy80RG1Yb011RnRDeEN5dnU4WE1QYnZ3YTZrZHd1VG9KMHZMdVZy?=
 =?utf-8?B?elg4M1ZxZkF3THhWSGdLZFhIZWFFYlFwSmVTZk1uZm5wQktEMFQyS2Q2bTRE?=
 =?utf-8?B?THptQWEySndpTzc3aXoyODdxbzlDdWNWdXF4elE0RkE1eWJhYlNVeEVQQXhJ?=
 =?utf-8?B?bTZubVJtSmh5RGVjaFRhWmhvM2lOaHpsay9UcysxSXJQT0xXSUN1b3lNeUtw?=
 =?utf-8?B?bXhxbmhDMUVBVzUvK1F0WlpZV1pxbzFWcS95ZmJPdFpFeW4xUmNDM2NjNkYy?=
 =?utf-8?B?czZFV2VhbnU5cERxSTA0THBUNXlmbWU3YTJ5WTBjUW0zaW43K1dHbDgvMFBk?=
 =?utf-8?B?TEtETjJIdFhWY1dWVFhGRDRqQ2I5U21OTDBlR2owbWVJRUp5V2VZQmxvc3dT?=
 =?utf-8?B?ckE2NVd0bTNhQlFMTzc4ZTd3YW42Z28rWlZXdzlsYUVQaEJRREdMRXFwaG9i?=
 =?utf-8?B?SWdJQ3pydnNERW42MjM5d1diYUJEVjlEdkFGaHRtNjJXQzF5WmhDMmtydXZt?=
 =?utf-8?B?VWJTbDhzMDYxcXNnNWYwMDZmUnFKK0RPMkxuakZyUDgvOE1QdGNXejg5MXkv?=
 =?utf-8?B?VXNBcE9UMjdSanFvUmVPVCs2c01SZlR6WmwrZ0hibit5amxtcWJGYlhOTDcx?=
 =?utf-8?B?K2NQUml1NC9rWEF3eTUvMFFXbi96WmlhN0xlTmE1NlhVOVRtbWxWblBUTEFx?=
 =?utf-8?B?MXdHOTdLanM2U0JobU5IZE9NWTJNNkd5aU9sSng1RFE2aGlqYjh4MWtCd3cw?=
 =?utf-8?B?ZGFOWWZ3c0c4ZWFNVmhJMGc3UmlWR0QzRWpJaXR3SjlUQnNOR1RyREhmZXEz?=
 =?utf-8?B?Qy9jM2podHdDWnp6RStQdmUycldTbVUxbXcvOVBTNlgzNWw5YWlvaUNmajBn?=
 =?utf-8?B?K0ZyMU5JVFQrdUMxZkRjVnlIMkE5UkpJNERyTGtHb09BUHJxRVFNYW1JYVpp?=
 =?utf-8?B?NXZCNzdhR1pYaXJvZmVxZnF2eDR5ZkFGUkRHU2RnbWt0RjRKd1owaWFMb2w4?=
 =?utf-8?B?QlR5bHg2bHppVFlOWW92TmIvL2ZSQ0VQdVdyK0ZiWFBYaFZzUzYvdmZDYUhU?=
 =?utf-8?B?U2xWSnVLOHhSWXZtUm00cDB0WkI2TW9NdXF0a0dkVERQQTRuRFViODBLaEto?=
 =?utf-8?B?WG8yZmZGTU5kQ3lQNWZ0SEF5ZzlYY0pkbkdTRXp0WFpLMVd3V3lrTWl4TTVk?=
 =?utf-8?B?dGkrUlJzRVBtaThtOXM3aUVWdFFiTzNxQzBydTRJdWVZd1RTY2cvc2M3b0Vz?=
 =?utf-8?B?S3N1Sk5QOU1MVVV6Tmx5SnRadVhhc3BPNFUxOXV3SEt2aUg3V2JqdFlodXRl?=
 =?utf-8?B?SnpXOHgzcWFnd0tZMm0rQThqZHJHQnlncGFoNlhnc0orSEJweEpWZHdUY2F6?=
 =?utf-8?B?Q2w0UHJBc1liaFFrZ0ZZOUxZaE1nSThLUnQ1M1h1bk16SWhqVlg1dkllbndV?=
 =?utf-8?B?eDl5cFhFNUwyV1pZN1NEUFBzeUlxYWFYMGtBZzRFM2tlQktERGZhZjJCZDQ3?=
 =?utf-8?B?L0VRRk5xVkF1M3l4RWFuUTluR2NCU0N1S29MemFPVTcxK0F2K3RyUEtNVm80?=
 =?utf-8?B?M1hOVnZuYjJDTGwzRGZDMmlsNDhCL0ZwcXhsRmFWSC9ienZjYWlkRzQrcHhY?=
 =?utf-8?B?amtSR00vY0RRSTlRRnJuRFhDMjJhaThjM2Y1cmZOcktiNDQyNDg0QnkzVWkx?=
 =?utf-8?B?R2tGeEhPQ1haTkl1TmRkbTJNb1BjbWlBaEowWjB2UURxZnRXVFAzcTZpbENi?=
 =?utf-8?B?UGJ3VjVSSFVoM3hOM0x1ZFlOeUlEVDdYMjBCQkpqM2FRTDVZUEsrSGpuUHp0?=
 =?utf-8?B?dllJWXd4NjdHUlJBUHVZMGZUUDJJM2JQUXdVLzNEZ2crYkgxZUpUSjV1bEYx?=
 =?utf-8?B?WmtjSHkxaTZ1Nkt3MUpRcjRLdHI3ekNoMU1XS3h3aW5hS1FnZHA2SzYrcSt1?=
 =?utf-8?B?cTMySUpGTFFYSm0yenNLK0FnY1hZaUFla2RFN3hrRUFqblBBcUlWS3RjSjhI?=
 =?utf-8?B?eUJscTBSbXVRRmx1aFN2OThZd1FrZ1dHZFBsaVVCaWFuZk9FQVk4a3hWbTZW?=
 =?utf-8?Q?Dwu29no6poIqi1ylZo/8UTdss?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ce486aa-544e-4da4-013d-08dc20e75c88
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 16:28:44.4368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGwCc2VYSbyy/fHYSxxmaTMxtSQdfbs5uXb+HN61xL1FenUO7Yjjs1BwIGwZnzlT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7789
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

Am 29.01.24 um 17:24 schrieb Felix Kuehling:
> On 2024-01-29 10:33, Christian König wrote:
>> Am 29.01.24 um 16:03 schrieb Felix Kuehling:
>>> On 2024-01-25 13:32, Daniel Vetter wrote:
>>>> On Wed, Jan 24, 2024 at 09:33:12AM +0100, Christian König wrote:
>>>>> Am 23.01.24 um 20:37 schrieb Zeng, Oak:
>>>>>> [SNIP]
>>>>>> Yes most API are per device based.
>>>>>>
>>>>>> One exception I know is actually the kfd SVM API. If you look at 
>>>>>> the svm_ioctl function, it is per-process based. Each kfd_process 
>>>>>> represent a process across N gpu devices.
>>>>> Yeah and that was a big mistake in my opinion. We should really 
>>>>> not do that
>>>>> ever again.
>>>>>
>>>>>> Need to say, kfd SVM represent a shared virtual address space 
>>>>>> across CPU and all GPU devices on the system. This is by the 
>>>>>> definition of SVM (shared virtual memory). This is very different 
>>>>>> from our legacy gpu *device* driver which works for only one 
>>>>>> device (i.e., if you want one device to access another device's 
>>>>>> memory, you will have to use dma-buf export/import etc).
>>>>> Exactly that thinking is what we have currently found as blocker 
>>>>> for a
>>>>> virtualization projects. Having SVM as device independent feature 
>>>>> which
>>>>> somehow ties to the process address space turned out to be an 
>>>>> extremely bad
>>>>> idea.
>>>>>
>>>>> The background is that this only works for some use cases but not 
>>>>> all of
>>>>> them.
>>>>>
>>>>> What's working much better is to just have a mirror functionality 
>>>>> which says
>>>>> that a range A..B of the process address space is mapped into a 
>>>>> range C..D
>>>>> of the GPU address space.
>>>>>
>>>>> Those ranges can then be used to implement the SVM feature 
>>>>> required for
>>>>> higher level APIs and not something you need at the UAPI or even 
>>>>> inside the
>>>>> low level kernel memory management.
>>>>>
>>>>> When you talk about migrating memory to a device you also do this 
>>>>> on a per
>>>>> device basis and *not* tied to the process address space. If you 
>>>>> then get
>>>>> crappy performance because userspace gave contradicting 
>>>>> information where to
>>>>> migrate memory then that's a bug in userspace and not something 
>>>>> the kernel
>>>>> should try to prevent somehow.
>>>>>
>>>>> [SNIP]
>>>>>>> I think if you start using the same drm_gpuvm for multiple 
>>>>>>> devices you
>>>>>>> will sooner or later start to run into the same mess we have 
>>>>>>> seen with
>>>>>>> KFD, where we moved more and more functionality from the KFD to 
>>>>>>> the DRM
>>>>>>> render node because we found that a lot of the stuff simply 
>>>>>>> doesn't work
>>>>>>> correctly with a single object to maintain the state.
>>>>>> As I understand it, KFD is designed to work across devices. A 
>>>>>> single pseudo /dev/kfd device represent all hardware gpu devices. 
>>>>>> That is why during kfd open, many pdd (process device data) is 
>>>>>> created, each for one hardware device for this process.
>>>>> Yes, I'm perfectly aware of that. And I can only repeat myself 
>>>>> that I see
>>>>> this design as a rather extreme failure. And I think it's one of 
>>>>> the reasons
>>>>> why NVidia is so dominant with Cuda.
>>>>>
>>>>> This whole approach KFD takes was designed with the idea of 
>>>>> extending the
>>>>> CPU process into the GPUs, but this idea only works for a few use 
>>>>> cases and
>>>>> is not something we should apply to drivers in general.
>>>>>
>>>>> A very good example are virtualization use cases where you end up 
>>>>> with CPU
>>>>> address != GPU address because the VAs are actually coming from 
>>>>> the guest VM
>>>>> and not the host process.
>>>>>
>>>>> SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This 
>>>>> should not have
>>>>> any influence on the design of the kernel UAPI.
>>>>>
>>>>> If you want to do something similar as KFD for Xe I think you need 
>>>>> to get
>>>>> explicit permission to do this from Dave and Daniel and maybe even 
>>>>> Linus.
>>>> I think the one and only one exception where an SVM uapi like in 
>>>> kfd makes
>>>> sense, is if the _hardware_ itself, not the software stack defined
>>>> semantics that you've happened to build on top of that hw, enforces 
>>>> a 1:1
>>>> mapping with the cpu process address space.
>>>>
>>>> Which means your hardware is using PASID, IOMMU based translation, 
>>>> PCI-ATS
>>>> (address translation services) or whatever your hw calls it and has 
>>>> _no_
>>>> device-side pagetables on top. Which from what I've seen all 
>>>> devices with
>>>> device-memory have, simply because they need some place to store 
>>>> whether
>>>> that memory is currently in device memory or should be translated 
>>>> using
>>>> PASID. Currently there's no gpu that works with PASID only, but 
>>>> there are
>>>> some on-cpu-die accelerator things that do work like that.
>>>>
>>>> Maybe in the future there will be some accelerators that are fully cpu
>>>> cache coherent (including atomics) with something like CXL, and the
>>>> on-device memory is managed as normal system memory with struct 
>>>> page as
>>>> ZONE_DEVICE and accelerator va -> physical address translation is only
>>>> done with PASID ... but for now I haven't seen that, definitely not in
>>>> upstream drivers.
>>>>
>>>> And the moment you have some per-device pagetables or per-device 
>>>> memory
>>>> management of some sort (like using gpuva mgr) then I'm 100% 
>>>> agreeing with
>>>> Christian that the kfd SVM model is too strict and not a great idea.
>>>
>>> That basically means, without ATS/PRI+PASID you cannot implement a 
>>> unified memory programming model, where GPUs or accelerators access 
>>> virtual addresses without pre-registering them with an SVM API call.
>>>
>>> Unified memory is a feature implemented by the KFD SVM API and used 
>>> by ROCm. This is used e.g. to implement OpenMP USM (unified shared 
>>> memory). It's implemented with recoverable GPU page faults. If the 
>>> page fault interrupt handler cannot assume a shared virtual address 
>>> space, then implementing this feature isn't possible.
>>
>> Why not? As far as I can see the OpenMP USM is just another funky way 
>> of userptr handling.
>>
>> The difference is that in an userptr we assume that we always need to 
>> request the whole block A..B from a mapping while for page fault 
>> based handling it can be just any page in between A and B which is 
>> requested and made available to the GPU address space.
>>
>> As far as I can see there is absolutely no need for any special SVM 
>> handling.
>
> It does assume a shared virtual address space between CPU and GPUs. 
> There are no API calls to tell the driver that address A on the CPU 
> maps to address B on the GPU1 and address C on GPU2. The KFD SVM API 
> was designed to work with this programming model, by augmenting the 
> shared virtual address mappings with virtual address range attributes 
> that can modify the migration policy and indicate prefetching, 
> prefaulting, etc. You could think of it as madvise on steroids.

Yeah, so what? In this case you just say through an IOCTL that CPU range 
A..B should map to GPU range C..D and for A/B and C/D you use the 
maximum of the address space.

There is no restriction that this needs to be accurate in way. It's just 
the it can be accurate to be more efficient and eventually use only a 
fraction of the address space instead of all of it for some use cases.

So this isn't a blocker, it's just one special use case.

Regards,
Christian.

>
> Regards,
>   Felix
>
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>>   Felix
>>>
>>>
>>>>
>>>> Cheers, Sima
>>

