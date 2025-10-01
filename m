Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 273FABB1447
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 18:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819A510E0FF;
	Wed,  1 Oct 2025 16:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Lpxtm0YS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012044.outbound.protection.outlook.com [52.101.43.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1F610E0FF
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 16:40:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQeM4wykB21vc/PdegKgZBOZNMt1wcpmroFEAHSnhJszOYQiDsXGKEedtqhQrFMfeSXk+E92nIVwIdknFAzMDV+9B+LvEYD1CxjzwRmKdORmt+6qWV1/rD94Wtdd8B6OZLvubt/uv2fSeC4cGQ17bCfArouh6oL87Fm7YU3TTO64hlFznECrYZkJKjDcc6Gj04QUspPK3LUNL5mj7mciO6NNMI/sKq8i2UBxi/FWItRLRGslRKKU3Lm/Cw8G6q0Oxvu9RlTbHNR3Ka+KKr9wOcxo9nCrTMiJ5CwJrpNV/KUVq2+a/UUnptWPbiejPdYP8bNhaqa3zg/GKis+8E31ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5xZ6hApNwsafpROVt0iK02byyqNrPw5BWIOwVdoQ5c=;
 b=k4sF0Wf7NT3raJKSdZooe2mqpBkI0QY0mMt4GR6XrG0QEDo0fS/JokMWzDD3A4b8gD0TEWYIjj92OSxrjVvGDKdzNcMLtN8F8gorK+3GqtD7AYMk+w8c1j9QwfLT0fO+3N6C1+AqLdTltmCfL+TlKJQMYhw1hDBNbE0qxKZpwze4cGjIAj/VbffP0CIBs/QHoRAB1Rr6pVcU8cwGuaXyNXrGDSyZF4V6L3UzBrzkTwhY7i2Chm6TsWdszzdzey5B/BhemLJVsTYi/w/ljTOPMBkVatPcpp56UTjsoAUzWAxCJZd9je6nLN7Jt4eeARqFCH9GboDrPL+BnUV6L+Ogsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5xZ6hApNwsafpROVt0iK02byyqNrPw5BWIOwVdoQ5c=;
 b=Lpxtm0YSNOsd/sorYmXfQtQTtR6akuj0N9mfAwn2uVMZArlaWeF0CSiNO/XEdTCZFg9+U8ZN0+GkjdTcHfFav3aQ0L0jlk2NlS8gSQLMifR8U6cDLGihD3e4U+ZY+uVuNRnmU9DdC5vkqOzQqWVXF3vBa6nGwHNjOu/FLMSc2ME=
Received: from SA1P222CA0088.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::15)
 by DS4PR12MB9681.namprd12.prod.outlook.com (2603:10b6:8:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 1 Oct
 2025 16:40:17 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:806:35e:cafe::45) by SA1P222CA0088.outlook.office365.com
 (2603:10b6:806:35e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.15 via Frontend Transport; Wed,
 1 Oct 2025 16:40:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 16:40:17 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 1 Oct
 2025 09:40:16 -0700
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 1 Oct 2025 09:40:16 -0700
Message-ID: <989ad1ef-0719-ff91-c548-6b4435404954@amd.com>
Date: Wed, 1 Oct 2025 09:40:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Fix DCT active percent format
Content-Language: en-US
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <jeff.hugo@oss.qualcomm.com>,
 <maciej.falkowski@linux.intel.com>
References: <20251001104322.1249896-1-karol.wachowski@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20251001104322.1249896-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|DS4PR12MB9681:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b2b5485-1492-4ff2-3aa9-08de010933f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3Fua0xKNWgrckRJZmVFd05sUWlRNGVmOGZFdTJ4MXBqd2xVN2N5RHNXSWhy?=
 =?utf-8?B?eTR1VGw2ZWloYXVFWkp0UmY1VzdTb0V0Zitra3JxSzRmWmZLRm1NM2tQTEhL?=
 =?utf-8?B?Qk4vTkhINSsySFpoMkNWa3lBM25Jc0lVME9GcUJKVHRnMER5MlZHdmFtTTRR?=
 =?utf-8?B?Q1FDWlRaUGZTeW5QME80OGxYT1JXSnZzeWxRcVVmYm1XQytFanNUS1kvdUFS?=
 =?utf-8?B?YTBQeVlpT3hSS3N5c2k3V0gzRnlXMEFqeWlXczJ3aE1xUmM3d3hIRU05a3hP?=
 =?utf-8?B?ejlxamxYQVpqeGFYQkNPOUI3azQ4R1NDZkNLbGI1aDA3bGk4d0h6RVVmYVBi?=
 =?utf-8?B?Mnc5S3dPZDRkV3QyZVJmaWUzSEtJeDJjR2JVbGhDMlUvclgxajFGYmMvaU9o?=
 =?utf-8?B?aHBxU2FXazJkYVI1cFNEVW1pcU5XL2ZxeDRkV3B0MzB4Mk5WM010amk0Z25J?=
 =?utf-8?B?YkNMdDd6bXRhK1FzNlcwVTNHWjJCTEZyTk1TUFUvYlVXay82QWRmM005R3dY?=
 =?utf-8?B?SzZEN0JtRTdzT2FNTURIT2psejdDSCtkZ0MrZUNCTk1Dc284V2JoaFkwcm55?=
 =?utf-8?B?ZndTekI0VDFqNzRZclBvdThTUlRSbXo3WjJ5cDg1cWJWNWRTTHNzZDRpV1FI?=
 =?utf-8?B?dEFNWjhiZEVGK1lOQUVwVnF5NyttbFViWjFURUJBdXM4bjNCUFNPQVEydmwy?=
 =?utf-8?B?Q3BhSW9QQThrM2pOUmF1UTNaWEowR1BQdVh2UzJzRmZpUW9WYWRuZzNURDZM?=
 =?utf-8?B?RlI0ZXZUYkplZm5teW5GV1cwbXFEYUFSNGZjdG5iSzFLbWJXV25YU1JuRkdP?=
 =?utf-8?B?NGltdmJwUysyL0tSRnpubmN6RGVZeXdqeGtZdnlWMXkzL1FtU0cvVlVnQkRi?=
 =?utf-8?B?RHhxcUZnOE9qbjVpcXY2Tm9QZ1FnaUNucUhJMmUvbnRJUjR0NzFGeXZLV1Vy?=
 =?utf-8?B?bkI1MEdNVE85UmRwMGx5bmNSVEVGeEhSOTRaSjFheXJ2UnJtMi9kbklFMDdP?=
 =?utf-8?B?NlNPaTJKem5XcUtKY1FzSS95Zy9pcG5wWHhUVDJiNWRWVmJERU0xWTJOR0Za?=
 =?utf-8?B?UWRCK09oU2V3NE5DSUc4RjlXV1ZaS0FZSFhkaWh3K3J4QzEyalU2MmJweFVT?=
 =?utf-8?B?cXhoY1ptVldJOUZmUUgxaWlvekZvbHZPdVcrUHlTVTNEMHUxaWFRNVR5bkVD?=
 =?utf-8?B?TkJkTis0MS9OdlR5OGttbHVmN255eWRIemQ3WmJseXRLa2F1djVCZ2doaDFk?=
 =?utf-8?B?Y0VKRkRBUzZFaVdDZ1Y3OTd1WlQyaXR0aEd4NlIzbDJzbnl2djhyaHJlL0NO?=
 =?utf-8?B?MmdJam5UNDFMbWJxcUhUYnVtM0twZWJodHRPekp6a1cwdmZJblE3MzJZZW1C?=
 =?utf-8?B?NGYyNUNGbWk3a0UwNUtWTWhCbS9oSlNEckdEWnVuM21ScnNpVE04ajR2MzVi?=
 =?utf-8?B?djRCMzRuYnJ0ZXhpSjNSRjlKRFExenR0QndMblcwYkd2K2RCWm92L003ZWY1?=
 =?utf-8?B?WGhFSFIzaGJiNitEYkgvSGt0OHdCWUJlRjNUTWdHZG44QWZDRnFlOElrbFNp?=
 =?utf-8?B?bGVvN3JLRGtBZ1FLck1CblR3TUlpR3E2dVBQc3NCRC82L3h2dlZIU2x4eTVP?=
 =?utf-8?B?dzYzYzRqZExkL2lHa2doYkZjaEtybDdJTzQ0TXQ5aDRxU1M3STNTSkVIZk0r?=
 =?utf-8?B?UkNiTTA1Z0JVc2U3WDZKWXZEdzB5VUNQZTlqUGVPeUdnRlR6WktDNlMzYk1k?=
 =?utf-8?B?Zmh6REJKVlc3OS9EQzhtZjlmeCtiaVM5VW53TWlhbnJSUVIrbk1zVXFRRjRj?=
 =?utf-8?B?aFpRcXpVRHhQNkt6YmI2MTRiZmFGUk56Q3BhdUlvRkoyRnFvVVRHNDN1YkxC?=
 =?utf-8?B?Rk1RS0N0dksrSnR1OGJoMUlzdmtGYk9VekIrdU4xWTNvQ2dLcWlWZ1BJaU5w?=
 =?utf-8?B?b0VaUWNMSWZtT2FYWW50VFkvd09UaWVJMG8rbHRkc2ZhUytvZFh5dnBqdU8w?=
 =?utf-8?B?WEdHS1ZTbjVJck16MGNVOHlHMjVoZEliaFFiRVkwOWo2aVp4cS8vNjFqY3FB?=
 =?utf-8?B?QVFlcG0yM2s0Y0l3c3RVQTdTL2RJTGZPYlRtc2RoM0wyeGZ2UzRzTmRScmlG?=
 =?utf-8?Q?GDPE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 16:40:17.0464 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2b5485-1492-4ff2-3aa9-08de010933f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9681
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

Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>

On 10/1/25 03:43, Karol Wachowski wrote:
> The pcode MAILBOX STATUS register PARAM2 field expects DCT active
> percent in U1.7 value format. Convert percentage value to this
> format before writing to the register.
>
> Fixes: a19bffb10c46 ("accel/ivpu: Implement DCT handling")
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_hw_btrs.c | 2 +-
>   drivers/accel/ivpu/ivpu_hw_btrs.h | 2 +-
>   drivers/accel/ivpu/ivpu_pm.c      | 9 +++++++--
>   3 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.c b/drivers/accel/ivpu/ivpu_hw_btrs.c
> index afdb3b2aa72a..aa33f562d29c 100644
> --- a/drivers/accel/ivpu/ivpu_hw_btrs.c
> +++ b/drivers/accel/ivpu/ivpu_hw_btrs.c
> @@ -752,7 +752,7 @@ int ivpu_hw_btrs_dct_get_request(struct ivpu_device *vdev, bool *enable)
>   	}
>   }
>   
> -void ivpu_hw_btrs_dct_set_status(struct ivpu_device *vdev, bool enable, u32 active_percent)
> +void ivpu_hw_btrs_dct_set_status(struct ivpu_device *vdev, bool enable, u8 active_percent)
>   {
>   	u32 val = 0;
>   	u32 cmd = enable ? DCT_ENABLE : DCT_DISABLE;
> diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.h b/drivers/accel/ivpu/ivpu_hw_btrs.h
> index 032c384ac3d4..c4c10e22f30f 100644
> --- a/drivers/accel/ivpu/ivpu_hw_btrs.h
> +++ b/drivers/accel/ivpu/ivpu_hw_btrs.h
> @@ -36,7 +36,7 @@ u32 ivpu_hw_btrs_dpu_freq_get(struct ivpu_device *vdev);
>   bool ivpu_hw_btrs_irq_handler_mtl(struct ivpu_device *vdev, int irq);
>   bool ivpu_hw_btrs_irq_handler_lnl(struct ivpu_device *vdev, int irq);
>   int ivpu_hw_btrs_dct_get_request(struct ivpu_device *vdev, bool *enable);
> -void ivpu_hw_btrs_dct_set_status(struct ivpu_device *vdev, bool enable, u32 active_percent);
> +void ivpu_hw_btrs_dct_set_status(struct ivpu_device *vdev, bool enable, u8 active_percent);
>   u32 ivpu_hw_btrs_telemetry_offset_get(struct ivpu_device *vdev);
>   u32 ivpu_hw_btrs_telemetry_size_get(struct ivpu_device *vdev);
>   u32 ivpu_hw_btrs_telemetry_enable_get(struct ivpu_device *vdev);
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index 7514f580eef4..63c95307faa1 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -502,6 +502,11 @@ void ivpu_pm_irq_dct_work_fn(struct work_struct *work)
>   	else
>   		ret = ivpu_pm_dct_disable(vdev);
>   
> -	if (!ret)
> -		ivpu_hw_btrs_dct_set_status(vdev, enable, vdev->pm->dct_active_percent);
> +	if (!ret) {
> +		/* Convert percent to U1.7 format */
> +		u8 val = DIV_ROUND_CLOSEST(vdev->pm->dct_active_percent * 128, 100);
> +
> +		ivpu_hw_btrs_dct_set_status(vdev, enable, val);
> +	}
> +
>   }
