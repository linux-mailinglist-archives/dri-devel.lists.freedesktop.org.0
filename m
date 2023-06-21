Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 709A7737C75
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 09:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA0110E3E4;
	Wed, 21 Jun 2023 07:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC2F10E3E4;
 Wed, 21 Jun 2023 07:40:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnXSwiPZg4NpQm5zZ+JttP2Jv419Nc/x4f+8/jC4jlVkEpgoytoRztZ3Lfxs+UyGAOTEeNDbTVR6y8diwikROZfHWBovqGoy2odFk+kVVZ3dQmhPGkvfB/APW2U9Upk3W+o01KPkk9XuxpvUvaCP9wWXJp/w6gxELQO4pLi8BYfcXL9XWi7dtR/fGgPvn+6njIhTOftFmCcin80+JkSvIYv7irX/Sm/0M4XVqbWTX6P8OM7/rTE+foEskvDX+L1xdtgQdY/RLJTmrCEEUFCp5qypZQMHTVDE7OZz2SbFg0ZVc4Nw81a8i3r02xWvfAcrFFqIjiyk0nD0EG/SG2qi9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJvdlOuyvYxl8XzfFGn2rBpMKv8yiRicQQm8F0YT70A=;
 b=mjCcDI506xMSwGsuJpW/0mLn2TjiGifBYNAs6TSuJT6diFiq01pUswokoQikiESXR8j3hMH5NExFVLMceSSPKk/g8AVk/GK6gFI1neXzHMKsVeA1KWQZ5aFF6IDZrWucIRPYOtcfMHgrtmIG++bLPDswM+iLN2p3MlA2lmhE+7jFW6E5AO7h5dkR+ZB7vEGbpDqoXiu6R6/DDzqDKNQCW6t2T6c5diw53/tpkBV5mAUpWfVkBlp7zyhfW/Bpp9in/kmmdZ1BZKG51FNdu9c4YKViWzltGnx996cKzPhoyfiQQs0l557ztoVnoDaYWtwLDU5kfS9tYk1toOQYz+4zMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJvdlOuyvYxl8XzfFGn2rBpMKv8yiRicQQm8F0YT70A=;
 b=J1PWvKRrXnKNtUwNxGvKRNE0fzReIGNdkRSZzz9KnrTdk1MzscHunpOYbZcD7zGKCsB+3podiPCpT5t+8PwlhqqYJmitFdy3GIYidcnYJdknmuCqx6SHW8YYw29ym3DRf7xkNX+iY2ro2YIo7QaGHDPb/oj/b0P6G7012c4H6H0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ1PR12MB6171.namprd12.prod.outlook.com (2603:10b6:a03:45a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 07:40:32 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 07:40:32 +0000
Message-ID: <5a0876a6-c3db-73b6-15c1-ef0b8cc8c732@amd.com>
Date: Wed, 21 Jun 2023 09:40:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v3 3/4] drm/amdgpu: Implement DRM_IOCTL_GET_RESET
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230621005719.836857-1-andrealmeid@igalia.com>
 <20230621005719.836857-4-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230621005719.836857-4-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ1PR12MB6171:EE_
