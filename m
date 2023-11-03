Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3787E0917
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 20:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA8110EA67;
	Fri,  3 Nov 2023 19:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2382E10EA62;
 Fri,  3 Nov 2023 19:08:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2Wm7DmQpao8du9Ise8QLeYqMKyAUl6q/+q1Xa8pkunjW5GNY76FsubdW5Vg5wjcA5ZRAhuZT8UU3HhD9jkLawgRirjQvc17U93RlFBKT8DJYod0WnS5gg55b443MHXoqJgng+msyAac6G9z/WC7FwRnW2wKL6TawLTPgECMMNd+voSBWiW5vvhvJOIRHEaOt2UScLfbfvGUFcrQPBX58NPxysXvuVpXk3E4CuXZmrtVAKCOBh2oBa1hh5MIVdJw4hD59VBNXjfeA04dKv+TjX1jeN7H+WVIvhf5Wb/VJbwX4asq57971DhtXVnG2X0Q0rQ2lewxzDhYtH3cOLG0dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvPnVmx4GrlAb4QZYqyEyNg1CZJ8bMTzahy3mGANSNY=;
 b=CEFzwfZ9WJWS2UvsWWKcpOo3WpVKWbKQI52gHpJuiTNT4f6VRmg7HwCUysvyQQ4WyobTQuMJHnQvn1CDW3TDVbB2OyNc6FKv+rywGlOWj2NxlEXlHmK3b/8PnCDTJunN5M532JBQK6x+WOCJZF5aCSi2ZuxEw+JeTJG3Tjqs+6L0ed7p8hEGjS7HfEVoNcLVf4w/I+NYErzS4jsmjUySmIJZh9+J0VykwwnCH86e9XweJeAQ9+Njrcbm23RagUQTfbrahC67A0xi1glK7zeUm27oiROMnYuSjV7RLxTNt2ufh7dLDgOiehJdkyzrNJFukLYNYHAn91Bl9v55zDPJOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvPnVmx4GrlAb4QZYqyEyNg1CZJ8bMTzahy3mGANSNY=;
 b=xHfkSsYmvUKlCC8UCrF5eEsdDKD/jiKa9mZJBQ+XZpk6l53xzRh1wIR4PUBQ3WQFjJTaDqCSNWF8Acdp8gezuW/XwJ5gTxN7YmOR9/Iek3qwUoljCpdvCVdygeni/AfLad55bEIy6Fr6ZEoFWp3p4+gUJweIylfSK8IZkluOCfw=
