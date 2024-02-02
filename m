Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F75B847C3F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 23:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F29710EC81;
	Fri,  2 Feb 2024 22:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="walwakDk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F2910EBC2;
 Fri,  2 Feb 2024 22:26:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JH48bPkFBpkRMAosO3CaBCm5+0ZhqKXzVxNLjwzsIqrClbMfQ+J7uWojdNCstInLdEkLL6kkvQghHfDNRmldIWLZ9BUZFbHYhYiGVS4zJrB0ZDjCop3EW6dG3qwZJXI0RDK1rGUc5+8bcbGOyQWoTUUU7wzdgtI4ROB+RVQrPeNhhvvRhj9a99sFwnG69XELc6P89bH0dg2v1+7YvZnRHU96UEEVWz0IvtBjrBZL78PGuouvH0XRCFScYQ5EVOnRBcdCaMcmnzfG1B9wpZBichxVv+BzAv8LuWbVf8y1fyqXTCmlCFf3cLJJjugHwpUZUZTMYpInJO9B5WizXdScaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOad2c9x0ubYcdKEEjzkb2ZBRugUJFx3v8GNWcCJl8A=;
 b=TD8kdGr6FWnKfzb1cvps6rr4Nsl+4Ys8CHgc4ArjhCGCcbkSfI8guARvgiJQ3g3JX3P5Kyc/yoGCe6wBIsHDQxp/avRy7Dp7f1JrwMGbPwLoMl9hgwmhhhqwcUcy0tfPpnV1dmMmAnTHblK9BSeB8DB2MiXVtRLROZnD0eH+4m88FHfsQGe9Zx/s43nzmAvrqUpHPlbXEfD/iU5mepsYfMKPhOS/Iosoan8pD4q3bn+EZZ/y5OVzIkTUxOwx3gkAQXf44koWIYvugiLfr7r8PufRRi8J0DpjBx38DLvdBVEKiTfl2oPFgSl5Vk7SfjWqkMRqwrN2hunlYx9ioY0JTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOad2c9x0ubYcdKEEjzkb2ZBRugUJFx3v8GNWcCJl8A=;
 b=walwakDkrvt//Gbz8HOzYpA44MlcM1pL66SOe2ePu45a3FT4NqF9YbGNvIRs6xoAthIy9IQNOCFeXHfZ5zNOUcrZivv8IWLiqBdmAW1qE/OCG4fPcR5EpiigkwFp2VTaiHQB/9BbQE2EsZOsQWxx6ByVMGAtlbsJD87Onhej2pM=
