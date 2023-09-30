Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 830307B3F45
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 10:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE0010E15F;
	Sat, 30 Sep 2023 08:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4326C10E130;
 Sat, 30 Sep 2023 08:38:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkYuGxU2iO/vstOvW6/B34lptZ3K0AiPPomLZlAsPhivpnDUNCOM7TqpBunR98SfDFj64IPVX6AhNp43LZqOe/AfAyF9VHRb0K7vQdLA8/Oys0HBKpO585H3WsNDxQW3LXqZb3OHoemedo55kY3/VP/BwQwmbtWXxAfEgoSbx9/DVS3icc+LCUtqRUylmD5w+Lc9bqoFMcmpi8AAaoX/xWQMJGy1zr2wmmokOLMRa4DvCESqfica6z3PDGKZ/u48uT2DhBfJlGPIx7vdWHjkmN2kfPeCgGhU9/EwzTwK8Lh6RqmeNw6vJnIScuNYQuuMXSTYeHzVXX2Bq80OSxit/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvhjcAd2wSHKmqwA7A5y4WG7DJ3FKJLdP71xUzcOvjs=;
 b=ch957cGblvvQJFn0zH5ZKBTF5mevtiQlG6fKnofzH2ZLqQP71pbwzvnhk0qPz6POhvSJRtpkiyjk2NsUs+/yqVyr4ilb11fCjm8dVgLfclJRx2KtlZscEa+6mtp5U7hvH59l2OYUxAJ7OGABwHXx3t0QMFBCnLq2bOK6rmacmD4ANKbSwOcqBI2gwvjUBU8Mfyt2Ree63EPfS/H2X7StjOYSZF8wm72/2cxqrcrDP3M1uSE+NgNYuEZ2nHUFeb7qegyVbahXtedv3j0DjwH4egBFCZUbcT6qL4LPykgMuoobzmzbzpwsN+XuFNJV86BcIJRrgbIDIOVL0s9yDKpOwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvhjcAd2wSHKmqwA7A5y4WG7DJ3FKJLdP71xUzcOvjs=;
 b=HvYE+dnJjo+UHmqvd7kh5MHsHEkyavpoLm50jlsBDQjFaet4lXNOdLui9QSY8Fq29pn29m0ypciqIqiS4B0hvSrfCpjz/6iabYLCrGnEcgbtxufg5WI+cmBmhyJuPY8YcoU4hlw5yKJn51bR27JqIm3MmlBy2aA/gGGg3oVI78c=
Received: from MN2PR14CA0006.namprd14.prod.outlook.com (2603:10b6:208:23e::11)
 by LV2PR12MB5845.namprd12.prod.outlook.com (2603:10b6:408:176::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Sat, 30 Sep
 2023 08:38:40 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::18) by MN2PR14CA0006.outlook.office365.com
 (2603:10b6:208:23e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27 via Frontend
 Transport; Sat, 30 Sep 2023 08:38:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sat, 30 Sep 2023 08:38:40 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 30 Sep
 2023 03:38:24 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v2 03/16] platform/x86/amd/pmf: Change return type of
 amd_pmf_set_dram_addr()
Date: Sat, 30 Sep 2023 14:07:02 +0530
Message-ID: <20230930083715.2050863-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|LV2PR12MB5845:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ec4784-4c28-449d-98f9-08dbc190a5e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r2ljVX/qlx/ojhvolFqpz7xB2OgMYNwEeUKoCUfp6qxZ+4+In6J4CWrk+FtUBGDW6Lz6XdIhgorcIwaMcM3x22/Flav03AS0SQNy39Vf6qQxt7VeledLGq/MWhdK5vJXwHhP1/ASIALzMSzArJJE5H4i9NlSaTaanGR8nvTE0xiOQ/RIj290xiR8B+4IrKDngOHTbpKFipNk11Gxoh1zksQ7CwmHz2J8GAbteW3r6zyvrwoUG8hR2//h/0Hp/jHaqxXoFOFBYpM6xXVyUPNUQby7n5ZetgMwyZcfFe/oNbLjeNokthWSgGLK9PbRBnjMI+9Mr7SUecPjre9XMNghNaA3naZ3tZ7iIQqqHMQYr1JrD1rLJLJ39OXxh7FJA221PqOP/9eDTnqY48cGBgweG3wrMVqD3hiIs54eF7tPOe6ZVxC1JA577QvflBGMa0Di65E/D8WI/MpseAcfrGaxV/c1EX87MieNbFKI6vHgSDWua0CfzDOJhLjdelrapYO9Wxm7Nt28gkFEvdgRaOnYLshyG7ESICuWrKjiXwn/icPbSxX4vgJDu8nWogWrFmrpewwBmm4s+04ho7ulgXA3WlH+XDwMgP0jZb6mSI96okgsiNd9r6rnZw9gLEwwsz0C+t9FBy3IFnYx2RgsaPwx3HuQav/wBsIgux1nl0QHeRrFEtkIvgCAcn2qhy/yvEFLGV8wlPRZpds2aaXdfB5AZBlfqY12tBrunxiCXjX7M5pITJbesVcLhVy7dr1L16o3pOOIIyzQ31ghOWLvfXJo+7zuBGIkf9Nq4tR92Seg5oA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(186009)(1800799009)(82310400011)(64100799003)(451199024)(46966006)(36840700001)(40470700004)(40460700003)(40480700001)(47076005)(7416002)(26005)(2616005)(110136005)(36756003)(2906002)(86362001)(8676002)(1076003)(336012)(4326008)(81166007)(41300700001)(8936002)(316002)(478600001)(5660300002)(70586007)(70206006)(426003)(16526019)(54906003)(36860700001)(356005)(921005)(6666004)(7696005)(82740400003)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 08:38:40.5458 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ec4784-4c28-449d-98f9-08dbc190a5e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5845
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

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 26 ++++++++++++++++++--------
 drivers/platform/x86/amd/pmf/pmf.h  |  1 +
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 68f1389dda3e..678dce4fea08 100644
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
@@ -287,9 +293,13 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
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
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index e0837799f521..3930b8ed8333 100644
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

