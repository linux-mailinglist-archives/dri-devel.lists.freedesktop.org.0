Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8AD31DCBE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 16:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493436E560;
	Wed, 17 Feb 2021 15:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3125F6E55C;
 Wed, 17 Feb 2021 15:54:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8DIoK9TsjezmyjhbiQz4jxepT3wRlTwFVbpLg6cizREcIeaHEYE7db3INEkJBsA9OEQBkUdgjNsH2iqpdf0tlwVbVZDZi3BSxrtzQ0sI1Vji2pLCHzJC3WgeI0Ty26VoBesDrsF/zggdWPZpWIhAqPX4nxA72jDHZmTh88jyUsEdEOphcZ1PtW/JBvodzibz+IIXJIRXbzU0jbFBBhUHGGhohvcMHaeGCcORmBCdSzRvLfjz8d/vKyWxNYrBDfi4VbE1+3gEWHBYMYS99AP19sIs2YhscGm/JkBjhytgjCJAlLX2D8gi0cyzsf9tGeCZfq1Rev3B/6beRZ0rgtK1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+ygwSDFmjDRr8KeYaYogAiLt1LsD16bJSNRxmNK6mk=;
 b=cFMlYCDV1RS8gDUksSYTby1xV1j6QqbOhpmPungdwOzSyMiYXBuT1n+UsuoCDVphDfan7XGGY2d6+FZv+mnHVb5WyE7EdNLZiu1/gCpI3VdzBAhD0eKGXyxyXEdqx1QoaZOmtdFqpL4hZv9zJD5d1XxSQUAnH+69z7l6sXEXUVk9i+rUtLYGwuOnNYwg+dyqYov2xPZrvIegXOvLUoGGaNxWPenQNL+q20rvozVWqNXdGXBdGqEtywoKHVvnEWtU00jVbt4br0IFHW8VjR+EWDS3yduhnUtteJ+f0pn0SWX/osTkbfyqA6giklFFze0KsSwyWPlaN9hmXqqoQG2ajA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+ygwSDFmjDRr8KeYaYogAiLt1LsD16bJSNRxmNK6mk=;
 b=Yo2C1B9dv+FH7xe6LGsxo60LE2GhWJbPBpIK6AvaeCfsQAVBLZfR2Z2hjMgoblfGNVgCecHiTxDmCB++QWeH8wJuYA6xcKPcl6L6aUIPGTMT49PM307Libh6683RBN6O1VNZKXVevEoyqcKLsPagBmyG9GwKci5YVRiLgQ+k8gc=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2477.namprd12.prod.outlook.com (2603:10b6:802:28::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Wed, 17 Feb
 2021 15:53:59 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3846.025; Wed, 17 Feb 2021
 15:53:59 +0000
Subject: Re: [PATCH] drm/scheduler: Fix hang when sched_entity released
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <1613495262-22605-1-git-send-email-andrey.grodzovsky@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <006b8a4a-a936-1b90-40de-2ce918e2b79f@amd.com>
Date: Wed, 17 Feb 2021 10:53:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1613495262-22605-1-git-send-email-andrey.grodzovsky@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:d587:8aea:4bdd:18b6]
X-ClientProxiedBy: YTBPR01CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::47) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:d587:8aea:4bdd:18b6]
 (2607:fea8:3edf:49b0:d587:8aea:4bdd:18b6) by
 YTBPR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.38 via Frontend Transport; Wed, 17 Feb 2021 15:53:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0052d233-0d63-433a-3064-08d8d35c3d07
