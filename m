Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C666E3B7117
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 13:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE874898CE;
	Tue, 29 Jun 2021 11:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2067.outbound.protection.outlook.com [40.107.212.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551A2898CE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 11:04:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqEMZJ9r8kqeAnIA920Sw7LKBTZ28bkHCt9xUh99esJ6J5YUD1RvbcEXdfuJweaDkkYO8/xhrjUycyhKOZs+Y7Zas78GosmVaio8Ffg0eb6I4ye3Zzt3l+wtm87d10QjkIHzPY3JEqsXvdXBldHJStm7SdA78XKJKQbGQzibKAFM7BXBoreb/txRV2jMtq2mGuRWUPmDBR1JWUXdyjrFh3W+/mgkD+/8JdpHE4FKgTuWqRrugN5dfamZqnh4vSiAulH2wWZihuFk53oiOvMEh/KenQPTNhUhEi4Nx2uRfbsskYIV3qkg/YLsZ1uXlezaGmhWcOER0OTOUn6j8STGUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8jAILthVT9yWTzdBYvXlLE7J0ouw1VmE/VpfNGwx0s=;
 b=YDh0HoDDLkBZUzkuHAlmz8Hraqj7XZuqnureTjqDiokEyflmjUgV1Pif3WOaptW/9/8dblJdOSsfs5I8c09VI1LANVtQsxcJZrJzkMNev+VdKVRmY/6YeWNwq6I9RBKg3sAMqyxNMjqjybDBt/qbN50BNseaHTJ2yHwZdNtSGi/StP9XZGnWC0qyNfxsowNkIk3Rs44sBsPVLfZMBinyqwFFN89dgOkjdz6x0h4GsuHIShA4jEKVXYQaoITkGw6xnMANZnzK4SXnQXafMD3W1wSMvb5U3CXptTbJS5Q8YZgspdZJlHtg47HHRuQDm+mTv3RNOfVGVPe/kVD49Vo+vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8jAILthVT9yWTzdBYvXlLE7J0ouw1VmE/VpfNGwx0s=;
 b=H2Qumm92vEF7e3GLicl2mGDax7zoQ0FSUTK434JZKDU+aZC/ROrzREMDejYIs5UgElplQzcL5mEYTIJXJ5e1vhcZW1/sa5TUa3eg9dcmwXF9MLziB1+tT1Oj2JvDbNOMkAcPBsc9Cgf1IGlXld2nDJurd6zICmA4WR7pTEVbcYk=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2515.namprd12.prod.outlook.com (2603:10b6:207:40::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Tue, 29 Jun
 2021 11:04:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 11:04:05 +0000
Subject: Re: [PATCH v5 02/16] drm/sched: Allow using a dedicated workqueue for
 the timeout/fault tdr
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20210629073510.2764391-1-boris.brezillon@collabora.com>
 <20210629073510.2764391-3-boris.brezillon@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5b619624-ca5d-6b9a-0600-f122a4d68c58@amd.com>
Date: Tue, 29 Jun 2021 13:03:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210629073510.2764391-3-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:acb7:5516:6a55:2bf5]
X-ClientProxiedBy: PR3P195CA0002.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::7) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:acb7:5516:6a55:2bf5]
 (2a02:908:1252:fb60:acb7:5516:6a55:2bf5) by
 PR3P195CA0002.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.21 via Frontend Transport; Tue, 29 Jun 2021 11:04:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb860cf2-ac28-487d-63c7-08d93aed9c57
