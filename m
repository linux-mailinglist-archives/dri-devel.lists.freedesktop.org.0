Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B61473F4E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 10:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A8410EAAC;
	Tue, 14 Dec 2021 09:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2064.outbound.protection.outlook.com [40.107.95.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6001410EAAC;
 Tue, 14 Dec 2021 09:24:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ix37cWqvHtdtd6WkZtbfVbmjJENdmSAYUz0Nkigv1SychEuPwgTZEXnCYYMH8/co7KYM/Bs5fa5EIhx0eeC5nLpRCMgZEQojO7pj96KvqlrnvMBlXiBboqttRaxtQn5Lyd1+YR70IuwR2iBF7VTAljW958JJoNR90jl1X7G+keuutrjsNJeNtc+N7t5lItebQCghbVdn/cblGQcCBHKGdSYXaJY/g4Uzvjtw7LTPFX9KUhzDu2e3YNFLGZynq0j7DYEoSugFKxEFcF+F5plcu6mmqisbStku/ibJA5y5s1RtMS2ZR1oXG9GyO3+MOwZtgblyWzzVBX3BTsBE8G94kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yjDSFkIS0adAeNcaH9BJ+vz/UuaR0D4N01AxBaBDCQ=;
 b=mp0e7JfFsz0JmqWn0W6LIF+2gsVA9wkjJ1kgJIb6UeXaBvjYBYASOsvX5S7CV6FfQ1P0zV4YprJ1ykbaghiN7k3xdcUKojbW545vYA94fbR2xP0gQj+aaFXVZoJp2RADMQBXYH7M4wkvGvJU4wZCkQ4JkV6AYWypOAppRs1BzVWQ7rfUcgECblihZEsgkLrIUS9iAEU4brhFW7NWrxbw9cSQv3LdEiTFtDVk6lcD47fkwGmf7TZKsEcNX0n/jIxTl2XrninUN/TMw8ziO74aB9JaIqlXyANLa5ZmYsrh+xfZdJ2AsmeiIN3LZ+AIMi88cU4DUwKJu55kQmfa5gg7ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yjDSFkIS0adAeNcaH9BJ+vz/UuaR0D4N01AxBaBDCQ=;
 b=KFowb6LfkTnbVnXsXrerY50FLDrOoOc7jhZVEu52toxQoh1aS6tTXp+ezu0VmjM6D31K/UqPRFPnyvjQorZB1TnI/87sFWNg1OJp/JFIyJxlZ6k2068PNrBg6briobOb7a9XdAjGqWljLtHDae4BQP02gBDzoCzimU7zfymXmBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1278.namprd12.prod.outlook.com
 (2603:10b6:300:10::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 09:24:22 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4778.018; Tue, 14 Dec
 2021 09:24:22 +0000
Subject: Re: [PATCH 1/3] dma-buf: make the flags can be configured during dma
 fence init
To: "Huang, Ray" <Ray.Huang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20211213063422.2232155-1-ray.huang@amd.com>
 <5adca96a-e2bb-833a-e470-807a22b9b2fc@amd.com>
 <DM5PR12MB250468603570AFC28C211F56EC759@DM5PR12MB2504.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <152dd115-1155-20cb-879a-d4756146edb0@amd.com>
Date: Tue, 14 Dec 2021 10:24:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <DM5PR12MB250468603570AFC28C211F56EC759@DM5PR12MB2504.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AS8PR04CA0181.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::6) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f65bad28-c49d-47e7-64d3-08d9bee38323
X-MS-TrafficTypeDiagnostic: MWHPR12MB1278:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1278617A56C181676AF8FCF883759@MWHPR12MB1278.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gW2tCh281Wfq23zpRj+HrQ+1d0JvFCRdL9IUoZR5aSNBS3uEcNBhQXmUCW4ZnIX5VM1doCYuXF4unvIBJmuEVx1GWl4Jp7baEZkFcIt4g3x3nEWcN9zdg1kx/RdLGc+VHJfE6EXWK7f93odKjAvqpKef/d6HA59cfDP0pimzPQij7BFVxakEs3pAzKXeO1iKb6+fMwm6LhnjJAq3r6oIrWd0H0dlRhbDmJ0Ro+bEwelfZlFx8pSJ7Oty2dNMioulIwf49MD32g0cykctoggrfGEhnuR+AbzHO549g4L2pgArgL5MotMFHtwZBFFTAthYnj+FXHsQ+v5GhuE9LSnnjhApYrx7BDlKGRW28iwXJviWOm7aR7HJkg36AAydD62ANBFLofNrQpsyRc6upWuCVzLhFhwIFXYjTg3WnjaVfidNaySWQcciSVrSZST8ySXf2pdjY/CirM7hApPmqEDfN6QSQXOPs8YvjngD4g8VE+D1vT3TvbBl/UlSldlaCEre9YdAQ2/cdTvc16uYMK5nSItNwBQbKhKtlvTmYZaQ+3D5yaA8DgILUPoJS8ZV9KSwLN+3KerBUoG8WaRrSZ8welKfOsXQSEon7UaHSG8uGZ9DGRDeZ8avluhuVRF7Nfej0ToyO2B4s2ln2P2oXvx2AfJre9olVViG9whag10jby911t3t6eEQOnAfmpdstJb/LP70NggC/EWdRYHQ8jsHfeBfdHbIusECvaobR5j1HVD2SOzmhn+e9XGPfSUTX5De
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(6666004)(6512007)(83380400001)(31686004)(6486002)(186003)(38100700002)(26005)(8676002)(66946007)(6506007)(5660300002)(4326008)(31696002)(66476007)(66556008)(2616005)(54906003)(316002)(2906002)(8936002)(53546011)(36756003)(110136005)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkxRWDNoRDRmdDFqd3Zwd1Y5MUdzT2x4THVWT0xid013ZnQxblIzWS9Qc214?=
 =?utf-8?B?VHZtRVNtaFk3c3l4UVh6UnJWeWJTRkI5am0wUTc2aHB5YUVQVjNwMENFUkNH?=
 =?utf-8?B?MmdOODFCQS9wSWtNUTJBNjFtTmZEUmFDbEJqNy9FSUxkaVpobGZMS0RvOUcy?=
 =?utf-8?B?am1BbTNmdUJLWStXM2VNN3RxNHNHRjNxN3pOd3FhTU1IZllMcldIYVVudldw?=
 =?utf-8?B?ZjlRZVpWQjZjYWErcmdwNHRMYXN6QVpETGN5cDBSRWRPaVNMRnZYRlFGMmcx?=
 =?utf-8?B?cyt1R1Q1S1BBVFFnZWZEb21zNXJsLytnVWdpQXhCcTNaUVpENmpMdVA1RlNO?=
 =?utf-8?B?TDdVZFA5Vm5XL3Y1NGVqNTNmaS9zQkVwVUpLVlFML084aHRnRVhXZlpYZjRZ?=
 =?utf-8?B?VmtXSU9tNnkyYjJORERQM2RENkdoWDd6NENPblF6Q3hBb2VaRHRDaHRRR2I2?=
 =?utf-8?B?Wm50WU5GWDdwdXBwc3BIdVQ4T2FEazNzaW5yRm4rNm82L1JzREJsekM1MGtp?=
 =?utf-8?B?VTBiNmZBY3MxT2Jhck1FMFZLSnBFYXBFMkMzd3FMcExZUTdEVDB0K3Qza2JQ?=
 =?utf-8?B?SVZPZ0NYMVhycmh5V0RRVW9RWllZV0pjaU03Q1ZNS0QvTGVOa0FNSjhRTkVp?=
 =?utf-8?B?TnhrM2hCN2FSNjFLem9COWJRZTFta1FsTmgxUE5WWWo1SUJqdzEwTGdYVGdy?=
 =?utf-8?B?WklSelVVamFqOFhaQmVja3diWklPNE9yV2VlMUh1YlpvZFFHd0U2cWFUNmor?=
 =?utf-8?B?dUhic1FYSnVTNWxDMzNReXNKZkNDdFJ3L3V1QWwwdzgzTWUrODZIWFpCSnpT?=
 =?utf-8?B?MG1TVlpVeEVWV1MzRFZtTE5EN1lyQ2hsdEFmWXZMU3NTd3NVK3RJbjFIQmZy?=
 =?utf-8?B?NkhNZDE4RkwzZVVhMm5UbE1nbktINEVVZi81aTJ4ZGl5NEoxTjZWQ2drMk1w?=
 =?utf-8?B?VmF4NVJkbWY0NjR1OGVtS1RYZzQyRFdWOXZkMk5xNERPa3N6WGVKOVIxcTNE?=
 =?utf-8?B?WTk0SS9ibm0yU1JVSFVVVFpOMUlDbGR4ZGhhaEIxYnhOR2ZTZnJpZnd2SDkr?=
 =?utf-8?B?U0lqemNESTFWWFczekc0TXRWUm5USVp0VEZQdnJvUTlqODgxYldNRVBTSFkw?=
 =?utf-8?B?VERmL25JZ0wzMlJhVHlpYWdZUnp4QWxwN21hOVRjYXZraVNHRWE1aGVRSkVQ?=
 =?utf-8?B?STFaY0NXbkpmOWVPMWxPRWUwM0tjNmExc3FNcXRHMld5dWdyZlkwY3ZwcTBK?=
 =?utf-8?B?Mmc5VDR2QUw2cDhtT1R1Z1hmc2JaRmZ0bGYwWWJySlU4bVJDTmFPditiZml0?=
 =?utf-8?B?Nzl1bG93NVVuMDlHVU9WSWF1VG9IMUdPVmtIc1lwd2hLLzFLRUpuMUZRSmE1?=
 =?utf-8?B?UXpCbmQ0eGg5UkpKY1hxZVBGeEVIaWpoRytEeTkxWURtRm5hZm8zVGdRRjV6?=
 =?utf-8?B?U1lteFFGdmJka3lyQWRqc0x4QjRqclcwbHlhcDAwUXorcFJmQ3JMcTlRc1NE?=
 =?utf-8?B?Q3dIdXhyL09zSk1ZTlpTWlFiajVJZmswLzJoNEZWSGlNcTJ5UnJVQTVXWkgy?=
 =?utf-8?B?K0diT2lOcGpMNU83bjM5MFFjbEtRSHdVQ0dOWGdwbEd3cnFVQ1o1SkVvNHQw?=
 =?utf-8?B?Z0drU0lZeHZnd0dJRUhLeW1wVlIvVHdGSHBPdndaUzhhdzR0ZHp1dUZIZ24y?=
 =?utf-8?B?Qy8zN0JjZTIzR20wdjI1ZHZwcTNCYWVnVW1FRzlOYWZ6RFBDNzFiK2tTV0tt?=
 =?utf-8?B?VjNUMzRTblo4dlhuTHl3V014Rzcwakt6MUV5VmVsaG9JVHdyZWNNYkNYTlBa?=
 =?utf-8?B?TmM4VXlaV0Nma2VqRm0vK3d6OTZvSG13dmZ0SElxMzNkTDZmTnJwZkZPN1RX?=
 =?utf-8?B?RnBhT3lWVVl1SUNsbFRtUTJBbGZiTXQrTndsUXpmU2I4QkFIWlFYS29VRU56?=
 =?utf-8?B?R0NUbHhQeDFIaUtDZjVQbXQ0bEU0cWJCOXJxYWxUUkQ1a3l6YTBIZUl4VXBF?=
 =?utf-8?B?RnJWa0plaElvWGNKQ1BDbzNPMDlkaGZLdUtQemtkallRSXdJVU95eWljZTR5?=
 =?utf-8?B?aUlETnA3eFpsb0ZWd2Q0NVB2Mk5CakdjTDNMVW54clY1ZjBxdFlOY1R6dmVx?=
 =?utf-8?Q?/vBA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f65bad28-c49d-47e7-64d3-08d9bee38323
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 09:24:21.9043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJQbrk6Srh3iF1hFp0hUuiWvLRVulWvhVLJCvQp+B5udvGJ8dOTL88ofWxTmB04o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1278
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Liu,
 Monk" <Monk.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.12.21 um 10:19 schrieb Huang, Ray:
> [AMD Official Use Only]
>
>> -----Original Message-----
>> From: Koenig, Christian <Christian.Koenig@amd.com>
>> Sent: Tuesday, December 14, 2021 4:00 PM
>> To: Huang, Ray <Ray.Huang@amd.com>; dri-devel@lists.freedesktop.org;
>> Daniel Vetter <daniel.vetter@ffwll.ch>; Sumit Semwal
>> <sumit.semwal@linaro.org>
>> Cc: amd-gfx@lists.freedesktop.org; linux-media@vger.kernel.org; Deucher,
>> Alexander <Alexander.Deucher@amd.com>; Liu, Monk
>> <Monk.Liu@amd.com>
>> Subject: Re: [PATCH 1/3] dma-buf: make the flags can be configured during
>> dma fence init
>>
>> Am 13.12.21 um 07:34 schrieb Huang Rui:
>>> In some user scenarios, the get_timeline_name callback uses the flags
>>> to decide which way to return the timeline string name. Once the
>>> trace_dma_fence_init event is enabled, it will call get_timeline_name
>>> callback to dump the fence structure. However, at this moment, the
>>> flags are always 0, and it might trigger some issues in
>>> get_timeline_name callback implementation of different gpu driver. So
>>> make a member to initialize the flags in dma_fence_init().
>> Well that doesn't make much sense to me.
>>
>> None of the dma_fence callbacks is called from the dma_fence_init function
>> (or at least shouldn't). So drivers always have the opportunity to to adjust
>> the flags.
>>
>> So please explain the rational again?
> Once we enable trace_dma_fence_init event, we will call get_driver_name and get_timeline_name callback function to dump the names in dma_fence_init().
> At that time, the flags are always 0. However, in amdgpu_fence_get_timeline_name(), it will check the flags (AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT) to select which way to get the ring.
> If the fence should be actually embedded in the job (will be set after that), it still will trigger a kernel panic (please see patch2) because it go with a wrong way. Because we cannot set the flags at the start of dma_fence_init. That is the problem.

Well then I think we should fix the whole approach instead because what 
you try to do here is utterly nonsense. You can't modify the ops 
structure on the fly because that is used by all the fences.

Instead please just duplicate the amdgpu_fence_ops() and separate them 
into two structure, one for each case.

This way we should also be able to completely drop the 
AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT flag.

Regards,
Christian.

>
> Thanks,
> Ray
>
>> Christian.
>>
>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>> ---
>>>    drivers/dma-buf/dma-fence.c | 2 +-
>>>    include/linux/dma-fence.h   | 7 +++++++
>>>    2 files changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>> index 066400ed8841..3e0622bf385f 100644
>>> --- a/drivers/dma-buf/dma-fence.c
>>> +++ b/drivers/dma-buf/dma-fence.c
>>> @@ -952,7 +952,7 @@ dma_fence_init(struct dma_fence *fence, const
>> struct dma_fence_ops *ops,
>>>    	fence->lock = lock;
>>>    	fence->context = context;
>>>    	fence->seqno = seqno;
>>> -	fence->flags = 0UL;
>>> +	fence->flags = ops->init_flags;
>>>    	fence->error = 0;
>>>
>>>    	trace_dma_fence_init(fence);
>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>> index 1ea691753bd3..f9270c5bc07a 100644
>>> --- a/include/linux/dma-fence.h
>>> +++ b/include/linux/dma-fence.h
>>> @@ -131,6 +131,13 @@ struct dma_fence_ops {
>>>    	 */
>>>    	bool use_64bit_seqno;
>>>
>>> +	/**
>>> +	 * @init_flags:
>>> +	 *
>>> +	 * The initial value of fence flags (A mask of DMA_FENCE_FLAG_*
>> defined).
>>> +	 */
>>> +	unsigned long init_flags;
>>> +
>>>    	/**
>>>    	 * @get_driver_name:
>>>    	 *

