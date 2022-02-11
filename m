Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0221E4B2DA4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 20:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EA810EAFF;
	Fri, 11 Feb 2022 19:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3409310EB13;
 Fri, 11 Feb 2022 19:35:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyiljQrC6Nzi9JUzIVHbU2koLdDuHbcNhhS+3RGw6U/DNJ6QY4Jik99RScpXiQT9xQ9vYWpg9WNuuv+AQ6LlRBtMLS8emIqxs+SKOuLwBt1J+8gZagJ3mI2fXAND6DnDN++T/coRIwv/giHUR4bcnaz6kItu7cgyi+MCU47lZWZpHwXLZXFPdsrt0XplrEv5aEMnnSI/GoV7h34cfkZz8ddxFuXaT7fXmpQQcEHKW3mzKIAbpN9nx348hv+2wmJ72tGud2VNPY8fNr9RQkQef8c4lFRJasTHMO7g7DYO3fy0Crz2q58YP+UIXxS3gLn7H2n1tgrrzD9UQo53HjPt3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqZ4dsvyH1pE+Blj7hAu+u+8lgM31K2/MMjKabJ8mIk=;
 b=AgGB86wXHopeaRElrl0JylPGNqbsfXF8lmOsX2vMF0mD0th+C1lLFNb97ihHA3W1O1m8QNWoodHs0HdysKfRsBASuT1XSxks3cdCtulWA2/abW8hKf/rTbuPjZbtx613ZBy0HE4LiwqWUcNniLcBk1OatpRhm6SdWRGe1zy0LE842hmaA1IGBRwP13ecrthRq1a1ksva+Ura8nfYTjz4numSrYRUa0pl4fDELIdJ5/iP89KafQOnxmPNzQL2/QBdC4VGKJ601dyu69s3kaq4F6CL9exiUtkWlWylNFlT0zmuQBZnYP8aCiog11/dn4F9uYFdlJqDMkL1UVUfTBMaUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqZ4dsvyH1pE+Blj7hAu+u+8lgM31K2/MMjKabJ8mIk=;
 b=cH5+0Aonjv6gLOHmwN+xhwLQd3F24LY7I08O8FQB3kKc3gjJJfTj5NgDhWCdqvsPP49SDN8cmMvJRncf4/3kIjdqQujarn5TOGFddaR8SWHkYbmZr86twKHAGlhSZpQ3GAAfT1D+Pelf0nl9J/3/PHl+zP+qFAcKIz97eo5qbB8=
Received: from DM6PR08CA0043.namprd08.prod.outlook.com (2603:10b6:5:1e0::17)
 by BY5PR12MB3937.namprd12.prod.outlook.com (2603:10b6:a03:194::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 19:35:14 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::65) by DM6PR08CA0043.outlook.office365.com
 (2603:10b6:5:1e0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Fri, 11 Feb 2022 19:35:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 19:35:13 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Feb
 2022 13:35:12 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 11/12] platform/x86: amd-gmux: drop the use of
 `pci_is_thunderbolt_attached`
Date: Fri, 11 Feb 2022 13:32:49 -0600
Message-ID: <20220211193250.1904843-12-mario.limonciello@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2fa93ab2-6528-4a58-d377-08d9ed959fec
X-MS-TrafficTypeDiagnostic: BY5PR12MB3937:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB3937CF70D50A6BE49976AA17E2309@BY5PR12MB3937.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M/b2eK9QvKW7DVabXCYww0cR7joqIEYmt7MyPYi5kxkzd1RU5O5inT7M9y4gmNEQQq0U8V5/GK9tcsqsykFZoCel2/KEc4N1pFoPoohU2fhoLYz61wjEWoKq0MIzrxYBH8SSlXcLSI0hZVPEyADp724g31f5TQ6bj/qM2m2npqrzy6c5yU9/rJcgVFoD+nT3PR+m9/H74KEvP1RuoD4U092v6nwcOgYg4jcmCP7pIL5bN/LBOTU8I1Uvf3iBMy56AekTufAcBmlyZ5Q7p8/cZ1p/3e/WXEU/76C8WMyMSpGz4Cyesyi+xQiAMl82pBXe4KdNMhJtWaNEnQhPN8cxFx0VwJ6zy39eIpQRVBHX4Fr9Ojr1ohbWy2nfgfWrHRobHM9RtJMvzIckzgUf9UzvTIPqrMQvTODHXMD7puBb3I0GF47dByYMxkMdw4yKk+A+NsF9jK1Lx/TcgEbejk3GUfpgf/S0+EH5kNA3MnxG/fusu2Q10ebIFEuQ6JBipEl2BkfcjlV/45tmFU3VfH0cIleaWlD3JOAe80qM9uMF5ayYMkdsyZOFU7VTn/+EoHI/sGaeTEb+uWFjUKue2/9ys1wkeTot0aNvxv0v8fSmwIRvZdf85clLdizM71WpBWxMBR/GtsNiT3ZtN/YQKZzYsDx4WoW/pPYRNcwggp9P3xU2gcstQ3rkkQq+pb1Ia2kTKGiYcGU47bLveMwRdsRwnUZ+dwG0fmudIieTzpYbJxc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(8936002)(86362001)(4326008)(336012)(316002)(426003)(186003)(70586007)(110136005)(54906003)(8676002)(82310400004)(81166007)(356005)(1076003)(2616005)(70206006)(26005)(16526019)(2906002)(40460700003)(508600001)(44832011)(4744005)(83380400001)(7416002)(5660300002)(36860700001)(6666004)(47076005)(36756003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 19:35:13.7550 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa93ab2-6528-4a58-d377-08d9ed959fec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3937
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

Acked-by: Hans de Goede <hdegoede@redhat.com>
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

