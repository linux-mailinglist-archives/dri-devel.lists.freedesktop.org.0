Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 096FF4DE29E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 21:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DF210E0A3;
	Fri, 18 Mar 2022 20:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EDF10E09F;
 Fri, 18 Mar 2022 20:37:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEKBQPsdm8lR1x01pxfMEXGDlXglxDP3zpZfHbxbSkjSlKjIAtGb1JMPA6ubch7W1ULig50hBBeva1/j+aPjFfGzPGEBLZeK62L9/EMmxvPdQlDwLeST/wCaHz5oP5HEnArVSLDb+zCGisFLbapN0FgKH4lK267bn8GDAAyDLxoB2uvLH3FI/JqtnkIBepnLnHUPtovCQjDL9RR1sVyQTP1lp3wIP0oYuTBTT4hmNIlhw+5q2S7SxNldM9KVEoXyKP1W81AuSYjBjyd+92lOH6Pm4ynVr09aY7JOqa8DRqZHnP4H1c4pagAa9A70QAPEmMYXF36ECLGIEDIt1YvRnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANsr3wX2B/9f4kzVa/vo3YdUBmxPbyALC9SO0WUpSQs=;
 b=k5607FmY5RgzkIWsRvxbyxlQZLwVdk712nKtipNBxcJZvlLAmjmFNOO5F/Sh9g7GsUvuxkp5oD49UT68lIJbgBT0Jml+AjzagQHXlIUddqh51bXC1eBG6Z/tgxwdHeknA5j3rAJmBeIVZSNgaj2hyaYW+FHqXpjFfJ3H9boSv1UP3cp4h2eQ0hkAj2Vifab/rK3Uk/MTDK3LRfjAwnDm9XhRZWHa1AmscuReGvokaGgU8TrhfPeKJcvA1H1WmTHSPiBKk6qwUGBldHAB4HPBz6D5RIyQhcBC7QVKSdueIpeVKDy07go3QaOhr0+VLQaGyAfIaRcJ5f5TrG+A+1qhCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANsr3wX2B/9f4kzVa/vo3YdUBmxPbyALC9SO0WUpSQs=;
 b=oeg4Yatuy1s8p6mNwOb4napObHAWcbyqpKjOafVAC2n1V+VQPNtv2JDET5dCocfGPZgJBSp8bTt0c6BYcK0Zkcp7IUrktAfT7T18FVvcbt4/uvLNl0N+p5OEpPOTOCvFTzbtwaazOxRnsKXe2qJSH56fXweV22cLKi7GuVD3Lok=
