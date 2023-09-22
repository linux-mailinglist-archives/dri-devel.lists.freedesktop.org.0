Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D847AB84F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9214A10E6E7;
	Fri, 22 Sep 2023 17:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2050.outbound.protection.outlook.com [40.107.102.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4FA10E6DA;
 Fri, 22 Sep 2023 17:52:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUNjpljpI8W6KupdZHePKxeSJ9iMYWwEqieWaI+oDsXDV6U9D6mcPPqtYBbfZYYzzM8fpBraB82fvsLKsXxaDEdsvHNJUUnKAJDYTAIkAQTpFb037PP4KY4AVh/Y10lbH7hkgJPx0bOfjere4QtBOo0PSD3SXhZSgIrQQ7CMGSq4DmKo7zx1w1F6+X+LvRBa1R9czb20gVjyJnywRcPyu7GVUbCVJ2IzrSSX6H5z86uaiTZnYIZTXQpXnLyzEnocgeHaOm6fADf16m9UC4SrEhhvGpFAKgFiQIY6msLkxcujVxBk/ocKOrerqShxU5Pv1v5n51WG03KdvTUFg0QAlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRqX3Qp/XNorhFJElDFWl8CCho1EgTmSZc20lhsFdUE=;
 b=Ujj6T4lv8Z63ZbBBgmdpgGD6P4+prVr9EqSxWROYHTvR9EOiNpG/JzhWGds7VsVXF8ACT+K1eXk/sCdyv9oBDlArOsZBSWyLxm35sJlRjXG6c59HmdmXU8bOzPVuoZTL8XL/9CK3ZaWKRHgDO1yINfA7J+6lQt1TVCYNzRvREslnx9F97IvswfhAofo6MoXMtQC7x4Imcr12GWCre1BQgaTt1IhA6xbP5JEo3jV1TBRtAjFdM++sMKylMCK5ThOybMoz752/9Y+uo1tv8RAtkRiC1ARyPz2S1L/q5wbj7SwqoLjT+n8++6N80lhi1DAPhlrQuouY8WGRa3Qp38amSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRqX3Qp/XNorhFJElDFWl8CCho1EgTmSZc20lhsFdUE=;
 b=e8u3WR7r6tEwHHGBaxgCzACFgirJ9QoZNqQIcsuPaiTyhO20FM6lRiYcwJnkby5+5q9eLBP5/JuE1hCvuD26AAeBEra3ui0qKaqsfn2NjXnGFJBMAYpBQ4V0xNe+3MR7PhCrLQrD4qMiSgWh7u2Klu179hcKniXCNXI3sknaM6A=
Received: from MN2PR17CA0024.namprd17.prod.outlook.com (2603:10b6:208:15e::37)
 by BY5PR12MB4083.namprd12.prod.outlook.com (2603:10b6:a03:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Fri, 22 Sep
 2023 17:52:08 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:15e:cafe::3a) by MN2PR17CA0024.outlook.office365.com
 (2603:10b6:208:15e::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.34 via Frontend
 Transport; Fri, 22 Sep 2023 17:52:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Fri, 22 Sep 2023 17:52:07 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 12:52:03 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <basavaraj.natikar@amd.com>, <jikos@kernel.org>,
 <benjamin.tissoires@redhat.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH 05/15] platform/x86/amd/pmf: change debugfs init sequence
Date: Fri, 22 Sep 2023 23:20:46 +0530
Message-ID: <20230922175056.244940-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|BY5PR12MB4083:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b208ac5-5326-4148-6d39-08dbbb94a39a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BXPD++gghd6cL2DZVdkNHV+WzMGHnf3XVMnouxmckhlYyldiySAxMwW3f2/f62M+UwvN+cP3qJNC/aSZfkVor+NL1D+4MN0zoc7fF8MUohFkefSoVXhYhN0C9KKfDW3XWt2OJ/dLMkCgh670aD4aTaYvIIv1WdiHY7T2O98m8Yg2QY83jxWluEHHmHzo36hILUmqBdK8uQOx/BSL62sS56yEEBLEOFVyWq4Sccaycra++aYZJq6YWwmHhQ7qYDWkkuoxjFfHlORpItK93k//w5pIMSk2wl09ARaibnX5LfpVTU8Xio7o15TGbfxqEJAEJLfsRDPvHOLm+I8t+cUdH7/kqSEZAFXaGWPXpAdIm9zIhec0VjkoIQi2u9FzpZt8TrO2s2o2fIJDFKM3sf7+cjOLfl5jxcuzDLI4cIXK0MOMzHgO2aWfw5Bjgpy/RWGXmgIbPs2jBv2oeiUdHkWBgG+HBKkdLCrVachKUt/LAJes983YWY/5/JakqOe7pn/a8yugiBLEW1nwQ7x7bxuTgcJMLFmM93VFAe2XSuhVVPl4/X6rzaxdz7S11ooReb6Dn1j86C4WdTxqU+eGpEBobHJLxnnhFnaED54k7X6HZzIlRQ0NrAZuHV++EL1c3hYf95lB2IgPNeTXb0xKl6G/LrRXPC0Y7JYFhBu7F0YKaBwirQasEsloOPEOU2nyM4thXIWyLU+9zTBiPYbHtKzc95o9U7x0Xc3T2rlZcALcoaCo+CIxt7a06RskGLEWmQzB7L9DjjXgYnEK0ftfaBHCCr7TWsjF5hFoeodsZxX2Ji4oMJBjaQQvhi8j/33+pMwJv7wbC/rMCFaWurWnG73/CQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(376002)(39860400002)(346002)(82310400011)(1800799009)(451199024)(230921699003)(186009)(46966006)(36840700001)(40470700004)(426003)(1076003)(8936002)(26005)(41300700001)(5660300002)(8676002)(4326008)(921005)(356005)(83380400001)(336012)(36860700001)(2616005)(16526019)(47076005)(7696005)(82740400003)(478600001)(81166007)(316002)(40480700001)(70586007)(110136005)(70206006)(54906003)(86362001)(36756003)(6666004)(4744005)(40460700003)(2906002)(7416002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:52:07.7105 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b208ac5-5326-4148-6d39-08dbbb94a39a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4083
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
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Patil.Reddy@amd.com, linux-input@vger.kernel.org, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

amd_pmf_dbgfs_register() needs to be called before amd_pmf_init_features().
Hence change the sequence.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 6f36c43e081e..dbfe7c1d6fc4 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -427,9 +427,9 @@ static int amd_pmf_probe(struct platform_device *pdev)
 
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
+	amd_pmf_dbgfs_register(dev);
 	amd_pmf_init_features(dev);
 	apmf_install_handler(dev);
-	amd_pmf_dbgfs_register(dev);
 
 	dev_info(dev->dev, "registered PMF device successfully\n");
 
-- 
2.25.1

