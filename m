Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C744B732815
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 08:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72CB10E5A5;
	Fri, 16 Jun 2023 06:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2045.outbound.protection.outlook.com [40.107.95.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5FF10E5A3;
 Fri, 16 Jun 2023 06:58:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3mSfCJ1HAwf33BUYPx4wwpRxefpvnuVVkFjhMTo2l3NAK8FuubPLxqE+7CHdem3wFPSIWhRDdisz+Mrkk0GjVEWMB1WKudVKNWQgAc9AKJQf6aZ7r1ysENyg8yKnocjktA55wKTzCSUXkLr+zWYMObWHEXSm7MFHphI2JC5vMYFZ1oifL3UyJP8mdt8n7R0u2LEY8JnTbmENW8NNJhCBik3kpZBfXgSlG34WH5d7nDGwOFlHfvIzU9BRsJSmtOfdn/zP5qJX6o8Ytrtv9fjjt0LF51Esyq+qAt0b3uSGE+NtcroLZyGc8s6hBnmT+VK/r0eVIVO/1X104XgG9cX1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJDf4Hy6wji+mjAcc051sZRUQccDxPYxRWu0KEMFJQg=;
 b=Wc30DU0OLQXIK/M4L9z+WHy0h4XyiD1sPjTPUgZ5q6Xhaquqxy9QqwHdcAm2s4WEkgJ4++ePbnNyajYuhrnNdzhDQ3EvX0Mmf0dr2ZxPbVW1qoaA+eF0Oo6n3SrcWw2pyn27ilXP+JcWFWTItkYuR396G9qhXrT+v7ICrKugWM00y4IGPP4pLVAJcAYeXcbZ7MU1/mq+jd8jZDIfKePgKxcd3w3caGUQCprbiAEF0SowVye2d0/3jdG0h/Wh0iRyJxrqugj9H0cWAHWUzv4TQgPeSLh6lkPPpn8deiwZhPAVaNgpGrQTXBDVtY9z36pK83OTH3/mWpRdqz9q+vopuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJDf4Hy6wji+mjAcc051sZRUQccDxPYxRWu0KEMFJQg=;
 b=fOSub4XtxW+Qc4vnBd+dznofNc8O7Sj/IfsmAFry5y3UG9fGR7mXoKsR8ISoUkxpwUQnEOcYxDK+/ROFkXkykOErYiYHAHu4SsdooHtdrpYQ+U2BsbZI5n3xTz8IqX3sdoNx9F7mmmbBQ4R+83cG44p7jxo/Sp08bIapso5WzG4=
Received: from BN9PR03CA0776.namprd03.prod.outlook.com (2603:10b6:408:13a::31)
 by MN2PR12MB4471.namprd12.prod.outlook.com (2603:10b6:208:26f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 06:58:42 +0000
Received: from BN8NAM11FT091.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::b1) by BN9PR03CA0776.outlook.office365.com
 (2603:10b6:408:13a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29 via Frontend
 Transport; Fri, 16 Jun 2023 06:58:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT091.mail.protection.outlook.com (10.13.176.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.29 via Frontend Transport; Fri, 16 Jun 2023 06:58:42 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 16 Jun
 2023 01:58:36 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <kvalo@kernel.org>, <nbd@nbd.name>, <lorenzo@kernel.org>,
 <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
 <sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <Mario.Limonciello@amd.com>,
 <Lijo.Lazar@amd.com>
Subject: [PATCH V3 0/7] Support Wifi RFI interference mitigation feature
Date: Fri, 16 Jun 2023 14:57:50 +0800
Message-ID: <20230616065757.1054422-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT091:EE_|MN2PR12MB4471:EE_
X-MS-Office365-Filtering-Correlation-Id: a85935fe-bc41-4c82-3fff-08db6e371f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2P414eYWbX1C3GHQIGZOBfeO8difOgcbW+evqegs+ra2YK817cfxQCILD1YKZ+9PvFUE5pBVUvUt1s1c5MSq1sgSOPr86GqBJMvqmisqZIrRbZUFmZJgzGXCpkeW0O303r3wuHDxNiZo1bbRTvNqmqO2A/yszttNaRkA7GGa8d9f0uc4bt2cLL4zYj1lr1WDJ4lqyISv5mmt+uKMgxnhQ3lZf1dBB8H6AX3qsSxgOPCr6+/GzIhvqQvtjxZ/k6tDXlZ78BY1SUyUxXaZqwIPKBEjgtzMmeo76m6zLfsccUWZREh6MAp/rQZAsnLGRcitcd/nBn+1uamJgDyaTyd7WsmSu4Mm+I5E+LHLfd3xjGepW+tgHpPRK3pTZB+CjwQMcVMGyva1qy4+/hx/ewtZThTM81bR0RSDoFbMkTDd7rQYuiQJel5wwIafrgb+YZDkCdNiae7tGjSwtrVjrEgsiCMb54zXFxqQJASE4skDvCupORm74Y+0bwwOvQYTzbgrT3r3YoY1wuITVJUC9WHbVNqjsysT+V6CJUR/U+q98rUmitTJyWz36q4YvtzqfMh8WsCOhFmqs0pF8rsA2Z82RDBHWwPbQqCXCvQxb8EzyMbBws/hlBBIhXEu07ANOENwHIOvXfQ+ogZKSk9rgtJBVwGc9TGLHYxDx8pqyEkiFgOAWi3fevvGvE/DxZ8I9lsveseTvGU5vOvlk/hDICVJ2Ar7AqMjqupQ5AT9m6B71C2VxcDbE3n1i0SJyRCqTvUcb1aMVNaH/JM4IdNTNURPmit+YkmfM5PJwFvksUP6qWo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199021)(46966006)(40470700004)(36840700001)(110136005)(54906003)(82310400005)(41300700001)(8676002)(86362001)(7696005)(8936002)(316002)(6666004)(70206006)(70586007)(4326008)(36756003)(6636002)(40460700003)(478600001)(36860700001)(7416002)(26005)(47076005)(44832011)(40480700001)(82740400003)(5660300002)(83380400001)(1076003)(426003)(16526019)(356005)(2906002)(186003)(81166007)(2616005)(336012)(921005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 06:58:42.5807 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a85935fe-bc41-4c82-3fff-08db6e371f0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT091.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4471
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
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Evan Quan <evan.quan@amd.com>
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
Patch2:     Enable WBRF support for wifi subsystem.
Patch3 - 7: Enable WBRF support for AMD graphics driver.

Evan Quan (5):
  drm/amd/pm: update driver_if and ppsmc headers for coming wbrf feature
  drm/amd/pm: setup the framework to support Wifi RFI mitigation feature
  drm/amd/pm: add flood detection for wbrf events
  drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.0
  drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.7

Mario Limonciello (2):
  drivers/acpi: Add support for Wifi band RF mitigations
  wifi: mac80211: Add support for ACPI WBRF

 drivers/acpi/Kconfig                          |   7 +
 drivers/acpi/Makefile                         |   2 +
 drivers/acpi/acpi_wbrf.c                      | 215 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  26 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  63 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  19 ++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 204 +++++++++++++++++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  30 +++
 .../inc/pmfw_if/smu13_driver_if_v13_0_0.h     |  14 +-
 .../inc/pmfw_if/smu13_driver_if_v13_0_7.h     |  14 +-
 .../pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h  |   3 +-
 .../pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h  |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h  |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h  |   3 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |   9 +
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c  |  60 +++++
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  |  59 +++++
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h   |   3 +
 include/linux/wbrf.h                          |  55 +++++
 include/net/cfg80211.h                        |   8 +
 net/mac80211/Makefile                         |   2 +
 net/mac80211/chan.c                           |  11 +
 net/mac80211/ieee80211_i.h                    |  19 ++
 net/mac80211/main.c                           |   2 +
 net/mac80211/wbrf.c                           | 137 +++++++++++
 net/wireless/chan.c                           |   3 +-
 26 files changed, 968 insertions(+), 6 deletions(-)
 create mode 100644 drivers/acpi/acpi_wbrf.c
 create mode 100644 include/linux/wbrf.h
 create mode 100644 net/mac80211/wbrf.c

-- 
2.34.1

