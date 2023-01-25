Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D95C267BF82
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 23:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983EC10E1FF;
	Wed, 25 Jan 2023 22:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6AD10E1C2;
 Wed, 25 Jan 2023 22:02:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Np/GgQS5hgvusZkXVZ9hIS4laK23f2emhRwu9ZDUZPTLFuzzl6dfSgvTxxkmx5XbJssXILllbdwAdAt/bQOWWIdwCiLPyI/JHjeHTTs5AdZoqpJBGQVdVtJWIwsQ2w2dvlrk5DqSGQSekAl/nameXrYB3CsF86TpM7/VCgLfbgGO3Ng4a0u6+l2teQ1YUnF2+AEKBsrcIxM1z/29sPO6DzPie9HRgya7sOU2pBdOXiKRWSoSqADK1A+nlMUG6Q1Fnni61XrpAfP8WgdudYeM4sx1AnKY/dTLI92SSjSPgPGt9g8ltMUBd2SFYeQHaKJWypHDYLD+6WWKti8eB6KT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkS2YKSuDYgUQkXqzBjqZmKYYflqkeoKN1vnBdaX36A=;
 b=lHuyfhV7YJvaJx0ISw51bJ2xXs7SoMff6/czKJuxehpHi3zmkAGUz/JE/P5BJT1I6LV73kCldURy05xOfvQdoNdxeYqvshZQsDdR2IumfJhrpVLo4sS1DOqXUJmdnEbhkvP5oeDNMEGEzS5FqCxxze0PPLGjkn0/vsytKSMkn7/7nQSxq1Ho8+2ZCDcaVllLrk0K6Pqd5s4qKBm5rqJg9Xn4KoqoGoyVCkugHuoVGOhcktRxOdyd3VW9dQNLmDdwR4qogmG22czr4eHC3/9wGyorkt0muu7pFZR3Vi8CHzz87csqXvpffoxlcNTTzIdneqlJKEAVVAVNJQ8mPv5k4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkS2YKSuDYgUQkXqzBjqZmKYYflqkeoKN1vnBdaX36A=;
 b=xCw3SscNm+jrEG8oN66z4IbhMdxGpghN8t3sZND43SKQRCvctMIRWYqlsI6eusHfmj0aXRwLRJu35jeoFQzFZ3STCel/PqDNEsNnSZ5eCVdHm8S7T72JnJfX+rgm8DuaSv2tCozulv/Z4A52cg3nGH2zdo0EIoqurMYLNx692i8=
Received: from BN0PR04CA0082.namprd04.prod.outlook.com (2603:10b6:408:ea::27)
 by SA0PR12MB4383.namprd12.prod.outlook.com (2603:10b6:806:94::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 22:02:16 +0000
Received: from BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ea::4) by BN0PR04CA0082.outlook.office365.com
 (2603:10b6:408:ea::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 22:02:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT020.mail.protection.outlook.com (10.13.176.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 22:02:15 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 16:02:14 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [PULL] amdgpu, drm drm-fixes-6.2
Date: Wed, 25 Jan 2023 17:01:53 -0500
Message-ID: <20230125220153.320248-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT020:EE_|SA0PR12MB4383:EE_
X-MS-Office365-Filtering-Correlation-Id: da47f219-caae-4e60-61fc-08daff1fd207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CYH+bz7hK85pLCkjawoH8tQA8uQ9c+nOhXSaoBOb0Vb1M9Q5dhDTT1OcDwfOEgtUEOtaGJ4ZAAhaLJkeyeukqa+VIIIvr1mb4a7EycwSRZRiSwbUDWZU4CCRuRm7NpP1SdzGU44/pUjnlsistHSzVKCC1iPfDXiaDHPgnkA+xrQQ8I9kEkMiP9+T7F/a69uwo4P4PfiLc0kDbLMO1G31mrt10Su2bDjG8foRa7I2/pCDWF9be9aVa63muf1yaVDj7AKDoEytX9k+YMJKcxyVhTn3Dt8+C4heaaEkhs8swZyGoGAyOuCPneiM+AUByJML8IspRDGDqYH54cv7lCdP//SJACKNiGHy1PV/UmiX/fW3EtevCeX1OcjtiOVbSUsh752y2Rrkz7BmNlNKHCErnGnV94kZCx8eNwsOe87uMCeGaIBiCyNLL1ioGnnReqzfe7GKH/3/RWauYmMQC3LWoXCYLhfcFrdkx21l+7CukJ9bZvEf04NTYxX9R5bD6kzgCB49d9z18bq5yTsgR4PpjDyzWZK8YEr9PjHaEff1+rHE/URSz0iq4tVB1a8Xa5SL9VA2BgDnnO6bikmuxHuh2RQuWErJwGOzYXKnE1nKQFxPzNO24VxKULb8gskWg9y3ojtn55tTQuoLlwXuCvzbLzncjWRHvc0qX26q5FVKVvfFXCszN+5T5X3L3Km9sM6p
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199018)(40470700004)(36840700001)(46966006)(83380400001)(36860700001)(26005)(5660300002)(81166007)(7696005)(2906002)(356005)(41300700001)(82740400003)(86362001)(4326008)(8936002)(82310400005)(16526019)(40480700001)(316002)(40460700003)(6666004)(186003)(8676002)(47076005)(478600001)(2616005)(336012)(426003)(110136005)(36756003)(966005)(70586007)(1076003)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 22:02:15.8646 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da47f219-caae-4e60-61fc-08daff1fd207
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4383
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

Fixes for 6.2.  This contains a fix for DP MST that avoids the big revert.
There are still some corner cases, but it fixes things for most users.

The following changes since commit 3f30a6e67ce49c0068f8058893326db46b6db11f:

  Merge tag 'amd-drm-fixes-6.2-2023-01-19' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2023-01-20 11:21:20 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.2-2023-01-25

for you to fetch changes up to 4b069553246f993c4221e382d0d0ae34f5ba730e:

  drm/amd/display: Fix timing not changning when freesync video is enabled (2023-01-25 14:50:18 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.2-2023-01-25:

amdgpu:
- GC11.x fixes
- SMU13.0.0 fix
- Freesync video fix
- DP MST fixes

drm:
- DP MST kref fix

----------------------------------------------------------------
Aurabindo Pillai (1):
      drm/amd/display: Fix timing not changning when freesync video is enabled

Evan Quan (1):
      drm/amd/pm: add missing AllowIHInterrupt message mapping for SMU13.0.0

Jonathan Kim (1):
      drm/amdgpu: remove unconditional trap enable on add gfx11 queues

Li Ma (2):
      drm/amdgpu: enable imu firmware for GC 11.0.4
      drm/amdgpu: declare firmware for new MES 11.0.4

Lyude Paul (1):
      drm/amdgpu/display/mst: Fix mst_state->pbn_div and slot count assignments

Wayne Lin (3):
      drm/amdgpu/display/mst: limit payload to be updated one by one
      drm/amdgpu/display/mst: update mst_mgr relevant variable when long HPD
      drm/display/dp_mst: Correct the kref of port.

 drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |  1 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  3 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 31 +++++++++++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 51 +++++++++++++++++-----
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  5 ---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      | 14 +++++-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  1 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  4 +-
 8 files changed, 89 insertions(+), 21 deletions(-)
