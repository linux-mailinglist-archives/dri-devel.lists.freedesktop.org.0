Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C77AFB915
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 18:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E65410E4ED;
	Mon,  7 Jul 2025 16:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1knOZnXp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C65010E4ED
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 16:52:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2Vk6WFkIvPcAaOQ+kCjclm7V8yC3b7B/DVE9uO5FUkbD6McCNpd1LalA2monG7b+v3JQjQacEMVbo+A05xX1iob5UhTYkPq6pNi8XLRPxAjUSPHtOb1f84oeoaDfBn5kuAUqOK7VF0IQuHAsRNxnmJyLxPVRWNCJRymF+951sjRNjMm6yU+3vhKudCTmgMQz0xE2UuW9kMfyOgWgxwY9CfnJOlAyJ3rKLX6Ow1Ba856yN3u5Kkbu5mi9WmTC+jL+be4grW5r1nxySvcB2JsxZ8bhyqJ27SnJrlWG/B0/mJrZmRDK3dX32e0q6Gj8Xhpn3ZOP6z/Lpp0/wnsyT6h+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=up5F4w4rxdNJz55FXyw+AKBYeRnisbwfx32FGQsf1SQ=;
 b=XX4l4wX/ih0tBIJWGdxvzYttTcxwKsQfN1SYjkuljReVOwPl806gAQv0vfyWLFIiBWnImdhizcMfULlz/j61uUP99+/kVIj59FSSvnEZagL2zJATIqO4e4Q6J7h7/PlQ/w53hDmOpdd5wRj0SvMeO5dgtMwg4uCoyOye9/XKUjh0x056F+kttCUCuocFj9+0mD1CnIojkmGoCl5HsB3ZpudSWEJF5ySgkKlub2wySIbf5G3G49SwsoYQeiO7pfKY5THUTkQ7q9DF/keAw1t99m58+FwalwKEvRZkBnJmOjfo+iJ9ff6kRWvbCnc0OTuyhiB/2XI7p8qG10nzJ20sHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=up5F4w4rxdNJz55FXyw+AKBYeRnisbwfx32FGQsf1SQ=;
 b=1knOZnXpxmP6qBuME9QaBN0bxvHSr5V8Dyn4nAm/aQswe/VqSfxoV7hO8ogLoX37CKJf2ydfgdkJZeCtmcf8QK3qVDZAzS3mkEIoMfA1zuugkTM8iD66SzKdMXuvWkM1kpSyzU8LhIc9jI+nSoobULzQ9/MFBo3EI9ZnigJyavs=
Received: from CH2PR18CA0035.namprd18.prod.outlook.com (2603:10b6:610:55::15)
 by PH7PR12MB9128.namprd12.prod.outlook.com (2603:10b6:510:2f7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 16:52:18 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::bc) by CH2PR18CA0035.outlook.office365.com
 (2603:10b6:610:55::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Mon,
 7 Jul 2025 16:52:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 7 Jul 2025 16:52:17 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Jul
 2025 11:52:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Jul
 2025 11:52:16 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Jul 2025 11:52:16 -0500
Message-ID: <2b43ad23-8d60-7b96-052c-906cdcfd4acc@amd.com>
Date: Mon, 7 Jul 2025 09:52:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/80] accel/amdxdna: Remove redundant
 pm_runtime_mark_last_busy() calls
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Min Ma <min.ma@amd.com>,
 "Oded Gabbay" <ogabbay@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075357.3216774-1-sakari.ailus@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250704075357.3216774-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|PH7PR12MB9128:EE_
