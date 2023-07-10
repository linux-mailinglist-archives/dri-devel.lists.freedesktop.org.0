Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABED474D01E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA83F10E22C;
	Mon, 10 Jul 2023 08:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DD710E228;
 Mon, 10 Jul 2023 08:38:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/HM83Vpr9DONnqFZx/gqx3Xzr5d5B1XHqH5p0to18/SwrZRZuM0CW+pgIzJutHPpZKOgFAyaR/6zyhGL+kr69fRgCzEOVRPrSaj0DykEH5nP/Ntk1WVoo2YGCQjJBCbN81yrm2WlPl4yXejUUGI4JeYYCS04Uqy8I8aX4zSbJUKN1kbzvp79q2vkXUkFsnSYWFBBtlkI3wamAyW6zdlXz9dv0Hucv0E6RWwOXr0+9+74YWIoowpYZRWXyktBm5FiqyTZ/Xmi1zHwLSVX+Nyx4nZxWmD8u6pb86Nwb8LwK+QyfJgv10HTPmn1lo8TKeitwEYZBF4ckgUTHLwx/VFCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1ZLqjyGsEfXdeQl6wdnj0y+tZzPHKhAmMCjn2mDj8I=;
 b=YmAjdSfTkyeSQww+hm8FtgU9GilpuY7A/nb508LmQTyXD/lXK83UzENDewBMPUPp05gLEu7qqfdc7RK/sNXOmMCRPI3XDlPxYNckyGUFNyaUSOY+LZUjbGKc3HBmt5T1pM4Cp4/2AD6DJkgkbKJmdAWlozMcovr3Gl34Qk9C+eSPpgdLWTF/+n8agBCcfvLVbolWHsIeRdijn/m9uGeRULJ3TMDzuLpvcv98G0hsDPQu+wvvkX0kNFphHd9UHzb4d7p4arAoNs+pLhR6dX7r5S0hSJHxEjyXETYeTgURcs/O5QohcEpxBXvVpmuGfgJGNLpgg4fslnI0PBlbkUOi7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1ZLqjyGsEfXdeQl6wdnj0y+tZzPHKhAmMCjn2mDj8I=;
 b=19dD0zvy82HOl/2cd/0DHOoSOZVtYB0/lRsWCSoUMKDfZo93UEVf2f2oDClPLmG4XivxA+oxKeeYRb+2xbU2ZcS+tgWrNjSpDRBX9zk1QvgxddttUBgFjXTB8606k6vikXyiK/0dNoesFXU1i80/qVFM9K8v5pTzIbo+bkcZzfc=
