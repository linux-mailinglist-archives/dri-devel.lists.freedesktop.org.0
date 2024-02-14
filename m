Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 456F885553B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 22:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2828610E3A4;
	Wed, 14 Feb 2024 21:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="m5YUhAvp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5CF10E09A;
 Wed, 14 Feb 2024 21:58:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vxr66pRLJeieSgqxFjVs4NN330sXRuzS9iiOwnMjkParg763oTEogTtp8aKfMBQpQCkR6h/9FnLRvG/Ao3UZLeo4k+B4Hs7k37R4zUaJ58wZCkKjk8uQrTaccuw5W0OLIlJ78XyJZvodjxBJx6bYShe1CvwKxo5n8GOAYvCTmNbcamWH22YCtx60+LzYE+UZ1CXO/RtAoivt9RzVuwUX5y/A9AWX9zreA2+DVl94w6XlCPGU1EOzTg7dwncf4o2ActcljH8lJLZh/O7bZUQRUUcTS92xOAe1uus+1M9zj3G9VIIWzFVhyxYXOp3VMg4zhwmhtSBkNWXcYZobOuum6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qqdtiNgAqw0BO6nbf/U2/XD22JRWHwjPHFynBAaKHo=;
 b=K9BtPOftv3qpKt0knAhgpoKUHU1lJO09yaWfE1Iy2B+2ryKPxh6nXOE2RxQgdpYNuHvfyEqjn7yQ+N7de6I1BNfsznNYlrFBH0Ebzy0ZiwfAbFDhev/Nj0PXKwp+xLlSOE4eUARmXR8lUQF53aZ8l28MmsOjmky5Gs8FJl+G6O0MqQ8789SJDZg5oFBjq+hFcLSX8vzQoYP2LSsbycV/zm1X1GzqxMX8olr12IDRj0CCVYvlPG55wO6Xbu0UuIOiI9Q7sBAybg8uLVU8rFtBYADoaJA62fT9rzSkr2bYSiOdek+aWokLZ4ZCX/63eZbZ7w97pl6nNv7GP4m8b2EmxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qqdtiNgAqw0BO6nbf/U2/XD22JRWHwjPHFynBAaKHo=;
 b=m5YUhAvp5IsxSQXmHPMQLQEGpSi0wuVML9zsO2y2A9nPOOAwBNzYU1KtnLKlQ/zxdpxcVvd4QzSjOBJK0WRJPoluTcmhRTD/q4Ms0o3saq0Jgux7nr9KSGiO7UvkxvbyIUiSSOB5S+JBNVjqIzftSY6fpuTfNXxSP6jWNm6U1Ew=
Received: from BL0PR1501CA0004.namprd15.prod.outlook.com
 (2603:10b6:207:17::17) by MW4PR12MB8612.namprd12.prod.outlook.com
 (2603:10b6:303:1ec::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Wed, 14 Feb
 2024 21:58:27 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:207:17:cafe::df) by BL0PR1501CA0004.outlook.office365.com
 (2603:10b6:207:17::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.41 via Frontend
 Transport; Wed, 14 Feb 2024 21:58:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 21:58:26 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 15:58:25 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Alex Deucher <alexander.deucher@amd.com>,
 "Hans de Goede" <hdegoede@redhat.com>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>
CC: <amd-gfx@lists.freedesktop.org>, "open list:USB SUBSYSTEM"
 <linux-usb@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <linux-renesas-soc@vger.kernel.org>, "open list:ACPI"
 <linux-acpi@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Melissa Wen <mwen@igalia.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v6 0/5] Add support for getting EDID over ACPI to DRM
