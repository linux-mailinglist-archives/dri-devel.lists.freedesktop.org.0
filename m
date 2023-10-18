Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8397CD531
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 09:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2D710E3AD;
	Wed, 18 Oct 2023 07:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D2210E3AD;
 Wed, 18 Oct 2023 07:06:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yb98mSS7L8NpXUDIqmJIGyfKJNV6TXpijjtN3Vyg8HGVd/mz7EMFrfclwpiQk0SX93Dzdz50cHQZ3gAUDWr0XmG6kVYw7AIdBDu8XPYTXN8tFebmtR4HL8gXYHBeA5dBFeQgXziuuElDVvO+QK0wn+vSB6IuSsQAovlWbkyDV6OIXKlla1L832fBf1Mx4Kokc5/WYc6QFYlNfggQfWAluKm/6iLLbdFWlA+HjjvUVVg3j5Ex52mI7i7yHrCIgWxmhV3VxT914FcQBpaIaaWtIhW0hT6ZN/IG6dbOIg2dqCU6lybbcRqZ+/f/D9+dzjW1AfXbitWrGwlYbWMFZ0rnsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlLRLMyJ+Pqa2BgRo0txSc5xyb6Vj+O2+4CjXyORf2M=;
 b=htWDtrQ+kNebZvtM76m9p/KYXuGJJH4HuwfMjZEJ1Elu/7kZjeWoqGIRz12PLS3OlJpH8TXF8fohHsPVw4agGTV8pkLx22HanxJZlWEYrZHq158gv5SZymSXXvyGchGhaKopFILvXH4K0krImL/D9ghjPrhdQBARTGPNeF0bOWXZPypILd9PhW3T2Lr2/VRrxc2yuonDzQAKWc8OncDYTdtNo1DanqRNb7rOEW5R1pFDKulpolbQC3HQ3R9GPTOAesV4W5hL5NXybE0kSarDSV+F0i6XpR9aHLxcTOXesC7S6t2MvqdXn1zS0EKLiXIMlxDC7SflIZxeEUkveqkFuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlLRLMyJ+Pqa2BgRo0txSc5xyb6Vj+O2+4CjXyORf2M=;
 b=SmIXbqhkJaF/USATv8YFUQSBQoCv628eD4K+9RwhwMsr8fRy96d6ZvVP0uz6SjGW7en7TjO66ha6j9ewj9SoTJuRxmjFdFjQKgJeVUIMZmbNCGgbGLiyREvS1f82Vw0RKqaj7FmEuYvkAj98n5faFAPP4XRll2Lw1w+wXJmq11M=
Received: from PR0P264CA0238.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::34)
 by SJ2PR12MB8112.namprd12.prod.outlook.com (2603:10b6:a03:4f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Wed, 18 Oct
 2023 07:06:38 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10a6:100:1e:cafe::e4) by PR0P264CA0238.outlook.office365.com
 (2603:10a6:100:1e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Wed, 18 Oct 2023 07:06:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Wed, 18 Oct 2023 07:06:36 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 02:06:30 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v4 17/17] platform/x86/amd/pmf: Add PMF-AMDSFH interface for
 ALS
Date: Wed, 18 Oct 2023 12:32:41 +0530
Message-ID: <20231018070241.2041529-18-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|SJ2PR12MB8112:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa24938-0691-4c41-be42-08dbcfa8c4f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q8PLaCaXIeLIG/i+E120aEUFR7i6+thN+m4jJd+QbB/DZsEoMikJ2YtjGmXA+4RdC3hN/DD41UNp8q5FIi5FZxWz8BI4KMloveCNGax+I6Yxw1qFy8ZzVC2e+DsGM/PlnPvoqzbi3c02Is2ypQFpW21MPjdPHIQdJEg03CVgTTYOYYPNGi5HrigpfXcqUcYr6rV0FYIfC7nta3TRVpZ7ObXv8QuvLhRZwGb5ZJNdJYCq7lx2jI5ioRBotGEQywddQyLN2+vPdaNZcrUB/FsZqO31AHkpzSxgm7aVuG/iV8lYgW6RempGSNj9zDln1P71c3Z3RjegRzOhyEhDvQo1vaKRKT3nl5n84je0/IzKssMnVRbcGIuO10ILRkhhrITrBVjbWOngd/CmFMlPFem4fMyN0m50mWBRX/6u5UBi1CfweqWRFMtLBEo9DTt0Ey+Ymi5q9CPIXYVxJyattUxOeHxqVvGzbLbBwByV1nATgXqHjmBFfOmiWLth0VL5QnCZ0o9Z6BdH78e1BlExD4icODVflefBeISBTm4EHRMAd556UESVP2ZNA4eY7AUK39vLDAa9tFcu7FKYR0Rqec3XVtve1a99ESemm20Rz4gatoPs0X18Xvjub9p7v5QRbdaJiDwuxidkv0Ud1UMcttA1qI8gWjMsSN/SZDh30sEXDKTHda7hLXIBSGAOgxzfY0acLcmWdEYTUIYwryZYxOBGM5AS+qxWU2vEaGMoN/EBOldqYkC3bGEulLcYy7+H3AHUbvDGJ3JeOl7r8hhpoMc64Bw7Q6hjPDZ7rnSTJnpvjCI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(451199024)(82310400011)(186009)(64100799003)(1800799009)(40470700004)(46966006)(36840700001)(336012)(40480700001)(40460700003)(36756003)(921005)(82740400003)(47076005)(81166007)(356005)(1076003)(6666004)(36860700001)(83380400001)(7696005)(2906002)(54906003)(16526019)(478600001)(426003)(70586007)(70206006)(316002)(2616005)(110136005)(7416002)(26005)(8936002)(86362001)(41300700001)(5660300002)(4326008)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 07:06:36.8130 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa24938-0691-4c41-be42-08dbcfa8c4f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8112
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
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Patil.Reddy@amd.com, linux-input@vger.kernel.org, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