X-MS-TrafficTypeDiagnostic: SN1PR12MB2477:
X-Microsoft-Antispam-PRVS: <SN1PR12MB24776F4549A93586E1DEB5EBEA869@SN1PR12MB2477.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2iDyhPiKG5EJIf230S2dPxU4nB5affwg8TDDGtvWUlTwKm15CW8vzlC6uZrD31wZXo33fvaPdNKh3uuraANjsMwik2amF3QIWmNXOXaZS2JmHfxDqaTK5SzX9OoQXhRfx6OXQC0JVYIFehcZGXADs+y/GZOwRYHniH3AzBibAtgnP4/DDn+sQnpN5CCwKBXkiNXUlkQQdMlhqiBBbNFYkOb8RVgu6gEQdjo092t3yq8eC68KJtOBYgyOj+jvv1sdKzpx4DAmBLBbE8Dguot8km5rXdd919eXZttXDYWVwH/yUHYjoZ00+dfAeWdd++2o7RKf/gKa1ImpapNyWBIKNrClR1gfCRy1EaSFWCit7jf3yrZ1nQOmM3KykYOzJKUob26l/P/C31zuEJ7vl2H6nTeLbYjk8KAi9RJgx18lXNbFVIm4mAEk/BiTm/KRXz9rDaDvc0e2c+KPotM0x/TYd2tFUFAPmICjdznjbU7M9oGg7NsxlWC9Qb51MutrGiK0Mobjb/KW9b2xNnxsnMH8o4UO5DvVpOuE4+DI//WMwYnFW2R7v23PBgyuxFePxa3RXRrFi8dnlEB17e7S4WQQHQuGd1JkdjWMhGgFB0kwMn4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(16526019)(186003)(316002)(52116002)(5660300002)(36756003)(66946007)(66556008)(86362001)(2616005)(31696002)(8936002)(53546011)(31686004)(8676002)(83380400001)(4326008)(66476007)(478600001)(2906002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VTB1VXV1cEhHc1RqR29JUXluSHJYbzk0c0lycDA4VDFPa0NKTzJ3SUVoc0Yw?=
 =?utf-8?B?V0IwRlFEcmtTeENOU3hpTGljc2V0MFZhTWNQVzJXYmp2SVB3blVsVVhKdFFl?=
 =?utf-8?B?cC9ZMkNQL2x6UnY0dnFzeXpZSnVyZE9NcCs3aGtlVlgwRGVZazdPcm9vb2pu?=
 =?utf-8?B?ckwzeFNzWjVIbFRXamFIdUtCVVY4b1VEVHd2RSs1ZGhoQWNTUHNpMmZISnNj?=
 =?utf-8?B?djhpV1F1NE5ubVNJQ3VGdUdydGppUzZvMkdqUkxBYWcyL3ZEVEJaU0wzK3d4?=
 =?utf-8?B?WTl4Nng3eW95Z2VEY1RiL1REUXZZU1hqNU43dEZOSnRVMmMra2hhT09vUzlO?=
 =?utf-8?B?QnhUQnpjL240SUcxR041QW5jM0t2RlBLYzYvZFl4UVNwcDJaeGJaOUZpZWRp?=
 =?utf-8?B?bjVMQWFuYTBWanhpeE56NmtDS3JneTUzZXhCcFhxQ0tKeFY3QTBINmJ2TGx4?=
 =?utf-8?B?TmFiNFJHS1JFbGpXUFpndTd0aFJCRUpjd1F5T0NzekdzTkYrUi9XRUdPZTV4?=
 =?utf-8?B?ZTEwek1UTW9neklOM0swU242d3ZLS1hhRWxLaWJ5QktxRWFVRm8xdHpqMjVy?=
 =?utf-8?B?MTNBTFlpWnhhTDUwYVR2ZUZiRmVaTVNDSW85U2ZTcmwwRVpoWU1aUlYwOThj?=
 =?utf-8?B?dklucDF1SHVNT0RDRDI2eFdieTRtaUU4Si8xdkJQNTFjQ01ERVVxWmJkZUJa?=
 =?utf-8?B?RElyQWhZYThrQktQRDFlOHdpQ2dSMkdrYkE5WHNxN0NIeU5xMFRocmdZRm5D?=
 =?utf-8?B?cVd5NWRlVEY5VnAvTnoxNG5zeHZqZUhiYzVwNEliZlpVRFNuZDZpYjBPYjdm?=
 =?utf-8?B?SENrQXRIWisrbSs5aFdXRnZaNzVJVEdnS3ZSQS9aWHltRDFhMUVtVHRONXJU?=
 =?utf-8?B?b2hRQWZMWVYrckEyU052eEFTcm1lRnVXMzJnZ3R3VDAwVnA1WGd4R2RLQ0JT?=
 =?utf-8?B?NDk4VDNkaHBISmhxZEk3U0VzcnNqc3JSTVhCNU5PVE11NnVibDVseVhLMkJK?=
 =?utf-8?B?T09aWU5UejRkby82b21ZbkNKclJJVWYrTXhieUw1TEVtVlh2cUVZbGoyUjY4?=
 =?utf-8?B?ZkFNRnZTTzFPSnJiZERkcnljS05kNzJxbi9vUjU0TW1OU0NUSlBlbDRBZmd6?=
 =?utf-8?B?SExEdk4wdXpCOUpWTkp0OEdmSzRsY3pSbmJhM1k3SjVqeFBUSElwSDUyQnRH?=
 =?utf-8?B?KzhzaXQ4WGNBNzhwY0g1NmxvZmFWRHB5Um1qaFNZYXI4M3hSNElCNDFzZFF6?=
 =?utf-8?B?UUF2ZlR1SVFkaGFNVlcyck5jeXRQcnZrVkF1OHdPZTdpUkNFbi93b2FWQWtQ?=
 =?utf-8?B?ZFBjTGlUZEkvM2R0emlMSEtEamE2NkJIMFIxdDZFSVhQRDI1VDY1M0FFWVRH?=
 =?utf-8?B?QTNQT2RhYlY4T1hySTV6WCt2WCt3TEhzanlJMXhES2VFT1J6NTA2UjdMVnNB?=
 =?utf-8?B?a2VTZ1c2TS90dXc3S3N5WXlIUUx5Qk85U3JvY0VaeXNRekgydnpNai9ySVI1?=
 =?utf-8?B?WGIzREl3WThRdHpLTEQvT0xVaWwvTGlKVnVkTVBxLzlRWDhMU2UveGhnZFdh?=
 =?utf-8?B?UTVqYUFoUi9TNVd2L2tRQm1rV2g3ajQ3eW1LNzQxRk5vRW0xVmVwWnQwaDQ5?=
 =?utf-8?B?K2N1S2JmQURGelRob3I3dUZsUGJNZlBXSnhiT21rVEVqNlV4VXVLYlJmUlQz?=
 =?utf-8?B?dGxwVzlQVUhDUm5wTFQ2NkFzRTdXSElOakNpUDZjTzdQVERjM0FPZklncGk2?=
 =?utf-8?B?d2JjRDhXWUR4UTlPUmFuMjF5a24rTUYzRk5qcUk4M2VES3ZZSk1PSlJld1BV?=
 =?utf-8?B?eis4VUlSSWp4ZE9IMm9Cb2tnbFJRVlJXeThDa2dhMThESGsyYVorUmhVdUVS?=
 =?utf-8?Q?YPV3S689R7ZH0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0052d233-0d63-433a-3064-08d8d35c3d07
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 15:53:58.9337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3E0uzheQzl6fOEFtpZnBODIT+RJVPqWr8F84OONTFYY56/hYovZUy413E6AvJYLwolVShZ4+Z3Tu5yIvI5bTyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2477
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
Cc: ckoenig.leichtzumerken@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping

