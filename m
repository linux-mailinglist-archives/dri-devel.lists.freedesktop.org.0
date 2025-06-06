Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B69ACFB02
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 03:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A65410E8F2;
	Fri,  6 Jun 2025 01:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PSLJJrGg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C0210E392;
 Fri,  6 Jun 2025 01:59:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ummpyv+y8qO9eVhbNlDvgEmJdvObH2/SvHMXFL0APjn30MEtsKgOhbF9oy5jdSxmj9Ik1MhO5SHeoagul/MJkudOS1SGb72IRSCHpHGCCBGhoTxAF79Y1mfMZBeExYFMZEcTBYuay4Jy8wj+cVpYJL+nxNI7GYQc+ezuHautpPiqtj+TnH8M582UUfeLK38y5ORAFWqE4JnmlOkjX+Eo4s0X0HwpEmCOKIwaUtCFHn2cv34Ys8h8Pw7jaC265RRWwoo/Tnc5Uwha/h3O3/uZQRvclSS2LdH2qaQPo/Kw7cNGviLWNuxQZMAGHq4bOfHnh6pTHdAeMyMWGQJUb4AEYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3N2HmrxsT3aP9RKSfYwy8ZcYGm5dMPvpwsWZKyimDI=;
 b=xjcVxjBonEIEXDNOULBZfCcPdPyVXpiAp5wD/nmivcYgEbA/a/yHrEBQQMnuEALHbxHeWT9E6/RGGckLIMOeq8KsSlc6LbmuAfH+wAPBmptLcG0aZNLI88OOUsF/96H0yKmjGBNOi0/G7wgCWaMTI3pTUTki7X9oLMTujDPoZG06KeYS7lvSW8z0PH93JGC/XiIJ9BOXKhgiOb1KQGBIE3xBITSQttGUFzt2kCsdw31ocvq1XSxVdeIsgqtbWYqwVbvRkeMZQCiWDqpkt2d0SWWdPSs0Swwy/Jek42FdtejbGb+JC5FcNWYGBCrhPuOOK1RzMwXR4QAsRXf10WHiFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3N2HmrxsT3aP9RKSfYwy8ZcYGm5dMPvpwsWZKyimDI=;
 b=PSLJJrGggtSz1vUSXK7r8NGHAYsIM92EtrmcUBt1sKCc9+ZCw45UiJdnSskgVj8UnEnTMSOwRY4wXIJnG8QqpDKGz3boipez6YEsZzIoOJ0xk5gYd0RwIZA0JB8w2Q4KfaLlNtOVlnsEyqnR92q57okROWY4nEIvf7uZZXpM8KU=
