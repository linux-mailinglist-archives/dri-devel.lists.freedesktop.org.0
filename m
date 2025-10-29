Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A98E1C1D51F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 21:57:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617D110E848;
	Wed, 29 Oct 2025 20:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="M8NRNH3w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010008.outbound.protection.outlook.com [52.101.61.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B656E10E850;
 Wed, 29 Oct 2025 20:57:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgDjfi4znYdOwCKjLSvyrJcP1C7FaMX7zx+WbTx+g39All5mE6iyxXmPOs44dEe15X5oWNcyuPfSwX4hGmmsBIVpsvIJlbzCTN/PmfdZqv/KDTIFSG4VxKtZnhsi3SKn9AwgqCdDILfB+lIEgGLuV0BHu2EeR9Y5/TbKob1yxs40xqaeFz+6sS0XesXVThrP21184p2YhAnNg/mU77LpphsG1oCkynvFqqs0iCdDUDS1M5UxnS08IgqIYWXAzlpOM8+Jggww3DG6s3+FyhOFSm0VLv8wfPdyeiKT7Mjnps/gwMHHaBqN6/5r7TWMwn0P3B6H9xkJ22piCR6bX9pa+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcnBI9RTNium7Xbghgb521UPeOumf2VBpuOvyFGsZgU=;
 b=LRABxe2KSMFj/nYbX+ClWXF1sfv60eaHLR09WK1bWuTtqZWYzDaSJPeRNeUHjtMVDTUlq1ELhY/nO48/fkIuckx+IJNMpguFg5MhcFJtLWYJpZHhnj5zFv10dq7BZN790YfDBPa882pXa1/Ei2i3/QP/m328LyMNjRQng4BSosmPvtwRKkVgiIUGpi51z1GQAyHnsbHpxQ55tMyv08mhJn4HqUOB2oA/vcis3PmePD+qky9UCH8TbuuvtQ6Qn6Z64kvQXwmOsTiuE/LN6OFl9SDte2T2pXDORfvyds6Rz9v6PBaqoXfQ+mdD6IVIm/vuju1KoacLD3ZElHKowpqhFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcnBI9RTNium7Xbghgb521UPeOumf2VBpuOvyFGsZgU=;
 b=M8NRNH3wmrezAaK+3/3rZ8ZU87gpmouas8nCGIv2DC7nRTY4Jfb0DH/lJBGYjz/VZ9YvYPSoztTa3Y6MZwviePrPqe/kqRqDKjh3nSXHZVVDGBkgTC8T+rzxIg8mZam9gddAe/DmR5tbs9w0+FxCcBbtc+fZDruKNMFNYDds1nI=
