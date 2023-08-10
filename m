Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAC477717A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 09:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2590E10E4D9;
	Thu, 10 Aug 2023 07:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F20610E4D5;
 Thu, 10 Aug 2023 07:39:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1mW77tPo9qk0rO95ieLwfcnKxhkk4cDbc3AOs4QA4IdDYwfsY+BYi0MHEkZVIjdgJJolRNfy+D7IvpDNfC3ndZZKjCCXvbTykpqVbPcTttdfJm6JzHJk7BNIDT4J3m2VVZ5kaH4uBEhMMqxPAP86s06KjyVtmaU73qr2Z14ieFIoY6MLzDFZH+/dOOdbI0Z2kPS1+nb7NBPVqDzbfnVPFKnPZ16eXX62mD11hE2NH79mxikl2P+xw35j8gr5IvfIZ9x6C/gHWJOVBCyc7VZIEGrBAswFpuFu2u7SqItqdADREOEaISU4YveskI6qPNvnvMhLZl4op0OBQAiAk4dQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muNvOhhnH4HZCU1c+YHM9USnz4tEVkuw0me1IXMRoio=;
 b=dir18Ug7w4oKO+Yvu1k4RvzLTLCcNrjh4Hsc6urROrF1EibK5yuE0To8A8YIHSf7BmUanCLFys/JxbeTlj4CcwRYndgfwip23VIQgrbc0vs03MRUc4/k3iKnHuIgJzE+TRmeIw4bOPHkue23bU8927JBZaEjt2SCckwSxLl0FrQvOxsM3s99DqPZQO9QUArZjVpcafr3J0+liw2sdVayu5U4DpZ9UPbHtOyt/YmRl5+GV/jLM910KkmZVWamEzLBBdAG5Ov5pjpE7GR2bGe5ugLeGYGy+dEd4lX1t17/J7stqqrdqR9QA4uvB30KyqRc06wZvGEfVFWcdCYT7mE+cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muNvOhhnH4HZCU1c+YHM9USnz4tEVkuw0me1IXMRoio=;
 b=ukbZHfTCMGkoL30CSl04nn8dRcBGk9OU/k8/DX2Gd/xEHzbKLN66UN+gseVZ1u6NcEPRN5bBV6dDh67CRwqxK8iPpcmb+Z6BeLnbbtOdQHLz5AlMIzu68KEhnRX4eXEIIgT4UdishPVsIG+UlPwh1moI2564p/yHiRbN3/LtD/0=
