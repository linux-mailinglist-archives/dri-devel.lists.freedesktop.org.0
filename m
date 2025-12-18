Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE33CCD35E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 19:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D8010E7FF;
	Thu, 18 Dec 2025 18:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BrBte5Uy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011032.outbound.protection.outlook.com [52.101.52.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A36C10E7FF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 18:42:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsfM58YDpOQplbAgO1nuBA9EMIwO9WCuz7yc6dwgmHUPrajU0qijFt0896FQ0n/R+95reCAYGTCcM915qBvZzMztZmbffUgz0kTYqVL63TgK22O4LlPc7wNjRbAu4xA/UhZLnZ2zT2P0xuJrDuVOcZhllVJlwwcwxcITk8yOP1qlVEa+p0loXOTl5ZHpLucd87lshqPHXCBDVf8q1iWMWXeATgEWMui8T0jZq18R/1vBobOyYB3/T6S+VkFTMBaN5I/+WUcL12kjghcn1/rKMUN0wPwxaZ7xq4ujnNZmD/0FYpxGD9/DhEWRwzZX+WJU7v3qz2n2/87HfjAvl2rW2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLKeJbOcBoUCbFhNAKou5gM9YeMgn68zek3Pt4oEyw4=;
 b=r/YZ9e/kAeync/rN9stRvIiUOWsvOqCtfxaMuHLuQy9CEaZkDaAw2Gnik/a4L2QLv84bcgjOGBImTo3JnLmNa4PadYUvppSUTxswTrReJ4bHabc2QGdoOFhbGk9hhYON5JUtVsOeih4i9uPYFsm/ftAR2F4MGTOtxfkcOcJ9YTgbTdLC7q08KRSHrgiApehQIYXgxqWShA6lw76MTbktjAyBtftBBKkRXELjnz9NKiSURtf3yD25zhm4MPSipRTz6klkygy6MazKAz/OhpInNpd+vK2oWj3kuMzc4QYiwQ68ljOFJ1nF3a7D0mpF55dChxytOhyjZUXSfiFcdZAYDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLKeJbOcBoUCbFhNAKou5gM9YeMgn68zek3Pt4oEyw4=;
 b=BrBte5UyQqQY0FvLIWdJ/QiHhzllNaN12Opi3g6XuQFq6QBLCtRVV1pb4YwhDBzS4B7PV1XQkmxcKRjmEBrYD7n9/OVFyBfWohHQbeBN2A4GQ+NwoW5xfrG5voImsukLaNePBrK4RuDWa3tdWaDfHxyszLYKxYxP71hxaH6mbD0=
Received: from CH2PR14CA0058.namprd14.prod.outlook.com (2603:10b6:610:56::38)
 by CY1PR12MB9650.namprd12.prod.outlook.com (2603:10b6:930:105::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 18:42:25 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::8) by CH2PR14CA0058.outlook.office365.com
 (2603:10b6:610:56::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 18:42:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 18:42:25 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 12:42:24 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 18 Dec 2025 12:42:23 -0600
Message-ID: <80809872-fb67-6568-7362-d92dcdc9f76b@amd.com>
Date: Thu, 18 Dec 2025 10:42:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Remove NPU2 support
Content-Language: en-US
To: Mario Limonciello <superm1@kernel.org>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251217190818.2145781-1-lizhi.hou@amd.com>
 <3d802b50-697b-45fa-88c3-8a0cf9b7bb52@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <3d802b50-697b-45fa-88c3-8a0cf9b7bb52@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|CY1PR12MB9650:EE_
X-MS-Office365-Filtering-Correlation-Id: d5a08e02-047f-4b59-3df9-08de3e65300e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUpIZ0FvK1BES2tSMjMzbkV3YTB0cmJlTVhTS2xZZ0R4dnBlVnpRNC93ZnBr?=
 =?utf-8?B?dDh2N3JMd0hQWmd2NjFRUjh1a3dqQWx1VXdPMnBScXYwMkxjN3k2OGZhZ2kr?=
 =?utf-8?B?VmVoTVBkQVYxeUpRR0lxSkI0M1l5MDJOdUxjdEJKQ2JhQWNPQlA3OEVnWVV2?=
 =?utf-8?B?T2xWb0NLaXVjMnFOdFZ2b0tNMElLTmU1R2I3Z1NBSFc5NlpWcC96OGFWU3hh?=
 =?utf-8?B?VFV5Tlpoc2VWRVRhK0ZDUVJzNXQ0QVBPNEsxZjFIaVlhcWhCcU1mVXp2MW04?=
 =?utf-8?B?S09WSzlKOUJscHF0WG00MFk1RnduSThCaDRHZTUyWmdmRXVEVkNXdTYzRDQz?=
 =?utf-8?B?cWxnNEhDWDBaeWNKSTkvSWFaa3VQc282V2gxV3hMb0l5bmUzZ3NtQnZHN0d5?=
 =?utf-8?B?dkNBZ0FFTEtxZGZienZBQmRNNnh4M3ExOXMxbXE4RCtPUUY4NXBmTG93c3Vx?=
 =?utf-8?B?dlhLVzV2YXBLS3Q2ZWViYjFIQmcyeVlwMTBwalpkZmxMWHplaThKc04vVGp2?=
 =?utf-8?B?eHprVjRyVEc3SUFTNXVGcTNvRFJTOStrQUNhTVdhRkVvb1RwN2VlYkx5WTVG?=
 =?utf-8?B?MGRxVXdYYm1XOHRDMXNOeGhaOGpWWENJcjFKSkNYVnhwQ3A4WCs3M3I4ZzFX?=
 =?utf-8?B?aEZXT1Q0ekhKcnFEQ3ZoMXlyMGJ1NWpxYkI0UkVaYmJEMkRmMjNiYXVUcEtY?=
 =?utf-8?B?aUJ0aU8xSERnUUd5RkNwSVY5Z2Q3bFlvd04rc3B2Z3cydjNnS1JPMTlTa0tL?=
 =?utf-8?B?NWlMVlJSVFY4MzRZMDQ4WkZYM28zVWZUMGtpMWlMZnhIaVNpb2dlbHB0YmZy?=
 =?utf-8?B?M29ITFgzTXNaanpTMm15OEIvVlhZNytVVnpQYXNFRmszOW5xNGRVMy8xbDR5?=
 =?utf-8?B?REdQd2ZWSlkxVnFQNzFSWk52YnZmQ0FJQ2tGT0txcHVVcHJSWnBRU0l2aDFx?=
 =?utf-8?B?VmxWdmp5UU1tWEdHWVU1elkzSzh4d0Fmb2tiaG9RMUIybndqQTQxQytiQ0pv?=
 =?utf-8?B?OHRmUWlPM2ZmRlJNYlZOM0NHM3JCSUdiNUhsd29YZk0xMzBXUHJMNWZ1SWhh?=
 =?utf-8?B?V2lIUkpEczVHc0RyOWZOWXpYdk9seDBsOVJKSFBIUmFpTHdUTDRRZFdQdmxH?=
 =?utf-8?B?UkNNM3h6VU5hZHlhbnR6L04wTkJGYmVad1owOUFLamNtb2Y2QnVVMXJJWHJ4?=
 =?utf-8?B?SWFJV0RPSzYyRDFPL08yTVUxN0pNcjJzMzJidWZKYzNKNTgyUEZmTkc2OTA0?=
 =?utf-8?B?OE1qSXA5bWg0eGViK3dQK2J5ckkweHRvdU9ETllyKzlCb2dJUkZ1T2xzU1Q0?=
 =?utf-8?B?aUo3K1ZkOUNCYnkyMVR0WHBnOWRyL1lxekd6eXd5RHJwdW0rMm5xb1V3ODJp?=
 =?utf-8?B?Y1JyN3ZqYU53TktLYmw5QmtjSDgxQXBWdUUwYUZ6WDdGOGxzd0E2b2VkWmdw?=
 =?utf-8?B?VG1hOEg0M2dTQ0pwN2orUDNRWnBUK1RhOGRUQzluL0RLempFN25XdmhaK2pX?=
 =?utf-8?B?ZHplU1dROC9jdS9mS3VJeG1XeEsybndwb0RJQjlMUEdvKzlDNnhVMnpsYlhx?=
 =?utf-8?B?T0hwMnlqNDlJdVNMK01SYzZuNHd6dUNvYlk3dVNOdkkzbjdRRDkwUVVob3VG?=
 =?utf-8?B?Wm5TRHhDUjNhMFlwd0dxQlZ3SHBDOVl5L0dkRythWjJTdmZvRTM1L1QyL3RF?=
 =?utf-8?B?N0REYnNxUzl5SE1Ld0VJMjhqOVVsUlc1ZFM1eXFQeTFHckI3QlpnYzJ5VUky?=
 =?utf-8?B?UGhQOElpVDdOcWlBcDhqY3FXSTJCL3dXdzlvNnZhUUYzRCs0OWNOem5uSW1Y?=
 =?utf-8?B?elV2RWYzclNTOFQrR0RNQzNWVVdDdWNBeGRsNUhFMzlGRGtnY3k3YWNiYjNi?=
 =?utf-8?B?aWNoZDJDcHlUdE9jNGxyaHVnc252MDhkQTR4UWg4em1vaVQwS0ROSlNFaWhs?=
 =?utf-8?B?c3VTdVNVcVNYV29ZZVMwUGFYcSs3emJuMTMrZXI4RFZuT25PV1lvbEtTVFhh?=
 =?utf-8?B?TTE1M2wzdVZydnNjeGMvK3JCeWNnNmJ4Y2tCVFU2VUVoK1FIOUZoRzRaelhl?=
 =?utf-8?B?a3cyZG9nSFU1MnFvOWlXT08rcXROd0l6N0lWM1VGMkNoQVhBYzZmMmJSYk5X?=
 =?utf-8?Q?egXs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:42:25.1772 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a08e02-047f-4b59-3df9-08de3e65300e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9650
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

Applied to drm-misc-next

On 12/17/25 11:13, Mario Limonciello wrote:
> On 12/17/25 1:08 PM, Lizhi Hou wrote:
>> NPU2 hardware was never publicly released and is now obsolete.
>> Remove all remaining NPU2 support from the driver.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>>   drivers/accel/amdxdna/Makefile |   1 -
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c |   1 -
>>   drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 -
>>   drivers/accel/amdxdna/npu2_regs.c       | 117 ------------------------
>>   4 files changed, 120 deletions(-)
>>   delete mode 100644 drivers/accel/amdxdna/npu2_regs.c
>>
>> diff --git a/drivers/accel/amdxdna/Makefile 
>> b/drivers/accel/amdxdna/Makefile
>> index 6344aaf523fa..3fa0e74fd8f5 100644
>> --- a/drivers/accel/amdxdna/Makefile
>> +++ b/drivers/accel/amdxdna/Makefile
>> @@ -18,7 +18,6 @@ amdxdna-y := \
>>       amdxdna_sysfs.o \
>>       amdxdna_ubuf.o \
>>       npu1_regs.o \
>> -    npu2_regs.o \
>>       npu4_regs.o \
>>       npu5_regs.o \
>>       npu6_regs.o
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c 
>> b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> index fcf7e7869007..7d59764d7869 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -51,7 +51,6 @@ MODULE_DEVICE_TABLE(pci, pci_ids);
>>     static const struct amdxdna_device_id amdxdna_ids[] = {
>>       { 0x1502, 0x0,  &dev_npu1_info },
>> -    { 0x17f0, 0x0,  &dev_npu2_info },
>>       { 0x17f0, 0x10, &dev_npu4_info },
>>       { 0x17f0, 0x11, &dev_npu5_info },
>>       { 0x17f0, 0x20, &dev_npu6_info },
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h 
>> b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> index 0d50c4c8b353..6580cb5ec7e2 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> @@ -137,7 +137,6 @@ struct amdxdna_client {
>>     /* Add device info below */
>>   extern const struct amdxdna_dev_info dev_npu1_info;
>> -extern const struct amdxdna_dev_info dev_npu2_info;
>>   extern const struct amdxdna_dev_info dev_npu4_info;
>>   extern const struct amdxdna_dev_info dev_npu5_info;
>>   extern const struct amdxdna_dev_info dev_npu6_info;
>> diff --git a/drivers/accel/amdxdna/npu2_regs.c 
>> b/drivers/accel/amdxdna/npu2_regs.c
>> deleted file mode 100644
>> index ad0743fb06d5..000000000000
>> --- a/drivers/accel/amdxdna/npu2_regs.c
>> +++ /dev/null
>> @@ -1,117 +0,0 @@
>> -// SPDX-License-Identifier: GPL-2.0
>> -/*
>> - * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
>> - */
>> -
>> -#include <drm/amdxdna_accel.h>
>> -#include <drm/drm_device.h>
>> -#include <drm/gpu_scheduler.h>
>> -#include <linux/sizes.h>
>> -
>> -#include "aie2_pci.h"
>> -#include "amdxdna_mailbox.h"
>> -#include "amdxdna_pci_drv.h"
>> -
>> -/* NPU Public Registers on MpNPUAxiXbar (refer to Diag 
>> npu_registers.h) */
>> -#define MPNPU_PWAITMODE                0x301003C
>> -#define MPNPU_PUB_SEC_INTR             0x3010060
>> -#define MPNPU_PUB_PWRMGMT_INTR         0x3010064
>> -#define MPNPU_PUB_SCRATCH0             0x301006C
>> -#define MPNPU_PUB_SCRATCH1             0x3010070
>> -#define MPNPU_PUB_SCRATCH2             0x3010074
>> -#define MPNPU_PUB_SCRATCH3             0x3010078
>> -#define MPNPU_PUB_SCRATCH4             0x301007C
>> -#define MPNPU_PUB_SCRATCH5             0x3010080
>> -#define MPNPU_PUB_SCRATCH6             0x3010084
>> -#define MPNPU_PUB_SCRATCH7             0x3010088
>> -#define MPNPU_PUB_SCRATCH8             0x301008C
>> -#define MPNPU_PUB_SCRATCH9             0x3010090
>> -#define MPNPU_PUB_SCRATCH10            0x3010094
>> -#define MPNPU_PUB_SCRATCH11            0x3010098
>> -#define MPNPU_PUB_SCRATCH12            0x301009C
>> -#define MPNPU_PUB_SCRATCH13            0x30100A0
>> -#define MPNPU_PUB_SCRATCH14            0x30100A4
>> -#define MPNPU_PUB_SCRATCH15            0x30100A8
>> -#define MP0_C2PMSG_73                  0x3810A24
>> -#define MP0_C2PMSG_123                 0x3810AEC
>> -
>> -#define MP1_C2PMSG_0                   0x3B10900
>> -#define MP1_C2PMSG_60                  0x3B109F0
>> -#define MP1_C2PMSG_61                  0x3B109F4
>> -
>> -#define MPNPU_SRAM_X2I_MAILBOX_0       0x3600000
>> -#define MPNPU_SRAM_X2I_MAILBOX_15      0x361E000
>> -#define MPNPU_SRAM_X2I_MAILBOX_31      0x363E000
>> -#define MPNPU_SRAM_I2X_MAILBOX_31      0x363F000
>> -
>> -#define MMNPU_APERTURE0_BASE           0x3000000
>> -#define MMNPU_APERTURE1_BASE           0x3600000
>> -#define MMNPU_APERTURE3_BASE           0x3810000
>> -#define MMNPU_APERTURE4_BASE           0x3B10000
>> -
>> -/* PCIe BAR Index for NPU2 */
>> -#define NPU2_REG_BAR_INDEX    0
>> -#define NPU2_MBOX_BAR_INDEX    0
>> -#define NPU2_PSP_BAR_INDEX    4
>> -#define NPU2_SMU_BAR_INDEX    5
>> -#define NPU2_SRAM_BAR_INDEX    2
>> -/* Associated BARs and Apertures */
>> -#define NPU2_REG_BAR_BASE    MMNPU_APERTURE0_BASE
>> -#define NPU2_MBOX_BAR_BASE    MMNPU_APERTURE0_BASE
>> -#define NPU2_PSP_BAR_BASE    MMNPU_APERTURE3_BASE
>> -#define NPU2_SMU_BAR_BASE    MMNPU_APERTURE4_BASE
>> -#define NPU2_SRAM_BAR_BASE    MMNPU_APERTURE1_BASE
>> -
>> -static const struct amdxdna_dev_priv npu2_dev_priv = {
>> -    .fw_path        = "amdnpu/17f0_00/npu.sbin",
>> -    .protocol_major = 0x6,
>> -    .protocol_minor = 0x6,
>> -    .rt_config    = npu4_default_rt_cfg,
>> -    .dpm_clk_tbl    = npu4_dpm_clk_table,
>> -    .fw_feature_tbl = npu4_fw_feature_table,
>> -    .col_align    = COL_ALIGN_NATURE,
>> -    .mbox_dev_addr  = NPU2_MBOX_BAR_BASE,
>> -    .mbox_size      = 0, /* Use BAR size */
>> -    .sram_dev_addr  = NPU2_SRAM_BAR_BASE,
>> -    .hwctx_limit    = 16,
>> -    .sram_offs      = {
>> -        DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU2_SRAM, 
>> MPNPU_SRAM_X2I_MAILBOX_0),
>> -        DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU2_SRAM, 
>> MPNPU_SRAM_X2I_MAILBOX_15),
>> -    },
>> -    .psp_regs_off   = {
>> -        DEFINE_BAR_OFFSET(PSP_CMD_REG,    NPU2_PSP, MP0_C2PMSG_123),
>> -        DEFINE_BAR_OFFSET(PSP_ARG0_REG,   NPU2_REG, 
>> MPNPU_PUB_SCRATCH3),
>> -        DEFINE_BAR_OFFSET(PSP_ARG1_REG,   NPU2_REG, 
>> MPNPU_PUB_SCRATCH4),
>> -        DEFINE_BAR_OFFSET(PSP_ARG2_REG,   NPU2_REG, 
>> MPNPU_PUB_SCRATCH9),
>> -        DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU2_PSP, MP0_C2PMSG_73),
>> -        DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU2_PSP, MP0_C2PMSG_123),
>> -        DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU2_REG, 
>> MPNPU_PUB_SCRATCH3),
>> -        DEFINE_BAR_OFFSET(PSP_PWAITMODE_REG, NPU2_REG, 
>> MPNPU_PWAITMODE),
>> -    },
>> -    .smu_regs_off   = {
>> -        DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU2_SMU, MP1_C2PMSG_0),
>> -        DEFINE_BAR_OFFSET(SMU_ARG_REG,  NPU2_SMU, MP1_C2PMSG_60),
>> -        DEFINE_BAR_OFFSET(SMU_INTR_REG, NPU2_SMU, 
>> MMNPU_APERTURE4_BASE),
>> -        DEFINE_BAR_OFFSET(SMU_RESP_REG, NPU2_SMU, MP1_C2PMSG_61),
>> -        DEFINE_BAR_OFFSET(SMU_OUT_REG,  NPU2_SMU, MP1_C2PMSG_60),
>> -    },
>> -    .hw_ops    =     {
>> -        .set_dpm = npu4_set_dpm,
>> -    },
>> -};
>> -
>> -const struct amdxdna_dev_info dev_npu2_info = {
>> -    .reg_bar           = NPU2_REG_BAR_INDEX,
>> -    .mbox_bar          = NPU2_MBOX_BAR_INDEX,
>> -    .sram_bar          = NPU2_SRAM_BAR_INDEX,
>> -    .psp_bar           = NPU2_PSP_BAR_INDEX,
>> -    .smu_bar           = NPU2_SMU_BAR_INDEX,
>> -    .first_col         = 0,
>> -    .dev_mem_buf_shift = 15, /* 32 KiB aligned */
>> -    .dev_mem_base      = AIE2_DEVM_BASE,
>> -    .dev_mem_size      = AIE2_DEVM_SIZE,
>> -    .vbnv              = "RyzenAI-npu2",
>> -    .device_type       = AMDXDNA_DEV_TYPE_KMQ,
>> -    .dev_priv          = &npu2_dev_priv,
>> -    .ops               = &aie2_ops, /* NPU2 can share NPU1's 
>> callback */
>> -};
>
