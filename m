Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0B27CD4EA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 09:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C5210E393;
	Wed, 18 Oct 2023 07:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270D610E390;
 Wed, 18 Oct 2023 07:04:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WflORXmpQHo8/H19VBynJgvxZVdFy06U5JFiAVAmbRT6idN1jWEzAsVKkU7toTfnw64wKJn4wo07gL7O6Ygw67+2uZW2jpSwzhmsz/K9p7aDepVFUR/7/tWiA28qd0vfCryxxvweJOqKC1PqYwl+t0KPfCnLj1gf/M5InPax7uUJUWTM/6BX94aQDUUdD53HkxXA//94npI/VXH72TTe/tYQWmyPaMwTsPAT+6A43k8pR8yLA1opQaehOO06SyPRIky3Dh0uch64ty9OXQ/bIRNmReDHDFBHuALGkQnU1dIxphVq0BjAy4LnInDTnjGNzVtWO0a+1FajXkLWOCGAJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luMp8R58CCOqHa+5av0BV3DYV9/iHbJDmL3D8gL+//w=;
 b=mWoFwMxo5C3XDxdXJA1Zohkh/AufwDwWuwMhzxNPBz/AU2TdoY5T/Ocid//XgmLFnsbgl5dLge1P7HSeVtpTy8WYqEv1ZmbsTPeeVqtHNsTGcoZPAIMx8SKhw8l8HuGaiAG/pmVHNfDOyAcj7D5GxhkLxElouMgQ4PLOEYGHOosfdNIaUQe4NbsUsXEahyUlikmjYJKHR+ls9tNmKt53Gp81skP+R4dc+nUVxbSEmMF4kBaTymsn3dRQAOZzwpFujLfjKag/TxEV8yN21VE9PEXTraGH251GffB6VbqSJwibXPMQZiwn5YGcLr/T6D79cgTeWTZm7w/Gywzegcfqkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luMp8R58CCOqHa+5av0BV3DYV9/iHbJDmL3D8gL+//w=;
 b=XfuVj3oBAOiEkw5zoEKrFstA6XpH39RE1t2BcuCOPHUok9hwe1yPRtTQP5GFn6a1FVggXXs29TJo3/kpJLLuPogTdHty3L676yy1R6fEWKeLx6dEVTpyc4Yhjh63tLbEuNjQ8YcIAlBOrhJAHTUieasKpT3ZGjJXl1wU+kRmg0s=
Received: from CH0PR04CA0053.namprd04.prod.outlook.com (2603:10b6:610:77::28)
 by SA3PR12MB7832.namprd12.prod.outlook.com (2603:10b6:806:31f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 07:04:26 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::ef) by CH0PR04CA0053.outlook.office365.com
 (2603:10b6:610:77::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Wed, 18 Oct 2023 07:04:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Wed, 18 Oct 2023 07:04:25 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 02:04:08 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v4 03/17] platform/x86/amd/pmf: Change return type of
 amd_pmf_set_dram_addr()
