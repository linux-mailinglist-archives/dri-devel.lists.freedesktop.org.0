Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE59CBA105A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 20:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F72910E99A;
	Thu, 25 Sep 2025 18:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BMxx5K1c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011040.outbound.protection.outlook.com [52.101.52.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F7110E99A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 18:30:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+WA+qZFqGGROcRRtDFekFpDw4sBAv9INrT6ZcNGQGH6sK+grnzH8lNUS/xNs+HEZoL9y4DGY9UUGdWZ7dj8xGp6hBul0dF5FtcQNfF5rdrMcEg+SJNxppXTnxMD2zSgqzYv3rdmq5ViYKENhyhD+MqXiP13bDV/TUQQvTJlny4vFdG7gVAJLs6Sau1ome83NhsWrFr6MAxdBDkacKUGsLuV9YQw27S7RnMUDY1Zgs3J/hGHyab6MfVT9HQpMeK+W8owhX3q6N7sg21T23trKh0LgRHGEFCM0H1d2jxAuxVEkhg0HJelHP3fNOpNQGzihFIpy2I3D977FJ2OuJnTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZwv8kjsXFPFMNcTY3Vyi991uTzX8FBSusnax0C3gvc=;
 b=x+rN1IAsaAZblyM9eXZ/Ug24tLl2thlKg/VY3xhMgBCLr6iA72nkuBSbjs8WWshH0aF3XZyr2DqQX3hVcupSJNG+0JymmZulhIDoCoz8F217JqN6tJ6XWWCN+3xg1ol8vA/hF4I1h3AkySzI+xX4sBskFNc0EQP7Zf7QtjaFrPehmmECZMmCrYeiY/Ep4K6W178t2qkCe0Knp7KgY4AjV5wxTCeIfzeATiKCXvpnC/oX6HRNKyboRCXJytBJt8pp/vDGlb4VrV6sABs9t9dtTguR0MYZjZao3ritxqZQFzzUbow4Y72u2FQjNZhqT3fSirO+Xprqk7hzyrlkEJOdpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZwv8kjsXFPFMNcTY3Vyi991uTzX8FBSusnax0C3gvc=;
 b=BMxx5K1c+U2vRc/Dp/wRRj7aHsKp97xYlQRHOgHzXSgDzdy9JsFU5KkWnI9ZYatK9CSLWyso2bB6vlUi1GNT3SNRInJSfRp4C+dlh73lZkOeocE0jWlYh9mMhkrcECHj36h4BGDbspSIPn4xweNaUQGXLddIWsjuLXIHIpdlZH0=
Received: from CH2PR02CA0005.namprd02.prod.outlook.com (2603:10b6:610:4e::15)
 by BL3PR12MB6380.namprd12.prod.outlook.com (2603:10b6:208:38d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Thu, 25 Sep
 2025 18:30:24 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::3b) by CH2PR02CA0005.outlook.office365.com
 (2603:10b6:610:4e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.21 via Frontend Transport; Thu,
 25 Sep 2025 18:30:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Thu, 25 Sep 2025 18:30:24 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 25 Sep
 2025 11:30:23 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 25 Sep
 2025 11:30:22 -0700
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 25 Sep 2025 11:30:22 -0700
Message-ID: <335f8396-1f02-d58e-7768-ab947669d735@amd.com>
Date: Thu, 25 Sep 2025 11:30:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] accel/ivpu: Split FW runtime and global memory buffers
Content-Language: en-US
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <jeff.hugo@oss.qualcomm.com>,
 <maciej.falkowski@linux.intel.com>
References: <20250925074209.1148924-1-karol.wachowski@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250925074209.1148924-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|BL3PR12MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb80f51-90dc-4ce5-e637-08ddfc619787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b21GaTdkRDNrR3ZBRW9lQWUxeWVoMURLTTNYQnhQWmpFc1E3QkI2RzVYL2Jo?=
 =?utf-8?B?b2Z2ajAxVThqZmZqczRJL2VDbUtRZTNMZ0lhb2RUb3J6QTFVeFRnOWt6RTBw?=
 =?utf-8?B?QXI2ZUliYkh2bDFUREN6L1VRd0pnT3FheWNBUUNGRWprNVZrOHpqNmJXVmMy?=
 =?utf-8?B?dXpidFpremZHdlovdlJKVXJFUGROa0pQcER5YWR6RlpQTE5OZVJydW1rdjNl?=
 =?utf-8?B?TG14UHEyQUZUMWxaMXFtdXlidnNDSWFQeHFaVkIzc0hXcWh0NHFjM3AxeXY3?=
 =?utf-8?B?OENRV3BYb2dxUEozVzZKMDFnRXlzSG9Wc2JtSExkcks3bGJvYm1hUDRLUWdy?=
 =?utf-8?B?bHZvbVN6YWlqbjZsaTRyTnlRaFZNb1R2cm5Ma3Y2dWh0MVNVOXNCZDhTYm5j?=
 =?utf-8?B?d0RCSkRIcFBndEtBQTVIQVQ2ZGhpTkVBU2cvOEpNK0UwUEJ1UXY5bjZrV25i?=
 =?utf-8?B?YXhkZy9OL0RFUnVUY2JROVg0RVFqUnBwcENYTFZ5WXlPWFJWNmNzV2tJZXcw?=
 =?utf-8?B?UUJ4ZGVzNjM4dVppOTEzdkJJdGRFN2hpdUF3cDdOM3VnTC9CT0taeXhPb2F4?=
 =?utf-8?B?RGtjS3cwc2RNanl1czU5dWd1N1dFWGhDWDNHZUJpT1dWMHg0N3RjUVFKcVFt?=
 =?utf-8?B?TTRlZzdjZytNN0h1WUFra3p3dlZMSUx4NSt5ZStZbWl6SGtSVzBjRzZlMDNO?=
 =?utf-8?B?VTBYTDFxKzhHcGsvNkRjSXBwV2VEVFl1UjZoR1FpWDhpVjZTZ2NoSnNvcEtB?=
 =?utf-8?B?NUp6bUlYaHdkTGhCSXRxN1Z2by9kUzE3M3JySlJvdVhxVnExWE42Y3FSR0d3?=
 =?utf-8?B?aEMyaFNXMDk1RWxBMnY4OUNCNjJiWDkvM1pYNjUycW04YW1KTHJMY0MxcldE?=
 =?utf-8?B?OWd5aFZWdzFjdlRjQ0RVbm9TZTVMajNidlpPM1VCWm95NDhnS2l4TVlJVGVW?=
 =?utf-8?B?N1hXMjBHWXd1R1dxZHZkOGtuWFl4S1NYS3NhanNaK3pxdmo4WWc4ZkNoUVZP?=
 =?utf-8?B?RmthMTgrclV2dEM0bHdtd1dvbUJpV0VJc0RYT0lTa2UxMGpJTmE2UFpTWFQ4?=
 =?utf-8?B?TDN0MHZtbVBnQUtFZlNzM0hzY2krQjR3YWJoaFBzdENNNVJqQStBOFZzRTkz?=
 =?utf-8?B?ZzRLWXAvZ0NJaW1BcHdEYVppUEFrVWRjT1kvTkVzbUVtUVFsbkVFTnprdFNr?=
 =?utf-8?B?d2ljTW1xWmUwK0VEK3pyRWZzdXA1ZEFUdDNrMXRWeXYvRjZWSnZteE8vZmVy?=
 =?utf-8?B?RklkM3FXMk1KKzlOU0cxVU5DVmJETnNWblNKUTArR0Z6RkxUQkFyN0FWYmRo?=
 =?utf-8?B?T2oyOVhWVkNFcDZPak0vbDFEbktHaTlLWEVXRERKYlBZbWlpUDQrRm5LVS9k?=
 =?utf-8?B?NUZJV1ZkdEc1Q2pzZld6b3JmMlo0OTFGdGlJd20xY3hEOVlSck1iNmVkcitt?=
 =?utf-8?B?RDBnME5pcGFpcXYxQS9sd3M4aFo3Z3llWC90cjdnYytTSTM1Y29CeW9ONGdm?=
 =?utf-8?B?WmF1MWpWSnZvMXpDQnc0c2ZZYjRhbWU5bXFIZFpyb3JBczZuTGxLb1JnblJU?=
 =?utf-8?B?M3ZQSEd4eFk2Z2tpa2tJcm41c2xXK0lMdUZlOFhxeUVMeWxBL0tIYTJMd0xQ?=
 =?utf-8?B?N1ZJRmdxeDBmU01uVnRPZ0tJOWt5M1M5bnFhOXJaN0dXVEtabUczbS9qY2FQ?=
 =?utf-8?B?aUNyUmNTV3RxbWtRRkdsRTBxSXNzNVNrdnQ0ZVdYQUxBL0F5TStoaUQzdnd1?=
 =?utf-8?B?bTVWMGY3eVlxWnQzeUQ1Ni9KZHkyTS9nNWZZWkFiVUsrb3BHVjBHRmxQZFZQ?=
 =?utf-8?B?YVZtS1pBUytLR2NYRENLWmxmMmF5aUEyT3FUbGF0WnBpUWlTY09CUjd5RC9U?=
 =?utf-8?B?cW9uc0wvSDRreEVWRVBZWkxSSlRzODlLKzZnblJENzF2SUQ0QmZlb051RStu?=
 =?utf-8?B?RnBKNlZUaVc0RXNhYk45bFQycWtKRFRVeGo0MnJjM0JvMGpzMlpkV0Y0YlFh?=
 =?utf-8?B?V0NmN1MzRnh3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 18:30:24.0201 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb80f51-90dc-4ce5-e637-08ddfc619787
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6380
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

On 9/25/25 00:42, Karol Wachowski wrote:
> Split firmware boot parameters (4KB) and FW version (4KB) into dedicated
> buffer objects, separating them from the FW runtime memory buffer. This
> creates three distinct buffers with independent allocation control.
>
> This enables future modifications, particularly allowing the FW
> image memory to be moved into a read-only buffer.
>
> Fix user range starting address from incorrect 0x88000000 (2GB + 128MB)
> overlapping global aperture on 37XX to intended 0xa0000000 (2GB + 512MB).
> This caused no issues as FW aligned this range to 512MB anyway, but
> corrected for consistency.
>
> Convert ivpu_hw_range_init() from inline helper to function with overflow
> validation to prevent potential security issues from address range
> arithmetic overflows.
>
> Improve readability of ivpu_fw_parse() function, remove unrelated constant
> defines and validate firmware header values based on vdev->hw->ranges.
>
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Link: https://lore.kernel.org/r/20250923111855.1112087-1-karol.wachowski@linux.intel.com
> ---
> Changes between v1 and v2:
> Apply review suggestions:
> - Use ivpu_hw_range_init() to initialize fw_image_range in ivpu_fw_parse()
> - Ensure FW entry point is at least 4K before the end of the image
> ---
>   drivers/accel/ivpu/ivpu_drv.c         |   3 +-
>   drivers/accel/ivpu/ivpu_fw.c          | 151 ++++++++++++++++----------
>   drivers/accel/ivpu/ivpu_fw.h          |   7 ++
>   drivers/accel/ivpu/ivpu_gem.c         |  16 +++
>   drivers/accel/ivpu/ivpu_gem.h         |   1 +
>   drivers/accel/ivpu/ivpu_hw.c          |  36 ++++--
>   drivers/accel/ivpu/ivpu_hw.h          |   9 +-
>   drivers/accel/ivpu/ivpu_mmu_context.c |   2 +-
>   drivers/accel/ivpu/ivpu_pm.c          |   2 +-
>   9 files changed, 152 insertions(+), 75 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index a08f99c3ba4a..1792d0bbec71 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -380,8 +380,7 @@ int ivpu_boot(struct ivpu_device *vdev)
>   	drm_WARN_ON(&vdev->drm, atomic_read(&vdev->job_timeout_counter));
>   	drm_WARN_ON(&vdev->drm, !xa_empty(&vdev->submitted_jobs_xa));
>   
> -	/* Update boot params located at first 4KB of FW memory */
> -	ivpu_fw_boot_params_setup(vdev, ivpu_bo_vaddr(vdev->fw->mem));
> +	ivpu_fw_boot_params_setup(vdev, ivpu_bo_vaddr(vdev->fw->mem_bp));
>   
>   	ret = ivpu_hw_boot_fw(vdev);
>   	if (ret) {
> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
> index 32f513499829..b81bd143a285 100644
> --- a/drivers/accel/ivpu/ivpu_fw.c
> +++ b/drivers/accel/ivpu/ivpu_fw.c
> @@ -17,14 +17,7 @@
>   #include "ivpu_ipc.h"
>   #include "ivpu_pm.h"
>   
> -#define FW_GLOBAL_MEM_START	(2ull * SZ_1G)
> -#define FW_GLOBAL_MEM_END	(3ull * SZ_1G)
> -#define FW_SHARED_MEM_SIZE	SZ_256M /* Must be aligned to FW_SHARED_MEM_ALIGNMENT */
> -#define FW_SHARED_MEM_ALIGNMENT	SZ_128K /* VPU MTRR limitation */
> -#define FW_RUNTIME_MAX_SIZE	SZ_512M
>   #define FW_SHAVE_NN_MAX_SIZE	SZ_2M
> -#define FW_RUNTIME_MIN_ADDR	(FW_GLOBAL_MEM_START)
> -#define FW_RUNTIME_MAX_ADDR	(FW_GLOBAL_MEM_END - FW_SHARED_MEM_SIZE)
>   #define FW_FILE_IMAGE_OFFSET	(VPU_FW_HEADER_SIZE + FW_VERSION_HEADER_SIZE)
>   #define FW_PREEMPT_BUF_MIN_SIZE SZ_4K
>   #define FW_PREEMPT_BUF_MAX_SIZE SZ_32M
> @@ -133,9 +126,14 @@ ivpu_fw_check_api_ver_lt(struct ivpu_device *vdev, const struct vpu_firmware_hea
>   	return false;
>   }
>   
> -static bool is_within_range(u64 addr, size_t size, u64 range_start, size_t range_size)
> +bool ivpu_is_within_range(u64 addr, size_t size, struct ivpu_addr_range *range)
>   {
> -	if (addr < range_start || addr + size > range_start + range_size)
> +	u64 addr_end;
> +
> +	if (!range || check_add_overflow(addr, size, &addr_end))
> +		return false;
> +
> +	if (addr < range->start || addr_end > range->end)
>   		return false;
>   
>   	return true;
> @@ -198,7 +196,11 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
>   {
>   	struct ivpu_fw_info *fw = vdev->fw;
>   	const struct vpu_firmware_header *fw_hdr = (const void *)fw->file->data;
> -	u64 runtime_addr, image_load_addr, runtime_size, image_size;
> +	struct ivpu_addr_range fw_image_range;
> +	u64 boot_params_addr, boot_params_size;
> +	u64 fw_version_addr, fw_version_size;
> +	u64 runtime_addr, runtime_size;
> +	u64 image_load_addr, image_size;
>   
>   	if (fw->file->size <= FW_FILE_IMAGE_OFFSET) {
>   		ivpu_err(vdev, "Firmware file is too small: %zu\n", fw->file->size);
> @@ -210,18 +212,37 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
>   		return -EINVAL;
>   	}
>   
> -	runtime_addr = fw_hdr->boot_params_load_address;
> -	runtime_size = fw_hdr->runtime_size;
> -	image_load_addr = fw_hdr->image_load_address;
> -	image_size = fw_hdr->image_size;
> +	boot_params_addr = fw_hdr->boot_params_load_address;
> +	boot_params_size = SZ_4K;
> +
> +	if (!ivpu_is_within_range(boot_params_addr, boot_params_size, &vdev->hw->ranges.runtime)) {
> +		ivpu_err(vdev, "Invalid boot params address: 0x%llx\n", boot_params_addr);
> +		return -EINVAL;
> +	}
> +
> +	fw_version_addr = fw_hdr->firmware_version_load_address;
> +	fw_version_size = ALIGN(fw_hdr->firmware_version_size, SZ_4K);
> +
> +	if (fw_version_size != SZ_4K) {
> +		ivpu_err(vdev, "Invalid firmware version size: %u\n",
> +			 fw_hdr->firmware_version_size);
> +		return -EINVAL;
> +	}
>   
> -	if (runtime_addr < FW_RUNTIME_MIN_ADDR || runtime_addr > FW_RUNTIME_MAX_ADDR) {
> -		ivpu_err(vdev, "Invalid firmware runtime address: 0x%llx\n", runtime_addr);
> +	if (!ivpu_is_within_range(fw_version_addr, fw_version_size, &vdev->hw->ranges.runtime)) {
> +		ivpu_err(vdev, "Invalid firmware version address: 0x%llx\n", fw_version_addr);
>   		return -EINVAL;
>   	}
>   
> -	if (runtime_size < fw->file->size || runtime_size > FW_RUNTIME_MAX_SIZE) {
> -		ivpu_err(vdev, "Invalid firmware runtime size: %llu\n", runtime_size);
> +	runtime_addr = fw_hdr->image_load_address;
> +	runtime_size = fw_hdr->runtime_size - boot_params_size - fw_version_size;
> +
> +	image_load_addr = fw_hdr->image_load_address;
> +	image_size = fw_hdr->image_size;
> +
> +	if (!ivpu_is_within_range(runtime_addr, runtime_size, &vdev->hw->ranges.runtime)) {
> +		ivpu_err(vdev, "Invalid firmware runtime address: 0x%llx and size %llu\n",
> +			 runtime_addr, runtime_size);
>   		return -EINVAL;
>   	}
>   
> @@ -230,23 +251,25 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
>   		return -EINVAL;
>   	}
>   
> -	if (image_load_addr < runtime_addr ||
> -	    image_load_addr + image_size > runtime_addr + runtime_size) {
> -		ivpu_err(vdev, "Invalid firmware load address size: 0x%llx and size %llu\n",
> +	if (!ivpu_is_within_range(image_load_addr, image_size, &vdev->hw->ranges.runtime)) {
> +		ivpu_err(vdev, "Invalid firmware load address: 0x%llx and size %llu\n",
>   			 image_load_addr, image_size);
>   		return -EINVAL;
>   	}
>   
> -	if (fw_hdr->shave_nn_fw_size > FW_SHAVE_NN_MAX_SIZE) {
> -		ivpu_err(vdev, "SHAVE NN firmware is too big: %u\n", fw_hdr->shave_nn_fw_size);
> +	if (ivpu_hw_range_init(vdev, &fw_image_range, image_load_addr, image_size))
>   		return -EINVAL;
> -	}
>   
> -	if (fw_hdr->entry_point < image_load_addr ||
> -	    fw_hdr->entry_point >= image_load_addr + image_size) {
> +	if (!ivpu_is_within_range(fw_hdr->entry_point, SZ_4K, &fw_image_range)) {
>   		ivpu_err(vdev, "Invalid entry point: 0x%llx\n", fw_hdr->entry_point);
>   		return -EINVAL;
>   	}
> +
> +	if (fw_hdr->shave_nn_fw_size > FW_SHAVE_NN_MAX_SIZE) {
> +		ivpu_err(vdev, "SHAVE NN firmware is too big: %u\n", fw_hdr->shave_nn_fw_size);
> +		return -EINVAL;
> +	}
> +
>   	ivpu_dbg(vdev, FW_BOOT, "Header version: 0x%x, format 0x%x\n",
>   		 fw_hdr->header_version, fw_hdr->image_format);
>   
> @@ -260,6 +283,10 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
>   	if (IVPU_FW_CHECK_API_COMPAT(vdev, fw_hdr, JSM, 3))
>   		return -EINVAL;
>   
> +	fw->boot_params_addr = boot_params_addr;
> +	fw->boot_params_size = boot_params_size;
> +	fw->fw_version_addr = fw_version_addr;
> +	fw->fw_version_size = fw_version_size;
>   	fw->runtime_addr = runtime_addr;
>   	fw->runtime_size = runtime_size;
>   	fw->image_load_offset = image_load_addr - runtime_addr;
> @@ -282,10 +309,9 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
>   	ivpu_dbg(vdev, FW_BOOT, "Mid-inference preemption %s supported\n",
>   		 ivpu_fw_preempt_buf_size(vdev) ? "is" : "is not");
>   
> -	if (fw_hdr->ro_section_start_address && !is_within_range(fw_hdr->ro_section_start_address,
> -								 fw_hdr->ro_section_size,
> -								 fw_hdr->image_load_address,
> -								 fw_hdr->image_size)) {
> +	if (fw_hdr->ro_section_start_address &&
> +	    !ivpu_is_within_range(fw_hdr->ro_section_start_address, fw_hdr->ro_section_size,
> +				  &fw_image_range)) {
>   		ivpu_err(vdev, "Invalid read-only section: start address 0x%llx, size %u\n",
>   			 fw_hdr->ro_section_start_address, fw_hdr->ro_section_size);
>   		return -EINVAL;
> @@ -294,12 +320,18 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
>   	fw->read_only_addr = fw_hdr->ro_section_start_address;
>   	fw->read_only_size = fw_hdr->ro_section_size;
>   
> -	ivpu_dbg(vdev, FW_BOOT, "Size: file %lu image %u runtime %u shavenn %u\n",
> -		 fw->file->size, fw->image_size, fw->runtime_size, fw->shave_nn_size);
> -	ivpu_dbg(vdev, FW_BOOT, "Address: runtime 0x%llx, load 0x%llx, entry point 0x%llx\n",
> -		 fw->runtime_addr, image_load_addr, fw->entry_point);
> +	ivpu_dbg(vdev, FW_BOOT, "Boot params: address 0x%llx, size %llu\n",
> +		 fw->boot_params_addr, fw->boot_params_size);
> +	ivpu_dbg(vdev, FW_BOOT, "FW version:  address 0x%llx, size %llu\n",
> +		 fw->fw_version_addr, fw->fw_version_size);
> +	ivpu_dbg(vdev, FW_BOOT, "Runtime:     address 0x%llx, size %u\n",
> +		 fw->runtime_addr, fw->runtime_size);
> +	ivpu_dbg(vdev, FW_BOOT, "Image load offset: 0x%llx, size %u\n",
> +		 fw->image_load_offset, fw->image_size);
>   	ivpu_dbg(vdev, FW_BOOT, "Read-only section: address 0x%llx, size %u\n",
>   		 fw->read_only_addr, fw->read_only_size);
> +	ivpu_dbg(vdev, FW_BOOT, "FW entry point: 0x%llx\n", fw->entry_point);
> +	ivpu_dbg(vdev, FW_BOOT, "SHAVE NN size: %u\n", fw->shave_nn_size);
>   
>   	return 0;
>   }
> @@ -326,39 +358,33 @@ ivpu_fw_init_wa(struct ivpu_device *vdev)
>   	IVPU_PRINT_WA(disable_d0i3_msg);
>   }
>   
> -static int ivpu_fw_update_global_range(struct ivpu_device *vdev)
> -{
> -	struct ivpu_fw_info *fw = vdev->fw;
> -	u64 start = ALIGN(fw->runtime_addr + fw->runtime_size, FW_SHARED_MEM_ALIGNMENT);
> -	u64 size = FW_SHARED_MEM_SIZE;
> -
> -	if (start + size > FW_GLOBAL_MEM_END) {
> -		ivpu_err(vdev, "No space for shared region, start %lld, size %lld\n", start, size);
> -		return -EINVAL;
> -	}
> -
> -	ivpu_hw_range_init(&vdev->hw->ranges.global, start, size);
> -	return 0;
> -}
> -
>   static int ivpu_fw_mem_init(struct ivpu_device *vdev)
>   {
>   	struct ivpu_fw_info *fw = vdev->fw;
> -	struct ivpu_addr_range fw_range;
>   	int log_verb_size;
>   	int ret;
>   
> -	ret = ivpu_fw_update_global_range(vdev);
> -	if (ret)
> -		return ret;
> +	fw->mem_bp = ivpu_bo_create_runtime(vdev, fw->boot_params_addr, fw->boot_params_size,
> +					    DRM_IVPU_BO_WC | DRM_IVPU_BO_MAPPABLE);
> +	if (!fw->mem_bp) {
> +		ivpu_err(vdev, "Failed to create firmware boot params memory buffer\n");
> +		return -ENOMEM;
> +	}
>   
> -	fw_range.start = fw->runtime_addr;
> -	fw_range.end = fw->runtime_addr + fw->runtime_size;
> -	fw->mem = ivpu_bo_create(vdev, &vdev->gctx, &fw_range, fw->runtime_size,
> -				 DRM_IVPU_BO_WC | DRM_IVPU_BO_MAPPABLE);
> +	fw->mem_fw_ver = ivpu_bo_create_runtime(vdev, fw->fw_version_addr, fw->fw_version_size,
> +						DRM_IVPU_BO_WC | DRM_IVPU_BO_MAPPABLE);
> +	if (!fw->mem_fw_ver) {
> +		ivpu_err(vdev, "Failed to create firmware version memory buffer\n");
> +		ret = -ENOMEM;
> +		goto err_free_bp;
> +	}
> +
> +	fw->mem = ivpu_bo_create_runtime(vdev, fw->runtime_addr, fw->runtime_size,
> +					 DRM_IVPU_BO_WC | DRM_IVPU_BO_MAPPABLE);
>   	if (!fw->mem) {
>   		ivpu_err(vdev, "Failed to create firmware runtime memory buffer\n");
> -		return -ENOMEM;
> +		ret = -ENOMEM;
> +		goto err_free_fw_ver;
>   	}
>   
>   	ret = ivpu_mmu_context_set_pages_ro(vdev, &vdev->gctx, fw->read_only_addr,
> @@ -407,6 +433,10 @@ static int ivpu_fw_mem_init(struct ivpu_device *vdev)
>   	ivpu_bo_free(fw->mem_log_crit);
>   err_free_fw_mem:
>   	ivpu_bo_free(fw->mem);
> +err_free_fw_ver:
> +	ivpu_bo_free(fw->mem_fw_ver);
> +err_free_bp:
> +	ivpu_bo_free(fw->mem_bp);
>   	return ret;
>   }
>   
> @@ -422,10 +452,14 @@ static void ivpu_fw_mem_fini(struct ivpu_device *vdev)
>   	ivpu_bo_free(fw->mem_log_verb);
>   	ivpu_bo_free(fw->mem_log_crit);
>   	ivpu_bo_free(fw->mem);
> +	ivpu_bo_free(fw->mem_fw_ver);
> +	ivpu_bo_free(fw->mem_bp);
>   
>   	fw->mem_log_verb = NULL;
>   	fw->mem_log_crit = NULL;
>   	fw->mem = NULL;
> +	fw->mem_fw_ver = NULL;
> +	fw->mem_bp = NULL;
>   }
>   
>   int ivpu_fw_init(struct ivpu_device *vdev)
> @@ -598,6 +632,7 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
>   		return;
>   	}
>   
> +	memset(boot_params, 0, sizeof(*boot_params));
>   	vdev->pm->is_warmboot = false;
>   
>   	boot_params->magic = VPU_BOOT_PARAMS_MAGIC;
> diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
> index 6fe2917abda6..00945892b55e 100644
> --- a/drivers/accel/ivpu/ivpu_fw.h
> +++ b/drivers/accel/ivpu/ivpu_fw.h
> @@ -19,10 +19,16 @@ struct ivpu_fw_info {
>   	const struct firmware *file;
>   	const char *name;
>   	char version[FW_VERSION_STR_SIZE];
> +	struct ivpu_bo *mem_bp;
> +	struct ivpu_bo *mem_fw_ver;
>   	struct ivpu_bo *mem;
>   	struct ivpu_bo *mem_shave_nn;
>   	struct ivpu_bo *mem_log_crit;
>   	struct ivpu_bo *mem_log_verb;
> +	u64 boot_params_addr;
> +	u64 boot_params_size;
> +	u64 fw_version_addr;
> +	u64 fw_version_size;
>   	u64 runtime_addr;
>   	u32 runtime_size;
>   	u64 image_load_offset;
> @@ -42,6 +48,7 @@ struct ivpu_fw_info {
>   	u64 last_heartbeat;
>   };
>   
> +bool ivpu_is_within_range(u64 addr, size_t size, struct ivpu_addr_range *range);
>   int ivpu_fw_init(struct ivpu_device *vdev);
>   void ivpu_fw_fini(struct ivpu_device *vdev);
>   void ivpu_fw_load(struct ivpu_device *vdev);
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index 59cfcf3eaded..cceb07232e12 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -15,6 +15,7 @@
>   #include <drm/drm_utils.h>
>   
>   #include "ivpu_drv.h"
> +#include "ivpu_fw.h"
>   #include "ivpu_gem.h"
>   #include "ivpu_hw.h"
>   #include "ivpu_mmu.h"
> @@ -391,6 +392,21 @@ ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
>   	return NULL;
>   }
>   
> +struct ivpu_bo *ivpu_bo_create_runtime(struct ivpu_device *vdev, u64 addr, u64 size, u32 flags)
> +{
> +	struct ivpu_addr_range range;
> +
> +	if (!ivpu_is_within_range(addr, size, &vdev->hw->ranges.runtime)) {
> +		ivpu_err(vdev, "Invalid runtime BO address 0x%llx size %llu\n", addr, size);
> +		return NULL;
> +	}
> +
> +	if (ivpu_hw_range_init(vdev, &range, addr, size))
> +		return NULL;
> +
> +	return ivpu_bo_create(vdev, &vdev->gctx, &range, size, flags);
> +}
> +
>   struct ivpu_bo *ivpu_bo_create_global(struct ivpu_device *vdev, u64 size, u32 flags)
>   {
>   	return ivpu_bo_create(vdev, &vdev->gctx, &vdev->hw->ranges.global, size, flags);
> diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
> index 3ee996d503b2..3a208f3bf0a6 100644
> --- a/drivers/accel/ivpu/ivpu_gem.h
> +++ b/drivers/accel/ivpu/ivpu_gem.h
> @@ -31,6 +31,7 @@ struct drm_gem_object *ivpu_gem_create_object(struct drm_device *dev, size_t siz
>   struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf);
>   struct ivpu_bo *ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
>   			       struct ivpu_addr_range *range, u64 size, u32 flags);
> +struct ivpu_bo *ivpu_bo_create_runtime(struct ivpu_device *vdev, u64 addr, u64 size, u32 flags);
>   struct ivpu_bo *ivpu_bo_create_global(struct ivpu_device *vdev, u64 size, u32 flags);
>   void ivpu_bo_free(struct ivpu_bo *bo);
>   
> diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
> index 08dcc31b56f4..8dbf8780920a 100644
> --- a/drivers/accel/ivpu/ivpu_hw.c
> +++ b/drivers/accel/ivpu/ivpu_hw.c
> @@ -20,6 +20,8 @@ module_param_named_unsafe(fail_hw, ivpu_fail_hw, charp, 0444);
>   MODULE_PARM_DESC(fail_hw, "<interval>,<probability>,<space>,<times>");
>   #endif
>   
> +#define FW_SHARED_MEM_ALIGNMENT	SZ_512K /* VPU MTRR limitation */
> +
>   static char *platform_to_str(u32 platform)
>   {
>   	switch (platform) {
> @@ -147,19 +149,39 @@ static void priority_bands_init(struct ivpu_device *vdev)
>   	vdev->hw->hws.process_quantum[VPU_JOB_SCHEDULING_PRIORITY_BAND_REALTIME] = 200000;
>   }
>   
> +int ivpu_hw_range_init(struct ivpu_device *vdev, struct ivpu_addr_range *range, u64 start, u64 size)
> +{
> +	u64 end;
> +
> +	if (!range || check_add_overflow(start, size, &end)) {
> +		ivpu_err(vdev, "Invalid range: start 0x%llx size %llu\n", start, size);
> +		return -EINVAL;
> +	}
> +
> +	range->start = start;
> +	range->end = end;
> +
> +	return 0;
> +}
> +
>   static void memory_ranges_init(struct ivpu_device *vdev)
>   {
>   	if (ivpu_hw_ip_gen(vdev) == IVPU_HW_IP_37XX) {
> -		ivpu_hw_range_init(&vdev->hw->ranges.global, 0x80000000, SZ_512M);
> -		ivpu_hw_range_init(&vdev->hw->ranges.user,   0x88000000, 511 * SZ_1M);
> -		ivpu_hw_range_init(&vdev->hw->ranges.shave, 0x180000000, SZ_2G);
> -		ivpu_hw_range_init(&vdev->hw->ranges.dma,   0x200000000, SZ_128G);
> +		ivpu_hw_range_init(vdev, &vdev->hw->ranges.runtime, 0x84800000, SZ_64M);
> +		ivpu_hw_range_init(vdev, &vdev->hw->ranges.global,  0x90000000, SZ_256M);
> +		ivpu_hw_range_init(vdev, &vdev->hw->ranges.user,    0xa0000000, 511 * SZ_1M);
> +		ivpu_hw_range_init(vdev, &vdev->hw->ranges.shave,  0x180000000, SZ_2G);
> +		ivpu_hw_range_init(vdev, &vdev->hw->ranges.dma,    0x200000000, SZ_128G);
>   	} else {
> -		ivpu_hw_range_init(&vdev->hw->ranges.global, 0x80000000, SZ_512M);
> -		ivpu_hw_range_init(&vdev->hw->ranges.shave,  0x80000000, SZ_2G);
> -		ivpu_hw_range_init(&vdev->hw->ranges.user,  0x100000000, SZ_256G);
> +		ivpu_hw_range_init(vdev, &vdev->hw->ranges.runtime, 0x80000000, SZ_64M);
> +		ivpu_hw_range_init(vdev, &vdev->hw->ranges.global,  0x90000000, SZ_256M);
> +		ivpu_hw_range_init(vdev, &vdev->hw->ranges.shave,   0x80000000, SZ_2G);
> +		ivpu_hw_range_init(vdev, &vdev->hw->ranges.user,   0x100000000, SZ_256G);
>   		vdev->hw->ranges.dma = vdev->hw->ranges.user;
>   	}
> +
> +	drm_WARN_ON(&vdev->drm, !IS_ALIGNED(vdev->hw->ranges.global.start,
> +					    FW_SHARED_MEM_ALIGNMENT));
>   }
>   
>   static int wp_enable(struct ivpu_device *vdev)
> diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
> index d79668fe1609..511a1a29f7f6 100644
> --- a/drivers/accel/ivpu/ivpu_hw.h
> +++ b/drivers/accel/ivpu/ivpu_hw.h
> @@ -21,6 +21,7 @@ struct ivpu_hw_info {
>   		bool (*ip_irq_handler)(struct ivpu_device *vdev, int irq);
>   	} irq;
>   	struct {
> +		struct ivpu_addr_range runtime;
>   		struct ivpu_addr_range global;
>   		struct ivpu_addr_range user;
>   		struct ivpu_addr_range shave;
> @@ -51,6 +52,8 @@ struct ivpu_hw_info {
>   };
>   
>   int ivpu_hw_init(struct ivpu_device *vdev);
> +int ivpu_hw_range_init(struct ivpu_device *vdev, struct ivpu_addr_range *range, u64 start,
> +		       u64 size);
>   int ivpu_hw_power_up(struct ivpu_device *vdev);
>   int ivpu_hw_power_down(struct ivpu_device *vdev);
>   int ivpu_hw_reset(struct ivpu_device *vdev);
> @@ -71,12 +74,6 @@ static inline u32 ivpu_hw_ip_irq_handler(struct ivpu_device *vdev, int irq)
>   	return vdev->hw->irq.ip_irq_handler(vdev, irq);
>   }
>   
> -static inline void ivpu_hw_range_init(struct ivpu_addr_range *range, u64 start, u64 size)
> -{
> -	range->start = start;
> -	range->end = start + size;
> -}
> -
>   static inline u64 ivpu_hw_range_size(const struct ivpu_addr_range *range)
>   {
>   	return range->end - range->start;
> diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
> index f0267efa55aa..4ffc783426be 100644
> --- a/drivers/accel/ivpu/ivpu_mmu_context.c
> +++ b/drivers/accel/ivpu/ivpu_mmu_context.c
> @@ -568,7 +568,7 @@ void ivpu_mmu_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context *ct
>   	mutex_init(&ctx->lock);
>   
>   	if (!context_id) {
> -		start = vdev->hw->ranges.global.start;
> +		start = vdev->hw->ranges.runtime.start;
>   		end = vdev->hw->ranges.shave.end;
>   	} else {
>   		start = min_t(u64, vdev->hw->ranges.user.start, vdev->hw->ranges.shave.start);
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index 475ddc94f1cf..7514f580eef4 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -54,7 +54,7 @@ static void ivpu_pm_prepare_cold_boot(struct ivpu_device *vdev)
>   static void ivpu_pm_prepare_warm_boot(struct ivpu_device *vdev)
>   {
>   	struct ivpu_fw_info *fw = vdev->fw;
> -	struct vpu_boot_params *bp = ivpu_bo_vaddr(fw->mem);
> +	struct vpu_boot_params *bp = ivpu_bo_vaddr(fw->mem_bp);
>   
>   	if (!bp->save_restore_ret_address) {
>   		ivpu_pm_prepare_cold_boot(vdev);