AMDSFH has information about the Ambient light via the Ambient
Light Sensor (ALS) which is part of the AMD sensor fusion hub.
Add PMF and AMDSFH interface to get this information.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  6 ++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 20 +++++++++++++++++++
 drivers/platform/x86/amd/pmf/spc.c            |  9 ++++++++-
 include/linux/amd-pmf-io.h                    |  2 ++
 5 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
index cd57037bf217..a1950bc6e6ce 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -39,6 +39,7 @@ struct amd_mp2_sensor_info {
 
 struct sfh_dev_status {
 	bool is_hpd_present;
+	bool is_als_present;
 };
 
 struct amd_mp2_dev {
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index 3dc652d41d7d..f2890d329459 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -77,6 +77,9 @@ static int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
 		case HPD_IDX:
 			privdata->dev_en.is_hpd_present = false;
 			break;
+		case ALS_IDX:
+			privdata->dev_en.is_als_present = false;
+			break;
 		}
 
 		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
@@ -188,6 +191,9 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 			case HPD_IDX:
 				privdata->dev_en.is_hpd_present = true;
 				break;
+			case ALS_IDX:
+				privdata->dev_en.is_als_present = true;
+				break;
 			}
 		}
 		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
index 7637da0dec6f..48a7a450e029 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
@@ -94,12 +94,32 @@ static int amd_sfh_hpd_info(u8 *user_present)
 	return -ENODEV;
 }
 
+static int amd_sfh_als_info(u32 *ambient_light)
+{
+	if (emp2 && emp2->dev_en.is_als_present) {
+		struct sfh_als_data als_data;
+		void __iomem *sensoraddr;
+
+		sensoraddr = emp2->vsbase +
+			(ALS_IDX * SENSOR_DATA_MEM_SIZE_DEFAULT) +
+			OFFSET_SENSOR_DATA_DEFAULT;
+		memcpy_fromio(&als_data, sensoraddr, sizeof(struct sfh_als_data));
+		*ambient_light = amd_sfh_float_to_int(als_data.lux);
+
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
 int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op)
 {
 	if (sfh_info) {
 		switch (op) {
 		case MT_HPD:
 			return amd_sfh_hpd_info(&sfh_info->user_present);
+		case MT_ALS:
+			return amd_sfh_als_info(&sfh_info->ambient_light);
 		}
 	}
 	return -EINVAL;
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 8bdfb395f316..934afe346f7e 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -50,6 +50,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 			"Connected" : "disconnected/unknown");
 	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
 	dev_dbg(dev->dev, "User Presence : %s\n", in->ev_info.user_present ? "Present" : "Away");
+	dev_dbg(dev->dev, "Ambient Light : %d\n", in->ev_info.ambient_light);
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
 #else
@@ -162,8 +163,14 @@ static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
 static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
 	struct amd_sfh_info sfh_info;
+	int ret;
 
-	/* get HPD data */
+	/* Get ALS data */
+	ret = amd_get_sfh_info(&sfh_info, MT_ALS);
+	if (!ret)
+		in->ev_info.ambient_light = sfh_info.ambient_light;
+
+	/* Get HPD data */
 	amd_get_sfh_info(&sfh_info, MT_HPD);
 	switch (sfh_info.user_present) {
 	case SFH_NOT_DETECTED:
diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
index 76e42552b62c..912d341d5fbe 100644
--- a/include/linux/amd-pmf-io.h
+++ b/include/linux/amd-pmf-io.h
@@ -37,6 +37,7 @@ void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf);
 /* amd-sfh */
 enum sfh_message_type {
 	MT_HPD,
+	MT_ALS,
 };
 
 enum hpd_info {
@@ -46,6 +47,7 @@ enum hpd_info {
 };
 
 struct amd_sfh_info {
+	u32 ambient_light;
 	u8 user_present;
 };
 
-- 
2.25.1