X-MS-TrafficTypeDiagnostic: BL0PR12MB2515:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB25159F5638F70D43076E0F0083029@BL0PR12MB2515.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gJQHECX5O01n4i0ltDGxDC/13HH0nZe0NUUk5922peYvgrxO7XiRQL1YT2NcSx1OKlzrunuD3iuco5IanOOGLwbcX/3T4sa31V6Xep2rr25Uiu6MyFuvUgkc2eBbqe5SwBs9NsFyAGXERVw5rMRm0XcQIADhZBnVj1Z60L1Ls1/ZEUuWgcAI/KEL3VzJuKwYXWiCD/Z39dA9NMxhKKPYhOtR14rk0OdxAsSk9eSp1HE4sW5jb4XZ+aZxdP9VeM+93zv+X97GwThzPkkRVCPXt9nzwyuMLFQOa6oFvM7UpbaU5xI9BXuHiNdxZSK+fT+I/byjek7HBcYvqWCajFAb2hhSx1QGj6rMrYBIavki2AzlknFx8xni2auOIbCUmn3wDcAktcLYw8+MMZnbiMIP6UD7kjQ4LuSebCBYOHsQLs+s1806V26vL2BR2F+csGyvQTAnIKbS7EB6IrYURJUAb3L4Z/djWJmQA+m67HxrhIGlFFr6eSv7lwyFDzHBQzp6V7hUdbEBhcy0Jt4RYDPMsDlcKjECWNOMlkNNGwepxugGm5kPh0bJB+Gt04oRhIDI0B8SEY9Nk8C6w6eQ/6bI+mT7hoITNAzngBneQ8hhyTA4yoLuZWWCNCPJs4BpVbtBsCanrs/lrVW4jXRo6ljj2RovGJSsqr5hdif/WsK55PT9ErjtiO5h7GhLE80U4PBGxbidGVGEllue0wmbAzx++aD3SAg7N/y2jWc2ZjiMszYRM3UnyzVR2qpcQk6sjJd0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(478600001)(38100700002)(83380400001)(54906003)(316002)(66574015)(16526019)(7416002)(5660300002)(186003)(8936002)(31686004)(2616005)(2906002)(30864003)(6486002)(4326008)(66476007)(86362001)(66556008)(36756003)(8676002)(31696002)(6666004)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eERZTjlPZWJJQ1lLNytiMDl1M3dWWFRtZUZKTmlLdFpPMXZxS042d3owWEp5?=
 =?utf-8?B?ZitWaG95N3ZFbTl1UmlXWGR1V0pNNXVrbVVXUWl3YlVNWFcyM0pEZ1JJdGVY?=
 =?utf-8?B?MVh4aSt6TDVZK28zNjdTSEtWbHRKSVdJRUwyUEtDK1lLNW92SmNlaXFLd3pa?=
 =?utf-8?B?dzJ1VGFEUDRTWlZMN3J4bkNOUnVKS21taW5mNHExeGlZanNSMzVvcm5GOFRk?=
 =?utf-8?B?Zkx3bzZwQlB4Y09nSXJUWGhDVitla1I2Q1RtL0xxVFBLL2xFa1FVSGtSU2NC?=
 =?utf-8?B?b2FIcjAwaVRHdG9ZQ1A3cTdTTTUyR0txL0pvOG80NEJVaTNUaW1GbWc3Q0xo?=
 =?utf-8?B?eFcwWnM5UUdINGgwMUFjVGdvVW1vYVlhMVlEcVBXcysreUIvVkpxN1VUc2M0?=
 =?utf-8?B?QVNGeWdoeHhaMmJRNEl6ZXRnSDUyUGM5OWdMU3YvcVMyOXNpZ2YvS1ZvY0R0?=
 =?utf-8?B?QVJEVW9lbmZBQzA2dnZYQjJSZTFTYlJpaEthVnFndzEzOEl4Q1pSSFVEL0pl?=
 =?utf-8?B?QUJnbFo4anNsbVkvVCs5UExlellPbDJKa3FiaEs3ZVhiL3E3eE5hb3VPdDdP?=
 =?utf-8?B?NytpTjVva3NRVUJPVWcvUEJZTEhVNktpeEQ2QTVoeUJ6UFNhcUh0S1FBenh1?=
 =?utf-8?B?ZktKTkxQaDNCZnFWUHZiK2xJWGl4QlRralhjSk1iajVqTnlCODVFaTkrcS9h?=
 =?utf-8?B?RWliU1JwbXNHTFBVeGxzUzRLSW94c2ZxSHcrZDR5Nm5CdzhuazRNU0k0VEdU?=
 =?utf-8?B?ZUpoeE5QR3VmVEp5K2t4UFJiMU8zakttZE0xbk1JajM0VnJ6dmlyVU9zSFBz?=
 =?utf-8?B?M2x2V05WeE1zRjV5ZkFwSW96TVpEZW01SFlaSk05MWJ5azlhajZ3VnBGNmRz?=
 =?utf-8?B?YWhIM2thYVBJbkI3M3lrNGZneDA3eGNheElsUXdRcjdnSE9vUXNTUVloaUFa?=
 =?utf-8?B?a0Y4dTMwUyt2ZWRMb2pCRy9wUDhtSmQ1VjFOYUhXT1JLdFQ5UjZwOHFOc1JY?=
 =?utf-8?B?ZUVYc3JJUHBGY2t3Uy92bkJXemhDNUtNeHQ2alJTZytzRWhlK2J5QmNhZGp4?=
 =?utf-8?B?VDIxck53Rk9Ld2VKVzFiMmhSNFVlN3JlcytGdVdjYnQ5Y0FTd1Z3aVBrQ3Ba?=
 =?utf-8?B?VFRqNFNqRG1ROHhTQzZMRUZiRFFuYzgyOGN6aVZMQWhTdEw1MEdqVHhzYmNy?=
 =?utf-8?B?b1RHZEFDaW1IR005RXRHYnAzcjMwZERQNUZ3enl2L2VCSGs3TDhndkFib0s0?=
 =?utf-8?B?R3VmWEdZeENsVlVOL2dQVWtKa0V1d294bEpPaDEyTkFDRk5HNWd2L0VSUW42?=
 =?utf-8?B?N2g2QnZ6bnlGbzlLSGFKc21Lam14VmZNamlyY1d5bk4vOVcxZDU1aENUWGRp?=
 =?utf-8?B?c3IySnFmR1YzWiszNW55bDZsTUdoelpxS1ZyK250em1PcExRQXZnRXNaQ3Ax?=
 =?utf-8?B?VGdwSGpiQmx3NWdBQS9odEZDL01sbEpFUHd5REoxbEROeVVDcFpIZ20weEF2?=
 =?utf-8?B?YUZpYm5PcVpDWm1NbWFscFVOZFV3RW4yclB5Z2s3OXhwcjBaQWZkRjZJQ0RE?=
 =?utf-8?B?SkJ4bi9Vc2JlbFlZV3piR2VFdjg5ZlpQcGUwNDhYY2R6bUJkbSs5ang1NTg1?=
 =?utf-8?B?SnBhelFQV0dQenVXM2JEYTBKZ1lJdGZxdThFQUpzWHRobktmeXdqeGMxMVNM?=
 =?utf-8?B?bWQ5MVpOcGl5Yy80L090TmFjQ2g4aUtkMVFFNzVoaTN4S2hvZTMvajlIZzBL?=
 =?utf-8?B?NmpXcUFZUnVNN3lmN1VncjVHcis2d3dKRXFYSjNnbzFyNFJ0b0hWOWhBSXRH?=
 =?utf-8?B?ektZK0tudHVCV3hPeTlWd1pLNXJmMjBlTFlSbitHMUZiY1V4UTlvYkU3M2dV?=
 =?utf-8?Q?6CiFyBBMEzuCk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb860cf2-ac28-487d-63c7-08d93aed9c57
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 11:04:05.8526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QL3IZhS+D/pMfKCR4azCiGk1HKW5Ctp8Tvphgp8pRBCvKMeMTT620LzzYDMZsm+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2515
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
Cc: Emma Anholt <emma@anholt.net>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, Qiang Yu <yuq825@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.06.21 um 09:34 schrieb Boris Brezillon:
> Mali Midgard/Bifrost GPUs have 3 hardware queues but only a global GPU
> reset. This leads to extra complexity when we need to synchronize timeout
> works with the reset work. One solution to address that is to have an
> ordered workqueue at the driver level that will be used by the different
> schedulers to queue their timeout work. Thanks to the serialization
> provided by the ordered workqueue we are guaranteed that timeout
> handlers are executed sequentially, and can thus easily reset the GPU
> from the timeout handler without extra synchronization.

