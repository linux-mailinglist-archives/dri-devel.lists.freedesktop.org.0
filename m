Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D076B4768D8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 04:53:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1408810FE35;
	Thu, 16 Dec 2021 03:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6018610FDBC;
 Thu, 16 Dec 2021 03:52:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OF8jhWgu/yz1WXJfvymZh9XiAsSF76totDttnUCDYa9h6Wb0eBiC+q8zir28B1ADHMxEeLiQ4xsn6YRUQEC5tPEQtruUp7VhelDpzE3n34Bpr2F2izZQJfH68+qmlbdhEBNh5w3f/2yn6rvcpnVJ5gDWEYsM0pmX8JcfVqQSed41Eo2l4w3YviN5VSlPNSbpWaYlsJxF6NzdSbmyS8mo30YWUEmCv2nz9M8Es1OVpNUwy1TMUQbWxFwcpPaOH8NelmsrLkls6MQUn39BZY51QVr+lkbUkDje83+7hw4b2MVSkMEjEuPOZM6VL6J/JIsyr3PGXNjlpmptWJyDVU9Kow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4YwymTlgCYUx3W+ci+SQ303Z29QizvkYQGUzgZewjc=;
 b=aBceGwnJ8M2bvg7ErLKCfndG/gwXPwZfJ8+nwAJWNLVMA3azW9ptq3/6gqZJO2QELaInREROsgVtEb5lDJjIEoB19+SfakAw2ztsQdwbEdZmgZoov6QGgh/ilSD4i1Pa+0QWx6JDQyCtYUciFLeX167SfpE2cygLEWQwHiWW1Tapwfkb0z6bmDXLLWU+qpDVgvpSkPdTDsn9zsFhcp8pbXQvazjU3pMNXrt8qv1qojT6E+s4r3XRhURRXxERWJSthOLNm1d9XIbZsZoJ1kiBCAoPpT+TAIttDz/7bzEFiRjJj/3FTIjGaTzSSAxna89r/Ie/rLcNQm/WIb6j9KneSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4YwymTlgCYUx3W+ci+SQ303Z29QizvkYQGUzgZewjc=;
 b=P2AzsYaIhDBhFZcQP4NB2IcfLYyKXZsTEhz3KSYsqZ8drYgxYcwhnfF/rXFE2As5s1EtIUuHqk6seklkJp0Rc/Hb2qtvvCISG6FqxsOZuGxGZCRYXWH6VSDrP8LBCyin6EI7EUx7nGOjTgzBK5ittJGd23HwFwvaKczwZDR0Sf8=
Received: from DM5PR21CA0056.namprd21.prod.outlook.com (2603:10b6:3:129::18)
 by CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 16 Dec
 2021 03:52:55 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:129:cafe::63) by DM5PR21CA0056.outlook.office365.com
 (2603:10b6:3:129::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.7 via Frontend
 Transport; Thu, 16 Dec 2021 03:52:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Thu, 16 Dec 2021 03:52:55 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 21:52:54 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-5.16
Date: Wed, 15 Dec 2021 22:52:39 -0500
Message-ID: <20211216035239.5787-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 319818ff-e582-467f-4e1d-08d9c0478ac5
X-MS-TrafficTypeDiagnostic: CO6PR12MB5489:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB548959933B5974CA8C9354E8F7779@CO6PR12MB5489.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LoLldtRKxtE/DmZ6EZANC3HvToDzFrsBEM1EVOL1eyScX0XyJF5yBxobQvQ+EU6JfCIqmhSURaRX6JQhd2KncRfLhQIkMPdfEzbrJ2/G5YOpzkrhGozyLGzDUPLet2DEz+itSbCDQBDG6zeUYhGQnDMalIRUtUP/xgyOfZCEYTpipBvOZKTC8CLyQohDO08u1UlwdEK0htj4aI2EL8b6RLwbhfd34+4t0S1upm8xg+7jDDI9OGGeP9olDnFp8N5Lzh6IjLFeEibSMr9XrouVMD4/4rIT2aVAFlE7EAhMiFBUennEGnF67scOkw1Djjcxc635J1ix9VESVSI0N3XUSI3PTe91WHkyOwhTS/DYdGYM+5pF4eDTdBT28DHPatCHnDUtAILbQDNBjgF+8uM1I1tklrBlldOjPW0LiO/qJa4zN42PgJXT7cyYPQbI7X14wCKpObTJHtzfdQaiz37lQ7jgBiNvF5rFxeSOKj+pNqzUIHP77y/kLgtWD9jZookczOy/f8UcoNVIfQ/Rvnt/iOklUiosD85zVD6UKtXyXfTEcI45ha2QMTkq59HjBzBX44720d58Dqdatxo7ElZAGMNzYIj2/swOb4dcLNR/aEoKl8PQZknre/p4piJq9XE4bolq1jjED0gv7uM6RDuqQ0QJ51eGhzmj0YQf/XU04Q+dVgNAKxn7Mg8y6o2Ey6QP/lOKkSLf2LkjUCqbvZ/fs7fDp5i7x50pFL1OyJdLZE+p89qMNriAMJTxroq9nR/2HmjUpZMgDJmH+CsywL0selLwsojYLOKpW3fdk+QFuTM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(336012)(966005)(7696005)(1076003)(2616005)(47076005)(5660300002)(2906002)(81166007)(186003)(70586007)(316002)(110136005)(8676002)(36860700001)(40460700001)(26005)(36756003)(83380400001)(356005)(4001150100001)(70206006)(426003)(82310400004)(508600001)(86362001)(8936002)(4326008)(16526019)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 03:52:55.2229 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 319818ff-e582-467f-4e1d-08d9c0478ac5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5489
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

Fixes for 5.16.

The following changes since commit 2585cf9dfaaddf00b069673f27bb3f8530e2039c:

  Linux 5.16-rc5 (2021-12-12 14:53:01 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.16-2021-12-15

for you to fetch changes up to aa464957f7e660abd554f2546a588f6533720e21:

  drm/amd/pm: fix a potential gpu_metrics_table memory leak (2021-12-14 17:59:19 -0500)

----------------------------------------------------------------
amd-drm-fixes-5.16-2021-12-15:

amdgpu:
- Fix RLC register offset
- GMC fix
- Properly cache SMU FW version on Yellow Carp
- Fix missing callback on DCN3.1
- Reset DMCUB before HW init
- Fix for GMC powergating on PCO
- Fix a possible memory leak in GPU metrics table handling on RN

----------------------------------------------------------------
Evan Quan (1):
      drm/amdgpu: correct the wrong cached state for GMC on PICASSO

Hawking Zhang (1):
      drm/amdgpu: don't override default ECO_BITs setting

Lang Yu (1):
      drm/amd/pm: fix a potential gpu_metrics_table memory leak

Le Ma (1):
      drm/amdgpu: correct register access for RLC_JUMP_TABLE_RESTORE

Mario Limonciello (1):
      drm/amd/pm: fix reading SMU FW version from amdgpu_firmware_info on YC

Nicholas Kazlauskas (2):
      drm/amd/display: Set exit_optimized_pwr_state for DCN31
      drm/amd/display: Reset DMCUB before HW init

 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c          | 1 -
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c          | 1 -
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c          | 1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c             | 8 ++++++++
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_0.c           | 9 ++++-----
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c           | 1 -
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c           | 1 -
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c           | 1 -
 drivers/gpu/drm/amd/amdgpu/mmhub_v9_4.c           | 2 --
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 +++++
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c | 1 +
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c  | 7 ++++++-
 drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c    | 3 +++
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    | 3 +++
 15 files changed, 32 insertions(+), 16 deletions(-)
