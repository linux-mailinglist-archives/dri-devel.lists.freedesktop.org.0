Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2554C49D989
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 05:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29AD410E254;
	Thu, 27 Jan 2022 04:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4803310E22A;
 Thu, 27 Jan 2022 04:10:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYhWKpAzb6Q17HJc+LHw1hNZK3rm10RO6f96b43LN6RX+b8DJPON0vQjhlSLle4mceqH6q0mW91TMKtPVKHW7Q4/gZ76fmEbNBWMhZFzOMdFQ5+tB3Q3Bi9YoZLiOpEONkIbAwTCx9tk/4kDvjGA3jkpGuazN+VslbTQs9vQnDyUxQnoR0nNhtEY4e32aeKrTNkKvco8rpRYRjFYGoAUEBA6ffSqldde0YDIm6CVPpinRr1VMSXsiy6n7WquZIyHjFJNyoDD+2AsSvc1vPnzYTgzFHH6j2Ond7/M1Bri/I9gX9/25dVL2MRL5FJKQfMgNmutuzTUKZxvu8iDmwUR4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5yJiRCuTDWn0evDsIPBcGmjgs7nie5+61UDMm4lWMU=;
 b=fuCqFkFV+JnAqZ5nZLbXEMpGHzvaFZTeYpgtOBQO/Oqi0VrP8fT3QGRyQfzBMuk8Joh4T8Gcb1UCDBRT8QLingjdlsGdy993KX258sRNDqBgkzWA7SwcR2dMxslac7A3Lup8Y7RGZm7DwNoB7WesPG9HiAXRzpWSCFYjifSbMsGTNeik5TiaD4qodmEdRzpCLIHiVmdQ0fo1kS/veLlmg/YWn/3AkaXFuvPUAMxuEWYHOkj1ui0mj4auw/LhRWYqJtfue4uJFFum9WBiRcWOGYXWigb3DLonG64p2zPWrrPLw4rQQ/73CZXq+43ZX1qWhPVEyxlAxrhl8nCEDNRR9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5yJiRCuTDWn0evDsIPBcGmjgs7nie5+61UDMm4lWMU=;
 b=5dg1B8y6ZtnQPAXH4rhBne41Sp6hlvvsstPRof8O9fkqlCH3DNV9O5MJ/0f0VkX2L6WsN5iV7pS7HmCGL83jfFTxvX5C468oX6NTPwoZ4VuJbMMkTLiJncAztpSPdywNMjsLvSwr7Dg3TdWYX9Bt0YDt2Hh04T3jzOv1YeccTOk=
