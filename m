Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D524F7AB83C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6C810E6DC;
	Fri, 22 Sep 2023 17:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D6E10E6D8;
 Fri, 22 Sep 2023 17:52:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAmxYIIP7I9kSj6MiOvU61T9dqQmn+SRXa0oYVipEKiiZJEyzvjd+VKq61V7eHGePNZCNh17/HskD7DmhLwExnrBfoBfi0zUmoW33q36QBa4hu7twvV/6GmSAoymlCkxGDDcFealKLw8VBKydKMBmjyggsEAfACYILBJmzub1hVXnqWgrA6eBQFe6iaDWa/kors0UlRL0r2mE4eQkshYmkthtlxadDYRJ93ddc2VFqk4RSJiwiDFM/hlW7sWb5tJ7ME629lE+zn3yjGOjLt96vAGD870D3nqMsf3p6o7jx60hpL+7mPlk+2PasZmegcPVCpF/UmO8eYO+QaIjyuLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aL//3y7UzczxCd1EtG0BGZayUc/qVAf2wxPRQTYYYRg=;
 b=FRFGKBX5vq9H1GOKfyazU8tAyu6Z7o+lJL6BQwbZF0/vryqj4p1Tzlc0r68/nTM3l6dlg6Y89QvO7Ih3de1CUQzNg5AGvnvO5OrcVosQ2vss11vOHbF1WSEmXaEhf7UY05LP7biVan5ioMpuFm9iN5oE+6MPn/v9ciCHjtwlLSGsUi5clf/5X6ZReJZgH+sw3BbLPCUzTFj1SFofETeLUtwccDCLrOlA7BAnnwa7GMHvMo3rdL8BkhHnxE2zGaFw6EEqRREKyrxnO3iGYyjKOs1Bofe60q/F4cg0b7ji74LPjSdgP8Gc+LgdDcQ+niqpwhxnmSrQe/S9oosDdlnwbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aL//3y7UzczxCd1EtG0BGZayUc/qVAf2wxPRQTYYYRg=;
 b=b5fOItkxGkp28OYI2kmuEEJhGeNIMAoh4kTSglTS2lXWbHEe7mOUpyoWQh7TiNAtGTjAJIIEmZMgwBnEK1IlZeGvfCZjqDYkBVWbfW3oufgk/QPLldFIHln9ASCGlJq52YMTkha9lkC6zt+4CSMBpvwvOYQUAHVktRkAOzTrhaQ=
Received: from MN2PR11CA0027.namprd11.prod.outlook.com (2603:10b6:208:23b::32)
 by MN0PR12MB6223.namprd12.prod.outlook.com (2603:10b6:208:3c1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Fri, 22 Sep
 2023 17:51:58 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:23b:cafe::df) by MN2PR11CA0027.outlook.office365.com
 (2603:10b6:208:23b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.32 via Frontend
 Transport; Fri, 22 Sep 2023 17:51:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Fri, 22 Sep 2023 17:51:58 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 12:51:53 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <basavaraj.natikar@amd.com>, <jikos@kernel.org>,
 <benjamin.tissoires@redhat.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH 03/15] platform/x86/amd/pmf: Change signature of
 amd_pmf_set_dram_addr
Date: Fri, 22 Sep 2023 23:20:44 +0530
Message-ID: <20230922175056.244940-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|MN0PR12MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf655cf-f061-4d6f-e817-08dbbb949e07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w3J15fObfSHKHI/k98DGH+LAQviLrawaXSB54LL4C+p0kHbV+KQDu/SplRtpAJ+L/TwRteaAy3MIU+gQuRURxxmP9yx5lFofaxtjhvdwHMbcf2k+EyWvobV63Lt8NBGy2yDPafJ5fcTucjit/xUczWkp/IDzf2Dds62rdfRtu+DBJoGC0cG6LCqyaIMm8YO04cLtuXjDn2tmtgCJtjuQeNhzzMAag79Qz5YHjuiMvGNzCrth5iROxerp05wpRhCDiBwC8FDBEXM+WP26kZmPFNC9esg6Yqk/bG8v3SGrn8ekiveJ49+IfvaEa7psN5hUae+cjGeWac5kAGkmQTKjsXw9ZU6s6WwitbpnKeHXgE2VE6F8DMUYhn7dwVvZpQ0g2zRCl5Ke0eDNL9Av9taI0cZVNt2ck7lOUq6GUCPQR0gqYKLeH4KYAt/0+Fy1vdWhzzFPoAjqncnuBMEVq9osWsBkFTPo3ifo8jtH33GNbqjYPtAeqkGmhMTC/1jzgayf7B6aK5HxO6NEx4pFlJzf5Js2DiZ0uiwg652EtgFAdGoS98Q7e0Jb618IuH5O3KOvjkvYhkK7c5eA3pGyhMV6GDtokRVJlIh6CsnmU/Brt7eG8yxcaYYR1uaLAbsrw0X4fIWCMbkRVavVcdSG3pDEvA1+HuELy9hDtv3OLuXG7yBDzHA8j+/XaBIPJarCtyaCuLVcAiHRV09hlKFkoNg+FF2Xd9S05P7eoto7QZFsszYnvilLlxfDTfa2q1FKmDaoY4aym/QDu7WalBqJ4yN02qtyqD3Y5DjU3I1ADQuJxO2NlsD+QsZHMeehmVfMfjYvUQ6Osni67WfB4ZPpiMeXKA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(39860400002)(346002)(396003)(1800799009)(230921699003)(186009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(8936002)(40460700003)(5660300002)(336012)(83380400001)(16526019)(1076003)(2616005)(26005)(36860700001)(47076005)(70206006)(54906003)(478600001)(110136005)(70586007)(316002)(41300700001)(7416002)(8676002)(7696005)(6666004)(82740400003)(921005)(426003)(4326008)(356005)(2906002)(81166007)(86362001)(36756003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:51:58.3460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf655cf-f061-4d6f-e817-08dbbb949e07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6223
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

Make amd_pmf_set_dram_addr() as non-static so that same function
can be used across files.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 14 ++++++++------
 drivers/platform/x86/amd/pmf/pmf.h  |  1 +
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 68f1389dda3e..5fb03ed614ff 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -251,26 +251,28 @@ static const struct pci_device_id pmf_pci_ids[] = {
 	{ }
 };
 
-static void amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
+int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
 {
 	u64 phys_addr;
 	u32 hi, low;
 
+	/* Get Metrics Table Address */
+	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
+	if (!dev->buf)
+		return -ENOMEM;
+
 	phys_addr = virt_to_phys(dev->buf);
 	hi = phys_addr >> 32;
 	low = phys_addr & GENMASK(31, 0);
 
 	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, hi, NULL);
 	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, low, NULL);
+
+	return 0;
 }
 
 int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
 {
-	/* Get Metrics Table Address */
-	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
-	if (!dev->buf)
-		return -ENOMEM;
-
 	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
 
 	amd_pmf_set_dram_addr(dev);
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index a9333ff6c0a7..ea15ce547d24 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -421,6 +421,7 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
 int amd_pmf_get_power_source(void);
 int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
 int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
+int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev);
 
 /* SPS Layer */
 int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
-- 
2.25.1

