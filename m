Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8012A4B5EBF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 01:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B59210E377;
	Tue, 15 Feb 2022 00:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2088.outbound.protection.outlook.com [40.107.95.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E216210E346;
 Tue, 15 Feb 2022 00:04:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAQTTymP/KarmpHKxOw/sLXh1sALFVbiQBtKd6ug4V3u4OxK2/nFIOd3ZTUQHh6D3uiH6yqfZCDOr/H4rZxWAfpFAwsHQ1RaBLnpPubdS6w9pulauTMcf7ya336W4SysD/jcAa3p9Ng1s3KQrgHdIX9+HvUTjic0mN/K5PlrS1oMp2Xxi6kSeDIGmR7d/grbVjQr0RWxsj+Rgt9iQT28l9P7BYSqP68EkzVX44MuDfIXyv2QAm1dZWs8DFBwegyi0ZcR/ayFPJsMR+154R0PBnbsguDpBYG9W0eiFgvlKMTvuXHjy3JTV9HZ9JgMdpvGnQtS+q2O49EjoCBEG8MqYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oUyybnOX7Vt79s+4l5CYxIr3J/OX8sZXo1FzadUCHY=;
 b=S5TdssPVBVqgjcE3DNREbYMMWGNgPOwUCoucI9qBhjW92wTuCi73ArMPpe8xbTF4W9DGdgb7REsVxfV21FmHsXGmP7NiuFrip7dGkIqZgSMvf1PgShH9Fulel54FUHjzsp+rwfGK8B0NDtfEPR02Ysv7ZyzILd82xxS6Ds7V0fOHMhjKq2LOVQz1Baoi7wWC6Poz04GMiHrxO1bPZxW1+9o29u9cBJ+h62P8ojlYGzUARC4WbiHtspGweXalPtOneKkAteyzskAhQBYD/j50ANTe/SY7953ttAtT3LTdXb/yaeAjuY34zUqtpF/8F4Sbm3cM5xtTKJwL95yT4EdUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oUyybnOX7Vt79s+4l5CYxIr3J/OX8sZXo1FzadUCHY=;
 b=ouwfa662AlNp8R18fg2OQNb6vBJvk0c59RSFe3rzyyuFxYSxOj6X+QXsBMAu3B6tJo6IDmZO+Dv63HOw0AN55MNYbKSrPTF2oiGbbXGJ1VDjkogPplfYt4Trbnil04hR3VTVJFYDBePXCmpdOC25S7Ptv4wODPVIx04q8V9cZ/8=
Received: from MWHPR12CA0047.namprd12.prod.outlook.com (2603:10b6:301:2::33)
 by CH2PR12MB3927.namprd12.prod.outlook.com (2603:10b6:610:2d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Tue, 15 Feb
 2022 00:04:21 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:2:cafe::c8) by MWHPR12CA0047.outlook.office365.com
 (2603:10b6:301:2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Tue, 15 Feb 2022 00:04:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 00:04:20 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 14 Feb
 2022 18:04:16 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 08/10] drm/nouveau: drop the use of
 `pci_is_thunderbolt_attached`
Date: Mon, 14 Feb 2022 18:01:58 -0600
Message-ID: <20220215000200.242799-9-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: d19e3263-f4f8-4a3d-cac9-08d9f016b7ac
X-MS-TrafficTypeDiagnostic: CH2PR12MB3927:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB3927D6FACBCCCFF9E5EA84CCE2349@CH2PR12MB3927.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TLGXfGOFImTbRs+KsvskQ38TamAjxZwB9IySlRQQccvNLpiclyS1o3sYhg8DfrLYo0zePT0/S38k2h++iUl0JU4xeXhZe0uaHLlN9oXtjL4b12Srji28qMbkNZD1ix1Yc9NdUJ8SK0ysXb3CPEQuXBbnOSoiPqlv+ndKUkye47jhOFZQr8Wqw21X7x9gT2zhFVjbNlyFJBvFzlJPpPDvAMEDjEghRO6IEeWfuyfRW4ZQxi9Q8I+niDsg7tjn8fDZW0E/Ny6qGhUpW680EwYokONTY7dfx+L11LXmK0KzZxrnuhgKQJ0IxrX3mTZRaazsYKsOuN5Ub+YC8peiEJjO7pbFUvjEKImU0FKf/abdIVdjWvJm11BLvYvFsHy602hKI5XcWhHPS+ONyx5BirDBSD67s8RTAGgETEzoSmhjftQnjh0YX6wltRaC4QwvGVUe1q+oQaExfHpbdTnyqOPjA2xc8qYKxVCiTenPpR5FlQCqE2QPwzO+uqHAv6tHOLR3kBdFgix/m/92CyZumpSJ78G454OB70V1f5z6+xEB84w7yL7k6t7AeRS5oFhsL/h7r/az2zKJNNkTGRbx9QLC7e8vHAGJNbIMcOp1XvAgZl+pLpjVawXUcE9fFus8TDr/nDP5tmlpOzzlQWYv9thyilUbwD12/GhKj7acn3SolDVjjXpf3j4nUeBMBDCZd+97jrJ6zDCNbrsQdtkH3fFGFxe9mahZ7ZGclDV5n+I01Kw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36756003)(5660300002)(40460700003)(2616005)(356005)(26005)(1076003)(2906002)(44832011)(186003)(8936002)(16526019)(7416002)(8676002)(4326008)(81166007)(70586007)(70206006)(336012)(508600001)(316002)(54906003)(110136005)(47076005)(6666004)(86362001)(36860700001)(82310400004)(426003)(83380400001)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 00:04:20.9731 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d19e3263-f4f8-4a3d-cac9-08d9f016b7ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3927
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
 Yehezkel Bernat <YehezkelShB@gmail.com>, Alexander.Deucher@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>,
 Andreas Noever <andreas.noever@gmail.com>
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

