Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C0F86827A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83B010EF93;
	Mon, 26 Feb 2024 21:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lh8uYRw/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6BF10EDFD;
 Mon, 26 Feb 2024 21:11:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gw86vdSSg+i+HwjqRy1aqeR9KYtquw1F+2KwcqlwcipGT/1SxxyStCAWmq4vmqcLLqct8D0ci03StL8zq9w7uoaYrDfQSIVub4x2FPKES3tQA+GZRB6Jy9Eb/0GU4Erkedoecx3gqPdjJM0baHRUA0nipdsHr0qFDjO9BvRDx4xiD7Hts7b3v7aUJyPv/xNm3oHGPnUZpc+dC+LcnTsa3LFw9deHzqQJJ941FWWmP+7SE+L9Aaw0U7n9MshT1VAFspwvFEvZI/gpPADYEYpu7sR81QbfVWeJiDc7okEaYhkwNCBIqIVyMKW3+/pzy87tvHoxZYcIvflNxgd/KDpe2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBYbIHuNv5YlKwxQR3x1/u4gRY5PpNOaJ3vwpviWoHk=;
 b=nacQ2iGRmlnMaiaKhhPzQ+fMXhajWoDhH0993odrgGClC+GGLK1xL9MWlW3aI5E2Nm7tnBZ0DfHORLab5Yk6ihJoPPBzx3Yg7QcGg4NOVX8jtJiBR2QsA1s4CDi4tIKAZBC/IxZ6Urpcz+SRCMy3Q8wtTkQYSfxWziPbJvAkZmllsRUKIXscmx+Rme9yUtK/al+88xJnmXt34/e8ecqgJ2TTXCIfB4yuJKlk/oFMcMeBN/vsJfRF6aUUa/Jw65XkMG96j3+2rguIaT2GBmN99fIuQtmWKfmFwkKcojxi8hb+DbK+1Lm/oCjal6tycnLzrkax6JAsSPKr9TEI2hEx1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBYbIHuNv5YlKwxQR3x1/u4gRY5PpNOaJ3vwpviWoHk=;
 b=lh8uYRw/+EdlTvaDX/asnI1xggDT3H7m/pLf5Ls5mDN7nBLT8YNUjDlO6fUqJ8w8aJ5N40NhlSqhd4rSMxCM+lsvv6jRxzy0Ui2uGAtDoLzjiq3kyxWkAORhJ2aoYL38z6pdhV1ab4FCFoHYf58gASPBww0xS3P6VLSbA3891iI=
Received: from SJ0PR13CA0073.namprd13.prod.outlook.com (2603:10b6:a03:2c4::18)
 by CH3PR12MB8075.namprd12.prod.outlook.com (2603:10b6:610:122::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 21:11:10 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::2f) by SJ0PR13CA0073.outlook.office365.com
 (2603:10b6:a03:2c4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.28 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:10 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:07 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:07 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>, Simon Ser <contact@emersion.fr>
Subject: [RFC PATCH v4 05/42] drm/vkms: Create separate Kconfig file for VKMS
Date: Mon, 26 Feb 2024 16:10:19 -0500
Message-ID: <20240226211100.100108-6-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|CH3PR12MB8075:EE_
X-MS-Office365-Filtering-Correlation-Id: 46c89d13-2e86-417c-c614-08dc370f74bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UREpd2UWD7k2nfBoNlniDOuPoVhDMMQSsIsnivXcOPZQ0LcP2fRMy1XWS735nVlrCdNpN+MlLbKl6ZZvFAbJ68ryvU74rAFrhMk+YdwHH0rryGorZqmNDPson6LOEAajmzZOJ35wPdgVAufN8iupDeh1QOETwlUDZQrpojT8PuLGucWKGz2UjeVm/E0DLsr+Xwzu6OumqH+SbPGZpCy7QkdwVQ3sgD/1aotT/om1RpBmVsfs5ectxIGYC95cqrmGNzmjUfQuMT5DYwoG1ECAN0ZPAoRP+duf+FpZLrPaDR2KFHhAfQkgGRMUkU8CRSpw9bNL2l9VWGQdkBUGkBaN0z729iq5g5C8Ug3ia1AHxZ1HCvDSW8m+HRd02qr01DNhCTnLFyZA3UyrzFJkuVF7PocANqON95TUHF6m6aFObA86zdcwKGf9BHXwt1R+7fjEra7wDHnJCD3QvB1+PzwUophajDO74cgpdDv6YBnsENnXCidjlFHByieaNDblmZzkHHYOx6JKHlNE9Jf8GumRAsIivIL5aCMJN+E/WgzKwuuTXf9Ay6pKaT2zU/e8aTW7oDF/HIhvFMPz42xn3MRc+NiwZ9odvGwI9sBaaKzEC7x2EsfFazdhjWNQ6mjA+N2z1NCw69xO+MUadOXIdp4j00Pju3jnWcxcFdETIJbtbpBt4ND87635ErSAkbmOAyS70LDDnIW81C+vvBvvMPhA4yE6NOUSByvuKWSb+gFf0AWGXbQtXS9Qec3rayZ3Azlh
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:10.1617 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c89d13-2e86-417c-c614-08dc370f74bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8075
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

This aligns with most other DRM drivers and will allow
us to add new VKMS config options without polluting
the DRM Kconfig.

v3:
 - Change SPDX to GPL-2.0-only to match DRM KConfig
   SPDX (Simon)

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/Kconfig      | 14 +-------------
 drivers/gpu/drm/vkms/Kconfig | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/Kconfig

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 2520db0b776e..e3ea8793cb8a 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -289,19 +289,7 @@ config DRM_VGEM
 	  as used by Mesa's software renderer for enhanced performance.
 	  If M is selected the module will be called vgem.
 
-config DRM_VKMS
-	tristate "Virtual KMS (EXPERIMENTAL)"
-	depends on DRM && MMU
-	select DRM_KMS_HELPER
-	select DRM_GEM_SHMEM_HELPER
-	select CRC32
-	default n
-	help
-	  Virtual Kernel Mode-Setting (VKMS) is used for testing or for
-	  running GPU in a headless machines. Choose this option to get
-	  a VKMS.
-
-	  If M is selected the module will be called vkms.
+source "drivers/gpu/drm/vkms/Kconfig"
 
 source "drivers/gpu/drm/exynos/Kconfig"
 
diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
new file mode 100644
index 000000000000..b9ecdebecb0b
--- /dev/null
+++ b/drivers/gpu/drm/vkms/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config DRM_VKMS
+	tristate "Virtual KMS (EXPERIMENTAL)"
+	depends on DRM && MMU
+	select DRM_KMS_HELPER
+	select DRM_GEM_SHMEM_HELPER
+	select CRC32
+	default n
+	help
+	  Virtual Kernel Mode-Setting (VKMS) is used for testing or for
+	  running GPU in a headless machines. Choose this option to get
+	  a VKMS.
+
+	  If M is selected the module will be called vkms.
-- 
2.44.0

