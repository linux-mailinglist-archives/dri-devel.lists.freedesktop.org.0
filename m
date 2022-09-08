Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CE55B25CF
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 20:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBE510EBB8;
	Thu,  8 Sep 2022 18:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2063.outbound.protection.outlook.com [40.107.101.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BC610EBB8;
 Thu,  8 Sep 2022 18:33:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2N2/PsqzlvrKu2PnUV68H1ZfhR6ZSWWVhIF9VBwmw6yVjZXK6nvldGVv7u3PzuJOMcIYJxTCyJNJ8ARHDt/RZt5UWPB3TbrkEFMtV5GQQcNgO3JFFmAcOC7YibeSmyE0gjbHhbGS4OzHb7ue7EumDZqY7HaQzsQq8z0RswEc7yUdwI7bs+QyAg6R0bKPagkK8oT86noQEyxXCgHnIDl/bbCIIvONtO8r2X7g/gAenc8FjdIlrZFpe28PAtr3WJhF5JQRPA5kixoe5TfLKNP0RF0lhK1jazREG3cZKwwbiE0Hbv8feR0+3Xx25dohsPUtsfDT55igKYZPwznHZ6hfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clCfzxwi/p5ZVZ1ftttWIjYKKl1F0gZRbboooUDB/xU=;
 b=AcuLlK2lVhdmf3oxLNyXWu+f6ofXIP5oY7tGDh/sBItojQiR6VYlhyJ9WArCl914xJCWtSkNDvg+WI8Ge+HTWN5vv7fIiZxteqyt0/MzZwnELccGb+BX/taANNtL4n4w3klD/MCQB1Geq/3lBM0UVcMzqmNwHG7mGy83FBhRkbsMdXElJKhxFC+iBh6tDxh/cxl/XgSgJVKlaoeUkKqD3zREZuTtxf9Ad2DdxpRwJjTLepWUReI6l1/JhyWLuRSHPBEAHWkOA8sxwCC14F4FAhXeKsRMninm2UzMyMq54Tovk9OXhEJX6o5KfL0D0kFzvJpaMMwL3R/oHia+O9IM5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clCfzxwi/p5ZVZ1ftttWIjYKKl1F0gZRbboooUDB/xU=;
 b=RR0IfuMBzWUPDdZ36x2xURWi1wiqMyxJv0fFyQZmbSCIKtcp5Svi7BR+iaQFT5iPGH4iGJGq29WPQMSdtzsb1YGestwbTLkr+s403omkd+gLixfJuhYhwUos9Zeu7eAUdwRYkQxyfuvF04vD570BXsfPWsol9HDWhBCOOy2VlcA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by MW4PR12MB7143.namprd12.prod.outlook.com (2603:10b6:303:222::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Thu, 8 Sep
 2022 18:33:09 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5612.016; Thu, 8 Sep 2022
 18:33:09 +0000
Message-ID: <69924bc6-d249-35b2-a942-a43a9293558e@amd.com>
Date: Thu, 8 Sep 2022 14:33:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] drm/scheduler: track GPU active time per entity
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220908181013.3214205-1-l.stach@pengutronix.de>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <20220908181013.3214205-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0269.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::34) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1947:EE_|MW4PR12MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f812c7c-42e2-4e22-13c9-08da91c89434
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cS0nCRmHTj4SadxAHfxPGfB17ZLVsAkjJ4xKthENFlKOUnDCuWDIwo2k0ZGRhmaUE4jSCHW+eqJsLnBDHLdRdOkWirhOLi28K544Co+hWy2mG5Dw7lEPMALjqyQ/ValQnZNZlFgNra9iR4bgcvGF3sOzao85xiEpzVrBqVUZTAHYfwZ/WGt1vAU3StiTHKGZQMEHepShn8tYwNMBuo3SrcmB9RlSH918DTcet9Q44MJIIdPriHpte4z26qHlMYBxnLjHBHLe9v/xRNd1XZQqpWUB94DPZVLOX2zUAFBxTHfA9a91E84U1m1Z6kQEAVaNfnNnXYjXDnHmRyWGyJomkj+ergFqrzFrVypfo3iH/uS4FZx4taTrAAAGRgn1nLbBP4JXdFZvwvipW87SgQDQrKgvhmk0xzRLR4OJmMhRSxcRgLqQfS7M2iSktT+joAu6AexO5F7Tt+iBiJqWGBnpLppOEhRrVQOsq4uQ6i1+PryyQsG32fTDQgZx+RyAAJTy1U5qlDZpnZ31vrVBxTZCKd/6eTfmlJg07VpcpL+OJLTkXDIIAd/h5kQ+moGHvpzI4oOJzbI/ulKqdRC9JeSMHEwU3mMrV6G9MUl9bKa4qGnOySMXPMV705UKZMbkxZ3JjyTrWoFGlu8D7h2UHdQfHDRjw8nV87ZEivEpR+DiPOrx6UNjSO98dyLwe1DpwoK3iTkboMcsMj0m9tl3UThm4eyhGg77boZVQ1D3droH9LImSiCYiKXZvmTFFLAdknZPrpUVD/c3Ex0IBQ0PmVSipuXjsBB6Iwoxcyc5brpAx6U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(54906003)(83380400001)(6486002)(26005)(186003)(6512007)(44832011)(2616005)(316002)(6506007)(5660300002)(2906002)(41300700001)(478600001)(8936002)(53546011)(66476007)(31696002)(4326008)(38100700002)(86362001)(66946007)(8676002)(66556008)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkFKVGEvcC82UG1rM2JjUFNWVU1yTllQelEvTC9FMTcwQXQ4RTZaVXhpSXdk?=
 =?utf-8?B?YW5aSjFYYzRKREJXUmFMT0laOXlscXh3NlNOR0pFbGk1a3JhSjBMZ3RoL3NW?=
 =?utf-8?B?S3ZoWkNlSVpwRUwybzlEczI1UmJpSTlQTW9ZTHVHWTFsSU1KLzJIZHpMLzJj?=
 =?utf-8?B?YnhpaUdHd1h3RTBwc09FN29ZV01NNGJEVmUzaG44b3BkK0wyMENWQVN1bVFE?=
 =?utf-8?B?cThzZ05BZWlGSGthUXU3ckppUjhIRDV1UHZkNEZnN3U3TWhYVW9iWStBazJN?=
 =?utf-8?B?U3JwVjNCNkRaakVrbkVwSUdCczEzZzBFcWhCbTFxOVA5OG84aWEzUHhUUzVG?=
 =?utf-8?B?Yi94SXkwTmxSd3U1WGN4aEhEUmZCazgrT3hjZDB0VDFFdEpjaTNaZzVtanBV?=
 =?utf-8?B?SjBNcUNpZVBZaUJGM25KZDhPMGpNZ0IrMG5MV00wWUxSTXc0bElGZ04rZzVL?=
 =?utf-8?B?Tmp6YlE4M0w1V0ZORHpnMzhaYW44cUY5WnpQZnNtaVlncjlhY0s2eTdqbzFs?=
 =?utf-8?B?QUFzSm1XVXAyemVSaDduajk0emxOZ09JUkF0VmprM2ZKQ2lxRDFmNldjTXhE?=
 =?utf-8?B?SGErNCtreXNqWFU3Q2ZBTEtnMyt2bWgzdEo0NDczbmp5aTB3eUMzK0JEL0Q2?=
 =?utf-8?B?MzJyQ01EUGU3bFVPRklmQ2o5bXg3L0hpdzFKbHB6VWtabkJiNkllWUk0bHZh?=
 =?utf-8?B?Q2RzVnF5L3UvTnR3WERmeUxDUzJXZExPV0N5ajllaEpuaXk5bUU4MDZkOVRC?=
 =?utf-8?B?UHRQUWV1a2FPMjllQlNYYS9GUXo3Q29OSUhBaTBkN2ZmVmRqY3Y3cXdOTnhi?=
 =?utf-8?B?WHJzZ1RpNktHUEhSTXlKL0lwbkFqNkdGVGVnMURNRnpGVk54ZElmSGdQU1k0?=
 =?utf-8?B?MCtNRFJkdnFpQ25oSVZadVBrNjV0NVArMkhCdHJiblFBVzMvRlg1aHNWd1Jj?=
 =?utf-8?B?YU1uZmtCSkpaTmtGdVZBcU81bzkxWmI5b1p1MXBUVU1CNjlJUDJTdWN1QURq?=
 =?utf-8?B?NUFucjduZTBRaWh4TVBmZnpyckdQbEhHejlKQnRsK2tBTUd0ZHVrdHNjSU52?=
 =?utf-8?B?dElteUg5UmZ0dXRPTzV5SGFaQXpLZHpkdmhGcHRJWThBMHd3VWZSR05iQjRJ?=
 =?utf-8?B?YjVyU2F6dkNxeklYbHI1ZjlaZExsWHVHR2hYSHZYZm0yQ3J0V21ORmRaUFIz?=
 =?utf-8?B?NmwyT2o0OTBQRVpHU1NqcE5rMGVvd0l4ZkQ3Y1U4TGlYcEQyK2U0c0VYbFZU?=
 =?utf-8?B?UmdZUDk2dGpVNms1cnRsSStGTXI0NDJtWjY1Y2NVRnp3MDZQSUk4NDhzSDNt?=
 =?utf-8?B?ZWh4ZW5Wb0VJa3V5TFEvbERUWmpuSkF4U1VtdTU5bU5OQzVCeExsNTZYdTdV?=
 =?utf-8?B?OVA3bU5wZDNQZ0hYV3JjdjF5WHVyY01DK1FjbndGRmRZL2I3aC9PRDN4OGVW?=
 =?utf-8?B?ZjduQnk2SXBhcDJtZGpwbE96djg5eTJITUU0dTlBaWswMU9SYmFsVWd5V0dG?=
 =?utf-8?B?ajhpUTVZeXZZRG9QTlpTS3hIYWVGZWRpWGtjcFp2RWxjWS9PamdUZ1M1cUQy?=
 =?utf-8?B?REM4LzFEdTQ0aTVhb0NSdmZ3S25Ca1p3TTd2Vk9yZU9kaW8rR2RwcnFvYnRM?=
 =?utf-8?B?Z0FIbmJGZWxvdHJYWllMSnBXWG5OeXlPN1F3SktWTzVGOG9FcGFRNzBUZmpU?=
 =?utf-8?B?L252ai9YVnU1SHo3RHd5UmdEdXB6d3FXanl6RDhSOEZGTmQzTDJkSkFMWWdX?=
 =?utf-8?B?ODJXV0NPS1BRQklmNEVVL0diSW9MZnQ1cC9QcWZyZDh5VEExcnQxS3ZlY3Az?=
 =?utf-8?B?c1ZPMmllRi9FZTlIVWRQeU94cTRIbTFqQUMzV3JhZG8rR0swTFBFOXB3TGFt?=
 =?utf-8?B?N0xZRTF2eXJHZjV2MUk2MmRkQXNsSnFveHYra2dGVnhCemZzazVSY0JRQmF5?=
 =?utf-8?B?QXB1cWcydDcvbURtWjR4WkoxOUZKSENaQnJEMEtWRWFnbjhqUzdDUklNQTJr?=
 =?utf-8?B?Zkl2MGQ3YmlUaWRyUUMrNHdiR2E1Wm1FNGRWeUhvcGVvZng1WitlOWJYSHcv?=
 =?utf-8?B?eEpOWk5kVUxhMkFSWk16Zk5xMkF1T3liK3h2SVIyRDhKTWdyWXR6UXY0Zjla?=
 =?utf-8?Q?KA/tCi5ot2Vdau2aF5ZbGAGb3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f812c7c-42e2-4e22-13c9-08da91c89434
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 18:33:09.3524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VKykEHI3r9r0QkH0HZU7uIu2rOypSYQHKiyCMBCmvfVzLeMDkycr0JrWOCkaYKXO64wmeQfulTuNoxyL9kyDpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7143
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-09-08 14:10, Lucas Stach wrote:
> Track the accumulated time that jobs from this entity were active
> on the GPU. This allows drivers using the scheduler to trivially
> implement the DRM fdinfo when the hardware doesn't provide more
> specific information than signalling job completion anyways.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 6 ++++++
>   include/drm/gpu_scheduler.h            | 7 +++++++
>   2 files changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 76fd2904c7c6..24c77a6a157f 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -847,6 +847,12 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>   
>   	spin_unlock(&sched->job_list_lock);
>   
> +	if (job) {
> +		job->entity->elapsed_ns += ktime_to_ns(
> +			ktime_sub(job->s_fence->finished.timestamp,
> +				  job->s_fence->scheduled.timestamp));
> +	}
> +
>   	return job;


Looks like you making as assumption that drm_sched_entity will always be 
allocated using kzalloc ? Isn't it a bit dangerous assumption ?

Andrey


>   }
>   
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index addb135eeea6..573bef640664 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -196,6 +196,13 @@ struct drm_sched_entity {
>   	 * drm_sched_entity_fini().
>   	 */
>   	struct completion		entity_idle;
> +	/**
> +	 * @elapsed_ns
> +	 *
> +	 * Records the amount of time where jobs from this entity were active
> +	 * on the GPU.
> +	 */
> +	uint64_t elapsed_ns;
>   };
>   
>   /**
