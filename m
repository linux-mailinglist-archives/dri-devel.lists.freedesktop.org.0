Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA21A74396C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 12:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94DA10E24C;
	Fri, 30 Jun 2023 10:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E778A10E125;
 Fri, 30 Jun 2023 10:33:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5Npd76DPhbP60VXzKTU/NXTmms4e2uO6ywXtyR+b46TdJTq1VCV64vdjhHePrT1t3vLklKTamolN9Jf7/g0gse09oAVA8CRo5jkc8sRxar3B5EKkBbdoDWZxYW4m6iiZbzH6jst7LQozFOGeEOj/d09IILuVVb/XA6vcPmAa9D+7GP+JXQPEPF7ZjqkVVDDV3pC28gNJvsTXc/E6kV/ouOGwtpMruVgpXNTRkregunytf91BulWiQZIryXDg83YQzYkhj/6UqTxbpw73msQNwVtb7LXNTYaCZRrCt698jGLTWE//pkBmwwFztTCRLGcDLZstTaIe76QJVxhfNg8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TL4c+OPviGSQDv5O67ryfWB2soQ+mY/5e75OBRUsY/k=;
 b=NlU4j3vDPvt2IqRCdQpiaT8Mp9phhS76NqKKKKo4NGYFtkfRnWZvpWR94xkyHj9cFzhpV2XjV220Fy2SyO2R4MAe7xDpEUNZcpdhggZ7EQjMEjbhrxgScwhoKIQDC1za02DiOP0aLQVY/H/6gi+sipfPSO8hqV/QJrN+AT9jYpIvdYGj3McMpPJTqN4WoMatEWFQQcIe1EK/lJ0OMc3Mn53EUOEYgpfpoIVfgvspPL6PxKCloiTBXneyIXdQ2gRU5xw10LvfuM1W2mlsMNgiV7tOvt1jBZZWBCUbE1/A7s41+mKeWRA4QOq1lm/g+C7ir+TOKTnsG29U52sFByn+mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TL4c+OPviGSQDv5O67ryfWB2soQ+mY/5e75OBRUsY/k=;
 b=XXwOxY8AGnXx6GCE697xIYNe0tXTAvR0fGXYdfZ7a5BB/sFHZthfxQTihZdRjh3IyrmYGRqlFVbHmXDwmC7aj1NDe1kKHCCa1wnGKemQCZZc0rcQxCaklUEZjR8rLbMLXANr716B3qaPXbeQ4GzSW1oXzkmL1Ib62x2IQ7aGKdw=
