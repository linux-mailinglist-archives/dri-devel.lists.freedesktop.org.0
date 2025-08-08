Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A57B1ED74
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 18:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633B910E00E;
	Fri,  8 Aug 2025 16:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="emlaOJjJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2080.outbound.protection.outlook.com [40.107.102.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1641910E00E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 16:56:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ty53RomnwrmC+K4c4sk8X9kNYYmwueutk10PDIrZxkJYTF9UStf/n4o4g+TuvTL9UgoMGZ0X0ZEGYrIZOSvBdjS5XPkTagk7ba8YzBqClefDZbSZvInuSJ2mV9kRnHjLMdpCmRLzQGz/PHy99QpdyWOonNw43uSYWU3F28PiDbxGWtHgjNwSQDGhZn7WXf+XR4scGO+wjZOh5qZli8pMVodaTHLCvigmS6ClWRx6zdCaK7EGH98ghZCllr/eNcWXlKKP4tGoBcik4So/Rg1zJOVRFH0fCNjiQ5lNxDdGCgGteGJbUyk7YRy+aNaGqbMgRpOvPUGf7fdyiKN9Sruk9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2dczc2OY40buaQXOi4gguAIV0G0c65YthFQpWMCjX8=;
 b=PqwNERf4FmGzz46lJR8kNWGPsQJ+IOmXruu5963VzWyq86QWQL/BpbZFoH1L66dGxmXXl/QnoLcMpWdN3wo1YHCULMFs1bjkCpwl5ulfNbnoii0vmZjHbhItkTOwWtL0rVz/MfMAYipTwYgxKjOc7WPMj/XfXd6yfZIasTxvHBBoVgQApAbGcgZVZRYAbPUM45akMyI1DIQqkN4bTk+rhAdNAdAmAa8Q69yPW9xcbJ6KXu1rF/heGKa7+hV6Ur0M+fq5c2hGyDy+oQUhqxcS421EGUg7XVzQiHaP/tGeKBLabgoHMzNX6Ya0kzkHM4hm73/qsLym3UUZG6EgpHx+qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2dczc2OY40buaQXOi4gguAIV0G0c65YthFQpWMCjX8=;
 b=emlaOJjJYdXCFT4F8afk/bDVwugektM+UA+aGPlCinsbJnPyyPN+s4HgqAoJkkSo5FlMTsbqN/CaEZIoRiBTjma5sOnJxUhSuMiTF8VkvRuqEbvV6p0MZ15TXdHqT6cy0X5qy2fYVlMo2xu3XFozZSyb9uOqNM3VYMRg7W7qsdM=
