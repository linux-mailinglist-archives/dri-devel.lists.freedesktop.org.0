Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0543D7153CA
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 04:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FB210E31F;
	Tue, 30 May 2023 02:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372CA10E319;
 Tue, 30 May 2023 02:43:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXn3hHEaVHcD0a2Aw00JtR5zJWUaweITJksv2gfh9XJpdi28/XETcvS6WyqHuJua1kQz+wi/PsyDPrFqGMYF+lAnPKf1iwhzgWt1D2I5AOV8VTeVhf+KxfeGZ3kSLtLJScg/EmhjW1UvxG8yqkf3TY5vtmVyLhEQzHbO96Ues8qWDWWjIjdRr+Ar5N4WrSpK6R9G5XU3dpxRJZ71IZKooXlyzdGugjRsI/cK989ueJ0940qqC7LUMmQ2mwJZLZqh0afAzdFc/tkqwn5FyBeUgAf2GCnPX3dhY2+VcMJzdYnnRtMea+cj7W5Q+qhbCYd1bz6q+xorDGf0VsUnRZDr/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4N8f5oHquhSSByqTnwEERehs0z9JnbARewhO7VA252M=;
 b=fw4SX38vOfbG+fzX0aSAPE6w39bT+0MwpPgaL6FAh/JXdgb3sWk1nNe3I3rToT4ROziJECBggYc2AfpEgnf3WF614gPUCannG5st7/4RBt/Dj5X79lFV6odxFnYK1gUP9riduyfHiYUy5vu5fv7Qx+FBSVsvrTDAF62pTTJaXs+KMSynTbupc8321WCc4HToHtkFBa4rpk3dqe4cxi0B9fZObWXNtAEN0PHFgPqOKYitK8p32Det5bvpFlN5ca7jWzq7uBhkuxCw8b7hc+7BCl6EZNwJX55hg7DR/Nhfjrx5xnnPU+5if/EsOs4sLLonwsD9vP1mck83ObyjrLhQCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4N8f5oHquhSSByqTnwEERehs0z9JnbARewhO7VA252M=;
 b=IbxiBElQ2mkHrwkwmyR2OnCv+4Cu3rRxGWpWHbS2OSVr31XZ4eJvNPE+gTnd75xIdBAgk4dttypNhKWZv8Y52D7wHaCToZk7+MSarLGfOYJ7o4mWOIPCJa6nBn/kWVslFYEmT1wPm+QRePuFeF7CXyngaq2O6QCkvpS8b8Lgmfs=
