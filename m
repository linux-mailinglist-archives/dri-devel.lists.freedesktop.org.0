Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F22E18412FD
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 20:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD92810F7C2;
	Mon, 29 Jan 2024 19:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2070.outbound.protection.outlook.com [40.107.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E70910F6F5;
 Mon, 29 Jan 2024 19:04:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uc246UFrf3CCGbOhXLGpibFXwsw3CS9Y38OmqDGidAlnItPhlyg0TLMR1wxqqvBnKu/Rfa2wPIp6SO6UxO8tIa3J0fuM+1vsF75k3THfTaR2Rb1mPdW+xdEQulMh00a77RDDRIim52gcxEC7VqH/jIiQwvp9InsT1AD6RN2GKa5cH8W5gAk2ShtLCpzO5goYiPZdfh+sH9SM8fELVEg2s0T00uFtAzcjOwBEroI3ME5GbKGfZtgvgIyBv8u+D6+SXQJHeK8ZOrylYyEVuAcOyu+IrxfGXIsgfdixyuJPA2D6iGTj/Nz/fo1omZen0dRQd5mcsLtdiRq7i7+pkrSVXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72yolwchaf027zXYk4iD8Xkn9YQU48CZAnF87BVKyIg=;
 b=Wi1J49TJNNrKKuh7TtiRmj3jY2q9GllMaZaH6DKP2CB1a88ff1a4jUY+U3qqGxdh7hRPzzul5N6ABDk2hqAcOqF1JqlZk9GvvaqPDc2PkGix0QrM1T01+8aj85Ukm6E83oOfUATHQ9SkNatM8Vi0StuZenUJIqCVC2Z8ib93wqXk9Koyptcup9K3GL7058up+3SgpaRa5yZx7DZ89xBFFuBNqymzGbd/ISNS/7ZB7+BK8P1BZcOVUpK9t1Q2JtUkuzmRz3B1rWic7C0i7r/y4qDL/wp7H+IYeBUmML2UNJQLml9PmEpYMILggBZckpBf4ggIW9s+vqOBWXoVgSKvbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72yolwchaf027zXYk4iD8Xkn9YQU48CZAnF87BVKyIg=;
 b=GCV/qerNvAEojJCUFIcEdDJSeW+oAGM/yBrMK8OnycHuJMT3kI165T/EGVMSNr52asmE6gxnboRnOCQUbgWX9iHwNkB+fp+BnRpcdVohfqZrZfu8g4T00Ix1gY259bj2n99QFcooHSi+ar4kSxzuk7HiJTLWFt9YmgrPC/QBg1M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4487.namprd12.prod.outlook.com (2603:10b6:208:264::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 29 Jan
 2024 19:04:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 19:04:01 +0000
Message-ID: <e47189d5-d120-4ee6-9096-c53ebb93490b@amd.com>
Date: Mon, 29 Jan 2024 20:03:42 +0100
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
 <2444da7e-be62-4538-b42e-b234c763f3bd@amd.com>
 <39b5adbc-0d3f-4e34-9ede-12d6542ff892@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <39b5adbc-0d3f-4e34-9ede-12d6542ff892@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0178.namprd05.prod.outlook.com
 (2603:10b6:a03:339::33) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4487:EE_
X-MS-Office365-Filtering-Correlation-Id: dfe6139b-45fe-4eab-fd48-08dc20fd0db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T5b1/Sqk1Wxd2YTw8Di2VYpD6mjqjd3+8vtJN7U7cJ0YWpgTW9xRb0cIqndgugJgTqhKrObGFMhMU+TAOq0rLDdkFlkjl5SQNobMRR+REDuaKC+ptISo1QDRq4qPuL1XGGGKUUzIAP7lO6K+GjE2Xhmm+pB+27/suSmGzkF/0GnPzOiPupXv6GtILAnZd1OCFOBqEhpSi0bcYzC89YJhpNM14Moi7Agbk/pNrUlEH3IriSaXVQamTlTfkMjHU4OEr2FSBBYyL5iUu+xPKsxkX/mgXK0qPhpFWsvZbzz4jzmbjLgI75n/+/FLBSGDvL3SDsYsmotL6wPZ1xvBUMafgWfnY9SN6npn+/UbV9ZxwORhSPVO4ipUBGSwtZQWpUNQSpsudIBs+QAidUdhZ3FoME1OX3SeOq3glAhB8qZobOmzMs+zAWE4//DoAXwT7zEnj0/GFhpvCSzrO0eFfMawx+LuYzq+21IZ0MNI4qHXinI0jM2nBoLDzWum4qtN5LpsiMAv9Fkct2z9OokMg+we2KaSr0Y/aOQV6fpBg7pRPbpJyd6j2yF/z91yK5xrIDq5ID+NlMOBsXBneFmOoDEp5fHyt6YXhrDMeKGVGfJ/onf5cVZzTT380eJc6H9TH4NeDddRpO8LqsDNQ8nyiHZdlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(376002)(396003)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(86362001)(31696002)(41300700001)(36756003)(83380400001)(38100700002)(478600001)(6486002)(8936002)(4326008)(8676002)(110136005)(54906003)(66556008)(316002)(66476007)(26005)(66946007)(53546011)(2906002)(66574015)(6506007)(2616005)(6666004)(7416002)(6512007)(5660300002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnRLVW5uM05DOWgvc0lnTTc0U3FZeGFmWWZLZWxzQThWZUFuVE1KR2lnVksw?=
 =?utf-8?B?Vkh4OTdwRk8rN3ZSMS9HWGRiMDgySmd2Wnl4L25PWGMrNmNHaG5ET1dLdFhl?=
 =?utf-8?B?bTFxOEhyQTFNcUVmWGNGS2dNSUF2TzZoZjd6dWltUFZ3NVd0UXRhVEZYUnUr?=
 =?utf-8?B?STA1Tk03TXNKRU9xc0V1bGtQcHo5YjRMN3JRckpXL2xSL25OaEt5NUJpcE1V?=
 =?utf-8?B?bDQxOWJHdkgxR0w0d2VVclZQeTdSUW9QTE9UTDNOVWduUFlSZ2hxbHhDZWdu?=
 =?utf-8?B?U29yY213blR4c2Q2Nk1hVmw1MWs4UDM3UUhVbm9XNnBtdXdPcUZtUnZ3RmI3?=
 =?utf-8?B?VXJUYVpEdjZiVkdMM2R2am0rc2tVSXZRdmtjQXR1bTFkSm9CdUh0eGZpTmFZ?=
 =?utf-8?B?NllWZHM5OW95ZUFBbzU3cXVsRGFkam04aVJtZGMvSWphRjdaaDJhNm16Wkc3?=
 =?utf-8?B?R2VMZEt2Y29nNVdvdE01TEowc1VVRG1WWTM0R2hLMTFudnBaSlBTWWpZNTYw?=
 =?utf-8?B?dVZILzBpVFEzVG9uOUIxVCtveEdqMFNKSHV1bkZwNzg4MG5QZGsrZnplTGV2?=
 =?utf-8?B?NU1ZTHlCQlVtZmVaM1k0ZGVOZ2swUVVrVFc5MlFHN2QvOWZLRlZWejlIVTFo?=
 =?utf-8?B?ZDNCQVdnK0VpV29uWmZJQmQ1VEt1YXhjR05tbEFqU2lPazlTeHk0QUtDY1NL?=
 =?utf-8?B?YUdpVHl6OHdCTWMrMXI0OWtzZTk2azkydnpOVG1sRC9YQ2gvYnhlYkEzc3Mx?=
 =?utf-8?B?czdVTGFJVnlaNjh1ekswRnIvanAvRTB6MzFxNVJaclhKNnRNSnVUdWZCNkVB?=
 =?utf-8?B?bkxzZWdLYmNlTkR1RXdiaUlQQ25UWTRiQjZkWmozZ3kxK09vRlA2azJNenI3?=
 =?utf-8?B?SEo0cHhWN3ZaR2RGQ2pDQW9Sd0dyOUhCaU93RzEzcnAxVUNKcWVDTDJuWEdj?=
 =?utf-8?B?YXBmYUFDeGFqaTR4cDZsUmFQNllIWklGSHU1Y3pycDcraUpWSDVuT3NIMWZw?=
 =?utf-8?B?bGxodTZiTjFqSkZBNXllZjZLNVBsazRDTVRBcU5MN0FaUWcvUUphU3pGODJH?=
 =?utf-8?B?d1dhUzZ3aVlWeHhVZ001T0p6L0lkUktBUmhDS0t3K3l1R0ljMktqb0M4ZWRy?=
 =?utf-8?B?dFNwRGZwMG9DSU5rUlJhVXFZeFlVMGsvbEJhNEtHT1daY3R3REJNVWc2aG9w?=
 =?utf-8?B?WitQM1RFMTgyMVB6TUJYVVMxZFc5VGk5M29teGJ0ZmhUTDVIRlBuclFBcDVN?=
 =?utf-8?B?NmZaV3RrQURoL2NvbDgrVG9ZZWVrbU4vb0k0MG1ubGZXakRjL0NsM2RxTnBH?=
 =?utf-8?B?QnJWUTBmcm5hT3FNSU9jYU1zekE0MWdXZnYrbFcyZGlzTDRYN3V1UWhDd0tq?=
 =?utf-8?B?YnNNTnp6ZDJQT3VMSWVGaGQvd0Q5MkdQVG1POHZoVGk3VVRpUHhvdk9iZ01L?=
 =?utf-8?B?eExPa3pOaW1qRkM3WGVFOFNhTWI4RXJiVExjZ3RiUm1vaWQvMzQzd2hDc3do?=
 =?utf-8?B?aDN2c2VlZHI1dXNaUVl3WnNxTUdyL3FVVE5yUUtPVnZuR2Y4T1hJQTkvMzdI?=
 =?utf-8?B?c29KWEIrQkhaeTQ5V3B2MzRWUmVlVlRHVzg4dVpIblJ0ZFp5MGpTb1o3Q1I2?=
 =?utf-8?B?MjQzMmJ1a2pNYUZleDFoMDl2OW1KM1RpaUl2MTBIUWYzZWVDYkF2WmhhNzFy?=
 =?utf-8?B?OHpmbWZHNXhQWEh0R3R6SVJ2RDRNeEJHZGlkeTNjRmJWTzRxZ0trbGF0TjdZ?=
 =?utf-8?B?UVJ3elFUVmhzRDJ1bXREbDJZZ05ZeEUyTEQ2aHNZM2tLcDc3WDNHMTZGeU04?=
 =?utf-8?B?d0JKVkc0V3lxdHMzWG5SU2t1N3U1S3J4VzBrRjBzTFNlQlM2UFJaSUNNQzY0?=
 =?utf-8?B?REh5SytnTnplV29DZ0Q2aHY5WmRjRVlwWG44OFB0NGxwY21JSnlaalJzeWwy?=
 =?utf-8?B?ZlhNSFNPQ3k1dDBsTzNCYjQwWkUyTStkeGRuWW9uTTQrbTc4WU9SWEozZFZx?=
 =?utf-8?B?UWtJNXJSREpsR1VHNkEzNzFDTm0yUytMbmxnL3dHdkhneGZzVXJzRUtYSzNX?=
 =?utf-8?B?T1ZiYlVDcHp5OUgrYW1kWlZuanQ1blB1eVJ0Y0xJQjdVemlna2xYbEJGNC9Q?=
 =?utf-8?Q?p+QZxMq7E0roNJCcd3lfMs4P4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe6139b-45fe-4eab-fd48-08dc20fd0db7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 19:04:01.0914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rmXfmdDPBPVmVzA3S86dSuLAa8VmSIX8v8Qk8f4RMET+K5DnCMmx/RHLQDadrH2k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4487
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

Am 29.01.24 um 18:52 schrieb Felix Kuehling:
> On 2024-01-29 11:28, Christian König wrote:
>> Am 29.01.24 um 17:24 schrieb Felix Kuehling:
>>> On 2024-01-29 10:33, Christian König wrote:
>>>> Am 29.01.24 um 16:03 schrieb Felix Kuehling:
>>>>> On 2024-01-25 13:32, Daniel Vetter wrote:
>>>>>> On Wed, Jan 24, 2024 at 09:33:12AM +0100, Christian König wrote:
>>>>>>> Am 23.01.24 um 20:37 schrieb Zeng, Oak:
>>>>>>>> [SNIP]
>>>>>>>> Yes most API are per device based.
>>>>>>>>
>>>>>>>> One exception I know is actually the kfd SVM API. If you look 
>>>>>>>> at the svm_ioctl function, it is per-process based. Each 
>>>>>>>> kfd_process represent a process across N gpu devices.
>>>>>>> Yeah and that was a big mistake in my opinion. We should really 
>>>>>>> not do that
>>>>>>> ever again.
>>>>>>>
>>>>>>>> Need to say, kfd SVM represent a shared virtual address space 
>>>>>>>> across CPU and all GPU devices on the system. This is by the 
>>>>>>>> definition of SVM (shared virtual memory). This is very 
>>>>>>>> different from our legacy gpu *device* driver which works for 
>>>>>>>> only one device (i.e., if you want one device to access another 
>>>>>>>> device's memory, you will have to use dma-buf export/import etc).
>>>>>>> Exactly that thinking is what we have currently found as blocker 
>>>>>>> for a
>>>>>>> virtualization projects. Having SVM as device independent 
>>>>>>> feature which
>>>>>>> somehow ties to the process address space turned out to be an 
>>>>>>> extremely bad
>>>>>>> idea.
>>>>>>>
>>>>>>> The background is that this only works for some use cases but 
>>>>>>> not all of
>>>>>>> them.
>>>>>>>
>>>>>>> What's working much better is to just have a mirror 
>>>>>>> functionality which says
>>>>>>> that a range A..B of the process address space is mapped into a 
>>>>>>> range C..D
>>>>>>> of the GPU address space.
>>>>>>>
>>>>>>> Those ranges can then be used to implement the SVM feature 
>>>>>>> required for
>>>>>>> higher level APIs and not something you need at the UAPI or even 
>>>>>>> inside the
>>>>>>> low level kernel memory management.
>>>>>>>
>>>>>>> When you talk about migrating memory to a device you also do 
>>>>>>> this on a per
>>>>>>> device basis and *not* tied to the process address space. If you 
>>>>>>> then get
>>>>>>> crappy performance because userspace gave contradicting 
>>>>>>> information where to
>>>>>>> migrate memory then that's a bug in userspace and not something 
>>>>>>> the kernel
>>>>>>> should try to prevent somehow.
>>>>>>>
>>>>>>> [SNIP]
>>>>>>>>> I think if you start using the same drm_gpuvm for multiple 
>>>>>>>>> devices you
>>>>>>>>> will sooner or later start to run into the same mess we have 
>>>>>>>>> seen with
>>>>>>>>> KFD, where we moved more and more functionality from the KFD 
>>>>>>>>> to the DRM
>>>>>>>>> render node because we found that a lot of the stuff simply 
>>>>>>>>> doesn't work
>>>>>>>>> correctly with a single object to maintain the state.
>>>>>>>> As I understand it, KFD is designed to work across devices. A 
>>>>>>>> single pseudo /dev/kfd device represent all hardware gpu 
>>>>>>>> devices. That is why during kfd open, many pdd (process device 
>>>>>>>> data) is created, each for one hardware device for this process.
>>>>>>> Yes, I'm perfectly aware of that. And I can only repeat myself 
>>>>>>> that I see
>>>>>>> this design as a rather extreme failure. And I think it's one of 
>>>>>>> the reasons
>>>>>>> why NVidia is so dominant with Cuda.
>>>>>>>
>>>>>>> This whole approach KFD takes was designed with the idea of 
>>>>>>> extending the
>>>>>>> CPU process into the GPUs, but this idea only works for a few 
>>>>>>> use cases and
>>>>>>> is not something we should apply to drivers in general.
>>>>>>>
>>>>>>> A very good example are virtualization use cases where you end 
>>>>>>> up with CPU
>>>>>>> address != GPU address because the VAs are actually coming from 
>>>>>>> the guest VM
>>>>>>> and not the host process.
>>>>>>>
>>>>>>> SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This 
>>>>>>> should not have
>>>>>>> any influence on the design of the kernel UAPI.
>>>>>>>
>>>>>>> If you want to do something similar as KFD for Xe I think you 
>>>>>>> need to get
>>>>>>> explicit permission to do this from Dave and Daniel and maybe 
>>>>>>> even Linus.
>>>>>> I think the one and only one exception where an SVM uapi like in 
>>>>>> kfd makes
>>>>>> sense, is if the _hardware_ itself, not the software stack defined
>>>>>> semantics that you've happened to build on top of that hw, 
>>>>>> enforces a 1:1
>>>>>> mapping with the cpu process address space.
>>>>>>
>>>>>> Which means your hardware is using PASID, IOMMU based 
>>>>>> translation, PCI-ATS
>>>>>> (address translation services) or whatever your hw calls it and 
>>>>>> has _no_
>>>>>> device-side pagetables on top. Which from what I've seen all 
>>>>>> devices with
>>>>>> device-memory have, simply because they need some place to store 
>>>>>> whether
>>>>>> that memory is currently in device memory or should be translated 
>>>>>> using
>>>>>> PASID. Currently there's no gpu that works with PASID only, but 
>>>>>> there are
>>>>>> some on-cpu-die accelerator things that do work like that.
>>>>>>
>>>>>> Maybe in the future there will be some accelerators that are 
>>>>>> fully cpu
>>>>>> cache coherent (including atomics) with something like CXL, and the
>>>>>> on-device memory is managed as normal system memory with struct 
>>>>>> page as
>>>>>> ZONE_DEVICE and accelerator va -> physical address translation is 
>>>>>> only
>>>>>> done with PASID ... but for now I haven't seen that, definitely 
>>>>>> not in
>>>>>> upstream drivers.
>>>>>>
>>>>>> And the moment you have some per-device pagetables or per-device 
>>>>>> memory
>>>>>> management of some sort (like using gpuva mgr) then I'm 100% 
>>>>>> agreeing with
>>>>>> Christian that the kfd SVM model is too strict and not a great idea.
>>>>>
>>>>> That basically means, without ATS/PRI+PASID you cannot implement a 
>>>>> unified memory programming model, where GPUs or accelerators 
>>>>> access virtual addresses without pre-registering them with an SVM 
>>>>> API call.
>>>>>
>>>>> Unified memory is a feature implemented by the KFD SVM API and 
>>>>> used by ROCm. This is used e.g. to implement OpenMP USM (unified 
>>>>> shared memory). It's implemented with recoverable GPU page faults. 
>>>>> If the page fault interrupt handler cannot assume a shared virtual 
>>>>> address space, then implementing this feature isn't possible.
>>>>
>>>> Why not? As far as I can see the OpenMP USM is just another funky 
>>>> way of userptr handling.
>>>>
>>>> The difference is that in an userptr we assume that we always need 
>>>> to request the whole block A..B from a mapping while for page fault 
>>>> based handling it can be just any page in between A and B which is 
>>>> requested and made available to the GPU address space.
>>>>
>>>> As far as I can see there is absolutely no need for any special SVM 
>>>> handling.
>>>
>>> It does assume a shared virtual address space between CPU and GPUs. 
>>> There are no API calls to tell the driver that address A on the CPU 
>>> maps to address B on the GPU1 and address C on GPU2. The KFD SVM API 
>>> was designed to work with this programming model, by augmenting the 
>>> shared virtual address mappings with virtual address range 
>>> attributes that can modify the migration policy and indicate 
>>> prefetching, prefaulting, etc. You could think of it as madvise on 
>>> steroids.
>>
>> Yeah, so what? In this case you just say through an IOCTL that CPU 
>> range A..B should map to GPU range C..D and for A/B and C/D you use 
>> the maximum of the address space.
>
> What I want is that address range A..B on the CPU matches A..B on the 
> GPU, because I'm sharing pointers between CPU and GPU. I can't think 
> of any sane user mode using a unified memory programming model, that 
> would ever ask KFD to map unified memory mappints to a different 
> address range on the GPU. Adding such an ioclt is a complete waste of 
> time, and can only serve to add unnecessary complexity.

This is exactly the use case which happens when the submitting process 
is not the one originally stitching together the command stream.

Basically all native context, virtualization and other proxy use cases 
work like this.

So that the CPU address doesn't match the GPU address is an absolutely 
real use case and should be able to be handled by the GPU VA interface.

Regards,
Christian.



>
> Regards,
>   Felix
>
>
>>
>> There is no restriction that this needs to be accurate in way. It's 
>> just the it can be accurate to be more efficient and eventually use 
>> only a fraction of the address space instead of all of it for some 
>> use cases.
>>
>> So this isn't a blocker, it's just one special use case.
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
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Regards,
>>>>>   Felix
>>>>>
>>>>>
>>>>>>
>>>>>> Cheers, Sima
>>>>
>>