X-MS-Office365-Filtering-Correlation-Id: 9686698e-2d6e-4a6b-e427-08db722acaea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: psxVVSN8IWrSJA4oIsaA50LEXs4wFLe4VIfYZpPoPt0lVdRNiX6vnCUpIvijKWADyz1fMY2Dv7+PljC5I3sBb0y/VZ/QD1vkP5CU8j7TX4gYBEgxfve+mQNvrRso8wuOKFW5Z4TufbDl/cYKaYMXQjO7wzd17/AvVDeIkoLmcCmt29ENL+Yt/d28lfQB9zJpZHvyxAL9Xp9qL2fw7NYSoL0R3En01XwzPjp2hL7xKIcS6XIWWY6YKIGv9jhvFyGeVhEJpTbjUVPyA/mszdzmY4dQ5G5JnVwVNZEL205+PDuGtNYIMVJmTAPr4o7miJGUiXd9u9oU2p1aazm3xtWi3ZGlUJ0KjEKb4xoHBD/hTlQ3XovxQieqWMdR8wR/3fnts1PwrEzIrsfiqMo0ahgWBBQw9JdTL19q1CeNIR7HcXvtY+yW59RO3mdRXX0j9A1bOSsRiBYWabOfOZGM7BCUB/iwD4R1dyiVCAjnw0cvfoVCSr3yOtezighLAnWCxG9t6Em1EiVRVOev3nqUr5CrjwdHpvlv8xiI3bcM5M76ZkN7yDpkrWmq3TKhozwJmwf57f/G0yE/iINcXh2pviYUWUTx630cbjyzcDTIpC8ogb/uunFe4xau0KtT4ACsH1x10413tVTudNjEOJzNe5iBRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(478600001)(6666004)(36756003)(8676002)(66946007)(31686004)(4326008)(41300700001)(66556008)(66476007)(2616005)(38100700002)(83380400001)(31696002)(86362001)(6486002)(2906002)(5660300002)(54906003)(8936002)(316002)(7416002)(6506007)(6512007)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUdZdE1JWTU0TEJGc3BlVEplbWJkQnVwTkUwVytSNHg4bG9WZVJLMWZ5Qk5k?=
 =?utf-8?B?L0UxY2ZmQXRZb2h3YmJzVFRNMUp1NENtc3R3Yk5JMnFzaGx3MEJZaEpVZHZZ?=
 =?utf-8?B?TkMvcW5vY2lCcDdwZk41djVvVFB4SFJ5YllmNVlmUUttMWV3QnRNN09zVWhM?=
 =?utf-8?B?aXRaNEh4QnVFSGpCWjVyWjhLNTNrRlQrM3JtS1BRNnUraTEvWldmeCtZemZk?=
 =?utf-8?B?ZEpaU2dVVWdBclVQbktubmxrbk42aUc0Y0pDaDhuZXdsQjVDYWtkRlRBNlBY?=
 =?utf-8?B?Ti9wYjZVczh6QlNoaVNtc3A0QVBweU1uVDMxVVdsQ3pFYU9zN0ZoU2RnVG5t?=
 =?utf-8?B?S0tDVjlmVDFGQ2VhS0VlbTZxOWZsbTRZZW5abUIxUEtTZUZ5b21WOGEvdUI2?=
 =?utf-8?B?MzRDUjMvYzFxSHorMHVQNStMZ3h6ZFQxQ2VOSTA1SGlQSm93bkw2b2w0K3Ew?=
 =?utf-8?B?U2FOWEFHWEFtVHkva2Q2d2d3VEdoUWM2OEhGVGlidFM2SVpOeWhBOFA0ZS9m?=
 =?utf-8?B?UlNxUlU4b25zcXM1ajdOM1ZTQnE3UmkwNFYzNUpVYXl5VlU4dTRlajJZVCtj?=
 =?utf-8?B?WWlhSU81NVg3dndiZ2tYdEVmekk3V1ZBeEwyeXNoT3doVzBxWmo4VXhHZ3Yr?=
 =?utf-8?B?ZzJ5OGhVdmg4UnA5QlIyRWhoeEV5NzR6L0lTRk5JeDV6MVAxb0VhT2pqTC9o?=
 =?utf-8?B?RkFkaVNGR3QwT2NKWEpPTEdhaEMwZGw0WXd4dkh0MDBwLzJNdjFjTExyY2Rx?=
 =?utf-8?B?UUF3WDlWbkZzdU15bnZvZjRQUXFvSXNyZnVBVVU2ZDFnU0lXdkhTcC9kVEdY?=
 =?utf-8?B?LzZ2S1ZJTlhwUTdBYVMrSC9PTzFTcTZKeDFsRGRwQTZUYjlub3E1SXhGY3Ba?=
 =?utf-8?B?bFhLNEl1T0wya21lTHlGYWZJRnhyZDR5N1RINEE3ZVo2ZGJJd3VqVnBkQWlu?=
 =?utf-8?B?dWpyS3h5YkJ2RGs1WVF1MkF2ZGhJTlNOZ2NXZ1FIc2N6WDlDeXF3SG9uYnB1?=
 =?utf-8?B?TFNLVnJqNDJpYlNHUWh6YjR6OVc2cE5STVljdmIyQTg2NHVDTWVSdFdhYlMy?=
 =?utf-8?B?Mlg5VC9udFl0d2ZSMXYzeG9NUXpuNzNUY0lLQjNoOTBCWnU3Q3NLbkFzbFd3?=
 =?utf-8?B?enFhZnhqdHRicmlnTENVUnYzanVRa2FQZHpvUUxBaXVvdEZZRzNhWWtMWkF6?=
 =?utf-8?B?RlByYlROeHRvWENVN0ZvcWg2RnVDajgvdWxNVENwZnk1ZXhqWm13Z0pEb1Qy?=
 =?utf-8?B?TUdVcGJBNkxLRnpkYXdtZEQ5RWhld3dsREhXb21RQ0dNM1RyZlZCeXA4dFRo?=
 =?utf-8?B?OS9ONmRTRjFRRUtVUjVKemVPenNDbG5sYnk4YTJxNk0wblhnSzR2MjE1VGZH?=
 =?utf-8?B?dGQ2U3ZyTkd6bWIwdCtQUTBRQmlNUUFQT3pSQWhRZVo1NEtnWkxrWmg3d09n?=
 =?utf-8?B?M3pJcjk3dVRsSGQyWGNOcFd4bEVWRldERWs0Q0MxQ3NmM3VkTzVJc3dLN2pi?=
 =?utf-8?B?Z2JpdjlYaFlsS0tkcWliOXlnRW52WTRYaWVoTUI3ZWROT3pDQVhuR0luRVpU?=
 =?utf-8?B?YWF2TVNVc2dpOXREdmdDYUFRb2l6RkNBbThyaCs5RkpVUkdKODJxOWlrVXdL?=
 =?utf-8?B?c0hFdWlhUXNRUFZnMTNjYVFCS1c3Y1poL3B0ZTMrbzhWMlAwa29WdkQyWDZa?=
 =?utf-8?B?Qjc4NGZsQXozaEtNUnRpbTZxcWdmbmFjWC9vd3NpR3B1WHkzVmhaYkJnZmhY?=
 =?utf-8?B?azdKUXd4M0RTWVlHb3prWUc1VVRISnNibVNZMUNaT3BZakZISHBlOFJmTFR1?=
 =?utf-8?B?SFJWZ1JjWU1iWEh3S0UwU2lJN0dsOG9UZjFHSm9zNzRtS21UdytaSFBNanJx?=
 =?utf-8?B?RmhmMWNxTlBWVFNuMzRHYVl4bzJKTktVOUtqVC84Q2lJRE5YRGNQdTdpZmVt?=
 =?utf-8?B?Z1A1allNTXVMdk1rdDdQQjJoWTR6Q2ZwWFhiTkZOaTdGalRvZnc1SEVjOUdO?=
 =?utf-8?B?dWFCYTNlZXkxQlQ1eVo5WEhtTVRsVnJVOTN1TjROOUlTWC9kV20xNllqMitX?=
 =?utf-8?B?YWFFRmJ1c0k0cEI2aWFudWpsLzNrSzBSODlHYVRjMzMrNVpPS0pWTTRUVGJP?=
 =?utf-8?B?RWZsbFhkYTdIdVFraWlpZnVkZmkvZ0p1SDlZNTgzSTJhcFNkdmFEVWI2d0RB?=
 =?utf-8?Q?yKHfwo0YqXebxZRLE0f24C3buGcJnClZOF7BQqtgDyUB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9686698e-2d6e-4a6b-e427-08db722acaea
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 07:40:32.3684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWk/vkvBIxe9C+AGCOB57KQAaW+HH+JQogv4lDjwxnE5GTcIP8z5qMkZNNgCwb+f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6171
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.06.23 um 02:57 schrieb André Almeida:
> Implement get_reset ioctl for amdgpu

