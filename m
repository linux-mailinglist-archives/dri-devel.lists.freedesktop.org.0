Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B289841434
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 21:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8F3112ACA;
	Mon, 29 Jan 2024 20:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2055.outbound.protection.outlook.com [40.107.95.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75EE6112ACA;
 Mon, 29 Jan 2024 20:24:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXOR38RKpYOmvIUeLwCMnnsKIKhwm8FEi7X5d957M38lDCQWHubbQ1W3MgQh7oQLZPw0ca0nyphkfclqBdqOloN9duU1iSfygbjn07sGyMSJOQxijZQPM4DbRx91WxQdHkYcWxky7QXBlL8CE0VBXReCzMJHuBfG3m7xI63YI8i2aMwUjqeiTWUE8YR3sek4/kgzHAN6FPN7NkE5l+dep6iWViFa481LONZOw9PPwLOFM13u2KVe7Df4MlTtDqoqhQ1SWSGFlC9o09Mu/knn27WsgK/Q+i5xhe0W6ETLmxMA9kbPmGIjfezbgizc0Agy0pRJ6+UUuGb3DkKJpb4yXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9OEGmvirwN/a9AiG5VSHXQlC9WKdSsyoRCcl5wHUZc=;
 b=Zfk+gQfNjaW9f3X5PrUjYF9AqvqLWuFdNq5mIupn2WB0J974SpVz1B82Re8+9uEebtKoBqtgxv2mJ5mlx8VO5W3orsZFfDcqFveAq1h3FTBKXbQkhLxRaGcvYZlaidxKLGj6//YnvPukcK8QbaN0gDFbZ7t1h325Znt+e6gsvM/edM3V5jEeviIHOJReC7lSZzHMOVVNCKTryGIN7BtP1zQl+3TCz7JbCyTe3mvjF8PhDXZVdYS+r4FossrP68h8aqzwZd4lt/8uG/6E870K9K9lFC6OChNvpqPF6ZD4Q2bqcvguh3ykzuDe2pB525JR1zr8Lm4mgXHdjX3Ggq8Urw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9OEGmvirwN/a9AiG5VSHXQlC9WKdSsyoRCcl5wHUZc=;
 b=Ip9p5flSaCMkY2AShqb9Kk21KJ+2Od//3KLpxS8jJySOki3RSEle4UPdAsJhW/ivrWnHpbfst+qNsFbdo91LatYjDFt/1gy+vTboeO8uWQl3PfyUQf0N0oaVHvf7+0+Kp1KvwcQjlDPZ7xrPCt4+u2tY812wSkow+nB1FSGDcCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CYYPR12MB8890.namprd12.prod.outlook.com (2603:10b6:930:c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.33; Mon, 29 Jan
 2024 20:24:10 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::6f2f:7892:e9fe:c62b]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::6f2f:7892:e9fe:c62b%5]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 20:24:10 +0000
