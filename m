Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EE63C197B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 20:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27986E97B;
	Thu,  8 Jul 2021 18:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E026E957;
 Thu,  8 Jul 2021 18:56:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xa4XM6AFiNDFF5zMuzlq14/7ZoN/QRrI/xrkYBFgNo2NNlSjGeFcnMsfcjrL3YLtisZQfbadZM36uOZlOFfsVCvfb/8W2eSL+F+HSQiPXtWdH1+/0/WTd7Ao9poO8+vyiL6/dqYa4ma43R/SJ+f/j8Ka4EB2KNOFJ8b57BD941Tu7qBtBjfHj5f1KIkOCEHhdFxS2RlXyy1iWZHnWrcugrLkWB/o5D0HNJQpypPyeseQGOaSExG0ncLoj7EsANOJFWILle8C9dLFgtEM8sE9MrMIp+RwqMsn3kLrhkClWfVdHGfNCi9S2yaLazlvRbuTRAx92gYpspZyJ6A3UVyPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cN5+SSyW8J42v738DmZrphjZoBT9E3aoqONrvSfudWg=;
 b=lSgsIV2kWPj7T86Dmjdh7tR16y4SBaryYjbqCccsZ3BwPMFDUrXFZt9EsJlb3h8jVgOpWG28jrJaAa3ZkvT5XXfZtg4KESd80DwomJIm36UBuG+bkNm0uh+O4imuMn0nhVhxLb9FfmoMuqdrY/bY204QQDGHtewd3M5vt/8YI9ZaD+pxXVHkyDEKCv4HXoVXuQ6fwDcHOCv20cOvfIU3Zu4/a4b+hbge7p6Fy9Y3hg+kFowc8JVXhyCJ3XAwM9Ar8t0kNDchxWS2n5v7RRG2QrVnIqr/Db2viyJgyaCIREwGiJVmpwMbYlB1uQ4A2U+M9Be6+OCrkbneOEzQb3v1bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cN5+SSyW8J42v738DmZrphjZoBT9E3aoqONrvSfudWg=;
 b=3dRaudLL4mmxLYVaKyh7TFtQkrtNBPQE20XQaAz7IOOQZxWXZGqmC/zEfzqj0de83/7v5HML2qXJon9tZE0FwEAfnW2YD0T5dmmk+d5WiZh3HeWzBJSMJ5TZXO91mBq0/flOlyqvfnndh7B3G+YhhvwwnFcchqYd6cAAHmp5ot4=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2750.namprd12.prod.outlook.com (2603:10b6:805:77::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.29; Thu, 8 Jul
 2021 18:56:53 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::9f8:ec71:6535:cd36]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::9f8:ec71:6535:cd36%5]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 18:56:53 +0000
Subject: Re: [PATCH v3 03/20] drm/sched: Barriers are needed for
 entity->last_scheduled
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
 <20210708173754.3877540-4-daniel.vetter@ffwll.ch>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <9cc93adc-0a93-a0d5-422b-a57fac9bd450@amd.com>
Date: Thu, 8 Jul 2021 14:56:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210708173754.3877540-4-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::19) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:449c:5ff:35e2:16a]
 (2607:fea8:3edf:49b0:449c:5ff:35e2:16a) by
 YTXPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Thu, 8 Jul 2021 18:56:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6713766-ce14-4dfa-d74c-08d94242267a
