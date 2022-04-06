Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749AD4F661E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 19:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E04010E04A;
	Wed,  6 Apr 2022 17:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552AC10E04A;
 Wed,  6 Apr 2022 17:05:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmkAXS3uN66wMlMA7R/InSy0EPjjr0I6xOpVoWDH920FBiHGIHzS3dM0wpQIDuQ/uBekOSaAjB7TdYEm27O0S02hNoBI91iUYFGdvLjSDmWw4ECfdsdOHwQyCCX47l3FloncBbD37jbwss7mDBvkDQxBeDUpzv1MQ02aCFRXFgUjmquy02dfZbUUB1u/3wioSWW+rjt+lH1LofvPzmt9AtcHFX7aZBvo6IIWnPeE70vINtE4RxVMXy0sv2r1dBZRbESj69RXRHpDLRNB7kjo2WAgnNV/628OhiaoDex5n++d+PhVRcYBygavd6JYfJAns6fEnxxVJPJcU0hNMCTH3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SC/eUTJ6eb/w9klTDKi5+Q7IZa4iWchIkpkR4CndS/8=;
 b=W/9bAvSp8Bqi+tFjvP7nTa0tnKC9g9aq/nRwRZhe4YylsREji+x/TgBLm0XDnUThYscqDaPb2wxK0yxkbENbwWW+lY3iZX4cn/1Qqasovf791DFFjFfjSjBruMNmYI+q+90lEByXmNlSmWFq55sWcYHV2yzNBYYDHrfgRPFYNzMmqPdfLblA9UVyz5uzlWiGwsj/VloDCi31UpHGTW/XuAtnBzP4iszutBXk1STKPq/qoixa8L9nUlNeMHef2NXcY+8Q9dXxC1VIp2n1gMtRlwLM9U8VPEjra+2EXheUxxI/C5QTk9vrJ45q/5wa5VNmiIDQagsamcZ4hpb6u5sa3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SC/eUTJ6eb/w9klTDKi5+Q7IZa4iWchIkpkR4CndS/8=;
 b=xcnw6VJ2XmyKA4AiLoILPOjtelRI1foGrA0MZ89q6SK8Aq3K9VW9XdzdABG8cyKMisF/cP8F1Lp7Zku0B9ezPF+PY3zwN4T9V6sZuOCfJ03rzmFMBXkCDujGF7T+ZCAjmtzo+02Lu5KNhfwwyJYhy15LEZjdkdayasyU0Cs24Lk=