Well that pretty much won't work since the jobs are destroyed much later 
than the contexts.

Christian.

>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  4 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 35 +++++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  5 ++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 12 +++++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h |  2 ++
>   6 files changed, 56 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 2eb2c66843a8..0ba26b4b039c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1262,8 +1262,10 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>   	uint64_t seq;
>   	int r;
>   
> -	for (i = 0; i < p->gang_size; ++i)
> +	for (i = 0; i < p->gang_size; ++i) {
> +		p->jobs[i]->ctx = p->ctx;
>   		drm_sched_job_arm(&p->jobs[i]->base);
> +	}
>   
>   	for (i = 0; i < p->gang_size; ++i) {
>   		struct dma_fence *fence;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> index d2139ac12159..d3e292382d4a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -322,6 +322,9 @@ static int amdgpu_ctx_init(struct amdgpu_ctx_mgr *mgr, int32_t priority,
>   	ctx->init_priority = priority;
>   	ctx->override_priority = AMDGPU_CTX_PRIORITY_UNSET;
>   
> +	ctx->global_reset_counter = atomic_read(&mgr->adev->gpu_reset_counter);
> +	ctx->local_reset_counter = 0;
> +
>   	r = amdgpu_ctx_get_stable_pstate(ctx, &current_stable_pstate);
>   	if (r)
>   		return r;
> @@ -963,3 +966,35 @@ void amdgpu_ctx_mgr_usage(struct amdgpu_ctx_mgr *mgr,
>   	}
>   	mutex_unlock(&mgr->lock);
>   }
> +
> +int amdgpu_get_reset(struct drm_file *filp, struct drm_device *dev,
> +		     struct drm_get_reset *reset)
> +{
> +	struct amdgpu_device *adev = drm_to_adev(dev);
> +	struct amdgpu_ctx *ctx;
> +	struct amdgpu_ctx_mgr *mgr;
> +	unsigned int id = reset->ctx_id;
> +	struct amdgpu_fpriv *fpriv = filp->driver_priv;
> +
> +	mgr = &fpriv->ctx_mgr;
> +	mutex_lock(&mgr->lock);
> +	ctx = idr_find(&mgr->ctx_handles, id);
> +	if (!ctx) {
> +		mutex_unlock(&mgr->lock);
> +		return -EINVAL;
> +	}
> +
> +	reset->dev_reset_count =
> +		atomic_read(&adev->gpu_reset_counter) - ctx->global_reset_counter;
> +
> +	reset->ctx_reset_count = ctx->local_reset_counter;
> +
> +	if (amdgpu_in_reset(adev))
> +		reset->flags |= DRM_RESET_IN_PROGRESS;
> +
> +	if (ctx->vram_lost_counter != atomic_read(&adev->vram_lost_counter))
> +		reset->flags |= DRM_RESET_VRAM_LOST;
> +
> +	mutex_unlock(&mgr->lock);
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> index 0fa0e56daf67..0c9815695884 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> @@ -57,6 +57,9 @@ struct amdgpu_ctx {
>   	unsigned long			ras_counter_ce;
>   	unsigned long			ras_counter_ue;
>   	uint32_t			stable_pstate;
> +
> +	uint64_t			global_reset_counter;
> +	uint64_t			local_reset_counter;
>   };
>   
>   struct amdgpu_ctx_mgr {
> @@ -97,4 +100,6 @@ void amdgpu_ctx_mgr_fini(struct amdgpu_ctx_mgr *mgr);
>   void amdgpu_ctx_mgr_usage(struct amdgpu_ctx_mgr *mgr,
>   			  ktime_t usage[AMDGPU_HW_IP_NUM]);
>   
> +int amdgpu_get_reset(struct drm_file *file_priv, struct drm_device *dev,
> +		     struct drm_get_reset *reset);
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index c9a41c997c6c..431791b2c3cb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2805,6 +2805,7 @@ static const struct drm_driver amdgpu_kms_driver = {
>   #ifdef CONFIG_PROC_FS
>   	.show_fdinfo = amdgpu_show_fdinfo,
>   #endif
> +	.get_reset = amdgpu_get_reset,
>   
>   	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>   	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index c3d9d75143f4..1553a2633d46 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -35,11 +35,20 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>   {
>   	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
>   	struct amdgpu_job *job = to_amdgpu_job(s_job);
> +	struct drm_sched_entity *entity = job->base.entity;
>   	struct amdgpu_task_info ti;
>   	struct amdgpu_device *adev = ring->adev;
>   	int idx;
>   	int r;
>   
> +	memset(&ti, 0, sizeof(struct amdgpu_task_info));
> +	amdgpu_vm_get_task_info(ring->adev, job->pasid, &ti);
> +
> +	if (job->ctx) {
> +		DRM_INFO("Increasing ctx reset count for %s (%d)\n", ti.process_name, ti.pid);
> +		job->ctx->local_reset_counter++;
> +	}
> +
>   	if (!drm_dev_enter(adev_to_drm(adev), &idx)) {
>   		DRM_INFO("%s - device unplugged skipping recovery on scheduler:%s",
>   			 __func__, s_job->sched->name);
> @@ -48,7 +57,6 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>   		return DRM_GPU_SCHED_STAT_ENODEV;
>   	}
>   
> -	memset(&ti, 0, sizeof(struct amdgpu_task_info));
>   	adev->job_hang = true;
>   
>   	if (amdgpu_gpu_recovery &&
> @@ -58,7 +66,6 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>   		goto exit;
>   	}
>   
> -	amdgpu_vm_get_task_info(ring->adev, job->pasid, &ti);
>   	DRM_ERROR("ring %s timeout, signaled seq=%u, emitted seq=%u\n",
>   		  job->base.sched->name, atomic_read(&ring->fence_drv.last_seq),
>   		  ring->fence_drv.sync_seq);
> @@ -105,6 +112,7 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   	 */
>   	(*job)->base.sched = &adev->rings[0]->sched;
>   	(*job)->vm = vm;
> +	(*job)->ctx = NULL;
>   
>   	amdgpu_sync_create(&(*job)->explicit_sync);
>   	(*job)->vram_lost_counter = atomic_read(&adev->vram_lost_counter);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> index 52f2e313ea17..0d463babaa60 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> @@ -63,6 +63,8 @@ struct amdgpu_job {
>   	uint32_t		oa_base, oa_size;
>   	uint32_t		vram_lost_counter;
>   
> +	struct amdgpu_ctx	*ctx;
> +
>   	/* user fence handling */
>   	uint64_t		uf_addr;
>   	uint64_t		uf_sequence;

