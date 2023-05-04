Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D4C6F639F
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 05:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBCC10E10C;
	Thu,  4 May 2023 03:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4036810E061;
 Thu,  4 May 2023 03:40:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQ65jawobqMSaj0rDBUH8YpgIWOwCITWl9nZ9dBvOCkskuutnYP/405TVF9+6QWjoWA54aZiTiyJCAyB0vR2G0+6vihYEdL2NxWWpoBC/YLrhh3a4i/Gaj99feVDBcRnGGyHu4eYMalC7eUEcjINrYFAY4NuhflDRL387/7J1Pk6Oh7Zz2FmwMktYYNYn09ww020U8uKfFFhnd4jDpccrECVVxg5aJHaUFzo6O6RFfD6BJXAOYXEfYHe+ZltqJ0qyPe4AKOJ1dI8XMCBVIn27rCrXbXniNf4eQ3WGVKp5RrAYKn70KjRF9/ulMc6xDxExhuzA/EqJ3um5GhKEEFETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4GYArGGYZcud5hBA923b4Kuy09WuFA/Hvzy/GQ7miQ=;
 b=KV2iNrVfTtLCbdRMiINRfZsdbxmVnT74s36VPv0U/aJs/03Vcc57GAmNtD4QD/R6xiW1Mmn4MZNbI3hkP4XdQsSRSojjueLKgJtOJ4YTNml8S2/8b1WYiSTji32Sjv/NWGaDwzio8BkSWFpSdhqX9bR3uLg4izz+PCkau9YQPdjBXk9zTqZcZENVkhwSwyexewPpg0fMy0LgBGF1tKTOAnKP7rNLf5/ONhzkP7qrhwvVJodkHPF2KrRBMMdIpFnwUXYeEU+ndQkZ2zwY4zKFN0YKrZ+aF6N8XEcm8ICUo8+tqa9S2xRQicD4l7TNdaSL1VHZz5miJScGgWIKVPgDQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4GYArGGYZcud5hBA923b4Kuy09WuFA/Hvzy/GQ7miQ=;
 b=vKiEBtzU/D3cmr/skxd8dnDvA3VR3h5GDnRksC7IGwP+Gpn6bAe3+Z2NLORL088F/APQK5fuEsEGPCOMolO/NL/AVJLKkkb4JXu23RH4kcXPQORJFy+Ad5RE0qYR7Srrjhf1z6dpDbnDxNeepspYGlD/s4yfFUkjKmu7GILhqH8=
