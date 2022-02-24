Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6174C382E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 22:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCB910E7CE;
	Thu, 24 Feb 2022 21:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23FB10E72A;
 Thu, 24 Feb 2022 21:51:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGoAjjIf/6ezG3GwylBhHrAPG3IK667BQyg5Ws8DyyQdfHxAfaQ402H8UO2v7xXAUACQGqkL2YkNkQJcQKUXOHqO3HOyUIHN+Fnd+Fvr3LnA7Za+3qCRgoKKBVgeZ5agifWLf6V773RsDSStNy+b5t6bwX9MPiHFprHoAAdVxg/9za6Y+xbVH6djtaVyKR/Lfx5T71j4P5NsyYeOIEjkbJErvxokYIGUD1UuXLS92vQIamXFSz9uEy3+H/IBTSFFFhbd/oR6wzQiF5rY3DImEHWwMaZLJNVk8KNbVkjYqr8rltVwSC1tIX8/kbvlvjyw9hY3xNIoQVrLmwb9w2Wseg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oUyybnOX7Vt79s+4l5CYxIr3J/OX8sZXo1FzadUCHY=;
 b=dKHKHQKJQwC9KF6mvw2/bZCTZtPHlx0gNc4X77hrFHhWke1lHjmpuEZFnmEpgPMI50nR8ugcvwgN4trVNQ+NlTEZm6M6oLFgzvNzzbOJsS0XCi7BREZaEsfF8X4UrjqkKcydDUxjBLve5fF+1oxYJv0uhP4kJp1dF6uHKh4FKYNuJtRQYwweiZQrKeU5dvwq5Flyroty9V/GTwip21cOd8hmmrnPMs6NyhD6aIxkyfAE4WdXEvCoWqqMyzIt8+Q8SzWiGEBBDl9LIRn8wDUrO2FQVmdTe9dywVVJA5JbRoYpHBi4ZU/22B3g4hLyN84XS92trL7HE9T/t93c1rs1QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oUyybnOX7Vt79s+4l5CYxIr3J/OX8sZXo1FzadUCHY=;
 b=nps8tVPO9kDlA57vp4Lmj+x3YvRE53qOAY+MSw+nbgQ0L/7k5KbtsWDaw6Q8wmvKAQlc1h2fUsQqn0MVdotdrX7xz56pM7nECcKzE3TtQw1glaB+lWgwljtfjLfHl4GtVS2z6N+uQS0WsiX9rk9VJ1HYm45tJmyP5O35NeyH4Fs=
Received: from MWHPR14CA0019.namprd14.prod.outlook.com (2603:10b6:300:ae::29)
 by BL1PR12MB5778.namprd12.prod.outlook.com (2603:10b6:208:391::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 21:51:31 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ae:cafe::a6) by MWHPR14CA0019.outlook.office365.com
 (2603:10b6:300:ae::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21 via Frontend
 Transport; Thu, 24 Feb 2022 21:51:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Thu, 24 Feb 2022 21:51:30 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 24 Feb
 2022 15:51:27 -0600
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
Subject: [PATCH v5 5/7] drm/nouveau: drop the use of
 `pci_is_thunderbolt_attached`
Date: Thu, 24 Feb 2022 15:51:14 -0600
Message-ID: <20220224215116.7138-6-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224215116.7138-1-mario.limonciello@amd.com>
References: <20220224215116.7138-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17189810-1387-445f-0478-08d9f7dfd146
X-MS-TrafficTypeDiagnostic: BL1PR12MB5778:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5778AE21534DFA068F169A2BE23D9@BL1PR12MB5778.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qkonu4wgEsS4PtJHs7+Oqm9NhMZBzGeLbYhW3ansi+c9tGEoJd+uStq6qUpJLrgAStIRKhm/c8q7Zg7TB7p2vRbmz7dyAwnVXRBJ8y4xTyVSEvaf/Db1nF3JE5K4y+mxn/UX48NCHJ2hJqeG4M9xLlnnvQny6N6aOPXcif3JyJ/w16PYo23YCCZvbzIOkVIbWezGnwok5e1yOBc+H5OJUmj1MULPNjTV5lbNPxkHhL3DmykXPIFl1+PpN9CrScoDUKA8zZ1vOGAm7kZGN4NA7dvG2r5Dmn4hhvvczOrvfnFQfDaEbc9so0ah8MeBE8veu+d0CMa6acEOiPfQL7iEzLlvLWQJ8IeLUerSoNcE3J9154A2e+XYXWjvZBKtKBh2Vs/XDt7O9gTYmo0anSwEBjfmIqxavZxKfzDcsvo0ahVpQYUnHQrnXDcJoUfU95Goz8e3Cyfdc3impl+bk2QC301R6qMfJ8o+mWj27RnBXpjnNbUXCM8sQ5OzhyOQY8e3mGdOU+0aQQEdL8nPAUue+eA95j4UKPYm+sIDdafF/E+0EMfchXi1OMwsxrfWdjG6T81FLEkQ51pyCje9MNiu5XNVj0b/0RFXEM5Y4hmsNi2DadppRMCnWBAyIUGMuI8GyWrcG0t5waHHNCCp8QrscV0jwLGb9O64XW4zJ/TsTl+2Lr78kS831lJj6lCcMzCF4dtCSIwKDxzDOuwBzg2XOu7K9eHHZlsqyj6dj7zE02k=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(8936002)(316002)(6666004)(356005)(7696005)(110136005)(82310400004)(2906002)(40460700003)(54906003)(508600001)(4326008)(70206006)(26005)(16526019)(186003)(2616005)(86362001)(336012)(426003)(47076005)(36860700001)(7416002)(5660300002)(70586007)(8676002)(83380400001)(36756003)(81166007)(1076003)(44832011)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 21:51:30.8555 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17189810-1387-445f-0478-08d9f7dfd146
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5778
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

