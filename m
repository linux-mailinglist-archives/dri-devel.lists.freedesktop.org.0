Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9591277F03A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 07:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A3D10E3F5;
	Thu, 17 Aug 2023 05:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2046.outbound.protection.outlook.com [40.107.101.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C18F10E3F5;
 Thu, 17 Aug 2023 05:33:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mERkklj8sNwJJmsjQrLzpEFLw7gGDAiggzj2eDPlFad38xu9q4tDnpxKJ9+ZNEfjpc23RAYf9w8/NAmrDeaNn0/BujdDDa+e+iYfXgw47tGmJj8LN797+kl7DNP6Z8FHICEgmfWgmsk5MQ/6BY/O9VHRFmBKmnULXVhLkma2XOB1WtDVuC+7f5vigu+w9ywiHubeX4hJOpwsxYG8umNywLuMacFAElLfOd1DYQv70xrnAsPb5PqvY866U+fpKEwLgnlfMg4yFi9UhEQdfA3390pbM8mZ/RT3gOdswY0phzTajlxweQa6Dj/oBB7FmAUFjPDt1rELyFHIpGiPsZF/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHr5RJME27PyrwXeLjTKIb8mryndHNbhj10MY/m+dJI=;
 b=hEL8f+F9ZkHWUDgSnmvMITbxrH2fuwuhh3YiabCFjygE6o5R1wzaDu6jH4SBtrcOC8d5hJhCl99WsJOnpFDPlUijkc+Ecjpze6L/dqwJ0QZutwvwM5kkqP2MVT0eUUwimV3WaaJVGbRdyPzrB7v72A0Wp3zVKhNk8VUmnm81pFyOEQvnsEcTykIF/JcGvQK3StUHPc89LjGidX2HEmtjMl3+KgRtPO30Ew8Kk62SDZVZr6DXmNiJSnV01ZR5KWhM0nyvm3HNFGt/q6owLpCPRH92yQRzSLXc/SlNOnBxahqxcr16dDpR5+BQmBF1+12lVuE4ErDcvQakLYbzcnsOzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHr5RJME27PyrwXeLjTKIb8mryndHNbhj10MY/m+dJI=;
 b=E9hitvBlRM7BPyAj+ju8NVimulOmAbYAqDpG212NmtMZ4k97B1TqUOkhcwBnKM4lDe6lSpYYqi87P5Ea3wdfSvXQOpTm9QweEgnqIlUL3QaBSA8TnkiNiAVoeW2QcEoj2BFeyqvh0pOD/xjUsKJkWr24x3JOqP+QlIdbBViQwkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV2PR12MB5751.namprd12.prod.outlook.com (2603:10b6:408:17d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 05:33:52 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 05:33:52 +0000
Message-ID: <0bf839df-db7f-41fa-8b34-59792d2ba8be@amd.com>
Date: Thu, 17 Aug 2023 07:33:46 +0200
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <5fdf7d59-3323-24b5-a35a-bd60b06b4ce5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV2PR12MB5751:EE_
X-MS-Office365-Filtering-Correlation-Id: 412d6d2c-07a0-49b7-5b25-08db9ee38a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qW/YdIKsY9VEVxEcHpZ+uS5Q5V8QzoV/oWMWA1JDpWTJXs2Vhx+I9L9BhBH3ENArQDcCQs6VExDFHyRRW5dYd8PGgtkREHP+c37bxE0XiHFgZKCYzbhZe6MaHWKwZXb6jisPq5QigWDU2J7QdpBZqrUkH0Hf+7o6B+2E+oSzR1Bc9+qRDgFwDwfw7CDWeMEAhYLaSnXik1rjSlcGg4KowrBe5pOlPSpRDPL8/Ro1/6fBgF+GLj+vZiLqcFFrbEIGkLRSKCsEYjPWmZ8KUkQ8MY3lGlJMbjBB5PeGmzuaCLk1yEIWWniYYremiMLuV80d9U0XCJ9p6pggXSJjVLVGhChNgTxRzrRN3YQXSemGwilgcQcBiDsumLuMJH0aRl1yXe+lYnRRMG8FdKwzRzIEhrDHqHcoJ7165VLhjdN5IHbqOvKxKg+6Tmd9Ign0S2h1zFkHL9YNbblepCIGHaq/IUaOhV3qzfpS4gRzFMyDoOY0oka/PX1Fj5gObanq97d+S18L/6D+kVcB1xQj2pKbLwDQWUz4xyJmYIfmEU8H/KmlhBgQB9J1+FyfJoaVX5EuCIXPb+K+qEsexUg6Mo51suEWaZT9LsUDzcPhzoEO5kleRaVp2gosNsuGEk+JlYW8Kte54oZ3v2r5NY/tHKTKeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(451199024)(1800799009)(186009)(31686004)(31696002)(86362001)(36756003)(38100700002)(2616005)(5660300002)(110136005)(66476007)(66556008)(66946007)(478600001)(53546011)(316002)(6666004)(6506007)(6486002)(6512007)(26005)(41300700001)(4326008)(8936002)(8676002)(66574015)(66899024)(7416002)(2906002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG1zV1pzR21QWjRpWjdxbTlaNkdqcWVDSHZNc2E3TmZKVS95TFhRQWdtcWlO?=
 =?utf-8?B?RTljbzlNRTdVQ0JKVXV5UUFsUVNSNm1FTk9qWVJ3S2pyMUZEbitjbEoxZzdC?=
 =?utf-8?B?aWdLOEVCZFRacVl0TmljSDl0RjE2ZVV4bFdxSWtIOXRIcVB5aUdOS21BTTlt?=
 =?utf-8?B?NDlWSDFkY085VE5ybHZ2ang4K1pKeXpVajVVb2cxMi9WbFlFNFJaVTB0K3dN?=
 =?utf-8?B?d0Uzc2MvZ0cvMmlRd29pZjlnL2g4dEdXMjhCbXRUSHR5Z0Jlb0lkbytqdERk?=
 =?utf-8?B?TWdXTE5WL0Izc0R0NVFWZDFLbGpVaTJjRUtEUldWNzNuTVBPM01oL01EOVg4?=
 =?utf-8?B?UmlZNFBuaU5jT00reUxLU1lOdUhWOWJna2NHa3FteTVxcGZJaXgrYzZZYm11?=
 =?utf-8?B?VXJUc3dqUkYyTjNSdzJ1S1dhK0ZRVFN4SmZGTnRnNDBVWDRkTXV4dHp3VFNV?=
 =?utf-8?B?MlRnMi81TXNvWG9EM1k5Uk03SG11SXFRZ211YWFTQmxFbGE2NmUxVHdlTTJv?=
 =?utf-8?B?MWlLUHJpWUtoOVlUR25HWGxFT1pBc2Zxdm9HZmR4R0pmNWVjU2p6OS9aZVhL?=
 =?utf-8?B?MXJkL0JHYnoyTWFraXZUVFFqM3dJZjZOZXV0dWZEQUNzNThML3plUGJUNHBt?=
 =?utf-8?B?eDlrTVZTS3RkWjJiRC83cTJPeUVkL1UxbXFiOFBoUTVWZWtsb1VHbXBJQTJN?=
 =?utf-8?B?NXlXMVVOTHJlUzBLRXVUb1d6MG5lMy9kRmdmakJjeUpjeStvbGdNeGJNT1di?=
 =?utf-8?B?YW9YWm0wcWJOTk9qOEVVdHNEcGFuYzJUV05XYmZOZTRLejlhaXpCY3JadnMz?=
 =?utf-8?B?eTIzTlRGU2xiNVcyTGk2aThYcm9WQ0RhOVBJdDVub0krbGdkbHVhQWpGNmQz?=
 =?utf-8?B?UHBLTzZxeE0zTlZGR2VMY0FsQWFLTTNVMU1PRWIwdmJ0Z1BhWkI0Wmx4a0tN?=
 =?utf-8?B?U051clgyS21MQUdqOVpENW03NkxnMGpTZ0IyL1RWZkZNbm16NDRwbTY4WVRJ?=
 =?utf-8?B?Ri9iUjkxOVJHZ0FDcVdMY01Cc2VpcE1rZDd0UktJb2pSUHdoZVc5OW43NVky?=
 =?utf-8?B?ZWx1L2JjZ0pDU0FidkZ5YUJCcVVnRHJRWFhUR3VzdXVaRUd4cW5OYnNkNWFZ?=
 =?utf-8?B?ellCQU5TaGp0cG9hd3RESFdhVHNNRmwyQTZvVURqVk1qcUZWVkYwc1ZqVnl2?=
 =?utf-8?B?TUNwQ0xpYWNQZVdDeHdWNERtbGsvMG1saTNMUnRMK2QwZU80dHpTNXNwSWdt?=
 =?utf-8?B?SEVQbnZDQjdnT2NncWVFV1BocDVtc0RiaEdjLzN4ejR3Q2JSSWkwbURPRndQ?=
 =?utf-8?B?QkxoVitLaDF1K1RWbmt4RXBnejZ0UlY1REU2NVVMQ3FHU3RXNE5BaHV3SkN3?=
 =?utf-8?B?TWs1SllSY3Z0M3VKNTA4Tk1JNGhhSy9Bcm5KdmtLMEpMSUpzYnRKdFB5enhx?=
 =?utf-8?B?Unp3a0lEa1JqY0Y0ODUvaW1OTGtuNHR2RHZWcVRaY09XNEFyNGE1b1EvZlFt?=
 =?utf-8?B?aldLcGNTZ1FWWmtUVExkK1E5NnV5VzFOS2syRTFrUTFEL3MrSGwySXhrTWdo?=
 =?utf-8?B?S2FQVkRhaFd5emhRdys5am5tN0hJbitiVkd1QzVJTTRkMmlMNEtEdUtKUEZz?=
 =?utf-8?B?WFJaTnRPWkpocDcvYmpZRC90V2FwdlBIVHdqdGdNbXBydk1rd25adFdZa0lp?=
 =?utf-8?B?VHFxNVJQMFBZZ0cyeEpoWlBxUU5lOFA5VWM2ZThsRUhoNmE4MFRZM0dzZy8y?=
 =?utf-8?B?NHhNd1FpS3pBUEE4RUJLSHhScFcrR2lHV0JUbS9Bc0VKcVZkNnRlOGtTcEwy?=
 =?utf-8?B?T3o5YTVTZDhkWDM1R3JSNFVHZnJGWVhSNGtvSVUvZ2hZNjdGOC94b0dXcmhG?=
 =?utf-8?B?ZlM4RS8wWnEvZTFjNlVXT1RkNzlMT1lidDJoMmFoRmcxRE16NXlzVk92UVpk?=
 =?utf-8?B?UnliYm1qS2UzTGl4MWdYSkpqZ3lUQW43ZERqZjYzaXAvYUxPVGlzOS9vbTFN?=
 =?utf-8?B?RGdsS3p0Y2ptTWJacTNwZWF0Mnl1K0Y4MjJmSDQ2a1kyR1psUDVZTHgvaXoz?=
 =?utf-8?B?OEFHVEtFNXFTZDhlaVpZcHhpeDkxd0ZTd3RQRUFlSjRZUXBvTXc4WEZFbEk5?=
 =?utf-8?Q?WS0mIx9wiJ13ChNs5EdOFnF/f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 412d6d2c-07a0-49b7-5b25-08db9ee38a50
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 05:33:52.0089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWJ2LYbXftsbnzAkCF+Tkv/dR8GpNnq/UVuOawFLvKc+/P0fBTB/oKPqyzZNmPcs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5751
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

Am 16.08.23 um 18:33 schrieb Danilo Krummrich:
> On 8/16/23 16:59, Christian König wrote:
>> Am 16.08.23 um 14:30 schrieb Danilo Krummrich:
>>> On 8/16/23 16:05, Christian König wrote:
>>>> Am 16.08.23 um 13:30 schrieb Danilo Krummrich:
>>>>> Hi Matt,
>>>>>
>>>>> On 8/11/23 04:31, Matthew Brost wrote:
>>>>>> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
>>>>>> mapping between a drm_gpu_scheduler and drm_sched_entity. At 
>>>>>> first this
>>>>>> seems a bit odd but let us explain the reasoning below.
>>>>>>
>>>>>> 1. In XE the submission order from multiple drm_sched_entity is not
>>>>>> guaranteed to be the same completion even if targeting the same 
>>>>>> hardware
>>>>>> engine. This is because in XE we have a firmware scheduler, the GuC,
>>>>>> which allowed to reorder, timeslice, and preempt submissions. If 
>>>>>> a using
>>>>>> shared drm_gpu_scheduler across multiple drm_sched_entity, the 
>>>>>> TDR falls
>>>>>> apart as the TDR expects submission order == completion order. 
>>>>>> Using a
>>>>>> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
>>>>>>
>>>>>> 2. In XE submissions are done via programming a ring buffer 
>>>>>> (circular
>>>>>> buffer), a drm_gpu_scheduler provides a limit on number of jobs, 
>>>>>> if the
>>>>>> limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we 
>>>>>> get flow
>>>>>> control on the ring for free.
>>>>>
>>>>> In XE, where does the limitation of MAX_SIZE_PER_JOB come from?
>>>>>
>>>>> In Nouveau we currently do have such a limitation as well, but it 
>>>>> is derived from the RING_SIZE, hence RING_SIZE / MAX_SIZE_PER_JOB 
>>>>> would always be 1. However, I think most jobs won't actually 
>>>>> utilize the whole ring.
>>>>
>>>> Well that should probably rather be RING_SIZE / MAX_SIZE_PER_JOB = 
>>>> hw_submission_limit (or even hw_submission_limit - 1 when the hw 
>>>> can't distinct full vs empty ring buffer).
>>>
>>> Not sure if I get you right, let me try to clarify what I was trying 
>>> to say: I wanted to say that in Nouveau MAX_SIZE_PER_JOB isn't 
>>> really limited by anything other than the RING_SIZE and hence we'd 
>>> never allow more than 1 active job.
>>
>> But that lets the hw run dry between submissions. That is usually a 
>> pretty horrible idea for performance.
>
> Correct, that's the reason why I said it seems to be more efficient to 
> base ring flow control on the actual size of each incoming job rather 
> than the maximum size of a job.
>
>>
>>>
>>> However, it seems to be more efficient to base ring flow control on 
>>> the actual size of each incoming job rather than the worst case, 
>>> namely the maximum size of a job.
>>
>> That doesn't sounds like a good idea to me. See we don't limit the 
>> number of submitted jobs based on the ring size, but rather we 
>> calculate the ring size based on the number of submitted jobs.
>>
>
> My point isn't really about whether we derive the ring size from the 
> job limit or the other way around. It's more about the job size (or 
> its maximum size) being arbitrary.
>
> As mentioned in my reply to Matt:
>
> "In Nouveau, userspace can submit an arbitrary amount of addresses of 
> indirect bufferes containing the ring instructions. The ring on the 
> kernel side takes the addresses of the indirect buffers rather than 
> the instructions themself. Hence, technically there isn't really a 
> limit on the amount of IBs submitted by a job except for the ring size."
>
> So, my point is that I don't really want to limit the job size 
> artificially just to be able to fit multiple jobs into the ring even 
> if they're submitted at their "artificial" maximum size, but rather 
> track how much of the ring the submitted job actually occupies.
>
>> In other words the hw_submission_limit defines the ring size, not the 
>> other way around. And you usually want the hw_submission_limit as low 
>> as possible for good scheduler granularity and to avoid extra overhead.
>
> I don't think you really mean "as low as possible", do you?

No, I do mean as low as possible or in other words as few as possible.

Ideally the scheduler would submit only the minimum amount of work to 
the hardware to keep the hardware busy.

The hardware seems to work mostly the same for all vendors, but you 
somehow seem to think that filling the ring is somehow beneficial which 
is really not the case as far as I can see.

Regards,
Christian.

> Because one really is the minimum if you want to do work at all, but 
> as you mentioned above a job limit of one can let the ring run dry.
>
> In the end my proposal comes down to tracking the actual size of a job 
> rather than just assuming a pre-defined maximum job size, and hence a 
> dynamic job limit.
>
> I don't think this would hurt the scheduler granularity. In fact, it 
> should even contribute to the desire of not letting the ring run dry 
> even better. Especially for sequences of small jobs, where the current 
> implementation might wrongly assume the ring is already full although 
> actually there would still be enough space left.
>
>>
>> Christian.
>>
>>>
>>>>
>>>> Otherwise your scheduler might just overwrite the ring buffer by 
>>>> pushing things to fast.
>>>>
>>>> Christian.
>>>>
>>>>>
>>>>> Given that, it seems like it would be better to let the scheduler 
>>>>> keep track of empty ring "slots" instead, such that the scheduler 
>>>>> can deceide whether a subsequent job will still fit on the ring 
>>>>> and if not re-evaluate once a previous job finished. Of course 
>>>>> each submitted job would be required to carry the number of slots 
>>>>> it requires on the ring.
>>>>>
>>>>> What to you think of implementing this as alternative flow control 
>>>>> mechanism? Implementation wise this could be a union with the 
>>>>> existing hw_submission_limit.
>>>>>
>>>>> - Danilo
>>>>>
>>>>>>
>>>>>> A problem with this design is currently a drm_gpu_scheduler uses a
>>>>>> kthread for submission / job cleanup. This doesn't scale if a large
>>>>>> number of drm_gpu_scheduler are used. To work around the scaling 
>>>>>> issue,
>>>>>> use a worker rather than kthread for submission / job cleanup.
>>>>>>
>>>>>> v2:
>>>>>>    - (Rob Clark) Fix msm build
>>>>>>    - Pass in run work queue
>>>>>> v3:
>>>>>>    - (Boris) don't have loop in worker
>>>>>> v4:
>>>>>>    - (Tvrtko) break out submit ready, stop, start helpers into 
>>>>>> own patch
>>>>>>
>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>
>>>>
>>>
>>
>