X-MS-Office365-Filtering-Correlation-Id: 2941b118-bbbd-4892-a2bf-08ddbd76a1c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGRuazIrM0VIbUFzZFR6cC9qZVJtdFNNelFrcG5UL0N1Rmo2OFRwNXlJMGp2?=
 =?utf-8?B?TmNyVFEvRWdVK1kwWXhiRXY2RFRXdnlXQlJuQ3ZOYU9ZRmlraThMU3prNS8x?=
 =?utf-8?B?ZTRQazlZLzk2THpFd3hMM0graHpjWDZJUjhnQ2g5YkpmdEdoWEZYeFpRTEFn?=
 =?utf-8?B?bEtnaFU0YW96TVBqamFMU3k4Mno3SFllWGE2ay9qdmgyeEpHVC9aU2dURi9D?=
 =?utf-8?B?c3dPSklVelpHUlNiTHczNDlXb0JOYW5jY0gza0Q5UXg4MmxBWmtiMlRxVmRF?=
 =?utf-8?B?Z01TT1VjOHRsVG4xa0RGc3hVUjdGTFluQ20vN3NzdzhDenFka0tFUmZFOHRH?=
 =?utf-8?B?S1lGcmtPVGQyT3daZjlESWMrUldGNmUrWUtqR1V5YUdVOHFKVGY4allGU09V?=
 =?utf-8?B?SkxYeE1CeVB4emlkQmhKK2ROVnV0aXRLYW5rSS9WWEZCMUZ4NUtGbFEzZEla?=
 =?utf-8?B?YXN1QXd4YlpwM1JSdTFrSy9vZGFzYWxzeFU4aHEveGxPbkVVOGQxMGtPZjVQ?=
 =?utf-8?B?Z1BIRUZPSnBFNERuNisrTUlpN0NOcUhORUlBM0plenZSb3VTV2lXMFQzQ0Ru?=
 =?utf-8?B?L0ExaFhBQlVKeTV6aFhTczlFdktrOE1Lb1cvK0crRTJFQ0ZIcTVlTENtTWlI?=
 =?utf-8?B?S3NGdlk5emUrbGpuS3ZidlY3bUJ1d0U2UmdQSzBDV3pyMDNFUkJBSUNISWMy?=
 =?utf-8?B?aTM0TWxzNzlpZ1NWTjZRVUlRK0p2bVYzZkxIVTU5NndIUmF2R050UER1RkpH?=
 =?utf-8?B?eVMvdHIycjhqS3ZDS0VVTlFKWk9jbDNjSHo3cElXd0owQnlqZFh1Zk9MYlVm?=
 =?utf-8?B?aEJBSkIwcEJjY1ozUVdBUlB6WXhwVjNVN0I3UVZYR2dWTitZMW1wRmR4eWxJ?=
 =?utf-8?B?cWlNUUtmTkp6OE80eVAxaVFyUXBqNjFaaDdqUll3dkZ5a2YvbHJJL0NURUE1?=
 =?utf-8?B?M0kyakg1Ry80Si9qdThuZUk1Sko3WHZWZk5QY252aEZBVTJUa2dvRExIUzdk?=
 =?utf-8?B?TUErNUZLRUcvK213M1VQRjZ2V05ZQXo3WUxuc2hjcEZtTUtmaDhrdVA3Njl5?=
 =?utf-8?B?UksxSFA3QXRnSW1oYk9WOXB6clhsM3c2eDRxSy9sb053NGVCM0lPWStJUjNr?=
 =?utf-8?B?NHRUTi9tU2hwYStWMFByZGNCTFlCQXlBcmZRZm1kMFFoVjNUcWdKbHBYcm11?=
 =?utf-8?B?SWQwbno2cktJaEt0bE5neURuUjZlUnpEQVBWc2VnaWNEemlHS3lBbnZSNkIv?=
 =?utf-8?B?dlN5WFlEazU3RVVTZXkrK3ZVd1FCTHNEcEMwSktEQVNvaTRkdWtCNDNTYnB6?=
 =?utf-8?B?Nzhhc0dCdnBRNk84ZFFaSG9SdEMvK1F6ZkFMYjgrTVM3WjhmTDhITWRLOEhW?=
 =?utf-8?B?aW4yTjlVdEQzaFVtRW5EYnVhMkhORnhIdlBkNHN5a24rRFloNmlFNkpucm1p?=
 =?utf-8?B?a2Z5SGJLUUU3djlpb1IvZVVHNjRDOEJFKysxWUtzNUhkOEVWeXlwRHJwR1Yx?=
 =?utf-8?B?Yk5IelE5ZklDVDVwdGlYajdUVnZUNzhxNmxXbXhPbWdQdzRKY2YweFB1M2JX?=
 =?utf-8?B?c3Q3RjJiYzFoR2RkSTQxeFZSWlJyVG5CLy9paHpyR3pQNWgyb1JQRFhlOWNz?=
 =?utf-8?B?Uk1mcnF2TWJyMVBGOWVFNlIvVTV0TnR5MHJ4Syt6amY3M290dml6N3RwSXVT?=
 =?utf-8?B?TlQ2L3V4ZFB6R09mRVN2OWhLdTRuWjVpUU13VEhIY3N5Vk9KSElkSDdlZTdD?=
 =?utf-8?B?aEtHNmVmdys3T1VoajlvRXU2amtHdUh4bEFlTjM3dmF1ZTYrS2s3TGlwVVBZ?=
 =?utf-8?B?MkQ5Ti8xNkp6S2s0K2R6U2c3UjRaMUxlNnpPZ2JnYXhtZk9QclVidS9zVG5x?=
 =?utf-8?B?ZkpKV00wZzZ1emMrakFlanpyRjd3UE5LT3F4aGN0VU9EeGxFUm1MWTJGNFIr?=
 =?utf-8?B?WmlCU21mb2Z2OUI4WUM3cytpeXYwWHRWTlBhZU52RFk3RDNrMS8xeFBIOCsx?=
 =?utf-8?B?YkVmR0o4aGdVaTdZeGVpNjd3cUMvTkxZQ0M2bUwxNDdIR1laeWdMd0RZaWl4?=
 =?utf-8?B?alNINXN1TTQrUEtnUXpRaHBWd2k0VEU2dHBudz09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 16:52:17.3390 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2941b118-bbbd-4892-a2bf-08ddbd76a1c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9128
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

On 7/4/25 00:53, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
>
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
>
>          git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                  pm-runtime-6.17-rc1
>
>   drivers/accel/amdxdna/amdxdna_pci_drv.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index f2bf1d374cc7..c7083a657333 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -101,7 +101,6 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
>   failed:
>   	kfree(client);
>   put_rpm:
> -	pm_runtime_mark_last_busy(ddev->dev);
>   	pm_runtime_put_autosuspend(ddev->dev);
>   
>   	return ret;
> @@ -125,7 +124,6 @@ static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *filp)
>   
>   	XDNA_DBG(xdna, "pid %d closed", client->pid);
>   	kfree(client);
> -	pm_runtime_mark_last_busy(ddev->dev);
>   	pm_runtime_put_autosuspend(ddev->dev);
>   }
>   
> @@ -296,7 +294,6 @@ static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   		goto failed_sysfs_fini;
>   	}
>   
> -	pm_runtime_mark_last_busy(dev);
>   	pm_runtime_put_autosuspend(dev);
>   	return 0;
>   