Received: from MWHPR13CA0034.namprd13.prod.outlook.com (2603:10b6:300:95::20)
 by DM5PR1201MB0058.namprd12.prod.outlook.com (2603:10b6:4:50::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 18 Mar
 2022 20:37:38 +0000
Received: from CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:95:cafe::34) by MWHPR13CA0034.outlook.office365.com
 (2603:10b6:300:95::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.8 via Frontend
 Transport; Fri, 18 Mar 2022 20:37:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT054.mail.protection.outlook.com (10.13.174.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Fri, 18 Mar 2022 20:37:37 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 18 Mar
 2022 15:37:35 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-next-5.18
Date: Fri, 18 Mar 2022 16:37:17 -0400
Message-ID: <20220318203717.5833-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08c7e08b-484b-469f-4753-08da091f23a4
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0058:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB005840427800BC5522438955F7139@DM5PR1201MB0058.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ga0W2BT+ab3h4dXW9vItzLyOd+Ewh5fFHvAvnyV/2CRM8z/R16IirHReO1ZL4Eh5Xh8avRSPtaG/fdhl0W+bSdfIOIeeWr5JU+vvNIlYDSax27okuYBnAUHEQK3lF8+P4ui/gPLvEI0OiquM04Rb9BwwUPW2qRu5LYEX7oj52RzXtI+adGUSrp5ctEvFOKkJj4/HB51AgAugROwOvY9a6ecXjZ6pIfo2mC7YRMfay+3PrJsUxhN2JCMTetJ035b5ATKepAZj43XOr3E/MorXSYTpazxIHOEM1naR6IuzkZV3uVJtZplGi5dFy6/G7Al0ULDLIMdbYc4VEWuowPoih35xLAf3Hs8jOJgiy4AimmwESADPJ7IF+xTRBz2hC7mYMFbTsVXruKznBCz1kMD9Xh0EkCgJVF4aa+bkiXN7nUuRjiNPGreSPvz/zXOnulSrauNXfTq5SJnK7n+HY3E9rMUdp0geikbs1TxCOK0Ma6iHPTQdNNxabpyHdNvzHvLuri5YNx1+Gw8ADdmr6Q5xTyEZfzyWUOhaM+KlsVFMJtIZIxWpoMP9gaRsKgYTGcWl+Ve4/ZboQ+Uxij5eD+vR2oyS/VltrSVxUqXgltNC+EDUDuVICywlU1PzO5ouoQjikjXWyRDhYxw7gT6XiKZXoPxb5Z4VFSfLiedDhlXldTLxh6qrRvQ95KDF8qbBTnk0Y5c1V+caDBfCQMoGlLNmz/HNyPCto8KmFZDW2jqEu4VtpGNugv+4IniZruXs/GgtlXt7mBi0BgDCXc+rkFSrHu32sJpBoJ5soLg1v4WIiYo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(8676002)(4326008)(70206006)(81166007)(70586007)(7696005)(336012)(426003)(36860700001)(66574015)(110136005)(316002)(83380400001)(47076005)(356005)(1076003)(82310400004)(6666004)(86362001)(40460700003)(36756003)(26005)(2616005)(8936002)(186003)(2906002)(16526019)(966005)(5660300002)(30864003)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 20:37:37.1232 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c7e08b-484b-469f-4753-08da091f23a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0058
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

The following changes since commit f6d790e5a7fe42706756c7fa1686d08d230610fc:

  Merge tag 'drm-intel-next-fixes-2022-03-10' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2022-03-11 13:27:00 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.18-2022-03-18

for you to fetch changes up to 426c89aa203bcec9d9cf6eea36735eafa1b1f099:

  drm/amdgpu: Use drm_mode_copy() (2022-03-15 15:01:12 -0400)

----------------------------------------------------------------
amd-drm-next-5.18-2022-03-18:

amdgpu:
- Aldebaran fixes
- SMU 13.0.5 fixes
- DCN 3.1.5 fixes
- DCN 3.1.6 fixes
- Pipe split fixes
- More display FP cleanup
- DP 2.0 UHBR fix
- DC GPU reset fix
- DC deep color ratio fix
- SMU robustness fixes
- Runtime PM fix for APUs
- IGT reload fixes
- SR-IOV fix
- Misc fixes and cleanups

amdkfd:
- CRIU fixes
- SVM fixes

UAPI:
- Properly handle SDMA transfers with CRIU
  Proposed user mode change: https://github.com/checkpoint-restore/criu/pull/1709

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu/display: enable scatter/gather display for DCN 3.1.6
      drm/amdgpu: only check for _PR3 on dGPUs

Anthony Koo (2):
      drm/amd/display: [FW Promotion] Release 0.0.107.0
      drm/amd/display: [FW Promotion] Release 0.0.108.0

Aric Cyr (2):
      drm/amd/display: 3.2.176
      drm/amd/display: 3.2.177

Becle Lee (1):
      drm/amd/display: Wait for hubp read line for Pollock

Charlene Liu (5):
      drm/amd/display: add debug option to bypass ssinfo from bios for dcn315
      drm/amd/display: fix the clock source contruct for dcn315
      drm/amd/display: merge two duplicated clock_source_create
      drm/amd/display: enable dcn315/316 s0i2 support
      drm/amd/display: Add save/restore PANEL_PWRSEQ_REF_DIV2

Chris Park (1):
      drm/amd/display: Add NULL check

Dale Zhao (1):
      drm/amd/display: Add new enum for EDID status

Dan Carpenter (1):
      drm/amd/pm: fix indenting in __smu_cmn_reg_print_error()

David Yat Sin (3):
      drm/amdkfd: CRIU remove sync and TLB flush on restore
      drm/amdkfd: CRIU Refactor restore BO function
      drm/amdkfd: CRIU export dmabuf handles for GTT BOs

Dillon Varone (1):
      drm/amd/display: Add minimal pipe split transition state

Eric Yang (1):
      drm/amd/display: Block zstate when more than one plane enabled

George Shen (1):
      drm/amd/display: Clean up fixed VS PHY test w/a function

Hansen Dsouza (1):
      drm/amd/display: fix deep color ratio

Hawking Zhang (1):
      drm/amdgpu: drop xmgi23 error query/reset support

Jasdeep Dhillon (1):
      drm/amd/display: move FPU associated DCN303 code to DML folder

JinZe.Xu (1):
      drm/amd/display: Add I2C escape to support query device exist.

Jing Zhou (2):
      drm/amd/display: Update engine ddc
      drm/amd/display: Add null pointer filter

Jingwen Zhu (1):
      drm/amd/display: add gamut coefficient set A and B

Jonathan Kim (1):
      drm/amdgpu: fix aldebaran xgmi topology for vf

Julia Lawall (3):
      drm/amd/pm: fix typos in comments
      drm/amdgpu: fix typos in comments
      drm/amdgpu/dc: fix typos in comments

Lang Yu (1):
      drm/amdgpu: only allow secure submission on rings which support that

Leo (Hanghong) Ma (2):
      drm/amd/display: Add link dp trace support
      drm/amd/display: Add function to get the pipe from the stream context

Leo Li (1):
      drm/amd/display: Fix compile error from TO_CLK_MGR_INTERNAL

Leung, Martin (1):
      drm/amd/display: cleaning up smu_if to add future flexibility

Lijo Lazar (2):
      drm/amdgpu: Disable baco dummy mode
      drm/amd/pm: Send message when resp status is 0xFC

Melissa Wen (3):
      drm/amd/display: move FPU-related code from dcn20 to dml folder
      drm/amd/display: move FPU operations from dcn21 to dml/dcn20 folder
      drm/amd/display: move FPU code from dcn10 to dml/dcn10 folder

Nicholas Kazlauskas (2):
      drm/amd/display: Fix double free during GPU reset on DC streams
      drm/amd/display: Add pstate verification and recovery for DCN31

Paul Menzel (1):
      drm/amdgpu: Use ternary operator in `vcn_v1_0_start()`

Philip Yang (2):
      drm/amdgpu: Move reset domain init before calling RREG32
      drm/amdkfd: evict svm bo worker handle error

Stanley.Yang (3):
      drm/amd/pm: add send bad channel info function
      drm/amdgpu: message smu to update bad channel info
      drm/amd/pm: use pm mutex to protect ecc info table

Sung Joon Kim (1):
      drm/amd/display: disable HPD SW timer for passive dongle type 1 only

Tianci Yin (1):
      drm/amdgpu/vcn: fix vcn ring test failure in igt reload test

Tianci.Yin (2):
      drm/amd/display: fix dp kvm can't light up
      drm/amd: fix gfx hang on renoir in IGT reload test

Ville Syrjälä (3):
      drm/amdgpu: Remove pointless on stack mode copies
      drm/radeon: Use drm_mode_copy()
      drm/amdgpu: Use drm_mode_copy()

Wayne Lin (2):
      drm/amd/display: Fix a few parts in debugfs entry
      drm/amd/display: Retry when fail reading lane status during LT

Wenjing Liu (1):
      drm/amd/display: handle DP2.0 RX with UHBR20 but not UHBR13.5 support

Wyatt Wood (1):
      drm/amd/display: Release AUX engine after failed acquire

Yifan Zhang (1):
      drm/amdgpu: change registers in error checking for smu 13.0.5

Yongqiang Sun (2):
      drm/amdgpu: Merge get_reserved_allocation to get_vbios_allocations.
      drm/amdgpu: Add stolen reserved memory for MI25 SRIOV.

yipechai (1):
      drm/amdgpu: fixed the warnings reported by kernel test robot

 drivers/gpu/drm/amd/amdgpu/Makefile                |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   24 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   41 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |    7 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |    3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   25 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h     |    4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |    5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   22 -
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |    1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    1 -
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c             |   15 +
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |    4 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |    4 +
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |   10 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |    3 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |    2 +
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |    2 +
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  315 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c           |   29 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |   21 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   50 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   10 +-
 .../gpu/drm/amd/display/dc/bios/command_table.c    |    6 +-
 .../amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c   |   13 +-
 .../dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.c       |    9 +-
 .../dc/clk_mgr/dcn30/dcn30_clk_mgr_smu_msg.h       |   67 +-
 .../dc/clk_mgr/dcn30/dcn30_smu11_driver_if.h       |   74 +
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |    5 +-
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c |   24 +
 .../drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.h |    2 +
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |    8 +-
 .../drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c |   26 +
 .../drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.h |    2 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |   22 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |    9 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c  |    2 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  159 +-
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |    7 +
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |    3 +
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   14 +
 drivers/gpu/drm/amd/display/dc/dc.h                |    3 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |   41 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |    2 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    1 +
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |    3 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c   |    2 +
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |  117 ++
 .../gpu/drm/amd/display/dc/dce/dce_clock_source.h  |    9 +
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c.c       |   26 +
 drivers/gpu/drm/amd/display/dc/dce/dce_i2c.h       |    6 +
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.c    |    1 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c  |   15 +
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.h  |    4 +
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   10 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |   77 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.h  |    4 +
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |   25 -
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |   10 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  | 1369 +-------------
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.h  |   31 +-
 drivers/gpu/drm/amd/display/dc/dcn21/Makefile      |   25 -
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.c  |  564 +-----
 .../gpu/drm/amd/display/dc/dcn21/dcn21_resource.h  |   11 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp_cm.c    |    2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_hubbub.c    |    1 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |    7 +
 .../gpu/drm/amd/display/dc/dcn301/dcn301_hubbub.c  |    1 +
 drivers/gpu/drm/amd/display/dc/dcn303/Makefile     |   26 -
 .../drm/amd/display/dc/dcn303/dcn303_resource.c    |  327 +---
 .../drm/amd/display/dc/dcn303/dcn303_resource.h    |    3 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c    |   60 +
 .../drm/amd/display/dc/dcn31/dcn31_panel_cntl.c    |    5 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |    8 +-
 .../drm/amd/display/dc/dcn315/dcn315_resource.c    |   37 +-
 .../drm/amd/display/dc/dcn316/dcn316_resource.c    |   37 +-
 drivers/gpu/drm/amd/display/dc/dml/Makefile        |    4 +
 .../gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.c   |  123 ++
 .../dc/dml/dcn10/dcn10_fpu.h}                      |   12 +-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   | 1926 ++++++++++++++++++++
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h   |   51 +
 .../gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c |  362 ++++
 .../dc/dml/dcn303/dcn303_fpu.h}                    |   14 +-
 drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c |    6 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |    2 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |    1 +
 drivers/gpu/drm/amd/display/dc/inc/hw/panel_cntl.h |    1 +
 .../drm/amd/display/dc/inc/hw_sequencer_private.h  |    1 +
 drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h  |    5 +
 drivers/gpu/drm/amd/display/dc/link/Makefile       |    2 +-
 .../gpu/drm/amd/display/dc/link/link_dp_trace.c    |  146 ++
 .../gpu/drm/amd/display/dc/link/link_dp_trace.h    |   57 +
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   92 +-
 .../drm/amd/display/include/ddc_service_types.h    |    1 +
 .../amd/display/include/grph_object_ctrl_defs.h    |   22 -
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |   19 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |    2 +-
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h            |    1 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   10 +
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |    7 +
 .../drm/amd/pm/swsmu/inc/pmfw_if/aldebaran_ppsmc.h |    3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h       |    3 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |   43 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |   14 +-
 drivers/gpu/drm/radeon/radeon_connectors.c         |    4 +-
 include/uapi/linux/kfd_ioctl.h                     |    5 +-
 117 files changed, 3944 insertions(+), 2944 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_smu11_driver_if.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.c
 rename drivers/gpu/drm/amd/{amdgpu/amdgpu_hdp.c => display/dc/dml/dcn10/dcn10_fpu.h} (89%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c
 rename drivers/gpu/drm/amd/{amdgpu/amdgpu_mmhub.c => display/dc/dml/dcn303/dcn303_fpu.h} (78%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_trace.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dp_trace.h
