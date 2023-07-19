Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 154C87590CD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 11:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0621110E42D;
	Wed, 19 Jul 2023 09:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062.outbound.protection.outlook.com [40.107.212.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AB710E42D;
 Wed, 19 Jul 2023 09:01:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXn27LZgiuVvjBSjBAnTMk5wfr/BSJQb1zkpulMzS24a0IJVRAHXhitgrI7K57tKiXacuitUoDFuj8fdFG+4zFYquEb0Ki3/i4j3OjlWBBNCuyvAJlOEh0HjWT1MsKOh2C1HZp1A3Eb/4tR06l1DGNtsacnBWJynrSRz0TEfMXpgj7RPck9HfAFMPb8aUvZkxQ8vKV1GA4OqW1jGzONJIwLuGkVd4VL7ppY8fw5wpVQdYxRIkLeynW0jBY964zLe6qWNOa4mezQ2oedz2s2acvkpkOyjd1UqzjAQr9MFWgvUIi0t61WaW/Z8EobTHU0wHUx8B+r3LjSUSu4INhYAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhfc90PlvX1aDZVhH90jBBMRFzew0HtKUqdH6jqfBd0=;
 b=CcSRlVpEEY3y0UxDn1ZDNxsO3SCGETY/cgCoskg4V0zkd9nIfV5mK2JMB53/hI7Y8E/OW/cEcFux9fkYhNIsR1H7elXtmD3hqvTgvpBbIdfV22xeBWK4Qyqg4YNH2UWipJNX/vokAmwMHY20IX+tpLyhgTApzSci3dQJp4J6BD7eUhhOPLKR+1J+OcDBkiECsBaCDshNqriADKJrOPN7JA7S8N02p77b4xKCbaUi6gUvNc3OEiTgie3vGE5/VIfJB45su0j1Cj1UyX4pFiFFHm1e7va3222RUDel4ujbkrqCxm/PdwGkYjyG+y+CT5/uA3EFodo5UAnbOaZg5p2B6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhfc90PlvX1aDZVhH90jBBMRFzew0HtKUqdH6jqfBd0=;
 b=kHkjL5stggpoIKeKrNDZD/mTshyIlOHpolPJzGwsr0cfe6keLVeB/Z3qaWKTZi0bO7rLrWk2tuA0PZROwvx1KFxp7UyLsbUnz7Cmv0k9XYD2s33z52E7GdB54tBmzwN7rSN0Qsal9ULBJf8RivfuGilCBXx3SYyaFsLD5v13v58=
Received: from MW2PR2101CA0003.namprd21.prod.outlook.com (2603:10b6:302:1::16)
 by LV3PR12MB9401.namprd12.prod.outlook.com (2603:10b6:408:21c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Wed, 19 Jul
 2023 09:01:21 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::e1) by MW2PR2101CA0003.outlook.office365.com
 (2603:10b6:302:1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.9 via Frontend
 Transport; Wed, 19 Jul 2023 09:01:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.20 via Frontend Transport; Wed, 19 Jul 2023 09:01:21 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 19 Jul
 2023 04:01:13 -0500
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
Subject: [PATCH V7 0/9] Enable Wifi RFI interference mitigation feature support
Date: Wed, 19 Jul 2023 17:00:11 +0800
Message-ID: <20230719090020.2716892-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT035:EE_|LV3PR12MB9401:EE_
X-MS-Office365-Filtering-Correlation-Id: 544032b8-aa6a-4956-e0d8-08db8836b8cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y4IqmUCsBytbPyv+SSSyd43xHiLIqjfN4OXsTOnb0ooP+hG/425ISxAE2tr/jyVQtxHyRju/pNMkt4LfrcPlAiy+HKZPlp5M0eJ3ZM8Zpiy880IiKQrE1u4UzYXJ8g/3Hn4VXADYraYiWzimFuM7qc+39ZCv60IrP+Cf/XlStxpF/O4CKxZ/WIklatiYQENA3SPyp3mW0hfuVRa7ogkOxMjyr/KA94lwu24mh6mBKUu3SWeZa3IcVMnbZC/KUxZzFn8HWZ7TAK2ih1mUae81SGj2oOMQFGo9OhhiXEVZONxBy4M/O6Zflr8th5K7gJSIMqzfh6TdKu9rsGCuGEI4uCelb0GB9u2ytKRdS1FvKajFXleasuCC7DiT6tblc7WBhHfJJWhrFV4Afr8e5fv4adnSixBOeXmntXxoFJf5xXM8HBEP+U9p4tNJHcwW9Bkn3DdB8gSAykHdkfqreRGD1Zu0/OUjaevdCyam61ob2/Q4u8jpOzGRY5iTnrnr4hEO9x4sWiQXQSJDLvQrZw34ZlZYeUGXVM38jMKsA6gp0/G6DmJnqqOjoRLg1BTN7i/8NsRTFmrLz7W5nt3cng1pETj/1agTaGI8lvIGfy/MtsA4ZQwiHaekJig0s4HrWx4/xn6MI2KMxldb34t/QI4JxV6L7tWtIwgaZhHcn4wMCg2HJbjEATaFSC1Y6DjfUV+0QuoHhwCGQolpzeUvKrlRR+H4UXOZ9gVDI2/puYZkXaHXpR0PSNdXy9qZecWg4ids/luy5PgmsFYR3uVgYgUmLaL3Tsv+rdiLlsVT/JfrxmVybsb+cDDjTitaJT5IwTXIqkZC1AsQhpxtmOBK9cz/iQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199021)(82310400008)(40470700004)(36840700001)(46966006)(110136005)(54906003)(478600001)(1076003)(7696005)(26005)(36860700001)(186003)(16526019)(36756003)(70586007)(2906002)(7416002)(41300700001)(82740400003)(44832011)(8936002)(81166007)(5660300002)(8676002)(70206006)(316002)(4326008)(356005)(336012)(921005)(40460700003)(40480700001)(426003)(86362001)(2616005)(47076005)(83380400001)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 09:01:21.1581 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 544032b8-aa6a-4956-e0d8-08db8836b8cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9401
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
 drivers/acpi/amd_wbrf.c                       | 282 ++++++++++++++++++
 drivers/base/Kconfig                          |  37 +++
 drivers/base/Makefile                         |   1 +
 drivers/base/wbrf.c                           | 256 ++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  19 ++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 213 +++++++++++++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  33 ++
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
 29 files changed, 1252 insertions(+), 6 deletions(-)
 create mode 100644 drivers/acpi/amd_wbrf.c
 create mode 100644 drivers/base/wbrf.c
 create mode 100644 include/linux/acpi_amd_wbrf.h
 create mode 100644 include/linux/wbrf.h
 create mode 100644 net/mac80211/wbrf.c

-- 
2.34.1

