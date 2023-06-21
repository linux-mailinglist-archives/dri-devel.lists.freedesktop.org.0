Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBBB737AAE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 07:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4380D10E3AF;
	Wed, 21 Jun 2023 05:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE31110E3AD;
 Wed, 21 Jun 2023 05:47:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTR6BzTtLJMRQROnc1JJ0pw8obzdhLyR2OZLRPzOw+ModvCnudhMCwOPIQPHFNxDaRq5IKHHKqTpyWF9Mg+LjeB0K5cplur8DrVHySVnQH/luGLadyh1vpNis9HdRU4mkl+3b16pkDidk1zDJ9NC02gCt8qImr3A6548JIPhO4A7t/WaDABMkKcaJwqHeQ9dm+RLYG+4mAzkalJGpj1oAeXNtRRMA+xJQo2yfdTcDXcSWlzJU8gr8xOJ14aVCpMpusxqUEyrtTp2cuDYJqV1/E5Jh21QXzQw13ZN5LNDCeDibabb1jLnWi5Vv1QLqTS5qK6GbKy/EARmyKFujJPiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPCXSBJB95CrtVANFWpMgCgbgXwS0bqES1Z7lcUgTw8=;
 b=O84jZ2gm2LGNjZdteXJdqV+kOHXd9ZzHScrgn74xCC+u+yHLuMt5mDrlAu5/rES+Oh4QIpERzoGubW4alpKp79pAfoDGfhqHxOCdpGqxSIeVKGYtw4inyVSAiFx3kty8Wd64TZOxZw9BWMC2JmdLAkTWm+JAGnOKf6d0EMrrDx3gOqMAva51j5JUAqWgG8kmyDcvKoNYCa6/Ew710oWSY5yVFjsl1LoJuiwuninyiNf9OHaM8L6IYoMcL/HD7G4gf5L2UQ5lKFmKxrc5XcfXu7hbRo8MDC0odiOE8uVYviE17NUbmk/jjKoHcDuPKAb982MzHC4fBxL95TOwuEZNhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPCXSBJB95CrtVANFWpMgCgbgXwS0bqES1Z7lcUgTw8=;
 b=HKc7m8lZC43IeQZDoNtmhFPiVLVW9MqfAd0TnHtKCukvxCJjrW7N+IrfkKYu5Gtqs/rqcJjcwdsqs8omyyfFqieQ0yiQzv1nhkQ7ZVrLjkeGnH44XAMa0Ug+x5H8yJBYIrhRZ9D2aWZ5UDMdlSy+DnD/xecwxnp+EQ9T7f0cT+A=