Received: from MW4PR03CA0004.namprd03.prod.outlook.com (2603:10b6:303:8f::9)
 by MN2PR12MB4303.namprd12.prod.outlook.com (2603:10b6:208:198::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 08:38:26 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::ad) by MW4PR03CA0004.outlook.office365.com
 (2603:10b6:303:8f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31 via Frontend
 Transport; Mon, 10 Jul 2023 08:38:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.18 via Frontend Transport; Mon, 10 Jul 2023 08:38:26 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 10 Jul
 2023 03:38:17 -0500
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
Subject: [PATCH V6 0/9] Enable Wifi RFI interference mitigation feature support
Date: Mon, 10 Jul 2023 16:36:32 +0800
Message-ID: <20230710083641.2132264-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|MN2PR12MB4303:EE_
X-MS-Office365-Filtering-Correlation-Id: d2d5f2cf-71cd-4416-0117-08db8121079e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TIyrvubnZbCFJjUTrfSXcNkLYsunFNUz1XPu1zHj7py6ty+oODmYeciF7/TRBgaXkH2AlcDHiNsmrr1b4t6U/T88N6tM3PimHqQzSXNyJZml+RJirbl6VF9/4rGqNcJEg68GTdNY4Bn2EsXBrBS+CIwpmhJGweUXRnFx20qa5xnWPgj5RFRVmrC/c+c5bQls0+JejzX8YJZuQX3kf2+zj082XIlsyT69117PpfcQ7xwdib/Ba5ZlRwWXwc0VK/X4v6MPMKgto7lfF/VsjYtDiRu1JrUTXmw+dq6ysE7hUGzyAqFt3oiu26FNTp/FLgoMaH/xReFM3nrkVF5KFLF13VDZGL+HVWlffX4tcFm83O72WUMMqP3mkvLcnWOUKDaHxkUxF+lXiKjU5WYY4aWe3iJsHophZOgfkb5lIALZE+TDYGt8Yy0/PLj3z2S5lIudY8tuU5lIQpHX2cTPVToP9MWrStLd7rCfquR0MvWZzfJC9m0U9muJpr6NDh1fEUve8UVQY9WhNTZxLkGj2n2qy2WmH6oLPgKgQnXsSMVA0qL7K+OzPRRvKAAjECZ04sFCJsUB7na3XdIfiUfw4ehoiKCH9zY2e5+24Yt8oM0zb2oOJJE8+2hVQrfQrIvSHq1b+B6aLnUWzhK3iKY5TLA3lxKGGKDlTM7LCHGB3i2qume4TDITQGksy2YGz/022QQECuO/MuiHZ8k2mKLZxuONN/mJieLx+el+Ffq48XAx0fZss8XgvU8HYnUmTwHY6MkrVJxsOn00sojqLwsoX7jtUHvCbcJzloD5y69ZO4D+jVLjo5r3DpvI0SZfwMEsZZM6cdRfngCxvvP/bPNWK/RYkA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(86362001)(82310400005)(82740400003)(40460700003)(40480700001)(36756003)(6666004)(7696005)(110136005)(54906003)(70206006)(70586007)(81166007)(356005)(921005)(36860700001)(16526019)(26005)(186003)(1076003)(2616005)(44832011)(7416002)(5660300002)(316002)(2906002)(478600001)(8676002)(8936002)(47076005)(336012)(426003)(83380400001)(4326008)(41300700001)(36900700001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:38:26.3194 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d5f2cf-71cd-4416-0117-08db8121079e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4303
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

Due to electrical and mechanical constraints in certain platform designs there may
be likely interference of relatively high-powered harmonics of the (G-)DDR memory
clocks with local radio module frequency bands used by Wifi 6/6e/7. To mitigate
possible RFI interference producers can advertise the frequencies in use and
consumers can use this information to avoid using these frequencies for
sensitive features.

The whole patch set is based on Linux 6.4. With some brief introductions as below:
Patch1 - 2:  Core functionality setup for WBRF feature support
Patch3 - 4:  Bring WBRF support to wifi subsystem.
Patch5 - 9:  Bring WBRF support to AMD graphics driver.


Evan Quan (9):
  drivers core: Add support for Wifi band RF mitigations
  driver core: add ACPI based WBRF mechanism introduced by AMD
  cfg80211: expose nl80211_chan_width_to_mhz for wide sharing
  wifi: mac80211: Add support for ACPI WBRF
  drm/amd/pm: update driver_if and ppsmc headers for coming wbrf feature
  drm/amd/pm: setup the framework to support Wifi RFI mitigation feature
  drm/amd/pm: add flood detection for wbrf events
  drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.0
  drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.7

 drivers/acpi/Makefile                         |   2 +
 drivers/acpi/amd_wbrf.c                       | 269 ++++++++++++++++++
 drivers/base/Kconfig                          |  37 +++
 drivers/base/Makefile                         |   1 +
 drivers/base/wbrf.c                           | 250 ++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  19 ++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 213 ++++++++++++++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  33 +++
 .../inc/pmfw_if/smu13_driver_if_v13_0_0.h     |  14 +-
 .../inc/pmfw_if/smu13_driver_if_v13_0_7.h     |  14 +-
 .../pm/swsmu/inc/pmfw_if/smu_v13_0_0_ppsmc.h  |   3 +-
 .../pm/swsmu/inc/pmfw_if/smu_v13_0_7_ppsmc.h  |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h  |   3 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h  |   3 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |   9 +
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c  |  60 ++++
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  |  59 ++++
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h   |   3 +
 include/linux/acpi_amd_wbrf.h                 |  24 ++
 include/linux/ieee80211.h                     |   1 +
 include/linux/wbrf.h                          |  72 +++++
 include/net/cfg80211.h                        |   8 +
 net/mac80211/Makefile                         |   2 +
 net/mac80211/chan.c                           |   9 +
 net/mac80211/ieee80211_i.h                    |  19 ++
 net/mac80211/main.c                           |   2 +
 net/mac80211/wbrf.c                           | 103 +++++++
 net/wireless/chan.c                           |   3 +-
 29 files changed, 1233 insertions(+), 6 deletions(-)
 create mode 100644 drivers/acpi/amd_wbrf.c
 create mode 100644 drivers/base/wbrf.c
 create mode 100644 include/linux/acpi_amd_wbrf.h
 create mode 100644 include/linux/wbrf.h
 create mode 100644 net/mac80211/wbrf.c

-- 
2.34.1

