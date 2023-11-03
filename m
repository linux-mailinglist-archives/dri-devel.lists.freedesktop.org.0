Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D217E0928
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 20:09:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0E510EA6E;
	Fri,  3 Nov 2023 19:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE0210EA6F;
 Fri,  3 Nov 2023 19:08:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cP4G9bGoLIe/yQBlpDgMyTEl7P/myBjVyzFLeDjqXA54bImZvadSFs5sKyg4EjiGa6qPYM98e6T1SKtfY8cMcJdy26e2wAiXvYBAJ1Hc+Rs0NqGnWHEv+gv2HQs+Hmfjs3s9UvRZjG8h4V8YotGzTnpWh0/2TF5ciT4176Hu2Oa2L+Ba+Ndv4QmUdo7BDjuCUVOc2YoCFYb6y+GbGwfSv7LMZqZl893AIyqpUHXsLqiIdx9Hfl8a6HFLg7hQWRJyVpq49NhJTHzoSVd9ujFXUe6j4oEKdS3koJ8lRDGvJlkNqr7Eydu5Oy5Q+QFxud0b3l0Fh8uFrZQmhwtOI7UiPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gE2Mmh7bcQdLZZW08MBwnnYk7u9KTMQdMLlTqEafco0=;
 b=RASI0LaBCS4lVICp76lJ6cH7SBaWP97v/kR2iehpCj3DlxWqhy1llOZbRCHwtL8hJO0dX6kL96hhK8XEjfzDJ4NC2idYhwrYr4u1stFtEoTwLgjThRXZrzIoDoSEdYjRPJ6yB0tf5fPdycL0hpofjfAYzb9OYk0JCySwIGOAHmrOAV77murtmIuNVOoHVhf/Ts5CvJbzKDVEkekmVQtpNSVzOCCooSE0tL61tB67I9K4IULlPqA787aaN6qVd+lUL8FU3SnkDkImxn9FdlKGIw6cmtbxIdVWQVxaVdBTLP+lQjey9BGDmzn4kQIY6qeTPXZ7DucegHRe2AODzDS9qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gE2Mmh7bcQdLZZW08MBwnnYk7u9KTMQdMLlTqEafco0=;
 b=ivpaw4gJYBIkxCgF2Giv57e9XtZV/z1b0y58zWrlkQqM3f2GQmx0G38yVXSszKdBh/lxQGgHDgqguypOf7BSQyyI7Zs+jOUH+Ks4R9JNE/NA7/AyO5rpTI8FViofD+x/M/S0OLTuzo7aqTI36eiow/rNjaWG9gJsMh5k+7bNFo8=
Received: from MW2PR2101CA0002.namprd21.prod.outlook.com (2603:10b6:302:1::15)
 by DS0PR12MB8766.namprd12.prod.outlook.com (2603:10b6:8:14e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 19:08:42 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:302:1:cafe::5b) by MW2PR2101CA0002.outlook.office365.com
 (2603:10b6:302:1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.10 via Frontend
 Transport; Fri, 3 Nov 2023 19:08:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Fri, 3 Nov 2023 19:08:41 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 3 Nov
 2023 14:08:38 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, "Hans de
 Goede" <hdegoede@redhat.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v2 8/9] PCI: Exclude PCIe ports used for tunneling in
 pcie_bandwidth_available()
Date: Fri, 3 Nov 2023 14:07:57 -0500
Message-ID: <20231103190758.82911-9-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|DS0PR12MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: 9894cdc7-8569-425c-b00c-08dbdca04b51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IRb/mTcNJ+u7yApX8kBmLI4L04UAGl7Qq5qE6sQcGNKZAP41ZmeCbs37GxmtIZySdm/I2KsMv7fDNYZFtIzCNoTys2yqK6jERiKn/PBnUA/NRRT6Os4PH6Sq2uASSp9MfKcvDZ2Vjn4YKPiUN8LdeFynaRjVhXWBwBDDBIfP3xAFopTy7LlwYrUHyrFdeOK9RqEvdkvIUB9OdP5HONQhApunnOuQtXlGOgucLRR9EeyRpvf/Ey1vABybt319/NfdbMS/BCmDoHr2mxaPymirzcTTCMzDn8+piTWWg6gvlOl2FVM0pgviCG3Ifj9zyqour3UWxLLrDLVNczUDHqGr+d6+K1t3j5FewZ9tWiy7FNW6wumUXquJwGDiHRl0SyBYoUR8wfpKJJCYgEZrtj+2oWHAnmmvNfOGrSiTNveQH9kfULTO3Sl3DExKeU0h2zE15awFS9LnKZ8lbxVT24xmi9BvrADeejo3tbbk0ODnUxa8agMXUucHnrtN1qOtxFujdiOtBDg+5CfOpjwH1E/qpGMD+4YG3zijdDnmlPC70r5MVk1FBqG4c5fsM4wiP4IkgZz8l3I5ZYxvcGkxuwcuM1xncD+FGhDfvgHOPNiWNCYnRoNRaqRKO3ns5fE+2ipX2FcurhEClhA5Mkl7YXacoeMmO99jbM9+ML323/hJ76zK3barg85rwN1e2fDud/y2kuPkGyI0HgY8XJ3C5qmPdUx7xB9d8ZJC4FxkNlFCppkM9WEqzlGdi3isWrB8pGjw
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(1800799009)(186009)(82310400011)(64100799003)(451199024)(46966006)(40470700004)(36840700001)(47076005)(316002)(36860700001)(44832011)(81166007)(336012)(426003)(70586007)(70206006)(54906003)(110136005)(356005)(478600001)(8936002)(8676002)(4326008)(5660300002)(40480700001)(82740400003)(7416002)(83380400001)(40460700003)(2906002)(26005)(41300700001)(966005)(86362001)(2616005)(36756003)(16526019)(7696005)(1076003)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 19:08:41.8017 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9894cdc7-8569-425c-b00c-08dbdca04b51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8766
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

The USB4 spec specifies that PCIe ports that are used for tunneling
PCIe traffic over USB4 fabric will be hardcoded to advertise 2.5GT/s and
behave as a PCIe Gen1 device. The actual performance of these ports is
controlled by the fabric implementation.

Downstream drivers such as amdgpu which utilize pcie_bandwidth_available()
to program the device will always find the PCIe ports used for
tunneling as a limiting factor potentially leading to incorrect
performance decisions.

To prevent problems in downstream drivers check explicitly for ports
being used for PCIe tunneling and skip them when looking for bandwidth
limitations of the hierarchy. If the only device connected is a root port
used for tunneling then report that device.

Downstream drivers could make this change on their own but then they
wouldn't be able to detect other potential speed bottlenecks from the
hierarchy without duplicating pcie_bandwidth_available() logic.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2925#note_2145860
Link: https://www.usb.org/document-library/usb4r-specification-v20
      USB4 V2 with Errata and ECN through June 2023
      Section 11.2.1
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/pci.c | 74 +++++++++++++++++++++++++++++++----------------
 1 file changed, 49 insertions(+), 25 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index d9aa5a39f585..15e37164ce56 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6223,6 +6223,35 @@ int pcie_set_mps(struct pci_dev *dev, int mps)
 }
 EXPORT_SYMBOL(pcie_set_mps);
 
