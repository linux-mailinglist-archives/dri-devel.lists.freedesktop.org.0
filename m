Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C77BBA7AF95
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 22:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F18310EA76;
	Thu,  3 Apr 2025 20:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PgnFev2w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2068.outbound.protection.outlook.com [40.107.101.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341B110EA76
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 20:55:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/b/aE6ZGHLhSoGsEp1c6aLDRtkW9VGamM9wBMVjgm58WYBUtWZnd1V2ix/tQ3BGhjfDgbb5+GG8cKX+2YviWZHbGRy3oEQRZ/1MRm1HhhamqIXwdKUiFCCk3d/A26JTT6DfHFO1RADlXc58NRC7Lj2FUAZyvSxm2jNo908CRJEl5HRWt0VOb+PxUYQPaZFk1fsltjnsYS/aB4d2yrj2CR8pMU/WCbedBCQaAr5GCxItoOer4pIfNiFTrGtxU22mI1JgCF0Vm6MrgqYMZjD77NiTYe93ZWjnA6zvvGWXu92PDCZVf2fIu5BKXetkeI0ATooTk3xnZa6jGJTOkcTlGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l40cDhFQKO3hbwmkS5DHLgGOclUliP4tdTcHraLZw08=;
 b=bvI44wrEB64qQUw0Wu03a6Jf0ghFJAyDReJFw+uHCT6Wk++ybvHD3M7NgzkNS8NKPz6+FH/8BN1u8n3AiS30PCUZsqa9QTMP7l+fuF0lPhmDKcDBJ9ecw0G1psXFkF3DHetOXvZEv0dCIwWtJcd9ODAPH7sS64I7eZlHHBwVakHPZDdE7wvRmDbOjk6ZeB+nTb0u07kjK6IxWWgaVfIadagx71iiXA3DmFNe/Z6wjkgtVKbz2q6cIhWqYU1bD1DPkd07/nk02qC7dY8InRjsKD+Isb+Z5P7++Oqe8YCJZ/XLkK4rA9aQDFny9ZivNSpwf0YpYq5gXZjwz84ktE3/aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l40cDhFQKO3hbwmkS5DHLgGOclUliP4tdTcHraLZw08=;
 b=PgnFev2wyd3/t43hL5fZokrhe7Buf/v7wDaQ7cpPiQR1vMn0E3fDocWoE6z6M1XnyStjWlNKF7OyZzBEE59NqvSnvnRcuOqQlOUL34tzuOEiQHZF3CmYSsatpwa+/qScOVZ2YnuysLWa5Q4FhJfIEAkIMokDB58UDbNQxiicaw0=
Received: from CH2PR07CA0051.namprd07.prod.outlook.com (2603:10b6:610:5b::25)
 by SJ5PPFCB5E1B8F5.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.53; Thu, 3 Apr
 2025 20:55:25 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::db) by CH2PR07CA0051.outlook.office365.com
 (2603:10b6:610:5b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Thu,
 3 Apr 2025 20:55:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 20:55:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 15:55:24 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Apr 2025 15:55:23 -0500
Message-ID: <7dca9328-7554-1e04-1667-2096ecbaa8e2@amd.com>
Date: Thu, 3 Apr 2025 13:55:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Add cmdq_id to job related logs
Content-Language: en-US
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, Karol Wachowski
 <karol.wachowski@intel.com>
References: <20250401155939.4049467-1-maciej.falkowski@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250401155939.4049467-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|SJ5PPFCB5E1B8F5:EE_
X-MS-Office365-Filtering-Correlation-Id: 9896f357-cde0-4736-511a-08dd72f1db92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bC9IelBiMzJiOCt0cURRYk1RbE0vbjhReDgxWDZlN3BxM2lUTHkveFJubVR2?=
 =?utf-8?B?UXZSNGtqSzAwUE9pQi9WMWlmMkVyNVZkUUhPYjd2eDdWRjBHUmpIbjhIS2lw?=
 =?utf-8?B?cXFFejBwYVpjb2x3WnVGK2t2YjR0K0l2c1lid04zRlpLMmUwYkp0RHdnUVNO?=
 =?utf-8?B?UmRkMzB2b3lXajMxZnJZbTc1TlN0cUpKZ01Zb1FycG5OMzZIY3UwaFovZ24v?=
 =?utf-8?B?R3RKS0ZRWmJwMGoyOGE5akZia2o4blorVmxwOEF0S1EvckRUcTFBU1VNdllm?=
 =?utf-8?B?OStoQWVFTE9CUmZuUjFOei9tRmUveERDUGhtWmxmL0hlbmtML1dPaFI3dnE2?=
 =?utf-8?B?amxOb3VEa29nT3NTVWJnNlBOenpQUnJ0ZzRaT0JicXpwekM1QXVsMVpWNnpZ?=
 =?utf-8?B?UjJCT2k4REFabDJTRlorbCs2RDJwbXhHQnVIbHo2dlZnYlFHS0R2eXRsdm4y?=
 =?utf-8?B?eVlBQmt1aDVjenBtZWxHaGVXOTZxRUNJK1FDS3E5SDlsK09vWjB3Mi9zRE0r?=
 =?utf-8?B?NlJpdWRBUWR4czBsdVR6V2ozZm8rYXVHYmhMMUVlbVZKSlNaNU5vRG9TR0NU?=
 =?utf-8?B?bDZBbzFIc0crNzhlR3dNYmk3dmVnOTdEUmh3MnpieDVNNFlxQlVCWXcwaVds?=
 =?utf-8?B?dm1hWThaM2pJejJWWnp5TkVHTER5cTk3N3cyQVZYM0tLcUJwaVd3VUlQamdW?=
 =?utf-8?B?OGs3WURTc084MHNSWXdsWVpwbGdJSUxQbXBvN0x1emlDQTQ3cm9SSGNwTXdH?=
 =?utf-8?B?Vk8yS2xUZjNyU2VJcUNKcjZZWFlYdEo4NmZCeXhzSUZSOXNsUlRHNndWZnpK?=
 =?utf-8?B?MGxBYXpLdGNIbkl0cXNlZjdiaGlRVWV0TWw4aXh6bm9XajNDNmpMSGJVOHc2?=
 =?utf-8?B?dE5IWGwwcGs4Q0xoRkhqTkFQODg1My9sOS9CaGw4M0VQbC9SWlh2cG1ocFJN?=
 =?utf-8?B?a1o2RUY3bDdhQjgyOHJiR1BDcjBadnl5c01PakNmM2FHczlSOTcxNXBnV3ZP?=
 =?utf-8?B?Y3hCZnU4dVNSNC9GdGlvSTlGbUN5bng1RnBhV1pta0xVKzVzMUZCeUtMT2c4?=
 =?utf-8?B?a0FjeGs1VHZmajh4SGZpUHE1ZE5MNzhQSEFNY09tS05ZamQrSWIvdldnbGti?=
 =?utf-8?B?L3pBdTg5ZmZyck82TUtlN0F6SlNacVZYcEp1ekd6Y1lObDFzRG5iZVVIa0Np?=
 =?utf-8?B?OFpMRzQrZ2ZZckJpcUdqNTZobUpKUEdSb1NmV0JON0dPMERoR0pGcUpLb2dJ?=
 =?utf-8?B?d3ZrbldoK3paMmt5SUdGR0RrQUxTK0xQUDRiYXRHb2pMbGhvdDMvb1BYbEE3?=
 =?utf-8?B?eGh0Z3ZKd0U3d0pHR3pjY29lcnVxUjBZNmJUQnh5T2ErMXBCa0VoWit6eXNs?=
 =?utf-8?B?S3dBYVVveDZ6aitON0VuNUoxUFhveTdrYkppNHA4MlQvZEU4azJIbHpkczc2?=
 =?utf-8?B?UUh0Ynd3S2lIUURRSDNmaytaZUF3Q1lpTTRFQ3lCOTh3Wlo2UWdoQnpEMnAy?=
 =?utf-8?B?bUZDYXNWQlB0Z085b0dPRis2N0ZLMExDNXNJbXJ2aEJkZVQ1OWZJcEpQT2JP?=
 =?utf-8?B?K3hRS25WZUFacTNXdlJSbk9DSnpWRXZUNTMrcnpCWlpQS243c1laNW1rTUtz?=
 =?utf-8?B?YUtzT01yRFJldHBzZHN6cDZNNVo0YWVZdUVrV3pMQW1JUGw4N3pnS2tlbEFF?=
 =?utf-8?B?S0ZXRXV1UElPSTNTbXJDbmdhenQybDRBR3RvVVM5OEgzV0YrZzJuTkpoN2Q2?=
 =?utf-8?B?MGc4ZGg4V05DdHdsRTJwcTFpWjRBSUZKTVFFOFE3YlZLRWp1a05YMEhIdGQ1?=
 =?utf-8?B?MnVGei9oOFBXNGdXTXhsZTJldmc4K3VLdEx4OFZYOCtUN0R5UFhKaVJpd3VO?=
 =?utf-8?B?R0JlVGJSZ0QxODg4ckhwTTN0LzZPd0pCWFRaNnVhR0Z3YmtlVUh3dXJEcFVB?=
 =?utf-8?B?N0JoUFR6OEd3TW5zSGp2Z1JWanRRMm1uVXhrUUdIL3ZGSmxBcTFIdmp1dmNG?=
 =?utf-8?Q?U0SYPr7ev36u9bq+k/PRhLXJ2IOBrY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 20:55:25.2337 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9896f357-cde0-4736-511a-08dd72f1db92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFCB5E1B8F5
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


On 4/1/25 08:59, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
>
> Add tracking of command queue ID in JOB debug message to improve
> debugging capabilities.
>
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_job.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 004059e4f1e8..863e3cd6ace5 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -470,8 +470,8 @@ static void ivpu_job_destroy(struct ivpu_job *job)
>   	struct ivpu_device *vdev = job->vdev;
>   	u32 i;
>   
> -	ivpu_dbg(vdev, JOB, "Job destroyed: id %3u ctx %2d engine %d",
> -		 job->job_id, job->file_priv->ctx.id, job->engine_idx);
> +	ivpu_dbg(vdev, JOB, "Job destroyed: id %3u ctx %2d cmdq_id %u engine %d",
> +		 job->job_id, job->file_priv->ctx.id, job->cmdq_id, job->engine_idx);
>   
>   	for (i = 0; i < job->bo_count; i++)
>   		if (job->bos[i])
> @@ -564,8 +564,8 @@ static int ivpu_job_signal_and_destroy(struct ivpu_device *vdev, u32 job_id, u32
>   	dma_fence_signal(job->done_fence);
>   
>   	trace_job("done", job);
> -	ivpu_dbg(vdev, JOB, "Job complete:  id %3u ctx %2d engine %d status 0x%x\n",
> -		 job->job_id, job->file_priv->ctx.id, job->engine_idx, job_status);
> +	ivpu_dbg(vdev, JOB, "Job complete:  id %3u ctx %2d cmdq_id %u engine %d status 0x%x\n",
> +		 job->job_id, job->file_priv->ctx.id, job->cmdq_id, job->engine_idx, job_status);
>   
>   	ivpu_job_destroy(job);
>   	ivpu_stop_job_timeout_detection(vdev);
> @@ -664,8 +664,8 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority, u32 cmdq_id)
>   	}
>   
>   	trace_job("submit", job);
> -	ivpu_dbg(vdev, JOB, "Job submitted: id %3u ctx %2d engine %d prio %d addr 0x%llx next %d\n",
> -		 job->job_id, file_priv->ctx.id, job->engine_idx, cmdq->priority,
> +	ivpu_dbg(vdev, JOB, "Job submitted: id %3u ctx %2d cmdq_id %u engine %d prio %d addr 0x%llx next %d\n",
> +		 job->job_id, file_priv->ctx.id, cmdq->id, job->engine_idx, cmdq->priority,
>   		 job->cmd_buf_vpu_addr, cmdq->jobq->header.tail);
>   
>   	mutex_unlock(&file_priv->lock);
> @@ -777,7 +777,8 @@ static int ivpu_submit(struct drm_file *file, struct ivpu_file_priv *file_priv,
>   		goto err_free_handles;
>   	}
>   
> -	ivpu_dbg(vdev, JOB, "Submit ioctl: ctx %u buf_count %u\n", file_priv->ctx.id, buffer_count);
> +	ivpu_dbg(vdev, JOB, "Submit ioctl: ctx %u cmdq_id %u buf_count %u\n",
> +		 file_priv->ctx.id, cmdq_id, buffer_count);
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   
>   	job = ivpu_job_create(file_priv, engine, buffer_count);
>   	if (!job) {
