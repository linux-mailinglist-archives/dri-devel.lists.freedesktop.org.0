Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDBA839A21
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 21:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F264E10E8E7;
	Tue, 23 Jan 2024 20:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B2210E8E0;
 Tue, 23 Jan 2024 20:17:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AF3XLACg5+ayQQK9JBFJH6uMfk2xcXciKzUVwGLyu+lo6j5sMMTL3Folju/84j02knYjcOZxQZhQNb7YrNDgsEwA4E8olOWoeZdTeRONEKmUseDvM3CuaNtdO4LaHcT8WpAu6fa2S4PgrGGeD5X/kIBO1ZPT09x6fA0OvwwYlEnvR5gMkcsD/oFTb3bq9ZDnj8/PWdno4Fz2Zmj0xSOs1O1CJPbBCfdABqcBv8/drQn+pmQ2NqplV3KEgKnszndrBKlZaCs82cQeYuuE503eNi/anSi4AuuJEDeo7P8wV0zWS+MQLnjuNpLV3p5XeP2LErlys1MgkTgYMPpanhMGag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1/i4QLOu27cWMAQSDZjZXONm7Md/CatM2HPY2pDShg=;
 b=nThBdpnVKLg+82Ut++/2ZPCRnJpt5D9Nmd6JyRDNz2fCtTVLaPh/XvdFS9ovlDvDXRq4xwk25/lTuiMn/1/ZENH7ZSswhTPF93Ppp97Ut9jc/MipGUdvAW8JgfpPyANGaeendP/WY/esYtuxnBJFy4VHmEnHYOW1934Ea2f7DZcKFfPSSMb6NcZ67OKzsEVWhDV28IUxO3QAut30qppuWowTx+3pKkeYV+DhZJryiZ7VgFs5cW+ZXezxLYIvwycA+e3s1ghkT0aZ11hVwuLgcfle/JRi3ILYuuibOePVS8L6VH2ZkGeRLq0N+mrdyfD3EsQqZseu5yzjj8b0fLy56w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1/i4QLOu27cWMAQSDZjZXONm7Md/CatM2HPY2pDShg=;
 b=HHGDQSH7Qqb2TvNudVUTuJGz6qqyCtAOX/+/SdN8erOmEW0opL+p4l4knXWpCQmW9qSYytpsnxh/n4mYo5IZelSKI9hNAF9kw7Tf/IRr+Pj43RjcmVZdRxrr9UOolw8f4GREI2A63B4mcAiRBMKBI/OzcfF2GS0HQh1kPbFhO1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SA3PR12MB9091.namprd12.prod.outlook.com (2603:10b6:806:395::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Tue, 23 Jan
 2024 20:17:09 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::6f2f:7892:e9fe:c62b]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::6f2f:7892:e9fe:c62b%4]) with mapi id 15.20.7202.034; Tue, 23 Jan 2024
 20:17:08 +0000
