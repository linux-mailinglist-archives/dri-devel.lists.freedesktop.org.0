Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FF7841151
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 18:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F9410E5B9;
	Mon, 29 Jan 2024 17:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036CA112A51;
 Mon, 29 Jan 2024 17:52:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xb9ZyEN3+MqgqqaJkFQgxMRB2DX0CmSsvhY/9EcE1Z4FwPCtI+jKluxd0kkaK4OoAH9ocWh5LzBVonFp7GKhN2yIJb9M0jWpDEyMUYbFPu8/0JeMmpiPUh52eVvNouAXsLfDc4tJCW8o8sGFr/xAF5veiD5Xpmx0iOXxXUl65PjpTHx4CaLY7vrjtURF7WCiiPD44LPT1NMs0mUUxNSVYp2Vmyas7Pt7ZcE5edr7iZVXrMQ0KjP46RNjLvDz9ZxFqZeRmZiLe9vWmN9nVHmhk1acxjf+5n5n8h7zHjCa9YDNI4fb5BF7PPcsj8lDaymLBMjGIgphL5RcxNYX8vp1vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEkKP67KRGXH/A20SJsHkb74dfj5K5xB17v+bBSuY28=;
 b=gcXvBNRQnW0hchUMwqwieRxnuAT5LQV0bNqnGR/OwG1KnazbrohKsbrI3b/ZDVWVitMD9csnY/MQynnithHvBCuAM18kAua8HDQ5c3/R6n62hryXmkSODtT2iTxvzItF154tWS/usY0tUshIpAsE6Mlqaiw0xJUkSNaJBu6gFXG/vX+IFxhjUrlFGQ1e33+Q0Zcv4NUHOb5GayGf7zp3KllD77X4bxX/009Y/zDx19FQff81BiNDrHEiHnvckDQZxEyaVs+HokbxSFURWKjlr0eS8nZrqQ629GjZrxqLWy4WFAni4rfpsczqko6sdjclLSxlzNATuOINB4lGuI2GvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEkKP67KRGXH/A20SJsHkb74dfj5K5xB17v+bBSuY28=;
 b=s6tWCMv1U+DRv3qkaCXM/zRuoLrYTC9oqlp+qI9H0q587C4f7fO1HyFUVpAzkk+x5t7U01olPBVmgOzMM7PGHx6/Ie7NvVFb7hmpm4pzFZZJzcDLCSjUfdjKc7bPStO8BlPIyE0g5CcSMqmOBWjzdc7+OaMLFA55io+c5Cxuv5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH7PR12MB5853.namprd12.prod.outlook.com (2603:10b6:510:1d4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.33; Mon, 29 Jan
 2024 17:52:30 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::6f2f:7892:e9fe:c62b]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::6f2f:7892:e9fe:c62b%5]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 17:52:30 +0000
Message-ID: <39b5adbc-0d3f-4e34-9ede-12d6542ff892@amd.com>
Date: Mon, 29 Jan 2024 12:52:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
Content-Language: en-US
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
 <3e795468-1779-4100-a706-85be323e69f2@amd.com>
 <2444da7e-be62-4538-b42e-b234c763f3bd@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <2444da7e-be62-4538-b42e-b234c763f3bd@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::16) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH7PR12MB5853:EE_
