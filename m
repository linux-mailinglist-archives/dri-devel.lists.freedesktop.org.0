Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A77424812
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 22:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275206EE76;
	Wed,  6 Oct 2021 20:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A0B6E54C;
 Wed,  6 Oct 2021 20:38:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYcK5Kjp+FdCB4O+b9ViO2uzn5GAB8vCXAJnpPxQFHAMSGgNaMV8O0Ni6XXDsHE8hjxpqqUCBp1mUhU84GVVbCHp18uuJJ0uTWdxRvIiX1ZwhxzIBxxDiSj3hp2CnHOBhnClIw66bKzCVFPsWFWTkYjKP2ylG3HoTeYKjrjwosb17cSpHzbtvDMdwp/0MKU1oRQJ3xemWf/C8DdEySuSQmevzCkPYkxWUqGK7AN61l05HKieADOZecISMVmgXja+RqYvZ5tTXJmUXSnA/C1PqjHfcqfUfpR45j8JkFMcz9oOP7qwOd85j3bB1UH2KcQWzi7RvXcBpabrK5uDrSD0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1CHn/9HLDXB9rAbqsPgC375t88McqhMs0c/gZSt+EA=;
 b=D7hPBFbztX6bSiYj2yzc7Rfsr3H57WFGQJjydRIufZHEcVhYSTyQRKmRJ6uP1jzZZbK40NbtVLOmOIAVzwsXk4NbEP12KzVKGBTL49DOiRZvChTnbzDwrqvTtAc9o+Kct4KmCvR2TPUR5Z8JVTlNBp1GdV3ZktO/IosL9OCgayoS5YU5u4u1SiOoOSGqGq0pR/1vZ3OpTtoYoAMRMOjtZUp/3XTnkPuuvSqMLjMH3Dqca+mRRRaPpzPTEBDXYrRSsbfgV4onKjSgVxM4fRB6v3feOxvBmLr0d90e23CbSsGEmvoR3gVvX8c7ycbjOFBePFcX2a1EMnTFtLWL3aI7zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1CHn/9HLDXB9rAbqsPgC375t88McqhMs0c/gZSt+EA=;
 b=0A1giw7IodcpdeT9awgKPBKayXCEmpgwRJ7OVk7i176/uxqd81ZlcuGDTAjnF0uChJAdNlUBnybd6YZxVL+aAxDF23nTenPUeMlOUadfvlccQR/ZL3vLEjkT54ICTYU8FmPHq2RbHh36pkPYtNIcfaZ1+rzb1xUAUKOdr+mZFH0=