Message-ID: <3f26a14a-e20b-4eba-b387-645fd1428fde@amd.com>
Date: Tue, 23 Jan 2024 15:17:05 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0466.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::8) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SA3PR12MB9091:EE_
X-MS-Office365-Filtering-Correlation-Id: 9064f0b5-26ef-4dc8-6634-08dc1c504669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xl9DHKTojQUYXobdSuNtYn9o8dBL2RyhFTX8Izrie2vaYrgD6OVIKdM/0jxzr6HHAbRE2j+dAL80tK96vItGdFva8rXnK4E+dexQmDvxFvV3/22+yjA0h0t3h2/R8sGV9VS/73/SXojHdl2ofL8MX+cBkuCqqVkOQS9HuKn7hgQBfoDwJHwN3HsDYAR55i6tnce3CMNCC0bx14RTV54WNErn0BPjNz7IU2qkzVVRd9JAg1CeUCsmrYtHbjevOIq23ZW8p6RXTgbGmZhGUFeEZFxyiGpz3iEZb1BlL7/Kw59aiyOY9figEqRnP+5WNDaHQKbFdl5rSAOKfjpg5dVqgI6/IlfmT6ZL5Njc4l//7OCpdchbE6vKxmEWlD5Ok9AMizACHrphpZAxHAUYSK67Rtejsbo1nqbT9DGMzTSggBuMpoU8O/GVQcEYl+geItK+rRWy6DitxNKIq3R36ZK1pZnBHmvyHdZCSYAJRHp4SATCeWhs/B/5Stf8gvPw3b67iDlhT2nEQU0jkIZBQ0RLKZJRIajewwwpSIQxItrxXlgToUdJ+Snpc1lJtVf5omXO3qaxtajpbxHmhTlzo6JKHn+u92uZsO6++rhmGBmGDKjRZzLs5ZppaHofULk4Mo1Axu3peU4Titn1k7aYcKer+6HVmIWmbJFk4qrIMcmPy9nEEe4CUQ8C26oRVTDsU3sP8gjuqrmrgSjArLzZUPL3SnQieowHLSnIjNVSZTl7Df8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(376002)(346002)(366004)(230173577357003)(230273577357003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(44832011)(83380400001)(4326008)(8936002)(8676002)(66899024)(7416002)(31696002)(86362001)(38100700002)(41300700001)(2906002)(30864003)(36756003)(5660300002)(66556008)(66946007)(66476007)(110136005)(54906003)(2616005)(316002)(31686004)(53546011)(6512007)(6506007)(6666004)(478600001)(966005)(6486002)(66574015)(45080400002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REpCOWlNTGtFTHFaVDlqekNBeitqem91MUttcGJUVElkYU1CMytmeVp6YU02?=
 =?utf-8?B?OXphd3hvdkp1eGozL3JLblRTMDhtUGh0Qyt3MFp4MnBnWWhCdmZBNUZzNWsx?=
 =?utf-8?B?dG1Ody9saWx6Yjc4c29CU0RuOFlCbnVsaS8rbW1NZWdMeENLU1o5TUxkRkRa?=
 =?utf-8?B?MVZCNk5lOW4wVVo5TkhPeWRFRFdzNEdHU2d0eFdqM3dONVJYUTNzQ0MwMmVi?=
 =?utf-8?B?Qmp1d2x5L1BPQ0VVMEcyRjlBdzFVUytPUkR6U0RLTGdpdlh6QnM1SEhQK0Va?=
 =?utf-8?B?UXg2T09oUFY2ZzV4V2QyTnpIMEZxYkxuV1VWRDNFVXpZUThXUFBUakw5cHNy?=
 =?utf-8?B?TjEzL2RCcG1kOWVUOWYzWlllRTVjTmZvcHlMODVKUXpHMG5OODdsYWRMakJG?=
 =?utf-8?B?MGlSRFBMdEdxV3p2MFgyV3NVMCtDSEpIcER5elNrTkdEUlRLdUk1enVxUHZq?=
 =?utf-8?B?eVROV1V6NTFxNmtURmFUTW55UHFjOFlHV2FKdTBmWEdPa3p2cm00V2pLMDc3?=
 =?utf-8?B?SndOY2E1TGtZVHV1em1GUXBJbC9BZXZicjV6MWV4TlY3RENrMG1YWThPWmpk?=
 =?utf-8?B?bU9wRHBKaUplS2pTdDlISUNtZ1p1SmF1NERUbmZzeVBkNVpYNFR4T3RrSGRo?=
 =?utf-8?B?VTROUllHdFZXcDg1UFJHeXdZWUY1TXp3MDdKaUI3SFlNdVVFakZxQ1VvcjJ2?=
 =?utf-8?B?b2FNOXNsQ0doZ1laSk1qekk0OVoyb2hIY1QzUVdCYVRLaXNESmxlaGNOVzM3?=
 =?utf-8?B?MEVwOG5Zay9sd0NoUkppT0hFSko2T0VCMUlIdVo5T281YTVEeEFmaFBTSUxE?=
 =?utf-8?B?bHl6ZXBvbEdTQ1hpYmNOMGhzNmZ6MjgvNVFtbU5NNHUwOVdGTmpkQUt3Z2Vz?=
 =?utf-8?B?Uk9icmE4ZFZCTVBVUXIvMHRLMW44M1FDaDlFWUFKRmhGb1J3czdid29uRFlV?=
 =?utf-8?B?NkZyUUt6Smlaa0tjSU92WmxWMlRkRHc2Z2pacnZZOWE5N2RlZ0F1ZXVoK2VO?=
 =?utf-8?B?UmhWSVpzVW8vTVlCYWYrZnBTbDkxRkJyWWl4UWNVbWxYKzE0Mm8zbGlicUJD?=
 =?utf-8?B?YnFLQ1kyaWNNV1RSSVg2b0h3cWV5UWFuQzU3OUtnMzVkYlhLeUE1eTY4eG1w?=
 =?utf-8?B?M0JFSEVVeTJUVEIwSHppbk9Nd3ZTQnROSXVLek5DWVpPT1VSTVFuUGdBTkVk?=
 =?utf-8?B?bTI5OXBSRUdDdEJMaXRjanVBOHVWaUsvSUgyOGZXZld0Yk9zN24zRTkyTEor?=
 =?utf-8?B?Y3FiLzlodi91LzZCY2orc1VvUjhLaDJCUGgxU0hhd2U3M1Q3a0NZSzRiMnhX?=
 =?utf-8?B?aytJaCtYWXMvTkwrTDMveTZDekh3MngzZVFJRnA4ZkRHNytrSmVRZVh3V2xC?=
 =?utf-8?B?T1JHanFTUDFYaFZoNHdYZUVUR3c2WmpZRGZObWJRdE9seUlzVk13ZFVycldu?=
 =?utf-8?B?S0xqbUphNFpqT2dtZHg4RmlOM1JkalVRNFh2Y3ROcFh1SXpOSC9BTVpFV3p2?=
 =?utf-8?B?cmd1dG9CMXJRbDVqRkFrRG9jckl5RWVRREFGRVJ6eEMxc09wMWR4ZEdhVGJv?=
 =?utf-8?B?UnpBTDJTWTNWcHgzLy9JMGo1OUZDVCsrMEJIb2lvalNQOHdsMjJEbDlUV1Qx?=
 =?utf-8?B?VldHdFMzV0xxV0hBNCtMMWFUWEEvQjBXb3gyeHdRYWlGaHBzQ1l1NjNITTRZ?=
 =?utf-8?B?aExmRkdoYjdoc1RoK3RGREtjZlFNYWNqTEdNK292eHRmNlhMb1d0OXBvbnB2?=
 =?utf-8?B?OURGM1BVLzBCMGxBbHA2WVNOOW9jSUtzOEd6dGorYXBEWi8xeG1obkFYYTdC?=
 =?utf-8?B?OThSZ0FCQk1Uc3FBQWxTUWpyb1hMcDhaWlN5Ym41NU9uNDNxditjUUwrTk00?=
 =?utf-8?B?Z1NkREVhQUY3c2k5NmlGZUw0Rm12Q0VGbHZYa3loU3hmOEVjY0ZKSjVienJ3?=
 =?utf-8?B?TnhYa2pTdHk5U3RncHJicitVRnE0RVI3bXkwb2ZWc0ovc2NITU5NRGE0MlVJ?=
 =?utf-8?B?dDdoTlF0cjluKzVhNjRrelB1MGhTTThNUGRwcDZLd2dQRmlsaHhMVnd4RUtP?=
 =?utf-8?B?Q1Q2cGtyZy9YUi94WHJXRXpFY2VRa0Eya29JTjFFN0pKc3J3SVZFREdQMS9o?=
 =?utf-8?Q?Pf0cf/P/H/rRCugt0oOxdcGwI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9064f0b5-26ef-4dc8-6634-08dc1c504669
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 20:17:08.5635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++O07ZO0LRa81j+xfTh97PRJL0ADddVpTTDXmNFLvf9lDA66SW5FtZRgRw6v1rCjzCwBT8KlyYHvkLMUYzK8gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9091
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
 Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024-01-23 14:37, Zeng, Oak wrote:
> Thanks Christian. I have some comment inline below.
>
> Danilo, can you also take a look and give your feedback? Thanks.

Sorry, just catching up with this thread now. I'm also not familiar with 
drm_gpuvm.

Some general observations based on my experience with KFD, amdgpu and 
SVM. With SVM we have a single virtual address space managed in user 
mode (basically using mmap) with attributes per virtual address range 
maintained in the kernel mode driver. Different devices get their 
mappings of pieces of that address space using the same virtual 
addresses. We also support migration to different DEVICE_PRIVATE memory 
spaces.

However, we still have page tables managed per device. Each device can 
have different page table formats and layout (e.g. different GPU 
generations in the same system) and the same memory may be mapped with 
different flags on different devices in order to get the right coherence 
behaviour. We also need to maintain per-device DMA mappings somewhere. 
That means, as far as the device page tables are concerned, we still 
have separate address spaces. SVM only adds a layer on top, which 
coordinates these separate device virtual address spaces so that some 
parts of them provide the appearance of a shared virtual address space.

At some point you need to decide, where you draw the boundary between 
managing a per-process shared virtual address space and managing 
per-device virtual address spaces. In amdgpu that boundary is currently 
where kfd_svm code calls amdgpu_vm code to manage the per-device page 
tables.

In the amdgpu driver, we still have the traditional memory management 
APIs in the render nodes that don't do SVM. They share the device 
virtual address spaces with SVM. We have to be careful that we don't try 
to manage the same device virtual address ranges with these two 
different memory managers. In practice, we let the non-SVM APIs use the 
upper half of the canonical address space, while the lower half can be 
used almost entirely for SVM.