Date: Wed, 18 Oct 2023 12:32:27 +0530
Message-ID: <20231018070241.2041529-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|SA3PR12MB7832:EE_
X-MS-Office365-Filtering-Correlation-Id: 855ebba5-7bbb-4133-c558-08dbcfa876ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IDZsiCrdJSeaUHSFbXWP+x9X20HiWaEuiztOY83L9l1KbR1XiBUBVhi0EHldWSS76kxKHZSahJJZes8rWo5xpxpGp8EqEcwgcEx8RxKRtA8soh3NvwVFKOLs0k9hLg27haUzSnUY1kWjwEz1DaHMLe+w5BIZb6wuMtBs0fiatne/7ddIde20Y9v+lU/xDju3b1S3/N5DK5JV8N1aubmf+xfXpwgsvjWJGL0q5mBfxoO2w/kzlmMdl73fanGDjtk2CkzAgIzVwNPJ9dfhCKPAnRWUMVYK9JvOkfaF41tilXtCH+E9ES2i65/sjCiPSq9ggBKGUcAx4Tz/up9lz+gdAZxkWTlRLDhd3+cQGbgB75Ug46eo4DCZAlLs82YDAklXF3VCZ4bQ9w/qW7qh0IkJGkz28JC11YO0yeZ6AZnxKBh3bPrHROaefipYr/qH6i67kCQ6aWm/ZPk0K16aVlT92J1RodyOS00XLTrbJWOn6NxAiL/y6NU9QXs0lDxmpQBPUL0KrdTRl62CcUrAdGdKpA5v2VDSbkjpoIKNxLTmWQMditx4InspC4mgqejzDRxr0uQlIZUEW/xTPRFUnwPJ85Mw4r2XNgzXSVsfjM73sCVvy3xNY+ykLg4E+l4X6TpuCpAbwvqSVGjMduBuj+DWtayPYIAnoKq7IulWnUtZpYqEelnZ8TpD/JKyuiLpBzqhuL4u4t76NDdZJtuNoga2Shr8N7rYNbz4+2CD4vGQ/xaMB/GA+9c/4VrjjRwjy5P5c2d8IeAfLwJyr0InyFs3S/BU5pjNcPnsQ+cP6ZJdYl4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(376002)(346002)(39860400002)(136003)(230922051799003)(1800799009)(186009)(82310400011)(451199024)(64100799003)(36840700001)(40470700004)(46966006)(7416002)(7696005)(2906002)(5660300002)(4326008)(8936002)(8676002)(41300700001)(70206006)(70586007)(54906003)(110136005)(40460700003)(316002)(478600001)(6666004)(336012)(1076003)(2616005)(26005)(16526019)(40480700001)(83380400001)(426003)(81166007)(36860700001)(47076005)(36756003)(921005)(356005)(82740400003)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 07:04:25.4740 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 855ebba5-7bbb-4133-c558-08dbcfa876ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7832
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

In the current code, the metrics table information was required only
for auto-mode or CnQF at a given time. Hence keeping the return type
of amd_pmf_set_dram_addr() as static made sense.

But with the addition of Smart PC builder feature, the metrics table
information has to be shared by the Smart PC also and this feature
resides outside of core.c.

To make amd_pmf_set_dram_addr() visible outside of core.c make it
as a non-static function and move the allocation of memory for
metrics table from amd_pmf_init_metrics_table() to amd_pmf_set_dram_addr()
as amd_pmf_set_dram_addr() is the common function to set the DRAM
address.

Add a suspend handler that can free up the allocated memory for getting
the metrics table information.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 42 ++++++++++++++++++++++-------
 drivers/platform/x86/amd/pmf/pmf.h  |  1 +
 2 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index ec92d1cc0dac..f50b7ec9a625 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -251,29 +251,35 @@ static const struct pci_device_id pmf_pci_ids[] = {
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
+	int ret;
 
 	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
 
-	amd_pmf_set_dram_addr(dev);
+	ret = amd_pmf_set_dram_addr(dev);
+	if (ret)
+		return ret;
 
 	/*
 	 * Start collecting the metrics data after a small delay
@@ -284,17 +290,35 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
 	return 0;
 }
 
+static int amd_pmf_suspend_handler(struct device *dev)
+{
+	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
+
+	/*
+	 * Free the buffer allocated for storing the metrics table
+	 * information, as will have to allocate it freshly after
+	 * resume.
+	 */
+	kfree(pdev->buf);
+
+	return 0;
+}
+
 static int amd_pmf_resume_handler(struct device *dev)
 {
 	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
+	int ret;
 
-	if (pdev->buf)
-		amd_pmf_set_dram_addr(pdev);
+	if (pdev->buf) {
+		ret = amd_pmf_set_dram_addr(pdev);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(amd_pmf_pm, NULL, amd_pmf_resume_handler);
+static DEFINE_SIMPLE_DEV_PM_OPS(amd_pmf_pm, amd_pmf_suspend_handler, amd_pmf_resume_handler);
 
 static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index a24e34e42032..6a0e4c446dd3 100644
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

