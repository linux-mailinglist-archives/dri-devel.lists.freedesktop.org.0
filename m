Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2FD4B5EA2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 01:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE3E10E350;
	Tue, 15 Feb 2022 00:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A265610E346;
 Tue, 15 Feb 2022 00:04:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnjYhfw73lzaTfGyAzDYWYRCOy9vAqgSicOs8FuCddWeT4j5LigGyMcd3owez4i1v6W4OP0A3xKNrBMRWOLvW7ev1KhhKlSMK1/NB3TSsW10aL7yfpPy905uUxLP9Q0TYkhbvUhCAmT2Q5+KTtcu4VWFeuGdzmaGXXn0M2W8d4iWv/jeJ0uGm22stQPGYH3p7aZnzc8KCXbpuDR6G5Dimzazi/X9eQAG6aVbOCDFmb1A3R+1f0eGFLV8HW6NilWdHxroSBpfFpDDwTj/pekcdRXzg5dytARCzOj+pBzTNZ7TXTfQR4AArRheNSeAjbzdYTsgQZhKLM7xkOEF5/sKRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUs2DrPQ483G4YzvDc/WjKUI+wmsntMR+fQHTJ74TrY=;
 b=TUKXfP9ZWsTrR+zhJf1APabnKcDNWgppeClY4qUlCY0+EhOdD+3032sNCoQXpvH9Ul5U1fvk6ieiLjJRBHei/3MIfyDk4jUDf4L4zjQCG6LcutZE2vIf1XPMq4V75KUrV3mcj5S3Z2LFu6bvBbNEQIvPBorzN/atwIeyAmvrUHGhuMIQk1utDhb8lXu+BdfHrkMN+alMHk8Cpt2aPVZKCM+k54Vxuh5fi6JPziI7JFUFA03MNZpMucjnXzv5VeMW9xc+RDGqBhq1pS+jTkoJUYPIkU9xe/6BL6xNrsTrrrFED5EEcKEY/2/L+Y2+n8KJh1aNu/hNHo3ANEgWU7Xb0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUs2DrPQ483G4YzvDc/WjKUI+wmsntMR+fQHTJ74TrY=;
 b=R9MUM+sAz1QrzLRukw4mSzhSi7GizesUH0xi2ZMFMLCqC+J5hQUyBC0eKJE+JfxUwE6wErupX9l/nyFtmbUtym7E630SAQ+d2RakHPdALAPFPPr3OVWHkRVN468GwXBC7i5vDxC+yqyBVQo7yasYVFcSOYmw6/LKEr4EjsiOPLo=
Received: from MWHPR12CA0028.namprd12.prod.outlook.com (2603:10b6:301:2::14)
 by DM5PR12MB1882.namprd12.prod.outlook.com (2603:10b6:3:112::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Tue, 15 Feb
 2022 00:04:14 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:2:cafe::a6) by MWHPR12CA0028.outlook.office365.com
 (2603:10b6:301:2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14 via Frontend
 Transport; Tue, 15 Feb 2022 00:04:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 00:04:14 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 14 Feb
 2022 18:04:12 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 01/10] PCI: Add USB4 class definition
Date: Mon, 14 Feb 2022 18:01:51 -0600
Message-ID: <20220215000200.242799-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215000200.242799-1-mario.limonciello@amd.com>
References: <20220215000200.242799-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8db77d3a-2d37-444b-55c5-08d9f016b39d
X-MS-TrafficTypeDiagnostic: DM5PR12MB1882:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB18829B386A8AF408F18802AAE2349@DM5PR12MB1882.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hnktZX8JBDloQKdr93gMYT5knXVCw7Tx6uquaR9c97yTxph8pwjr7bqyjuzufVJgJbDIGargI7OzPQ7Is7dQvZdAg2EqqJ/gB2IMkxH8XMXPYohg/OInF+JWyETcoNYWPHULpa5a0PlHkoTtvsJNy2E2B1f4Wmhss4uttfa9rLsXd3Gbj5gh21nxj1hLOVAv9O+11KvtFUSP14e1cz2vB7mywZTvxTOr7YmYVhOQPAjrayBqTMOvqpPiHNmHzrYlVYZ+82tkbehC40JNKImLgA/QMGvbl06+GY7h55esP0c1vKvKY/s02YoNKfoQFqz7Jg6kfgj5IFkQeIMC89zxdL4B0RWq/TpgqJpnN/WICZHsZBeCcRSu4QMxAvisjdpDLs6bnP/CCWjS4hBv4zlJ3mcB3oWANUY573ekDjWJKiNq2Um7ZhwaQZmnpDO2uQuAowxvkuE0Xy7Pg2VHDrUuyRW2Ah6zM08LfhoFGAoIB73S/Nl8sjhST1WXYPG7SqSpaXLaLkG5tm/gg4azeL8doS/bFZBTOkAlCQXwmPL5j89laDHaklJDsYu/AecwJ59vg7XDAUgvMzv2CuVXnGouie+XdMeMc0ox/H/QdLP+iY+1nVlTxgLIBsyF0SkJQ/i9qX2jM83d6wkBUh3jWz5cqdA/EJaxAO1IhQRDWM4x7zaZiT1w56X/Vz8w6km5EZxU5JkqIc4YvjuvJQW4MKxZSQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36756003)(40460700003)(2616005)(1076003)(186003)(2906002)(44832011)(16526019)(26005)(8936002)(5660300002)(7416002)(8676002)(4326008)(81166007)(70586007)(356005)(70206006)(110136005)(316002)(426003)(508600001)(54906003)(47076005)(6666004)(86362001)(36860700001)(82310400004)(336012)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 00:04:14.1452 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db77d3a-2d37-444b-55c5-08d9f016b39d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1882
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

Acked-by: Bjorn Helgaas <bhelgaas@google.com>
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

