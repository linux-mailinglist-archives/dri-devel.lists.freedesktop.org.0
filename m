Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAC35FC68D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 15:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B3910E0F8;
	Wed, 12 Oct 2022 13:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F2510E0BF
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 13:35:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5dN+TnqkttM4YT++kcJ6xYLB+pJ387Tt/oqSjkTrFY0eLetZwNy2+dd5Y8lIqMUcUXaDFFVDrUFSVwlFCng4LOrP3cxZNuNzm7USc+bMDzx5CNzmfj5zMIExqQv9Z6t0jCB7m45BWuxEpdNZcAmTFbijB0lSe7Gpj5c4aZitbCOETtPkr7yko9pGqO8usRFtmO22W9V+Py281z8X71T76BUxoolZa0kqWN4biVcGwz/1BzztB4I0QpeExQQ94iBxPHs90TZ6C1RW6GIQfJSIRkfPK8Rvq4+dpclPDCAYZwPJSDtdN37JVUZ7ucH+D5MQLIMTlly4ETFkPS8L7+e9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ies+MUqFjDZNbk0xEVZUlTutFE691KNz1r+5wLA339I=;
 b=MnhusrVkxv7fridSzrYbuJeXZ6kUOXGX+hxCjQPTd5S0pa0OEym1sx/CI7wpXknzUBtkBcL348zfRi97aKJYQEp7XhGi3vz/QAMId8hYc5C73CLU0PRmZB+AMC4QQ8+oe01d4uze63WaFCN2/wJyvrHPFw2K09hcNDXsVxu4bfQvs8DYlMZai1lgX6/OreSFF2i3ExoX1Gjy5CxTWSZYO2ch+ZUNWO9VO/31d0ej3EEObnYpGVSr5uWEZMEOxd7UUXw+v3tbv/fHcqnb/KIEoHRUq7lf8pQSOKWXnSqFgJp+dNOOKqDUZy80vputAIf5rzqQw/Mohs/CIZRDQYEA2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ies+MUqFjDZNbk0xEVZUlTutFE691KNz1r+5wLA339I=;
 b=ZT5AWgWkONKw3WgoYihaeUfQvWrcQB9DeMH9stTfslOQVWShEu2BwieSaMOBOJfQFsOsaraCzxaLGNBIU4/jhvBX64AFcrYCf+bZk0W+1KhpV8Kh6q1NVqEsAMFdZapECaLwDt3X4Hj5LX500SDpLsxl1SC/wOOl/bRbE33b9DM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB6959.namprd12.prod.outlook.com (2603:10b6:806:261::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Wed, 12 Oct
 2022 13:35:18 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5723.022; Wed, 12 Oct 2022
 13:35:18 +0000
Message-ID: <e9bc5b4f-1aac-2aad-3dab-958c5192f9e0@amd.com>
Date: Wed, 12 Oct 2022 15:35:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/sched: Fix kernel NULL pointer dereference error
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, shashank.sharma@amd.com,
 amaranath.somalapuram@amd.com, Arunpravin.PaneerSelvam@amd.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 "Tuikov, Luben" <Luben.Tuikov@amd.com>
References: <20221012132200.13011-1-Arvind.Yadav@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221012132200.13011-1-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::21) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: a53b8c99-2823-48f2-eab1-08daac569a31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2xNWTGAB1I/K3NwLZzso7QNRnoO9g32XDHRbhuKFEVmCMaEecc/v2vLZjQnGugHlfvUyxFsxHmOPihF08H9S6GHgwdzCEOALOrVOAa4qamyM7xBWhfifIYCyH5lnafkFABLKcLpwyGj7VAXz/3KG7f4jZGazn5JKa7gvNBxr05cZz8l5KzoqFZLrItVcIOJhseHVsTqu859hqN49EI+3OtijAm+J9+74zfqbPw+cr0HBhaUkbmmbBXRChZJDRogF4zJ/OjqaP4oRhVpb12/YU/tGZxx0fTSxJl8Y9KYSZsNpu6It//f4mhawYv0BxYh3oqHOGx1PYTNeIKN9Eay+pfKOG9FsgCQvsUwvUJpNVJPuaN8c8igmdgRT++eC2mYAPAfWnh93YFaslIPNr+j1LZ7ZXf97ED0AkDJ3GnhQwtRuzvtx/wF/kITz7Tbg/b801F1J4scEgsUoXKkOtUld0HlDNVDk6F+03YVrFZmTBqul/5qSaxR9kjLMH9EOPVbMm0CsT0wgRbQLI3yj2wlzcs/9Zt6og0oz+ZEJBCExOLd2sH3Hxb3O0Klvd3Zlkw09BCbfd+tQvkb7wgQrErLJzJsxlGdjRhGbia3ro0aKQsUzdGenQCjkMtKTWz1ncLNohxacfD3fa4frbVkWWTr+JfmY0wkAmwEOyGBlU7Dm+1RU1Jmd2RwHXHGrdYlXRStQDpuM/bOf/vDHShc2diEmjxPoDx8qkcuN0H7rfr/ohCn6s23BBvx2ChBs4n6kLlJBGYWgqAnHmbOyxiCnemUs4dkEAnZufQyEf0SoJBzHP5pouSzJ+symyE7GeJh2crGv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(451199015)(8676002)(83380400001)(66556008)(66476007)(6636002)(6666004)(36756003)(478600001)(41300700001)(66946007)(8936002)(6512007)(31696002)(921005)(2906002)(186003)(86362001)(31686004)(5660300002)(316002)(110136005)(38100700002)(2616005)(6486002)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTE4cXBIdkNPOGxFTExKUHpYOTlEcGlWUCtRLzI2Um9FZ0c4bU9SZDBIODlE?=
 =?utf-8?B?cXFkYm0vVGFzYSt5Nm5HLzBQdHhqelN6bXhyL3VmU1ZBZDN0cE04azA1RW5o?=
 =?utf-8?B?SnZwL3FsSVdJcFgzMDB6YVFKVmVoV1FxcTRMVURkVERidkQ2U2lTZEJUQ25t?=
 =?utf-8?B?WndXemg5WE1pZ3hOcUFPaHJMQS9DNzBsVDVBeERRSU5IOVpLSWNaYnpaVm50?=
 =?utf-8?B?YkZWeVdqMWsxa2dWYXlBOG5jZ1lEZlNKNk1TOHVQdHJNVmZJTUQvdjZlWUhF?=
 =?utf-8?B?RjhudWpTVWpZQXdTQzdVMEJhL2oxQ2swc3V0V0JwVVhjUXllUkNEUGtDOHow?=
 =?utf-8?B?NXc0TlZkK25IeWdOSUVvWVo2dVM4Q0RZeFZLRUN0cjlDZE9HZTdEMlM2R2lJ?=
 =?utf-8?B?UGc1U0xKS042OExxeTBpcVNhV0N6WG1STGtJUytzMG1JdnMvOHVsL1NHOVp6?=
 =?utf-8?B?L01WV090bXM4TThpbmpSSkJGMGV3emdhYWE3NDlJdDh6TW1jWEpvS3ZWaytV?=
 =?utf-8?B?MGdTcEN1aGhpeHd3SFNMN25GTndKeFNJQWRxaDgwZkVPZXVwVnhBODRsZ3pO?=
 =?utf-8?B?NWprMTBsRDZsSVh6Wkh3cnY2U2NpRHpxbEtpeVhHUHBlNDBtTkd0Y3Z6bEF1?=
 =?utf-8?B?R1VZNkIzOURyZmsybkR2N3ZTWlptT3ZTT3NRUmNSRWxHYkhZb21KeTBQNFNp?=
 =?utf-8?B?MXowVTVmdDIzQjNCNWoySUZGb0JMNzRuOHYxOTYrN0xFQzgzRFBveHBUM29K?=
 =?utf-8?B?SFR0T3dZWDFCdDZWa2N3ZFhCWXVzZlpmeVN4VGM5ZWtYSnNHQVB1UkxTd2Jl?=
 =?utf-8?B?alYxbXUxcUJ0WCtBMWF4SXY5dVVkVXgrZS9GN3M3aG00aldBaURMTldIaTA4?=
 =?utf-8?B?c0xtaFphVUZBdmdMR3ZuTVZqT1huTnFMRDFkRWNkd3krNTkxdzMvS2loYy9v?=
 =?utf-8?B?Y3ZiSjZHOVJCQkhKWGJyUUFveFRUUnh1RDhoWE13Z1pLT3BZTm1QcEVWcG9Q?=
 =?utf-8?B?ZGk4RkRndXpYN24vN2hadHM3UFRXeURMQVlyTU14MmQ0Z2tObi92Ynd4OGZ0?=
 =?utf-8?B?Ri9saUMrMGJWTTFpenZadG5EMlMxY2JoU29ocXdzMWI0ZmovbnBlZWZrRzVw?=
 =?utf-8?B?aXpGZjJWOEZIZWRUcEN5UGN1QnB2eUFPTUhIQURTRE93NURmRm1EVXJOWnBx?=
 =?utf-8?B?K0U2WVBIa0dOTVZoVjNJUXBzNElPcFF6dHBKWHI3bkNwdHBVL1BCdVZSSExX?=
 =?utf-8?B?Yi9hclgzbE5CcHpZNFhGWSt4eTFVSUpzVFFSQ0F2Rm5qTXNLdjlQY21zOXRl?=
 =?utf-8?B?azJKL0NiNTJseUkydDFnY2dlY2t0YVp4VXRIYUpBUEQ5c2x6b01TM1o2cVlt?=
 =?utf-8?B?eVpYTy9QTnRwZk5qUnJ2cDVLbEZqS1dCQVhFOVhhbmxQRDk4WVdnVTZSeklQ?=
 =?utf-8?B?V01CV2s1cUtJNnlCS1dEQUZjTTZVN1dHVlY5b0R3OUJDaVVUb0hxYXVPUHhp?=
 =?utf-8?B?K3A2K2dLLzNLSEZWQkRRRUNKVFVUV1JOa1pTM0hFcS9oalFCMTdiUlJ4ZmNz?=
 =?utf-8?B?Q2pFdVNWK085THNidXBUOGRuOXRyenRrVVRJRzV2R0Jac05VaERsamVWSVRt?=
 =?utf-8?B?cGpSNEJWZWpmdDdWcnFQb1I4Z01ZcjdYR2trYzBRY2w4MFFJc1FVSjhqTVBM?=
 =?utf-8?B?T0RTQ0JPOXVqbVhSc1J3TUtKZjdoSkRRU1djUFR2Yzg4UTdoWWQ3T0tqMTNJ?=
 =?utf-8?B?YmR4b2NieDJhSnhmQUtLdi9CWmgvVFZwLzl5ZTRxZGtSak1qYUxnbXk5d2t1?=
 =?utf-8?B?cFlSZThhcEJZQlNVdi8yN3d0dFFMSlhqeTZrNTFmdC9uT2FZVUZHQWExYUQ4?=
 =?utf-8?B?N3JEZk5KdTQ5UkJTYUdHaGpkenZZUlFVK2U2N3FmV2VvOVZ5RnNuYS9JeStn?=
 =?utf-8?B?MS80T1Bta2ZWU1B5QmppcnFvRjFCUGdrVStESytpKzQ4eHN1K2Nlek1QMDBh?=
 =?utf-8?B?MTlpYzhlcVduWnVXZHBtSDl5dy9LLzYwNHMvMU03NTRmUUY4YnBVemM0V0VI?=
 =?utf-8?B?a3Rwd2wyWnNNbDA4M3hleng1aVdubnlNWWF2ek1HNDFza08xY2dyMExWOWhF?=
 =?utf-8?B?cE1tS00va3dFWTk1Q0xabmVPeWtnTzkzYlBrcEtxYnp5QXJEdnp5RmIwbGhW?=
 =?utf-8?Q?LqGnyXeiIUNfafrIIOYKDqzmwUkqAEmZPZ3Q8DWi71Wc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a53b8c99-2823-48f2-eab1-08daac569a31
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 13:35:18.3598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAUfnZGfY2nbd5ppOjkc1Df9lTE4Jb3AU0n8hR86IdrQssJ93C0uFx7ihrWP44Ih
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6959
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

