Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D293F4B18A9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 23:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5EE10E985;
	Thu, 10 Feb 2022 22:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674ED89DE5;
 Thu, 10 Feb 2022 22:43:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIWQzvLvimWitTxPtRjk6qKJAkjg9DeU5QWuc9i5Dz2Z4gQsfKMF88AirAN8fWyXQJQctghnVC5FFMF6/cOTdMaTQ5rS+WcfI1CO7Z0a4a3vjTvMx1aqAfemVXy/ajrCOU5pge705h4cWDHbL97vpp9EGL8sD/PvQ8Gk30poC6Tp0c6wgCRDqECIoiWBPCtqN9dFRagXIE/ltPs+VdR+iWPuT/yQynzf+1BQMILWheZ4H//egrG3/hhwDVYkG6eyk/G9R7D01Pa6l90IwrwDQH2yOQL7ItJD1uMkfZcS+VapoTFFddn5xOThhyFpoQIUsO/7Uu18CUms/zjWdyogZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIvYZ8/68wSzbmpsSTMm9oxoym5TV6xAjnkSns7DQfw=;
 b=SAd8SYPOIGU+Mhpq7VsEyWeCAoBe+LPrEueye9B5Wz5DdKtoW/c8AlI4YvsKMSMua4+pHpCNlsPOk7S35Su5o6MDxW/Phwf0znihhP66eiC3EPuw+IUMsPQHQ9n9yuVAtrfd+GzkvFT1w++G6mzPGo/XDX66IyZu4zoqq87jwuqevxugzW7EjcBZepzjtBtJCxMlSUPZPo4SyhXhO14YOF4IMN3CQrCs9HzBTGnDWmWNJx+ayBjDQAd28fSIijgjfczj0vVqAw9IsRQAh7ugeHjg9vTuSDf8MBvOlAmHTA+GjI0VY/lBdMAbgy9xlFYOe+R62Q9mrnidg0ubwOF7Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIvYZ8/68wSzbmpsSTMm9oxoym5TV6xAjnkSns7DQfw=;
 b=j5nCXgIogXDW+4bm+lcinkEX6AVLfQ9lP2OtvC7MX8LGrtEWyo3pbnB2B60IBS2oshAgzF1ONN6nJDTdMay6zDo4Nq9110+4znatkFHuJT5Ejk62o4PY/tQvBksr0Nbl0seRSrJYuhdLO4afjvJKE27u/eL0gJGoC7bn4AsUEjQ=
Received: from BN6PR2001CA0038.namprd20.prod.outlook.com
 (2603:10b6:405:16::24) by CH2PR12MB3879.namprd12.prod.outlook.com
 (2603:10b6:610:23::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 22:43:52 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:16:cafe::e3) by BN6PR2001CA0038.outlook.office365.com
 (2603:10b6:405:16::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19 via Frontend
 Transport; Thu, 10 Feb 2022 22:43:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 22:43:51 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 10 Feb
 2022 16:43:48 -0600
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
Subject: [PATCH v2 8/9] platform/x86: amd-gmux: drop the use of
 `pci_is_thunderbolt_attached`
Date: Thu, 10 Feb 2022 16:43:28 -0600
Message-ID: <20220210224329.2793-9-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 725b5485-fa55-477b-15e4-08d9ece6cf8a
X-MS-TrafficTypeDiagnostic: CH2PR12MB3879:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB3879883DA777789B86FB0BB0E22F9@CH2PR12MB3879.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ShwvN+90h5MzUEhumxRAx2PvVWULydU5Y8ZzPJsU3CR3FCPOY8ntsYKwkHZ/i17PVgh3UgRka3Q5pDZdpKI7/WVkI2AJhSskB7m8ZD8UovJ6gUYYP3uM/CTaZsoe7J1eczJ7W0agO38gL/ltQrchQIS4U8P5DvvKDrSGO5/Oa0/23MTN3ZietEQdVW+p3IQ/hzApo/Tjno1L59f8wy3Oq1FibkHMZ8nXOSbH3Bt9NY4ewgi0V7oRxdNKfVSiF5N9Do2sHTGmNkr6H+Uwd0HTqzno2oU16+KHGIdWpp0s6HmGxhG5wiwDrLEHYZ2p+obXrJsdgbp7zKWILudpsHeziqDHWwkBhqrU7KyuRleHJzTduPJCKZBZ4UabaVDuMoqiNX48TpumxmY7WE7ColaqhjP5BV0I2dwRt1cgdiwNREDvlVIYj5hdm7PWHeN8kAPIJFMjQJHfPky15zTynofZJ+ZLstyu+dwoV8RiJ0RuLI+tg8ZpqVreLUXUZNXFPzVSSN6tQmLEcsczsq/fYwPxdXadi2h9L7e496R+QgEYmWi9KEVVXlBOwWX/VxSGmEZRrbI36dHDgQlE5hriOwUQ2VM9qeBJEt47EBgMul6ykMyyJJh5G5B/i2ziPDKABFAKwXBUwdRa8PCJqaY4AjO+NMFohVkE867LLAv6KRzzCjkYC1WelaJ5iZYhGWccDNP8AVtRe8RD6CU3/5nDV6P48qkwqrWJwhTaN7kJOL/Hjxg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(83380400001)(36756003)(47076005)(44832011)(6666004)(36860700001)(508600001)(1076003)(7416002)(5660300002)(4744005)(40460700003)(2906002)(4326008)(16526019)(70206006)(186003)(54906003)(8676002)(8936002)(82310400004)(70586007)(336012)(426003)(110136005)(26005)(2616005)(81166007)(316002)(86362001)(7696005)(356005)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 22:43:51.7577 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 725b5485-fa55-477b-15e4-08d9ece6cf8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3879
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
 drivers/platform/x86/apple-gmux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 04232fbc7d56..ffac15b9befd 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -596,7 +596,7 @@ static int gmux_resume(struct device *dev)
 
 static int is_thunderbolt(struct device *dev, void *data)
 {
-	return pci_is_thunderbolt_attached(to_pci_dev(dev));
+	return dev_is_removable(dev);
 }
 
 static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
-- 
2.34.1

