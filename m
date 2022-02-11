Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D71E4B2D99
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 20:35:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A6910EB0F;
	Fri, 11 Feb 2022 19:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5282010EAFE;
 Fri, 11 Feb 2022 19:35:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MO/PdqVF9DEgSaIfkcSjEdf6+71zCNpyF6hq72JKWspse1FwsqwnNf1ipPuWQimHlT4YKij5lij9T8BOu+izzF4kf/8fiBds44br/gFAu+6GjALEn0fXtV/F63ay0LjDwnGqQcEWBo9xxgLCMlLNCZKUC9MHm8nVxqxmkM1DREo7x6jfo/zIFQqZSGLMVHAlHa7zsA9R5WsId9I6jujCUJe4wDcOpk5mRxQrMXW8C8NtfMrGzlPeREecjO8iKJ9KWxmzqCJ3mKzjNE5wsv+qa70qtas1dj51vwEA4eK88ZauBn3YmeP2nG3Z3v9v1t7xYmsIln9JJsO0IvnI55+lkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpI5Xy+GcTJMt/Vmrooq7MpFhVOKwe9xhlaC3EvijRo=;
 b=OdgId7VdP7rPsGzIPgvv9ILCz8Bd8cfgnxbLfa6LUcGQw1RnbvJHUZnsuTdhqg8IqTvIiT2lKQrMMf+tqVcSNIfXiBkQGT1SM6qjpNPip+AH0D4/V8KEU36dSyrE2ESTTFi6NxKuuKCW/TdIVUqw6IabGLiFH8N0va+kof1oqZpNaR9C9HUrVXUYDwsHRdsDszj9hnDWheHnx0Nyb0ymXs4X1iqQBc8xOldDt7QiilJK3E8KzXDTz+5qHsqPmPoeeCrCk8PlVyN9BgM+wa8pBB+gjGcZ+uzlhGZMrIodaDsqky/xgiWnwCoZk2Ue+BBN10rsG27gmdcaqwD2f1zSsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpI5Xy+GcTJMt/Vmrooq7MpFhVOKwe9xhlaC3EvijRo=;
 b=3RDUupwvtlcbN2SO1EV1B6+azmn3aAaBQ6fjv6/1WMmGxoKc6HrZpmr3Mvv9EF72WBiQG6Xnnl4HZ2CslkExvlE1t/8q7mOSkTQgx4yuOE0nSz5DvVhdhLRQ+ER6js+TxjBuOkfhKnKwqg5X/9F9IPrJGn9NqzkA1sJ3SGhinqQ=
Received: from DS7PR03CA0228.namprd03.prod.outlook.com (2603:10b6:5:3ba::23)
 by DM5PR12MB1433.namprd12.prod.outlook.com (2603:10b6:3:73::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Fri, 11 Feb
 2022 19:35:07 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::20) by DS7PR03CA0228.outlook.office365.com
 (2603:10b6:5:3ba::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Fri, 11 Feb 2022 19:35:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 19:35:06 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Feb
 2022 13:35:05 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 01/12] thunderbolt: move definition of
 PCI_CLASS_SERIAL_USB_USB4
Date: Fri, 11 Feb 2022 13:32:39 -0600
Message-ID: <20220211193250.1904843-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211193250.1904843-1-mario.limonciello@amd.com>
References: <20220211193250.1904843-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39e683f8-bf9d-475d-188c-08d9ed959bdc
X-MS-TrafficTypeDiagnostic: DM5PR12MB1433:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1433BB39806DE0B6E4493F09E2309@DM5PR12MB1433.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yGO1zUtB1IfAJOibPkDKYeJQgnDIUvN8xlhG9Mib0rY0xg9eBMQwy8XP8OdGjeqHKwShmKG+t3xc6OsS2WvsDs5066NBHjFbffzF2H0NwN7kTyrbiWrx1T9VgiR0PuEe76mrFDmPfR5HrE0Yd1AZb/l1YtrAhfGudRV0Cbx/QSYbq7w3CIkydiwq+XHcLznfp1QCTZx9h+TTFEXrW7dRNwoPWZ46io3ckLcFuA1i5+nYHIP0iHbYtnaqStAMwvaeRsoVVTFGwDjbSDFiedza9uD4Yn3nXJ9NSyJ7OPU67dK981BbERWCB+B4rtP7RZd86J9gt2p4J4adhEh4elpRrJEsvBCEE7h6bcZKAhG6vM2dvPZ/XYRLT9OC9JibJ84uqbvopJFScMxFrclDCRpWGgf5qQwZP2K/2kdJsFCSLz1JIvtSXCnN1bx6gRtmCNfrsXxc3CkafBQlFBfYv4ng+XFANKSqifG0NvtEWrDnUAh4I/Kelx34Wd7HEbmRKna9rBM+1O3EmLGfOZInxNniV4JsAJOKsiRzYyxKrE3tQZQb9HcjEe3VxvVuOsgxRNInkjOyqkoaIeyJhA24bRDQI1EQshJ6LHCbJ2QHDJZhXXL97O/iovM0K7Lmz4l0cMqqEhpy+HJiSq/ssS7TZWk5GzHMtkKx9K924eHeh7rgpRpylOozD5zf9RJ6Tfkbra5tMr1XRXr63C4Qot9/WfKrzg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(36860700001)(82310400004)(47076005)(40460700003)(86362001)(2906002)(54906003)(110136005)(316002)(356005)(81166007)(70586007)(8676002)(70206006)(4326008)(44832011)(6666004)(83380400001)(508600001)(8936002)(7416002)(5660300002)(2616005)(426003)(336012)(36756003)(26005)(16526019)(186003)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 19:35:06.9344 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e683f8-bf9d-475d-188c-08d9ed959bdc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1433
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, Alex
 Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Andreas Noever <andreas.noever@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This PCI class definition of the USB4 device is currently located only in
the thunderbolt driver.

It will be needed by a few other drivers for upcoming changes. Move it into
the common include file.

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
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

