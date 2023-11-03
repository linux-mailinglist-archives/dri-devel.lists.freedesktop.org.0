Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 480AB7E0909
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 20:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D2D10EA5D;
	Fri,  3 Nov 2023 19:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DD110EA54;
 Fri,  3 Nov 2023 19:08:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBMY9ZegGIcDwDlawGV38vTPTdrWfqsaCbCXM/s7JcIcKUzUOIym6mv1Y6ZEmQHJLK7YK8j+Cp+rOTqLyFNrh73wsGxh8PDOOzViQbVL6Cm7x+9XYf1cj0wTDKXAJ2uyUUZLqPjaid9c1oMNp7HNnSBZID3YMo1UxpdfzaGFWkQNe2eClFvhzIutA9k1qfE2E2TTLtgVwntrbwP4KObbKFZFSi62pgVrXBqfhcjjbNNvNzbztt2InXPPEfiK+E77KRGLuvveqnqYL/boxRxTMU3IgI+dL0X3f65O0OVEySYHUvzirSZ2zZrUW/7iJKH1ISBlam93PwYlY4UPbxYpmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjzUpaVNeiv/mA5Emu6zuA8sSJ1IN0iooLtY74hD/dU=;
 b=lsxcpy/jKX0oXj2pZ6UZOvm1dGctVrGXwhxYgEDoJkH3sskMv0DqKr2Z+HaITcv9Y0szf5ZNPuE0LT9HGhTCcr+u/miZeqztSacDO8XCDnlnqfXLb8XnCXzk3k1i+goBCrLGGzGvfiGYBMz+Yf4eWUddo/qNFQ6gzfcx/+5o9aY8UvOZfQlLoN2jQ6HOeer5ID3UwdhA26E7Q/7MEqhgVXrE4Jtcuxff5V1DlU1t0FRnx+5eJKdKxqFC28fsy5QAO/15RGZ690tVtGOQuvIq4WKNoeDJqMMFwWRDWk5TB53sSqduCeLzLX61iGIk4ZgdvuE/nWtp/+ADOGvW+JNqHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjzUpaVNeiv/mA5Emu6zuA8sSJ1IN0iooLtY74hD/dU=;
 b=SUM/phosjqaYyaQnUBIRiGelZgtOfYO8CZZ/4y2AkqtYap4BXY9rmbYSbGPJqjONhEcPDCQ3y9DZuz0YBOy4vnstELGSTM4eCDwcNScrIawF3KjkSz+R/ih43Kh113rtr2EiTCcWXqI21kYQ+qe/3CjpYQHB+HwlirjX8mf7COE=
Received: from SJ0PR03CA0232.namprd03.prod.outlook.com (2603:10b6:a03:39f::27)
 by DS7PR12MB5959.namprd12.prod.outlook.com (2603:10b6:8:7e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Fri, 3 Nov
 2023 19:08:25 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::9d) by SJ0PR03CA0232.outlook.office365.com
 (2603:10b6:a03:39f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.22 via Frontend
 Transport; Fri, 3 Nov 2023 19:08:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Fri, 3 Nov 2023 19:08:24 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 3 Nov
 2023 14:08:21 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, "Hans de
 Goede" <hdegoede@redhat.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v2 1/9] drm/nouveau: Switch from pci_is_thunderbolt_attached()
 to dev_is_removable()
Date: Fri, 3 Nov 2023 14:07:50 -0500
Message-ID: <20231103190758.82911-2-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|DS7PR12MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: d9827064-d043-4f3a-df2f-08dbdca040fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ciep17TVe+BO0DU6UwTucQyfeFNReWmmreqFPLv1RaNeVLkOf927SDutR5lJ8m4iy/Y/5yuSMDy6wEmcpu44ce9rtBZeb7p9Wjz4Z9+0cDzBhlIXtETI1epGUrzvIVfACFXcRfTXbbEW7Z1c7AFuJAqtArqUKkcpBFJlZ1NrxosyczNAn6hkKpetNmIpU9OqoRLPtdWtMpYbnu/Db9nHNzAZAX5s+lqxuLIBm22LI9CMWvTz/ykxXH2sYVO6hzTmRa++y1bU0+GlokxN1PfTHeGOJ/LZU3V/k4lNoYQONTIuVrBjYTIMkhaVvVXcSQbPutC16I11Mk9kuB+0zBxEYiUc/Tp1aSRl12dMs4ofiunaPzGCht4aZH3gucQ11H7s+jIyb3vAjUvD3BgI0ID8qhEq+4RNJC6+dpm/r0Zjg8jTUWhczHVt0ZnOR0VwSBogqBWa2yP7IVmCynxbLTwsxbXLM8zOP2M9uDTypWDThCC3nJj6Ld80jdlEnpvPXe1aPs8TbV6jB6VBNsJqLSpoYupDHx3QqTwFZgm0R1baRH0nr5wmoB1Bp7/OV8hffikDko+z4TfO6F3WEC6rbh4fgXqR0nTIUBIy8HgEVE1bU8qQOsAbXL/hjVGZvTmQvzWdv964WycyURVzFx/i1lEx3SQ27g00NlwU0uLpQiyQf7dQlt8u2ZzogbFVign+VrJoqmvkS4qTXRBpeWdP4iMedEqeuA6NeXF+Q08GXkuxInEjFgC6PlPCn7BIj3vGU1N92I3g1hafmO3nQ75PsPmujw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(376002)(396003)(346002)(230922051799003)(82310400011)(1800799009)(186009)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(83380400001)(478600001)(6666004)(7696005)(16526019)(36756003)(86362001)(36860700001)(81166007)(82740400003)(356005)(70206006)(7416002)(41300700001)(426003)(54906003)(47076005)(1076003)(26005)(2616005)(110136005)(70586007)(8936002)(8676002)(2906002)(336012)(5660300002)(44832011)(4326008)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 19:08:24.4596 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9827064-d043-4f3a-df2f-08dbdca040fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5959
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

pci_is_thunderbolt_attached() only works for Intel TBT devices. Switch to
using dev_is_removable() to be able to detect USB4 devices as well.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_vga.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index f8bf0ec26844..14215b7ca187 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -94,8 +94,8 @@ nouveau_vga_init(struct nouveau_drm *drm)
 
 	vga_client_register(pdev, nouveau_vga_set_decode);
 
-	/* don't register Thunderbolt eGPU with vga_switcheroo */
-	if (pci_is_thunderbolt_attached(pdev))
+	/* don't register USB4/Thunderbolt eGPU with vga_switcheroo */
+	if (dev_is_removable(&pdev->dev))
 		return;
 
 	vga_switcheroo_register_client(pdev, &nouveau_switcheroo_ops, runtime);
@@ -118,7 +118,7 @@ nouveau_vga_fini(struct nouveau_drm *drm)
 
 	vga_client_unregister(pdev);
 
-	if (pci_is_thunderbolt_attached(pdev))
+	if (dev_is_removable(&pdev->dev))
 		return;
 
 	vga_switcheroo_unregister_client(pdev);
-- 
2.34.1