Received: from SJ0PR03CA0063.namprd03.prod.outlook.com (2603:10b6:a03:331::8)
 by DS2PR12MB9775.namprd12.prod.outlook.com (2603:10b6:8:2bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Fri, 6 Jun
 2025 01:59:47 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::1e) by SJ0PR03CA0063.outlook.office365.com
 (2603:10b6:a03:331::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Fri,
 6 Jun 2025 01:59:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 01:59:47 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 20:59:45 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.16
Date: Thu, 5 Jun 2025 21:59:32 -0400
Message-ID: <20250606015932.835829-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|DS2PR12MB9775:EE_
X-MS-Office365-Filtering-Correlation-Id: 88bcba52-c188-4b6a-0d99-08dda49dd090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IXeExFRzEooAcU7yfAir614BIfwe6enxCZXmsAfzoUpeHNMoF/Y+2N+Puw8K?=
 =?us-ascii?Q?vGEoRLD4Q94/TIuRvqDiKhkkGDFVl+m5mZkJ4PVa/JwvZZ3JspFDr4Rz4MkQ?=
 =?us-ascii?Q?wAXfvTsOTgemkqBYORv1H8ePhc4w7uiT4fa9cryasmN+beHQfhybn00KpU3d?=
 =?us-ascii?Q?K8KrtNPBO8lwLCWwQQAZs9Y3reHtSkNvUMv4deT2xx0ta3Db5kl3H4YHpz9L?=
 =?us-ascii?Q?ssOKKl01QTvkVMe5MmOrl8Og/ITMEv1SJRHuTaL0/iemWtFXwF++STSO5GKb?=
 =?us-ascii?Q?rN1SIPMIrArdsuRv0uAmx+0XU53S8Gpz7PZ2CtwhnPi3Hr+3aKmnKn/2CWRZ?=
 =?us-ascii?Q?LGVypFk8faIxatDHqVhZQd+nnVPcm810+Q1z1TLZIy+VsQRnbeasJJzuztHu?=
 =?us-ascii?Q?GnPeYi5Exq35ISbKQy9uR65HyckXh1/Ltj45V8uRYKZaPIyatqwFpWxL0Tu/?=
 =?us-ascii?Q?fjmy02FaQmTQJEabUR9AVSTqYs1z3Rqk/9K0kzu7MhpEvF/7u5J2bJpzMTCP?=
 =?us-ascii?Q?7xY17174SRP7/sTKsCDrQl8oS8397le7g4Cwgim1KzCn3aQm3oezm1jkli4I?=
 =?us-ascii?Q?tTufNF33FX1ak2EmtFzXgiG16WPwutWktIejpoEhQm1UuXiPhdkWTl8kaqYC?=
 =?us-ascii?Q?V/+uTHjWzqnZPcsMFZvPERuLKsbPlFo0VPyiJ3bIEjkVpTohUdN959/lskOo?=
 =?us-ascii?Q?cPnZTblfX1FbWC7KmKYuAAmifbVXzh+SEHiRmctV2MdqVAcw4dSq3wf8HW/R?=
 =?us-ascii?Q?dhxIL5COD7ApQBYuc1MXvIb7iLfb+abYSWNGWX50Blw7e67JvTiw3GUuj7th?=
 =?us-ascii?Q?nG1q6WQZtKSmk5357A/Qv74iXNg6uZmOna+2XB3+aTl7hMwbMm/ClKyC0QT0?=
 =?us-ascii?Q?sf4Jr0AP/yossd8N1qN3p8XwcXEWSh79fDIXceG28wS6rjSYZLLcQ35gW7Gc?=
 =?us-ascii?Q?rtjteFM6E2P4FEig66FEMVGn8jKw+zW5pAEYvSRwRrJXYIVbntvo8fJH3hQv?=
 =?us-ascii?Q?raPnbg7xhpaog5olbQ25cWSvUmwuYgvbFmyzNUN7BA4BmdDBFz5nyWc5q4g7?=
 =?us-ascii?Q?5iKOqr3iNUMzj/oe9irm4kRHdN0xB+N10td4WMCEdE66C+HP4d44rV+DPRf2?=
 =?us-ascii?Q?nGYM0gMWC31h4NWbgkjqvL26Q+Liaktyzz+VbaP7f9zSRIj/qYKBvh4VWo81?=
 =?us-ascii?Q?fvL87jAIuJp5IPhzEoIe+StE/N0tD26wtXoEStAlxoBxvb2PUVuhD1yL7I+n?=
 =?us-ascii?Q?jkFtMcsrtwD4PIxtCoL/Pqk74yB33MlaOIRCAiAGtEA2GNrjn81IKHKlPMtW?=
 =?us-ascii?Q?zBr3nW9HI28zVG1syTJlrArjbPFw49cUSoFa3ijOxaycoAOP6Pw2KHUkiB3w?=
 =?us-ascii?Q?+KYRXw2p+df+Zn6UIanZKnaK9V3l364Rfq1A36ou/fwG5d8030MCt/Iwtt5o?=
 =?us-ascii?Q?7HiWmkl2efARW/eP3FV7xYAAtE8Rrt9GmzRnBnMXZjaHnxxwlnJw8A=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 01:59:47.1132 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88bcba52-c188-4b6a-0d99-08dda49dd090
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9775
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

The following changes since commit 1c1df79ccf5615a007cb11ff30e997e58a9fa79a:

  Merge tag 'amd-drm-fixes-6.16-2025-05-29' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-06-02 11:56:06 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.16-2025-06-05

for you to fetch changes up to 8b5f3a229a70d242322b78c8e13744ca00212def:

  drm/amd/display: Fix default DC and AC levels (2025-06-03 15:33:38 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.16-2025-06-05:

amdgpu:
- IP discovery fix
- Cleaner shader fix for GC 10.1.x
- OD fix
- UserQ fixes
- Non-OLED panel fix
- Misc display fixes
- Brightness fixes

amdkfd:
- Enable CONFIG_HSA_AMD on RISCV

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu: disable workload profile switching when OD is enabled

Arunpravin Paneer Selvam (1):
      drm/amdgpu: Add userq fence support to SDMAv7.0

Cruise Hung (1):
      drm/amd/display: Use DC log instead of using DM error msg

Dan Carpenter (2):
      drm/amdgpu: Fix integer overflow issues in amdgpu_userq_fence.c
      drm/amdgpu: Fix integer overflow in amdgpu_gem_add_input_fence()

Lijo Lazar (1):
      drm/amdgpu: Add more checks to discovery fetch

Mario Limonciello (2):
      drm/amd/display: Add debugging message for brightness caps
      drm/amd/display: Fix default DC and AC levels

Vitaly Prosyak (1):
      drm/amdgpu/gfx10: Refine Cleaner Shader for GFX10.1.10

Xuemei Liu (1):
      drm/amdkfd: enable kfd on RISCV systems

Zhongwei Zhang (2):
      drm/amd/display: Correct non-OLED pre_T11_delay.
      drm/amd/display: Avoid calling blank_stream() twice

 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      | 16 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  8 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c    |  8 +--
 .../gpu/drm/amd/amdgpu/gfx_v10_0_cleaner_shader.h  |  6 +-
 .../drm/amd/amdgpu/gfx_v10_1_10_cleaner_shader.asm | 13 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             | 10 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             | 59 +++++++++++------
 drivers/gpu/drm/amd/amdkfd/Kconfig                 |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 11 +++-
 .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  | 10 ++-
 .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    | 11 +++-
 .../drm/amd/display/dc/hwss/hw_sequencer_private.h |  1 +
 .../display/dc/link/protocols/link_dp_capability.c |  2 +-
 .../amd/include/ivsrcid/gfx/irqsrcs_gfx_12_0_0.h   | 74 ++++++++++++++++++++++
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                | 22 +++++++
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |  1 +
 17 files changed, 205 insertions(+), 51 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/include/ivsrcid/gfx/irqsrcs_gfx_12_0_0.h
