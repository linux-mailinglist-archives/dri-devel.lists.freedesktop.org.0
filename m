Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D31C1652D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B471510E085;
	Tue, 28 Oct 2025 17:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ALpwHjiN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8195D10E085
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 17:53:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ceU9WZcz7bq3F5DFI+1ei64At47rqmuBAe9Cz6B3IgbVOugf/EZh07yzr2vKt69f7KjR4cK7ee5sY8HmgH9xcykbnpIJmhL+SBypEaFf9YHOTse7x9eu/Q2ulOulemtEB4qzGZSDlWE9FSTz360ePq/5ZgvaWr6PX4ZlMvisfoN7FidTH1JlKYuJuuZANMYu8kwW5cczeLC1LWKu3Z/Mr9oMH6Hyx93n5GBp5yAZ4xTR8ARz9/TaDn6t0SMuh7d6x487F988cuV3UOZKnSv3z8ZTYBsO+i+SZ/34sbAv59vefT1SCZkGirGSO/v7yfWOCDsobRwur+agdnHua7GDSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+OZ1iye5GLxsOerjreDtN5UfDhsAXnXIoirAYlVwwk=;
 b=ZBN/jOzzNHIGjY+nSvQ59wmcRONLECjQVrxqEut6vAs6WDrCebVU2lWVv8D6Y4EVEQ+FtEV3Ymj4z0stMVmXKFMVlQLBT0pbF8lJuXsQfQPfgmjnLcpOIFZjUCNmDgoP9wkT1BL86hsxnCby2AkZJu5QUboypwuvCwN6SsOb+3WHsM0G1Rl96r1WwSkiKXPVZk1O8VH6Sv4GYElvJSL00ka/aesG1WHHl8vFsdJY7XqUF1kkJSln1tYurENJ//yEmcPO9iC65Ny086dfkhdCAC9EaCmsbL+1nd6W/pH0kl1jtCIArf27q9l4e+J0BFcwVy+uh/TFIwd4CCsNFkp6ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+OZ1iye5GLxsOerjreDtN5UfDhsAXnXIoirAYlVwwk=;
 b=ALpwHjiNuyKig5YfNPLSU3EbMwBzuKbliLKd1RE+TswidIktzCz2RQH/olaQ5WzcnEu+7XgOzq+AZsbPodL+jpUb64mlb8XRphOUX3qBRUrwvySpX6RmFpArWDwSpOq37RHDoIG3h5E5n/gH6IU+Z9i5R1X6YNLsx+WehNlXP9Y=
Received: from SJ0PR03CA0295.namprd03.prod.outlook.com (2603:10b6:a03:39e::30)
 by CY8PR12MB7220.namprd12.prod.outlook.com (2603:10b6:930:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 17:53:50 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::bb) by SJ0PR03CA0295.outlook.office365.com
 (2603:10b6:a03:39e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Tue,
 28 Oct 2025 17:53:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 17:53:50 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 28 Oct
 2025 10:53:49 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Oct
 2025 12:53:49 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Oct 2025 10:53:48 -0700
Message-ID: <00645fec-6712-4791-2221-551b636b2c9a@amd.com>
Date: Tue, 28 Oct 2025 10:53:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/7] accel/amdxdna: Fix incorrect command state for timed
 out job
