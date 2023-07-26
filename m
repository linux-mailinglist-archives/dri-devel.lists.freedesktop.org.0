Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6462A763EEA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 20:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746FA10E204;
	Wed, 26 Jul 2023 18:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359F010E204;
 Wed, 26 Jul 2023 18:49:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMEeXCFG/JiX4q4WmG/Ko4y0UwYF7ScsF+N2aTJF0neoQVzvq32D2iINDISjV9lJWEY3hTFIS2bE1R2lS7b07M0GgNDkoWOsp1suYq8BGbW+0n7Mkq0rHg1lJBzewl6w0w2mI5MBouJ39xpYZ9ZyNL3w+6X9zcovAk74fm+ghG1s9VEoYbGWk/4fEPYUytR5UCYfZnDYi9e0x/NYLqx074kTihH1AmqNKIpbMMVrQ8Rwssf2TINzl4TWF2rYklX1Y23vVudin4f7Uf09RpWWYnGvj0cferOtqAk4YiMMenZzNMFMgg3e874tOQRoK63XuivSxDTMioLYK3bhaGN6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKRUTqTYB10x2tjvG8sVEDotHnYKcEGV/PCI7D9VIxg=;
 b=HGoKwYJBC6eCoT2FCp+bvnkTWoBoAOw2n0lNLiuwlutQmFaTbGmfqRF5j35qIEQSjrQKL51VUYNw/AI2XuHuxRpr3NzPgvXTUloGWFc1gBLlTv+MoGfcjGvDL1me0jKrZla9hPwgVoRRd0oD4GFC1bkaSnS/J+t+l8hxwYGXXXwZeiq2WE6FjsDkN2xxCBPVhZV7PYEGX3Cp4wLYtgCQZOKQHrVg/2QQNVqFZ8hEl7LVaPYZfMGYNm0EfEeNc/yNzd4z8NHia0tXfxhvuOV8FKoQzBDmo38bOpmTuecXskBWoUI2Sn3TjZodNcSoObVeIZSENlTVgC+cZKfCITAk1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKRUTqTYB10x2tjvG8sVEDotHnYKcEGV/PCI7D9VIxg=;
 b=t8AmbsICscHY4EF28+04yIH0DMJdZc28idOmEZLiTEWssjJJfH8FyklFy5kpsn0E5gLb5VndHJT/Q1k/hyH08cfyjkCvKbeO3SUz1hBhHe41bphChfnZRxy5RK3glb7Jep8K4nyIw7tYAKvLciwWksqCBgaqoN34jxQ2rHVT/bc=
