Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D73EBEA4CA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 17:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354DF10EC6B;
	Fri, 17 Oct 2025 15:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Bt8CgtC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010008.outbound.protection.outlook.com [52.101.61.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766D610EC6B;
 Fri, 17 Oct 2025 15:55:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EIBQjeayllpp58VKAVWz7LV2cSAPZRIhlZndxq9GGvbI/2LzO/L8Qwuvf/yeQnQMHvgNDmdAf9e6bS/23yBATBHutNLxLnf1/KIfglbBGG0EtSmr2gFV4zDLeSnwMLbKV/bz1mDomhn5AALG2DnX/id1mHC/HK21//GIsxwtib5VsdP19fJ/P7JNKZ4gQo2QOvUU2bw+hghKR8UqWXsQLfLRlAbjdUc1rRsUd/F5GGsiIxwbI2qgyYbGoz9M1rswZZ/qbpaisJIAmGOq8hMkY1g0W9Dgc5JTsUQYaCemCu9Kj+icyq098UKLg2XDkJRPzR1ABE5qa0wB9MKEOSNeiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kwq4XXJhRgtL3qKSl7+4NLcQKm5yiV29T17rfrg/sSY=;
 b=P9QzolBv13cd4oJq/8xUPEPGOxmBEIvOAwc7EQwby4dMKzi+MgwUyWfSFehfaluTOaETMZxftjr/2dJ5FqF62s8bGHLQ1YC6kwBcJMsvHoTKQDYrNAArgXEf2j/BkMxdV6lthKvSIH7uaK4ukvcrVuO5Wv5UVsVlatOy2ls4OwZpIfL0je4vECjgbkE+fXw/3ydV49QpkBtUo22lXkNPvFXKe1ZvaFAsWy/gVlYScXwSWNG/yVRK+VWqiDVG44fHcF1ZF+CbUtQnStkuRXeVFZrcsY4fHj4ERCKuChYVUgY6ChrV+90RnSwtje+nhHMC9InB8cLg4l0B08L/g8MV3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=igalia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kwq4XXJhRgtL3qKSl7+4NLcQKm5yiV29T17rfrg/sSY=;
 b=Bt8CgtC3zjkxZ95q313xkRjWeT97ZY8Ktk+Zafv05bocz8A0K9rZbUIVvf1ezJ0p+M3CyxyI7lFgSed9FXYs1uz9kwcDMdrmpcDLIp53sAtsY8RldT5796zbenNixzcD0OHG5rUS2IFNUVvovJxaGO17xRAZsnaQBeTOoZgfybw=
Received: from PH7PR17CA0011.namprd17.prod.outlook.com (2603:10b6:510:324::20)
 by MW4PR12MB6828.namprd12.prod.outlook.com (2603:10b6:303:209::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 15:55:31 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:510:324:cafe::35) by PH7PR17CA0011.outlook.office365.com
 (2603:10b6:510:324::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 15:55:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Fri, 17 Oct 2025 15:55:28 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 17 Oct
 2025 08:55:27 -0700
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 17 Oct 2025 08:55:27 -0700
Message-ID: <809cd6b6-5333-0006-0a0a-69a5dafcecb8@amd.com>
Date: Fri, 17 Oct 2025 08:55:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 14/27] accel/amdxdna: Remove
 drm_sched_init_args->num_rqs usage
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <kernel-dev@igalia.com>, Min Ma <mamin506@gmail.com>, Oded Gabbay
 <ogabbay@kernel.org>
References: <20251017133644.44747-1-tvrtko.ursulin@igalia.com>
 <20251017133644.44747-15-tvrtko.ursulin@igalia.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20251017133644.44747-15-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|MW4PR12MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: 16e8c156-0199-4e43-1adf-08de0d95982d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmI5cERWcFZqSlFVeTB0SjVpR2ZUM3lDWVBSSjZmSDFGUVZYa3lEU3h1d1BE?=
 =?utf-8?B?MVBBdjJySTBhNEUyYlNkQ3ZsVlhnaHE4Y1BHazZBZy9IQmMzN0RkNzhJOGxG?=
 =?utf-8?B?cTF4ZUpMUmNDeGt5RGkzd3d1WS9mK2RnZi90NTFobTFDQTFtcnhPMkR2dWZK?=
 =?utf-8?B?MmpKS0RLL0pSWDNqUWJLVzI5dEtIODA4eGdVUnFiMU02QW5RTFJFSWZ0S0d3?=
 =?utf-8?B?VHhKdC84TFZOMjdLUllBc05zVGV4M2tYTjl3ckY2VDlPVG5HTVYzbGlIMFE4?=
 =?utf-8?B?YWg1VEdSRGswdldDdUFKVXdMdUhGRTdxaHNkUEhESXNSNkFrVHlxMWRjdThn?=
 =?utf-8?B?ejk3WE9GMlZsNnpwT3NJSGEwcnlOc3BHK1E1SDhQT2lPQUk3MUR0a1VFV1BO?=
 =?utf-8?B?KzFIeXRtNG8zVzNtYnE3dlhGV2hkSHhxZlJIbUpHNmIwaWxiSHh4RWxqUVF3?=
 =?utf-8?B?bE55b01vVDVYQWhSbmpmTFJwV1ppSVNTdDEzSk9wdkJRWGo4bHprbDVYMnFl?=
 =?utf-8?B?UEtYZngvbzE1Z3BiUENxMk55WjhKdkxNUUZtWUUwL2lFaGN2TG9HUVZnZmNx?=
 =?utf-8?B?TVNqT2dyOVprQTNvMzFhOTdieE9xNjAxRWQ4aHJVZkJONjQ1cHV2TzRGYTNm?=
 =?utf-8?B?U2JvUlFDcWdxNlpnQ0VTTzVnRmFWSmI1Vmh1NFV4bk5pekVPeit1MGwwU1Zl?=
 =?utf-8?B?VWhBSjdWWEs5TmpJMW1rVzFhZDJTSC90aGtZSTAwc1VDV3pZd0RyYXhkSUY3?=
 =?utf-8?B?bTQvcU5OYXhnRlh5VEtlYnorclErUEtQditmbFd6L3dSeGJUMzB3Zzd3dU5D?=
 =?utf-8?B?OTJ2TGcvTVo3TzZOdXI4dmZEZ1RPWHdENE5Oc1hVcDRHR01Ec2FkZEwyZVZO?=
 =?utf-8?B?S2xFNGJYK0hoRmdaWk9GTERLWWpUMjVMUXNUaDRlcFEvY21lR0JlTHhUcFg4?=
 =?utf-8?B?RHl6MytWRHd0YmNTNUhhWXhzdzFOaTJaODFaczl4NkRLK0tHTFZJUS9QSllJ?=
 =?utf-8?B?WWlIZnU0d2dHOGVndVFTYjBhQldsYVZFVW1kK2kxUnZqOXpBVlF0WmpxQnhL?=
 =?utf-8?B?d1FDck5CSUNYWkM3clJYUC9oSXZFdnhudzU2ZEtYMndHcjlOU1ErQ2MwQkVt?=
 =?utf-8?B?NmxOdmVzZTBObnQyMUR3Skt4YzREdzYxa3dZZ0F0WkcrTE56TDk1SGIzaWs4?=
 =?utf-8?B?QWRvOFRnQUVMUi84a2tTYm11NW1LUG5jeTBSRGwydkZOL0FYN1hEN29pS3BQ?=
 =?utf-8?B?NExDMDl6QURxenZ6SldMa2hWS0Fzb1JJR0dYaStYd1dDM3BEWG83ZzNwVS9C?=
 =?utf-8?B?aklnOFc4WmNCazdnUlNFT1ZabWtycVNRN0pKYTh1NUNxZ1EzR01WM1VCRDdj?=
 =?utf-8?B?ZytLNTdWMGZuNXhsK1JCQmVBTVI3UGRVMFZ0OXppcElUWExXY2Mvc3FtZkF3?=
 =?utf-8?B?TU9mRGRnVy9OY2lGMEpZQlZnRXJkYi9aQkU3Qzc1SUphWDRkb0R0ckR0TU50?=
 =?utf-8?B?UmloVUtBVzVENlpOaGcxaWEySzdaRDUvd0dsTHI1dXBRNnRhbjBlSjhvS2NT?=
 =?utf-8?B?ZHVpUXhQR0VSRFZHYzJvRTBDQk0xVW1IR0xPSkp4RmIxQXZXd0NtV0NWVU1o?=
 =?utf-8?B?V2M2RWF6czA2Q1pYQVpqREtSS3A4eUNESXBtQ0lMSGpmY1BSaGVFVU5DaTVv?=
 =?utf-8?B?eGs2QTVFWi9Zd1ZEclNlWHRaRE50Q2lqWk1lcmtMWGtzWngrT0oxTUVjN2hn?=
 =?utf-8?B?NTlZVlIveWhPUXIrYjg5Y1FWSTZGbTgyZTZyckVwYWcwYjBGWnAvK2F5MlZj?=
 =?utf-8?B?VmwrcjdLRHhuVUYybDBHMG5aMUt2c2RSZFd4TExBeGRRYkdrM1lQRW1kZXFZ?=
 =?utf-8?B?ZFIvZUNLMEd6czRUZ1d2NmppT0h5Nm90S2RReFJUVzZOR2kwWE1kTnN0WDFZ?=
 =?utf-8?B?VTFDOGlkcWJuSWRkRWlhTEZsa1JYUjkwbVBUUzE3QWwzVytNSmlEMFZ2Vjh1?=
 =?utf-8?B?TWV2N0FoK1dZSVk5bFZmVDJqQnMxc0JBT3pzcS9TWXNDYlM0WjAyVkR3Slhy?=
 =?utf-8?B?WnpKRSt1S0h3bTlUSWQ1RE9WeC9WaUFsaXVNc2QzaVMxeURubnh3MEhWUGsv?=
 =?utf-8?Q?iZYw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 15:55:28.6886 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e8c156-0199-4e43-1adf-08de0d95982d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6828
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


On 10/17/25 06:36, Tvrtko Ursulin wrote:
> Remove member no longer used by the scheduler core.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Min Ma <mamin506@gmail.com>
> Cc: Lizhi Hou <lizhi.hou@amd.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> ---
>   drivers/accel/amdxdna/aie2_ctx.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index ab4d66f1325d..e95e10556b00 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -528,7 +528,6 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>   	struct amdxdna_dev *xdna = client->xdna;
>   	const struct drm_sched_init_args args = {
>   		.ops = &sched_ops,
> -		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   		.credit_limit = HWCTX_MAX_CMDS,
>   		.timeout = msecs_to_jiffies(HWCTX_MAX_TIMEOUT),
>   		.name = "amdxdna_js",