Received: from BN9PR03CA0256.namprd03.prod.outlook.com (2603:10b6:408:ff::21)
 by CH3PR12MB8353.namprd12.prod.outlook.com (2603:10b6:610:12c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 02:43:10 +0000
Received: from BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::fd) by BN9PR03CA0256.outlook.office365.com
 (2603:10b6:408:ff::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23 via Frontend
 Transport; Tue, 30 May 2023 02:43:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT061.mail.protection.outlook.com (10.13.177.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.22 via Frontend Transport; Tue, 30 May 2023 02:43:09 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 29 May
 2023 21:43:03 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <evan.quan@amd.com>, <kvalo@kernel.org>, <nbd@nbd.name>,
 <lorenzo@kernel.org>, <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
 <sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <Mario.Limonciello@amd.com>,
 <Lijo.Lazar@amd.com>
Subject: [PATCH 0/9] Support Wifi RFI interference mitigation feature
Date: Tue, 30 May 2023 10:42:18 +0800
Message-ID: <20230530024227.2139632-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT061:EE_|CH3PR12MB8353:EE_
X-MS-Office365-Filtering-Correlation-Id: 771d58bf-2be4-4d22-1584-08db60b79af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 16pmkmtfmfUD7hR0EMk3qKRUfGipPHSDuzfEeJ8bvpwSzQSbCftdqhfiXSuQ3fgrpvYLUyCKiaJaAP6yVV1RP3g0fn0e1zxMQMxAv+7EATymgAfsRuE7fbLn3o7iD2RCFftkBJmKSYvxVy4KJ0Bfc4kJp7nJeXdPV4igI5lvveEoynJOeOt+5o3bzRAyadYjVIKYy8jQRKSknUXXDGVhWAAdU4MG4JZn/I9KUPJEyiSOgyVIyxU2dX/MyZLpqQHn+saAOrgnYruTNFNgZlRBGXXamN9ISS/ca7pDlwJZkUccUclITy5RZsVym+RgWZpKXPMtcG3OuA07R3TR4N7pfNknq7gf0FAiXXjo0vBDF+YXtHI9z/6lfQieAEhqs4JpbFSNHiai0S2+b1BEMN+dUJ5bdfP01TmJt+P0qLMd7+tJx4Zh80crepaxd6YIy7gJPrYMtFPZxIkHkkD+UBJQg6gVaShAjHV5qo8kaW/P0it1/f8SQcLVf92OUbjXAftqsQuNN6G+fE5LAjiy8AWZHK0/jdyqTSCrfwXAU4tBCLTQ8emoiOcvBPCRj48tPsv4Lfz0r6yMMPuBxpHUmroBV0QUPO0IVuRlxKjVS//mpx0SwuN3+5nQ0l6g3zdu68+0ZZx8k1e0KTXhb1ykH5+3cQPWB6PRDYL9raVkLo+1ShW7Q2aOi7gSn977cHO+GNaFp5xtBdIITQukGF6vULwIzDUvV+6VJGHW6hyjfxcQnrY4RpAzU7FGXmBnM+eUuRrBbg5h8qVhA2oyFlCW+2BPRQT8o54r4dZMVBdGtNz3dPM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199021)(46966006)(40470700004)(36840700001)(2616005)(41300700001)(47076005)(36860700001)(6666004)(7696005)(16526019)(1076003)(26005)(83380400001)(186003)(426003)(336012)(478600001)(110136005)(40460700003)(54906003)(70206006)(6636002)(70586007)(82740400003)(4326008)(82310400005)(40480700001)(921005)(356005)(81166007)(316002)(7416002)(5660300002)(8676002)(44832011)(8936002)(2906002)(86362001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 02:43:09.7885 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 771d58bf-2be4-4d22-1584-08db60b79af9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8353
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
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 ath11k@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to electrical and mechanical constraints in certain platform designs there may
be likely interference of relatively high-powered harmonics of the (G-)DDR memory
clocks with local radio module frequency bands used by Wifi 6/6e/7. To mitigate
possible RFI interference producers can advertise the frequencies in use and
consumers can use this information to avoid using these frequencies for
sensitive features.

The whole patch set is based on 6.4-rc3. With some brief introductions as below:
Patch1:     Core ACPI interfaces needed to support WBRF feature.
Patch2 - 4: Enable WBRF support for some Mediatek and Qualcomm wifi drivers.
Patch5 - 9: Enable WBRF support for AMD graphics driver.

Anson Tsao (1):
  wifi: ath11k: Add support to the Qualcomm ath11k for ACPI WBRF

Evan Quan (6):
  wifi: ath12k: Add support to the Qualcomm ath12k for ACPI WBRF
  drm/amd/pm: update driver_if and ppsmc headers for coming wbrf feature
  drm/amd/pm: setup the framework to support Wifi RFI mitigation feature
  drm/amd/pm: add flood detection for wbrf events
  drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.0
  drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.7

Mario Limonciello (2):
  drivers/acpi: Add support for Wifi band RF mitigations
  mt76: Add support to the Mediatek MT7921 for ACPI WBRF

 drivers/acpi/Kconfig                          |   7 +
 drivers/acpi/Makefile                         |   2 +
 drivers/acpi/acpi_wbrf.c                      | 343 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  26 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  63 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  19 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 204 +++++++++++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  31 ++
 .../inc/pmfw_if/smu13_driver_if_v13_0_0.h     |  14 +-
 .../inc/pmfw_if/smu13_driver_if_v13_0_7.h     |  14 +-
 .../pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h  |   3 +-
 .../pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h  |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h  |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h  |   3 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |   9 +
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c  |  62 ++++
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  |  61 ++++
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h   |   3 +
 drivers/net/wireless/ath/Makefile             |   1 +
 drivers/net/wireless/ath/acpi_wbrf.c          |  45 +++
 drivers/net/wireless/ath/ath.h                |  15 +
 drivers/net/wireless/ath/ath11k/core.c        |  23 ++
 drivers/net/wireless/ath/ath11k/core.h        |  14 +
 drivers/net/wireless/ath/ath11k/mac.c         |   4 +
 drivers/net/wireless/ath/ath11k/pci.c         |   3 +
 drivers/net/wireless/ath/ath12k/core.c        |  21 ++
 drivers/net/wireless/ath/ath12k/core.h        |  14 +
 drivers/net/wireless/ath/ath12k/mac.c         |   4 +
 drivers/net/wireless/ath/ath12k/pci.c         |   3 +
 drivers/net/wireless/mediatek/mt76/Makefile   |   1 +
 .../net/wireless/mediatek/mt76/acpi_wbrf.c    |  36 ++
 drivers/net/wireless/mediatek/mt76/mt76.h     |  19 +
 .../net/wireless/mediatek/mt76/mt7921/init.c  |   2 +
 .../net/wireless/mediatek/mt76/mt7921/main.c  |   3 +
 include/linux/wbrf.h                          |  70 ++++
 35 files changed, 1143 insertions(+), 5 deletions(-)
 create mode 100644 drivers/acpi/acpi_wbrf.c
 create mode 100644 drivers/net/wireless/ath/acpi_wbrf.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/acpi_wbrf.c
 create mode 100644 include/linux/wbrf.h

-- 
2.34.1