Received: from DM6PR14CA0045.namprd14.prod.outlook.com (2603:10b6:5:18f::22)
 by CY8PR12MB7413.namprd12.prod.outlook.com (2603:10b6:930:5f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 26 Jul
 2023 18:49:56 +0000
Received: from DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::c7) by DM6PR14CA0045.outlook.office365.com
 (2603:10b6:5:18f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29 via Frontend
 Transport; Wed, 26 Jul 2023 18:49:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT047.mail.protection.outlook.com (10.13.172.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.29 via Frontend Transport; Wed, 26 Jul 2023 18:49:56 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 26 Jul
 2023 13:49:55 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.5
Date: Wed, 26 Jul 2023 14:49:36 -0400
Message-ID: <20230726184936.7812-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT047:EE_|CY8PR12MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d555a6-10f1-4551-0b31-08db8e091b4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pgc6DJpE0f/btHiX1RiBa3rARIkTWOwoUTFEHSjrLID6mXiY0bUigNMOwlbymQBvWZRZKOy4UpGUVKoUTYyH8mMJ0V9etA0rP2gkUtLiihEL/peh3ccGJL+ER7e9pv2Tx3WrJijz7yMStiythdOQ+XR9QO8wxP3JaJv3cZs2VkJz2+PsSNLpdlTMcrP2PgYvCKcu0bXPC9E9PchtrHOD67wGNgWDd1hhM4MhcX1N06yxF2kdSgT2j0C/gvK0gAuN+KyOg5ex9Oe6CvaGmP2wwwq6ewhqbRLKaOPwHUu8K4UTKgPVrMcGB/KtOB2t3z4Dkci3bLw28wU1BNzE3hxqzyQ6kB1Ml3wrFcjZlKjUXmISUrqEI9xwIgG7e/6G5tGd+9MO9i2FzbNinvcm/ti9fFnHqsN5YkLe/xHeY6bPsshY7QNMuISFdR6vF1gemPWS8x52dg4qHkXCGUKRa3IKKReRufgVrccwQ3FRJGwCufCrDJx94aR/ehpjxjOM5PNvN979IxqWsfBCu0UQsMVd/qQ3rKYyA/3g4h+X7bDivtQLsAN338qZ3q0nxBI48o0Iq+OqQUnMRdU+nJzUuUOoGEzmArBLqg1GrapoRUHAEeODYJfdeVDdbVqy1f1nbZIWA7X/Ce1QI9sXHjmgZu5yRZ+w5UuKbfprenmlawe7v/ONGNunkCOexq1YA09/nnb3z0aw9L1yp11OXqWZvbfbEPhxcMdvwVdTtlrrOyn6jc6GjA0oaRGJLujgPhzZOTnhHO702Q+Yjw3CcEgnNHi6KhyMF5S0Qe/GPJXIKvuJgWA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199021)(82310400008)(40470700004)(36840700001)(46966006)(36756003)(478600001)(6666004)(7696005)(966005)(26005)(336012)(40480700001)(16526019)(40460700003)(1076003)(81166007)(86362001)(186003)(356005)(110136005)(4326008)(316002)(70206006)(70586007)(82740400003)(8676002)(47076005)(2616005)(5660300002)(426003)(2906002)(41300700001)(83380400001)(8936002)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 18:49:56.5338 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d555a6-10f1-4551-0b31-08db8e091b4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7413
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

The following changes since commit 28801cc85906ea62043e62c71def7f9daaf1c168:

  Merge tag 'amd-drm-fixes-6.5-2023-07-20' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2023-07-21 12:16:47 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.5-2023-07-26

for you to fetch changes up to bc1688fce2ec7726112276650762275392d1bab1:

  drm/amdgpu: Restore HQD persistent state register (2023-07-25 16:26:38 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.5-2023-07-26:

amdgpu:
- gfxhub partition fix
- Fix error handling in psp_sw_init()
- SMU13 fix
- DCN 3.1 fix
- DCN 3.2 fix
- Fix for display PHY programming sequence
- DP MST error handling fix
- GFX 9.4.3 fix

amdkfd:
- GFX11 trap handling fix

----------------------------------------------------------------
Alvin Lee (1):
      drm/amd/display: Don't apply FIFO resync W/A if rdivider = 0

Dan Carpenter (1):
      drm/amd/display: Unlock on error path in dm_handle_mst_sideband_msg_ready_event()

George Shen (1):
      drm/amd/display: Guard DCN31 PHYD32CLK logic against chip family

Jane Jian (1):
      drm/amd/smu: use AverageGfxclkFrequency* to replace previous GFX Curr Clock

Jonathan Kim (1):
      drm/amdkfd: fix trap handling work around for debugging

Leo Chen (1):
      drm/amd/display: Exit idle optimizations before attempt to access PHY

Lijo Lazar (1):
      drm/amdgpu: Restore HQD persistent state register

Mario Limonciello (1):
      drm/amd: Fix an error handling mistake in psp_sw_init()

Victor Lu (1):
      drm/amdgpu: Fix infinite loop in gfxhub_v1_2_xcc_gart_enable (v2)

 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c                     | 6 +++---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c                     | 3 ++-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c                    | 5 +----
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c                      | 5 ++---
 drivers/gpu/drm/amd/amdkfd/kfd_debug.h                      | 6 ++++++
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c       | 6 ++----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 2 +-
 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 3 +++
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c           | 3 ++-
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c           | 5 ++++-
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c        | 2 +-
 11 files changed, 27 insertions(+), 19 deletions(-)
