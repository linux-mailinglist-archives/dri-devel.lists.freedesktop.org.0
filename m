Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE5D466A4E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 20:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DBA6FA7F;
	Thu,  2 Dec 2021 19:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293456FA7E;
 Thu,  2 Dec 2021 19:17:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9H02C5qUxrpM8/zeQmODiI16W2h5alytD3XlD4dR7lbDSq3K9tjQ4ig5aINt758zadp5wGaUuOOcewwRIJgtE6SH6vFNZ8JjIBu+RPAE2QdUq2G3Y/j6aRCvZz+sew6wnIvtLFDMnFegf9GFTJOQOoEeDscimWvr4ZUfRpc+ozUqcd4qqezqS5oApXR18B8ljKVpyreyggVbwH5Ov2J3Mkek8DPlhUHwkhIB9KCZQ08X14d64ZxsMM+du0BmJ1H5xKhjgQjePi5M5yncTuz+uIUvcS+mxPNEyO2Oi/DuCuF97VWGJcfUj7ba3cZZSW6pDc4Bz7WCTNupQTtx2flbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gz34dhx5Q8lyeI1AoLzDt5ubNjYOA3ynBFQv+gf7/Ns=;
 b=PG8zj2vwn7ZkIJNa1R83CxnKBcWGOgdpaiKVOUp/nDcS+wdauS0Ew3abOBBPIMOY/SvcgQ/XDYcI5HppDX8e40rRQJ760nleqs81Mq4miSA8Tn0YpeR8fXgH/Nui/mVFIq2gnZ7cKFr1D+o3X4ris4z6G2sKpOr872tZPbY+/dERgWHYBxmEvTk1RGss/uBrPN+t/JxCBM2l115NH6yI6+3bxHZI22b57zkBQIn9lHMCLKn3YaviolnAYvZypTgqtx8bAed8GTrXtBnH4yRwnaEMCE/Like5uvv94Feuw8QR4BJU+DrqWPUUk3xG2t4+zxrCgUWyq5f3syoUh6YmTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gz34dhx5Q8lyeI1AoLzDt5ubNjYOA3ynBFQv+gf7/Ns=;
 b=LJ3wKnZK08XxRGfWJKKm4VWm9M+QCmioEXhRc74inzfei7kDnzhfvHV2lqf+bkbHna/zPaKZrsA6k4NN34Fa8MfkidppjHoheESN3FhZcde7anCIBMt/YTT9i2JlkEJml5vuVHgBoVAL4W8lbKvw/3EOOQ9XhagnW3InO0/J6iE=
