Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1284A311DA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 17:40:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24A910E704;
	Tue, 11 Feb 2025 16:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jz5L2FZN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721B110E38D;
 Tue, 11 Feb 2025 16:40:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=De6ujw7LzhV/Ehsc4+iEvapELZaHo7l98mATDgH0OTg+S9fU3aHyyFuD8KnXhSzXU9VwkUXOcxh917o5HU0BBNKGk6BI5SqTfhr4mBEqqjInNybYyk4IfACgo3NMvV3ou/VKTXFf369kO2alUeGtsTqc2pSBlDB81CpnVqD+80lohOy1JslbxeLRURGhulut8ZGJgVXKWOyXoCdsY7fcSZ9u/urCuT0yZDLPzjaj6k8qozkvdpEO/OJp5hAXgjSo+Y+o35/HvSDSf4WsYSm2kaIlfYqb+E7R13LdqKJpxMNZXtpgt28LwEL/U+GZEt+chXwBxeobfuwODpHi8BtR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hse4J9WFYExOzM2VWpB2gOd2bbR1jDffLbyfIjZ+GtI=;
 b=hzSpkG1bLxZU+BPa6iZE1xFsbpnV/QcxQD9dGAAGXrnZ1uCqKyonTT7UW55DHxOnxXMV+CLAtlW+Vcl79HgufH253Z+tnlNt6/uHwHT619yie1/SX1IEaLPMCFw5VCdRCwJq45v+aKg0A+4+8Vk9YvpQqlXY8R1aZVt8tqPTZFHNTOqoEZAVV6QzuscCa7PVV+E+RCawmdXJCkvfCTLHdLz5sSqGwY1jSza5FOuqgHM0gHOs71LHzgbgFgXh3VW8bZ9UCSEyKXSDe5bdmaVmL+10GTs9OsGu7obm215Aue9bFP0K9FLRmvaofbNlSscFIr4nNzQ57PBkb7KtVq/KGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hse4J9WFYExOzM2VWpB2gOd2bbR1jDffLbyfIjZ+GtI=;
 b=jz5L2FZNal9T5t4jBfpw6OonQPq8QmenMKNXLjLRH4sXgpZCXv6T4TeHe1Ri7MhnU1VHsXkhGXknynhXMzs0aPKRMT1WEjxUVG8sLMlRjeRvzP80ouFxcj0wAM0vVoCdssQDwwjHXC6zyROu3vMpgstZXhezJqK8HUuL/afiZcs=