That essentially looks like the right approach, but I would go a few 
steps further.

I think we should add a drm_sched_fence_set_parent() function to 
sched_fence.c and move a good part of the handling into that C file. 
Just a simple signal function which tells the scheduler that it should 
decrement it's counter and wake up the main thread.

Regards,
Christian.

Am 12.10.22 um 15:22 schrieb Arvind Yadav:
> This is purely a timing issue. Here, sometimes Job free
> is happening before the job is done.
> To fix this issue moving 'dma_fence_cb' callback from
> job(struct drm_sched_job) to scheduler fence (struct drm_sched_fence).
>
> BUG: kernel NULL pointer dereference, address: 0000000000000088
>   #PF: supervisor read access in kernel mode
>   #PF: error_code(0x0000) - not-present page
>   PGD 0 P4D 0
>   Oops: 0000 [#1] PREEMPT SMP NOPTI
>   CPU: 2 PID: 0 Comm: swapper/2 Not tainted 6.0.0-rc2-custom #1
>   Arvind : [dma_fence_default_wait _START] timeout = -1
>   Hardware name: AMD Dibbler/Dibbler, BIOS RDB1107CC 09/26/2018
>   RIP: 0010:drm_sched_job_done.isra.0+0x11/0x140 [gpu_sched]
>   Code: 8b fe ff ff be 03 00 00 00 e8 7b da b7 e3 e9 d4 fe ff ff 66 0f 1f 44 00 00 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 49 89 fc 53 <48> 8b 9f 88 00 00 00 f0 ff 8b f0 00 00 00 48 8b 83 80 01 00 00 f0
>   RSP: 0018:ffffb1b1801d4d38 EFLAGS: 00010087
>   RAX: ffffffffc0aa48b0 RBX: ffffb1b1801d4d70 RCX: 0000000000000018
>   RDX: 000036c70afb7c1d RSI: ffff8a45ca413c60 RDI: 0000000000000000
>   RBP: ffffb1b1801d4d50 R08: 00000000000000b5 R09: 0000000000000000
>   R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
>   R13: ffffb1b1801d4d70 R14: ffff8a45c4160000 R15: ffff8a45c416a708
>   FS:  0000000000000000(0000) GS:ffff8a48a0a80000(0000) knlGS:0000000000000000
>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   CR2: 0000000000000088 CR3: 000000014ad50000 CR4: 00000000003506e0
>   Call Trace:
>    <IRQ>
>    drm_sched_job_done_cb+0x12/0x20 [gpu_sched]
>    dma_fence_signal_timestamp_locked+0x7e/0x110
>    dma_fence_signal+0x31/0x60
>    amdgpu_fence_process+0xc4/0x140 [amdgpu]
>    gfx_v9_0_eop_irq+0x9d/0xd0 [amdgpu]
>    amdgpu_irq_dispatch+0xb7/0x210 [amdgpu]
>    amdgpu_ih_process+0x86/0x100 [amdgpu]
>    amdgpu_irq_handler+0x24/0x60 [amdgpu]
>    __handle_irq_event_percpu+0x4b/0x190
>    handle_irq_event_percpu+0x15/0x50
>    handle_irq_event+0x39/0x60
>    handle_edge_irq+0xaf/0x210
>    __common_interrupt+0x6e/0x110
>    common_interrupt+0xc1/0xe0
>    </IRQ>
>    <TASK>
>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>
> Changes in v2: Moving 'dma_fence_cb' callback from
> job(struct drm_sched_job) to scheduler fence(struct drm_sched_fence)
> instead of adding NULL check for s_fence.
>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 23 +++++++++++------------
>   include/drm/gpu_scheduler.h            |  6 ++++--
>   2 files changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 4cc59bae38dd..62d8eca05b92 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -253,13 +253,12 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>   
>   /**
>    * drm_sched_job_done - complete a job
> - * @s_job: pointer to the job which is done
> + * @s_fence: pointer to the fence of a done job
>    *
>    * Finish the job's fence and wake up the worker thread.
>    */
> -static void drm_sched_job_done(struct drm_sched_job *s_job)
> +static void drm_sched_job_done(struct drm_sched_fence *s_fence)
>   {
> -	struct drm_sched_fence *s_fence = s_job->s_fence;
>   	struct drm_gpu_scheduler *sched = s_fence->sched;
>   
>   	atomic_dec(&sched->hw_rq_count);
> @@ -280,9 +279,9 @@ static void drm_sched_job_done(struct drm_sched_job *s_job)
>    */
>   static void drm_sched_job_done_cb(struct dma_fence *f, struct dma_fence_cb *cb)
>   {
> -	struct drm_sched_job *s_job = container_of(cb, struct drm_sched_job, cb);
> +	struct drm_sched_fence *s_fence = container_of(cb, struct drm_sched_fence, cb);
>   
> -	drm_sched_job_done(s_job);
> +	drm_sched_job_done(s_fence);
>   }
>   
>   /**
> @@ -506,7 +505,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>   					 list) {
>   		if (s_job->s_fence->parent &&
>   		    dma_fence_remove_callback(s_job->s_fence->parent,
> -					      &s_job->cb)) {
> +					      &s_job->s_fence->cb)) {
>   			dma_fence_put(s_job->s_fence->parent);
>   			s_job->s_fence->parent = NULL;
>   			atomic_dec(&sched->hw_rq_count);
> @@ -576,15 +575,15 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>   			continue;
>   
>   		if (fence) {
> -			r = dma_fence_add_callback(fence, &s_job->cb,
> +			r = dma_fence_add_callback(fence, &s_job->s_fence->cb,
>   						   drm_sched_job_done_cb);
>   			if (r == -ENOENT)
> -				drm_sched_job_done(s_job);
> +				drm_sched_job_done(s_job->s_fence);
>   			else if (r)
>   				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
>   					  r);
>   		} else
> -			drm_sched_job_done(s_job);
> +			drm_sched_job_done(s_job->s_fence);
>   	}
>   
>   	if (full_recovery) {
> @@ -1053,10 +1052,10 @@ static int drm_sched_main(void *param)
>   			/* Drop for original kref_init of the fence */
>   			dma_fence_put(fence);
>   
> -			r = dma_fence_add_callback(fence, &sched_job->cb,
> +			r = dma_fence_add_callback(fence, &s_fence->cb,
>   						   drm_sched_job_done_cb);
>   			if (r == -ENOENT)
> -				drm_sched_job_done(sched_job);
> +				drm_sched_job_done(s_fence);
>   			else if (r)
>   				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
>   					  r);
> @@ -1064,7 +1063,7 @@ static int drm_sched_main(void *param)
>   			if (IS_ERR(fence))
>   				dma_fence_set_error(&s_fence->finished, PTR_ERR(fence));
>   
> -			drm_sched_job_done(sched_job);
> +			drm_sched_job_done(s_fence);
>   		}
>   
>   		wake_up(&sched->job_scheduled);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 1f7d9dd1a444..9a96d49dfd75 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -281,6 +281,10 @@ struct drm_sched_fence {
>            * @owner: job owner for debugging
>            */
>   	void				*owner;
> +	/**
> +	 * @cb: callback
> +	 */
> +	struct dma_fence_cb cb;
>   };
>   
>   struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
> @@ -300,7 +304,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>    *         be scheduled further.
>    * @s_priority: the priority of the job.
>    * @entity: the entity to which this job belongs.
> - * @cb: the callback for the parent fence in s_fence.
>    *
>    * A job is created by the driver using drm_sched_job_init(), and
>    * should call drm_sched_entity_push_job() once it wants the scheduler
> @@ -325,7 +328,6 @@ struct drm_sched_job {
>   	atomic_t			karma;
>   	enum drm_sched_priority		s_priority;
>   	struct drm_sched_entity         *entity;
> -	struct dma_fence_cb		cb;
>   	/**
>   	 * @dependencies:
>   	 *