Received: from SJ0PR05CA0011.namprd05.prod.outlook.com (2603:10b6:a03:33b::16)
 by LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 16:56:39 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::70) by SJ0PR05CA0011.outlook.office365.com
 (2603:10b6:a03:33b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.9 via Frontend Transport; Fri, 8
 Aug 2025 16:56:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Fri, 8 Aug 2025 16:56:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 11:56:38 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 11:56:38 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 8 Aug 2025 11:56:37 -0500
Message-ID: <5ab495e1-9d86-fede-acd1-ae78a9dfcd94@amd.com>
Date: Fri, 8 Aug 2025 09:56:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Prevent recovery work from being queued
 during device removal
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <jeff.hugo@oss.qualcomm.com>, Karol Wachowski <karol.wachowski@intel.com>, 
 <stable@vger.kernel.org>
References: <20250808110939.328366-1-jacek.lawrynowicz@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250808110939.328366-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|LV3PR12MB9265:EE_
X-MS-Office365-Filtering-Correlation-Id: 25afb2d6-93d1-49de-82cd-08ddd69c8ab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckJleHR2T3lVSk41a2k5TU1wRnZIeHFUa0lZaEM1aGxtb1ptdGpybkdHaDlO?=
 =?utf-8?B?dkVHUFF1RjErYVZWY2Zselhlc0F2cGVKcWYra1hCZFY5QUdtaDIrbE1LRVg5?=
 =?utf-8?B?Q3J3Tmp4ckFhRnl6L0Fha0lYTEZQSWdqbkxUcWlPclE4VmRLSk9FNzk3R3pJ?=
 =?utf-8?B?UWhNaS9oREkrRFJVSkdpOEprbHBqRVdGTjhsRksrVWVZRGhucDh2a1BPN3Bu?=
 =?utf-8?B?YkdqK2Uvcm95dDByYXA4Tks5YWlKc2J3UXVYbFYxeFpmQkZia0pRMENIN1V1?=
 =?utf-8?B?ZnhXN2JWTnA1aExnRFQrZWE3QTE4QUVjNGtmWGhpTTE2VU9NSnpnTkdmNWh1?=
 =?utf-8?B?ZGtVZzVTSmRQbXRLeVFWdHpscForRjNPMHBGN2creU1ZTTk4K0ZXQUtobkxU?=
 =?utf-8?B?RDZmRG90a3E1TTV6ZXk5SGd1M3pPQS8rU3JITytkK2k3elBrbDliMmFqNy9W?=
 =?utf-8?B?a2hWamxuNG05ZTNiM2dQalhySW1ydWFYRTRpdFIxN1hyQlpraUVyWGlucUMv?=
 =?utf-8?B?eHlIQ3J1VEdTM1ZEUzhjSjhzYjNTbE1LRjhhUFFlRlc4YklRMWIwR21obUdk?=
 =?utf-8?B?dWc2elovWksyV25Hcm1hdDRNYUgrRC9mV3AySE9yZHgzRmQzOVMvOVRMVHln?=
 =?utf-8?B?UmFMMXNBcXJVMzU0ZnJJL0QzRUNVUURpbnlJYWJRMk5wTStyeS9RSkcwNHhn?=
 =?utf-8?B?cWQ5ZlVuYmRUZEpvT3N3SHRCZkFxdHBYTStzdFQvSU0rVkZGTEpSVnluVlFI?=
 =?utf-8?B?bktpYXNDSnA1MEZYN3NXYVpESjB0MldRMWJNcDNVaXlxU0tuZDVJeUQ4MGNw?=
 =?utf-8?B?ZUJpT0dOWnk3SEhEam9vK3laNGxMeGJkSjc3aGRJL3MvZStsMTdFa2Q2Ly9w?=
 =?utf-8?B?c0VTaU85NjVwOXFUKzVwcTdjdVI3RWF5UmZWbXNOQUxkL3VCaFpNb0lyN21G?=
 =?utf-8?B?K2t0TDZ2dTRXSkQvcUlvalNVQlI0d2xmTytVTUpKUWNQWTA5ZDFFZTVxNDcy?=
 =?utf-8?B?ZWh6SHYzRzVONVBUNUdLWUJnenYzQW0zKzB0dWRDKy94ZnFKS1cyT2pQYWxi?=
 =?utf-8?B?dHlKMmdna3pnamZURGVoSEM3blpETjVmY1IxTWRJM3VsNkg4TGZrdjd4b2s0?=
 =?utf-8?B?bERaOUUxZ2oyNWZXVzZlUmdZWlZlaENGOUJlc3Y0TnhmMGVjTHBuWnRmQklY?=
 =?utf-8?B?ZjUvSno4ejhRaG1kOXJWczZyWWpwZDcrWXdIVHNNc291UkhZd1lTanFOSm95?=
 =?utf-8?B?d09pVytzQVREYXNaSTdCRXhoWVFqS0VoL1A1NVFkNDc0RUhac29uVUw0SG4v?=
 =?utf-8?B?clBDTGpoWkkyMGEvOUpLK0kzZ2Z0S21ybWg3dXdNb0ZTa2J3MThxOGg2RlhE?=
 =?utf-8?B?aE5JaDI4SW5VTjVOV1JoViszeHFaaGZSM2duak9BT00ycSsxVStmK3RXUGpE?=
 =?utf-8?B?dzdydVcwYm83VUJmSDl1T2hOSCtyWWgwV3gvZkNVZFpQMWZhckNlbllHREFn?=
 =?utf-8?B?WkxBSU9EUnM4bzRBVHBBWGwyVGtBR2lqVEtIeE1wOG1Cb25EOU9zMWJFKzNh?=
 =?utf-8?B?Wk1lUXpTZlhlSVhzQm9pcXkzZ2tBalZxOXVPcUx2b01ua2tFUXh4SEx0aklo?=
 =?utf-8?B?eGhYS3QybXE5ZXNFVzVlMElTbjlwdlNyb00vdDh4VXF5czlGdXRWMkt6SzNT?=
 =?utf-8?B?V2Z1RXArcERQRU5lZjZaUUR4M0drNll2MmRkV0hrMDcrbUFWWEJVc3lRRDBu?=
 =?utf-8?B?RDFMdDRqVnBTcW1GY3NXSkN0aGtyMmd2Rk5qTDdlb0ZTMGloamxhbGpOdkVV?=
 =?utf-8?B?S0NCWU5yNDJQT1dKaVExQVBEYzQ4V0hEKzVoeFBTdkt4UzJicldtQ09BUnM2?=
 =?utf-8?B?c2EvTldFVm9MSmlCY2wxbzYzUWFWUXdhSUhZclRqSFRtdkoyNUFIRGd0THdW?=
 =?utf-8?B?VFZSczlBdTRUellMSFo5a2dzNEd5ZU9RSU95VmRxUFl4WXJyZktodEhJRXcr?=
 =?utf-8?B?UVNiMWFoZFd6a3BwQndaQ0ppdE1pTTJibUFVZGcvK1k1TUlDU2hEV1AzWFlJ?=
 =?utf-8?Q?UWe0TR?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 16:56:38.5200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25afb2d6-93d1-49de-82cd-08ddd69c8ab0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9265
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


On 8/8/25 04:09, Jacek Lawrynowicz wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
>
> Use disable_work_sync() instead of cancel_work_sync() in ivpu_dev_fini()
> to ensure that no new recovery work items can be queued after device
> removal has started. Previously, recovery work could be scheduled even
> after canceling existing work, potentially leading to use-after-free
> bugs if recovery accessed freed resources.
>
> Rename ivpu_pm_cancel_recovery() to ivpu_pm_disable_recovery() to better
> reflect its new behavior.
>
> Fixes: 58cde80f45a2 ("accel/ivpu: Use dedicated work for job timeout detection")
> Cc: <stable@vger.kernel.org> # v6.8+
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_drv.c | 2 +-
>   drivers/accel/ivpu/ivpu_pm.c  | 4 ++--
>   drivers/accel/ivpu/ivpu_pm.h  | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index 3d6d52492536a..3289751b47573 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -677,7 +677,7 @@ static void ivpu_bo_unbind_all_user_contexts(struct ivpu_device *vdev)
>   static void ivpu_dev_fini(struct ivpu_device *vdev)
>   {
>   	ivpu_jobs_abort_all(vdev);
> -	ivpu_pm_cancel_recovery(vdev);
> +	ivpu_pm_disable_recovery(vdev);
>   	ivpu_pm_disable(vdev);
>   	ivpu_prepare_for_reset(vdev);
>   	ivpu_shutdown(vdev);
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index eacda1dbe8405..475ddc94f1cfe 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -417,10 +417,10 @@ void ivpu_pm_init(struct ivpu_device *vdev)
>   	ivpu_dbg(vdev, PM, "Autosuspend delay = %d\n", delay);
>   }
>   
> -void ivpu_pm_cancel_recovery(struct ivpu_device *vdev)
> +void ivpu_pm_disable_recovery(struct ivpu_device *vdev)
>   {
>   	drm_WARN_ON(&vdev->drm, delayed_work_pending(&vdev->pm->job_timeout_work));
> -	cancel_work_sync(&vdev->pm->recovery_work);
> +	disable_work_sync(&vdev->pm->recovery_work);
>   }
>   
>   void ivpu_pm_enable(struct ivpu_device *vdev)
> diff --git a/drivers/accel/ivpu/ivpu_pm.h b/drivers/accel/ivpu/ivpu_pm.h
> index 89b264cc0e3e7..a2aa7a27f32ef 100644
> --- a/drivers/accel/ivpu/ivpu_pm.h
> +++ b/drivers/accel/ivpu/ivpu_pm.h
> @@ -25,7 +25,7 @@ struct ivpu_pm_info {
>   void ivpu_pm_init(struct ivpu_device *vdev);
>   void ivpu_pm_enable(struct ivpu_device *vdev);
>   void ivpu_pm_disable(struct ivpu_device *vdev);
> -void ivpu_pm_cancel_recovery(struct ivpu_device *vdev);
> +void ivpu_pm_disable_recovery(struct ivpu_device *vdev);
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   
>   int ivpu_pm_suspend_cb(struct device *dev);
>   int ivpu_pm_resume_cb(struct device *dev);