Well, we had already tried this and it didn't worked the way it is expected.

The major problem is that you not only want to serialize the queue, but 
rather have a single reset for all queues.

Otherwise you schedule multiple resets for each hardware queue. E.g. for 
your 3 hardware queues you would reset the GPU 3 times if all of them 
time out at the same time (which is rather likely).

Using a single delayed work item doesn't work either because you then 
only have one timeout.

What could be done is to cancel all delayed work items from all stopped 
schedulers.

Regards,
Christian.

>
> v5:
> * Add a new paragraph to the timedout_job() method
>
> v3:
> * New patch
>
> v4:
> * Actually use the timeout_wq to queue the timeout work
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> Cc: Qiang Yu <yuq825@gmail.com>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |  2 +-
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c   |  3 ++-
>   drivers/gpu/drm/lima/lima_sched.c         |  3 ++-
>   drivers/gpu/drm/panfrost/panfrost_job.c   |  3 ++-
>   drivers/gpu/drm/scheduler/sched_main.c    | 14 +++++++++-----
>   drivers/gpu/drm/v3d/v3d_sched.c           | 10 +++++-----
>   include/drm/gpu_scheduler.h               | 23 ++++++++++++++++++++++-
>   7 files changed, 43 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 47ea46859618..532636ea20bc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -488,7 +488,7 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
>   
>   	r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>   			   num_hw_submission, amdgpu_job_hang_limit,
> -			   timeout, sched_score, ring->name);
> +			   timeout, NULL, sched_score, ring->name);
>   	if (r) {
>   		DRM_ERROR("Failed to create scheduler on ring %s.\n",
>   			  ring->name);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 19826e504efc..feb6da1b6ceb 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -190,7 +190,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>   
>   	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
>   			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
> -			     msecs_to_jiffies(500), NULL, dev_name(gpu->dev));
> +			     msecs_to_jiffies(500), NULL, NULL,
> +			     dev_name(gpu->dev));
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index ecf3267334ff..dba8329937a3 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -508,7 +508,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>   	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
>   
>   	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
> -			      lima_job_hang_limit, msecs_to_jiffies(timeout),
> +			      lima_job_hang_limit,
> +			      msecs_to_jiffies(timeout), NULL,
>   			      NULL, name);
>   }
>   
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 682f2161b999..8ff79fd49577 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -626,7 +626,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>   
>   		ret = drm_sched_init(&js->queue[j].sched,
>   				     &panfrost_sched_ops,
> -				     1, 0, msecs_to_jiffies(JOB_TIMEOUT_MS),
> +				     1, 0,
> +				     msecs_to_jiffies(JOB_TIMEOUT_MS), NULL,
>   				     NULL, "pan_js");
>   		if (ret) {
>   			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index c0a2f8f8d472..3e180f0d4305 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -232,7 +232,7 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
>   {
>   	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>   	    !list_empty(&sched->pending_list))
> -		schedule_delayed_work(&sched->work_tdr, sched->timeout);
> +		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
>   }
>   
>   /**
> @@ -244,7 +244,7 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
>    */
>   void drm_sched_fault(struct drm_gpu_scheduler *sched)
>   {
> -	mod_delayed_work(system_wq, &sched->work_tdr, 0);
> +	mod_delayed_work(sched->timeout_wq, &sched->work_tdr, 0);
>   }
>   EXPORT_SYMBOL(drm_sched_fault);
>   
> @@ -270,7 +270,7 @@ unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched)
>   	 * Modify the timeout to an arbitrarily large value. This also prevents
>   	 * the timeout to be restarted when new submissions arrive
>   	 */
> -	if (mod_delayed_work(system_wq, &sched->work_tdr, MAX_SCHEDULE_TIMEOUT)
> +	if (mod_delayed_work(sched->timeout_wq, &sched->work_tdr, MAX_SCHEDULE_TIMEOUT)
>   			&& time_after(sched_timeout, now))
>   		return sched_timeout - now;
>   	else
> @@ -294,7 +294,7 @@ void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
>   	if (list_empty(&sched->pending_list))
>   		cancel_delayed_work(&sched->work_tdr);
>   	else
> -		mod_delayed_work(system_wq, &sched->work_tdr, remaining);
> +		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, remaining);
>   
>   	spin_unlock(&sched->job_list_lock);
>   }
> @@ -837,6 +837,8 @@ static int drm_sched_main(void *param)
>    * @hw_submission: number of hw submissions that can be in flight
>    * @hang_limit: number of times to allow a job to hang before dropping it
>    * @timeout: timeout value in jiffies for the scheduler
> + * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
> + *		used
>    * @score: optional score atomic shared with other schedulers
>    * @name: name used for debugging
>    *
> @@ -844,7 +846,8 @@ static int drm_sched_main(void *param)
>    */
>   int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		   const struct drm_sched_backend_ops *ops,
> -		   unsigned hw_submission, unsigned hang_limit, long timeout,
> +		   unsigned hw_submission, unsigned hang_limit,
> +		   long timeout, struct workqueue_struct *timeout_wq,
>   		   atomic_t *score, const char *name)
>   {
>   	int i, ret;
> @@ -852,6 +855,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	sched->hw_submission_limit = hw_submission;
>   	sched->name = name;
>   	sched->timeout = timeout;
> +	sched->timeout_wq = timeout_wq ? : system_wq;
>   	sched->hang_limit = hang_limit;
>   	sched->score = score ? score : &sched->_score;
>   	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 8992480c88fa..a39bdd5cfc4f 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -402,7 +402,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
>   			     &v3d_bin_sched_ops,
>   			     hw_jobs_limit, job_hang_limit,
> -			     msecs_to_jiffies(hang_limit_ms),
> +			     msecs_to_jiffies(hang_limit_ms), NULL,
>   			     NULL, "v3d_bin");
>   	if (ret) {
>   		dev_err(v3d->drm.dev, "Failed to create bin scheduler: %d.", ret);
> @@ -412,7 +412,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
>   			     &v3d_render_sched_ops,
>   			     hw_jobs_limit, job_hang_limit,
> -			     msecs_to_jiffies(hang_limit_ms),
> +			     msecs_to_jiffies(hang_limit_ms), NULL,
>   			     NULL, "v3d_render");
>   	if (ret) {
>   		dev_err(v3d->drm.dev, "Failed to create render scheduler: %d.",
> @@ -424,7 +424,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
>   			     &v3d_tfu_sched_ops,
>   			     hw_jobs_limit, job_hang_limit,
> -			     msecs_to_jiffies(hang_limit_ms),
> +			     msecs_to_jiffies(hang_limit_ms), NULL,
>   			     NULL, "v3d_tfu");
>   	if (ret) {
>   		dev_err(v3d->drm.dev, "Failed to create TFU scheduler: %d.",
> @@ -437,7 +437,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
>   				     &v3d_csd_sched_ops,
>   				     hw_jobs_limit, job_hang_limit,
> -				     msecs_to_jiffies(hang_limit_ms),
> +				     msecs_to_jiffies(hang_limit_ms), NULL,
>   				     NULL, "v3d_csd");
>   		if (ret) {
>   			dev_err(v3d->drm.dev, "Failed to create CSD scheduler: %d.",
> @@ -449,7 +449,7 @@ v3d_sched_init(struct v3d_dev *v3d)
>   		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
>   				     &v3d_cache_clean_sched_ops,
>   				     hw_jobs_limit, job_hang_limit,
> -				     msecs_to_jiffies(hang_limit_ms),
> +				     msecs_to_jiffies(hang_limit_ms), NULL,
>   				     NULL, "v3d_cache_clean");
>   		if (ret) {
>   			dev_err(v3d->drm.dev, "Failed to create CACHE_CLEAN scheduler: %d.",
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 65700511e074..9c41904ffd83 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -253,6 +253,24 @@ struct drm_sched_backend_ops {
>   	 * 5. Restart the scheduler using drm_sched_start(). At that point, new
>   	 *    jobs can be queued, and the scheduler thread is unblocked
>   	 *
> +	 * Note that some GPUs have distinct hardware queues but need to reset
> +	 * the GPU globally, which requires extra synchronization between the
> +	 * timeout handler of the different &drm_gpu_scheduler. One way to
> +	 * achieve this synchronization is to create an ordered workqueue
> +	 * (using alloc_ordered_workqueue()) at the driver level, and pass this
> +	 * queue to drm_sched_init(), to guarantee that timeout handlers are
> +	 * executed sequentially. The above workflow needs to be slightly
> +	 * adjusted in that case:
> +	 *
> +	 * 1. Stop all schedulers impacted by the reset using drm_sched_stop()
> +	 * 2. Try to gracefully stop non-faulty jobs on all queues impacted by
> +	 *    the reset (optional)
> +	 * 3. Issue a GPU reset on all faulty queues (driver-specific)
> +	 * 4. Re-submit jobs on all schedulers impacted by the reset using
> +	 *    drm_sched_resubmit_jobs()
> +	 * 5. Restart all schedulers that were stopped in step #1 using
> +	 *    drm_sched_start()
> +	 *
>   	 * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
>   	 * and the underlying driver has started or completed recovery.
>   	 *
> @@ -283,6 +301,7 @@ struct drm_sched_backend_ops {
>    *                 finished.
>    * @hw_rq_count: the number of jobs currently in the hardware queue.
>    * @job_id_count: used to assign unique id to the each job.
> + * @timeout_wq: workqueue used to queue @work_tdr
>    * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>    *            timeout interval is over.
>    * @thread: the kthread on which the scheduler which run.
> @@ -307,6 +326,7 @@ struct drm_gpu_scheduler {
>   	wait_queue_head_t		job_scheduled;
>   	atomic_t			hw_rq_count;
>   	atomic64_t			job_id_count;
> +	struct workqueue_struct		*timeout_wq;
>   	struct delayed_work		work_tdr;
>   	struct task_struct		*thread;
>   	struct list_head		pending_list;
> @@ -320,7 +340,8 @@ struct drm_gpu_scheduler {
>   
>   int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		   const struct drm_sched_backend_ops *ops,
> -		   uint32_t hw_submission, unsigned hang_limit, long timeout,
> +		   uint32_t hw_submission, unsigned hang_limit,
> +		   long timeout, struct workqueue_struct *timeout_wq,
>   		   atomic_t *score, const char *name);
>   
>   void drm_sched_fini(struct drm_gpu_scheduler *sched);