Received: from MWHPR1401CA0022.namprd14.prod.outlook.com
 (2603:10b6:301:4b::32) by MN2PR12MB3790.namprd12.prod.outlook.com
 (2603:10b6:208:164::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 27 Jan
 2022 04:10:25 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4b:cafe::22) by MWHPR1401CA0022.outlook.office365.com
 (2603:10b6:301:4b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 04:10:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 04:10:24 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 26 Jan
 2022 22:10:22 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-5.17
Date: Wed, 26 Jan 2022 23:10:06 -0500
Message-ID: <20220127041006.5695-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7de7f5f3-4324-4fbf-9f2c-08d9e14af153
X-MS-TrafficTypeDiagnostic: MN2PR12MB3790:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB379033AD819BD77D490F8C0AF7219@MN2PR12MB3790.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IEA2MXlEvCfK8jw5BVnCrJavPvQefETm0iqLQkadIilfkLv+MLTOp02sO+66tnK6+VSMiVmNeALhq+sXMyCJudb8aQDew35fZsC1Ku5n2igVxtvkqVOWTZ22ydGXuViEewbREKe7km085D0S1ndkMZqP/0mahyNCst3KUBI9paB4oqCtCD50881VouwSsEb9gPpd8SqQ+DC3f1cNuHsPZv0BpI0L6c8mv1Ma2Mx8Ptf4jrYS2oOqZvAuxFqItR6i1oZ7tyEJ5SIKXus57rV1cCbOjFNfI5SluEX8U1dyrwfjibJ5QMzduXpDQKELV/kkfvH4IceXauBP4623Rd26aX0kjjQUqcQ8n/LlUuqKNdRqYfIF3AeFlfTEN1/qq2G6xptFM+qfoqVZKOUn2lusm4v3PMbHdVvILQj0NnN2OUotym2POb+Mrb1i+XLAiYdPfOR44NjqqURnb0I2eBAWP0ukVLgH3u1zxQMwc7YWpTEIyabYMoE5k2FCjKtgjWm0AbvK+anrXfzPlXzsAQRgSnmluAELx6+CtPhLU65zYQG6FwY7WQfelTxjYsEjp1GjVFIqJwBQPjZ07oDGr7REdmHzxudDBTHaftp+Rtbzkc0qu+APKBXRtOlYkVr9fTeV+o8ZWXGmMGbG7jvYv4s7SdzIIk3TvbkBSKVxH3PDK9iC16ic1/YrY8nICeICEX5LDgX6Y029tVGRgAG+fkZV7gY9tJCWRoyQgiOuJPs3rItmLqHsI/AiK8tglLwsB3akSALLBFzeTihfnb+RVFpIMLsKWZvRZW9H3zslvT66PzA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700004)(46966006)(36840700001)(47076005)(36756003)(356005)(82310400004)(86362001)(110136005)(83380400001)(5660300002)(966005)(508600001)(81166007)(6666004)(36860700001)(186003)(2906002)(7696005)(336012)(426003)(16526019)(2616005)(26005)(8936002)(70206006)(70586007)(40460700003)(4326008)(8676002)(316002)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 04:10:24.0536 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de7f5f3-4324-4fbf-9f2c-08d9e14af153
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3790
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

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.17-2022-01-26

for you to fetch changes up to 2a807341ed1074ab83638f2fab08dffaa373f6b8:

  drm/amdgpu/display: Remove t_srx_delay_us. (2022-01-25 17:54:23 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.17-2022-01-26:

amdgpu:
- Proper fix for otg synchronization logic regression
- DCN3.01 fixes
- Filter out secondary radeon PCI IDs
- udelay fixes
- Fix a memory leak in an error path

----------------------------------------------------------------
Alex Deucher (3):
      drm/amdgpu: filter out radeon secondary ids as well
      drm/amdgpu/display: adjust msleep limit in dp_wait_for_training_aux_rd_interval
      drm/amdgpu/display: use msleep rather than udelay for long delays

Bas Nieuwenhuizen (3):
      drm/amd/display: Fix FP start/end for dcn30_internal_validate_bw.
      drm/amd/display: Wrap dcn301_calculate_wm_and_dlg for FPU.
      drm/amdgpu/display: Remove t_srx_delay_us.

Meenakshikumar Somasundaram (1):
      drm/amd/display: Fix for otg synchronization logic

Zhan Liu (2):
      drm/amd/display: Correct MPC split policy for DCN301
      drm/amd/display: change FIFO reset condition to embedded display only

Zhou Qingyang (1):
      drm/amd/display/dc/calcs/dce_calcs: Fix a memleak in calculate_bandwidth()

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            | 81 ++++++++++++++++++++++
 drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c   |  4 +-
 drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c   |  1 -
 drivers/gpu/drm/amd/display/dc/core/dc.c           | 40 +++++++----
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  6 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  | 54 +++++++++++++++
 drivers/gpu/drm/amd/display/dc/dc.h                |  1 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    | 10 ++-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_resource.c  |  4 +-
 .../drm/amd/display/dc/dcn301/dcn301_resource.c    | 13 +++-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |  3 +
 .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |  2 -
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |  2 -
 .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |  2 -
 .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |  2 -
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c |  2 +-
 .../gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.h |  2 +-
 .../drm/amd/display/dc/dml/display_mode_structs.h  |  1 -
 .../amd/display/dc/dml/display_rq_dlg_helpers.c    |  3 -
 .../amd/display/dc/dml/dml1_display_rq_dlg_calc.c  |  4 --
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |  1 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h      | 11 +++
 22 files changed, 208 insertions(+), 41 deletions(-)