X-MS-Office365-Filtering-Correlation-Id: 109c1578-b6b8-42aa-8748-08dc20f31004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lZFgIyyoTbT37g99nRSwV7C1CcrTHityVIljlS2jtxse0+FMs0bx5ei4Ng2VIrsFxihGlRjqE/LDOiHO2m9TLL5P/H2LSynSu4UZ8EVlpU+JgjnKEpuHCNiO5O/wgG6If6kRC4lfDNWJ5Pf7SByTSc6ygM5ugiAkt+WeRN/kn8s62+uAmgLjAP1qig8yJLWgGgJxMXZT31lJ2O3Qff0jzK16/N67oXFTIZrNg3lhPqkU5tC0gYJ+K6ILryQUbV+NbrGmjhuTXBLl9HswK93XrWIbKodTz1GKnUTTGKE8lQIAyfptSExzGi+Sy2JyMwhhH19WSmf9IskW4G9BuvJLqYZ6Ewfh7OP2Nddx3fOKtR4eZhBQBUxNLQsmDPF5/sGT7Dxgayf1tcu2exvs7a28m7nWIyOUtT15AQtGQHwULLShgFQyRan/fgxqNrxceS4M0wqlLuiq4nMbDViwW91eJp1atZTLkTS4Ib+Ekvzj69kznLAXZA7CSWO85H8El/0IblTKajhh/HmZtLZEYByGUzyvcpvu8s0r++0YNxwiCHUVrUltwwDQgVN/80fQA2O/kK9LaRY6yl9y1LSLxmXW6+Lqz8DCqJHi1OOOEFoh57hk5kYxZGDnhvnxLin1hTulEfPSeO/P2rG1I7njMdmqZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(136003)(366004)(346002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(8676002)(8936002)(4326008)(38100700002)(110136005)(66476007)(66556008)(54906003)(66946007)(316002)(86362001)(31696002)(36756003)(41300700001)(2906002)(44832011)(7416002)(5660300002)(6486002)(83380400001)(31686004)(6512007)(6666004)(6506007)(53546011)(26005)(478600001)(36916002)(2616005)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUVmc0s4M0k2clphak54SlVvSHJ6SW1nS0RLNk5tVU5BUFZZbkYyQkYyOTc0?=
 =?utf-8?B?OXRQanh3ZktGbDBTaWVsVUoxKy9oV1pQL2VvbG1ENUdmRTNvRmdXYWZBTE82?=
 =?utf-8?B?UEltTVF5bElLT2pCUmZYNDNVN2RmanRkRWZnY1ZmSWJ4WDlPSU1OTEFob1Bt?=
 =?utf-8?B?aXBiWXZyc3FOSzdpY1pNRHBYQms0QUhmSy9LVmFHbVB2WEI1akdlMmdYVzNo?=
 =?utf-8?B?c2krVDZxMGZNWlhMSFRmT1N5TVV5V0JURDM4Y1NTNUpySnBES1lJSjdzb2Z1?=
 =?utf-8?B?V0NYNHlXYlM1OHQ3WTlRU1BDMkJoczZaNktRRUdZeHprZDdPbTNEUmY1ekQy?=
 =?utf-8?B?MjRuVTg3ZnBBT25tY3dMQStjQ0tmQS9qb0htd2ZzQ3ljMmdta1JiTjY5UE5y?=
 =?utf-8?B?bm1YMFhtNWFxNDRYbFlPNG9RWGd4cWxQblNMVHJOUmdYNEVwTy9IQXo2WVZB?=
 =?utf-8?B?RDNMQVRxSkxVWklUNkNvUWVJZlJyZkdjK0NWZm5YV3VHUVFIa0dkNWVFMHk1?=
 =?utf-8?B?Q2RjaUliWUwrTXBCTzRwcDJka25VNlJna1k4Rm81S0FXTVNWY0xZSU5LK09C?=
 =?utf-8?B?enliTXoxbGNVelc5Rk9OUXN4T3NMaUZSMy9EZzgvMmZobmpmZzJwZnB1VVdV?=
 =?utf-8?B?VEVsc1dMMEt3MXlmSHhEc3R6cjR6MWFvT0RvNTN0WE9kclNXaHdOcEhZUDdW?=
 =?utf-8?B?NmZCc1NQOFdxK0J0YXVWQ2x4WnVrbmswV0lwYTR2SEN1dGx1VmVqR0QzdnJH?=
 =?utf-8?B?YTVQNFdBUWY0M1N2T1JSSlluM0pxMDByelBUakFBZkNmY0EvYm83Y2Y1dnZY?=
 =?utf-8?B?dWp3a083aThZTThZWGFZVnlBeVhKOER0aXpSRFpYT1c3UExJUC9XRHlMRTlT?=
 =?utf-8?B?MFl3S0lRaFk3b0twL1lkTTBaYitJeWM1ODRZcWRTQ1RHVitjTUswL09tMHJ5?=
 =?utf-8?B?ajhtSkordVFZK0kxYlp6QVJMdklpVWpJTlBvZDU4cEFVN0dSZVhyNnBpeHNt?=
 =?utf-8?B?Q2RjdUYxMk9nWlFJRmk0UUxJSk5sTTNMNkNOOURkRDlkSzMwTTFpdTBwbWpl?=
 =?utf-8?B?eExjaVp5T0p5UEd1cjZVVytpVEJiZVkzRjRsajJnd09jZUYrTEJ3RDFrTlNs?=
 =?utf-8?B?eXRrMEhTNTJ5YWh6V1JjUU84bmJPUjU4SlpPQWoxVm5aKzErajBYYit5bkVk?=
 =?utf-8?B?S0lzUlhJN0Vwb3RaekFzUUpjMm1MTXk5NDdKbG1zZUYrQ3FZVE53VktiZG1I?=
 =?utf-8?B?eUMzMjg4a3FLcU53T0RMcTJHNHo4MXBLTGliaEhFQitCUW9xYmlCWTh3VVQy?=
 =?utf-8?B?RFVoWnZDa0N5SHZHQ29DRTFLdVExTDBxeHJIbmpRT3IxMVBBWGlVWlRRblVO?=
 =?utf-8?B?VWV6R2o5dVRHR3N2U3RVZkVmVDlvVUZrOHdMU2ZBVENFMEl0dnVleDB3NXFJ?=
 =?utf-8?B?YUkvUDBaZW5IbmNMdlVDRHI1SFNadVd6UFN1OWZmbmN6RytFZzNrVFZnVHl0?=
 =?utf-8?B?OEFoNThaNjdZR3ZGSGtpY1FFN1IwYXVSMlN5VXVhZXgrbzY3bTlNSnhyaHBU?=
 =?utf-8?B?TTJJTTIwUjl0azlqb1ByK1hSZnBWWjc3anRESkhhR1FEbGhyc01JS25aQnds?=
 =?utf-8?B?SFpFU29adURtQnVFRW85YlN5VGFTL204YnZiWGlwaVdnN3BKUWxFaWR6MGpp?=
 =?utf-8?B?Uk5CMU95NWVVbk1FVmVDeWtpMHRrODlZc00zdy84eldOOEZTL1l5WUNodDJz?=
 =?utf-8?B?Nmd5YnY3MXRNZ2tKNlordExWRFI5TTgzZmdhM3I3emRiZ1BRWUQ4L3EvUE5Z?=
 =?utf-8?B?SkdOS0lZeFJBSlZiMlA5MUxHYTdLMElGaDNDZTFVR2lzYmVXNmRvVnE0TVZl?=
 =?utf-8?B?SXVMd1Evcmo0byt4dE9jN25iVUZWc1NLVWhwV0VUV1ZzVDBGckp4bUNMM2Rk?=
 =?utf-8?B?RHY3VUNQZ1EzME1YbThVYTdHM1RLdzJUdmJOY0NlZGtoWTBOTEt0Y0NrOGVO?=
 =?utf-8?B?SU1NaytRMUxTbmRsbmVSdXlza3JJV084aVJlNmtzdndqUG1TUkZZNFVrcjRp?=
 =?utf-8?B?YUJCUUhpWHJYNXoraXJSeHdvT0w3Wm5DeHZTaG5vZDJRRnpuSHI4M1UzakJC?=
 =?utf-8?Q?h+N6a8j+CAF4WvANUP58yXsVC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 109c1578-b6b8-42aa-8748-08dc20f31004
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 17:52:29.9762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cl9/UIohZSLu41kDU4L1DGFM2gwUxy88eHIcf4jOpvBO4IW+WizuJlM0oyWesXNz5m6cyAxFe2uV/ua1eJZG+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5853
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


On 2024-01-29 11:28, Christian König wrote:
> Am 29.01.24 um 17:24 schrieb Felix Kuehling:
>> On 2024-01-29 10:33, Christian König wrote:
>>> Am 29.01.24 um 16:03 schrieb Felix Kuehling:
>>>> On 2024-01-25 13:32, Daniel Vetter wrote:
>>>>> On Wed, Jan 24, 2024 at 09:33:12AM +0100, Christian König wrote:
>>>>>> Am 23.01.24 um 20:37 schrieb Zeng, Oak:
>>>>>>> [SNIP]
>>>>>>> Yes most API are per device based.
>>>>>>>
>>>>>>> One exception I know is actually the kfd SVM API. If you look at 
>>>>>>> the svm_ioctl function, it is per-process based. Each 
>>>>>>> kfd_process represent a process across N gpu devices.
>>>>>> Yeah and that was a big mistake in my opinion. We should really 
>>>>>> not do that
>>>>>> ever again.
>>>>>>
>>>>>>> Need to say, kfd SVM represent a shared virtual address space 
>>>>>>> across CPU and all GPU devices on the system. This is by the 
>>>>>>> definition of SVM (shared virtual memory). This is very 
>>>>>>> different from our legacy gpu *device* driver which works for 
>>>>>>> only one device (i.e., if you want one device to access another 
>>>>>>> device's memory, you will have to use dma-buf export/import etc).
>>>>>> Exactly that thinking is what we have currently found as blocker 
>>>>>> for a
>>>>>> virtualization projects. Having SVM as device independent feature 
>>>>>> which
>>>>>> somehow ties to the process address space turned out to be an 
>>>>>> extremely bad
>>>>>> idea.
>>>>>>
>>>>>> The background is that this only works for some use cases but not 
>>>>>> all of
>>>>>> them.
>>>>>>
>>>>>> What's working much better is to just have a mirror functionality 
>>>>>> which says
>>>>>> that a range A..B of the process address space is mapped into a 
>>>>>> range C..D
>>>>>> of the GPU address space.
>>>>>>
>>>>>> Those ranges can then be used to implement the SVM feature 
>>>>>> required for
>>>>>> higher level APIs and not something you need at the UAPI or even 
>>>>>> inside the
>>>>>> low level kernel memory management.
>>>>>>
>>>>>> When you talk about migrating memory to a device you also do this 
>>>>>> on a per
>>>>>> device basis and *not* tied to the process address space. If you 
>>>>>> then get
>>>>>> crappy performance because userspace gave contradicting 
>>>>>> information where to
>>>>>> migrate memory then that's a bug in userspace and not something 
>>>>>> the kernel
>>>>>> should try to prevent somehow.
>>>>>>
>>>>>> [SNIP]
>>>>>>>> I think if you start using the same drm_gpuvm for multiple 
>>>>>>>> devices you
>>>>>>>> will sooner or later start to run into the same mess we have 
>>>>>>>> seen with
>>>>>>>> KFD, where we moved more and more functionality from the KFD to 
>>>>>>>> the DRM
>>>>>>>> render node because we found that a lot of the stuff simply 
>>>>>>>> doesn't work
>>>>>>>> correctly with a single object to maintain the state.
>>>>>>> As I understand it, KFD is designed to work across devices. A 
>>>>>>> single pseudo /dev/kfd device represent all hardware gpu 
>>>>>>> devices. That is why during kfd open, many pdd (process device 
>>>>>>> data) is created, each for one hardware device for this process.
>>>>>> Yes, I'm perfectly aware of that. And I can only repeat myself 
>>>>>> that I see
>>>>>> this design as a rather extreme failure. And I think it's one of 
>>>>>> the reasons
>>>>>> why NVidia is so dominant with Cuda.
>>>>>>
>>>>>> This whole approach KFD takes was designed with the idea of 
>>>>>> extending the
>>>>>> CPU process into the GPUs, but this idea only works for a few use 
>>>>>> cases and
>>>>>> is not something we should apply to drivers in general.
>>>>>>
>>>>>> A very good example are virtualization use cases where you end up 
>>>>>> with CPU
>>>>>> address != GPU address because the VAs are actually coming from 
>>>>>> the guest VM
>>>>>> and not the host process.
>>>>>>
>>>>>> SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This 
>>>>>> should not have
>>>>>> any influence on the design of the kernel UAPI.
>>>>>>
>>>>>> If you want to do something similar as KFD for Xe I think you 
>>>>>> need to get
>>>>>> explicit permission to do this from Dave and Daniel and maybe 
>>>>>> even Linus.
>>>>> I think the one and only one exception where an SVM uapi like in 
>>>>> kfd makes
>>>>> sense, is if the _hardware_ itself, not the software stack defined
>>>>> semantics that you've happened to build on top of that hw, 
>>>>> enforces a 1:1
>>>>> mapping with the cpu process address space.
>>>>>
>>>>> Which means your hardware is using PASID, IOMMU based translation, 
>>>>> PCI-ATS
>>>>> (address translation services) or whatever your hw calls it and 
>>>>> has _no_
>>>>> device-side pagetables on top. Which from what I've seen all 
>>>>> devices with
>>>>> device-memory have, simply because they need some place to store 
>>>>> whether
>>>>> that memory is currently in device memory or should be translated 
>>>>> using
>>>>> PASID. Currently there's no gpu that works with PASID only, but 
>>>>> there are
>>>>> some on-cpu-die accelerator things that do work like that.
>>>>>
>>>>> Maybe in the future there will be some accelerators that are fully 
>>>>> cpu
>>>>> cache coherent (including atomics) with something like CXL, and the
>>>>> on-device memory is managed as normal system memory with struct 
>>>>> page as
>>>>> ZONE_DEVICE and accelerator va -> physical address translation is 
>>>>> only
>>>>> done with PASID ... but for now I haven't seen that, definitely 
>>>>> not in
>>>>> upstream drivers.
>>>>>
>>>>> And the moment you have some per-device pagetables or per-device 
>>>>> memory
>>>>> management of some sort (like using gpuva mgr) then I'm 100% 
>>>>> agreeing with
>>>>> Christian that the kfd SVM model is too strict and not a great idea.
>>>>
>>>> That basically means, without ATS/PRI+PASID you cannot implement a 
>>>> unified memory programming model, where GPUs or accelerators access 
>>>> virtual addresses without pre-registering them with an SVM API call.
>>>>
>>>> Unified memory is a feature implemented by the KFD SVM API and used 
>>>> by ROCm. This is used e.g. to implement OpenMP USM (unified shared 
>>>> memory). It's implemented with recoverable GPU page faults. If the 
>>>> page fault interrupt handler cannot assume a shared virtual address 
>>>> space, then implementing this feature isn't possible.
>>>
>>> Why not? As far as I can see the OpenMP USM is just another funky 
>>> way of userptr handling.
>>>
>>> The difference is that in an userptr we assume that we always need 
>>> to request the whole block A..B from a mapping while for page fault 
>>> based handling it can be just any page in between A and B which is 
>>> requested and made available to the GPU address space.
>>>
>>> As far as I can see there is absolutely no need for any special SVM 
>>> handling.
>>
>> It does assume a shared virtual address space between CPU and GPUs. 
>> There are no API calls to tell the driver that address A on the CPU 
>> maps to address B on the GPU1 and address C on GPU2. The KFD SVM API 
>> was designed to work with this programming model, by augmenting the 
>> shared virtual address mappings with virtual address range attributes 
>> that can modify the migration policy and indicate prefetching, 
>> prefaulting, etc. You could think of it as madvise on steroids.
>
> Yeah, so what? In this case you just say through an IOCTL that CPU 
> range A..B should map to GPU range C..D and for A/B and C/D you use 
> the maximum of the address space.

What I want is that address range A..B on the CPU matches A..B on the 
GPU, because I'm sharing pointers between CPU and GPU. I can't think of 
any sane user mode using a unified memory programming model, that would 
ever ask KFD to map unified memory mappints to a different address range 
on the GPU. Adding such an ioclt is a complete waste of time, and can 
only serve to add unnecessary complexity.

Regards,
   Felix


>
> There is no restriction that this needs to be accurate in way. It's 
> just the it can be accurate to be more efficient and eventually use 
> only a fraction of the address space instead of all of it for some use 
> cases.
>
> So this isn't a blocker, it's just one special use case.
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
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Regards,
>>>>   Felix
>>>>
>>>>
>>>>>
>>>>> Cheers, Sima
>>>
>
