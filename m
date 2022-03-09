Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95024D3D44
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 23:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB40B10E51F;
	Wed,  9 Mar 2022 22:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BB610E51F;
 Wed,  9 Mar 2022 22:44:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xk82bnYRPg4gi7APuDIEmC86PK4OI+LNeUh5Z9kpMXisFJLZ7MRpnNnD7X8+Nw5BhjkUHz6OoA1vbqIADNUsjEYJclcofGw1TekYq+fOZ5H5fl41/F78HFF/5ELrMensz2fjJgmg/XdI7V12N3KKxVCtboa5a0zU0AM1aF3LO0CXdAEB9y8STodkObgNu1dC1MwQjPeNT70yw9QIWWw9QE8fKyY0mrPhFFiU5RxJ+b9nrmoYoPVN/x1VI4YrU5ASTfb52hKpa6rkD1SayxN9xodOVTTek9ad8fQ7IcKVjtX5yJin2ESgqWvGMHhSU7KcYVD5OQwUmcAJngxgL0xDjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMI511fC4o9ywORdhadw5c/eBJdAO2RZWRRP/RcLYvo=;
 b=jxqI8j1ok7ZPOXNab7fLN2sIk5uaUQweH/IBnkViuPf0rR508K4axUpnSojbZ3PBKJwAb6gWZ+oaHMEq/f9zXXYdswEXXtSD4EyVP6/lbzTNwUBCIOrEb2lhLOEe46xEJrWQnH/TuERrT28jReAwpsMnPQ4b/BRStxGUtqsUbvCqE2s8CsJggYm2fQfD3xnQ8UyWTXzc05b2FzoQVN9SjKGfiMC8Mee8v8hA4k5z5y7/coUF9QDsMDZSCh/p068vTZBn2dHpuvu/nSpJSTbVqvRqIxUcXHSaU3LCiiDoRm0r9Mjio/ANa2ewaoMqZ2CnnBZVD5SZSqcQU6XsjpApBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMI511fC4o9ywORdhadw5c/eBJdAO2RZWRRP/RcLYvo=;
 b=S5QHbfwmHNWIKUfFfK7WfiB/PdjJjtuobX9qOxHxVea/MXnRRED95pmMrYHBVQlprpAgxKk6jen81Ha6bRfxPP8aAm8uq2eKr0zRMejVhPKWvFom2OvWS46hw8gqFJNfcI9b6oCJ7jinHfaRIm7CYa6GKd3pmezrTaUS3f1antg=