Received: from BL0PR05CA0004.namprd05.prod.outlook.com (2603:10b6:208:91::14)
 by SN7PR12MB7953.namprd12.prod.outlook.com (2603:10b6:806:345::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Wed, 29 Oct
 2025 20:57:29 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:91:cafe::34) by BL0PR05CA0004.outlook.office365.com
 (2603:10b6:208:91::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 20:57:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 20:57:28 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 13:57:27 -0700
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon, UAPI drm-next-6.19
Date: Wed, 29 Oct 2025 16:57:12 -0400
Message-ID: <20251029205713.9480-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|SN7PR12MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a71d4fb-1944-49f0-264f-08de172dc552
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnVqbk1XdDU3Rzdab3ZlZDRkK2swNVNUVDlydHJCbXhjMk1zckRIRkl0V3ZV?=
 =?utf-8?B?OVFERmZvV3g2aEtCUE5yWHR1bDNSNithTFBVNjBWcXd6M0hPcDVOajZiYi9L?=
 =?utf-8?B?OXJBUDRGalRodmFxczFmYTYwZWtNazBJV1dXRXgxMHZZa1hOSHhlOXRYLzhC?=
 =?utf-8?B?U3MvOW1OMEtwQ3UxYkwwK2VQd3NQY2JZbmMwSlJMQzQ3RGQxclZyYmRJaFVR?=
 =?utf-8?B?SExZZVUwU2E2eFExb2g5em9TcGZVOThrQ1gyYW5ZbVZjMHh5TUFrbzRESGw4?=
 =?utf-8?B?TU1VVmxDc24xRVRwLzZMR0YrYkZQMlp0ajUvTXhSZXg2amEvWGliWU9BTW44?=
 =?utf-8?B?UWZaL0lNWkR5amw4ckF2eCtrUEl3ZmV1RXFQRlpldldJN3pUSzIrL0xZOGdK?=
 =?utf-8?B?VUVTcjN5WVVkcWZnZWh1d204NWp3ZFpCOWJzUmQ0cHZXWnRLYmwzZDlveTNU?=
 =?utf-8?B?L3ludXh0RnhCL0hqNmdzVjJCK1dXbFJIdHd5YjFDelpiUG1OTnptbWJYWnZJ?=
 =?utf-8?B?M2lGYXFWeG54dTNycHR2K2RBWk9IaWx3bkROSUd1alBZSndkbmFac0ZjYkQ5?=
 =?utf-8?B?UDMyYnNXM3BjMjNJUW0vZzAvdFdnT053NGpzQmVrYzFVOTdFRVlxcFJDZ0t5?=
 =?utf-8?B?UlVlVzN6eVZvY3hrdjdtTTE0SHFpK2pia3VvTTNYSlJpUkJCZUFleEVJN0E0?=
 =?utf-8?B?WW0xWG1TY2llVHU2aVEvWmEwbGlmVXdYTDlPUndsd3dQVTh5UllTcHNZbzVr?=
 =?utf-8?B?SHh1azNIQVJzZGlwODNNYnZ3RlBXaDVhVzJscVNSdHpLVHJ5Y2ZaVi9CWExw?=
 =?utf-8?B?RXJibEFQYnQ1SXNrR1NPYk5KNE41M2FsajlPb2Y1alloRGZENkRaS3BiajBi?=
 =?utf-8?B?L1hNNklsdFB3aFdPM3o4TmdGd2swQ29BRjBhOW5PbjBzb1NTRitnUEMxRk1t?=
 =?utf-8?B?ZTl6YWV6SW9WeVFaYlA4KzlUcnRzMUluL2Y3SVMxcVBYS2I3U1R5OEZ6YTRl?=
 =?utf-8?B?MHZnQ2hBaGdSOVAzRHlrdHpVOThndnRncG5KOVZlUHpHUXErcTA1cUQ4bi9s?=
 =?utf-8?B?SU9QRC9UTkwwQWZ1UGpOakVMNGcwbVFTNTBDd3V4TlBOS2U1b0dkalJQZXNY?=
 =?utf-8?B?TEliam54N0pPeDljd2xqT2J1SjJkakJ2MUVGenYrMnlxbTQwZnhPYnorby9j?=
 =?utf-8?B?cFZiUzhKQU9MMzQwYUdCbjcrdkZ5RnUzeFZOVTFORlg2SnhpdXdXRWsxa2gw?=
 =?utf-8?B?NE5kUTdYdHpETFVPdms4clhreEptekIzUzVTSUNwdGh2aVpyazhlSXRmcnJJ?=
 =?utf-8?B?YitDZmJFWWppMXFBeEMzb0dDQWpoMFBvNHZHYlN2djFQb1hESll2SkNpZllH?=
 =?utf-8?B?RW10eDM0WEppNzlzaHI1bHVnbEpxeGdZaVp4UkJ0NWN0U3I4bFh3Z0hBRXJO?=
 =?utf-8?B?Tnkrb2RQWllTS2dZa1ltMGZ3cUM3T1l6SGYxampaQS9ZampzTzRwaWEwa2x3?=
 =?utf-8?B?UzFuVnc5S1lyaElHRk9oM055bWEraW5lWFBYQ0FEbFN4YWIzejJkdXk3T0V3?=
 =?utf-8?B?R2wxdzVQaGM2ME1QeGptZVBaS3grbUNiYjF4b0hTUTdvNlMrbEw0ZndSMHNm?=
 =?utf-8?B?YU8ybnd1U3VjcjlmWFFvd1h5L0ZIRGlmZXdPZnB2NHR4TnNFeFVZWHpTcC9I?=
 =?utf-8?B?TGRDdUovYXZnMnZZUkIrQnVLdlZva1hXT3c4SEU4Z2RVVDhIdzB1aEpTNGNZ?=
 =?utf-8?B?WXhBN2t6QXh3L2lXeHg1V2hxOCtzL0VHeUlmZEJPVmt3WksxZ0xoanJ2cGJu?=
 =?utf-8?B?ZGdvanJFUlpFNGx0M3lDc2RSWVpVUTdlUHdrdzNVcG81b0Y0VFo4UVQrWE9S?=
 =?utf-8?B?aHNLa0EzN0VndVVpaUpsWVlpRkJsRUdIYUVmZ2xzMkZJY0lMK1F6SUxNcXJS?=
 =?utf-8?B?bmxqUGFNekJXUHAzSUpJeHZSWnFFeVhqbGg4RkY2NkpqUFNSdmpLQmNGNVoz?=
 =?utf-8?B?KzNrbmJJajY4MUJ3OVdiejRLeW5PTlkyNzlYUVIvNVN2MklVb2ZwVE5Nb2I3?=
 =?utf-8?Q?7JWhVs?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 20:57:28.4211 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a71d4fb-1944-49f0-264f-08de172dc552
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7953
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

Hi Dave, Simona,

More new stuff for 6.19.

The following changes since commit 883687c30736c1b4d36c8cc6153bca5c2c76a5d8:

  drm/amdgpu: Remove unused members in amdgpu_mman (2025-10-20 18:28:22 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.19-2025-10-29

for you to fetch changes up to 1bc9d39275e08853ff15410b4d530b46b546affb:

  drm/radeon: Remove redundant pm_runtime_mark_last_busy() calls (2025-10-28 11:31:45 -0400)

----------------------------------------------------------------
amd-drm-next-6.19-2025-10-29:

amdgpu:
- VPE idle handler fix
- Re-enable DM idle optimizations
- DCN3.0 fix
- SMU fix
- Powerplay fixes for fiji/iceland
- License copy-pasta fixes
- HDP eDP panel fix
- Vblank fix
- RAS fixes
- SR-IOV updates
- SMU 13 VCN reset fix
- DMUB fixes
- DC frame limit fix
- Additional DC underflow logging
- DCN 3.1.5 fixes
- DC Analog encoders support
- Enable DC on bonaire by default
- UserQ fixes
- Remove redundant pm_runtime_mark_last_busy() calls

amdkfd:
- Process cleanup fix
- Misc fixes

radeon:
- devm migration fixes
- Remove redundant pm_runtime_mark_last_busy() calls

UAPI
- Add ABM KMS property
  Proposed kwin changes: https://invent.kde.org/plasma/kwin/-/merge_requests/6028

----------------------------------------------------------------
Alex Deucher (5):
      drm/amdgpu: fix SPDX headers on amdgpu_cper.c/h
      drm/amdgpu: fix SPDX header on amd_cper.h
      drm/amdgpu: fix SPDX header on irqsrcs_vcn_5_0.h
      drm/amdgpu: fix SPDX header on cyan_skillfish_reg_init.c
      drm/amdgpu/userq: fix SDMA and compute validation

Alex Hung (1):
      drm/amd/display: Add HDR workaround for a specific eDP

Alvin Lee (1):
      drm/amd/display: Update cursor offload assignments

Austin Zheng (1):
      drm/amd/display: Rename dml2 to dml2_0 folder

Dan Carpenter (1):
      drm/amdgpu/userqueue: Fix use after free in amdgpu_userq_buffer_vas_list_cleanup()

Daniel Palmer (3):
      drm/radeon: Clean up pdev->dev instances in probe
      drm/radeon: Do not kfree() devres managed rdev
      drm/radeon: Remove calls to drm_put_dev()

Dillon Varone (1):
      drm/amd/display: Fix DMUB reset sequence for DCN32

Dmytro Laktyushkin (1):
      drm/amd/display: Add opp count validation to dml2.1

Dominik Kaszewski (3):
      drm/amd/display: Remove dc param from check_update
      drm/amd/display: Add lock descriptor to check_update
      drm/amd/display: Make observers const-correct

Ivan Lipski (1):
      drm/amd/display: Fix incorrect return of vblank enable on unconfigured crtc

Jesse.Zhang (2):
      drm/amd/pm: smu13: Enable VCN_RESET for pgm 7 with appropriate firmware version
      drm/amdgpu: Convert amdgpu userqueue management from IDR to XArray

Jinzhou Su (2):
      drm/amdgpu: clear bad page info of ras module
      drm/amdgpu: Add uniras version in sysfs

John Smith (2):
      drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel value on Fiji
      drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel value on Iceland

Karen Chen (1):
      drm/amd/display: Add more DC HW state info to underflow logging

Kenneth Feng (1):
      drm/amd/display: pause the workload setting in dm

Lijo Lazar (1):
      drm/amdgpu/pm: Add definition for gpu_metrics v1.9

Mario Limonciello (3):
      drm/amd: Check that VPE has reached DPM0 in idle handler
      drm/amd: Re-introduce property to control adaptive backlight modulation
      drm/amd/display: Bump minimum for frame_warn_limit

Matthew Schwartz (1):
      drm/amd/display: Don't program BLNDGAM_MEM_PWR_FORCE when CM low-power is disabled on DCN30

Meenakshikumar Somasundaram (2):
      drm/amd/display: update link encoder assignment
      drm/amd/display: Add dc interface to log pre os firmware information

Nicholas Kazlauskas (2):
      drm/amd/display: Fix wrong index for DCN401 cursor offload
      drm/amd/display: Fix notification of vtotal to DMU for cursor offload

Perry Yuan (1):
      drm/amdgpu: get rev_id from strap register or IP-discovery table

Philip Yang (1):
      drm/amdkfd: Dequeue user queues when process mm released

Sakari Ailus (2):
      drm/amd: Remove redundant pm_runtime_mark_last_busy() calls
      drm/radeon: Remove redundant pm_runtime_mark_last_busy() calls

Srinivasan Shanmugam (3):
      drm/amdgpu: Make SR-IOV critical region checks overflow-safe
      drm/amdgpu: Fix pointer casts when reading dynamic region sizes
      drm/amdkfd: Fix use-after-free of HMM range in svm_range_validate_and_map()

Sunday Clement (1):
      drm/amdkfd: Fix Unchecked Return Value

Sunil Khatri (3):
      drm/amdgpu: null check for hmm_pfns ptr before freeing it
      drm/amdkfd: add missing return value check for range
      drm/amdkfd: fix the clean up when amdgpu_hmm_range_alloc fails

Taimur Hassan (2):
      drm/amd/display: [FW Promotion] Release 0.1.33.0
      drm/amd/display: Promote DC to 3.2.356

Timur Kristóf (23):
      drm/amd/display: Determine DVI-I connector type (v2)
      drm/amd/display: Add analog bit to edid_caps (v2)
      drm/amd/display: Introduce MAX_LINK_ENCODERS (v2)
      drm/amd/display: Hook up DAC to bios_parser_encoder_control
      drm/amd/display: Add SelectCRTC_Source to BIOS parser
      drm/amd/display: Get maximum pixel clock from VBIOS
      drm/amd/display: Don't use stereo sync and audio on RGB signals (v2)
      drm/amd/display: Don't try to enable/disable HPD when unavailable
      drm/amd/display: Determine early if a link has supported encoders (v2)
      drm/amd/display: Add concept of analog encoders (v2)
      drm/amd/display: Implement DCE analog stream encoders
      drm/amd/display: Implement DCE analog link encoders (v2)
      drm/amd/display: Support DAC in dce110_hwseq
      drm/amd/display: Add analog link detection (v2)
      drm/amd/display: Refactor amdgpu_dm_connector_detect (v2)
      drm/amd/display: Poll analog connectors (v3)
      drm/amd/display: Add DCE BIOS_SCRATCH_0 register
      drm/amd/display: Make get_support_mask_for_device_id reusable
      drm/amd/display: Add DAC_LoadDetection to BIOS parser (v2)
      drm/amd/display: Use DAC load detection on analog connectors (v2)
      drm/amd/display: Add common modes to analog displays without EDID
      drm/amd/display: Don't add freesync modes to analog displays (v2)
      drm/amdgpu: Use DC by default for Bonaire

Yang Wang (1):
      drm/amd/pm: fix smu table id bound check issue in smu_cmn_update_table()

Zhongwei Zhang (1):
      drm/amd/display: init dispclk from bootup clock for DCN315

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.h           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  25 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  62 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.h        |   7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  20 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c            |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  55 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c  |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c          | 154 ++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h          |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |  34 ++-
 .../gpu/drm/amd/amdgpu/cyan_skillfish_reg_init.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   4 +
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c         |  41 +--
 drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c             |  24 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  14 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 212 ++++++++++++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  21 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   5 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   2 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  |  17 ++
 drivers/gpu/drm/amd/display/dc/Makefile            |   2 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  |  95 ++++++-
 .../gpu/drm/amd/display/dc/bios/command_table.c    | 286 +++++++++++++++++++++
 .../gpu/drm/amd/display/dc/bios/command_table.h    |   6 +
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |  87 ++++++-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.h |   1 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 220 ++++++++--------
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  53 +++-
 drivers/gpu/drm/amd/display/dc/core/dc_state.c     |   4 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   8 +
 drivers/gpu/drm/amd/display/dc/dc.h                |  68 +++--
 drivers/gpu/drm/amd/display/dc/dc_bios_types.h     |   9 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |  21 ++
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |   7 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |  11 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h          |   8 +-
 .../gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.h |  64 ++++-
 .../gpu/drm/amd/display/dc/dccg/dcn31/dcn31_dccg.c | 123 +++++++++
 .../gpu/drm/amd/display/dc/dccg/dcn31/dcn31_dccg.h |   2 +
 .../drm/amd/display/dc/dccg/dcn314/dcn314_dccg.c   |   3 +-
 .../drm/amd/display/dc/dccg/dcn314/dcn314_dccg.h   |   3 +-
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c |   1 +
 .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.h |   5 +-
 .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   |   1 +
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |  85 ++++++
 .../gpu/drm/amd/display/dc/dce/dce_link_encoder.h  |  16 +-
 .../drm/amd/display/dc/dce/dce_stream_encoder.c    |  14 +
 .../drm/amd/display/dc/dce/dce_stream_encoder.h    |   5 +
 drivers/gpu/drm/amd/display/dc/dml2/Makefile       | 141 ----------
 drivers/gpu/drm/amd/display/dc/dml2_0/Makefile     | 140 ++++++++++
 .../drm/amd/display/dc/{dml2 => dml2_0}/cmntypes.h |  18 +-
 .../dc/{dml2 => dml2_0}/display_mode_core.c        |   2 +
 .../dc/{dml2 => dml2_0}/display_mode_core.h        |   0
 .../{dml2 => dml2_0}/display_mode_core_structs.h   |   3 +-
 .../dc/{dml2 => dml2_0}/display_mode_lib_defines.h |   2 +-
 .../dc/{dml2 => dml2_0}/display_mode_util.c        |   0
 .../dc/{dml2 => dml2_0}/display_mode_util.h        |   2 -
 .../dml21/dml21_translation_helper.c               |   0
 .../dml21/dml21_translation_helper.h               |   0
 .../dc/{dml2 => dml2_0}/dml21/dml21_utils.c        |   0
 .../dc/{dml2 => dml2_0}/dml21/dml21_utils.h        |   0
 .../dc/{dml2 => dml2_0}/dml21/dml21_wrapper.c      |   4 +-
 .../dc/{dml2 => dml2_0}/dml21/dml21_wrapper.h      |   0
 .../dml21/inc/bounding_boxes/dcn4_soc_bb.h         |   1 -
 .../dml21/inc/dml2_external_lib_deps.h             |   0
 .../dc/{dml2 => dml2_0}/dml21/inc/dml_top.h        |   0
 .../dml21/inc/dml_top_dchub_registers.h            |   0
 .../dml21/inc/dml_top_display_cfg_types.h          |   0
 .../dml21/inc/dml_top_policy_types.h               |   0
 .../dml21/inc/dml_top_soc_parameter_types.h        |   0
 .../dc/{dml2 => dml2_0}/dml21/inc/dml_top_types.h  |   0
 .../dml21/src/dml2_core/dml2_core_dcn4.c           |   1 +
 .../dml21/src/dml2_core/dml2_core_dcn4.h           |   0
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |  29 ++-
 .../dml21/src/dml2_core/dml2_core_dcn4_calcs.h     |   0
 .../dml21/src/dml2_core/dml2_core_factory.c        |   0
 .../dml21/src/dml2_core/dml2_core_factory.h        |   0
 .../dml21/src/dml2_core/dml2_core_shared_types.h   |   3 +
 .../dml21/src/dml2_core/dml2_core_utils.c          |   0
 .../dml21/src/dml2_core/dml2_core_utils.h          |   0
 .../dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c           |   0
 .../dml21/src/dml2_dpmm/dml2_dpmm_dcn4.h           |   0
 .../dml21/src/dml2_dpmm/dml2_dpmm_factory.c        |   0
 .../dml21/src/dml2_dpmm/dml2_dpmm_factory.h        |   0
 .../dml21/src/dml2_mcg/dml2_mcg_dcn4.c             |   0
 .../dml21/src/dml2_mcg/dml2_mcg_dcn4.h             |   2 +-
 .../dml21/src/dml2_mcg/dml2_mcg_factory.c          |   0
 .../dml21/src/dml2_mcg/dml2_mcg_factory.h          |   0
 .../dml21/src/dml2_pmo/dml2_pmo_dcn3.c             |   0
 .../dml21/src/dml2_pmo/dml2_pmo_dcn3.h             |   0
 .../dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c       |   0
 .../dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h       |   0
 .../dml21/src/dml2_pmo/dml2_pmo_factory.c          |   0
 .../dml21/src/dml2_pmo/dml2_pmo_factory.h          |   2 +-
 .../src/dml2_standalone_libraries/lib_float_math.c |   0
 .../src/dml2_standalone_libraries/lib_float_math.h |   0
 .../dml21/src/dml2_top/dml2_top_interfaces.c       |   0
 .../dml21/src/dml2_top/dml2_top_legacy.c           |   0
 .../dml21/src/dml2_top/dml2_top_legacy.h           |   0
 .../dml21/src/dml2_top/dml2_top_soc15.c            |   0
 .../dml21/src/dml2_top/dml2_top_soc15.h            |   0
 .../dc/{dml2 => dml2_0}/dml21/src/inc/dml2_debug.h |   0
 .../dml21/src/inc/dml2_internal_shared_types.h     |   0
 .../dc/{dml2 => dml2_0}/dml2_dc_resource_mgmt.c    |   0
 .../dc/{dml2 => dml2_0}/dml2_dc_resource_mgmt.h    |   0
 .../display/dc/{dml2 => dml2_0}/dml2_dc_types.h    |   0
 .../dc/{dml2 => dml2_0}/dml2_internal_types.h      |   2 +-
 .../dc/{dml2 => dml2_0}/dml2_mall_phantom.c        |   1 +
 .../dc/{dml2 => dml2_0}/dml2_mall_phantom.h        |   0
 .../amd/display/dc/{dml2 => dml2_0}/dml2_policy.c  |   0
 .../amd/display/dc/{dml2 => dml2_0}/dml2_policy.h  |   0
 .../dc/{dml2 => dml2_0}/dml2_translation_helper.c  |   3 +
 .../dc/{dml2 => dml2_0}/dml2_translation_helper.h  |   0
 .../amd/display/dc/{dml2 => dml2_0}/dml2_utils.c   |   0
 .../amd/display/dc/{dml2 => dml2_0}/dml2_utils.h   |   0
 .../amd/display/dc/{dml2 => dml2_0}/dml2_wrapper.c |   0
 .../amd/display/dc/{dml2 => dml2_0}/dml2_wrapper.h |   0
 .../amd/display/dc/{dml2 => dml2_0}/dml_assert.h   |   0
 .../display/dc/{dml2 => dml2_0}/dml_depedencies.h  |   1 +
 .../dc/{dml2 => dml2_0}/dml_display_rq_dlg_calc.c  |   0
 .../dc/{dml2 => dml2_0}/dml_display_rq_dlg_calc.h  |   0
 .../amd/display/dc/{dml2 => dml2_0}/dml_logging.h  |   1 +
 .../gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp.h   |   4 +-
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c   |  19 +-
 .../gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.h   |   2 +
 .../gpu/drm/amd/display/dc/dpp/dcn32/dcn32_dpp.c   |   1 +
 .../gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.c   |   1 +
 .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c |   1 +
 .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c  |   1 +
 .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.c   |   8 +
 .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.h   |   1 +
 .../gpu/drm/amd/display/dc/dsc/dcn35/dcn35_dsc.c   |   1 +
 .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c |   1 +
 drivers/gpu/drm/amd/display/dc/dsc/dsc.h           |   5 +
 .../drm/amd/display/dc/hubbub/dcn30/dcn30_hubbub.c |  33 +--
 .../drm/amd/display/dc/hubbub/dcn30/dcn30_hubbub.h |   6 +-
 .../drm/amd/display/dc/hubbub/dcn31/dcn31_hubbub.c |   3 +-
 .../drm/amd/display/dc/hubbub/dcn32/dcn32_hubbub.c |   3 +-
 .../drm/amd/display/dc/hubbub/dcn35/dcn35_hubbub.c |   3 +-
 .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.c   |   3 +-
 .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.h | 136 +++++++++-
 .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.h |   8 +-
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.c | 147 +++++++++--
 .../gpu/drm/amd/display/dc/hubp/dcn30/dcn30_hubp.h |   2 +
 .../gpu/drm/amd/display/dc/hubp/dcn31/dcn31_hubp.c |   4 +-
 .../gpu/drm/amd/display/dc/hubp/dcn32/dcn32_hubp.c |   4 +-
 .../gpu/drm/amd/display/dc/hubp/dcn35/dcn35_hubp.c |   4 +-
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |  28 +-
 .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h   |   2 +-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  75 +++++-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |  76 +++---
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |   2 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |  12 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       | 121 ++++++++-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |  12 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h        |  16 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |   5 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |  24 ++
 .../gpu/drm/amd/display/dc/inc/hw/link_encoder.h   |   2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h  |   2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h        |  27 ++
 drivers/gpu/drm/amd/display/dc/inc/hw/opp.h        |  13 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   | 130 ++++++++++
 drivers/gpu/drm/amd/display/dc/inc/resource.h      |   1 +
 .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |  19 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   | 147 ++++++++++-
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   9 +-
 drivers/gpu/drm/amd/display/dc/link/link_factory.c |  60 ++++-
 .../gpu/drm/amd/display/dc/mpc/dcn30/dcn30_mpc.c   |  16 ++
 .../gpu/drm/amd/display/dc/mpc/dcn30/dcn30_mpc.h   |   5 +
 .../gpu/drm/amd/display/dc/mpc/dcn32/dcn32_mpc.c   |   1 +
 .../gpu/drm/amd/display/dc/mpc/dcn401/dcn401_mpc.c |   1 +
 .../gpu/drm/amd/display/dc/opp/dcn10/dcn10_opp.c   |  14 +-
 .../gpu/drm/amd/display/dc/opp/dcn10/dcn10_opp.h   |   6 +-
 .../gpu/drm/amd/display/dc/opp/dcn20/dcn20_opp.c   |  13 +
 .../gpu/drm/amd/display/dc/opp/dcn20/dcn20_opp.h   |   6 +-
 .../gpu/drm/amd/display/dc/opp/dcn35/dcn35_opp.c   |  13 +
 .../gpu/drm/amd/display/dc/opp/dcn35/dcn35_opp.h   |   4 +-
 .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h |  38 ++-
 .../gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c | 131 ++++++++++
 .../gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.h |   2 +
 .../drm/amd/display/dc/optc/dcn314/dcn314_optc.c   |   1 +
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |   1 +
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |   1 +
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.c   |   1 +
 .../display/dc/resource/dce100/dce100_resource.c   |  38 ++-
 .../display/dc/resource/dce110/dce110_resource.c   |   7 +-
 .../display/dc/resource/dce112/dce112_resource.c   |   9 +-
 .../display/dc/resource/dce120/dce120_resource.c   |   9 +-
 .../amd/display/dc/resource/dce60/dce60_resource.c |  29 ++-
 .../amd/display/dc/resource/dce80/dce80_resource.c |  34 ++-
 .../amd/display/dc/resource/dcn10/dcn10_resource.c |   7 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |   6 +-
 .../display/dc/resource/dcn201/dcn201_resource.c   |   6 +-
 .../amd/display/dc/resource/dcn21/dcn21_resource.c |   6 +-
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |   6 +-
 .../display/dc/resource/dcn301/dcn301_resource.c   |   6 +-
 .../display/dc/resource/dcn302/dcn302_resource.c   |   6 +-
 .../display/dc/resource/dcn303/dcn303_resource.c   |   6 +-
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |   6 +-
 .../display/dc/resource/dcn314/dcn314_resource.c   |   6 +-
 .../display/dc/resource/dcn315/dcn315_resource.c   |   7 +-
 .../display/dc/resource/dcn316/dcn316_resource.c   |   6 +-
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |   8 +-
 .../display/dc/resource/dcn321/dcn321_resource.c   |   6 +-
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   8 +-
 .../display/dc/resource/dcn351/dcn351_resource.c   |   8 +-
 .../amd/display/dc/resource/dcn36/dcn36_resource.c |   8 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |   8 +-
 .../dcn401/dcn401_soc_and_ip_translator.h          |   2 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |  25 ++
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  12 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |  50 ++--
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |  39 +++
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.h  |   2 +
 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c |  17 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   9 +
 .../drm/amd/display/include/bios_parser_types.h    |  11 +-
 .../amd/display/include/grph_object_ctrl_defs.h    |   1 +
 .../gpu/drm/amd/display/include/grph_object_id.h   |   7 +
 drivers/gpu/drm/amd/display/include/signal_types.h |  12 +
 drivers/gpu/drm/amd/include/amd_cper.h             |   2 +-
 .../drm/amd/include/ivsrcid/vcn/irqsrcs_vcn_5_0.h  |   2 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     | 117 +++++++++
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   1 -
 .../gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c  |   2 +-
 .../drm/amd/pm/powerplay/smumgr/iceland_smumgr.c   |   2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   2 +-
 drivers/gpu/drm/radeon/radeon_acpi.c               |   1 -
 drivers/gpu/drm/radeon/radeon_connectors.c         |  20 +-
 drivers/gpu/drm/radeon/radeon_display.c            |   2 -
 drivers/gpu/drm/radeon/radeon_drv.c                |  36 +--
 drivers/gpu/drm/radeon/radeon_fbdev.c              |   2 -
 drivers/gpu/drm/radeon/radeon_kms.c                |   5 -
 256 files changed, 3549 insertions(+), 892 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2_0/Makefile
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/cmntypes.h (93%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/display_mode_core.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/display_mode_core.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/display_mode_core_structs.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/display_mode_lib_defines.h (95%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/display_mode_util.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/display_mode_util.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/dml21_translation_helper.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/dml21_translation_helper.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/dml21_utils.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/dml21_utils.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/dml21_wrapper.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/dml21_wrapper.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/inc/bounding_boxes/dcn4_soc_bb.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/inc/dml2_external_lib_deps.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/inc/dml_top.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/inc/dml_top_dchub_registers.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/inc/dml_top_display_cfg_types.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/inc/dml_top_policy_types.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/inc/dml_top_soc_parameter_types.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/inc/dml_top_types.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_core/dml2_core_dcn4.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_core/dml2_core_dcn4.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_core/dml2_core_dcn4_calcs.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_core/dml2_core_dcn4_calcs.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_core/dml2_core_factory.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_core/dml2_core_factory.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_core/dml2_core_shared_types.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_core/dml2_core_utils.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_core/dml2_core_utils.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_dpmm/dml2_dpmm_factory.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_dpmm/dml2_dpmm_factory.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_mcg/dml2_mcg_dcn4.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_mcg/dml2_mcg_dcn4.h (97%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_mcg/dml2_mcg_factory.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_mcg/dml2_mcg_factory.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_pmo/dml2_pmo_dcn3.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_pmo/dml2_pmo_dcn3.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_pmo/dml2_pmo_factory.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_pmo/dml2_pmo_factory.h (97%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_standalone_libraries/lib_float_math.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_standalone_libraries/lib_float_math.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_top/dml2_top_interfaces.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_top/dml2_top_legacy.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_top/dml2_top_legacy.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_top/dml2_top_soc15.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/dml2_top/dml2_top_soc15.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/inc/dml2_debug.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml21/src/inc/dml2_internal_shared_types.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_dc_resource_mgmt.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_dc_resource_mgmt.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_dc_types.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_internal_types.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_mall_phantom.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_mall_phantom.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_policy.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_policy.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_translation_helper.c (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_translation_helper.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_utils.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_utils.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_wrapper.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml2_wrapper.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml_assert.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml_depedencies.h (99%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml_display_rq_dlg_calc.c (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml_display_rq_dlg_calc.h (100%)
 rename drivers/gpu/drm/amd/display/dc/{dml2 => dml2_0}/dml_logging.h (99%)
