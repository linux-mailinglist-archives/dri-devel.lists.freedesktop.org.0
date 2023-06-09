Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 567F67290F8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 09:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709CB10E63E;
	Fri,  9 Jun 2023 07:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1F010E63C;
 Fri,  9 Jun 2023 07:29:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTOVl/AGw5mnjS93Irb10Aulf+XeKKw6c0lcVH3w0qjFZAm717x61wXsoF5jdHnErcGc9oRmYaiMLGNBhNlEAV2NAErKyN3H/YNEur3IVvKww7ehfOZugBDs79SL1+6eN0fA4eXhlif2bxEFYgEVwrDDonfiX90AjWZueHdZdo/caMzo8hDB/lutj1QLADpnf+Y1sMFyPKHuUt4d/ctg3pefUE3OzfpNYv9wwn3kd/bqWWl3qVbLEUZ8GwVnKkFwwm0LY523JaY4LKQAClmW3MBiucIvTCmQkw7g98uZChB1uEH7Fox0f6QG1SUE5Y1r382T2t0Z7/LwSCv6guTltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwoRASAmGGeTdiaP3Td1Sxj0t86L0XjIBOjzPinfA1g=;
 b=hn+dN1AO877Jn8Lp6U9pmzp9pSsChyZhhHlNOrF+MuJhFwcQSLAHyAeXNel/IsY4kWoa7qyM7LS6ojce/xW6tqic1nLZ26uz4fc81l7Oh8YCft8mApJU29YBcIgLHNDXXSMkB50L0yJT83NEWqCz48wutmBj06vkwYB5B5mZAoHXO9ACxMAuxeivJa2kaemVafDah5rTL9RtsgenC0u3MLzOTjbgb96xI0Rp3Tet4x71THXxWbFPeRL16uJwl6Qa5eGxz7zz1CmIAwV8pbh5RE7FlsEFuFmeAVsIyMTe4xjsrJxMk9KFiqnHzERXoOWggTxqhNGgVEly5xMW+22G3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwoRASAmGGeTdiaP3Td1Sxj0t86L0XjIBOjzPinfA1g=;
 b=VpuwEfr5rZx+LWT0CKSNTX1xzZ3W5h2M9D28fpz8fqMbP7A4A0chS6j3tM782Ut7RPe2ZapwCkvZlrAIjxubHEDvrkG4iLQV4WorpfoRBVhSKEvjclAE3Q40bcx1a6tZijFOIfQxLfRbF8jMlnx2GcbiTuwDMe8xVVGyz0hu3NY=
Received: from SA9PR03CA0018.namprd03.prod.outlook.com (2603:10b6:806:20::23)
 by DM4PR12MB7504.namprd12.prod.outlook.com (2603:10b6:8:110::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 07:29:10 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:20:cafe::79) by SA9PR03CA0018.outlook.office365.com
 (2603:10b6:806:20::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Fri, 9 Jun 2023 07:29:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.19 via Frontend Transport; Fri, 9 Jun 2023 07:29:10 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 9 Jun
 2023 02:29:04 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <kvalo@kernel.org>, <nbd@nbd.name>, <lorenzo@kernel.org>,
 <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
 <sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <Mario.Limonciello@amd.com>,
 <Lijo.Lazar@amd.com>
Subject: [PATCH V2 0/7] Support Wifi RFI interference mitigation feature
Date: Fri, 9 Jun 2023 15:28:39 +0800
Message-ID: <20230609072846.1552238-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|DM4PR12MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef9f042-ff53-4d7d-4465-08db68bb3792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6p36yqkgt1Xm/jptj1/wqUMUsJX8D/lsMZNj537WQW/kpjqnb5ME54ZqQ2LDKft7QvSQNc/3tTz1chNiSzlOPpjktCe7ap8845IUVpHc9bdCh3lidQIA2Y+XIY4/L1d4LrqTeBFz+k/Oq+XmP6o8gXfEQfSziLjOvsYL6WZpykzxQ+6LcYXUIYmX11jADGLO9BQzXI5ddWrySIrYVY1QE+xV63nEg2IvlIsWMaW9eusGXq7bfbW2GQIpcc4hapCAag1tz3zQS78fw/p/sfdT+6dHHMSG3WlPVJncBPvxaCogsqKtkV+OCGP3mmwfqqSi6IzbGA0HixSFLqbnVU/4mB75kx7InR4f6jTPl+iuH8r5kzFjRVG4YY+ac3G0ZtKztDuSXFuPQtp3dstqGYN1QdSlgylb42mLNKfoB8mmr3Bm43f84y5Mcy14ZfWILTwUN10GhfDfbYRgFpwZJ1zcdhU2CNwqS3gNgE6jIplSa85BQpNz1s2ydDufxopVGeuLB9iJVvtlKNR4Y9P/DYYatUuZcOtHLpKz5yKKA368PewAq1pipj3z3lEqblY8JZH0bjDEN0nXn8YlSiP3WM1sV+61LzUrgeard/w4VSku3W+6HlmCgNaBXwJZGFfGN6wLihOf2UO8GTBbyigLDK5/19TETg9I1GRyCNZBg8CoS0lKYKBwj0DrOihgHD63b9nfVEOQNu4j6W02d1g3fN1uaQlCDIs/kcuWw1zhUQIiJ4oFUJnUP8Rx6k+SK9g1Knz2vkFJwPT2iT12WFUwCIPlQUnFIRKrVsK8TJGTTb+P2UE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199021)(40470700004)(36840700001)(46966006)(70586007)(70206006)(7416002)(4326008)(6636002)(36756003)(40480700001)(5660300002)(44832011)(41300700001)(8936002)(8676002)(316002)(54906003)(110136005)(478600001)(40460700003)(2906002)(7696005)(83380400001)(6666004)(82310400005)(426003)(186003)(1076003)(26005)(336012)(36860700001)(2616005)(921005)(81166007)(356005)(16526019)(86362001)(47076005)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 07:29:10.3094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef9f042-ff53-4d7d-4465-08db68bb3792
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7504
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
 include/net/cfg80211.h                        |  18 ++
 net/mac80211/Makefile                         |   2 +
 net/mac80211/chan.c                           |   6 +
 net/mac80211/main.c                           |   2 +
 net/mac80211/wbrf.c                           | 183 +++++++++++++++
 24 files changed, 998 insertions(+), 5 deletions(-)
 create mode 100644 drivers/acpi/acpi_wbrf.c
 create mode 100644 include/linux/wbrf.h
 create mode 100644 net/mac80211/wbrf.c

-- 
2.34.1