Received: from MW4PR04CA0210.namprd04.prod.outlook.com (2603:10b6:303:86::35)
 by MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 05:47:22 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:303:86:cafe::9e) by MW4PR04CA0210.outlook.office365.com
 (2603:10b6:303:86::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21 via Frontend
 Transport; Wed, 21 Jun 2023 05:47:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.17 via Frontend Transport; Wed, 21 Jun 2023 05:47:22 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 21 Jun
 2023 00:46:43 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <mario.limonciello@amd.com>, <mdaenzer@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <hdegoede@redhat.com>, <jingyuwang_vip@163.com>, <lijo.lazar@amd.com>,
 <jim.cromie@gmail.com>, <bellosilicio@gmail.com>, <andrealmeid@igalia.com>,
 <trix@redhat.com>, <jsg@jsg.id.au>, <arnd@arndb.de>
Subject: [PATCH V4 0/8] Support Wifi RFI interference mitigation feature
Date: Wed, 21 Jun 2023 13:45:55 +0800
Message-ID: <20230621054603.1262299-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|MW3PR12MB4379:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e8a027e-6bce-4d32-1adc-08db721afbf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SZ8Xwt23Dtkxv578fkH4AwjF6vR/GCZyL3HGsqcBbOpwK24tisrf73DUJ2vO4u4IOArN2WwYUTDdNU6yvQiJgfOAXn/n74xnWnFxx86L5TFSfVmWnANPiVBzqiw1SGZHW9njiUbZiaPjgJUCWu+f5ZpYbJjvkEr5x516NDrIDW30fT1u7fKvnLU5NJ5GgGApjUeEFlv4B/7OAsgdHco6a4jYAvrvJbBLcU3qunkZrFBb4C/4klmkxoAUSf5qCDP9R21U/WlrK/AOShUzK2+9qbtnjS8VvUJmuq47L4RhraXzLkZ5kKt7ZjhVrw/EQt1a8n2IYFl1xXrmfxM8jv9XDOR2sT71rwEhC87OR/2KDfVsPlJ6nofc4h6dTJs137+hixo5g1LAgXDUPMw1MHh1O4R0gFm7gV5HEciKAZD6vfp7j/XkqSSjRlN2U0BUSIjVXhxebv/qe9TLx6uy6J5BwpNdhNpiue7NVwDFrz+CAP1LKgHMy2EhEVuEP8hfVtvrYHose5wsnKy74EOEnWtGlF3VDVGMVMBMJpZydaGvjhZ+dEA+wI5kDWPtLd4+jQvH2MXev5l87Xyebw3XQQemGIW3fCz2Eh1UCztiPTneNvECLh1hF8/O/kgxke92oxO+mee/yrDz8rXshrevMthOl1RsTl1+5AkgqK+K2cp+CpQtDgUHvlJKUsAcmfbZgGoWhEtR9e0+4BK7M/Eh5Y2r/c/N6P5CvZTZbAxOGbWyksSfxhZOsb6QC7jXf9lyXRd19M1WJU2TG9r3LVquFS4guqlQczlckQZHyZNv1w+eLHvkO7dCMdc/Gmnq0ojmR3HgD4POkKvLa83LXXkiGO6Z0w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(2906002)(7696005)(82310400005)(82740400003)(6666004)(356005)(81166007)(921005)(2616005)(83380400001)(336012)(426003)(1076003)(26005)(186003)(16526019)(47076005)(36860700001)(41300700001)(86362001)(54906003)(110136005)(478600001)(316002)(40480700001)(70586007)(70206006)(36756003)(4326008)(44832011)(5660300002)(7416002)(8676002)(8936002)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 05:47:22.3783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8a027e-6bce-4d32-1adc-08db721afbf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4379
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

The whole patch set is based on 6.4-rc3. With some brief introductions as below:
Patch1:     Core ACPI interfaces needed to support WBRF feature.
Patch2 - 3: Enable WBRF support for wifi subsystem.
Patch4 - 8: Enable WBRF support for AMD graphics driver.


Evan Quan (7):
  cfg80211: expose nl80211_chan_width_to_mhz for wide sharing
  wifi: mac80211: Add support for ACPI WBRF
  drm/amd/pm: update driver_if and ppsmc headers for coming wbrf feature
  drm/amd/pm: setup the framework to support Wifi RFI mitigation feature
  drm/amd/pm: add flood detection for wbrf events
  drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.0
  drm/amd/pm: enable Wifi RFI mitigation feature support for SMU13.0.7

Mario Limonciello (1):
  drivers/acpi: Add support for Wifi band RF mitigations

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
 include/linux/ieee80211.h                     |   1 +
 include/linux/wbrf.h                          |  55 +++++
 include/net/cfg80211.h                        |   8 +
 net/mac80211/Makefile                         |   2 +
 net/mac80211/chan.c                           |  11 +
 net/mac80211/ieee80211_i.h                    |  19 ++
 net/mac80211/main.c                           |   2 +
 net/mac80211/wbrf.c                           | 111 +++++++++
 net/wireless/chan.c                           |   3 +-
 27 files changed, 943 insertions(+), 6 deletions(-)
 create mode 100644 drivers/acpi/acpi_wbrf.c
 create mode 100644 include/linux/wbrf.h
 create mode 100644 net/mac80211/wbrf.c

-- 
2.34.1

