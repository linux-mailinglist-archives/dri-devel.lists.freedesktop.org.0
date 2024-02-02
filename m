Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1821847C43
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 23:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B2A10ED17;
	Fri,  2 Feb 2024 22:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5RSiXt1j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A872E10EC49;
 Fri,  2 Feb 2024 22:26:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYXEmYKe5LVN9FA4p8K0aR76WCackaQ70W5XGsmJPfdsHDuo0VwRibEWqste+5xLm62tYkoPHWQR2/QiSHhp3cF7d8XBtDa9ca0AzI8Q5sE1AnIQg+ZLS7p7co41b1r84z9LzA7eT3/urTi17hjiU8hXJOXVWEyJOjApfI3YRFj3banbr/fL9pfEW+wX+kIw0r/zmkC+/yuQSlsDdQ0swM4p8S+CctOnn1FwffGNpw+iUNzMTAv3aZnfN5vi6OANwG++DV0EH2GYcOT77dgPpTCdgBukSuOBQiliF78Rpy9SyuHYEAcNNItRG1DaVYH/r4XKB/Ju2XccSARycsc7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ij3AysBjE+DDkvHgzRb/qiJ8bpUenktgHD0X9hR9KFA=;
 b=CmlG7QbXC+4o+tb4nDJHaCFrwiHyrdT0KjpFQEC3MQh5Z2XPiuGd2jSsdKknvA3qNwSmPM6/aiC9fBabiBqeK+IH4DmVBaKfm//x8qLPZnJmDrZf6HIHBTav+2EqzeEyx2JAmDRLExVj5wq4AaDSoAMGeRUNf1XrM187C6pPIydTimKY9gu48h81qM7ySru7tGCwG0jjmGXp6/suqa4sLJUaL+Re/EuWVZGhPhQcgpCNTZ2OSvMLCXWY2VKH0/mrzYRe7typUpYNCJYH1fwSNGB5exV1DeL3yzQGA0KOlVofQysdDPzOFLkbD/0r0jdpZ2hQH3mWli8c6mmJg81jjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ij3AysBjE+DDkvHgzRb/qiJ8bpUenktgHD0X9hR9KFA=;
 b=5RSiXt1j0Azvhs7sanaBUcEXtj4S22hBlFhe/eE9O30AGU/qaix9l8tS8/ghdqyMAmA2IkQUrjEXLK1Yn7tZAfFhngtMk4UPezVNEI4J7OGky3RAcYcFc+Z1hhnTX3db0Yhtcz9h2Qeeutaf1IEvR5LJw0B64lYCKrQakC5sRHY=
Received: from CY5P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:b::29) by
 PH7PR12MB5928.namprd12.prod.outlook.com (2603:10b6:510:1db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.9; Fri, 2 Feb
 2024 22:26:30 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:930:b:cafe::b) by CY5P221CA0013.outlook.office365.com
 (2603:10b6:930:b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29 via Frontend
 Transport; Fri, 2 Feb 2024 22:26:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Fri, 2 Feb 2024 22:26:30 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 16:26:28 -0600
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
 <James.Zhu@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, Alex Shi
 <alexs@kernel.org>, Jerry Snitselaar <jsnitsel@redhat.com>, Wei Liu
 <wei.liu@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-pci@vger.kernel.org>
Subject: [PATCH 3/3] drm/amdgpu: wire up the can_remove() callback
Date: Fri, 2 Feb 2024 17:25:56 -0500
Message-ID: <20240202222603.141240-3-hamza.mahfooz@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|PH7PR12MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: a657c881-da50-4bc1-ec1b-08dc243e0120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P8TEXwgsOxpYiAy9jkAO7j9nHkd4LOqYdZoJDMc29Nn2NXwbUE5B9h4P0FXYhfPCxgXvrUbbi9G0AqSpQ6UvcnyMGvCZl2UYa2SsJado53zEGUE9FaIi/4nm21fk3oFOa1odWU39LRqjZglZoM3jm4UIZQ/F88ZJDZnfdUu2n+XdWYi9tSltZ9ue6xKlSsL0xX+gAXtDqF8juOUou8XdyTTEE0YqdljxwPKVrPkp1WKLUg2BDMITWHACZLhDjRxgNNWyaW0svDwDhH7BhVMPHWKvwVHbpnyZ63t0Dj09hJ9kr9nYwl7/Akns3ahhq3JPkE4ub7H6ZSK2PmO58z2vhxALKAYB3+XMLb/x9537+gl5c802ws2jBN46I4ALOjXQB/XR56uj5XCp5lzRzvj0GEzl4uTDmFUogGBZ6WAmNRZSNdkFJf2C2AsbkgnnzkIR8tK0+XLQttI/vOYySEciKeNqWl2skSpVZH90QoIpjOAg7sJ8ZC9uwrZSHlBm1xuJEsvJ9d//Z5X9WzdjJ1Ib+ROhdGNlCw4MfCfBIiCn+b6gHvOue1lugHHSihWd5X3d4UI8CjvO45oniBaca4sJVNRSK4smSoeOoOAxQW8RaX/00fNbJuFRkw3EePdiFpowcd738LlyWbGe1hbjB1kuxf8da+deKvSZMLA7DbGHygEQGYkEDKucQWYNSCmisfbM5o/GXlrQp7W2e8JZg0JGnJXc1Ix0B9VfKtYqSyxo662cjiyURfpVGJq7As2GNOHYAOZGOFzLTYf+gDOz+s4+QL5ogAx1+fEo7DCTk9EBYnMavDZwWrCnF9hX1YRCEqcB
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(186009)(82310400011)(451199024)(64100799003)(1800799012)(40470700004)(46966006)(36840700001)(41300700001)(36756003)(44832011)(82740400003)(70586007)(4326008)(8676002)(70206006)(8936002)(7416002)(2906002)(86362001)(5660300002)(316002)(54906003)(6916009)(36860700001)(356005)(81166007)(6666004)(478600001)(83380400001)(47076005)(336012)(426003)(16526019)(2616005)(26005)(40460700003)(1076003)(40480700001)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 22:26:30.4181 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a657c881-da50-4bc1-ec1b-08dc243e0120
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5928
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

Removing an amdgpu device that still has user space references allocated
to it causes undefined behaviour. So, implement amdgpu_pci_can_remove()
and disallow devices that still have files allocated to them from being
unbound.

Cc: stable@vger.kernel.org
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index cc69005f5b46..cfa64f3c5be5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2323,6 +2323,22 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	return ret;
 }
 
+static bool amdgpu_pci_can_remove(struct pci_dev *pdev)
+{
+	struct drm_device *dev = pci_get_drvdata(pdev);
+
+	mutex_lock(&dev->filelist_mutex);
+
+	if (!list_empty(&dev->filelist)) {
+		mutex_unlock(&dev->filelist_mutex);
+		return false;
+	}
+
+	mutex_unlock(&dev->filelist_mutex);
+
+	return true;
+}
+
 static void
 amdgpu_pci_remove(struct pci_dev *pdev)
 {
@@ -2929,6 +2945,7 @@ static struct pci_driver amdgpu_kms_pci_driver = {
 	.name = DRIVER_NAME,
 	.id_table = pciidlist,
 	.probe = amdgpu_pci_probe,
+	.can_remove = amdgpu_pci_can_remove,
 	.remove = amdgpu_pci_remove,
 	.shutdown = amdgpu_pci_shutdown,
 	.driver.pm = &amdgpu_pm_ops,
-- 
2.43.0