Date: Wed, 14 Feb 2024 15:57:51 -0600
Message-ID: <20240214215756.6530-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|MW4PR12MB8612:EE_
X-MS-Office365-Filtering-Correlation-Id: d3b2eb89-dbc3-4b06-2218-08dc2da8128f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eom7XwadlHEUd1nPgW4D5bqUip9Obx2DPHKyPiuHbnKwzsRorK4GwE5+R60EuJfk6Llzk/okwTUmlRhMNvDox5VSkBsTDjXmJk3bko8FBoffWmVkFoB+SGMf4kNUYwrRlzgMOSlfEuXSK3GLfP3Y60pTy0t3b4he9gpCfYZ4CqNiX1+bNFH50/fSsp4rm3PLVbUUTiNP3R1iVCnrog7hkB4dkeUN02H27CXwHAdjKOCnvN52Tu6hMAZjlsB+wWATJ0scBn2Xg8bPUz7ycgLgYFY7MEIt/3gZsucW2D8lkP8NUg+0fwDRvc/1HOxJFfoPwB5eSVpJVVxjNTTcjfoZHOss7ylftGTJv5x9nG+hHPbqtkZy7Y1uUfRw4gdg4rFQ97vnifo1sMpZojO9pAYVM3smMKyufoTGnVNkWVFBR0WOiptLatAhlXfBZKJ17dWzPzC4UQ7/EeLQfqAzc6YvtoaoWoT95MiP/jFxFqI4CQTvyyTfwRNd+qsZG9Lobvm6g5EGpwGOdLIDTq/Lb0s1Of/RDcT/eQlcmJSK6qXuYnqTEXSCsk+N5Gm/bYJ9YQcvRuBWJQU6pmbHmb9ADjG17wZkY42wyl/QhNTRelRAd3vbTpYwGSgOBeC8tQr5DaV16oMcAyyvS+PK/nDvV/G8LwDKx+f3Blk1Wg5O7q+zsiY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(36860700004)(82310400011)(186009)(46966006)(40470700004)(6666004)(86362001)(41300700001)(36756003)(7696005)(83380400001)(4326008)(70206006)(8936002)(70586007)(8676002)(54906003)(1076003)(110136005)(2616005)(316002)(16526019)(2906002)(26005)(44832011)(7416002)(336012)(478600001)(426003)(5660300002)(82740400003)(81166007)(356005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 21:58:26.8424 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b2eb89-dbc3-4b06-2218-08dc2da8128f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8612
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds the ability to fetch the EDID through ACPI for laptop
panels. Drivers need to opt into the behavior.

In this series it's enabled by default for all eDP or LVDS panels with
AMDGPU and certain panels for Nouveau.

Mario Limonciello (5):
  drm: Stop using `select ACPI_VIDEO` in all drivers
  drm: Stop using `select BACKLIGHT_CLASS_DEVICE`
  drm: Add support to get EDID from ACPI
  drm/amd: Fetch the EDID from _DDC if available for eDP
  drm/nouveau: Use drm_edid_read_acpi() helper

 drivers/gpu/drm/Kconfig                       |   1 +
 drivers/gpu/drm/amd/amdgpu/Kconfig            |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   8 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |   2 +
 drivers/gpu/drm/bridge/Kconfig                |   2 +-
 drivers/gpu/drm/drm_edid.c                    | 109 ++++++++++++++++--
 drivers/gpu/drm/fsl-dcu/Kconfig               |   2 +-
 drivers/gpu/drm/gma500/Kconfig                |   7 +-
 drivers/gpu/drm/gud/Kconfig                   |   2 +-
 drivers/gpu/drm/i915/Kconfig                  |   9 +-
 drivers/gpu/drm/nouveau/Kconfig               |   9 +-
 drivers/gpu/drm/nouveau/nouveau_acpi.c        |  27 -----
 drivers/gpu/drm/nouveau/nouveau_acpi.h        |   2 -
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  35 +++---
 drivers/gpu/drm/radeon/Kconfig                |   9 +-
 drivers/gpu/drm/renesas/shmobile/Kconfig      |   2 +-
 drivers/gpu/drm/solomon/Kconfig               |   2 +-
 drivers/gpu/drm/tilcdc/Kconfig                |   2 +-
 drivers/gpu/drm/tiny/Kconfig                  |  14 +--
 drivers/gpu/drm/xe/Kconfig                    |   8 +-
 drivers/platform/loongarch/Kconfig            |   2 +-
 drivers/platform/x86/Kconfig                  |   4 +-
 drivers/staging/olpc_dcon/Kconfig             |   2 +-
 drivers/usb/misc/Kconfig                      |   2 +-
 drivers/video/fbdev/core/Kconfig              |   2 +-
 include/drm/drm_connector.h                   |   6 +
 include/drm/drm_edid.h                        |   1 +
 30 files changed, 165 insertions(+), 123 deletions(-)

-- 
2.34.1

