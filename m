Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFCA7A8F6F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 00:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0F810E164;
	Wed, 20 Sep 2023 22:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F1310E089;
 Wed, 20 Sep 2023 22:30:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NaFVsZ4CfRG7ltVJtM7rOQfvVeiwoMOlTz09SNNQdnnG0Ja4x95Gp7SNw0WG8XeNPVMbbxT+z1gFMtSrBcW5mxUia2FqjSB7df0QRRu/iBXJDV/tQl4VBz/Cza0tk8hoouznAKPOi0WmhoWAdQwzpYnm7XEIfwrR+v7iABX3NagqeybBIk64eBgbDQrwFiXxdEvhQoiomAfkmmYo3kGgELhwJ0iS15VkcPj316Q7Kq+Ar9IjluW6ceTyOZ96+wh1hWkIHuKWvBM0kemd+8avSQTHX7EPxlCmHBRVcm8tPWvV5YodKFPqfbcS20XFEHJhGjQnwzNQiJ4xrygaDnH1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVbbefazgbBG1p/CdLVZXQ/9jLC3X7DvTFIbnWnxCXg=;
 b=oVA9JViGb90w04sNxGXkzhieGVJrMp88SVwHSm8mQlytR8XoxN/qPQONX4qY5xpmGfVj7LqjyW+c9O3HEvYq+MsknnWpm9b1NPCcpT/8McCCoc6w+YCa9uuPP0e6+eIW1IheutBkj2vmRep9SoXl0ECooXYNEi54b7XdKjUJYqiAf4k/kM+OzpL/fG/uNtZuCKgh41e7ABGJKyc1UDj7snXkWjDjNpB2Hs/KewX4TkzlHvBxJfudQ7MqaKYa7HgnXvwsHSVRLKzoDc3I+BQBQBLaE2vZblNaCMyURuodBMiy6alFb/dCI0BY1wqun/Qvzo10UPEhPlavuvHKexQjeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVbbefazgbBG1p/CdLVZXQ/9jLC3X7DvTFIbnWnxCXg=;
 b=1XYjLrnlY3U8FLhvW4WlPBO6FIXa+OuNVFVTW5EDRdtw8AC3hiQNsF5EYyA1keUWwdJMvXwaJIgRzJ6OOCEaH91X8MCDs7osoRpugDSgz/2zhsImCV2xVogm74fKGGBwaa7V6ee/KWZG2yCG8xAnYY2rVXZZ+HPlmmIsFXyO7rU=
Received: from SN7PR04CA0039.namprd04.prod.outlook.com (2603:10b6:806:120::14)
 by DS0PR12MB8341.namprd12.prod.outlook.com (2603:10b6:8:f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.42; Wed, 20 Sep
 2023 22:30:32 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:120:cafe::41) by SN7PR04CA0039.outlook.office365.com
 (2603:10b6:806:120::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.29 via Frontend
 Transport; Wed, 20 Sep 2023 22:30:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Wed, 20 Sep 2023 22:30:32 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 20 Sep
 2023 17:30:30 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.6
Date: Wed, 20 Sep 2023 18:29:15 -0400
Message-ID: <20230920222915.7789-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|DS0PR12MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c649cd9-8d74-4a03-f77c-08dbba29335e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4PbqEKSAMt+FKCV77dtNA9C/2HGWUSBn4+yr5luL0ygNieSDjQd4Sro52acYiC2mEoMuKTn8oJMkcXjA9OkLyMifuNd+CJIWiDHe5zSvHDrq/i6qO1vfMrbmICsmFq/W9SceTUwGuwtQ04i1+K3bXnWi17zcRXUJO9MFjxQI26VGfGBU/SETJ7MtaR7CdZvuBZMhBHP2Dgkers6y1uJEeLQhCHXQdARrixqlj8s4po5iWDaZclCi2a8LnI92mOYB0+pi+Oo5Its9v211BwXNypp2ASMs9IwTc3VDjqCM+co9dHd5QWD3yEqNs3nUmZb22NZn72bwLDYQoGXn4VFCW6aGWnUVrBhVrJnLOesyXCMlfiN6+flEMyRTn7iPCvnfZFrt9x7LxxBvT76L9MGNNxlGPqsO205+ksJIo+UZvx+Nl9TQx5+Qp6HP23jenBUYjj4z9RG0lYnmpVL15RELIcNhDR9bwQQx1oJNL0L6QvKv7QdqRZ7QhSwvgRJ7zlRKSbxGfNINM70G1lCz53p+qseKfWexPth43LjpxOfsQUTq2hPQqhnum9o5Y8zvgKEwKpwn8+X2+hjvMtcZVCL33/3ZM46YYEjNBwqn64WjFeiNp7sM2PupcxdXs1G8BUQaUEicGfkrgaY3xXusHcu44xvW2MwHRu1TQuJXTjtct0DIvFwvG+KvaGYlnTJf+v0SRO2dv9LYJgpQePp67neb93ewzEjIXE0gNqQVXIVEh1UFNwGMmxX20m5moVJzg12f
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(396003)(346002)(136003)(186009)(451199024)(1800799009)(82310400011)(36840700001)(46966006)(40470700004)(81166007)(40460700003)(356005)(7696005)(82740400003)(5660300002)(83380400001)(47076005)(2616005)(36860700001)(36756003)(6666004)(40480700001)(16526019)(8936002)(336012)(1076003)(426003)(26005)(4326008)(2906002)(8676002)(70586007)(70206006)(316002)(41300700001)(86362001)(110136005)(478600001)(966005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 22:30:32.0406 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c649cd9-8d74-4a03-f77c-08dbba29335e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8341
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

Fixes for 6.6.

The following changes since commit ce9ecca0238b140b88f43859b211c9fdfd8e5b70:

  Linux 6.6-rc2 (2023-09-17 14:40:24 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.6-2023-09-20

for you to fetch changes up to cc39f9ccb82426e576734b493e1777ea01b144a8:

  drm/amdkfd: Use gpu_offset for user queue's wptr (2023-09-20 17:30:42 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.6-2023-09-20:

amdgpu:
- MST fix
- Vbios part number reporting fix
- Fix a possible memory leak in an error case in the RAS code
- Fix low resolution modes on eDP

amdkfd:
- Fix GPU address for user queue wptr when GART is not at 0

----------------------------------------------------------------
Cong Liu (1):
      drm/amdgpu: fix a memory leak in amdgpu_ras_feature_enable

Hamza Mahfooz (1):
      drm/amd/display: fix the ability to use lower resolution modes on eDP

Lijo Lazar (1):
      Revert "drm/amdgpu: Report vbios version instead of PN"

Muhammad Ahmed (1):
      drm/amd/display: Fix MST recognizes connected displays as one

YuBiao Wang (1):
      drm/amdkfd: Use gpu_offset for user queue's wptr

 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  1 +
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  4 +--
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    | 30 ++++++++++++----------
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  8 ++----
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c   |  2 +-
 7 files changed, 25 insertions(+), 24 deletions(-)
