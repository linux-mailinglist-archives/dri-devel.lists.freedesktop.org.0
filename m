Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FF3788249
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 10:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DE710E62A;
	Fri, 25 Aug 2023 08:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025FA10E62A;
 Fri, 25 Aug 2023 08:39:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2IJnaqAy6f+De3Uqcgs37+GL6mvgi3PHiEm24bKYxCQXPVNqtpdybXD/DYC9X9Zc+O7edgyoQIuo1SfLM51DESybKSxKX34PiCRq6VFfCD1v7HaiabqMmzj0NVDOoyShPpmbS5odxa2DQKH0Ub2j8MKdR9IiCx+9mciSbNKxwY0moDRHBKYrP72ryFYR4doq+q2UALO2bnWVsfDxiaCqX6H0mxtQD7xn5jKR/vvMeI4DedeA5U47hacYQ6Ul2bJNXrcC4oOzoRY26KmvmHbdZ6XQgy75pTwc2itr5R2FWn4qtebQhj2EYJ6sj9E0q9lM4oZTIuBwBNZd/8BWrMrMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2EDYCFsd6zha1jrnQQ0KcCa3cUuiIV71Xaj/r0uBws=;
 b=Yabskpz162BE+2PBNf1p84+LSIbAR0zid70u7qfU52Wb8dFQUyX/bZDfBlUgGxjeY+KsUDh1ob0gmpfsB5M8ToZg3EM7e/7CjmqpXaM1jouNhYlHsG+K8JEXeqOPw6MLaryNslRi7O7rmwodn2otqddvELenGO2jA5XwSqHjefNw8QoJpLFzcB+/vsYxKr4F6KVpyWJTK18iI4OVB894Hnps2ILiIqdAjbSjVl5A+eu4hdIFSCtiM1ID0pJjdyYlXWwdWWcAZOD+b1O4RLXvXVXScWId5zL3ae+cAbS6tkIC9DfWToPH7W0BVSfhwLGz0zK9qybRTxmAODnwInfCKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2EDYCFsd6zha1jrnQQ0KcCa3cUuiIV71Xaj/r0uBws=;
 b=aM7LYB65zhxvYiP+RUGABO/CxAjRHzrQH9Q7dpT6uhnLZvO4po7By/qwE4SwCPsMjaJ+bEZae/Vr6Wf7kfUdvoqLAGyhjbBhvXZNmM4GVIjmWdTxiEaVTIHZVulfJv7zQxf6yueVbfufa/okZ/lN4LDZnDVTdJnFhaN96N655w0=
Received: from MW2PR16CA0001.namprd16.prod.outlook.com (2603:10b6:907::14) by
 PH0PR12MB7864.namprd12.prod.outlook.com (2603:10b6:510:26c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30; Fri, 25 Aug
 2023 08:39:50 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:907:0:cafe::ff) by MW2PR16CA0001.outlook.office365.com
 (2603:10b6:907::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30 via Frontend
 Transport; Fri, 25 Aug 2023 08:39:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Fri, 25 Aug 2023 08:39:50 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:39:45 -0500
From: Evan Quan <evan.quan@amd.com>
To: <lenb@kernel.org>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <alexander.deucher@amd.com>, <rafael@kernel.org>, <Lijo.Lazar@amd.com>,
 <mario.limonciello@amd.com>
Subject: [V10 0/8] Enable Wifi RFI interference mitigation feature support
Date: Fri, 25 Aug 2023 16:38:38 +0800
Message-ID: <20230825083846.4001973-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|PH0PR12MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d9f1936-6313-467b-a535-08dba546d887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cxFrvCNDsEerulxmOk6ujA193hx8RuCZhtdAlSjowilxH6CTwVI9Er5DvgVZJFFPm4DkrDmOHbrUMazuwSb3gDFDEqB/yHMjcWSfXGReQwStiFDwKlgcfd4YDU5qNFTGCyTWZlzt+aFAA29cAPSxmMxx1FaloV8l0CmDdK6njiBoyR3TeMpGldsniV2Byd57h/JGXlI1XufJbQ37ZeXm3CEPfC4yHiZTgP28TzzmV5WCnHLyI+qFvrOLKyObnBGjeHKLAcx5TD1X8yBB27sozyTUO2HeRMD8fu4314uIGfxQt5FWD4YscMpR7FYlsWzkqDJTw78h+Mdjqct+1g1U7NqA31b1LIDaLRcL9Os3DxOZpzoVvI5RSDTx+4oweKtTv0omv2QmtqRHofHjpDzx8Kx5uy7EO0eANo2Xzp4kcGxs5MtG832dyVQ6eOWd5iFalWYt/GiDhtbMXH2gB6inDNP14QBlNWu+paCH2EWN2tDnlqToLcEHHTqhjRT5JmXwKCFf6NT8ptlGMQFeWg70GAndSxPL45SoLulMUaml9zD7XDKXxsitk1UV33m3BcWuyXf6DNvjdVAM/nJCrBDBDNzGYBOsmsz4He6jEKLVeMOpi7zUJaH6lRsXeuCIEWvymEFbSl7TmNsMhem7ruGQRA6jO1pKc9mzRqjrh7qymRol6kL6z0yzpNdIFokudwPrdtnuaK+rHW5VTE03LA3ifzLMEUS6GYQvEuCU0AH4VTNGb1IW798BcqjZfqLsSwaPe51HX6Ewx5nEqMiM5X2MxOcnCld4ecGa3+N0RHpxILA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(136003)(376002)(39860400002)(1800799009)(82310400011)(451199024)(186009)(36840700001)(46966006)(40470700004)(336012)(1076003)(36860700001)(44832011)(7416002)(83380400001)(16526019)(26005)(478600001)(47076005)(40480700001)(2616005)(5660300002)(426003)(2906002)(8936002)(4326008)(8676002)(921005)(356005)(82740400003)(81166007)(40460700003)(6636002)(110136005)(70206006)(70586007)(86362001)(41300700001)(7696005)(54906003)(36756003)(316002)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:39:50.0556 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9f1936-6313-467b-a535-08dba546d887
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7864
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
    Patch1:  Core functionality setup for WBRF feature support
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