Received: from BN0PR04CA0112.namprd04.prod.outlook.com (2603:10b6:408:ec::27)
 by DM4PR12MB6157.namprd12.prod.outlook.com (2603:10b6:8:ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 16:40:38 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:408:ec:cafe::75) by BN0PR04CA0112.outlook.office365.com
 (2603:10b6:408:ec::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.11 via Frontend Transport; Tue,
 11 Feb 2025 16:40:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 16:40:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Feb
 2025 10:40:37 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 11 Feb 2025 10:40:33 -0600
Message-ID: <49777292-dbfb-2164-6932-849a8ad96b7c@amd.com>
Date: Tue, 11 Feb 2025 08:40:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4] drm/sched: Use struct for drm_sched_init() params
Content-Language: en-US
To: Philipp Stanner <phasta@kernel.org>, Min Ma <min.ma@amd.com>, Oded Gabbay
 <ogabbay@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Frank Binns <frank.binns@imgtec.com>, "Matt
 Coster" <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>, "Rob
 Clark" <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, "Lyude
 Paul" <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost
 <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=c3=b6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 "Hawking Zhang" <Hawking.Zhang@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li
 <Yunxiang.Li@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <etnaviv@lists.freedesktop.org>,
 <lima@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, Christian Gmeiner <cgmeiner@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20250211111422.21235-2-phasta@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250211111422.21235-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|DM4PR12MB6157:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f2d2fe-ffd8-4608-7f60-08dd4abad0c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2lIR0RBeXFmWkpXQTZQU1FSTTRRTmtVNTI1bnBsbk5LS2cyOVJhTEV1NDNG?=
 =?utf-8?B?MGd1WkNnOFJxbmlLVjM0ZzVheTFmME1JSUhrWFpwdmllLzVpMm94QTVCYklO?=
 =?utf-8?B?ZkNtY3UzeC9peXZKbUpmYTFzNFpjbFFhajVETnE2azVXeHNoZ25KU0RSNDVW?=
 =?utf-8?B?cThsOExBVkVySGVXZ3RodHlQY3l6WGxlcTU2ZWpYa1gvdjQ2RnVhdDNEcER1?=
 =?utf-8?B?NFRkSlhjSWxFaDFvMDJJSWdGUm9DcWFsSlFIZktMR2tZbDVXdzEyLzhQSGdE?=
 =?utf-8?B?TFJSZnRQRzZTUHdjQlRKUjdnYlExbnEvRmgvZnZHMHhZTnQzaDFRalFmemxV?=
 =?utf-8?B?T3VaNTZkVUpCOTFQTHhPeENFVjNvek5YVVdUSnhYMlRkVzl1U3VCc0YvWHJR?=
 =?utf-8?B?Rzd5Z3BkaWFORXBlOWRoNmpwc3gyZkJyRndZR0JBbjI4V2doYUZod0NIc1R0?=
 =?utf-8?B?Tk83TWI5VHQ5SkxMeEtZRjdyYXEyWkozVkJDOEZRdjFjWUpBdm5kN3V2dG4v?=
 =?utf-8?B?TGVTLzFBVG8vOXlSOUFXR1E2N0hudVk3aGxPT0pITitkSGlwL08xbFlSNDIy?=
 =?utf-8?B?Wm9Cck1UeE9YYW5rQkg3dHU0NUtQTmFubDJJZ0dGL1c4L3dTenVHdFZ6MWFz?=
 =?utf-8?B?R1RDSG01dTJINXhYdGJOb3BWRnRBNU4yQTNyQzlkVUlQdWw2Wnl3U0VXbjl3?=
 =?utf-8?B?QzFnTGVBa0ZVR2REbzRZWXkxL3FSRjdXWXZ0OGQyTFdsOXRXYTNraldlaTNR?=
 =?utf-8?B?b3RXMWJmOENCTktjdnBDeW9LQXFNQi9lWk5taDhZYlo2RlVPNHRJc1JuOHRt?=
 =?utf-8?B?SUdsMjM5L24vbHJrYmpRTldRVzhPY2hFZ2xzVldJcERpY2V2eUU2S2pqQzdm?=
 =?utf-8?B?NWpJZ2RoYjdPNUVkSXdEeHVXUTIyMkdmdmt3UHJuMldTWUJnTGtCcXJjQVZH?=
 =?utf-8?B?SlFoVG56WmowVjkrQ00yZHg1ekhuTCswVm1YL3RYZEhVNGlQNllmQ3R2ZUkx?=
 =?utf-8?B?SW9LSTVXb2Z2NWtUVlllK3FDQkJ5Y21XNDA4bzJZaDMxZWU3QnBoVWgrL0Vt?=
 =?utf-8?B?dEJzVWxQV1JkekFFeUppdE1aZGtUYkw4L3RUTUhheUdWSlpNZDRGUzVCWWdX?=
 =?utf-8?B?cGNNNGhHWTdVcjMrZ1pOZjJUdmtoWVhWTGlaSnhjYnpOWFJPVVVmblZqcTBl?=
 =?utf-8?B?WGtOSGlhWlh3R2VaRml4aW5nU1ZUNVFKZXdGRzJHUEk5MGRaakppS1RWeVM4?=
 =?utf-8?B?Z2NnZkhhb2VFWWhZaHBIN3JSTTVUaVlpZm85QldlZ0FGd1BCRkVzZVBkNVlX?=
 =?utf-8?B?cWZLMHpqUmpsc0VlQUg3eW5uUjF3U1F4TktpaWMwb0U3S2YyWmJaSUFvR1Bo?=
 =?utf-8?B?Z1RLTmtQdW5qdGp5aXBFZWozMnFGNVRwZkFubEdBZDdqQXI5UEluR0FORGZK?=
 =?utf-8?B?UmxON1lYUTdSdGxPRjRWOTBuK3Q0T3VMNUxpUUNEMmxvaUYyQytTVWVQcjIz?=
 =?utf-8?B?MXMzdzhiN3RiclV1T3ZUcUV3K0tYbWU5TFlIK0NhMlFvMzBUTmJTRVU0MkpV?=
 =?utf-8?B?WHNSQUtSRUJYY2xtNERnSzdUQ01xVE16eUg1eGtMT3UwNkovQ0hicmZiWGll?=
 =?utf-8?B?aHNiVzZuQjhwdG4zMHlrdlRJUlppYzdpdUF1cFR1RXhTT1pSSEhtMVFyZlFP?=
 =?utf-8?B?K2pIeUlPUE9GZnNuc1ArT1RQbXZxa0lXNDg4enhMZk9FZEVTWGk2ejlOb1Vl?=
 =?utf-8?B?cmQycy9WRm93TGxUUFNyaW5oMURIMjUyeHI2VktoU2FWekxad29tQ0kvWjFz?=
 =?utf-8?B?Y2NBb25keEpJWW1mQnB4THVjYkVGVnpWcUk3RndCd1ZTbEh2R0Z4cHVvS0JN?=
 =?utf-8?B?bkJIL1VLODY5QXlQVUQyZGlYMXBHQkdlbXFNanZxRTByWDdhMkc5QlpIUi9k?=
 =?utf-8?B?Rnp4NStXS3hpOFZuL3dWa2RjaWYzR3A3NUtFQzJPeWxVNzVwc1lKNkhGTjdH?=
 =?utf-8?B?UDAvRVJEb3FaOURqZitOdHV5cG9tRzB5YitmMG1zeDY2V0llVElvYXRDR3cz?=
 =?utf-8?Q?l5jxCf?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 16:40:38.2739 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f2d2fe-ffd8-4608-7f60-08dd4abad0c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6157
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


