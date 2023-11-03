Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EDD7E092B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 20:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FCB10EA7A;
	Fri,  3 Nov 2023 19:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE08C10EA74;
 Fri,  3 Nov 2023 19:08:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHsZrfp7WQNjz+J9I/444tKaWInicMD/ZPpZbkzMAP1irWS9Q47MdAWEv4nng9FhVbH+JYx8qb3O9EGGxF+7+hb4KLizqQ/izjpWiHzu/gOCVfPoS2LbjyjneFKQX9L66QASTQ0X/u+2RUuIWdFaPPML5CVNbnaRXOtc/LTdKIVJ/V5WvwA7OWzqI+6rTtTaCiOwY1R6hyhhBgKz/27PQJFtApo0pUaNUgmcftOiEQHx9aAUiXKPbExoXqF5WHXBHJ6WQ5+GAkHZpxgNnxEPW8xW/S32nsWzKASkSFsOewsm7YsiNedmyYo2aQPQK7U26upkms8ZzgD+XH3EL++kSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bm6CvuPszQdPXt5Zsc6/nH1F3rQtl/A2wuDDypGcGk=;
 b=MOr/Iq/sk0lYyeJfRLo4LUHtO95iqkW7uUpmoV0WOarEnqgNhVxCwIX8G3oaYA3YvSMmT6EN/sF9fuP6Fw+UM+wXikR7bzgeJIG2DddEM4/P9Ir049NCUFbxHOGRAgHOizR3AjodfxLsqtXH5b7epa+FfFSgurCIRXNDX8T0fUC7PpBLeUHz8vfG7srFdVxQqxJGKoryQa4xHgvqQtkEG7bl8WRSPUkkplUxsFUBbNXSD7JFsuBqBKPAB9zxA2JcTo+uEOaHQcAFaftbl5/e5H2xRW8kYGjkq4vaEKPssPeU8CuRxmFKcXaiqERuti0zo4rSbTLLMenTzEt1ZYO9bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bm6CvuPszQdPXt5Zsc6/nH1F3rQtl/A2wuDDypGcGk=;
 b=Jc0A8ugIcvY3nY1ksEuQVqNtqx3jY1/eckxO8CLf8hp0X/l8Vpi71s7YCRuyq19iuhVljfR4iNbuBiizkUoED7FuHkxNnANcRc1+NBU+YGeG7pv5a+KHfv2qFWymRnkZgjgpJSFnhGs8hjpHGdSehoKHOSQBTbzBQpw0Ss2KeEg=
Received: from MW4P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::13)
 by SN7PR12MB8146.namprd12.prod.outlook.com (2603:10b6:806:323::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.24; Fri, 3 Nov
 2023 19:08:45 +0000
Received: from CO1PEPF000044F0.namprd05.prod.outlook.com
 (2603:10b6:303:8b:cafe::26) by MW4P221CA0008.outlook.office365.com
 (2603:10b6:303:8b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.22 via Frontend
 Transport; Fri, 3 Nov 2023 19:08:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F0.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Fri, 3 Nov 2023 19:08:44 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 3 Nov
 2023 14:08:41 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, "Hans de
 Goede" <hdegoede@redhat.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v2 9/9] PCI: Add a quirk to mark 0x8086 : 0x9a23 as supporting
 PCIe tunneling
Date: Fri, 3 Nov 2023 14:07:58 -0500
Message-ID: <20231103190758.82911-10-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F0:EE_|SN7PR12MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: af307a45-915a-42fa-0ab9-08dbdca04ce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RFPYuBVsqfBHmJXlBnNiy1k/QcZUag5y1aEzneMp8T7RXa09nxgtEHw12USPTpKsC1J8RF/7tszj4l8FExfwYeUHXgm8w8eRHBKdBDJbWf9GVRnIqwluq/5ItSvgQCwdCANqGJUW9mgsYwXUiQ9y4pCM9VFKqR5nLZrFQdORomem6R6Jwz0kIikyiCimcm2wriyQWrn/8N3x8TkjaH1F+Ecv9sOUzioaUkShCOczD9IndWHwvksjEEZMt+dXp3BpMFc6oJw4SOMTzrg7PAqBRJ7DKlvHZSZZSiE3+6E7dXMoFKHroe0d+MRnhAnW0dFUTg/wiiVQnNhXhpLkWY7hB8CAx4+rMTUeSDW+bX/Ynk4D1xhZIhGnM0wRCFWOVXQqhTLpOhOTLJahzqlWSVYvcQqTtUFJ1mjhJb+tgOEp+wy9/O2NOmBksD8ceeFN2sQTSUwTZAsmrkb4oTLtLACNwnJr6OZhGqK9NL31WqWJLTzDkCH2W8aHcHEvmoBOGZMu1TDQS/O7NrmYb+L8+t+sQdPl8CkbB60CP6eeRe+doRIzCmkmSRiM2f0SdSvb7ype2TD1etQU5Fx9nkslpRiCPm9pHiDWGbvTYn6Hn0xg22DavCTinLgdp6XWaKkNOynNkuU5/g8Id7Q//wMgNlZXhvWZ9PSm0egFZwdtnWv1Pc389yifDKt2cMyls9CMI/a2Cyb/QZ6ZTb5wpEEOh1Y2i9M1HbB+EdG6jdJOf2UqtfBXOhF7cxhuDNGV1EMkN8LG
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(47076005)(70206006)(70586007)(86362001)(110136005)(26005)(336012)(82740400003)(81166007)(426003)(2616005)(16526019)(1076003)(316002)(54906003)(478600001)(966005)(7696005)(6666004)(8936002)(8676002)(356005)(40480700001)(40460700003)(4326008)(44832011)(36756003)(2906002)(83380400001)(7416002)(36860700001)(5660300002)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 19:08:44.4476 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af307a45-915a-42fa-0ab9-08dbdca04ce3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8146
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

The PCI root port used for tunneling USB4 traffic on Tiger Lake is
is not marked as tunneling but has the same limitations as other
PCIe root ports used for tunneling.

This causes pcie_bandwidth_available() to treat it as the limiting
device in the PCI hierarchy and downstream driver to program devices
incorrectly as a result.

Add a quirk to mark the device as tunneling so that it will be skipped
in pcie_bandwidth_available() like other TBT3/USB4 root ports and bridges.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2885
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/quirks.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 4bbf6e33ca11..0f124e075834 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3827,6 +3827,17 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_2C
 			quirk_thunderbolt_command_complete);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_PORT_RIDGE,
 			quirk_thunderbolt_command_complete);
+
+/*
+ * PCIe root port associated with the integrated controller is used for PCIe
+ * tunneling but can't be detected using ACPI.
+ */
+static void quirk_thunderbolt_tunneling(struct pci_dev *pdev)
+{
+	pdev->is_tunneled = 1;
+}
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x9a23,
+			quirk_thunderbolt_tunneling);
 #ifdef CONFIG_ACPI
 /*
  * Apple: Shutdown Cactus Ridge Thunderbolt controller.
-- 
2.34.1