Received: from CH5PR02CA0013.namprd02.prod.outlook.com (2603:10b6:610:1ed::27)
 by BN9PR12MB5050.namprd12.prod.outlook.com (2603:10b6:408:133::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 19:08:32 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:610:1ed:cafe::c8) by CH5PR02CA0013.outlook.office365.com
 (2603:10b6:610:1ed::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.22 via Frontend
 Transport; Fri, 3 Nov 2023 19:08:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Fri, 3 Nov 2023 19:08:31 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 3 Nov
 2023 14:08:28 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, "Hans de
 Goede" <hdegoede@redhat.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v2 4/9] PCI: Move the `PCI_CLASS_SERIAL_USB_USB4` definition
 to common header
Date: Fri, 3 Nov 2023 14:07:53 -0500
Message-ID: <20231103190758.82911-5-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103190758.82911-1-mario.limonciello@amd.com>
References: <20231103190758.82911-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|BN9PR12MB5050:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a790ecd-191b-4c4e-d02b-08dbdca0454a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j65+EELUDWFlk7zAWE6FyPbRBV6WLQwDezlCztYlc1QBum58aXokRPKArFouNMhZw4nkeAag3JWVolW4z9Gu5QdZWvjyuE+wcia+CxldPzwHv5QCnqkICRSTMJVIzRfbe0JXN74IvgKI31vMZqFWnIvHLEldWflc764R4gKp5i22XGyAZ3uQ5YN4hBuQB7iMb6GasVNXfXEVWBZvU0JK4vH6dB/MyJXCh6J4CytNX2EGsXz1NeUvI0CppOFgPxUhW+y6Hm4n5ZxmHHHKSqyxi+onAdLK3ugg9x5eqYYLTVEqzY7jdk9tcXmAQcMBO8/P900izXvURKM0BygAGLafFE8ZDoQ3IEti0v7DTCiUO2nC7I0P9e/8n30sHGWzmGShQUyhOBZ6ZzDpWn95J/f/xaj8vWC/UEaq2rlZ8Y92H4QOB38mzMYLWGTN/93+breWtZFYRg8TuIcpoMkfkL0jS+deYadfslkCXCbtUeEn0v7s/TtwA0/zgj0+7M9rPvrtzl0h7ctH7thzJoudGGro7OX0gcmKETo0/reW6YjkL+tmg9rVlReZdR23N02QBUHXlA/zGLxEN1/a/C1AvAVG5XHQ+5EzBeW3wJzWXQEFw+LqMsH8rF5o/qWNHID+MxU9LQUuW8ZjmJtsBdNeufPgFfKzHoc1r28U/JR9b1M3znj+UljdizmCQUO0bocqj8UwW0TbmmtZganSnXewEcXlMthGW+6E5QKrlqlBLY7hB2cJsFOW5wiAtgMzEfsb4ghWCO60fxsFjVWDFCepg3nBzfvj2CoFIEX/DI74PICAOlE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(82310400011)(186009)(64100799003)(1800799009)(451199024)(40470700004)(36840700001)(46966006)(16526019)(36756003)(82740400003)(86362001)(336012)(40480700001)(40460700003)(2616005)(2906002)(478600001)(41300700001)(44832011)(7696005)(316002)(4326008)(8676002)(8936002)(6666004)(5660300002)(1076003)(47076005)(83380400001)(26005)(110136005)(70206006)(36860700001)(70586007)(7416002)(54906003)(426003)(81166007)(356005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 19:08:31.7059 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a790ecd-191b-4c4e-d02b-08dbdca0454a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5050
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
Cc: "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:DRM DRIVER FOR
 NVIDIA GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Andreas
 Noever <andreas.noever@gmail.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Danilo Krummrich <dakr@redhat.com>, "open list:DRM
 DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michael Jamet <michael.jamet@intel.com>, Mark Gross <markgross@kernel.org>,
 Xinhui Pan <Xinhui.Pan@amd.com>, open
 list <linux-kernel@vger.kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, "Maciej
 W . Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`PCI_CLASS_SERIAL_USB_USB4` may be used by code outside of thunderbolt.
Move the declaration into the common pci_ids.h header.

Acked-by: Mika Westerberberg <mika.westerberg@linux.intel.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/thunderbolt/nhi.h | 2 --
 include/linux/pci_ids.h   | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 0f029ce75882..675ddefe283c 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -91,6 +91,4 @@ extern const struct tb_nhi_ops icl_nhi_ops;
 #define PCI_DEVICE_ID_INTEL_RPL_NHI0			0xa73e
 #define PCI_DEVICE_ID_INTEL_RPL_NHI1			0xa76d
 
-#define PCI_CLASS_SERIAL_USB_USB4			0x0c0340
-
 #endif
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 91b457de262e..1fc8b5e72f80 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -121,6 +121,7 @@
 #define PCI_CLASS_SERIAL_USB_OHCI	0x0c0310
 #define PCI_CLASS_SERIAL_USB_EHCI	0x0c0320
 #define PCI_CLASS_SERIAL_USB_XHCI	0x0c0330
+#define PCI_CLASS_SERIAL_USB_USB4	0x0c0340
 #define PCI_CLASS_SERIAL_USB_DEVICE	0x0c03fe
 #define PCI_CLASS_SERIAL_FIBER		0x0c04
 #define PCI_CLASS_SERIAL_SMBUS		0x0c05
-- 
2.34.1