Received: from CYXPR02CA0022.namprd02.prod.outlook.com (2603:10b6:930:cf::26)
 by PH7PR12MB7844.namprd12.prod.outlook.com (2603:10b6:510:27b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.12; Fri, 2 Feb
 2024 22:26:27 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:930:cf:cafe::e0) by CYXPR02CA0022.outlook.office365.com
 (2603:10b6:930:cf::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31 via Frontend
 Transport; Fri, 2 Feb 2024 22:26:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Fri, 2 Feb 2024 22:26:27 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 16:26:25 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: Hamza Mahfooz <hamza.mahfooz@amd.com>, <stable@vger.kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, "Srinivasan
 Shanmugam" <srinivasan.shanmugam@amd.com>, Le Ma <le.ma@amd.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>, James Zhu
 <James.Zhu@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Wei Liu <wei.liu@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-pci@vger.kernel.org>
Subject: [PATCH 2/3] PCI: introduce can_remove()
Date: Fri, 2 Feb 2024 17:25:55 -0500
Message-ID: <20240202222603.141240-2-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202222603.141240-1-hamza.mahfooz@amd.com>
References: <20240202222603.141240-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|PH7PR12MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: e3b87e87-a491-4be0-d07a-08dc243dff5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sXJhUV6PfcJj4doUDZppvQuCy8hb9iG9z+uk4Z5AVwIF9OoYzWGMZ9xtrPP44G0b4uj4gE7su4t6D5monmzWimqYQKhSX5v37CaXk70gr9fYKZzqB9HHh/OFGt7DkdbsUjk3ljzJCxpawrOpLzItNCdaaQb2AbPOPHiPTlgWeBLmCsA/J1U9sp19VypnWmSjzxSCz6P8CpsGXQR1bnVrgO4nLZIMYLMmgo9EpvjZB2cLD0dbZaai9vUMWoJGlHGgfRerugm+QjkYXEcKZzswgFWJvdRnsmZOVS3UjzlTVPu+x+TxWMiEhdM02vsTo1/iiYaikKToFaYeof4PntongHa0jALGOSMUVV/ZD0DPKvbFqguA3x/kPh0pGJrVtZgdf20usfLqDcYZdXecjehIH6N8chif0Mi9EwMaZPE+h6rWeZJugiuA+svnh/vMCgeDPo4JyzP8SJbneNRDLWPw4EyUHrtLuh9MO69j1ZZo1iehi0Ls4AU6k/H0FovZoQdFwQIWNshUeV48cLI4vGOi1ydsJitkRrnmOZeRBi8GSASIVSgklNag7zZHxctCQFi2zC5S5uPQFmGhtUxmDHK7/yetBo/9TTcf0by5A3IfE06iAZo1sYplYEs6Hk0rIMjeoM2HuTfFRuwQ999wTGlhi1ni+RP0g6x6ttWLgHmF7b+DORKQGWEpG6wAdpdPpeSgjUgQgvscozwFzZHsCG8pkSczbtn7/CMT3fql96ts/Stxl92hWRAdzu6IyML5AxEf37LELwoi66xBo8VVMF0e/7u6BGoF37TshlQbO2kRbjTVfi7+7UXMvXPQfqar1MM9
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(82310400011)(40470700004)(46966006)(36840700001)(6666004)(26005)(16526019)(426003)(1076003)(2616005)(6916009)(4326008)(336012)(36756003)(8936002)(2906002)(316002)(54906003)(5660300002)(8676002)(70586007)(86362001)(44832011)(70206006)(7416002)(41300700001)(478600001)(81166007)(47076005)(356005)(82740400003)(83380400001)(36860700001)(40480700001)(40460700003)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 22:26:27.4486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b87e87-a491-4be0-d07a-08dc243dff5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7844
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Wire up the can_remove() callback, such that pci drivers can implement
their own version of it.

Cc: stable@vger.kernel.org
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/pci/pci-driver.c | 12 ++++++++++++
 include/linux/pci.h      |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 51ec9e7e784f..8aae484c5494 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -466,6 +466,17 @@ static int pci_device_probe(struct device *dev)
 	return error;
 }
 
+static bool pci_device_can_remove(struct device *dev)
+{
+	struct pci_dev *pci_dev = to_pci_dev(dev);
+	struct pci_driver *drv = pci_dev->driver;
+
+	if (drv->can_remove)
+		return drv->can_remove(pci_dev);
+
+	return true;
+}
+
 static void pci_device_remove(struct device *dev)
 {
 	struct pci_dev *pci_dev = to_pci_dev(dev);
@@ -1680,6 +1691,7 @@ struct bus_type pci_bus_type = {
 	.match		= pci_bus_match,
 	.uevent		= pci_uevent,
 	.probe		= pci_device_probe,
+	.can_remove	= pci_device_can_remove,
 	.remove		= pci_device_remove,
 	.shutdown	= pci_device_shutdown,
 	.dev_groups	= pci_dev_groups,
diff --git a/include/linux/pci.h b/include/linux/pci.h
index add9368e6314..95276f44b23b 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -902,6 +902,10 @@ struct module;
  *		(negative number) otherwise.
  *		The probe function always gets called from process
  *		context, so it can sleep.
+ * @can_remove:	The can_remove() function gets called during driver
+ *		deregistration to determine if remove() can be called.
+ *		The probe function always gets called from process
+ *		context, so it can sleep.
  * @remove:	The remove() function gets called whenever a device
  *		being handled by this driver is removed (either during
  *		deregistration of the driver or when it's manually
@@ -943,6 +947,7 @@ struct pci_driver {
 	const char		*name;
 	const struct pci_device_id *id_table;	/* Must be non-NULL for probe to be called */
 	int  (*probe)(struct pci_dev *dev, const struct pci_device_id *id);	/* New device inserted */
+	bool (*can_remove)(struct pci_dev *dev);
 	void (*remove)(struct pci_dev *dev);	/* Device removed (NULL if not a hot-plug capable driver) */
 	int  (*suspend)(struct pci_dev *dev, pm_message_t state);	/* Device suspended */
 	int  (*resume)(struct pci_dev *dev);	/* Device woken up */
-- 
2.43.0