Content-Language: en-US
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>
References: <20251027205928.2247897-1-lizhi.hou@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20251027205928.2247897-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|CY8PR12MB7220:EE_
X-MS-Office365-Filtering-Correlation-Id: 42fdf2d3-e270-4d84-3c38-08de164af37d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFdKd2NNdDV3eHRrbFN4ZG1rbWFoKytHbDZsek5lWi9HM1ZERXM2Tk5sSk5Z?=
 =?utf-8?B?TEZWb2ZZVThaZ3QraVFpbURzcDhpK0RESU4vd0NuckEySWZZWllpL2k3WHlY?=
 =?utf-8?B?QXVwSFJIMFF1RlNMVENBdTNyRjVreFBqQnU1cUdLWkVpVjZ0QjlrVjQzWEVQ?=
 =?utf-8?B?YXdSSG9aT1FtbHMwa0hLVE96SDFsWE5qWWc4MVJLa1ZhbXVBcEo2TVpyRXFS?=
 =?utf-8?B?VXlPTGFYbjN0MUVJSC9Kd1laSVpCVjRwNnFmVk5mWHFiN0I3TWNrNmJ4Z3BR?=
 =?utf-8?B?cER5SytZbGlTN2hnbXpLU1dabDJFalkza3VJTGR4Q0Vpb2lqd3NDdUNqRTdK?=
 =?utf-8?B?RzRCa2ltOXNyZW9QZGZQSEhnYnRsQ3lWM1dNaTEvQjF4TnVFdjFoalRyS2FF?=
 =?utf-8?B?L0pHOHdLS0RMSmZTM0NleG9KbVJwQmtRNUdVb0RCUXdLZ1F6Wm5zWS9qVnc5?=
 =?utf-8?B?WnB0Z1BSclNUcjgrc2hKNDNCL3ROczJCS3ZNVGJRbGp0ajNMUDRvM0pNT291?=
 =?utf-8?B?aDRTVUluQ09XOHBWUlAwaW5sU0p6Tm5tdUJhd3VJWXZiWW53K2pDb2I2N0Fh?=
 =?utf-8?B?bC85bUhJTUY0bTBjV2JlTFlOc3BpT2M0cDc4Q3F1UUxVY0ExdXArMEFETHhG?=
 =?utf-8?B?Wm9LOTdwZ3BLRXVmN3E1bk13dm9iMmpqd0RPRXNsOW1BSERQSE9UdzZ3K2s5?=
 =?utf-8?B?UHdQN1QzdmdITm8rNllwSkVBZUdMWVIxaTRUdXhWNmU2cGYyOUdzdEFoRzRO?=
 =?utf-8?B?Wk1rQUtHVHVwbzcySVZnRnZiN29hRGx6MUVuNE9aZUZoczVkcTR3WE5aR0pD?=
 =?utf-8?B?QUxnOXpJWUVVV0o1aTVlWUpZQm4wZ1lXYmxkaTFhdXBETU1XR1B3SEF0dmxz?=
 =?utf-8?B?OWhCOEQ5SW1ERExKb2hPWmNFMXJMcm1PaEZFc2pSVDhoN0ZCRCtHR28ranhl?=
 =?utf-8?B?VEJMY2NKSWRsazZ0MU83L2ZXdWtiMHJ2OGlOUDB0WHNCZkY4VC9DL3BKKy9Y?=
 =?utf-8?B?bVc2NXlHMXlheSt1dlRYeFhBcDVWdmx3TDNjZkJjRFJvS000MW5hNWgreTFh?=
 =?utf-8?B?U0ZyTmo1MG13ZXVuWm1JaTF1azduSXROdEpobTdvMDEwZWp1aXd5QkxteDdG?=
 =?utf-8?B?L2xrZDBmYStJTXd2WUVpTE13cythTkoxdVJTNzA4bVRvUm5LeGNLRnAxZ3Ez?=
 =?utf-8?B?bDJnT2J2SUdINEpjVitKWUxHeUUreklGcURPQXNhd1pEL00rbE0zN1loUjBt?=
 =?utf-8?B?MFBnU0c5RzBjSFV4OGpOUWxRek4xZlB4Um95ZnBkcytTaHlzWUlLbUM4a3hM?=
 =?utf-8?B?d0xJMUhhN1F6RW51RUFyOWN4bXA1UmJRbUkycjl5OFNsMkFDWjNxU3QrdHM2?=
 =?utf-8?B?cktodyt1dzhNWDJPbmhia0wwLzQreW5zQXp3Mm01elRrTDFya3NRUHhhL2hD?=
 =?utf-8?B?T1FUSnVsMzdyNnR6a2hvQ1ZKNEtCL2FvaisyRU9NUkFMb0JIU1g3T3dpb21G?=
 =?utf-8?B?OVkzWXoyVzljbmRkL2RZL2lrSFM5RnZkT2FJbXlyNXdpdk1iTUw0TSsrcGN5?=
 =?utf-8?B?ejg4M3ZlZjJmclBHZXdwektNWHZjOGVwTHBGaHBES2FHSGNUMHNRUDZtZW9K?=
 =?utf-8?B?bTFnZlJiT3RTUml3RWoyV2gzY3dYRU5hTFBkaEpld3I2K0h4eElrckhJa0pV?=
 =?utf-8?B?S0hsdWVLWCtKYjhicHpSbXYxUDhxU1dOdGhYRE9jQURJMXEwN0RHOHpHVDc5?=
 =?utf-8?B?QWdES1UyUVdaSk5kbDhmc1lEV3VRcFVsU0N6WjBINUJaYUJEZ1RxMEVITVhs?=
 =?utf-8?B?WWM3YXBPV1lTT256SVZmZjlkT29ILzBlTnZjUjhEVG5DbEhxMXIrTjg0NGxY?=
 =?utf-8?B?TTZyTHlMZ2xTY0RrL2crem0zbFJMK09kS0pzRGRUZ0R5UGllVlFjYSt4ekRo?=
 =?utf-8?B?MWU0UGowT2o2MDAxRm1FNStydGRKcjZZQUFwclpwTEZkZlJ4aXZyNDU4c3VY?=
 =?utf-8?B?RzJGWll5TjdWWlJINm8yUEVVY2xZYitzcDZkQVlyMUFmcFRqQ3pKRUpjUE84?=
 =?utf-8?B?YWNjN2dhWUtUOGx5b1JVdnBaTlArZG4wWHpSRnJjVEN4c3BXNGI5SjduU2hQ?=
 =?utf-8?Q?0HsY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 17:53:50.0284 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42fdf2d3-e270-4d84-3c38-08de164af37d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7220
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