Message-ID: <c93d6867-452e-4a9b-9dc8-2f978b12d658@amd.com>
Date: Mon, 29 Jan 2024 15:24:08 -0500
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
 <39b5adbc-0d3f-4e34-9ede-12d6542ff892@amd.com>
 <e47189d5-d120-4ee6-9096-c53ebb93490b@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <e47189d5-d120-4ee6-9096-c53ebb93490b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0155.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ac::8) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CYYPR12MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cf2fbb3-5b80-4259-4d4b-08dc2108406e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SlqPBymQCH11mvALJieAHuBo7jnNjhr/cdBB7eMXRNc4PkdKW+JYXXM4UBT2nMt8lXSlPpLgHBc4nTxgVBBqnt1JjdEAC+R/CPQdoEpK2tFICrRLlDLAytsPBY/pZj0lpxd4Bw5JquKltY9gvB/TEBDVu6NirUjxXZTDr2IPgMMTvEWAe6AaoakxF9mnlAByp3UV4w8O0XFCEB5LH6JS7TDgUfCAmyK+eTlllo05NUOUg+y58c7V21/Eu8lVMZIAvDF7ZplslsokbJNUj06IOJ9NVo0mUi3yntWPGh/gFHScAgiH0ArTQL3Os0kw1iW8rWqiaopcpElww95n1zvr8odbEZ4LEITL9kh5v8H78AyzqruUJXMJ9Jcbvb9XT+HAFvxWIuzajdYS/wm0GktNB61obKvwzUrVoVUXJrYEszUUj6ir2mwnS3n44QTM0CnYTElOSKJgGylzyjwlejEGIBvU95SZhLs6dK13ixWbaGKw/3OX5kQh0RNSCogpIQN8cFZsqQKiCAmjvxfP1N/7dfbuCb3nO2W6GSoMPC2mFDduTjK92UvwFwCTAh/NS2DtBX9emEVQSPN0DgK+fXjGFFKMcQ4h8mxzdZaiDrj7Ad27KyiDeNlCh+oxSwU1lnpYGle+KWbQV9aX4ADxG4Beuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(346002)(136003)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(66574015)(83380400001)(26005)(36916002)(53546011)(6512007)(6506007)(38100700002)(5660300002)(7416002)(8936002)(30864003)(4326008)(44832011)(8676002)(41300700001)(478600001)(54906003)(2616005)(6486002)(2906002)(316002)(66556008)(66946007)(110136005)(66476007)(31696002)(36756003)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SytlZW8zQmJ5RXNzRFl4RU9jVzhiYmJxWlNSOXNOM21SRWZBTCtXQ0ZWV08z?=
 =?utf-8?B?azJHVnVnVXIyM09FUVRteXp3cEJJVE9hbHhsS3Ntc0QzdkxHY1VJUlc2SFN3?=
 =?utf-8?B?M2VOT0ZoVk5IbldJdUJicGFIaWl0RTI0OVVkK0w2YytBaWxJYVpzQUhlWG54?=
 =?utf-8?B?b3ZOM2R0SUhCa0hHN1FETERyaE5JOXBPb2t3T1h5OGFkUHdiNm5ic25kakVu?=
 =?utf-8?B?ODZBMy9BdUszNEpHL1o5dlByYVBlb1JGUlZOM1E4cnkvU2MxYitKMFJHZ3g3?=
 =?utf-8?B?RVhCZDlLL0hPaDlKSFlYT1M2SWYwdVJ5L3NRV3dYRlZyUGNpWm56TWloRnp0?=
 =?utf-8?B?b0ZHeHJIQzB5ZFdPTFg3blJQUzZTUGMxK00rQ0JhQUhkTXk5SGhaTXdTc3VQ?=
 =?utf-8?B?bVovMWNLcmxiZlh0T0Vrd1RxajFJRGtoVXZ3Znp2RFhDTmRUWWVyRGFDQXpa?=
 =?utf-8?B?cWlUY3IrckpUMTdpT3htSUJlbDlOMXRZaFJZQ1dac1hvcE5ySVlBeVRaa1Fk?=
 =?utf-8?B?L3RoYS9CV2MyK0hmcE5NSjBDQml4WTZvN0cvL000T0NLdUMybThBOER2LzFn?=
 =?utf-8?B?SkVjWUlNQzQ2eGYrUng0TzJoY1l6RVFQN3dTeEhFNVFYallOYVhZSzVsZDl4?=
 =?utf-8?B?MWRZZ3ZrQkVPUnFoY1VDZlNVUDU1YWowQy8xRWQ5eGJxWkh2Z1BveFZiWndZ?=
 =?utf-8?B?bTlSakhoM2k1Uk1mOVY0OERNemg1R3dzRXZ2eXlBWHVuWXVIaWZlRFNQOE9D?=
 =?utf-8?B?WExrTkVyN3F0MGFQQTFwY2RDWE4wSk8wV0xTR2pIclBZdzJjU1ZIZzNqTXk1?=
 =?utf-8?B?YXNFL25JQVJLbUowVGhYeWQ3WVIxV3kySWFQKzVIbWhwaWJrY3JuL0pvU3Iy?=
 =?utf-8?B?d1RtU3BSYVZkZGZ5Ui81Q3ZDUnhRN0dHdzNKb1oxTTEwVTc2enBCTnFzenhi?=
 =?utf-8?B?ZnU1R1dVZ29zWkpSdDZVczJ4WFZDVmFlUEtveUJOWWlFUHR5blQ5UHQ5MmVx?=
 =?utf-8?B?cE1ja2NUcWNvL2dmU3pKMmpwUFBzRzJ0VDB5cXM5SmJ5YkVUNnlETVZmRkdx?=
 =?utf-8?B?eEFkTjMzY2NRRldLeThhaHhYSDgrT3RxeUVMRDRyenNETm1UdnBaaU5aNjZ0?=
 =?utf-8?B?RDZlRW5HTFNVY2JXa1Vzd2ovNUtLQ1ovTGRtVHlQTWNuTXNkL1M4TUcrWVJK?=
 =?utf-8?B?aTIzd1prN0txaHBHLzdDRGpWTmZ1R0Z3TEVwK2xvSXU5dzJudzVBNGRQY2hK?=
 =?utf-8?B?Q25PTkR6K0FDenByeVU5dllpZDFPbGM0UXdycUY2V3d2M2RZc0NHZXdvMEhp?=
 =?utf-8?B?WVk3TW9BQnhsUmZENkowT0dFZjFnNTZJZi9OS3hZeFg3VnVQM2RJT0FRRFBu?=
 =?utf-8?B?b0RWRVVScGk5UlFRQW5sS28raGpzMHpFMUlRMFdMQ0htajl2TC9VY2k5TVd5?=
 =?utf-8?B?SVNpaVVvb2R0WGt2UVR1TG5QWGxpY3YzbFIxSXhiTTNVSC9rR0Joc1JkZ2FR?=
 =?utf-8?B?V3phSGgwNEdibDJENGk2TUtxLzByQVNzVE9ZQ2VkcjJsZTdZUWdRVjM4eEhm?=
 =?utf-8?B?dFRmUE5VMUUyeVZITk1kYTQ4c0cxa3UwdTViRWdVRnpRS3I2eG16bldNVkhz?=
 =?utf-8?B?bHZmYXpHRStRNGpETWtLY2VZUDhUUnY0bzVPYmR0YmFpUG9oMjNnc0cvdUow?=
 =?utf-8?B?a1p0Wno3TERLdGVtbS9IMk00TWc0MFYrbGllb0lYTXkxaDE0ZnZlcmIzMHJN?=
 =?utf-8?B?dU44bWNPWFdHK3NWeUNRR0xKeUFuT0xyRVR1NVIwQVZ2WkR4QTV1VHo1VHRT?=
 =?utf-8?B?YmJIRXVLczJxaUZsMW9DVC9XRUwxYlNWMVNibENoSFBPWUNXaXgrWThoenFK?=
 =?utf-8?B?OFpSWTI2RFRPclVocml4eGdqUEtwSS9saHRSRHoxQmxUWCtQS0NQWEc2ODQ3?=
 =?utf-8?B?NkEycFkzYktGNFVyVnRQbkJSaHJFbTNVWllLVURZMlhmQ0xOYUt4dmx4aDh6?=
 =?utf-8?B?aExJajRkZndvLzRzR0JMaWw0bWZDOUNNT3V4Rm5hTEhydmo1UmFwaUFVWWZM?=
 =?utf-8?B?anBpN1JZVXQvVk1jNTRmalpRUlFNVG9SSjdWUERoVU1WdVlnR2tyQmZMRGNs?=
 =?utf-8?Q?Jz0Fo06NfJghLOtDQ/oXB7VeA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf2fbb3-5b80-4259-4d4b-08dc2108406e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 20:24:10.6000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ab/F4bUpVcuCLPW2PolzIJV3HpWVjzo8d6zWVWpd5JU7Aw3oMc12ojwf0n2zc0qAnHkEExhwXfSVBEu8SdBiCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8890
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