Received: from CH0PR03CA0032.namprd03.prod.outlook.com (2603:10b6:610:b3::7)
 by CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 07:39:23 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:610:b3:cafe::4f) by CH0PR03CA0032.outlook.office365.com
 (2603:10b6:610:b3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 07:39:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.20 via Frontend Transport; Thu, 10 Aug 2023 07:39:22 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 02:39:12 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <Mario.Limonciello@amd.com>, <mdaenzer@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <hdegoede@redhat.com>, <jingyuwang_vip@163.com>, <Lijo.Lazar@amd.com>,
 <jim.cromie@gmail.com>, <bellosilicio@gmail.com>, <andrealmeid@igalia.com>,
 <trix@redhat.com>, <jsg@jsg.id.au>, <arnd@arndb.de>, <andrew@lunn.ch>
Subject: [PATCH V8 0/9] Enable Wifi RFI interference mitigation feature support
Date: Thu, 10 Aug 2023 15:37:54 +0800
Message-ID: <20230810073803.1643451-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: 01816b74-728d-4048-9a2e-08db9974ea46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oS8JA/qyuQuaB3f4nINEmtt/FaUMLUXhAREd3Drr5bwFicFwghNid1eY8Xa1xAXCOulxVr8cmscYWC5oKrfyTxK3x5yz8SmMOwnoTwGuhZnTMX9c4X0c93pxlpeviYQD8eNYPQZY/IgzzATIpKL0rGp6s0tkNx+TByL08Xi545Y40LYFsFHDfhC7b3zTRsUus8xotYNt4abJi6ekw+EUzR0haKPbU9RQXYkOR7fJeueDnUAXTbPieEH6rc1o1eWdvarxsLodzpcnj/46EHIPvkUBrtA1Rg1Hu+ZPTk72YTl2MueLpx+HeIUHPAtsWGpGw5/RbrLlb93k4owML/4Itp7Fat4L4ZBF+S+NYKtY5sjM5cOgV7h7G62AIrVRymqYH9u+w1HlHKZolpnGgEBMtmetnKJHl7F8958PDsiIziQfRmQduGjzNmrrciRUsgQ9vAkIiPEtHUynyeFvqrpmBocMQMh5qyAoVg6haSUKIouC9/qtH8qieZxN09mysmVBtZghJ0JgT+7iQsE6AygGcq/zfsAOLUNfCvPrQo+ZM31RAc/6i+mtwhxaWlXVrN+sO3xrBsPtwVijDt1iljUVcma35mK2+uYQlS3+fdz68GErpzya8hJeG8CwqB/f0foT9//pxOEvceWocJQIODSboeVigeG/s2Yp+oSMKfRxwbL2sGz2N0PKFoqhIEyRkIYVeadEh7A+zKAMkfhWkyo5EF742h0AbjMTciS/kzQr/Clgx3m9cfFEZzYFBPe7Yx47XYcJHpyQhRZBZLYDY1Acc4Of6R6ZrPaSWiwqoDb42g55r7Hr8c0O7h0EH8FIWGC45vZ9HQPCC18208sdZcA0bw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(1800799006)(451199021)(186006)(82310400008)(36840700001)(40470700004)(46966006)(8676002)(8936002)(86362001)(7696005)(110136005)(316002)(6666004)(54906003)(26005)(1076003)(2906002)(478600001)(36756003)(41300700001)(44832011)(7416002)(921005)(40460700003)(4326008)(2616005)(16526019)(356005)(81166007)(336012)(82740400003)(426003)(83380400001)(70206006)(47076005)(40480700001)(36860700001)(70586007)(5660300002)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 07:39:22.7246 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01816b74-728d-4048-9a2e-08db9974ea46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Evan Quan <evan.quan@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to electrical and mechanical constraints in certain platform designs there
may be likely interference of relatively high-powered harmonics of the (G-)DDR
memory clocks with local radio module frequency bands used by Wifi 6/6e/7. To
mitigate possible RFI interference producers can advertise the frequencies in
use and consumers can use this information to avoid using these frequencies for
sensitive features.

The whole patch set is based on Linux 6.5-rc5. With some brief introductions
as below:
Patch1 - 2:  Core functionality setup for WBRF feature support
Patch3 - 4:  Bring WBRF support to wifi subsystem.
Patch5 - 9:  Bring WBRF support to AMD graphics driver.

Evan Quan (9):
  drivers core: Add support for Wifi band RF mitigations
  drivers core: add ACPI based WBRF mechanism introduced by AMD
  cfg80211: expose nl80211_chan_width_to_mhz for wide sharing
  wifi: mac80211: Add support for WBRF features
  drm/amd/pm: update driver_if and ppsmc headers for coming wbrf feature
  drm/amd/pm: setup the framework to support Wifi RFI mitigation feature
  drm/amd/pm: add flood detection for wbrf events
  drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.0
  drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.7

 .../admin-guide/kernel-parameters.txt         |   9 +
 drivers/acpi/Makefile                         |   2 +
 drivers/acpi/amd_wbrf.c                       | 294 ++++++++++++++
 drivers/base/Kconfig                          |  20 +
 drivers/base/Makefile                         |   1 +
 drivers/base/wbrf.c                           | 367 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  17 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 213 ++++++++++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  33 ++
 .../inc/pmfw_if/smu13_driver_if_v13_0_0.h     |  14 +-
 .../inc/pmfw_if/smu13_driver_if_v13_0_7.h     |  14 +-
 .../pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h  |   3 +-
 .../pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h  |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h  |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h  |   3 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |   9 +
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c  |  60 +++
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  |  59 +++
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h   |   3 +
 include/linux/acpi_amd_wbrf.h                 |  25 ++
 include/linux/ieee80211.h                     |   1 +
 include/linux/wbrf.h                          |  47 +++
 include/net/cfg80211.h                        |   8 +
 net/mac80211/Makefile                         |   2 +
 net/mac80211/chan.c                           |   9 +
 net/mac80211/ieee80211_i.h                    |   9 +
 net/mac80211/main.c                           |   2 +
 net/mac80211/wbrf.c                           | 103 +++++
 net/wireless/chan.c                           |   3 +-
 30 files changed, 1332 insertions(+), 6 deletions(-)
 create mode 100644 drivers/acpi/amd_wbrf.c
 create mode 100644 drivers/base/wbrf.c
 create mode 100644 include/linux/acpi_amd_wbrf.h
 create mode 100644 include/linux/wbrf.h
 create mode 100644 net/mac80211/wbrf.c

-- 
2.34.1

