Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E7BAC6E12
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 18:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC4910E5F7;
	Wed, 28 May 2025 16:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L/aOoT7n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061.outbound.protection.outlook.com [40.107.102.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9B210E5F7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:34:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpdrU848KtzS23AiPfOsCa+Nb5lUVChgNkKrp9eO3p/dEwGF6Q2bMeq1LW8g2kdZE04HrxErt1uHkOQIRTp9gINNYBZd7wHWIWFdAVhLrfpO4rnjh0r64TQ/Ka7AcSLQQ2eEK+dn/+jAZVEz23CEXWMLalWcPd1RC6/BAIpoSFDLUnPSfvnMIortiGG17Up5VIP3Kpn88g2Cm2WUGwGHuQMuTvH/yZCOEHkDHHdpEjVmc/fUcUVYu/tt7q2/X/8Q9oVEQTCRcmgj0JsI1WExqg7ZkaP5XAiwEVzUjOksbLeqdBJwlvsiol4A9lxLn/NMh9Oi61R3TcekbDRWmi28gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+MVmmMsiKOKk1GwFH8M8L3p/blHM4m/mfYKAnpVCAU=;
 b=M4FKFZ4loNQXWoxJG65/sqL6waGXcLvhApb3o7kQk6L9FJbsQZZg6Ty9vicfZrW83mUkaHvYL7XAFGP/0q1OjIJhtg2bPPkviE4guT+nlIw8hprTqXinrdjByvQDmEruTseU+WC2LvL9JVLcZKG9+fp0nHRJB2Duas9ZeDVJvXkEXzxZpcUc9NRn9E8DOG/yXvy937VqZ+Jfxq4xzM/Teqj9xTULpRAnlnEEJkDV3H2e2xv6AAClci3U3mh1fc0CTZhMP3kPyUtuqYDtAwlLXAx3ugAt1uhvTrolLZ7ECRGdOSiIdY54HP0JgSIigmGaWE7sA+yEoeNyTXs1r1ooKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+MVmmMsiKOKk1GwFH8M8L3p/blHM4m/mfYKAnpVCAU=;
 b=L/aOoT7nXRRM9xKvBVeu1lSx7LjcmGGuBX0q32IEIUlSzk0SfYn5EIK4WKnR8Vyy6+fVbISIWSGurjDcnm5cNrra3ap8UVtVlGoY8GvbVssI2TZTLvclUz8nRI3GJbj5w/02mAe+Lis3I0QAL9o2m6orSQhELLW05LD9wr0RdL4=
Received: from SJ0PR05CA0061.namprd05.prod.outlook.com (2603:10b6:a03:332::6)
 by CH3PR12MB8910.namprd12.prod.outlook.com (2603:10b6:610:179::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 28 May
 2025 16:33:58 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::11) by SJ0PR05CA0061.outlook.office365.com
 (2603:10b6:a03:332::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Wed,
 28 May 2025 16:33:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 16:33:58 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 11:33:57 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 11:33:57 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 28 May 2025 11:33:56 -0500
Message-ID: <f2cc768c-3daa-3219-a0e4-703cee8abd78@amd.com>
Date: Wed, 28 May 2025 09:33:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Fix warning in ivpu_gem_bo_free()
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <jeff.hugo@oss.qualcomm.com>, <stable@vger.kernel.org>
References: <20250528154225.500394-1-jacek.lawrynowicz@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250528154225.500394-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|CH3PR12MB8910:EE_
X-MS-Office365-Filtering-Correlation-Id: baf21262-e22c-47b1-e3ba-08dd9e057206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejdRVlhKa2NNUUFTNHZ6eml3d3BHdHJNTWF3WEp4NXZUNkJCTFVZdDFobUd5?=
 =?utf-8?B?eE1QemxHUVRDY24yNENvSmVXcEZYQTBWcHhiNzZ2NW5penZQVVFPWDVjU29s?=
 =?utf-8?B?eFhCRVQzWGp5M3lmL2lvMDVhdnA1SzU0ZGdhZ291U2VTVXBpTHpjQ2tPZEFH?=
 =?utf-8?B?L21iU08xWWlVN0t2OGwwN0F2L091b2xMeWE4Z2t6STFwcjEwWlhjaXl3TnJs?=
 =?utf-8?B?a0FWenFhVDQ4T3RXblVJTkFWVlBPSWhjRWtOTVFHOUVIUVpUTFFIN3diM21Z?=
 =?utf-8?B?b0ZBMGlmbStVbWxnVFBGUmM0cnRaNjV4c092MWdGVlBRQ2REaFgzd0hvcC94?=
 =?utf-8?B?REZpMm1KTWpFSGlBSVZHZzhwOHZXQVJCUUgxUnpsMWJRWEFQTXFHbjArQXRi?=
 =?utf-8?B?djl1WXlKYnpkakY4SkdHWWcwQlpNSnBXYTY1Rk9aaGxxditHQUVySHdaUTYv?=
 =?utf-8?B?SUgzVHFrSFhRNFpreWlRdkFKTnoza0k5K3VWc0hHZGVlUGQwTmtxRGtRWk5K?=
 =?utf-8?B?bHo5MFdSZ1hGbnJZU3B3aXJyTWxMSU0yU1RzOW92TEpadXRkUzFod2M3VlNw?=
 =?utf-8?B?Z0lVRm5SL01yTUVYa2hubTBiMFVIVkJMY1N1cTQ0Ui9TV2NjaTRkbXd6RzZS?=
 =?utf-8?B?RjBZY2lLRm84eW5aQkRyZ1UxWkdJZWRTcmxtL2lrQmdXUGVFSHU2V1pONnRx?=
 =?utf-8?B?blJJc3M5clJBTnlydU4vQjVmVEpNZ28wNG9xWXFNdU12SUpOZ2RmNWtXcTJs?=
 =?utf-8?B?Yk9YelM3MXQ3OVFnZW5ZNWZ4YThWK1ZIdWM4MGROL1c0YU5OWWFadXdLUHF3?=
 =?utf-8?B?WXFXUkczU3pLaHltU01NR1VXWFVIZC95WitwMVJKNC9aTHBsanlpNE10RWVP?=
 =?utf-8?B?V2hMVGZiUER5eUs2OEJzd2FMZXlwMUs4ZjFqd084aDVkbGNWWXZmaTdnZ2xQ?=
 =?utf-8?B?anFjSWdvUzZYUUp6UkFCekJ4cy9ZS21EUllIN2J6WldHZmt0cDNyODh3V1RP?=
 =?utf-8?B?dUZTdnh3aXVnMnVBTjEwT1ZuZ2VHNmpNaHc2Vjh6alVZUXlrc3JnRDIyenpS?=
 =?utf-8?B?cW1nUTFrK0MrZGE4bVRIQUQ3YUpkUDBYL2toa2Z1Y2dOcmM2NUp6czFCUWxF?=
 =?utf-8?B?TWJUWVRqY3RhcUowSHpFSm5lS2JHY2k1QldPemtBZVpuY0tiUU5lVEVHL1Ex?=
 =?utf-8?B?bFhIa2diZnVYNjFOMjJXR3dIZTFSL2tNL2IyeGFLVUdidmwzVXVjcGtORnJT?=
 =?utf-8?B?QWhqNHIxcHlISlZTbU9ucmhhOTlUUURSdWxuQ05COW43SENLcm00K3VGNnhs?=
 =?utf-8?B?Tm1XTEx5UTFBZFg2b2pMN3NJRkIycGpOWVk2UjZJTGJ1eWh1Snd3ckRnN2U1?=
 =?utf-8?B?emswK0xiZ0N1dHpiK2VzVmhCaExvaEN6Z05zczh5eUFrcW5hSTc1Q3dVSU9a?=
 =?utf-8?B?OUU3RDVObmlnNkRnL0pGZ3IvNHoybDlmejF1akZ2K1Jrc2xMSlZJaTFzcEly?=
 =?utf-8?B?T0ZrWkZXYzhZR0h4RXd4TE1DMEMvSXRzelVCRG5KaEJlYkF6dlV6OVgxZ0FH?=
 =?utf-8?B?SEhrS0pTVzNNemw1eEpiNlIvUE11d2xwL0xFS0NNN3hRRUo5cEhXWUFXUXd0?=
 =?utf-8?B?Uk94RHdIaUtlVHJzbC9UY2VUNWk5R0tYckNaQldTNG95QWtuMjZZUWdpT3R0?=
 =?utf-8?B?WDZpOTJRNWtzOFlCTnhIVWVMU1lnODVJRURIZ0FjNVV6VE1sRmtCY1Rabk5l?=
 =?utf-8?B?UnlaZFJha2l5Smd2K1JleFUxZndjRHdmcHJqREZEL0dIYUpwSzNDMFdmWlM3?=
 =?utf-8?B?WW81U0NnRmRraHJFSUJma2NBa3dxRjBJMENhcVN2bU9FOENER2hsOHFrdXA0?=
 =?utf-8?B?S2xYa3J3UUl4WEZ0eWlZclRvRGJYKzlKMkNzYk03OStUaXVzLytOQzlSOG1U?=
 =?utf-8?B?VWRISUduNWZMblRPTlJ3UUR4MlB3WkhEM3hadHBEOURDSmxkRno0UDJFbk5r?=
 =?utf-8?B?QS9YaHc4M0R5d1dIRC8wbktFK1NtUytBNmJ6NzNkRnFaM084d2pnUzU4UmNm?=
 =?utf-8?Q?C6KdSS?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 16:33:58.0094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baf21262-e22c-47b1-e3ba-08dd9e057206
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8910
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


On 5/28/25 08:42, Jacek Lawrynowicz wrote:
> Don't WARN if imported buffers are in use in ivpu_gem_bo_free() as they
> can be indeed used in the original context/driver.
>
> Fixes: 647371a6609d ("accel/ivpu: Add GEM buffer object management")
> Cc: <stable@vger.kernel.org> # v6.3
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_gem.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index 5908268ca45e9..0371a8b4a474f 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -285,7 +285,8 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
>   	list_del(&bo->bo_list_node);
>   	mutex_unlock(&vdev->bo_list_lock);
>   
> -	drm_WARN_ON(&vdev->drm, !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
> +	drm_WARN_ON(&vdev->drm, !bo->base.base.import_attach &&
> +		    !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));

Probably drm_gem_is_imported()?

Thanks,

Lizhi

>   	drm_WARN_ON(&vdev->drm, ivpu_bo_size(bo) == 0);
>   	drm_WARN_ON(&vdev->drm, bo->base.vaddr);
>   