On 2024-01-29 14:03, Christian König wrote:
> Am 29.01.24 um 18:52 schrieb Felix Kuehling:
>> On 2024-01-29 11:28, Christian König wrote:
>>> Am 29.01.24 um 17:24 schrieb Felix Kuehling:
>>>> On 2024-01-29 10:33, Christian König wrote:
>>>>> Am 29.01.24 um 16:03 schrieb Felix Kuehling:
>>>>>> On 2024-01-25 13:32, Daniel Vetter wrote:
>>>>>>> On Wed, Jan 24, 2024 at 09:33:12AM +0100, Christian König wrote:
>>>>>>>> Am 23.01.24 um 20:37 schrieb Zeng, Oak:
>>>>>>>>> [SNIP]
>>>>>>>>> Yes most API are per device based.
>>>>>>>>>
>>>>>>>>> One exception I know is actually the kfd SVM API. If you look 
>>>>>>>>> at the svm_ioctl function, it is per-process based. Each 
>>>>>>>>> kfd_process represent a process across N gpu devices.
>>>>>>>> Yeah and that was a big mistake in my opinion. We should really 
>>>>>>>> not do that
>>>>>>>> ever again.
>>>>>>>>
>>>>>>>>> Need to say, kfd SVM represent a shared virtual address space 
>>>>>>>>> across CPU and all GPU devices on the system. This is by the 
>>>>>>>>> definition of SVM (shared virtual memory). This is very 
>>>>>>>>> different from our legacy gpu *device* driver which works for 
>>>>>>>>> only one device (i.e., if you want one device to access 
>>>>>>>>> another device's memory, you will have to use dma-buf 
>>>>>>>>> export/import etc).
>>>>>>>> Exactly that thinking is what we have currently found as 
>>>>>>>> blocker for a
>>>>>>>> virtualization projects. Having SVM as device independent 
>>>>>>>> feature which
>>>>>>>> somehow ties to the process address space turned out to be an 
>>>>>>>> extremely bad
>>>>>>>> idea.
>>>>>>>>
>>>>>>>> The background is that this only works for some use cases but 
>>>>>>>> not all of
>>>>>>>> them.
>>>>>>>>
>>>>>>>> What's working much better is to just have a mirror 
>>>>>>>> functionality which says
>>>>>>>> that a range A..B of the process address space is mapped into a 
>>>>>>>> range C..D
>>>>>>>> of the GPU address space.
>>>>>>>>
>>>>>>>> Those ranges can then be used to implement the SVM feature 
>>>>>>>> required for
>>>>>>>> higher level APIs and not something you need at the UAPI or 
>>>>>>>> even inside the
>>>>>>>> low level kernel memory management.
>>>>>>>>
>>>>>>>> When you talk about migrating memory to a device you also do 
>>>>>>>> this on a per
>>>>>>>> device basis and *not* tied to the process address space. If 
>>>>>>>> you then get
>>>>>>>> crappy performance because userspace gave contradicting 
>>>>>>>> information where to
>>>>>>>> migrate memory then that's a bug in userspace and not something 
>>>>>>>> the kernel
>>>>>>>> should try to prevent somehow.
>>>>>>>>
>>>>>>>> [SNIP]
>>>>>>>>>> I think if you start using the same drm_gpuvm for multiple 
>>>>>>>>>> devices you
>>>>>>>>>> will sooner or later start to run into the same mess we have 
>>>>>>>>>> seen with
>>>>>>>>>> KFD, where we moved more and more functionality from the KFD 
>>>>>>>>>> to the DRM
>>>>>>>>>> render node because we found that a lot of the stuff simply 
>>>>>>>>>> doesn't work
>>>>>>>>>> correctly with a single object to maintain the state.
>>>>>>>>> As I understand it, KFD is designed to work across devices. A 
>>>>>>>>> single pseudo /dev/kfd device represent all hardware gpu 
>>>>>>>>> devices. That is why during kfd open, many pdd (process device 
>>>>>>>>> data) is created, each for one hardware device for this process.
>>>>>>>> Yes, I'm perfectly aware of that. And I can only repeat myself 
>>>>>>>> that I see
>>>>>>>> this design as a rather extreme failure. And I think it's one 
>>>>>>>> of the reasons
>>>>>>>> why NVidia is so dominant with Cuda.
>>>>>>>>
>>>>>>>> This whole approach KFD takes was designed with the idea of 
>>>>>>>> extending the
>>>>>>>> CPU process into the GPUs, but this idea only works for a few 
>>>>>>>> use cases and
>>>>>>>> is not something we should apply to drivers in general.
>>>>>>>>
>>>>>>>> A very good example are virtualization use cases where you end 
>>>>>>>> up with CPU
>>>>>>>> address != GPU address because the VAs are actually coming from 
>>>>>>>> the guest VM
>>>>>>>> and not the host process.
>>>>>>>>
>>>>>>>> SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This 
>>>>>>>> should not have
>>>>>>>> any influence on the design of the kernel UAPI.
>>>>>>>>
>>>>>>>> If you want to do something similar as KFD for Xe I think you 
>>>>>>>> need to get
>>>>>>>> explicit permission to do this from Dave and Daniel and maybe 
>>>>>>>> even Linus.
>>>>>>> I think the one and only one exception where an SVM uapi like in 
>>>>>>> kfd makes
>>>>>>> sense, is if the _hardware_ itself, not the software stack defined
>>>>>>> semantics that you've happened to build on top of that hw, 
>>>>>>> enforces a 1:1
>>>>>>> mapping with the cpu process address space.
>>>>>>>
>>>>>>> Which means your hardware is using PASID, IOMMU based 
>>>>>>> translation, PCI-ATS
>>>>>>> (address translation services) or whatever your hw calls it and 
>>>>>>> has _no_
>>>>>>> device-side pagetables on top. Which from what I've seen all 
>>>>>>> devices with
>>>>>>> device-memory have, simply because they need some place to store 
>>>>>>> whether
>>>>>>> that memory is currently in device memory or should be 
>>>>>>> translated using
>>>>>>> PASID. Currently there's no gpu that works with PASID only, but 
>>>>>>> there are
>>>>>>> some on-cpu-die accelerator things that do work like that.
>>>>>>>
>>>>>>> Maybe in the future there will be some accelerators that are 
>>>>>>> fully cpu
>>>>>>> cache coherent (including atomics) with something like CXL, and the
>>>>>>> on-device memory is managed as normal system memory with struct 
>>>>>>> page as
>>>>>>> ZONE_DEVICE and accelerator va -> physical address translation 
>>>>>>> is only
>>>>>>> done with PASID ... but for now I haven't seen that, definitely 
>>>>>>> not in
>>>>>>> upstream drivers.
>>>>>>>
>>>>>>> And the moment you have some per-device pagetables or per-device 
>>>>>>> memory
>>>>>>> management of some sort (like using gpuva mgr) then I'm 100% 
>>>>>>> agreeing with
>>>>>>> Christian that the kfd SVM model is too strict and not a great 
>>>>>>> idea.
>>>>>>
>>>>>> That basically means, without ATS/PRI+PASID you cannot implement 
>>>>>> a unified memory programming model, where GPUs or accelerators 
>>>>>> access virtual addresses without pre-registering them with an SVM 
>>>>>> API call.
>>>>>>
>>>>>> Unified memory is a feature implemented by the KFD SVM API and 
>>>>>> used by ROCm. This is used e.g. to implement OpenMP USM (unified 
>>>>>> shared memory). It's implemented with recoverable GPU page 
>>>>>> faults. If the page fault interrupt handler cannot assume a 
>>>>>> shared virtual address space, then implementing this feature 
>>>>>> isn't possible.
>>>>>
>>>>> Why not? As far as I can see the OpenMP USM is just another funky 
>>>>> way of userptr handling.
>>>>>
>>>>> The difference is that in an userptr we assume that we always need 
>>>>> to request the whole block A..B from a mapping while for page 
>>>>> fault based handling it can be just any page in between A and B 
>>>>> which is requested and made available to the GPU address space.
>>>>>
>>>>> As far as I can see there is absolutely no need for any special 
>>>>> SVM handling.
>>>>
>>>> It does assume a shared virtual address space between CPU and GPUs. 
>>>> There are no API calls to tell the driver that address A on the CPU 
>>>> maps to address B on the GPU1 and address C on GPU2. The KFD SVM 
>>>> API was designed to work with this programming model, by augmenting 
>>>> the shared virtual address mappings with virtual address range 
>>>> attributes that can modify the migration policy and indicate 
>>>> prefetching, prefaulting, etc. You could think of it as madvise on 
>>>> steroids.
>>>
>>> Yeah, so what? In this case you just say through an IOCTL that CPU 
>>> range A..B should map to GPU range C..D and for A/B and C/D you use 
>>> the maximum of the address space.
>>
>> What I want is that address range A..B on the CPU matches A..B on the 
>> GPU, because I'm sharing pointers between CPU and GPU. I can't think 
>> of any sane user mode using a unified memory programming model, that 
>> would ever ask KFD to map unified memory mappints to a different 
>> address range on the GPU. Adding such an ioclt is a complete waste of 
>> time, and can only serve to add unnecessary complexity.
>
> This is exactly the use case which happens when the submitting process 
> is not the one originally stitching together the command stream.
>
> Basically all native context, virtualization and other proxy use cases 
> work like this.

