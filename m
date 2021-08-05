Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 191423E15F4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 15:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923606EA5B;
	Thu,  5 Aug 2021 13:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2073.outbound.protection.outlook.com [40.107.100.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5B56EA5B;
 Thu,  5 Aug 2021 13:45:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbNQjecGeoTxEU1rS00YdWfTxoFBMdS3/JXFfuGj7Zrw+egSiq9+jCiOYyMO2Y3TivZTQlO70AOfJl7bWKIUwh7CMxZla6azJEf9huj730txIi0yXD1ui6O11guoBLlBuzhuFfyA8C4IBvaKIXTowRy38uMR1K2AXaC7Fr3E2BVAoUZKCz5Rd8AJXRv3OOzcQCASL1wI3rAxWiz0MPGgEuxyi9BFBYPqjsTHYCeH6lWOv9byaJatwk/IHkuBJ8lrm4kEJjGvV59gEH7KcCUFlxmasNhVQpuNKe05q0+QecdR0cHTBpC13/6lM6rX09gjNQyxbGFgG/qWa9ZwZGTZbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sw+P9z/NUGQBSK2ZLWoWxMUTNLjCxqdERp0E8sFLwjk=;
 b=FVd4veuKeyHV0yY2/Om0WQmpN5XLcyIOJ6a6qHXBouFDQbR6CJQggTp4E+nJ+9SovMBnFt3124emYsjxCKjV/WSkSdx9jYgdIizCtZp7HjJMel//VjKl5Q5b6DWRjWwiHBoSiZwnuuRISdk/8vIdxlHzu5QxmDUEnj80T2A8QYgvsN+8JlBmGTaY2OvShTAeSSpySyrMakADxlhlwdKXBII7MbCB4kOLX8mSrkA1tZos/MY7RIIK0HPcgvIkzndBzM/BJFOJnVFINRfJlr508TyQvkwCfaETDUY7CJulKsIeONlFLJXI41KUHL7YZh6rr9JLYMA+u2mChZ3RW+Ak4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sw+P9z/NUGQBSK2ZLWoWxMUTNLjCxqdERp0E8sFLwjk=;
 b=whUep0mLU+G8gw97k6VgobPXkqQhgYAUrhcMWJW0Wh/cIhKBWJfeVUeQrW9KikbyDhdDauBQDO8nVtYyaeiKPavZhiCN6RX5ud1HzbHsG4wvg+O5x2VnKW/NFrYkDo4H62HL5KyE0FicfdJqEW97S2jVIfR31pV+rgyJGUgIfuA=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4552.namprd12.prod.outlook.com (2603:10b6:208:24f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 13:45:19 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 13:45:19 +0000
Subject: Re: [PATCH v5 03/20] drm/sched: Barriers are needed for
 entity->last_scheduled
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Steven Price <steven.price@arm.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Lee Jones <lee.jones@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-4-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2e3bd136-664d-f646-707c-ca1bfb6c0f16@amd.com>
Date: Thu, 5 Aug 2021 15:45:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210805104705.862416-4-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0099.eurprd02.prod.outlook.com
 (2603:10a6:208:154::40) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:ae89:49de:1628:3147]
 (2a02:908:1252:fb60:ae89:49de:1628:3147) by
 AM0PR02CA0099.eurprd02.prod.outlook.com (2603:10a6:208:154::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Thu, 5 Aug 2021 13:45:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85defd83-aad9-4563-4680-08d95817437f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4552:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB45528DBC41A2B65D548D5F9C83F29@MN2PR12MB4552.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zGNohOWLBLfhedSTB8QsX0J8xZnpVxjiINrBF0XMTnlQaNKdz8qMBd5qAHIWz8krWVB706EjKRLH8/AVrLk5apmg5XHWvahO8lozYM2qgQETotw35lp2XrzG5KvKAqmojZ/Xz+q3qu5cR9Kf32XOHHOAxlqP0PFcePJFPbUsK/Iwjo5u5s8laPVCSc7rdKrMYIMhQXfbMPKVnRPZXNcf31pQ1aMN8fxUDEm3ikAhrpGDZdExeCLsrBz5BY6r7cXLgB1OLQyR4EymZEerM6UktJoFIVkmP7AtgbpiHJGCidxTGNkQ06vLPlZedkWw/GqLFUTs8/TM2vZNdq+2G9yyOQ6xbllaX3TOI/8P9w8lHKEk3LwZBHI3tCvbcUXvCNtOP2duJehueCiginrfZdfo9UaRHeRHbFHhrH0A8uJ1cWpFWF0sKacFJzPFhoOCA1DkNxXWksw4m50Ci42LSu8uFPOvDbGntYdWEsqN/sIv2quUyXHAOsLJw35Ml4yoykH0ZSQOvqxMhfxkLelLlo1UlpE3Fqf2MuFWCL7DUtAuQwqU2w3gFKNHeqXIAp6JbPhzF2Qb2lTnp7d8ceoYBkrZqSgaq8Nj9JK2Awx4unCFfiVosWOcOI04NaWJ681qxwvTP++mNCwxuAX9Vi4hVV/Wd5wiEqgGU/nBQgexeOfB4xgxJdlk7/k75HdZkuzMgR8hwbBr3Jd1uz5iMAtlhDARE0WXW79CM4I1H4tnGq+kuOnaW6CX5fUNJvEPI8JnY71rD1vq0u8KKYxJrjZPiVDgsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(31686004)(6666004)(66574015)(6486002)(83380400001)(478600001)(4326008)(66946007)(66476007)(66556008)(86362001)(54906003)(2616005)(186003)(5660300002)(110136005)(38100700002)(36756003)(31696002)(316002)(8676002)(8936002)(2906002)(60764002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWxVTGpKbThhVFpGTGU1bjRJS3d4UEJUYldRV0prdjlub0g2aHNCRUQwbGtY?=
 =?utf-8?B?WGxxWmxRVGhzcVBtN1EyYWVXVGpiSlg3Z1liaiszUUg1VkRYVlRoN0R1d3dP?=
 =?utf-8?B?T05KQjNQSnJzZDU2R0ZOT3JoRzQ5cGQ1aE93WUYyT2FoNVRqUHNjMnp1UnRZ?=
 =?utf-8?B?UWlrQk9ISzJTMkZXZkxnYkoyS3ZLaWdGc2dPWHA3QzZIMnVsd3BsZGhBREoz?=
 =?utf-8?B?d3FlaEdTR2hmc2EvamFiRW5zZ3ZsczZwOUF4VlpwOEJPdEkyNzNzZVptNm8r?=
 =?utf-8?B?QzA0MUYyeGZMc3B0a3VNNWYvL0dhOTJaUGgwVzNzT0ZlVk4wMG5iZlZIV2lG?=
 =?utf-8?B?TGF4QnVUUlZBVUJhRkJPWHljd1ZMUEpRRDliL2I2cHdQUjZ1bFRMdTcvd1Jp?=
 =?utf-8?B?UzlKb1FSemt2NTRabml0VEZkVDZvY210ejgwVWVnSTBLaVc1SDJQK0F3VXRS?=
 =?utf-8?B?V0N3K3VwYVVSQ05wNVpnVExZNVZ3WWhhSEhYQ3ZEN1pqS0llQk5SanJ5REpY?=
 =?utf-8?B?Z2FNK2dvL2xWejdsWmg0bjlxYmtMMTIvOGl2UnVNMVN2aE9KeGxLKzVMZlhS?=
 =?utf-8?B?MnNlZmk5Q1RCaGNleitzRnJnUlg4NmN6S01NQmtvY21PODMvTlZoUWxoVjd5?=
 =?utf-8?B?Y3QvVFlHajVQOU9YK2M4SkIzVUI5TFk1YllMOHl4cnBzM3ZxRnY3K1ZMaHJy?=
 =?utf-8?B?VmwvQjFRcFZMeHB2OE5xdkdnMTdiSTFGUzVqQ05ydWFqcmtidVJpWlRhaDNa?=
 =?utf-8?B?K3JBbHR0UGxLMDRPNWJWZ0I1V3ZTdVRzZHA1Y3E1K2dBd1dqSHpMMWR2SGRr?=
 =?utf-8?B?NVlBVFdjV3VieFJXOXNrVHR1WWw3bytTRjUzVTRndlh3ZEpJcDFtSXFrbmxi?=
 =?utf-8?B?RVFGa3lySTBrRCtiMkJQY0J4WWJIYWpuYmYycGQ3azJSYXl0MFlCSkNaVFVP?=
 =?utf-8?B?ZFpVdFBNaEhkd3JudWlldnBMOTNMTUd5ZUZlNjJJcEo4bEJod01CNXJJYVdz?=
 =?utf-8?B?eDRST1B1NjBhWGpZQ0pQeFRwOEk1YTJDZUR1cFJucTNKWDgza2ptVDdHdFRE?=
 =?utf-8?B?Q0tkdVY4MjBIQ09FT3NjNTRvMmpLdkpEUllJMW1hZzlRdG54SXBzaGpNUkdt?=
 =?utf-8?B?U2J5dnE1NGhBMUdoNE9ab0ltQit4SU5IMUF4VU8xMXhxNmh2KzFvU2d3NzMr?=
 =?utf-8?B?Ny9NWnJTV3VQTVVZTXp3UmV2bmMybnFwbE5zQlVocUZ2YUhRbVJpeTVXakRx?=
 =?utf-8?B?QWhxNEdWMGtXTGxJU0pLVmw5SlVVWUdWOGowZWhCNHZMZnhaWEY0endMVGlO?=
 =?utf-8?B?bWhpUXgxT3QvdWJ6bDZJYXpFdzVtSjNmMllQV01XdzJ2cGtQMjVjNmY0THRy?=
 =?utf-8?B?ZENua0M5cFJEeC8ybVI4UVRYUXJ0MHI4cDN3NmdRRUx5c0FFZXFwakUvcElY?=
 =?utf-8?B?RG8zbmh0Q3Yybm5ZQmNGdEhjQ002cE50a2NVS0RtdlpQUm4vWWVJQVdKZEpY?=
 =?utf-8?B?SUkyd1JuWGFsOHdnemlxMFJDaHRzWFJvWThTbVoyQ01ySXN5clJ1Y1lFMUpT?=
 =?utf-8?B?aE1PdjVpOGVNdnExWUt0cG0wZEl0eFhKRWZlZk1jdVpvbXJtWFdPUklIL3Bk?=
 =?utf-8?B?bU5MK3UvSmw0QjNOdDd4Zi96amordXB1cG9yTW5WS2w0Qjhqc0ZIaGM5bFRk?=
 =?utf-8?B?UVA5K1pLYUZIQmdiRFFlaUV3a05ucGRHaXAxMU5QMy9lRElGN0htdURhOE1G?=
 =?utf-8?B?VTRBZGgxcnE0cmxSTUNiYmRJR2NHRnFzaXZEaVgxVG5VQWlSL2s4UVcrNCtL?=
 =?utf-8?B?aGplQVMrWWdKdDNQQ29WTWN5a20xY0dQWUJtM2pwMkhlWm1weTJpV3docFJo?=
 =?utf-8?Q?+9g3xwk1brRte?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85defd83-aad9-4563-4680-08d95817437f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 13:45:19.1361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: du0w5sB0HUHpjaspyoTVdUwtPLvN1LQrrBohhPcoc74O3yhvHSc+czIu1fPDsRxa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4552
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 05.08.21 um 12:46 schrieb Daniel Vetter:
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
> v2: Put smp_rmp() in the right place and fix up comment (Andrey)
>
> Acked-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 27 ++++++++++++++++++++++--
>   1 file changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index f7347c284886..89e3f6eaf519 100644
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
> +	 * If the queue is empty we allow drm_sched_entity_select_rq() to
> +	 * locklessly access ->last_scheduled. This only works if we set the
> +	 * pointer before we dequeue and if we a write barrier here.
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
>   
> -	fence = READ_ONCE(entity->last_scheduled);
> +	/*
> +	 * Only when the queue is empty are we guaranteed that the scheduler
> +	 * thread cannot change ->last_scheduled. To enforce ordering we need
> +	 * a read barrier here. See drm_sched_entity_pop_job() for the other
> +	 * side.
> +	 */
> +	smp_rmb();
> +
> +	fence = entity->last_scheduled;
> +
> +	/* stay on the same engine if the previous job hasn't finished */
>   	if (fence && !dma_fence_is_signaled(fence))
>   		return;
>   

