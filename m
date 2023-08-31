Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A19478E639
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 08:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C6110E551;
	Thu, 31 Aug 2023 06:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2069.outbound.protection.outlook.com [40.107.212.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B129D10E16F;
 Thu, 31 Aug 2023 06:21:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InmPMiQEHmRh17pc01m0OnnXFlDs73fIeUY1Nmmda/22ud3kw2BDvBqPk8wBs/hog+mX2dl5hkj3LjVyftAzxoj+GLxHp20OPCQ+9CLucsV2ftL+oaZvc5QiYcUtU9mmENRx0gnFlIHt/cq2tWov9XOtsKuR3/T4B0xfvizGspAfwV3XE0tJ5u+CK90tBi3CaMBL0b/1Z9K/KultJXKMB93XiTCvl/tqAK4ut58xVUuPt1vSB38vajNJjmwSGplWvgyGRzqMd488ss2gBFXs9e/FcoBXSX4hcoJ29F+SgWZl4oBQNHLnB3ofKzy2Hk8SUKn05FTBZzP4B23XeKdYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBVHUHsTkn24bWu/rkYnEOGwggNfkFjB//MqH/AIN2s=;
 b=cQgAzvbzwpMVXN89IbJnoKIc1YxQdj+Av+iCM5ZioO8nUXVBOtRUYbBPxBkoCj9chBnH0EHNO/1S5PV53fvyVX3hWPlUO4uo0jmHW0pw3n+aogij9hYy8Xm73lIoGrQXWxIcJBouk30jWet6BuxPcuFpHGF3Ug0h+oEyNX78t9lVbIHLBtSN29qdFkum6XSCEbc+pRkvS7q48TZUvhfgqYB+aIsOI6vya+ltEwCXn/Pj2qhKqkv3ws14KTMg2aP4eIwCB6aZ8rPMc/L2UqMAccQr0Mhzv0pyHBtm4Lft/yn5022Aa47F6pil1WkuQ5nMER+V82onZOt/WmJSSuR/qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBVHUHsTkn24bWu/rkYnEOGwggNfkFjB//MqH/AIN2s=;
 b=2LIqEdCggZlp1Ij+wRkQqS31HYFXn57UD4/thFiRr8MZ0ogE+2cHbnKNqbPC9tE4RPT/wFOlJIx0nSHAqcpAxK5Av4lg11RQxODgJu7XKkUfgL9kT9J1j3eDoJPC3uCRrLZC086hXqbcryk+blQFzwcDTVA9pWEQRUg1AzuacSY=
Received: from MW2PR2101CA0014.namprd21.prod.outlook.com (2603:10b6:302:1::27)
 by DS7PR12MB9042.namprd12.prod.outlook.com (2603:10b6:8:ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 06:21:06 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:302:1:cafe::61) by MW2PR2101CA0014.outlook.office365.com
 (2603:10b6:302:1::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.12 via Frontend
 Transport; Thu, 31 Aug 2023 06:21:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.2 via Frontend Transport; Thu, 31 Aug 2023 06:21:05 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 01:20:56 -0500
From: Evan Quan <evan.quan@amd.com>
To: <lenb@kernel.org>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <alexander.deucher@amd.com>, <rafael@kernel.org>, <Lijo.Lazar@amd.com>,
 <mario.limonciello@amd.com>
Subject: [V11 0/8] Enable Wifi RFI interference mitigation feature support
Date: Thu, 31 Aug 2023 14:20:23 +0800
Message-ID: <20230831062031.1014799-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|DS7PR12MB9042:EE_
X-MS-Office365-Filtering-Correlation-Id: 35e20041-acaf-4ca0-a384-08dba9ea755f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3b8oQBlQBqr+tEPBIkrHfZXknIAwzcTjXh7UtLDaLvkaz4M9qVwGDJ7u2HkHZYTCgdj/Xc9eIupgG3JqjR6OyCudrR1yug0uuKE818X9p11jj//8A6bPCxEXf/7UcQbhGxSzasY01+/bTrPukfbHbmYTnBqL+oCAH8kaF/B/4HXU7QR8eHh6s+q8kYZU3IL3Y5gI1i03vJfcvM3PirDvMZERLreKQPtoWelJYRA6YVoG9g9HDXH8bj9czevl/kfhQoy5S6nW5lpkHJYflsHWeGjsuOO9TAv3dEcecEO6qRmdX+yop2Yx6je1HaboGz9kw/EDLTyuaQeEUstY0Gcdi13BZBpmOwRdiyfE8L+EZxs4IaaRzoIvl120cE7QR8RvGRa9FlZtlSybPOdSI2sfXQOI2eg1e6hwxphULUqrNaDS5lmJ6Hy/maIwhJmPbffZ+IAhqCayMrkRGBH1eE5LER/+aIKd3iBc4vBOdS3peByQYy7hOkMPjuqOHo0dcU/oEAMfTh8QcdI8/nsApVXt6kRupCP0ZgctqgHEz0vECgzvGrk2wLZNdU6+tYEx9Oa4bdOVjFP8L92pZ19it55vBkisNus4xlfgumVgEXYfooSve/ygX+J3it59NgvQfNcWEMmx+ZbGxUSJ9TI6rvEzoP2SLq7OHhXqkDNWgxQFGkuk7pIoo7UiHVPyPoZ3jq/c+Lnt+l8WBVj8NTnkvkGTYc5vpcihOUjZKxkLj8TuaqeVQ5HQzFZ9491oJ4XUFJY7Yb0wKR1Pjhrkn1fxoES3m0T+p4lLsGO7bj/+vZ26sdI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(1800799009)(186009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(70206006)(41300700001)(8936002)(83380400001)(40480700001)(47076005)(36860700001)(336012)(8676002)(4326008)(478600001)(6666004)(6636002)(110136005)(70586007)(26005)(316002)(2616005)(16526019)(426003)(1076003)(54906003)(7696005)(2906002)(356005)(82740400003)(81166007)(921005)(40460700003)(5660300002)(7416002)(36756003)(44832011)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 06:21:05.7513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e20041-acaf-4ca0-a384-08dba9ea755f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9042
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
Patch1:      Core functionality setup for WBRF feature support
Patch2 - 3:  Bring WBRF support to wifi subsystem.
Patch4 - 8:  Bring WBRF support to AMD graphics driver.

Evan Quan (8):
  ACPI: Add support for AMD ACPI based Wifi band RFI mitigation feature
  cfg80211: expose nl80211_chan_width_to_mhz for wide sharing
  wifi: mac80211: Add support for WBRF features
  drm/amd/pm: update driver_if and ppsmc headers for coming wbrf feature
  drm/amd/pm: setup the framework to support Wifi RFI mitigation feature
  drm/amd/pm: add flood detection for wbrf events
  drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.0
  drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.7

 drivers/acpi/Kconfig                          |  17 +
 drivers/acpi/Makefile                         |   2 +
 drivers/acpi/amd_wbrf.c                       | 414 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  17 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 214 +++++++++
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
 include/linux/acpi_amd_wbrf.h                 | 140 ++++++
 include/linux/ieee80211.h                     |   1 +
 include/net/cfg80211.h                        |   8 +
 net/mac80211/Makefile                         |   2 +
 net/mac80211/chan.c                           |   9 +
 net/mac80211/ieee80211_i.h                    |   9 +
 net/mac80211/main.c                           |   2 +
 net/mac80211/wbrf.c                           | 105 +++++
 net/wireless/chan.c                           |   3 +-
 26 files changed, 1143 insertions(+), 6 deletions(-)
 create mode 100644 drivers/acpi/amd_wbrf.c
 create mode 100644 include/linux/acpi_amd_wbrf.h
 create mode 100644 net/mac80211/wbrf.c

-- 
2.34.1