The title [PATCH 1/7] is confusing. I will resend with a clean one.


Lizhi

On 10/27/25 13:59, Lizhi Hou wrote:
> When a command times out, mark it as ERT_CMD_STATE_TIMEOUT. Any other
> commands that are canceled due to this timeout should be marked as
> ERT_CMD_STATE_ABORT.
>
> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_ctx.c    | 12 ++++++++++--
>   drivers/accel/amdxdna/amdxdna_ctx.h |  1 +
>   2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index c6c473c78352..958a64bb5251 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -204,10 +204,12 @@ aie2_sched_resp_handler(void *handle, void __iomem *data, size_t size)
>   
>   	cmd_abo = job->cmd_bo;
>   
> -	if (unlikely(!data))
> +	if (unlikely(job->job_timeout)) {
> +		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_TIMEOUT);
>   		goto out;
> +	}
>   
> -	if (unlikely(size != sizeof(u32))) {
> +	if (unlikely(!data) || unlikely(size != sizeof(u32))) {
>   		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
>   		ret = -EINVAL;
>   		goto out;
> @@ -258,6 +260,11 @@ aie2_sched_cmdlist_resp_handler(void *handle, void __iomem *data, size_t size)
>   	int ret = 0;
>   
>   	cmd_abo = job->cmd_bo;
> +	if (unlikely(job->job_timeout)) {
> +		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_TIMEOUT);
> +		goto out;
> +	}
> +
>   	if (unlikely(!data) || unlikely(size != sizeof(u32) * 3)) {
>   		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
>   		ret = -EINVAL;
> @@ -370,6 +377,7 @@ aie2_sched_job_timedout(struct drm_sched_job *sched_job)
>   
>   	xdna = hwctx->client->xdna;
>   	trace_xdna_job(sched_job, hwctx->name, "job timedout", job->seq);
> +	job->job_timeout = true;
>   	mutex_lock(&xdna->dev_lock);
>   	aie2_hwctx_stop(xdna, hwctx, sched_job);
>   
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
> index cbe60efbe60b..919c654dfea6 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
> @@ -116,6 +116,7 @@ struct amdxdna_sched_job {
>   	/* user can wait on this fence */
>   	struct dma_fence	*out_fence;
>   	bool			job_done;
> +	bool			job_timeout;
>   	u64			seq;
>   	struct amdxdna_drv_cmd	*drv_cmd;
>   	struct amdxdna_gem_obj	*cmd_bo;