Regards,
   Felix


>
>> -----Original Message-----
>> From: Christian König <christian.koenig@amd.com>
>> Sent: Tuesday, January 23, 2024 6:13 AM
>> To: Zeng, Oak <oak.zeng@intel.com>; Danilo Krummrich <dakr@redhat.com>;
>> Dave Airlie <airlied@redhat.com>; Daniel Vetter <daniel@ffwll.ch>
>> Cc: Welty, Brian <brian.welty@intel.com>; dri-devel@lists.freedesktop.org; intel-
>> xe@lists.freedesktop.org; Bommu, Krishnaiah <krishnaiah.bommu@intel.com>;
>> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>;
>> Thomas.Hellstrom@linux.intel.com; Vishwanathapura, Niranjana
>> <niranjana.vishwanathapura@intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>
>> Subject: Re: Making drm_gpuvm work across gpu devices
>>
>> Hi Oak,
>>
>> Am 23.01.24 um 04:21 schrieb Zeng, Oak:
>>> Hi Danilo and all,
>>>
>>> During the work of Intel's SVM code, we came up the idea of making
>> drm_gpuvm to work across multiple gpu devices. See some discussion here:
>> https://lore.kernel.org/dri-
>> devel/PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd
>> 11.prod.outlook.com/
>>> The reason we try to do this is, for a SVM (shared virtual memory across cpu
>> program and all gpu program on all gpu devices) process, the address space has
>> to be across all gpu devices. So if we make drm_gpuvm to work across devices,
>> then our SVM code can leverage drm_gpuvm as well.
>>> At a first look, it seems feasible because drm_gpuvm doesn't really use the
>> drm_device *drm pointer a lot. This param is used only for printing/warning. So I
>> think maybe we can delete this drm field from drm_gpuvm.
>>> This way, on a multiple gpu device system, for one process, we can have only
>> one drm_gpuvm instance, instead of multiple drm_gpuvm instances (one for
>> each gpu device).
>>> What do you think?
>> Well from the GPUVM side I don't think it would make much difference if
>> we have the drm device or not.
>>
>> But the experience we had with the KFD I think I should mention that we
>> should absolutely *not* deal with multiple devices at the same time in
>> the UAPI or VM objects inside the driver.
>>
>> The background is that all the APIs inside the Linux kernel are build
>> around the idea that they work with only one device at a time. This
>> accounts for both low level APIs like the DMA API as well as pretty high
>> level things like for example file system address space etc...
> Yes most API are per device based.
>
> One exception I know is actually the kfd SVM API. If you look at the svm_ioctl function, it is per-process based. Each kfd_process represent a process across N gpu devices. Cc Felix.
>
> Need to say, kfd SVM represent a shared virtual address space across CPU and all GPU devices on the system. This is by the definition of SVM (shared virtual memory). This is very different from our legacy gpu *device* driver which works for only one device (i.e., if you want one device to access another device's memory, you will have to use dma-buf export/import etc).
>
> We have the same design requirement of SVM. For anyone who want to implement the SVM concept, this is a hard requirement. Since now drm has the drm_gpuvm concept which strictly speaking is designed for one device, I want to see whether we can extend drm_gpuvm to make it work for both single device (as used in xe) and multipe devices (will be used in the SVM code). That is why I brought up this topic.
>
>> So when you have multiple GPUs you either have an inseparable cluster of
>> them which case you would also only have one drm_device. Or you have
>> separated drm_device which also results in separate drm render nodes and
>> separate virtual address spaces and also eventually separate IOMMU
>> domains which gives you separate dma_addresses for the same page and so
>> separate GPUVM page tables....
> I am thinking we can still make each device has its separate drm_device/render node/iommu domains/gpu page table. Just as what we have today. I am not plan to change this picture.
>
> But the virtual address space will support two modes of operation:
> 1. one drm_gpuvm per device. This is when svm is not in the picture
> 2. all devices in the process share one single drm_gpuvm, when svm is in the picture. In xe driver design, we have to support a mixture use of legacy mode (such as gem_create and vm_bind) and svm (such as malloc'ed memory for gpu submission). So whenever SVM is in the picture, we want one single process address space across all devices. Drm_gpuvm doesn't need to be aware of those two operation modes. It is driver's responsibility to use different mode.
>
> For example, in mode #1, a driver's vm structure (such as xe_vm) can inherit from drm_gpuvm. In mode #2, a driver's svm structure (xe_svm in this series: https://lore.kernel.org/dri-devel/20240117221223.18540-1-oak.zeng@intel.com/) can inherit from drm_gpuvm while each xe_vm (still a per-device based struct) will just have a pointer to the drm_gpuvm structure. This way when svm is in play, we build a 1 process:1 mm_struct:1 xe_svm:N xe_vm correlations which means shared address space across gpu devices.
>
> This requires some changes of drm_gpuvm design:
> 1. The drm_device *drm pointer, in mode #2 operation, this can be NULL, means this drm_gpuvm is not for specific gpu device
> 2. The common dma_resv object: drm_gem_object *r_obj. *Does one dma_resv object allocated/initialized for one device work for all devices*? From first look, dma_resv is just some CPU structure maintaining dma-fences. So I guess it should work for all devices? I definitely need you to comment.
>
>
>> It's up to you how to implement it, but I think it's pretty clear that
>> you need separate drm_gpuvm objects to manage those.
> As explained above, I am thinking of one drm_gpuvm object across all devices when SVM is in the picture...
>
>> That you map the same thing in all those virtual address spaces at the
>> same address is a completely different optimization problem I think.
> Not sure I follow here... the requirement from SVM is, one virtual address points to same physical backing store. For example, whenever CPU or any GPU device access this virtual address, it refers to the same physical content. Of course the physical backing store can be migrated b/t host memory and any of the GPU's device memory, but the content should be consistent.
>
> So we are mapping same physical content to the same virtual address in either cpu page table or any gpu device's page table...
>
>> What we could certainly do is to optimize hmm_range_fault by making
>> hmm_range a reference counted object and using it for multiple devices
>> at the same time if those devices request the same range of an mm_struct.
>>
> Not very follow. If you are trying to resolve a multiple devices concurrent access problem, I think we should serialize concurrent device fault to one address range. The reason is, during device fault handling, we might migrate the backing store so hmm_range->hmm_pfns[] might have changed after one device access it.
>
>> I think if you start using the same drm_gpuvm for multiple devices you
>> will sooner or later start to run into the same mess we have seen with
>> KFD, where we moved more and more functionality from the KFD to the DRM
>> render node because we found that a lot of the stuff simply doesn't work
>> correctly with a single object to maintain the state.
> As I understand it, KFD is designed to work across devices. A single pseudo /dev/kfd device represent all hardware gpu devices. That is why during kfd open, many pdd (process device data) is created, each for one hardware device for this process. Yes the codes are a little complicated.
>
> Kfd manages the shared virtual address space in the kfd driver codes, like the split, merging etc. Here I am looking whether we can leverage the drm_gpuvm code for those functions.
>
> As of the shared virtual address space across gpu devices, it is a hard requirement for svm/system allocator (aka malloc for gpu program). We need to make it work either at driver level or drm_gpuvm level. Drm_gpuvm is better because the work can be shared b/t drivers.
>
> Thanks a lot,
> Oak
>
>> Just one more point to your original discussion on the xe list: I think
>> it's perfectly valid for an application to map something at the same
>> address you already have something else.
>>
>> Cheers,
>> Christian.
>>
>>> Thanks,
>>> Oak
