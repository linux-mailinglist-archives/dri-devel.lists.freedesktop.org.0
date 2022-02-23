Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F514C1DE8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 22:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DF410EF30;
	Wed, 23 Feb 2022 21:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B47110EEC7;
 Wed, 23 Feb 2022 21:46:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuk5e3aD1Br1Q3rtURplo8waocQ6TxjLJE5bDlbY+AhxEUIl7z2KRBSL4/hSRfYg3iJCvpyO9e0zFceTOtedDnc+51/+NM6Y76f+CEOi6uQNvFLNOFlbHVDEKCfh+syFNPUvgqyHi9ne6/3Kv/+tYHH2OIamevm2DJDVfOCjZp+27+uuMtbDAYlkgaLCVSga5RkKKu3YTLHMgZbYkIxvj78XPk1SJuKIRfUQMMRDF/vLOzNUGthcrGTzCYh+3cxBW1iNZfa+W2XyGtLV7EfWFGYHZewMM4kbqFoexp9W0iFC32bppNvLnUtS74n/IUOcGWWVnwCJmb/064E/VEVJSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6c4XiGtuh7S51aUXxeMZoUf5dVsKwAI3NttrksTEp2c=;
 b=gXKLpUoAetWg1zrEjdH8+fSn0y2U1pOkeLKzDWZMtbQoNzS122q55Vbejs8cboTCtG3fv8bInCuUlRLRKkJyT4+WSobGY1rvsx3WMAbD0sXnVtudoyH2BHYKqhrp336YBViao8wyUCxRuq1ytTSC+6WBa8Mp/2ax+Z5G8vu81Klf2n1cKYF38OGEt9txD/b0up4ai5x5OQlhSj9QftlA8pa4PNadTWCP6GmCfqHp2Ntnb6tQg/vwO95W8cb2o5CU1r2LcYzBOizq9il3UmQdb0N9CL5TQnlKRpv6Sydh81tpzZx4d/CTlyFSEaSgB3Yfl7Bg4ARJYtkPMNPRXmR4DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6c4XiGtuh7S51aUXxeMZoUf5dVsKwAI3NttrksTEp2c=;
 b=0kZe6kXl7PBbDnVHcheUsfvwMDqfNv9/LCPBFa3U17DF4FrwevpPOMDNxugwCxrXNas9tCDz6ImXSfFukg6xY839XnCyOxuM9cA7C62xIM2lFWCT3foOaarjD1+gyVGj4pkyLeyuYqFweR4dw/R3lWtozXqZnUm3zTSpQ+W6f/4=
