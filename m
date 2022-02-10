Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8B74B1893
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 23:44:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6352E10E982;
	Thu, 10 Feb 2022 22:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E9010E976;
 Thu, 10 Feb 2022 22:43:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTACaF+1k37Qab/csqB2pQUlkj8hdSc8Ft60z61/pKsZkRcKP/65ItuMlFa+mlNxi4TQrVb0mhuQ1utMHpP7Hhq5/mg3nkuwWheYsTWBwwNRtvAkgZD9j+Yt0khEStujMTc3oApXj26doqFwvceEu03+Xjfx6ggABOuSnJ8rUG2bEHsc4m3XlJZn8kJDBIm4vro3S1IxMPo3gaA6FFgW3cxx/gouSFlUaolLs+HqRfzjNBW3MpWycbELc7zJeyH5egWsV8OCg7WkK/r9PbwH7efM1Q0EM2JuWekLYhXwWfyOoKom7KTL2gncBuXxcm4GCvw70OPp/AstpM+CWEdP+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3rsSxnYcUqYPsVn9PI4AcjR+Cp+g6/xXV+YqOwAusQ=;
 b=b0e9L2nZIAcQR/ifu7RRCgZWvCGcZQRdGtqniN6dqGh9y4P3T2baDfcM8qJySRwPzhHd96MruOtiMPocD2Hp6mg+g2pzjukVm65x7oKzYdTZjk+0QgAxO+r2Pu0YD+EeVSjGb79tHNUKll4OrEj5Ux6VVRT7xAEVXyAcM0NCVkD1P6RIfXqTMyhbmpX9jJjSSnFiVKALpcrR1gHlNcBGHQvNweLpv3/5O96jNiamEPAxsDKo/aykDOeO2HVbyehhC1tOMpM3MR7Hx2084P4q3hiapGuOsFa5uuivq4SxrfF5wJD06f0Zxk1bdll6E6E5Rx6eL4Te9FqPzr4/YTl+lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=google.com
 smtp.mailfrom=amd.com; 
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3rsSxnYcUqYPsVn9PI4AcjR+Cp+g6/xXV+YqOwAusQ=;
 b=Tl4OCaEGSlRR1NpmNuurgVYJy+Xixsz5ayzFr/KyG7+44N2sJ9FugaVB8IhFqkfTSamNkKRXOmrjLgLIHWZMfd4YOzzowRE4fjxTFB3GSvAyQA/LngKOHdE54B/YU3+QUCI6tJUlUUaCdlZfsafCHiin9PG5ZbRt851eyZl2ZFg=
Received: from BN6PR2001CA0044.namprd20.prod.outlook.com
 (2603:10b6:405:16::30) by BYAPR12MB3416.namprd12.prod.outlook.com
 (2603:10b6:a03:ac::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 22:43:45 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:16:cafe::90) by BN6PR2001CA0044.outlook.office365.com
 (2603:10b6:405:16::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.22 via Frontend
 Transport; Thu, 10 Feb 2022 22:43:45 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 22:43:43 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 10 Feb
 2022 16:43:41 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Andreas Noever
 <andreas.noever@gmail.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, "open list:X86 PLATFORM
 DRIVERS" <platform-driver-x86@vger.kernel.org>
Subject: [PATCH v2 1/9] thunderbolt: move definition of
 PCI_CLASS_SERIAL_USB_USB4
Date: Thu, 10 Feb 2022 16:43:21 -0600
Message-ID: <20220210224329.2793-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210224329.2793-1-mario.limonciello@amd.com>
References: <20220210224329.2793-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61c9260f-ce24-4846-b372-08d9ece6ca82
X-MS-TrafficTypeDiagnostic: BYAPR12MB3416:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3416155B519866D90E2BE1D8E22F9@BYAPR12MB3416.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rB2Q3sfT14IQ0IFQX3uD7fhn7prXjeUmQTxxgiJAc38tKHT0r2jhO7svzJd5f3sZ8aWickyOIjcSzMthIRx3r8zT0wY9BLHFt2nVezuSr9B6nREp/RgyrfYXbcaeglBIrTCMc/nSSia59YRA0PTI7vvy+sMTXtYel0f94tTlWldgR7+9KXG9hBvpEgQWsREra25xuzP+z+yQJmhTgYJKnNgnZBbkClNP+jGLHLd4mUr5sYxb3JnIbVjoY+FT3gjHmKWWvCIYQSPm7KPERmWfPIQLcbeFPatVoy3CailD08W5XnOYyDcSr6NwMd6DjuEDhLaXGTTzNKY/GnywXtxq21H1lvYPdRHWkvigxqv/dtg2niWGKH7GrIidlN6vx9UgvGa5rl8bLadB0NREhehFQiAHwSJg/Qe2Kdsb+n43luLmFPIHrjO77fHSZ8620pXVKk/UUFsW7wpU7T0V1k6J6M+rQQfSrVngEcpJnErcUsirkLEhhXU4RCFI+ZJY5pvXXk5Ro3RPQkENnNnCdaJW9kiZePTkakxFqxUcKR3J/FbQvD9gCTb2ngAf/XhlGQgwaQnaBtfjgST6ATqAM9VGmGSzmQefk5kUYsKMuULjgj2s4bainHgTbJqHaSH32tW/vi1EfDotdnjiPGfzp+kp2O/k/UZilzrJT2EG1PGdh0GDlMnxPhQnkpPz1PHAbydDLaJK97iHGalwshxUgEj82Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(356005)(110136005)(81166007)(2906002)(36860700001)(508600001)(82310400004)(2616005)(8936002)(5660300002)(40460700003)(6666004)(44832011)(336012)(426003)(186003)(70206006)(47076005)(4326008)(316002)(63350400001)(63370400001)(1076003)(86362001)(16526019)(8676002)(83380400001)(36756003)(26005)(54906003)(7696005)(70586007)(7416002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 22:43:43.3207 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c9260f-ce24-4846-b372-08d9ece6ca82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3416
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
Cc: Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This PCI class definition of the USB4 device is currently located only in
the thunderbolt driver.

It will be needed by a few other drivers for upcoming changes. Move it into
the common include file.

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/thunderbolt/nhi.h | 2 --
 include/linux/pci_ids.h   | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 69083aab2736..79e980b51f94 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -81,6 +81,4 @@ extern const struct tb_nhi_ops icl_nhi_ops;
 #define PCI_DEVICE_ID_INTEL_TGL_H_NHI0			0x9a1f
 #define PCI_DEVICE_ID_INTEL_TGL_H_NHI1			0x9a21
 
-#define PCI_CLASS_SERIAL_USB_USB4			0x0c0340
-
 #endif
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index aad54c666407..61b161d914f0 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -116,6 +116,7 @@
 #define PCI_CLASS_SERIAL_USB_OHCI	0x0c0310
 #define PCI_CLASS_SERIAL_USB_EHCI	0x0c0320
 #define PCI_CLASS_SERIAL_USB_XHCI	0x0c0330
+#define PCI_CLASS_SERIAL_USB_USB4	0x0c0340
 #define PCI_CLASS_SERIAL_USB_DEVICE	0x0c03fe
 #define PCI_CLASS_SERIAL_FIBER		0x0c04
 #define PCI_CLASS_SERIAL_SMBUS		0x0c05
-- 
2.34.1