Received: from DM5PR07CA0156.namprd07.prod.outlook.com (2603:10b6:3:ee::22) by
 BYAPR12MB3190.namprd12.prod.outlook.com (2603:10b6:a03:132::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 19:16:56 +0000
Received: from DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ee:cafe::d3) by DM5PR07CA0156.outlook.office365.com
 (2603:10b6:3:ee::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14 via Frontend
 Transport; Thu, 2 Dec 2021 19:16:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT018.mail.protection.outlook.com (10.13.172.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Thu, 2 Dec 2021 19:16:56 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 2 Dec
 2021 13:16:54 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd, radeon drm-next-5.17
Date: Thu, 2 Dec 2021 14:16:43 -0500
Message-ID: <20211202191643.5970-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b65c108f-4dbf-4d75-fdb0-08d9b5c84e56
X-MS-TrafficTypeDiagnostic: BYAPR12MB3190:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3190B8A28AC92FB9B97D5DF0F7699@BYAPR12MB3190.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NpsUk9eUXr1TMDZC0DUs47Ku01rzmXkb4PX/XaE12gLFfLnxo4S9B97mUyl4US6c0qgNhVIMfIUEwXFcbYOst3x6CrfbkLsO9RFqWsMlsPU5o4SOXKld8+jbNxKOnPue/SPFb9HM5GPsBkpls2yjZQ63aa1p/YGIx9KpU2BTG1l7joZM9M0QrcnfjjI3w7cqgDQ+0uzEhiEqVrQemmHC/Nlv50P93l8/Kx6JtwRxD7CNYxafpmZzZHH1qQhVVZQEA46wP/Zcq/1TqP9GcTp3oAgzpBGWhY9VtQNGI5HOAOSUzUNUzR+viup1Hy5hG+WThIJ0UCGCweBbWvJ0yD80AzYicN2vFkSFQdG0IrbGPgs7TtSZM0bpCIvpKjNZN8wX7z7ZUcrdU7dHoqN9xYfChC5xryC96PrbiU9pim/OK93+ZJccj/5uZ4xux+imVyB659q9fsZYTLdG/fe7Az8D+oI2y3t6m/SnMMjw2rIMFaGk3Ontz/gc1m2P5NJmhbYeOqeTlQMn5wVgsPNcs1HpySeXgXOnVdbtxpHs2j/8rlDSZF9YQElN/dhETpYFjNbklxy6GvRmfiPAbBL1CxGccly3eSIdBZHbelDoJ2nIvFYqA2xRqAeDmcQiMR6kNRSbNhWMpBPYIXwLDjtI3IDqfwG3+dSFm7zavqCz8TwfT6DwrEFRLNkF2Y9GZhAsTbGIJQq4I1lB5hTzq6A09emqmwla2WVuq+Yawfdfg3XdEOJ34ETglQePwy/mMpGSv0znlS3rfpbm4ac32kEdRK0ThSJVajDz4agnPLdWpePZuBZAvdxDqkthQjCfRxNp4w+XBKmdI81fZohNc9OK7QwYZJ9UuLHFeFFDfk9cNMCoG8hJeo8g9fQtYkOia1dKIJhH
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(316002)(110136005)(26005)(6666004)(2616005)(66574015)(86362001)(47076005)(83380400001)(336012)(36860700001)(4326008)(8676002)(356005)(4001150100001)(186003)(36756003)(40460700001)(1076003)(426003)(30864003)(2906002)(7696005)(16526019)(966005)(5660300002)(8936002)(82310400004)(81166007)(508600001)(70586007)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 19:16:56.0983 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b65c108f-4dbf-4d75-fdb0-08d9b5c84e56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3190
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

New stuff for 5.17.

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.17-2021-12-02

for you to fetch changes up to 70897848730470cc477d5d89e6222c0f6a9ac173:

  drm/amdgpu/display: Only set vblank_disable_immediate when PSR is not enabled (2021-12-01 16:00:58 -0500)

----------------------------------------------------------------
amd-drm-next-5.17-2021-12-02:

amdgpu:
- Use generic drm fb helpers
- PSR fixes
- Rework DCN3.1 clkmgr
- DPCD 1.3 fixes
- Misc display fixes can cleanups
- Clock query fixes for APUs
- LTTPR fixes
- DSC fixes
- Misc PM fixes
- RAS fixes
- OLED backlight fix
- SRIOV fixes
- Add STB (Smart Trace Buffer) for supported dGPUs
- IH rework
- Enable seamless boot for DCN3.01

amdkfd:
- Rework more stuff around IP discovery enumeration
- Further clean up of interfaces with amdgpu
- SVM fixes

radeon:
- Indentation fixes

UAPI:
- Add a new KFD header that defines some of the sysfs bitfields and enums that userspace has been using for a while
  The corresponding bit-fields and enums in user mode are defined in
  https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface/blob/master/include/hsakmttypes.h

----------------------------------------------------------------
Ahmad Othman (1):
      drm/amd/display: Secondary display goes blank on Non DCN31

Alex Deucher (5):
      drm/amdgpu/display: set vblank_disable_immediate for DC
      drm/amdgpu/gfx10: add wraparound gpu counter check for APUs as well
      drm/amdgpu/gfx9: switch to golden tsc registers for renoir+
      drm/amdgpu/pm: fix powerplay OD interface
      drm/amd/display: update bios scratch when setting backlight

Alvin Lee (1):
      drm/amd/display: Wait for ACK for INBOX0 HW Lock

Amber Lin (2):
      drm/amdkfd: Retrieve SDMA numbers from amdgpu
      drm/amdkfd: Remove unused entries in table

Andrey Grodzovsky (3):
      drm/amd/pm: Add STB accessors interface
      drm/amd/pm: Add STB support in sienna_cichlid
      drm/amd/pm: Add debugfs info for STB

Angus Wang (3):
      drm/amd/display: Fix RGB MPO underflow with multiple displays
      drm/amd/display: Revert changes for MPO underflow
      drm/amd/display: Fix LTTPR not Enabled

Anthony Koo (3):
      drm/amd/display: [FW Promotion] Release 0.0.92
      drm/amd/display: [FW Promotion] Release 0.0.93
      drm/amd/display: [FW Promotion] Release 0.0.94

Aric Cyr (3):
      drm/amd/display: 3.2.161
      drm/amd/display: 3.2.162
      drm/amd/display: 3.2.163

Bernard Zhao (5):
      drm/amd/amdgpu: remove useless break after return
      drm/amd/amdgpu: cleanup the code style a bit
      drm/amd/amdgpu: fix potential memleak
      drm/amd/display: remove no need NULL check before kfree
      drm/amd/display: cleanup the code a bit

Brandon Syu (1):
      drm/amd/display: Fix eDP will flash when boot to OS

Candice Li (1):
      drm/amdgpu: Add recovery_lock to save bad pages function

Charlene Liu (4):
      drm/amd/display: remove dmcub_support cap dependency
      drm/amd/display: clean up some formats and log
      drm/amd/display: Adjust code indentation
      drm/amd/display: based on flag reset z10 function pointer

Chris Park (1):
      drm/amd/display: Fix Coverity Issues

Dmytro Laktyushkin (1):
      drm/amd/display: bring dcn31 clk mgr in line with other version style

Evan Quan (3):
      drm/amdgpu: use generic fb helpers instead of setting up AMD own's.
      drm/amd/pm: avoid duplicate powergate/ungate setting
      drm/amdgpu: update the domain flags for dumb buffer creation

Felix Kuehling (2):
      drm/amdkfd: Add sysfs bitfields and enums to uAPI
      drm/amdgpu: Fix MMIO HDP flush on SRIOV

Graham Sider (18):
      drm/amdkfd: add amdgpu_device entry to kfd_dev
      drm/amdkfd: replace kgd_dev in static gfx v7 funcs
      drm/amdkfd: replace kgd_dev in static gfx v8 funcs
      drm/amdkfd: replace kgd_dev in static gfx v9 funcs
      drm/amdkfd: replace kgd_dev in static gfx v10 funcs
      drm/amdkfd: replace kgd_dev in static gfx v10_3 funcs
      drm/amdkfd: replace kgd_dev in hqd/mqd kfd2kgd funcs
      drm/amdkfd: replace kgd_dev in various kfd2kgd funcs
      drm/amdkfd: replace kgd_dev in various amgpu_amdkfd funcs
      drm/amdkfd: replace kgd_dev in get amdgpu_amdkfd funcs
      drm/amdkfd: replace kgd_dev in gpuvm amdgpu_amdkfd funcs
      drm/amdkfd: replace/remove remaining kgd_dev references
      drm/amdkfd: remove kgd_dev declaration and initialization
      drm/amdkfd: replace trivial funcs with direct access
      drm/amdkfd: convert KFD_IS_SOC to IP version checking
      drm/amdkfd: convert switches to IP version checking
      drm/amdkfd: convert misc checks to IP version checking
      drm/amdkfd: replace asic_family with asic_type

Guchun Chen (1):
      drm/amdgpu: add error print when failing to add IP block(v2)

Guo, Bing (1):
      drm/amd/display: fixed an error related to 4:2:0/4:2:2 DSC

Huang, ChiaWen (1):
      drm/amd/display: use link_rate_set above DPCD 1.3 (#1527)

Jiapeng Chong (2):
      drm/amd/display: Clean up some inconsistent indenting
      drm/amdgpu/pm: clean up some inconsistent indenting

Jimmy Kizito (3):
      drm/amd/display: Use link_enc_cfg API for queries.
      drm/amd/display: Query all entries in assignment table during updates.
      drm/amd/display: Initialise encoder assignment when initialising dc_state

Jun Lei (1):
      drm/amd/display: Code change for DML isolation

Leo (Hanghong) Ma (3):
      drm/amd/display: Add helper for blanking all dp displays
      drm/amd/display: Drop config guard for DC_LOG_DP2
      drm/amd/display: Reduce dmesg error to a debug print

Lijo Lazar (2):
      drm/amd/pm: Remove artificial freq level on Navi1x
      drm/amdgpu: Skip ASPM programming on aldebaran

Luben Tuikov (4):
      drm/amd/pm: Enhanced reporting also for a stuck command
      drm/amd/pm: Add debug prints
      drm/amd/pm: Sienna: Print failed BTC
      drm/amd/pm: Print the error on command submission

Martin Leung (1):
      drm/amd/display: add else to avoid double destroy clk_mgr

Meenakshikumar Somasundaram (1):
      drm/amd/display: Add hpd pending flag to indicate detection of new hpd

Mikita Lipski (3):
      drm/amd/display: Pass panel inst to a PSR command
      drm/amd/display: Enable DSC over eDP
      drm/amd/display: fix accidental casting enum to bool

Nevenko Stupar (1):
      drm/amd/display: Display object info table changes

Nicholas Kazlauskas (7):
      drm/amd/display: Fix detection of aligned DMUB firmware meta info
      drm/amd/display: Only flush delta from last command execution
      drm/amd/display: Fix DPIA outbox timeout after GPU reset
      drm/amd/display: Run full global validation in dc_commit_state
      drm/amd/display: Set plane update flags for all planes in reset
      drm/amd/display: Reset link encoder assignments for GPU reset
      drm/amdgpu/display: Only set vblank_disable_immediate when PSR is not enabled

Nirmoy Das (2):
      drm/amdgpu: remove unnecessary checks
      drm/amdgpu: return early on error while setting bar0 memtype

Perry Yuan (1):
      drm/amd/pm: add GFXCLK/SCLK clocks level print support for APUs

Philip Yang (6):
      drm/amdgpu: IH process reset count when restart
      drm/amdkfd: process exit and retry fault race
      drm/amdkfd: handle VMA remove race
      drm/amdkfd: simplify drain retry fault
      drm/amdgpu: enable Navi 48-bit IH timestamp counter
      drm/amdgpu: enable Navi retry fault wptr overflow

Ramesh Errabolu (3):
      drm/amdgpu: Update BO memory accounting to rely on allocation flag
      drm/amdgpu: Pin MMIO/DOORBELL BO's in GTT  domain
      drm/amdgpu: Declare Unpin BO api as static

Robin Chen (1):
      drm/amd/display: To support sending TPS3 pattern when restoring link

Roman Li (1):
      drm/amd/display: Fix OLED brightness control on eDP

Roy Chan (1):
      drm/amd/display: fix stale info in link encoder assignment

Shirish S (1):
      drm/amd/display: log amdgpu_dm_atomic_check() failure cause

Stanley.Yang (4):
      drm/amd/pm: Update smu driver interface for aldebaran
      drm/amdgpu: add new query interface for umc block v2
      drm/amd/pm: add message smu to get ecc_table v2
      drm/amdgpu: query umc error info from ecc_table v2

Sung Joon Kim (3):
      drm/amd/display: retain/release stream pointer in link enc table
      drm/amd/display: Revert "retain/release stream pointer in link enc table"
      drm/amd/display: retain/release at proper places in link_enc assignment

Surbhi Kakarya (1):
      drm/amd/pm: add new fields for Sienna Cichlid.

Tao Zhou (1):
      drm/amdgpu: support new mode-1 reset interface (v2)

Wenjing Liu (1):
      drm/amd/display: set MSA vsp/hsp to 0 for positive polarity for DP 128b/132b

Xu Wang (1):
      drm/radeon: correct indentation

Xu, Jinze (1):
      drm/amd/display: Reset fifo after enable otg

Yang Li (1):
      drm/amd/display: check top_pipe_to_program pointer

Yang Wang (1):
      drm/amdgpu: fix byteorder error in amdgpu discovery

Ye Guojin (2):
      drm/amd/display: remove unnecessary conditional operators
      drm/amd/display: fix cond_no_effect.cocci warnings

Yi-Ling Chen (2):
      drm/amd/display: fixed the DSC power off sequence during Driver PnP
      drm/amd/display: Fixed DSC would not PG after removing DSC stream

Zhan Liu (2):
      drm/amd/display: enable seamless boot for DCN301
      drm/amd/display: Rename dcn_validate_bandwidth to dcn10_validate_bandwidth

hongao (1):
      drm/amdgpu: fix set scaling mode Full/Full aspect/Center not works on vga and dvi connectors

hvanzyll (1):
      drm/amd/display: Visual Confirm Bar Height Adjust

ran jianping (1):
      drm/amdgpu: remove unneeded variable

shaoyunl (2):
      drm/amd/amdkfd: Fix kernel panic when reset failed and been triggered again
      drm/amdgpu: move kfd post_reset out of reset_sriov function

sungwang (1):
      drm/amd/display: Fix ODM combine issue with fast boot

xinhui pan (1):
      drm/amdgpu: Fix double free of dmabuf

 MAINTAINERS                                        |    1 +
 drivers/gpu/drm/amd/amdgpu/Makefile                |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |  134 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   96 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |   18 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.h    |    9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |  126 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |  143 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c  |  128 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c  |  124 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |  128 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |   35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  216 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |   12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h       |    2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   22 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   48 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   13 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c             |  388 ----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   33 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |   20 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |    7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   44 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   16 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |    5 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |   72 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |    1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |    4 -
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   15 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |   46 +-
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c             |   34 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c             |    4 +
 drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c             |    4 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_0.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v7_2.c             |    4 +
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |    7 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |    8 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    8 +-
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c              |  161 ++
 drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c   |    8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   54 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |  148 +-
 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c            |   18 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  188 +-
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  117 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager_v9.c   |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c            |    6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |   31 +-
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |    4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c   |   12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |   14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |   18 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    |   12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |   35 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   17 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   48 +-
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |    2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c        |    6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  170 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   80 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |   46 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  226 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    3 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c |    6 +-
 drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c   |    2 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    3 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |    8 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.h   |    7 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   31 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   84 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  171 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c |   20 +-
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |   53 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   16 +-
 drivers/gpu/drm/amd/display/dc/core/dc_sink.c      |   10 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    7 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   37 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h       |    2 +
 drivers/gpu/drm/amd/display/dc/dc_link.h           |    7 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |    6 -
 drivers/gpu/drm/amd/display/dc/dce/dce_audio.h     |    2 +
 .../gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c  |    3 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |   14 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.h      |    2 +-
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   29 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c  |   14 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   84 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |   20 +-
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |   15 +
 .../amd/display/dc/dcn10/dcn10_stream_encoder.h    |    3 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c   |    2 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |    2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c  |   14 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.h  |    3 +
 .../amd/display/dc/dcn20/dcn20_stream_encoder.c    |    2 +
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |    2 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   39 +-
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.c  |    1 +
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    |   21 +-
 .../drm/amd/display/dc/dcn302/dcn302_resource.c    |   18 +
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |   17 +
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c |    4 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |   45 +-
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c  |    5 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c  |    1 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |    1 +
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |    1 +
 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c   | 1889 ++++++++++++++++++++
 .../amd/display/dc/dml/dml_wrapper_translation.c   |  284 +++
 .../gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c   |   31 -
 .../gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.h   |    4 -
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c        |   14 +-
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc.c       |   28 -
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc.h       |    1 -
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c   |    6 +-
 drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h     |    2 +-
 drivers/gpu/drm/amd/display/dc/inc/dml_wrapper.h   |   34 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dsc.h        |    3 +
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |    4 +
 .../drm/amd/display/dc/inc/hw/timing_generator.h   |    2 +
 drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h  |    2 +-
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   42 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   30 +-
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c    |   89 +-
 .../drm/amd/display/include/ddc_service_types.h    |    4 +
 drivers/gpu/drm/amd/display/include/logger_types.h |    4 -
 drivers/gpu/drm/amd/include/amd_shared.h           |    3 +-
 .../drm/amd/include/asic_reg/mp/mp_11_0_offset.h   |    7 +
 .../drm/amd/include/asic_reg/mp/mp_11_0_sh_mask.h  |   12 +
 drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |   57 +-
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |   10 +
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    2 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    8 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_smu.h            |   24 +
 .../gpu/drm/amd/pm/inc/smu13_driver_if_aldebaran.h |   18 +-
 drivers/gpu/drm/amd/pm/inc/smu_v13_0.h             |    5 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c   |    2 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   |   20 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |   24 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu8_hwmgr.c    |    6 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |   28 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c  |   10 +-
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c  |   58 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |  126 +-
 .../drm/amd/pm/swsmu/smu11/cyan_skillfish_ppt.c    |   22 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |   13 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   77 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   26 +
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  109 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c     |   23 +-
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c   |   27 +
 .../gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.h   |    1 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   12 +-
 drivers/gpu/drm/radeon/radeon_kms.c                |    2 +-
 include/uapi/linux/kfd_sysfs.h                     |  108 ++
 166 files changed, 5249 insertions(+), 2356 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dml_wrapper_translation.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/dml_wrapper.h
 create mode 100644 include/uapi/linux/kfd_sysfs.h
