Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285614B18AD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 23:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994B810E98C;
	Thu, 10 Feb 2022 22:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F97110E97E;
 Thu, 10 Feb 2022 22:43:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAaR8FKq+kyWo0PwsfNyi5HOW48u0khHZhnmsWYDU9wDfFSNiWvmEEREnYla9bnOLMbzelONI4ULFH8TubH1NY9HAuhEfl8K5FppH2ia1Y7x3lqqvqN1pWvz4KlPvr2eruXEVAm5pT1eU0LeOrHch4p8LkVAtyAiJe07Dhljag5MbELepQQ29w8+h4KTsE3fgmOhi4525UOCE+chs4j7x6DkrvCswd40UreFa4GtlrgSDAg+XZO0KvF1ngSEC3cgE2ydnr054qkG6YfZ2AMV/LDB2EWqeBP22k5NNBzAmsU3E0TtMBXmaE7tZ7vAgM65pygyUvWPruqDhIdQTIRxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oUyybnOX7Vt79s+4l5CYxIr3J/OX8sZXo1FzadUCHY=;
 b=QPkY9qJm/LyHy6+PBbK3GPEus7EEooVEewT2E8FnAtPVjMKR2zNnFBGbt06sgPDQSQAITiqfwh1/TrEe5r4EOwi5W5Mg0hr/Ni5UZsMpz9ViTVK402SpsAZSA9um8XslDdERfCTnZ6+qPtYxq54bX9O35OPwWfekLLQYMZL7ysez9naeEU1zSwWIfSt/7aoNyrHSVZlz/1Azpur2RsJjxqBvcx7AC1xhgVW5nfC7b38Qz7MtvVQZQU6eWiQJQM5dDSGkREUxOhODrnDFrotI7OUJJqJNO7CsLyJcj03F+iF/zKiDAfYRuzmnoJBuMNuBJPFTfz2Pq2j/o3GVYN1k5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oUyybnOX7Vt79s+4l5CYxIr3J/OX8sZXo1FzadUCHY=;
 b=dPNJ9A4cBflM7YB6N/sdshI+DBFkiK97vatRpyu+y5CQvR2ZlGt4e3DF9gHueLtXrN98gQx+GtJWp4irgeHNi1TxwnKWSQVnx5ObCOkfhIE1ceUPEIK5eT44L6gJ9Cd3oAgmzMNUcA0LVH3UBQ1I8i2g47bHWvB0LeS57n21gQA=
Received: from BN6PR2001CA0030.namprd20.prod.outlook.com
 (2603:10b6:405:16::16) by MWHPR1201MB0272.namprd12.prod.outlook.com
 (2603:10b6:301:52::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 22:43:50 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:16:cafe::1a) by BN6PR2001CA0030.outlook.office365.com
 (2603:10b6:405:16::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19 via Frontend
 Transport; Thu, 10 Feb 2022 22:43:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 22:43:50 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 10 Feb
 2022 16:43:46 -0600
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
Subject: [PATCH v2 6/9] drm/nouveau: drop the use of
 `pci_is_thunderbolt_attached`
Date: Thu, 10 Feb 2022 16:43:26 -0600
Message-ID: <20220210224329.2793-7-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 63a3a7f9-cebe-4a6d-e9b2-08d9ece6ce96
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0272:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0272089926F3E1F869AE6621E22F9@MWHPR1201MB0272.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ro2iJskM4rRy7+u9NTUt+dxpPeIDW6ZDEJCZ/KE8HL2yeiNgldB02p5MI+PdAg2gKE9pZZ0tw3ldkYVn0x5aBGrUOEnrIeEsmAJ541qWfpeW2Vx/97Woe4Z2+Ya+UKXomislBDCfa3NHSDvADdF6oilM6vrduzW1EBpD+TrA2ywcQqabbMW2RonyyxzxgPBV+XiyJS1M+l6p/V+DlBX6EjsCf9KOHSdmmrschPuvBgEG3BUHDm0yWr/X5I9hn5YXXX+L5jk/5iGj68JG9wOpTrIrB99Okcs0rxbq+OB/2JIwMMcaKWT6VhWR1Vfp+wcet5pyroaCGfNIG404OE3CLWLFeWKs8IigwazLitqU3MxCF1nji9soI2Ds1Nh1M2Lr7ziTqAYFso0xRMb8xA2GG/M/GG9TY7a0s0RlyThUXuC2/hGB51tiTJajC2q9h9/6ielQOG6CngI8vSVagaVHgQV02y9DdI+40jtQeeyzyM6SHSeX48+477uFK/LiSD5LH7N5JFGkbIXnp27vTpxuKkPf/FDK2kdZXCS0jmd6fOMRozL49LoiyjElS2Q82Ya6B0MzKrYJkbwgur4UI9J1PhvVUwaBE5sFJZYhLqaHMnYVqwhU53gp5kgU6IcR++TQlN105uSaZAoRSswU0F+5Xt/x3DBVJQCS4FUpX3smjsxAbkLUKwqCQCCI9vzVhYPsyfF267HPFJA/89RapHk+AdJA7SjJiTnFed+xuNTAaIY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(4326008)(2616005)(508600001)(8936002)(8676002)(7416002)(5660300002)(336012)(86362001)(426003)(110136005)(83380400001)(16526019)(316002)(26005)(70206006)(70586007)(54906003)(186003)(82310400004)(81166007)(6666004)(356005)(47076005)(1076003)(36860700001)(7696005)(44832011)(40460700003)(2906002)(36756003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 22:43:50.1640 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a3a7f9-cebe-4a6d-e9b2-08d9ece6ce96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0272
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
 Yehezkel Bernat <YehezkelShB@gmail.com>, Alexander.Deucher@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently `pci_is_thunderbolt_attached` is used to indicate a device
is connected externally.

The PCI core now marks such devices as removable and downstream drivers
can use this instead.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_vga.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index 60cd8c0463df..2c8008cb38e0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -97,7 +97,7 @@ nouveau_vga_init(struct nouveau_drm *drm)
 	vga_client_register(pdev, nouveau_vga_set_decode);
 
 	/* don't register Thunderbolt eGPU with vga_switcheroo */
-	if (pci_is_thunderbolt_attached(pdev))
+	if (dev_is_removable(&pdev->dev))
 		return;
 
 	vga_switcheroo_register_client(pdev, &nouveau_switcheroo_ops, runtime);
@@ -120,7 +120,7 @@ nouveau_vga_fini(struct nouveau_drm *drm)
 
 	vga_client_unregister(pdev);
 
-	if (pci_is_thunderbolt_attached(pdev))
+	if (dev_is_removable(&pdev->dev))
 		return;
 
 	vga_switcheroo_unregister_client(pdev);
-- 
2.34.1