You cannot use unified memory in this type of environment. A GPU page 
fault would occur in a GPU virtual address space in the host-side proxy 
process. That page fault would need to be resolved to map some memory 
from a process running in a guest? Which guest? Which process? That's 
anyone's guess. There is no way to annotate that because the pointer in 
the fault is coming from a shader program that's running in the guest 
context and competely unaware of the virtualization. There are no API 
calls from the guest before the fault occurs to establish a meaningful 
mapping.

The way this virtualization of the GPU is implemented, with out proxy 
multiplexing multiple clients is just fundamentally incompatible with a 
unified memory programming model that has to assume a shared virtual 
address space to make sense. You'd need separate proxy processes on the 
host side to handle that. You can't blame this on bad design decisions 
in the SVM API. As I see it, it's just a fundamental limitation of the 
virtualization approach that cannot handle guest applications that want 
to use a unified shared memory programming model.

That's why I suggested to completely disable the SVM API in this 
virtualization scenario when you create a KFD context that's separate 
from the process address space. It is not essential for any 
non-unified-memory functionality. ROCm user mode has fallbacks to work 
without it, because we also needs to support older kernels and GPUs that 
didn't support this programming model.

Regards,
   Felix


>
> So that the CPU address doesn't match the GPU address is an absolutely 
> real use case and should be able to be handled by the GPU VA interface.
>
> Regards,
> Christian.
>
>
>
>>
>> Regards,
>>   Felix
>>
>>
>>>
>>> There is no restriction that this needs to be accurate in way. It's 
>>> just the it can be accurate to be more efficient and eventually use 
>>> only a fraction of the address space instead of all of it for some 
>>> use cases.
>>>
>>> So this isn't a blocker, it's just one special use case.
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
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>>   Felix
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> Cheers, Sima
>>>>>
>>>
>