Received: from BN6PR14CA0013.namprd14.prod.outlook.com (2603:10b6:404:79::23)
 by DM5PR12MB1658.namprd12.prod.outlook.com (2603:10b6:4:5::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.17; Wed, 9 Mar 2022 22:44:55 +0000
Received: from BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:79:cafe::ce) by BN6PR14CA0013.outlook.office365.com
 (2603:10b6:404:79::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.20 via Frontend
 Transport; Wed, 9 Mar 2022 22:44:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT062.mail.protection.outlook.com (10.13.177.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Wed, 9 Mar 2022 22:44:55 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 9 Mar
 2022 16:44:53 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-next-5.18
Date: Wed, 9 Mar 2022 17:44:39 -0500
Message-ID: <20220309224439.2178877-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 090026df-967b-4b5b-506b-08da021e6e79
X-MS-TrafficTypeDiagnostic: DM5PR12MB1658:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1658CEF0EFB66328F2E6D965F70A9@DM5PR12MB1658.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pedtf75uoCPnK6pFXX94xCkGz9cVg2EeyLUmKdvH60V3bRTYU3vEOV8mZey7WCgRGJp8A0n5EsCMu1515E5N9Bmc6oBP2M1kwxSgmhHIGnpuUnFprUAjDKjJHqckWfrAOiA3RsC0Ooi2X6BcqQFeyyyHV27CQGdUgkFBPSvoqZUnCdaKes2H4BNKYu+VYnuDdyXrU8SigKRgg5jfbuCWtFgYRgCh4D+RjSg+X6DH+qVuB/phBqyCfVnpqfdBqvO0T4R9G+9Uj6DsVnF2nZialYi1GDPWGLrbgGa8GZPWQR5W0mY0ukTs17qxWtBfZuQi/dAwQXlAEX8ttFPXCY7qMDILKVivQJxYBIpPPPlusPiUhLdvJwMw9nDgqvmDGIPAYZKZDOcvrlWkPDJ9ONuKw0UvqCZLMrw2+hdCsos/NHQkPjnZ9ngOZm3SvxwVcUVsN/+CpYwoQ0YcjzcEzpetbpJB/butqcxa7nMSKOCX06sYlw8j7Wb8GlYSERoWo+rmCDdMExdxEWacov7GsrQe4Tj6fcY/R7CRggtSKE5PUUeabXdQfZk6DXLp2A6A3IVxjJyCTBQC1mARRLFWSz+DEQ6teV446nSR9mDRnN9GuDOrFDok0EEhZyo5g1E5av1kzTWNp7YW8ne75qyhLSCpj1TyYJVrc7HHQCwCbpTqZkn/p1v/g7UeBfMS2wW8tFSsGzOtZfZWEToFZu3k0ajY2QaCxh4DLKWSMDEj7c1g3tg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36860700001)(508600001)(83380400001)(86362001)(82310400004)(81166007)(4326008)(356005)(8676002)(316002)(70586007)(70206006)(8936002)(5660300002)(40460700003)(966005)(110136005)(7696005)(36756003)(6666004)(66574015)(47076005)(336012)(426003)(16526019)(186003)(26005)(2616005)(2906002)(1076003)(21314003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 22:44:55.0815 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 090026df-967b-4b5b-506b-08da021e6e79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1658
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

Same PR from last week with fixed Fixes tag, clang warning fix, and
a CS rework regression fix.

The following changes since commit 38a15ad9488e21cad8f42d3befca20f91e5b2874:

  Merge tag 'amd-drm-next-5.18-2022-02-25' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2022-03-01 16:19:02 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.18-2022-03-09

for you to fetch changes up to 96a2f0f2c8006d338a9647e068a15c6eb299f864:

  drm/amdgpu: fix a wrong ib reference (2022-03-09 17:28:37 -0500)

----------------------------------------------------------------
amd-drm-next-5.18-2022-03-09:

amdgpu:
- Misc code cleanups
- Misc display fixes
- PSR display fixes
- More RAS cleanup
- Hotplug fix
- Bump minor version for hotplug tests
- SR-IOV fixes
- GC 10.3.7 updates
- Remove some firmwares which are no longer used
- Mode2 reset refactor
- Aldebaran fixes
- Add VCN fwlog feature for VCN debugging
- CS code cleanup
- Fix clang warning
- Fix CS clean up rebase breakage

amdkfd:
- SVM fixes
- SMI event fixes and cleanups
- vmid_pasid mapping fix for gfx10.3

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: Use IP versions in convert_tiling_flags_to_modifier()
      drm/amdgpu: remove unused gpu_info firmwares
      drm/amdgpu/gfx10: drop unused cyan skillfish firmware
      drm/amdgpu/sdma5: drop unused cyan skillfish firmware

Andrey Grodzovsky (2):
      drm/amdgpu: Fix sigsev when accessing MMIO on hot unplug.
      drm/amdgpu: Bump minor version for hot plug tests enabling.

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.106.0

Aric Cyr (1):
      drm/amd/display: 3.2.175

Charlene Liu (1):
      drm/amd/display: add verify_link_cap back for hdmi

Chris Park (1):
      drm/amd/display: Reset VIC if HDMI_VIC is present

Christian König (5):
      drm/amdgpu: install ctx entities with cmpxchg
      drm/amdgpu: header cleanup
      drm/amdgpu: use job and ib structures directly in CS parsers
      drm/amdgpu: properly embed the IBs into the job
      drm/amdgpu: initialize the vmid_wait with the stub fence

Danijel Slivka (1):
      drm/amd/pm: new v3 SmuMetrics data structure for Sienna Cichlid

David Yu (1):
      drm/amdgpu: Add DFC CAP support for aldebaran

Dillon Varone (2):
      drm/amd/display: Add frame alternate 3D & restrict HW packed on dongles
      drm/amd/display: Modify plane removal sequence to avoid hangs.

George Shen (1):
      drm/amd/display: Refactor fixed VS w/a for PHY tests

Hansen Dsouza (1):
      drm/amd/display: Remove invalid RDPCS Programming in DAL

Harish Kasiviswanathan (1):
      drm/amdgpu: Set correct DMA mask for aldebaran

Jingwen Chen (1):
      drm/amd/amdgpu: set disabled vcn to no_schduler

Lang Yu (1):
      drm/amdgpu: fix a wrong ib reference

Lijo Lazar (1):
      drm/amdgpu: Refactor mode2 reset logic for v13.0.2

Luben Tuikov (1):
      drm/amd/display: Don't fill up the logs

Meng Tang (1):
      gpu/amd: vega10_hwmgr: fix inappropriate private variable name

Michael Strauss (1):
      drm/amd/display: Pass HostVM enable flag into DCN3.1 DML

Nicholas Kazlauskas (1):
      drm/amd/display: Make functional resource functions non-static

Philip Yang (4):
      Revert "drm/amdkfd: process_info lock not needed for svm"
      drm/amdkfd: Correct SMI event read size
      drm/amdkfd: Add SMI add event helper
      drm/amdkfd: Add format attribute to kfd_smi_event_add

Prike Liang (4):
      drm/amdgpu: enable gfx clock gating control for GC 10.3.7
      drm/amdgpu/nv: enable clock gating for GC 10.3.7 subblock
      drm/amdgpu: enable gfx power gating for GC 10.3.7
      drm/amdgpu: enable gfxoff routine for GC 10.3.7

Qiang Yu (1):
      drm/amdgpu: fix suspend/resume hang regression

Robin Chen (1):
      drm/amd/display: Pass deep sleep disabled allow info to dmub fw

Ruijing Dong (2):
      drm/amdgpu/vcn: Update fw shared data structure
      drm/amdgpu/vcn: Add vcn firmware log

Shah Dharati (1):
      drm/amd/display: Adding a dc_debug option and dmub setting to use PHY FSM for PSR

Tom Rix (1):
      drm/amdgpu: Fix realloc of ptr

Weiguo Li (1):
      drm/amdgpu: remove redundant null check

Wesley Chalmers (1):
      drm/amd/display: Program OPP before ODM

Yifan Zha (1):
      drm/amdgpu: Move CAP firmware loading to the beginning of PSP firmware list

Yifan Zhang (5):
      drm/amdgpu: move amdgpu_gmc_noretry_set after ip_versions populated
      drm/amdgpu: convert code name to ip version for noretry set
      drm/amdkfd: judge get_atc_vmid_pasid_mapping_info before call
      drm/amdkfd: implement get_atc_vmid_pasid_mapping_info for gfx10.3
      drm/amdkfd: bail out early if no get_atc_vmid_pasid_mapping_info

jinzh (1):
      drm/amd/display: refine the EDID override

yipechai (12):
      drm/amdgpu: Modify .ras_fini function pointer parameter
      drm/amdgpu: Optimize xxx_ras_fini function of each ras block
      drm/amdgpu: centrally calls the .ras_fini function of all ras blocks
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in gfx ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in mmhub ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in nbio ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in umc ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in xgmi ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in hdp ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in sdma ras block
      drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in mca ras block
      drm/amdgpu: Remove redundant .ras_fini initialization in some ras blocks

 drivers/gpu/drm/amd/amdgpu/aldebaran.c             |  66 ++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  98 +----------
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h             |  80 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |  24 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |  19 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  25 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |   7 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |  21 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c            |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |   6 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h            |   3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.c          |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.c           |   7 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_nbio.h           |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  28 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c          |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |  58 ++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c           |   7 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace_points.c   |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   7 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |  37 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.h            |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            | 117 ++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h            |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c            | 134 ++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |  30 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   8 -
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  18 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   7 -
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   4 -
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  15 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |   1 -
 drivers/gpu/drm/amd/amdgpu/mca_v3_0.c              |  18 --
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |   1 -
 drivers/gpu/drm/amd/amdgpu/nv.c                    |  15 +-
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |   8 -
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |   8 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   3 -
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c              |  14 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   7 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |  22 ++-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  21 ++-
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  51 +++---
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   5 +
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |  74 +++------
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   9 +
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   8 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  14 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  16 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   2 +
 drivers/gpu/drm/amd/display/dc/dc.h                |   4 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   1 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  49 +++---
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   5 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c  |  21 +--
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  |   9 -
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   5 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.h  |   5 +
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |   1 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |   3 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  12 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |  68 ++++----
 .../inc/pmfw_if/smu11_driver_if_sienna_cichlid.h   |  58 +++++++
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 181 ++++++++++++++-------
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   1 +
 include/uapi/linux/kfd_ioctl.h                     |   1 +
 84 files changed, 983 insertions(+), 671 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
