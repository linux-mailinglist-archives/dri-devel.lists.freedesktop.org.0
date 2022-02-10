Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F744B188C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 23:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE5E10E977;
	Thu, 10 Feb 2022 22:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CAA10E977;
 Thu, 10 Feb 2022 22:43:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idHSwBDmOGW0+HwlpQBTfMPFJqb1nchNpaKN6VFM7tWZkgTqwCM3655wtLppC+hZJ0b0YEDrH9x+IKdds7NvuSB1GQy3MFdNyvv6DnjyJR6F3dWYpu3lPYjRhTG79txBCz3mii1Vw6vyNPBoGh6caoas0n9dEpTNERhn4x2gVNm45QMio4RxUPRjNRbeHRGOqQ0QGzgil4c4mh3mqIDEnPOoaBOK3JvyLldeOIN2+79jAxyRkSNOJUdQmuiv1/nnUvp0Cf7uef0XPdOlwbm1ZKMUR4AeZA8sEQ3hATRyqkoHa80u2KbAmIskVROq4o3hS1R8On6XukMUQU2J3B395g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8I9wA4fSQYCyzQLcndlkzty2V699ReWQKSTO5W4ekZ0=;
 b=UEhTtJT+GzR1FvhPDEVIf9MlMF3Px9sHuIQb4ow5ajKrBap9sgzAPraxk/+LYayCcdz5dkm87JfTXHfoGWvVU6zkWHC759K+Hqla7GpBmCtqnrGs9ZbnDV/W+n+vCJM2lI3y77EKHN9UEuFppuLN7gPeON1+GucnwSn+s1oeh7oYYuYym7vVISw0EruHFjm/C4KfZ8Zebqxr1AMIZhtiu5i8u0G2gbfjScOIhjZEHfr1lIzQmbvNDe/uDHqDHUo2CTlkpv+hCIpfPUh9BsUsJTM9tmbvLa+UKTUKNfZP412kPnMmfsmRnmXLs0DEJv7/hfbItSfstMu6gg6mEIY2qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8I9wA4fSQYCyzQLcndlkzty2V699ReWQKSTO5W4ekZ0=;
 b=qiG440SUoa1ivsjMPkWraDqAwqco0Gctm/4OQMK19SGOWxaAOb4OJfxPoDy+/hYQdksp4iG472H1qIG1rJXqUUmTttCqnsHIzmFbG7pYaNqI/oaSlEYhxnussTaPefW6/wf66GUyCB1UIvh7DrXE/CrvaktXpRomyplQFy9o4L0=
Received: from BN6PR2001CA0048.namprd20.prod.outlook.com
 (2603:10b6:405:16::34) by SN6PR12MB4735.namprd12.prod.outlook.com
 (2603:10b6:805:e5::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Thu, 10 Feb
 2022 22:43:49 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:16:cafe::a3) by BN6PR2001CA0048.outlook.office365.com
 (2603:10b6:405:16::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19 via Frontend
 Transport; Thu, 10 Feb 2022 22:43:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 22:43:48 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 10 Feb
 2022 16:43:44 -0600
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
Subject: [PATCH v2 4/9] PCI: mark USB4 devices as removable
Date: Thu, 10 Feb 2022 16:43:24 -0600
Message-ID: <20220210224329.2793-5-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: eb26fefc-71c5-4e34-d006-08d9ece6cdb6
X-MS-TrafficTypeDiagnostic: SN6PR12MB4735:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB47353C0FD6727ADEF5C8A389E22F9@SN6PR12MB4735.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w5oBCBCfzbeV64YTmDQx1LJ45Ywcsv65iTYfiSCagvVaalwhdCME6wLOpnbBlwc4EGhuxQ03sFlPWlq7nGTmWNGtkQL5iZqH8Ek4jhIsRAv4//GFZozCXfssyah8pMPIIqwpKgPPvcm19G8ZBejze52uffmDcPKJpqT25cDCvoyHQlhC8TGDmPBnoK0uLhn9R1KLf7jG0xcLxokabM+QWT2s5vaajob0rJNfI5RDVSoxYo6nh+RuTBIFLOBD8m3d4asXggQ4Y/CaTRWujq87A1TcqhRBOnmqJHZRfY6vKK3QdC8ZcGnvr4yztg6zieRh374OLwjpdt1hEiQXYj3LqOHc9PHKjBoyXhXsNVSQonh8OYZtNWEKn/iiplZmJPzERWgLI2CI3b8zLOvP6dJjFsXh9MzQab0ASTQnmgNmFsjrYBUV3zd7uFbOZwcro8TkNouvjX+CvKlto9OVA13/5zHQ9b8tB1kG533GJWPeOpCDPEXWaia806m+kALZeKfj7j3iU5EOvdTqVcrbqWdkIreFxph42qH/KNhOyt+GrKE3e6V/Cj4O/c/wpiNq97kYBZiuv0YIuZF9KHg75/ZXxoSxFwGVpIoTYUxOwxodgNxxKwhGP2UYTWOBDmMnyzuY22S9kJIADD0mxMIRBPbNvPdIpr11lLBElymOZT3xZAr+YT7yQBHV2n6VxLtmbNOO1WOGthZeEqlF4ZjEodkG8A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(82310400004)(508600001)(44832011)(36756003)(356005)(81166007)(336012)(6666004)(26005)(54906003)(86362001)(1076003)(426003)(316002)(5660300002)(47076005)(2616005)(36860700001)(4744005)(2906002)(7696005)(4326008)(8676002)(8936002)(7416002)(16526019)(70586007)(110136005)(40460700003)(70206006)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 22:43:48.6954 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb26fefc-71c5-4e34-d006-08d9ece6cdb6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4735
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

USB4 class devices are also removable like Intel Thunderbolt devices.

Drivers of downstream devices use this information to declare functional
differences in how the drivers perform by knowing that they are connected
to an upstream TBT/USB4 port.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/probe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index e41656cdd8f0..73673a83eb5e 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1610,6 +1610,7 @@ static void pci_set_removable(struct pci_dev *dev)
 	 * exposed as "removable" to userspace.
 	 */
 	if (vsec ||
+	    dev->class == PCI_CLASS_SERIAL_USB_USB4 ||
 	    (parent &&
 	    (parent->external_facing || dev_is_removable(&parent->dev))))
 		dev_set_removable(&dev->dev, DEVICE_REMOVABLE);
-- 
2.34.1