X-MS-TrafficTypeDiagnostic: SN6PR12MB2750:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2750A241E1C1382681D56550EA199@SN6PR12MB2750.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9c5Wk8M8sv6wB2OotASkrE72aVxskUORDxAPCpeCQJ9LLEQ7uwicMcOPFGk/g1Hz4jBP7hhBeI8vynFaFrvWFjpYxT8z5QbbZfdOU9uzfC0lg7uUsrMsGy3zbE9hFJP0MbSc4jTIqk5+M7RIbER7X+EGWXDNGVUV8YuBQiICuMcHv+7XMXNuRKw31E97RGNFnktjIE1Z9e1dEekIO2j4HgjTaXdElgOHKGqZgy9n0i1PCtvcmJWE1fPIREPBOBaV8hFBIoDwmQnrBRQotFzr15o2wkFbJKR04MHv7po6MccEDWuyvBpzr6kjXTmdSabNLXIgHX7qqKku32jJLljyIzzmOjqdspBf7DFqM3StrUxLn+Bbf8M1Rz/TJIhJlayXcTaBBe89ZL9cCfUklp7wyk/dfp2G1iCf/ij4KQIQccn941wpaqRuvD9MLw/v/IRMppPjJQYhY4O8W7ZyeOUnF6XZL7GOhk1YbJA368+4SbFOoWmaIbf/3dlMmNO1YE0qQSkVl4YQ8a2zbA0WBEamekW+CuSBEcZc5Yijeanp3J/LWA8jeXhQt420wGaIPf6IGnWxufnSun1upYGpKYphI6tVs7cM97Qweao81YU9cJwyXYhO+Ge7jCZRehdVxIWb8EEjJmmmwkUfiYoXzyangqDgoS9fWMm+fi6LoexlhNwAL7sZS2xDwXgrymUFyeimr1ufccGQYh2X9uwD2uZVtCQWXwgIgn1P/Dwlj0f2xGSIc2Bz4YvlwkyqAPSTZpFePeVeChX/zK+7xTUiMcNQXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(66574015)(8676002)(4326008)(5660300002)(83380400001)(44832011)(316002)(38100700002)(86362001)(2616005)(186003)(2906002)(66476007)(31696002)(478600001)(66946007)(6486002)(53546011)(66556008)(8936002)(110136005)(36756003)(31686004)(54906003)(60764002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2t2TEJBd0x0ZmZhdWZ6bDVzY01rTDNFMTlCbWR0bzZuaGdvZCtTRUJ6czlL?=
 =?utf-8?B?aWhTNFlTUEcyL04wRUs4bWdtMldDL3QxbjdURStSR0kwZ2xLZnluZ01KNnh3?=
 =?utf-8?B?aTJiYjdwTmNOKzRYRjB2cGdxb1h1UVdNb1hRYWZuT0hPQU0wWWd6eFcybDU1?=
 =?utf-8?B?QmNIR1k0b3YxVzZhMVVhWm9adCtkSkNvZ1FTV040SFRHNnB4S2ZyUCs3eVl4?=
 =?utf-8?B?WlJKRGhwVC9uaVZuRTZCb0NDenI4MUlERWJVUmdyeWV3R0pjVmRWV080TzBn?=
 =?utf-8?B?RzZzUjRxNzN1dnhwT0RlcTd4RUNzSWlZM3IvU3AyaVlEL2Y4UnBHWGlmQUdH?=
 =?utf-8?B?WUFMOUMwbjBEcWNWK3BpMHJuV0UvU3duNncwQnZlVjNqNTFpY2Ftd09nTGky?=
 =?utf-8?B?amtiQ29qOEFHazM1Yjg1N3U0SGpyL1hjYy85cnZnTVFsQVZuYUcrMVZCeERV?=
 =?utf-8?B?TlA4djhBQzFUOG16STErbUJyZ3lSQnVaSGNOQUZ4SEphSWh0ajZUUmk3VGs2?=
 =?utf-8?B?WE84ZWpXQ3FWbVVjNWdRZVkvcGNURFNBTXZqcUVLZVNxelpzajNoRE1ML2Qv?=
 =?utf-8?B?WVhaM2I0K2NMTE1zMUNLNzZ6TlZXWTlPNm4vWFRRNFQ4cFluckxJaTdXTzYr?=
 =?utf-8?B?UUkxT3M4VUNWSzlTWjlhRGZVUkZGdWplVzFidFlSN1I0NU1ZQWFJaHRCWmxv?=
 =?utf-8?B?UStucExsalJlRXNlSFBQamVzbDNSTGhycWxjT3h2RzhZQXhpZHVJV3g2RDZC?=
 =?utf-8?B?cE9QYTc1SDBqRS81b1lWb3pwQVNXVDA3RStCc05VTExUcjIzbWdTR1haSVdW?=
 =?utf-8?B?MXVWN0kwYmVZWlVnaDFSM3BaYVQ5bWc2bm5jQ2RNMWtWbkdZZTZkZXN1REJu?=
 =?utf-8?B?dG9VY2xrYlUwTnBZR3NNMWdnREZGYkYxVU4xd3BlSVdxUGJuSGZXY2lESlBp?=
 =?utf-8?B?dnY4Tk5EVUk1Q2wvOHZDRjZZM0lpbjZLMEc0b3BmSG1FbWZUMzhXRzkxaHJO?=
 =?utf-8?B?cmJFdVlXUHNhRzBlVXhrREp0dGxnUmtzU09mem1wdWRwcDlJMGlEczJpWUlD?=
 =?utf-8?B?OWJTMFFKZVAwSnB5MmZyYnhlQm1oOXZSSFNEcWpmUU54YUtkVlBjZE9XQmdH?=
 =?utf-8?B?emRtK3dERTJPbFRHeTRtUEtiMGNpaERTMm1tcmVjWWJ5QURTYlJzQWNVL2l2?=
 =?utf-8?B?T2p5WHBrOWpzQmFnZnBsZ09xanB6YnRpQWd6VmVRcGR5cVpFVjF4Q2tOQW4w?=
 =?utf-8?B?RWRvUk4vMENlV2VuQXBoLzJmZEZSQksyTXhtWlZhc3B5NFlrOG9DMnRKSFN1?=
 =?utf-8?B?RkE2WTYwb0tjL09XS0krbStVa3JoVmMzK09UQ3FmSHh5SW5KbDVBRWFwRnVm?=
 =?utf-8?B?K0RxN1J1RU5nMGRqODE4dUh2bDlPTjh4UHVMMVlVQmliOXh3ZnRjZ2dQTEVJ?=
 =?utf-8?B?TzBQTWZJMzcvRFZmYTFIU1B0TURtZG1rMlJqQkFsWmF1WnlRSkk2UnRmNFR3?=
 =?utf-8?B?TzAyZjlTc3FXUTdKaHcwa1NidHB0YkFQSXFOMHh0d1EyYndPRm1OR0VXQlUv?=
 =?utf-8?B?RCtEeUFqM1drQ0Z5cW14NGRLZkYzOW82d1F5MnJnTmNPbmIrN1JtTHdmcHdX?=
 =?utf-8?B?c0tLbVF5b0dsMkUrK1ZJVitETE4wcHJWUXRYM2luRUtLajR1WWUzZ1VaZ0px?=
 =?utf-8?B?L2JIeXhYV0g1ZXYyam53SmJpWXpveVRIZFVTN1pVT1VIcmZaU1lyM2FzRngz?=
 =?utf-8?B?azZGNUttR2I4OWpNTkxFNGNsenVKZHdrLzVwTGNsVVpiSHJHYldCQ0w0T0pa?=
 =?utf-8?B?R3g2TzZFQzdtS1E5aE5rYzYySFFDNGJhOGFadlJCb3V3cXNlM3dKNnpvZ3lZ?=
 =?utf-8?Q?6bv4yaHy3aDrk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6713766-ce14-4dfa-d74c-08d94242267a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 18:56:53.1922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfCODxGVunmHMuG4SIZlyLnxBf/Gy39rTeOOjd4m3DL1hll85hSni5L6VrZ+nZLR9kjsdZrpKDoNieqW7RgK9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2750
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021-07-08 1:37 p.m., Daniel Vetter wrote:
> It might be good enough on x86 with just READ_ONCE, but the write side
> should then at least be WRITE_ONCE because x86 has total store order.
>
> It's definitely not enough on arm.
>
> Fix this proplery, which means
> - explain the need for the barrier in both places
> - point at the other side in each comment
>
> Also pull out the !sched_list case as the first check, so that the
> code flow is clearer.
>
> While at it sprinkle some comments around because it was very
> non-obvious to me what's actually going on here and why.
>
> Note that we really need full barriers here, at first I thought
> store-release and load-acquire on ->last_scheduled would be enough,
> but we actually requiring ordering between that and the queue state.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 27 ++++++++++++++++++++++--
>   1 file changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 64d398166644..4e1124ed80e0 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -439,8 +439,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   		dma_fence_set_error(&sched_job->s_fence->finished, -ECANCELED);
>   
>   	dma_fence_put(entity->last_scheduled);
> +
>   	entity->last_scheduled = dma_fence_get(&sched_job->s_fence->finished);
>   
> +	/*
> +	 * if the queue is empty we allow drm_sched_job_arm() to locklessly


Probably meant drm_sched_entity_select_rq here


> +	 * access ->last_scheduled. This only works if we set the pointer before
> +	 * we dequeue and if we a write barrier here.
> +	 */
> +	smp_wmb();
> +
>   	spsc_queue_pop(&entity->job_queue);
>   	return sched_job;
>   }
> @@ -459,10 +467,25 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>   	struct drm_gpu_scheduler *sched;
>   	struct drm_sched_rq *rq;
>   
> -	if (spsc_queue_count(&entity->job_queue) || !entity->sched_list)
> +	/* single possible engine and already selected */
> +	if (!entity->sched_list)
> +		return;
> +
> +	/* queue non-empty, stay on the same engine */
> +	if (spsc_queue_count(&entity->job_queue))
>   		return;


Shouldn't smp_rmb be here in between ? Given the queue is empty we want to
be certain we are reading the most recent value of entity->last_scheduled

Andrey



>   
> -	fence = READ_ONCE(entity->last_scheduled);
> +	fence = entity->last_scheduled;
> +
> +	/*
> +	 * Only when the queue is empty are we guaranteed the the scheduler
> +	 * thread cannot change ->last_scheduled. To enforce ordering we need
> +	 * a read barrier here. See drm_sched_entity_pop_job() for the other
> +	 * side.
> +	 */
> +	smp_rmb();
> +
> +	/* stay on the same engine if the previous job hasn't finished */
>   	if (fence && !dma_fence_is_signaled(fence))
>   		return;
>   
