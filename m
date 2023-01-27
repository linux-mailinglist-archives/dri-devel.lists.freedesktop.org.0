Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996FF67F199
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 23:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A3F10E1D9;
	Fri, 27 Jan 2023 22:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11hn2200.outbound.protection.outlook.com [52.100.171.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C271610E1D9;
 Fri, 27 Jan 2023 22:59:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ctttu7PloqeoBbz86XELzODXB8GxYP5RnxAEkuQv/LEqhmf5GC4fkGrpqh17QD1uKUNC/S1KJezjrOzDKL21/YolO1SuUZACNBVFADA4FEjZWTzO0Dk+NFHB47G0yaKs7OT3tVm/PWZCFDIPXWQnAiroksWJZzFBgYC3rab678L9R5HSrKMQ9RI3Q4iTOv0gphLW2AmZnvs0XLi1DCKi5oNj3E7yZv6qR2hVQZPSL/H+zr7CytQ0aV3BMN09nOPtJ9Fhn/G4vBJcAjadLVtg+Xrj9Djv1yUlWHawDBsyqh+l6XLliVGchAGFrKodQKEi6fNVH3e8gCb2qmPdSnSgfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMXfpOpogRRTaGtne/R0fPboV8hVPbhxC1sznwY3S3Q=;
 b=SZHOp/D1NW75EAhNdFg5jKlj3ygtGbkxjprT6yHxTfVSiam/FEEEveIokhCF8af0cjC8BhVGbq+c0xO05txs1ol5p+/NrvdplwS3UgJedfM3EFIO4RRZw7lmf1CmOAIfDlnS5EBrGpOMBretg5xnDHt5nuxmuXz4gCQlsWiL6iepts9bqK5PzXz0WuAtLvC3ylmLLbkZ3KEZtXbd3LXKoZxGKVhmFfidCMX6jFGGZFG+jW/cXQIb4+/051GsnDvfMfS4PCpd1vvlHrTX0eLHUUEeTyXqN8gMUT4o8BPcn2g/fUJnkhzKUxsJJ3WLSQhboLLDJ4TkJMiwnUuy2JMxBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMXfpOpogRRTaGtne/R0fPboV8hVPbhxC1sznwY3S3Q=;
 b=agbWVTgQ7/mF2OnPyElUuCIa9xjVv9jXH/YUBTrbRodu6snwhwug5cEYBfwnVm8bE3CLDWqbYg/O12qMJObu2Vsp8KKPs+UtzuDVtGfsbncCbaUUf2Ex6y0naQwU/EYqdL5u4UrEusgWLS0TRS+pTwKPLk07pyMuaugVvM/KLwE=
Received: from DS7PR03CA0165.namprd03.prod.outlook.com (2603:10b6:5:3b2::20)
 by SN7PR12MB6932.namprd12.prod.outlook.com (2603:10b6:806:260::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.25; Fri, 27 Jan
 2023 22:59:34 +0000
Received: from DM6NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::1d) by DS7PR03CA0165.outlook.office365.com
 (2603:10b6:5:3b2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23 via Frontend
 Transport; Fri, 27 Jan 2023 22:59:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT094.mail.protection.outlook.com (10.13.172.195) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Fri, 27 Jan 2023 22:59:34 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 27 Jan
 2023 16:59:32 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-next-6.3
Date: Fri, 27 Jan 2023 17:59:17 -0500
Message-ID: <20230127225917.2419162-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT094:EE_|SN7PR12MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eac3213-588f-4564-392b-08db00ba284a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3eBUk8lsYYUdWVt5SPnT7X6cTJLldk7mDtHdr+QwUjXn82EDMoqkVO6n86ebj/pxFPqYGZhCXdh7/ettO3s5YLzzFpwainVq5P2NhkQRwLAdUL4NXqvUdnoCcufWMRDSwq6ksFK0XLhM8qu+mpWZToZPM7zaSimNBRtLdd4eJYzRY9V1ovRtKqnxKSUOo98L79eyX3adsenB5WIHI+lRjqIYUY1zgvHfDhYehSp//eWTAJpsx/xqJvBGS48708vEwmxJ04wdU/vLwW2i8Ls+nSU7uNIzWmD71/hW9R7lgBUh5C/wS/S6kqi7aFFU448Ut3DeWYwMCvzRLyO7P55Bqvm3/9q1Z0V5RPAU9P+5JXp1++K+Ty145PEIhgm2ErvvV/2up9COwVL9GgbGpVDvWynB7Id33bTrPTmtWP8vfWax+eYz+zVReH3Jd3V3lbAmLRlc5WwnBqBn7whdIoYw18xOKPnMzbJeYKsDRDxjgaWuDCfe4cs9Y6KdubBvY6kFTr2/fx/ByWuEW+2bQGF/SZ8QM7u21vQSaUpwyjeOR7PVYd/wzdPxiK1JxossFqi1mn2vLBv3ee+FnndtwQahwke1U0kLFF4i19B+qJDMELeBaMm5PaRt/FTTZ7yY/s4B/R/ZgMZ6nuAexVuK0Arkke58VabUOoZ+HkwM0pZ6Tn9rlALRQaDCyog02pygAU1L
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(39860400002)(34036004)(346002)(396003)(451199018)(36840700001)(40470700004)(46966006)(7696005)(26005)(186003)(1076003)(6666004)(2616005)(508600001)(2906002)(336012)(966005)(16526019)(426003)(4326008)(110136005)(47076005)(316002)(83380400001)(70586007)(70206006)(8676002)(41300700001)(8936002)(30864003)(5660300002)(36860700001)(81166007)(356005)(40460700003)(810100004)(82310400005)(86362001)(36756003)(40480700001)(41320700001)(36900700001);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 22:59:34.2145 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eac3213-588f-4564-392b-08db00ba284a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6932
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

A few more new things for 6.3.

The following changes since commit b4a9b36e69e935104e52e561aa9a82d39b5efc36:

  Documentation/gpu: update dGPU asic info table (2023-01-19 17:24:26 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.3-2023-01-27

for you to fetch changes up to cdf657fc1f4c9758f86ae3adeb32ee68cbd90691:

  amdgpu: fix build on non-DCN platforms. (2023-01-27 17:25:40 -0500)

----------------------------------------------------------------
amd-drm-next-6.3-2023-01-27:

amdgpu:
- GC11 fixes
- SMU13 fixes
- Freesync fixes
- DP MST fixes
- DP MST code rework and cleanup
- AV1 fixes for VCN4
- DCN 3.2.x fixes
- PSR fixes
- DML optimizations
- DC link code rework

----------------------------------------------------------------
Alex Deucher (1):
      drm/amdgpu/vcn4: add missing encoder cap

Alvin Lee (4):
      drm/amd/display: Allow idle optimization after turning off all pipes
      drm/amd/display: Disable SubVP for PSR panels
      drm/amd/display: Use |= when assigning wm_optimized_required
      drm/amd/display: Set init freq for DCFCLK DS

Anthony Koo (1):
      drm/amd/display: [FW Promotion] Release 0.0.150.0

Aric Cyr (2):
      drm/amd/display: 3.2.219
      drm/amd/display: 3.2.220

Aurabindo Pillai (3):
      drm/amd/display: Revert "ignore msa parameter only if freesync is enabled"
      drm/amd/display: set allow_freesync parameter in DM
      drm/amd/display: Fix timing not changning when freesync video is enabled

Dave Airlie (1):
      amdgpu: fix build on non-DCN platforms.

David (Ming Qiang) Wu (1):
      drm/amdgpu: limit AV1 to the first instance on VCN4 encode

Dillon Varone (1):
      drm/amd/display: Disable MALL SS and messages for PSR supported configs

Evan Quan (1):
      drm/amd/pm: add missing AllowIHInterrupt message mapping for SMU13.0.0

Hamza Mahfooz (1):
      drm/amd/display: use a more appropriate return value in dp_retrieve_lttpr_cap()

Ilya Bakoulin (1):
      drm/amd/display: Speed up DML fast_validate path

Jingwen Zhu (1):
      drm/amd/display: avoid disable otg when dig was disabled

Jonathan Kim (1):
      drm/amdgpu: remove unconditional trap enable on add gfx11 queues

Li Ma (2):
      drm/amdgpu: enable imu firmware for GC 11.0.4
      drm/amdgpu: declare firmware for new MES 11.0.4

Lyude Paul (1):
      drm/amdgpu/display/mst: Fix mst_state->pbn_div and slot count assignments

Qingqing Zhuo (1):
      drm/amd/display: force connector state when bpc changes during compliance

Robin Chen (1):
      drm/amd/display: Pass DSC slice height to PSR FW

Roman Li (1):
      drm/amd/display: Set hvm_enabled flag for S/G mode

Saaem Rizvi (1):
      drm/amd/display: Correcting prefetch mode for fast validate

Samson Tam (1):
      drm/amd/display: adjust MALL size available for DCN32 and DCN321

Stylon Wang (2):
      drm/amd/display: Guard Freesync HDMI parsing with dc_lock
      drm/amd/display: Properly reuse completion structure

Sung Joon Kim (1):
      drm/amd/display: Enable AdaptiveSync in DC interface

Tim Huang (1):
      drm/amdgpu: skip psp suspend for IMU enabled ASICs mode2 reset

Wayne Lin (6):
      drm/amdgpu/display/mst: limit payload to be updated one by one
      drm/amdgpu/display/mst: update mst_mgr relevant variable when long HPD
      drm/drm_print: correct format problem
      drm/display/dp_mst: Correct the kref of port.
      drm/amdgpu/display/mst: adjust the naming of mst_port and port of aconnector
      drm/amdgpu/display/mst: adjust the logic in 2nd phase of updating payload

Wenjing Liu (5):
      drm/amd/display: create accessories, hwss and protocols sub folders in link
      drm/amd/display: move eDP panel control logic to link_edp_panel_control
      drm/amd/display: move dp irq handler functions from dc_link_dp to link_dp_irq_handler
      drm/amd/display: move dp cts functions from dc_link_dp to link_dp_cts
      drm/amd/display: merge dc_link_dp into dc_link

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |    4 +-
 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |    1 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |    3 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                 |    1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |   62 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  138 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |    9 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  |    2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   18 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  200 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   54 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |    2 +-
 drivers/gpu/drm/amd/display/dc/Makefile            |    3 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c   |    1 +
 .../amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c   |    1 +
 .../amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c |    2 +-
 .../amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c |   28 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |    2 +-
 .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |    1 -
 drivers/gpu/drm/amd/display/dc/core/dc.c           |    7 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      | 1189 +++++-----
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   | 2375 --------------------
 .../gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c  |    1 -
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   56 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |    3 +-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h       |   21 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h           |   72 +-
 drivers/gpu/drm/amd/display/dc/dc_stream.h         |    2 +
 drivers/gpu/drm/amd/display/dc/dc_types.h          |    2 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |    1 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |   38 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |    2 -
 .../amd/display/dc/dcn10/dcn10_stream_encoder.c    |    9 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |    8 +-
 .../amd/display/dc/dcn20/dcn20_stream_encoder.c    |   20 +-
 .../display/dc/dcn30/dcn30_dio_stream_encoder.c    |   26 +
 .../display/dc/dcn30/dcn30_dio_stream_encoder.h    |    4 +
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c |   10 +-
 .../display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c |   25 +
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c |    6 +-
 .../display/dc/dcn314/dcn314_dio_stream_encoder.c  |    4 +-
 .../display/dc/dcn314/dcn314_dio_stream_encoder.h  |    4 +
 .../gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c   |    2 -
 .../display/dc/dcn32/dcn32_dio_stream_encoder.c    |    4 +-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c |   19 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  |   63 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.h  |    4 +
 .../amd/display/dc/dcn32/dcn32_resource_helpers.c  |   10 +
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    |   10 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |    6 +
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |   39 +-
 .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   55 +-
 .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |   47 +-
 .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |    5 +-
 .../gpu/drm/amd/display/dc/dml/display_mode_lib.h  |    1 +
 drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c     |    2 +-
 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h    |  117 -
 .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |   17 +
 drivers/gpu/drm/amd/display/dc/inc/link.h          |   17 +
 drivers/gpu/drm/amd/display/dc/link/Makefile       |   36 +-
 .../amd/display/dc/link/accessories/link_dp_cts.c  | 1055 +++++++++
 .../amd/display/dc/link/accessories/link_dp_cts.h  |   33 +
 .../dc/link/{ => accessories}/link_dp_trace.c      |    8 +-
 .../dc/link/{ => accessories}/link_dp_trace.h      |    5 -
 .../amd/display/dc/link/{ => hwss}/link_hwss_dio.c |    1 -
 .../amd/display/dc/link/{ => hwss}/link_hwss_dio.h |    1 +
 .../display/dc/link/{ => hwss}/link_hwss_dpia.c    |    0
 .../display/dc/link/{ => hwss}/link_hwss_dpia.h    |    0
 .../display/dc/link/{ => hwss}/link_hwss_hpo_dp.c  |    1 -
 .../display/dc/link/{ => hwss}/link_hwss_hpo_dp.h  |    1 +
 .../amd/display/dc/link/{ => protocols}/link_ddc.c |    0
 .../amd/display/dc/link/{ => protocols}/link_ddc.h |    0
 .../dc/link/{ => protocols}/link_dp_capability.c   |   29 +-
 .../dc/link/{ => protocols}/link_dp_capability.h   |   13 +
 .../display/dc/link/{ => protocols}/link_dp_dpia.c |    2 -
 .../display/dc/link/{ => protocols}/link_dp_dpia.h |    0
 .../dc/link/{ => protocols}/link_dp_dpia_bw.c      |    0
 .../dc/link/{ => protocols}/link_dp_dpia_bw.h      |    0
 .../dc/link/protocols/link_dp_irq_handler.c        |  401 ++++
 .../link_dp_irq_handler.h}                         |   15 +-
 .../display/dc/link/{ => protocols}/link_dp_phy.c  |   33 +-
 .../display/dc/link/{ => protocols}/link_dp_phy.h  |    5 +
 .../dc/link/{ => protocols}/link_dp_training.c     |   14 +-
 .../dc/link/{ => protocols}/link_dp_training.h     |    3 +
 .../{ => protocols}/link_dp_training_128b_132b.c   |    1 -
 .../{ => protocols}/link_dp_training_128b_132b.h   |    0
 .../link/{ => protocols}/link_dp_training_8b_10b.c |    1 -
 .../link/{ => protocols}/link_dp_training_8b_10b.h |    0
 .../{ => protocols}/link_dp_training_auxless.c     |    1 -
 .../{ => protocols}/link_dp_training_auxless.h     |    0
 .../link/{ => protocols}/link_dp_training_dpia.c   |    1 -
 .../link/{ => protocols}/link_dp_training_dpia.h   |    0
 .../link_dp_training_fixed_vs_pe_retimer.c         |    1 -
 .../link_dp_training_fixed_vs_pe_retimer.h         |    0
 .../display/dc/link/{ => protocols}/link_dpcd.c    |    0
 .../display/dc/link/{ => protocols}/link_dpcd.h    |    0
 .../dc/link/protocols/link_edp_panel_control.c     |  833 +++++++
 .../dc/link/protocols/link_edp_panel_control.h     |   33 +
 .../amd/display/dc/link/{ => protocols}/link_hpd.c |    0
 .../amd/display/dc/link/{ => protocols}/link_hpd.h |    0
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   10 +-
 .../drm/amd/display/modules/inc/mod_info_packet.h  |   36 +
 .../amd/display/modules/info_packet/info_packet.c  |   55 +
 .../drm/amd/display/modules/power/power_helpers.c  |    8 +-
 .../drm/amd/display/modules/power/power_helpers.h  |    2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |    1 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |    4 +-
 include/drm/drm_print.h                            |    2 +-
 109 files changed, 4136 insertions(+), 3356 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
 delete mode 100644 drivers/gpu/drm/amd/display/dc/inc/dc_link_dp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.h
 rename drivers/gpu/drm/amd/display/dc/link/{ => accessories}/link_dp_trace.c (95%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => accessories}/link_dp_trace.h (91%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => hwss}/link_hwss_dio.c (99%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => hwss}/link_hwss_dio.h (99%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => hwss}/link_hwss_dpia.c (100%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => hwss}/link_hwss_dpia.h (100%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => hwss}/link_hwss_hpo_dp.c (99%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => hwss}/link_hwss_hpo_dp.h (98%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_ddc.c (100%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_ddc.h (100%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dp_capability.c (98%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dp_capability.h (85%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dp_dpia.c (99%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dp_dpia.h (100%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dp_dpia_bw.c (100%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dp_dpia_bw.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c
 rename drivers/gpu/drm/amd/display/dc/link/{link_hwss_hpo_frl.h => protocols/link_dp_irq_handler.h} (80%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dp_phy.c (98%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dp_phy.h (93%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dp_training.c (99%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dp_training.h (98%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dp_training_128b_132b.c (99%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dp_training_128b_132b.h (100%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dp_training_8b_10b.c (99%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dp_training_8b_10b.h (100%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dp_training_auxless.c (99%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dp_training_auxless.h (100%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dp_training_dpia.c (99%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dp_training_dpia.h (100%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dp_training_fixed_vs_pe_retimer.c (99%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dp_training_fixed_vs_pe_retimer.h (100%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dpcd.c (100%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_dpcd.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.h
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_hpd.c (100%)
 rename drivers/gpu/drm/amd/display/dc/link/{ => protocols}/link_hpd.h (100%)