+static u32 pcie_calc_bw_limits(struct pci_dev *dev, u32 bw,
+			       struct pci_dev **limiting_dev,
+			       enum pci_bus_speed *speed,
+			       enum pcie_link_width *width)
+{
+	enum pcie_link_width next_width;
+	enum pci_bus_speed next_speed;
+	u32 next_bw;
+	u16 lnksta;
+
+	pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &lnksta);
+	next_speed = pcie_link_speed[lnksta & PCI_EXP_LNKSTA_CLS];
+	next_width = (lnksta & PCI_EXP_LNKSTA_NLW) >> PCI_EXP_LNKSTA_NLW_SHIFT;
+	next_bw = next_width * PCIE_SPEED2MBS_ENC(next_speed);
+
+	/* Check if current device limits the total bandwidth */
+	if (!bw || next_bw <= bw) {
+		bw = next_bw;
+		if (limiting_dev)
+			*limiting_dev = dev;
+		if (speed)
+			*speed = next_speed;
+		if (width)
+			*width = next_width;
+	}
+
+	return bw;
+}
+
 /**
  * pcie_bandwidth_available - determine minimum link settings of a PCIe
  *			      device and its bandwidth limitation
@@ -6236,47 +6265,42 @@ EXPORT_SYMBOL(pcie_set_mps);
  * limiting_dev, speed, and width pointers are supplied) information about
  * that point.  The bandwidth returned is in Mb/s, i.e., megabits/second of
  * raw bandwidth.
+ *
+ * This excludes the bandwidth calculation that has been returned from a
+ * PCIe device used for transmitting tunneled PCIe traffic over a Thunderbolt
+ * or USB4 link that is part of larger hierarchy. The calculation is excluded
+ * because the USB4 specification specifies that the max speed returned from
+ * PCIe configuration registers for the tunneling link is always PCI 1x 2.5 GT/s.
+ * When only tunneled devices are present, the bandwidth returned is the
+ * bandwidth available from the first tunneled device.
  */
 u32 pcie_bandwidth_available(struct pci_dev *dev, struct pci_dev **limiting_dev,
 			     enum pci_bus_speed *speed,
 			     enum pcie_link_width *width)
 {
-	u16 lnksta;
-	enum pci_bus_speed next_speed;
-	enum pcie_link_width next_width;
-	u32 bw, next_bw;
+	struct pci_dev *tdev = NULL;
+	u32 bw = 0;
 
 	if (speed)
 		*speed = PCI_SPEED_UNKNOWN;
 	if (width)
 		*width = PCIE_LNK_WIDTH_UNKNOWN;
 
-	bw = 0;
-
 	while (dev) {
-		pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &lnksta);
-
-		next_speed = pcie_link_speed[lnksta & PCI_EXP_LNKSTA_CLS];
-		next_width = (lnksta & PCI_EXP_LNKSTA_NLW) >>
-			PCI_EXP_LNKSTA_NLW_SHIFT;
-
-		next_bw = next_width * PCIE_SPEED2MBS_ENC(next_speed);
-
-		/* Check if current device limits the total bandwidth */
-		if (!bw || next_bw <= bw) {
-			bw = next_bw;
-
-			if (limiting_dev)
-				*limiting_dev = dev;
-			if (speed)
-				*speed = next_speed;
-			if (width)
-				*width = next_width;
+		if (dev->is_tunneled) {
+			if (!tdev)
+				tdev = dev;
+			goto skip;
 		}
-
+		bw = pcie_calc_bw_limits(dev, bw, limiting_dev, speed, width);
+skip:
 		dev = pci_upstream_bridge(dev);
 	}
 
+	/* If nothing "faster" found on link, limit to first tunneled device */
+	if (tdev && !bw)
+		bw = pcie_calc_bw_limits(tdev, bw, limiting_dev, speed, width);
+
 	return bw;
 }
 EXPORT_SYMBOL(pcie_bandwidth_available);
-- 
2.34.1