Received: from DM6PR02CA0147.namprd02.prod.outlook.com (2603:10b6:5:332::14)
 by DM5PR1201MB2553.namprd12.prod.outlook.com (2603:10b6:3:eb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 17:04:57 +0000
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::e0) by DM6PR02CA0147.outlook.office365.com
 (2603:10b6:5:332::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31 via Frontend
 Transport; Wed, 6 Apr 2022 17:04:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.20 via Frontend Transport; Wed, 6 Apr 2022 17:04:57 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 6 Apr
 2022 12:04:56 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-5.18
Date: Wed, 6 Apr 2022 13:04:41 -0400
Message-ID: <20220406170441.5779-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7c5048b-111e-4faf-62a9-08da17ef942c
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2553:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB25535EE328D3E09B92B961B5F7E79@DM5PR1201MB2553.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Okd+GK5PFvB2aexOPnUGhXMblvtlKWE0aifARP3hRn68BSH3Hp8iDVBPcboJper6wO1GFtkjlvIiUZEn6N/8ThXelqNG3DjLRnYHfutEgteKEQlr0MD0gTak4MR3uHb3HpwU4EYG1i4LE1pow8+sEzMOVRMp3+4TQ5pntafhVYJPDeqcd58ENF114JbBhV2Zz/X/N8lvUK3MCwVpsd55MVBHHE2EW4B0P5rGiwlUPIrTHF7ZvV+nEzxZ1P7foulA/3QzaQEzkdrjjBbT36g2UKh9OHL9O4RP24rld0/xLErvBmVzEk8RK0DZazyEn4kAPDk35MvB6RcDswnVeZG4NKwpEjtdSSdAYlM7zLwUDHhwzHSWCsVEDSNCSk0Sb9LyWKpwBvvfuK9XRoDB5zCYEsG4AjErf5mksX38cCIPgfkXxENTtKr6REGCvVY8ll6WgX/hOEBKXCDORYEFdW5/bbVA4blNXE7gtdsMQxAGuqtshCHJs2ryVSTgCziNmoZ10j5EzYoS7Z6KyBr8us4jxzzS0Z3dupS8Y9lhxZoJVKEd466jx7s6zAL/jWpj1gh5cmAO6jQNzSMmHunSaC93hS/Qw99MxPP5C/CqmYUVO7wn9cm5mhHmRyXTmF1VU8ZLZ9ZCrBjRxk+ahr6S94f/TRUbdfx4AYQlMepWb6/QnjcRTTT0KltZwbIOMntRlS3koIGvJGlDt4ZZh8tdlefsYQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(7696005)(82310400005)(5660300002)(8936002)(336012)(36860700001)(47076005)(356005)(86362001)(83380400001)(966005)(81166007)(508600001)(426003)(36756003)(40460700003)(2616005)(26005)(70206006)(186003)(70586007)(1076003)(316002)(2906002)(16526019)(6666004)(8676002)(110136005)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 17:04:57.5655 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c5048b-111e-4faf-62a9-08da17ef942c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2553
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 5.18.

The following changes since commit 15f9cd4334c83716fa32647652a609e3ba6c998d:

  drm/amdgpu/gfx10: enable gfx1037 clock counter retrieval function (2022-03-25 12:40:25 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.18-2022-04-06

for you to fetch changes up to 2f25d8ce09b7ba5d769c132ba3d4eb84a941d2cb:

  drm/amdgpu/smu10: fix SoC/fclk units in auto mode (2022-04-06 12:02:57 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.18-2022-04-06:

amdgpu:
- VCN 3.0 fixes
- DCN 3.1.5 fix
- Misc display fixes
- GC 10.3 golden register fix
- Suspend fix
- SMU 10 fix

amdkfd:
- Event fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: don't use BACO for reset in S3
      drm/amdgpu/smu10: fix SoC/fclk units in auto mode

Benjamin Marty (1):
      drm/amdgpu/display: change pipe policy for DCN 2.1

Boyuan Zhang (1):
      drm/amdgpu/vcn3: send smu interface type

CHANDAN VURDIGERE NATARAJ (1):
      drm/amd/display: Fix by adding FPU protection for dcn30_internal_validate_bw

Charlene Liu (1):
      drm/amd/display: Clear optc false state when disable otg

Chris Park (1):
      drm/amd/display: Correct Slice reset calculation

Dmytro Laktyushkin (1):
      drm/amd/display: update dcn315 clock table read

Eric Bernstein (1):
      drm/amd/display: remove assert for odm transition case

Jimmy Kizito (2):
      drm/amd/display: Add work around for AUX failure on wake.
      drm/amd/display: Add configuration options for AUX wake work around.

Lee Jones (1):
      drm/amdkfd: Create file descriptor after client is added to smi_clients list

Ma Jun (1):
      drm/amdgpu: Sync up header and implementation to use the same parameter names

Martin Leung (1):
      drm/amd/display: Revert FEC check in validation

Roman Li (3):
      drm/amd/display: Remove redundant dsc power gating from init_hw
      drm/amd/display: Enable power gating before init_pipes
      drm/amd/display: Fix allocate_mst_payload assert on resume

Ruili Ji (1):
      drm/amdgpu: fix incorrect GCR_GENERAL_CNTL address

Shirish S (1):
      amd/display: set backlight only if required

tiancyin (1):
      drm/amd/vcn: fix an error msg on vcn 3.0

 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   7 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   6 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |  24 +++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  10 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   6 ++
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c | 107 +++++++++++++--------
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   4 -
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  65 +++++++++++++
 drivers/gpu/drm/amd/display/dc/dc.h                |  17 ++++
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  12 +--
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   1 -
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   5 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |  19 ++--
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c  |   5 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   2 +
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |   4 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |   1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |  11 +++
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |   8 +-
 22 files changed, 235 insertions(+), 92 deletions(-)
