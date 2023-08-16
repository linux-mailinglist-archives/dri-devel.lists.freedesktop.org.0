Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7705977EA4C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 22:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D64F10E3AA;
	Wed, 16 Aug 2023 20:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6757210E3A5;
 Wed, 16 Aug 2023 20:03:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPNwUCqxBbjDb+9xsDBAzT8bpYIgUQQxvhaZYzB8lOfG4V+tahu5cg9Q3G9YwK8lKsw3Dn+tiBxkYbVweFcrSQviDSqkrqjoej+0BxyJq8OvMTetcyNpnLlPD4dgOi3USz4W1AFN1KbmxUF9VnST0GPkb/wPftGQ5mSF+Ox2hiIUVOpwLoInxG2LXyzjF5dpeqbvt7ttr8KvYwwLLK0gqNL/3WnsHLCSvWT3SNlyW4eQ3VBQnXz/1rZ1RtOjAK+x8eYHWTMPC9f70I8gLj2hrKG+OZtlbzM7FXxvJG9LpQiUAqCG4AB7fILXJxTNsKfu4ZkRXniSISjT6hirNW+A3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHR3QAqQ26DXtUNLi0uQOuGOlWULvHVC1+heA02NSoQ=;
 b=LoiKtY1L7JpFoVbTO1BzTu4ldIxMHGLg7Bc3MWaBlFw3C+i/H7h3vZjevGkiF972pGS+hNx9UFPZMWDdCimuOXEyO6deVqxQnpfSztdIpILj2uELyMLQVV5ZTKYHBrzH0e1Ny97I9M7t/1syrEbp527btM8hNEzg2a3MEFEmEt7LMPHwW1x9plvfncpUN9HzMyizdBQcH2ZCecrfG/QKxkXhq/ufbHlRqZeCBQU/WtX1GB6EMRSARFRBjtzvHLbFbSlPb5shWYQsAm9yEZYcg+GE88/Vubly5qPPXdmefcXVbLnqM1R8c51VCN20W58pGaAPSMJt91djbsI479eT/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHR3QAqQ26DXtUNLi0uQOuGOlWULvHVC1+heA02NSoQ=;
 b=yub9KbL09aBPumnUeokgIgN96x2tJy1FgcrnJgdSaEX7kzo3r1U1JrmljKxBrmswXyYRW7Frtqo8icXJBVf4bwefxNucBYKaZLhkRGGp1Y0pmuEaZcIzCIodUpIgr2TI2WkPWjt/ndB5Pe5bK9wnbjDpE6TK4fWDfl7ZfiCpRvA=
Received: from CY5PR19CA0112.namprd19.prod.outlook.com (2603:10b6:930:64::12)
 by SA1PR12MB8743.namprd12.prod.outlook.com (2603:10b6:806:37c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 20:03:04 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:930:64:cafe::17) by CY5PR19CA0112.outlook.office365.com
 (2603:10b6:930:64::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.15 via Frontend
 Transport; Wed, 16 Aug 2023 20:03:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.140) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Wed, 16 Aug 2023 20:03:03 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 15:03:01 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.5
Date: Wed, 16 Aug 2023 16:02:26 -0400
Message-ID: <20230816200226.10771-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|SA1PR12MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: ccadbe2a-b656-429d-9eb3-08db9e93ccde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rK6jRI6kkOKiOzhvRzw0//IzgK/RQTP94NFPLknqmk4iPS8FGUNDOM25WeqWRjoJbGDhRLciquvWj2ZODLV9L5ELQrbLbIff936FDtKDYNONNSLae8BkhhHH7Bck/5O/O08rN2CCPoLhwVnfvFzOwlMcc7YUN29QVaVrkK0EEYMNQJUhZj7ap3+/L+M27ozxi5n9btHQAFQvvw35lIX3w2mOuojfSr4Pb8/pbktbAbPPs+LstNLtdcjZ5Ra3z8xUtnvQAKrMOE7KVqWzsHKokOcgfDSgfLyoCMZkafpDIt+YWeKQiX12XURBbkM5Ogx5qyL3dQGeWZIkFKVvB8WXAoYlL4uAg4a0+1Cr5MlUMe70OYSOoMBXpVBuIlzreg0jPCsyGMVz3aaKDpQlW1EFZqvcXvCkBL1Kbwpr8ur9uxtaif0BnSIQT/i/92EasZVtdfV+piNCYegApKlJaPREBrCDNCGNZIPToR/yGJJPEewDu26oxEltaA4ZH56mgx+7jt3sbTBWTIfNzmD8obcU2B5AZ22EaH2IWX5Y4dzalzbBvM9c4jKABqO5NoU0xRFVqrL52HYJG3glUOF94FLd6u14SYwvBpGRb4Ed2k8IyKgjcTPv4oIOblrnfuxE5ciYMiKUVaCSoXdN8tAyyC7exkWLaDcOsCEDRHcpQ+PzqZ/yl8uzpYPZbOtaHe4P3Si0sGs2FHFWZOAx+e/1Z7KpTwN/Rvyk9KwqS8zGqL7n9XzUUSOEOLwNSbGCUhLSRA8H
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199024)(1800799009)(186009)(82310400011)(40470700004)(36840700001)(46966006)(316002)(82740400003)(356005)(81166007)(110136005)(70586007)(70206006)(966005)(5660300002)(41300700001)(36860700001)(47076005)(8676002)(4326008)(8936002)(2906002)(40460700003)(83380400001)(26005)(16526019)(40480700001)(478600001)(426003)(336012)(86362001)(7696005)(36756003)(6666004)(1076003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 20:03:03.6642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccadbe2a-b656-429d-9eb3-08db9e93ccde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8743
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

Fixes for 6.5.

The following changes since commit 2ccdd1b13c591d306f0401d98dedc4bdcd02b421:

  Linux 6.5-rc6 (2023-08-13 11:29:55 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.5-2023-08-16

for you to fetch changes up to 6ecc10295abb2fdd9c21dd17b34e4cacfd829cd4:

  Revert "Revert "drm/amdgpu/display: change pipe policy for DCN 2.0"" (2023-08-16 15:46:40 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.5-2023-08-16:

amdgpu:
- SMU 13.x fixes
- Fix mcbp parameter for gfx9
- SMU 11.x fixes
- Temporary fix for large numbers of XCP partitions
- S0ix fixes
- DCN 2.0 fix

----------------------------------------------------------------
Alex Deucher (1):
      Revert "Revert "drm/amdgpu/display: change pipe policy for DCN 2.0""

Asad Kamal (1):
      drm/amd/pm: Update pci link width for smu v13.0.6

James Zhu (1):
      drm/amdgpu: skip xcp drm device allocation when out of drm resource

Jiadong Zhu (1):
      drm/amdgpu: disable mcbp if parameter zero is set

Kenneth Feng (1):
      drm/amd/pm: disallow the fan setting if there is no fan on smu 13.0.0

Lijo Lazar (1):
      drm/amd/pm: Fix temperature unit of SMU v13.0.6

Mario Limonciello (1):
      drm/amd: flush any delayed gfxoff on suspend entry

Tim Huang (1):
      drm/amdgpu: skip fence GFX interrupts disable/enable for S0ix

Umio Yasuno (1):
      drm/amdgpu/pm: fix throttle_status for other than MP1 11.0.7

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 10 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          | 41 ++++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  9 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c            | 13 ++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  9 ++++-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |  2 +-
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 14 ++++----
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   |  4 +++
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   | 19 +++++++---
 10 files changed, 93 insertions(+), 30 deletions(-)