Received: from BN7PR02CA0004.namprd02.prod.outlook.com (2603:10b6:408:20::17)
 by MN2PR12MB3854.namprd12.prod.outlook.com (2603:10b6:208:16a::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Wed, 6 Oct
 2021 20:38:43 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::6b) by BN7PR02CA0004.outlook.office365.com
 (2603:10b6:408:20::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17 via Frontend
 Transport; Wed, 6 Oct 2021 20:38:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Wed, 6 Oct 2021 20:38:42 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Wed, 6 Oct 2021
 15:38:41 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-5.15
Date: Wed, 6 Oct 2021 16:38:28 -0400
Message-ID: <20211006203828.4818-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0dad16b4-ea83-406c-c6fb-08d989094942
X-MS-TrafficTypeDiagnostic: MN2PR12MB3854:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3854774769F7AF2F929409B6F7B09@MN2PR12MB3854.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y/DmOVQOK972yjFJSQ3hl0gvL9mwwSL8jpInxdNsyqSatfRyMJyij8DOVQBfSesUM9SLFGeqFKgCriV2mExBH3qm+bpUVioDX6kOST1OpH5w3n8kdOZp5HBMMHdYedvyH2zcPtmgF2nGD7hEQx+2RYowYgj3u8hPN6TuQzkdZwDFFi8Dl5AMW3KvkbHc04jg3NjbX8me9RtoI+bpj3UcWVvzn58/A0W60HJkZdYi5l8IE43mw5KRn8+7AoP0NibrlWVTN3Hjl8lTRzMiiOn1jlNU86BniERUhLSeNzHtdp9YUwR7W+2G86UA7c43tIJ2ChmlRA8mT4vrBE2U7zFRX64/JkUw66/xFrtu29M2NWDRh5yF/SMZCd0WDrL2UZZ22LUJgukOja3E7/nVXUa0HGQ1BtllvBKvHyUadrlWdb/GnpG2TUvG+oE12mjN6R25IWOtx6YtCt5dVw2EnSKhCoEoxdBRfi7Df43EsuWLLHTHSibqKXt4idXg9+XOVDSPrpYFzxxuA9r2lY1XUFemqz3+UemVKyyWx2uMh3cjqRGCSHhjKexnJVNRMrozAgMMtzFH+FZSo7/7DHuaRGDQ+Pvdb0a5qDxo9WM9fTewepA9y3mziXdt2F9TdHjdjL13NwHzTU3zwd2VW/2QPs1CkPqM7/dBkkZjbQ7HQucTAX9uMoqWoUhgP09PmGXZDgDIoDX18xeV8G+OZaHjbw1fY+FLBfeCRfoLpQ5ZFxvlq5Q=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(186003)(5660300002)(70206006)(2906002)(36756003)(70586007)(966005)(508600001)(86362001)(7696005)(6666004)(26005)(426003)(1076003)(8676002)(336012)(83380400001)(2616005)(8936002)(36860700001)(16526019)(316002)(356005)(82310400003)(47076005)(110136005)(4326008)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 20:38:42.6020 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dad16b4-ea83-406c-c6fb-08d989094942
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3854
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 5.15.

The following changes since commit 9e1ff307c779ce1f0f810c7ecce3d95bbae40896:

  Linux 5.15-rc4 (2021-10-03 14:08:47 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.15-2021-10-06

for you to fetch changes up to 5a1fef027846e7635b9d320b2cc0b416fd11a3be:

  drm/amd/display: Fix detection of 4 lane for DPALT (2021-10-06 16:14:17 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.15-2021-10-06:

amdgpu:
- DCN 3.1 DP alt mode fixes
- S0ix gfxoff fix
- Fix DRM_AMD_DC_SI dependencies
- PCIe DPC handling fix
- DCN 3.1 scaling fix
- Documentation fix

amdkfd:
- Fix potential memory leak
- IOMMUv2 init fixes

----------------------------------------------------------------
Alex Deucher (2):
      Documentation/gpu: remove spurious "+" in amdgpu.rst
      drm/amdgpu/display: fix dependencies for DRM_AMD_DC_SI

George Shen (1):
      drm/amd/display: Skip override for preferred link settings during link training

Guchun Chen (1):
      drm/amdgpu: handle the case of pci_channel_io_frozen only in amdgpu_pci_resume

Hansen (1):
      drm/amd/display: Fix detection of 4 lane for DPALT

Jude Shih (1):
      drm/amd/display: USB4 bring up set correct address

Lang Yu (1):
      drm/amdkfd: fix a potential ttm->sg memory leak

Lijo Lazar (1):
      drm/amdgpu: During s0ix don't wait to signal GFXOFF

Liu, Zhan (2):
      drm/amd/display: Fix B0 USB-C DP Alt mode
      drm/amd/display: Fix DCN3 B0 DP Alt Mapping

Nikola Cornij (1):
      drm/amd/display: Limit display scaling to up to 4k for DCN 3.1

Yifan Zhang (2):
      drm/amdkfd: remove redundant iommu cleanup code
      drm/amdgpu: init iommu after amdkfd device init

 Documentation/gpu/amdgpu.rst                       |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         | 14 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            | 14 ++++-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |  8 +--
 drivers/gpu/drm/amd/display/Kconfig                |  2 +
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  6 --
 .../drm/amd/display/dc/dcn10/dcn10_link_encoder.h  |  1 +
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  | 66 +++++++++++++++++++++-
 .../amd/display/dc/dcn31/dcn31_dio_link_encoder.h  | 14 ++++-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |  8 ++-
 drivers/gpu/drm/amd/display/include/dal_asic_id.h  |  2 +-
 .../amd/include/asic_reg/dpcs/dpcs_4_2_0_offset.h  | 27 +++++++++
 14 files changed, 142 insertions(+), 26 deletions(-)
