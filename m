Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F375FAC8364
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 22:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090CD10E789;
	Thu, 29 May 2025 20:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="N+IW+OKt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39C410E0DB;
 Thu, 29 May 2025 20:52:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfmJO5dolQ/bFmKNhDscT3pa5gzb4NPYhkIno8AgfpuZ2a1mKufZcqFQsxdgPkIPNv/qwheh7DtlrS3wRuARskJrwX6su+hYgk5Lp9pHkZSCff/akkdxLZWnkvHYmB21VnJYPf8YsTs2yKJ5I7O1ZyHmb8QKcUNHoNF95zIyUcfup5ZtdM/+hFo7mcfQEoMO0+92ehD2LZ9FRLwty8YAFlvcSnlkvqpXMJIqlfGpdsiQXIZvW7Ek+eGcBaGcxLzqBn9bELZqbKCaKRVaj9A2QWT8wz1kD8xuIszGFtS0rzbg2eQA/fG/P9HmCETuUJMwj90l7Bv3OD/XPr6IheZJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSlF2YyFKxETHIQUBKkuWZnCTyCCzFyaVOoFbkVxg/0=;
 b=sn6YI1qQzN0Dk3XpIolespgLwwmw2x54HaPI9wM//AKCjE27IzZo7j1517Fbv2ueTy5Y440Hrqk2gNlLEsxHOgV6k6+aDLE66kXUIjJslyfEpf0x5a9Q9GT7nBsvV15LQTBIu3HYQcTaV72bEpqAi2L5pZgaT3nyFu6SR5dAiQ0SgRRLcBkbmcxF9C8nREjz4FcDUJrkA7cAdPh08JtWzqrTU4gaE2tB2Ezp6RWEnfxDtS+TMgzD6B3LNutz9vj3ybFOoYvbE/B6HORMVO78VNWolzZVzwCPFxx/k9ypDqxXMEMun/qtJtrQl2t6+4/jf0xfhOnB11d3qkt461fdsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSlF2YyFKxETHIQUBKkuWZnCTyCCzFyaVOoFbkVxg/0=;
 b=N+IW+OKtVYBNFOtjfgjvXZJGugVCEhtMtTOWouflnRkOmVPZ9DhMz6/I99oYj6PCSpQar/j+8WhFeVBpq4crsiCs/G56WPxjAOSooPU5yowvZY+8srXeDIYZuLgqoLqLXSbzma38wEI+89m6wNtu7BZclQnJgkIjlcgPhF3wkpQ=
