Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 743484B2DA5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 20:35:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6C610EB1A;
	Fri, 11 Feb 2022 19:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2084.outbound.protection.outlook.com [40.107.96.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC7F10EB14;
 Fri, 11 Feb 2022 19:35:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxY0LC6z7N5OnIo+N+Lz2GEG7B8Aji5qDcMkmDgrfkxweh4KWlc/oQxUoIlshgnd3qHRGwEi42LRO6S432KwOPjpVGKRG5VJnP5WbmWcEYzBQvEJQ4C2jmzTjPr4P+BsHS91tHQj2ZZAobMW/ydcduIBcypD2BzQgWxQ2TbL/mfIPj7igsrv1QdHg/ZwnZqJIxxQEKjZvn9AO4wCjcsf9H8MUGB2UNUtD924uzNLYbjWQN2JYGUDJTKQbtM6YhURhA8zuR45tvSWdD5V7Mu6v7lP9TsEDpidyLmJiHe9Bxnyv5x4x9Qo30+Y4IqdTbSIQqabugExa+AVEmCCMxrC2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GLsw+AS8+IaNmFkIGRwFaDA0jXIGrT9HwpGpUb1w1k=;
 b=VosXFoIdDIiDVzqTjXjBbgypJ32PVvrFBgCRzCuZfN1EHSZnDxyTRxGQt8ULEbBLC5dNEXMrFwxD7r19QSMnwZWwUlekNf11DYbFSyK1ycVlxhS52yCIawu50NTGsJOgTmHbuKdcp0U+h4XVWsj8J1d09ISunpPalv5gAkUWaXwoa2lvRDHwTECNdysri/W2FYhVEhMO34Lo5szI/B0w+6QFfAQ974Zm46+98ojaG2I+7e7ArFODXz0PGgciUhsdegUpLZXdp0ML7O8q8wKyC817p+HR4KViz6kuK0M1hcrrBHdiWaFmJrpNhw0mjT4Phcyw5J36Zps31vOyi8dT9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GLsw+AS8+IaNmFkIGRwFaDA0jXIGrT9HwpGpUb1w1k=;
 b=JPy01sdVy7lCEqxgYR4A7eX7eOWoFtpgDzMG2meiSBAlBzLyUsa2KN4thRVxn8KWcubYUXkfUf+arX/zOsmvQ9AZrSrJHO3PB73m7TTs0KFZ1VfOjREIxMfdapxga2BPc9qMjuKhVuVkDtjS8FRgDlF1lMn20q8ym9Qzl3ZBvfM=
Received: from DS7PR07CA0023.namprd07.prod.outlook.com (2603:10b6:5:3af::28)
 by BL1PR12MB5064.namprd12.prod.outlook.com (2603:10b6:208:30a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Fri, 11 Feb
 2022 19:35:10 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::a7) by DS7PR07CA0023.outlook.office365.com
 (2603:10b6:5:3af::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12 via Frontend
 Transport; Fri, 11 Feb 2022 19:35:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT024.mail.protection.outlook.com (10.13.172.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 19:35:10 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Feb
 2022 13:35:09 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 06/12] PCI: Explicitly mark USB4 NHI devices as removable
Date: Fri, 11 Feb 2022 13:32:44 -0600
Message-ID: <20220211193250.1904843-7-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 416e20be-d78a-408b-a852-08d9ed959db5
X-MS-TrafficTypeDiagnostic: BL1PR12MB5064:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5064D7B4F1FFC2322E7326B3E2309@BL1PR12MB5064.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e593qcCLTj+XFA0gZ3IKTC/i/+Y+U+woS1BG4W4RPOguCPg2oazsTsHlvW99Ve0zRlUH2DuiuhAtLba3BREKcTvFGSrPIJop+i9C9eGQS3BuU89b6lP2qcDTJxqpg8stMbIMdNkuFr77IneH2+klcoUMGMh9MM9SyEGu7v5D+n9XrkSKghRYLW7gWCwet7mkzQgXVeCbEdQoPOCuvDicrv6qzbs15rWd1g/Q2HZi9JVnRciFPxNR+Q123R2FL7wX+NbbbNdsahDgNTylz45C3GGDZL5brNKh3z6TRfkQmcvAHNZh5LMhK78XHjcqcuQ8tSeAXOd+9GcoNLWBQGzrUoDKa0+Je5wzUUeufGyXba3T3ANqTkj4Rwd+VMui5v+1u6UJCLetFos1Lgxp67KOKiAxEmQI8dNl7s3YP6mQMRkY9dm6NB1e2SvBCPVPAJJrwkn/oykIbMedi7css2besxI9yklvt7YjetIPKwlNFHrIZCYUueL1MOU/czCu9h7BzmIEbg6FS15SzrWF62zCLPCaAzS0MovHS/SVLz2gMnGXFRgmKru/XOpo4IsPnLg5XAZXiDOhG+MaSv7U60/4Y7gw2yG5RwvtZRZbdCb7MgzsFIF6/MVMRpv2BuDHE0WeODo3BXly6DGAAjXpsf7ZeRyKv1YQ9LX365LBm32T6muN8ctXA8rxtq3zZoN3UddzAh1oFQ2ENkg70+hl3WHEfg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(426003)(5660300002)(4744005)(44832011)(40460700003)(1076003)(2616005)(336012)(81166007)(186003)(36860700001)(6666004)(356005)(70586007)(70206006)(7416002)(8936002)(8676002)(4326008)(2906002)(36756003)(26005)(82310400004)(316002)(47076005)(508600001)(110136005)(86362001)(54906003)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 19:35:10.0380 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 416e20be-d78a-408b-a852-08d9ed959db5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5064
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
 Andreas Noever <andreas.noever@gmail.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

USB4 class devices are also removable like Intel Thunderbolt devices.

Drivers of downstream devices use this information to declare functional
differences in how the drivers perform by knowing that they are connected
to an upstream TBT/USB4 port.

Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/probe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 2693211d31cf..67ca33188cba 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1610,6 +1610,7 @@ static void pci_set_removable(struct pci_dev *dev)
 	 * exposed as "removable" to userspace.
 	 */
 	if (vsec ||
+	    dev->class == PCI_CLASS_SERIAL_USB_USB4 ||
 	    pci_acpi_is_usb4(dev) ||
 	    (parent &&
 	    (parent->external_facing || dev_is_removable(&parent->dev))))
-- 
2.34.1