On 2/11/25 03:14, Philipp Stanner wrote:
> drm_sched_init() has a great many parameters and upcoming new
> functionality for the scheduler might add even more. Generally, the
> great number of parameters reduces readability and has already caused
> one missnaming, addressed in:
>
> commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
> nouveau_sched_init()").
>
> Introduce a new struct for the scheduler init parameters and port all
> users.
>
> Signed-off-by: Philipp Stanner<phasta@kernel.org>
> Reviewed-by: Liviu Dudau<liviu.dudau@arm.com>
> Acked-by: Matthew Brost<matthew.brost@intel.com>  # for Xe
> Reviewed-by: Boris Brezillon<boris.brezillon@collabora.com>  # for Panfrost and Panthor
> Reviewed-by: Christian Gmeiner<cgmeiner@igalia.com>  # for Etnaviv
> Reviewed-by: Frank Binns<frank.binns@imgtec.com>  # for Imagination
> Reviewed-by: Tvrtko Ursulin<tvrtko.ursulin@igalia.com>  # for Sched
> Reviewed-by: Maíra Canal<mcanal@igalia.com>  # for v3d
> ---
> Changes in v4:
>    - Add forgotten driver accel/amdxdna. (Me)
>    - Rephrase the "init to NULL" comments. (Tvrtko)
>    - Apply RBs by Tvrtko and Maira.
>    - Terminate the last struct members with a comma, so that future
>      fields can be added with a minimal patch diff. (Me)
>
> Changes in v3:
>    - Various formatting requirements.
>
> Changes in v2:
>    - Point out that the hang-limit is deprecated. (Christian)
>    - Initialize the structs to 0 at declaration. (Planet Earth)
>    - Don't set stuff explicitly to 0 / NULL. (Tvrtko)
>    - Make the structs const where possible. (Boris)
>    - v3d: Use just 1, universal, function for sched-init. (Maíra)
> ---
>   drivers/accel/amdxdna/aie2_ctx.c           | 12 +++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 ++++--
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c    | 20 +++----
>   drivers/gpu/drm/imagination/pvr_queue.c    | 18 ++++--
>   drivers/gpu/drm/lima/lima_sched.c          | 16 ++++--
>   drivers/gpu/drm/msm/msm_ringbuffer.c       | 17 +++---
>   drivers/gpu/drm/nouveau/nouveau_sched.c    | 16 ++++--
>   drivers/gpu/drm/panfrost/panfrost_job.c    | 20 ++++---
>   drivers/gpu/drm/panthor/panthor_mmu.c      | 16 ++++--
>   drivers/gpu/drm/panthor/panthor_sched.c    | 28 ++++++----
>   drivers/gpu/drm/scheduler/sched_main.c     | 50 ++++++-----------
>   drivers/gpu/drm/v3d/v3d_sched.c            | 65 +++++++++-------------
>   drivers/gpu/drm/xe/xe_execlist.c           | 15 +++--
>   drivers/gpu/drm/xe/xe_gpu_scheduler.c      | 17 +++++-
>   include/drm/gpu_scheduler.h                | 36 ++++++++++--
>   15 files changed, 210 insertions(+), 154 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 2799729801f6..8ac01bc2f0db 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -516,6 +516,14 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>   {
>   	struct amdxdna_client *client = hwctx->client;
>   	struct amdxdna_dev *xdna = client->xdna;
> +	const struct drm_sched_init_args args = {
> +		.ops = &sched_ops,
> +		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
> +		.credit_limit = HWCTX_MAX_CMDS,
> +		.timeout = msecs_to_jiffies(HWCTX_MAX_TIMEOUT),
> +		.name = hwctx->name,
> +		.dev = xdna->ddev.dev,
> +	};
>   	struct drm_gpu_scheduler *sched;
>   	struct amdxdna_hwctx_priv *priv;
>   	struct amdxdna_gem_obj *heap;
> @@ -573,9 +581,7 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>   	might_lock(&priv->io_lock);
>   	fs_reclaim_release(GFP_KERNEL);
>   
> -	ret = drm_sched_init(sched, &sched_ops, NULL, DRM_SCHED_PRIORITY_COUNT,
> -			     HWCTX_MAX_CMDS, 0, msecs_to_jiffies(HWCTX_MAX_TIMEOUT),
> -			     NULL, NULL, hwctx->name, xdna->ddev.dev);
> +	ret = drm_sched_init(sched, &args);
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   	if (ret) {
>   		XDNA_ERR(xdna, "Failed to init DRM scheduler. ret %d", ret);
>   		goto free_cmd_bufs;