Received: from MW4PR03CA0070.namprd03.prod.outlook.com (2603:10b6:303:b6::15)
 by SA1PR12MB8600.namprd12.prod.outlook.com (2603:10b6:806:257::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Thu, 4 May
 2023 03:40:40 +0000
Received: from CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::78) by MW4PR03CA0070.outlook.office365.com
 (2603:10b6:303:b6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26 via Frontend
 Transport; Thu, 4 May 2023 03:40:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT053.mail.protection.outlook.com (10.13.175.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.26 via Frontend Transport; Thu, 4 May 2023 03:40:39 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 3 May
 2023 22:40:38 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.4
Date: Wed, 3 May 2023 23:40:18 -0400
Message-ID: <20230504034018.7950-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT053:EE_|SA1PR12MB8600:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ab20620-3c11-420c-ff7f-08db4c51547b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qK8AsciKt4jJmqWmRD/xrUt45tJoZjJCS1yNUP0tsDfx9YewkukQWNkbHpdCUUMGN3IMqg9zTGr2XjwtU8Kk05rmuOMr/4i4T9oGs4RPLFydKx8vzl4gStw94sCJ8KEQVvGQ/eL96eniDNcxuNrgIqnFK2rSRSWuJMKblahHl8j+M/UfB2NinbQxI1HPB7YB7KGg646F8n0NqSS0MUYTeO602/CqlAYbfCYRhE1qB2+EC3GNLWYlDCZ1Ls1P1KrXpusRi1uav3DO7SNpwPSltR11mvsUMNqyqEK5UtKZ0ncYWy3tlm6T5L5bif4l6/J+13rb3ksStFNA2Yy5yaHcETKA8dvRXX9ISNF7dCrCtEL/QKiuP9Q/wyrn77o/2WN3mBFG+enJ3sW6NkXhajDixmi/CmvhmREilL4lkuBt5DuRo/U/7hTC8ZZ6tKHGoFW/FLsWhXnUfR/J29wpL6O58dai5Pm+9bQj1pEINT7pMWim3SR9qhXfvVjJU0R5MrCcbla1i0bdpkiOoCNz3A0Bdyl7ATFjc1bqr9Yy4ICFEAsX1wrX/3RFHFbOnOvkrjLpO58LvbCpJvj5SxXs+P3pHIJeqK7iBfY8n1jhn10/rkBacyVK+siBh+aXhC2Gl7cz1MJLpNJBN1LeNigc3Mbm15ND0aOcx+TtUCRMY9JpmchbiLgiNXT3EFaYOFXe2qTv
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199021)(36840700001)(46966006)(40470700004)(2906002)(70586007)(36756003)(70206006)(110136005)(966005)(4326008)(316002)(478600001)(6666004)(356005)(40480700001)(82310400005)(41300700001)(8936002)(5660300002)(8676002)(82740400003)(86362001)(36860700001)(426003)(1076003)(16526019)(40460700003)(186003)(26005)(336012)(81166007)(2616005)(47076005)(83380400001)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 03:40:39.4969 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ab20620-3c11-420c-ff7f-08db4c51547b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8600
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

Fixes for 6.4.

The following changes since commit d893f39320e1248d1c97fde0d6e51e5ea008a76b:

  drm/amd/display: Lowering min Z8 residency time (2023-04-26 22:53:58 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.4-2023-05-03

for you to fetch changes up to 1253685f0d3eb3eab0bfc4bf15ab341a5f3da0c8:

  drm/amdgpu: drop redundant sched job cleanup when cs is aborted (2023-05-03 23:10:02 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.4-2023-05-03:

amdgpu:
- GPU reset fixes
- Doorbell fix when resizing BARs
- Fix spurious warnings in gmc
- Locking fix for AMDGPU_SCHED IOCTL
- SR-IOV fix
- DCN 3.1.4 fix
- DCN 3.2 fix
- Fix job cleanup when CS is aborted

----------------------------------------------------------------
Chia-I Wu (1):
      drm/amdgpu: add a missing lock for AMDGPU_SCHED

Guchun Chen (1):
      drm/amdgpu: drop redundant sched job cleanup when cs is aborted

Hamza Mahfooz (1):
      drm/amdgpu: fix an amdgpu_irq_put() issue in gmc_v9_0_hw_fini()

Horace Chen (1):
      drm/amdgpu: disable SDMA WPTR_POLL_ENABLE for SR-IOV

Horatio Zhang (2):
      drm/amdgpu: fix amdgpu_irq_put call trace in gmc_v11_0_hw_fini
      drm/amdgpu: fix amdgpu_irq_put call trace in gmc_v10_0_hw_fini

Leo Chen (1):
      drm/amd/display: Change default Z8 watermark values

Samson Tam (1):
      drm/amd/display: filter out invalid bits in pipe_fuses

Shane Xiao (1):
      drm/amdgpu: Enable doorbell selfring after resize FB BAR

lyndonli (2):
      drm/amdgpu: Fix mode2 reset for sienna cichlid
      drm/amdgpu: Use the default reset when loading or reloading the driver

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             | 13 +++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  7 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c          |  6 +++++-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |  1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |  1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  1 -
 drivers/gpu/drm/amd/amdgpu/nv.c                    | 23 +++++++++++---------
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  5 +----
 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/soc15.c                 | 25 +++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/soc21.c                 | 23 +++++++++++---------
 .../gpu/drm/amd/display/dc/dcn32/dcn32_resource.c  | 10 ++++++++-
 .../drm/amd/display/dc/dcn321/dcn321_resource.c    | 10 ++++++++-
 .../gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c |  4 ++--
 14 files changed, 78 insertions(+), 53 deletions(-)