Andrey

On 2/16/21 12:07 PM, Andrey Grodzovsky wrote:
> Problem: If scheduler is already stopped by the time sched_entity
> is released and entity's job_queue not empty I encountred
> a hang in drm_sched_entity_flush. This is because drm_sched_entity_is_idle
> never becomes false.
>
> Fix: In drm_sched_fini detach all sched_entities from the
> scheduler's run queues. This will satisfy drm_sched_entity_is_idle.
> Also wakeup all those processes stuck in sched_entity flushing
> as the scheduler main thread which wakes them up is stopped by now.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 908b0b5..11abf5d 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -897,9 +897,40 @@ EXPORT_SYMBOL(drm_sched_init);
>    */
>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   {
> +	int i;
> +	struct drm_sched_entity *s_entity;
>   	if (sched->thread)
>   		kthread_stop(sched->thread);
>   
> +	/* Detach all sched_entites from this scheduler once it's stopped */
> +	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> +		struct drm_sched_rq *rq = &sched->sched_rq[i];
> +
> +		if (!rq)
> +			continue;
> +
> +		/* Loop this way because rq->lock is taken in drm_sched_rq_remove_entity */
> +		spin_lock(&rq->lock);
> +		while ((s_entity = list_first_entry_or_null(&rq->entities,
> +							    struct drm_sched_entity,
> +							    list))) {
> +			spin_unlock(&rq->lock);
> +			drm_sched_rq_remove_entity(rq, s_entity);
> +
> +			/* Mark as stopped to reject adding to any new rq */
> +			spin_lock(&s_entity->rq_lock);
> +			s_entity->stopped = true;
> +			spin_unlock(&s_entity->rq_lock);
> +
> +			spin_lock(&rq->lock);
> +		}
> +		spin_unlock(&rq->lock);
> +
> +	}
> +
> +	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
> +	wake_up_all(&sched->job_scheduled);
> +
>   	/* Confirm no work left behind accessing device structures */
>   	cancel_delayed_work_sync(&sched->work_tdr);
>   
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