Received: from BN6PR22CA0064.namprd22.prod.outlook.com (2603:10b6:404:ca::26)
 by MWHPR12MB1933.namprd12.prod.outlook.com (2603:10b6:300:10b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Wed, 23 Feb
 2022 21:46:46 +0000
Received: from BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:ca:cafe::8f) by BN6PR22CA0064.outlook.office365.com
 (2603:10b6:404:ca::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19 via Frontend
 Transport; Wed, 23 Feb 2022 21:46:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT040.mail.protection.outlook.com (10.13.177.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Wed, 23 Feb 2022 21:46:45 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 23 Feb
 2022 15:46:44 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-5.17
Date: Wed, 23 Feb 2022 16:46:23 -0500
Message-ID: <20220223214623.28823-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25763d46-6b1a-4411-058c-08d9f715fcc8
X-MS-TrafficTypeDiagnostic: MWHPR12MB1933:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1933A9017230C666D2170AC9F73C9@MWHPR12MB1933.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l2Y9MsYugllBX3lqM8QA6sUNWF7tOncX5/q4erbO/AmdyDr91rN68ILt77KDV8wLAkSL1RBeuiM4hUR1lFoJP1ezCNzEcoaOv4+s+MynmDbld//02VBwtStNT2hsW1NyWIkUCD60qOaecrHX+PNOHDpKGvCWRcbJ7h/CHHYZBZBF27iqmW3Z/TpJjc1rwltVRj5jZTz3SF4MgMeeItLGrDFZ6NvMDkw5trIGQlLEfBn381UqFljzKFxhORoOLZ7i/Zx6kgNwtR7HRoX3FeHjassLbXlfFTHOkK2qRm79eLDmXmkQ2gTgm4OfTuj9mRtIoixe8uL6iS2suhvCGUNY6h8RxaB5ogIHF3rTGHeuDqxXYNlYM193oxgnP78pQrnlJaIRn7a4gQNvDREW9JlS5Xigh+viAZFQeOdmAVJT+sHgtF1+fms0w7ojvpEgMu3AqfMNp8AJJjBLzupjiWsJ0lvDE2Jp5A1set2GwqJs5OR8tAH+Ofw2GZqPBpwsl0/tqxspxxg9A+gOfcQ/AwiKcKVWOnNIBFO3xnMrYpQzug6Flw0FcYVnEKIae39MD5IZ4zBTfd3sGhTukAvfg1B7J1d+2vL7b3/qLIyRpPKU15elMxKOXgA0/tNTAVJ/wbfbhr00tqfoOGHj3VBCrndHfoIQdxRuaPWpxQwxeXWgVIwQ5WmTbY9Zn7mjGruO4Zz2D0CNnCSF7q7htjPBb7BDLA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(1076003)(36756003)(186003)(508600001)(70586007)(86362001)(82310400004)(8936002)(2616005)(16526019)(8676002)(6666004)(426003)(2906002)(26005)(4326008)(966005)(7696005)(356005)(5660300002)(336012)(81166007)(70206006)(83380400001)(40460700003)(47076005)(66574015)(36860700001)(316002)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 21:46:45.6195 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25763d46-6b1a-4411-058c-08d9f715fcc8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1933
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

Fixes for 5.17.

The following changes since commit cfb92440ee71adcc2105b0890bb01ac3cddb8507:

  Linux 5.17-rc5 (2022-02-20 13:07:20 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.17-2022-02-23

for you to fetch changes up to c1a66c3bc425ff93774fb2f6eefa67b83170dd7e:

  drm/amdgpu: check vm ready by amdgpu_vm->evicting flag (2022-02-23 16:31:06 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.17-2022-02-23:

amdgpu:
- Display FP fix
- PCO powergating fix
- RDNA2 OEM SKU stability fixes
- Display PSR fix
- PCI ASPM fix
- Display link encoder fix for TEST_COMMIT
- Raven2 suspend/resume fix
- Fix a regression in virtual display support
- GPUVM eviction fix

----------------------------------------------------------------
Bas Nieuwenhuizen (1):
      drm/amd/display: Protect update_bw_bounding_box FPU code.

Chen Gong (1):
      drm/amdgpu: do not enable asic reset for raven2

Evan Quan (2):
      drm/amdgpu: disable MMHUB PG for Picasso
      drm/amd/pm: fix some OEM SKU specific stability issues

Guchun Chen (2):
      Revert "drm/amdgpu: add modifiers in amdgpu_vkms_plane_init()"
      drm/amdgpu: bypass tiling flag check in virtual display case (v2)

Mario Limonciello (1):
      drm/amd: Check if ASPM is enabled from PCIe subsystem

Michel Dänzer (1):
      drm/amd/display: For vblank_disable_immediate, check PSR is really used

Nicholas Kazlauskas (1):
      drm/amd/display: Fix stream->link_enc unassigned during stream removal

Qiang Yu (1):
      drm/amdgpu: check vm ready by amdgpu_vm->evicting flag

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |  9 ++++--
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |  9 ++++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 17 ++++++------
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |  2 ++
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  7 +++--
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  4 ---
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 32 +++++++++++++++++++++-
 10 files changed, 65 insertions(+), 23 deletions(-)