Received: from DM6PR21CA0001.namprd21.prod.outlook.com (2603:10b6:5:174::11)
 by SA1PR12MB7409.namprd12.prod.outlook.com (2603:10b6:806:29c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Fri, 30 Jun
 2023 10:33:54 +0000
Received: from DM6NAM11FT089.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::8b) by DM6PR21CA0001.outlook.office365.com
 (2603:10b6:5:174::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.13 via Frontend
 Transport; Fri, 30 Jun 2023 10:33:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT089.mail.protection.outlook.com (10.13.173.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.43 via Frontend Transport; Fri, 30 Jun 2023 10:33:54 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 05:33:46 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <Mario.Limonciello@amd.com>, <mdaenzer@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <hdegoede@redhat.com>, <jingyuwang_vip@163.com>, <Lijo.Lazar@amd.com>,
 <jim.cromie@gmail.com>, <bellosilicio@gmail.com>, <andrealmeid@igalia.com>,
 <trix@redhat.com>, <jsg@jsg.id.au>, <arnd@arndb.de>
Subject: [PATCH V5 0/9] Enable Wifi RFI interference mitigation feature support
Date: Fri, 30 Jun 2023 18:32:31 +0800
Message-ID: <20230630103240.1557100-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT089:EE_|SA1PR12MB7409:EE_
X-MS-Office365-Filtering-Correlation-Id: 2700e21f-017c-4738-c7a5-08db795580ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RnqiAibPXjfzzv4xCdE+nfvuAPJSXqID5S+2FhTdOGBOJO7gR1JeEqy++NXQdCukP3hxvjlhtwTOE8oecAnTqnHbUO6R7554/My0vbJh6OQ5zlQdZ/fHdGhA4H7HkLzoK9geRgi2xs1NwxL6i0nzZutRvFiUDL9YNb131I+BFEzzJVPO9bG0Ybtl4Lmosn7EGMUAG4ifEFb3/HUfvpMDB4tzNPTjo/xn88DLvGf7+ClPv5P1ew+ApCDuzD9FLAgVnuj7pjXPqYHPF1Wiu575yptnCo+5q2SXHU36ANbg3Nzt+j+yTBXl7sBGTsobiH+D2JBJW+thfB+CKOOwrqiQWS9XQ5bm2DuQFMxeIx/DfGvyQ5YvJy/5xxtXFwZz2f498hIU0u/8OZPNIU+GjVR9m8Qm7WSH4gFtUcoVDfbSxnaT+OkRpPCVuXUFVLWAVRWl4JhW6XEBuaPOBNb2DixPPu8yK1XFCMETkXPleGsPAWw0B61M6llpdjA46Mq/bpOqHmRyHU57jl/ie3d16I3HRgQJBEgpjnGIBU2JnHYZIPoFLaULUfcnYpshjPQN7PwRTEWevVAnoJ3NWb7CR3k9GiD8hI1D119jYTR5WLZJc0pyg4/l0gxBe8McECWCoAU9AhkrbjtyxtuidJjJdiCpvauS/+lmH/cSN+8RSwXNHQEVv3kUfCunASIWLEqNGKaj6rpRXCe4TlD+AhXuQ1ze4plpSj57HPvWsQtdLQYr7kFtaY0+jULN1OxXR1WMgyJ4KerLUKqCBOAKxuWpDgL9kf1Rfy+xvFyqBZmhONXU7Uw4oxe6H1ZZQDKeK1n8NpTVZMNLjjGgOJBydrcGYq4+zQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(82310400005)(36860700001)(478600001)(54906003)(16526019)(6666004)(7696005)(2616005)(110136005)(426003)(336012)(83380400001)(1076003)(186003)(26005)(2906002)(47076005)(40480700001)(7416002)(86362001)(921005)(44832011)(4326008)(70206006)(41300700001)(356005)(40460700003)(5660300002)(36756003)(70586007)(82740400003)(81166007)(316002)(8676002)(8936002)(2101003)(36900700001)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 10:33:54.4589 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2700e21f-017c-4738-c7a5-08db795580ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT089.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7409
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
 drivers/acpi/amd_wbrf.c                       | 236 +++++++++++++++++
 drivers/base/Kconfig                          |  37 +++
 drivers/base/Makefile                         |   1 +
 drivers/base/wbrf.c                           | 250 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  19 ++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 214 +++++++++++++++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  33 +++
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
 include/linux/acpi_amd_wbrf.h                 |  38 +++
 include/linux/ieee80211.h                     |   1 +
 include/linux/wbrf.h                          |  67 +++++
 include/net/cfg80211.h                        |   8 +
 net/mac80211/Makefile                         |   2 +
 net/mac80211/chan.c                           |   9 +
 net/mac80211/ieee80211_i.h                    |  19 ++
 net/mac80211/main.c                           |   2 +
 net/mac80211/wbrf.c                           | 103 ++++++++
 net/wireless/chan.c                           |   3 +-
 29 files changed, 1210 insertions(+), 6 deletions(-)
 create mode 100644 drivers/acpi/amd_wbrf.c
 create mode 100644 drivers/base/wbrf.c
 create mode 100644 include/linux/acpi_amd_wbrf.h
 create mode 100644 include/linux/wbrf.h
 create mode 100644 net/mac80211/wbrf.c

-- 
2.34.1