Received: from SA1PR03CA0016.namprd03.prod.outlook.com (2603:10b6:806:2d3::18)
 by DM4PR12MB9736.namprd12.prod.outlook.com (2603:10b6:8:225::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 20:52:36 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:806:2d3:cafe::98) by SA1PR03CA0016.outlook.office365.com
 (2603:10b6:806:2d3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Thu,
 29 May 2025 20:52:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 29 May 2025 20:52:34 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 May
 2025 15:52:34 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd, radeon drm-fixes-6.16
Date: Thu, 29 May 2025 16:52:15 -0400
Message-ID: <20250529205215.6790-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|DM4PR12MB9736:EE_
X-MS-Office365-Filtering-Correlation-Id: 30979596-5a0a-4e05-1192-08dd9ef2bd2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+fp6ILVcBUHBfRXc71Z2JKm3GuhVv23PxM2TR/QzNVVOBxj4pk8ZQenwuxQo?=
 =?us-ascii?Q?xpEOIYRpVH2JG9zmYqcBaM0iBdtrX8uZkpnlFbMO3704pdPykPuaZP0cz4qR?=
 =?us-ascii?Q?pxkFpqr4y0LCHnGp+K6e3/6lL2sXsyblP7pBmBUeUNNEu7xsOBkbiFgdxl3P?=
 =?us-ascii?Q?6Drsdx+ueIZKcmUs+HIGwOupIN8t9oGFf2JNPNQLi5yk9nuSvN9mDp54as5j?=
 =?us-ascii?Q?I8YyrynXwUFtRDPpKhRigfSYrQA7DFQnxMJKat7WfD247cChJON+AkkjnRVF?=
 =?us-ascii?Q?wg4hSPwzUJ7PIC/YxwWJr7+kU2a/ugDYIrJxnY9sxres2KIZLkjgaWcGY8ux?=
 =?us-ascii?Q?SgCHMFlpMJCDa50nsOWEO/E52Ua6gVEPO4fo2ul053y/DYMD+I7fBUUn8Yg+?=
 =?us-ascii?Q?9dTrkU6Rw6FYhvkrZcVpzpnhUXGQI6uasReCt3AwXJr6TRfd7wmUmsv0Ay+A?=
 =?us-ascii?Q?XB9tJCzwqAJGMHV27Xk3EPqClUHuzm+j5WLbZClsGmUNRaRISr8zpEgExcuC?=
 =?us-ascii?Q?4ZZm26NelHDdV4RS8g7MgM3xdsgu501TWwyU+FW3XneGtJbkoEdsz24DY4Mg?=
 =?us-ascii?Q?rihVis1ocAa1HgsIekzwK36P79xkSyvLePK7DiVMlvbbaGB/Ce8OszKBw7g/?=
 =?us-ascii?Q?Od9uwLL7i4TnNVPyvwhbAH0EqrhbvkH0HKnbCCNPAvmRVRZwDEFk7X/ETvVN?=
 =?us-ascii?Q?1On0mhSK0L4IsQStrc/StAuaCH77N3YxqWqdaeetVs+zmok+VN0iQ3uiPEJZ?=
 =?us-ascii?Q?a8ZejYmBn6RXpGqEjwjMuo8krskglh45wfY9GTATmOehMsfOxYw4q2MJ618s?=
 =?us-ascii?Q?5PsYiKp2Fv2XxPnZkrLZkCqleAsBeLt89UigKrG2TSfzpx8Wu+iQgqcRWeMp?=
 =?us-ascii?Q?uQSwoVOzhNVgEmHtg8amMzxPX8XwoCNmEVzPx/ANSK3RL2N7WCLOkohVSwQl?=
 =?us-ascii?Q?862rOq9JpQSfqwx8oEjtYP+wI8eqlnUcskqFTAPIvqHX2p67jDV4fE68NEqd?=
 =?us-ascii?Q?6g2Ed8H94vyEujwX/1gkqUDYKJLcmt2BxTZll9EaeD7wDJtijjpUu+rfy1V7?=
 =?us-ascii?Q?i5ze0cnVoZ1taPU3C/rNJjpaQif06fKM2lcQyHdd0iHXIA0X1xyR3vJEdkNI?=
 =?us-ascii?Q?Fu/cM6kTuqOP4FZefF3fCDJTRHUJVyiGCofXUD2u24fpigw6hSgentRbQyJV?=
 =?us-ascii?Q?UX7rxH+xGiEdCbDKRM4K1W8mCK8MkVrirB9m11XrgI6TDhxSLEtp2+b5yDAS?=
 =?us-ascii?Q?kUDzWq3L/jb6sa80KmeFbnuxbSmGI4dCpv8OSzKWL+d8KkBwaEFCYjWhz4a1?=
 =?us-ascii?Q?8If2KeaSZVOMR0rsl0qeERPieRPjyAwMoMw7bcN5ic43gIRyH77QobViPR+0?=
 =?us-ascii?Q?NvuMuuM2GHVpwSPXz+MlwREJqYNxb5EGbCg3kuGAIp+/heLsNRSPoY+mF4Ja?=
 =?us-ascii?Q?QUp6pCFVzPZUT3J1CW4TPfs7xG9gJ+VDF6T0r2DHIXKsrBMwyBkp6g=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 20:52:34.8670 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30979596-5a0a-4e05-1192-08dd9ef2bd2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9736
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

Fixes for 6.16.

The following changes since commit c4f8ac095fc91084108ec21117eb9c1fff64725d:

  Merge tag 'nova-next-v6.16-2025-05-20' of https://gitlab.freedesktop.org/drm/nova into drm-next (2025-05-21 05:49:31 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.16-2025-05-29

for you to fetch changes up to 30837a49bd0aba0f311d4056cd48753955f60d40:

  drm/amdkfd: Map wptr BO to GART unconditionally (2025-05-29 10:58:44 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.16-2025-05-29:

amdgpu:
- UserQ fixes
- SMU 13.x fixes
- VCN fixes
- JPEG fixes
- Misc cleanups
- runtime pm fix
- DCN 4.0.1 fixes
- Misc display fixes
- ISP fix
- VRAM manager fix
- RAS fixes

amdkfd:
- SVM fix
- Misc cleanups
- Ref leak fix
- WPTR BO fix

radeon:
- Misc cleanups

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: Update runtime pm checks
      drm/amdgpu/mes: add missing locking in helper functions
      drm/amdgpu/mes: remove some unused functions

Andrey Vatoropin (1):
      drm/amdkfd: Change svm_range_get_info return type

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Add userq fence support to SDMAv6.0

Asad Kamal (5):
      drm/amd/pm: Update pmfw headers for smu_v_13_0_6
      drm/amd/pm: Fill pldm version for SMU v13.0.6 SOCs
      drm/amd/pm: Optimize get gpu metrics data function
      drm/amd/pm: Enable static metrics table support
      drm/amd/pm: Enable static metrics table support

Aurabindo Pillai (4):
      Revert "drm/amd/display: [FW Promotion] Release 0.1.11.0"
      drm/amd/display: Add some missing register headers for DCN401
      Revert "drm/amd/display: more liberal vmin/vmax update for freesync"
      drm/amd/display: Reuse Subvp debug option for FAMS

Christophe JAILLET (1):
      drm/amd/display: Constify struct timing_generator_funcs

Daniil Ryabov (1):
      drm/amd/display: fix typo in comments

David (Ming Qiang) Wu (9):
      drm/amdgpu/vcn1: read back register after written
      drm/amdgpu/vcn2: read back register after written
      drm/amdgpu/vcn2.5: read back register after written
      drm/amdgpu/vcn3: read back register after written
      drm/amdgpu/vcn4: read back register after written
      drm/amdgpu/vcn4.0.3: read back register after written
      drm/amdgpu/vcn4.0.5: read back register after written
      drm/amdgpu/vcn5: read back register after written
      drm/amdgpu/vcn5.0.1: read back register after written

Fangzhi Zuo (1):
      Revert "drm/amd/display: pause the workload setting in dm"

Jesse.Zhang (1):
      drm/amdgpu: Fix eviction fence worker race during fd close

Jihed Chaibi (2):
      drm/amdgpu: fixing typo in macro name
      drm/radeon: fixing typo in macro name

John Olender (1):
      drm/amdgpu: amdgpu_vram_mgr_new(): Clamp lpfn to total vram

Lang Yu (1):
      drm/amdkfd: Map wptr BO to GART unconditionally

Leonardo Gomes (2):
      drm/amd/display: Adjust get_value function with prefix to help in ftrace
      drm/amd/display: Adjust set_value function with prefix to help in ftrace

Lijo Lazar (6):
      drm/amd/pm: Use macro to initialize metrics table
      drm/amd/pm: Add support to query partition metrics
      drm/amdgpu: Add sysfs nodes for partition
      drm/amd/pm: Fetch partition metrics on SMUv13.0.6
      drm/amd/pm: Use external link order for xgmi data
      drm/amd/pm: Fetch partition metrics on SMUv13.0.12

Mangesh Gadre (5):
      drm/amdgpu: Add vcn poison status reg
      drm/amdgpu: Enable RAS for vcn 5.0.1
      drm/amdgpu: Add jpeg poison status reg
      drm/amdgpu: Enable RAS for jpeg 5.0.1
      drm/amdgpu: update ras support check

Mario Limonciello (2):
      Revert "drm/amd: Keep display off while going into S4"
      drm/amd: Export DMCUB version to sysfs

Melissa Wen (2):
      drm/amd/display: only collect data if debug gamut_remap is available
      drm/amd/display: no 3D and blnd LUT as DPP color caps for DCN401

Philip Yang (1):
      drm/amdgpu: seq64 memory unmap uses uninterruptible lock

Pratap Nirujogi (1):
      drm/amd/amdgpu: Add GPIO resources required for amdisp

Prike Liang (1):
      drm/amdgpu: lock the eviction fence for wq signals it

Stanley.Yang (2):
      drm/amdgpu: Register aqua vanjaram vcn poison irq
      drm/amdgpu: Register aqua vanjaram jpeg poison irq

Sunday Clement (1):
      drm/amdkfd: Identical code for different branches

Tvrtko Ursulin (2):
      drm/amdgpu: Make amdgpu_ctx_mgr_entity_fini static
      drm/amdgpu: Remove duplicated "context still alive" check

Wayne Lin (1):
      drm/amd/display: Add a new dcdebugmask to allow skip detection LT

Wentao Liang (1):
      drm/amd/display: Add null pointer check for get_first_active_display()

Yifan Zhang (1):
      amd/amdkfd: fix a kfd_process ref leak

ganglxie (2):
      drm/amdgpu: handle old RAS eeprom data in non-nps1 mode
      drm/amdgpu: Get mca address for old eeprom records

 drivers/gpu/drm/amd/amdgpu/Kconfig                 |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c           |  32 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   5 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  75 ++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  28 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c          |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |  23 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            | 146 ++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.h            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |  17 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c            |  31 ++++
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |  76 +++++++++
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h           |   7 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c           | 182 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.h           |  10 ++
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  55 +++++--
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |  21 +++
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |  21 +++
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  19 +++
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  20 +++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  20 +++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  81 +++++++++
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.h            |   6 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |  10 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |  20 +++
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            | 180 +++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.h            |   7 +
 drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c   |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   1 +
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |  23 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   9 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |  11 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  28 ++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  11 +-
 drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c  |   4 +-
 drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c       |   8 +-
 .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  26 ++-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |  24 ++-
 .../gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c |   2 +-
 .../drm/amd/display/dc/optc/dcn201/dcn201_optc.c   |   2 +-
 .../gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c |   2 +-
 .../drm/amd/display/dc/optc/dcn301/dcn301_optc.c   |   2 +-
 .../gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c |   2 +-
 .../drm/amd/display/dc/optc/dcn314/dcn314_optc.c   |   2 +-
 .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |   2 +-
 .../gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c |   2 +-
 .../drm/amd/display/dc/optc/dcn401/dcn401_optc.c   |   2 +-
 .../display/dc/resource/dcn401/dcn401_resource.c   |   4 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  34 +---
 .../amd/display/include/grph_object_ctrl_defs.h    |   2 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |   3 +
 drivers/gpu/drm/amd/include/amd_shared.h           |  10 +-
 .../amd/include/asic_reg/dcn/dcn_4_1_0_offset.h    |  26 +++
 .../amd/include/asic_reg/dcn/dcn_4_1_0_sh_mask.h   |  16 ++
 .../amd/include/asic_reg/vcn/vcn_5_0_0_offset.h    |   6 +
 .../amd/include/asic_reg/vcn/vcn_5_0_0_sh_mask.h   |  16 ++
 drivers/gpu/drm/amd/include/atombios.h             |   4 +-
 drivers/gpu/drm/amd/include/atomfirmware.h         |   2 +-
 .../amd/include/ivsrcid/gfx/irqsrcs_gfx_11_0_0.h   |   1 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |  24 +++
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  32 ++++
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |   2 +
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         |   2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c    |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  14 ++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |   6 +
 .../amd/pm/swsmu/inc/pmfw_if/smu_v13_0_6_pmfw.h    |   4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_12_ppt.c  |  71 +++++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 158 +++++++++++++++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h   |   6 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  67 --------
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |  26 ++-
 drivers/gpu/drm/radeon/atombios.h                  |   2 +-
 drivers/gpu/drm/radeon/kv_dpm.c                    |   2 +-
 88 files changed, 1533 insertions(+), 347 deletions(-)
