Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9DE7BFC84
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BFF10E360;
	Tue, 10 Oct 2023 13:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F5B10E35B;
 Tue, 10 Oct 2023 13:01:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYf635nqOZjPLQBIPzgbCDMOF57wEna7yBSusS3sCusfAQtwAeUM7t56JNTFURxwfVt6Q/03StrKjJSh3CoN0wxbo3YVmWjxwnQa5ZxfS9Y25vT5WZtGbQR4wZLhti8Bt+0F8/+d7COFD35c47bZ3fR2P904sVk608rzADExr6DLWhx7tf9IDZo9LQeoTZ9HOQtvuHPm58qS2LCoYUnRcdcqkXIrJVJW/sccIdH9jCrFH10vSbdi5W+UODaPDcb2Ga5xZBvtiXCEXxTk/C9NRVBR70ospmnZaJCmytPrfaFdkmIea5XNIsVBr32inMJs8H6zaD4+mkH2WXfreJ2uww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8hui7bUXASJOKoQNXfPeDEGLHoa3t/+/t+7KD5NuwM=;
 b=K9ZG5Ksk+XeVq0jM2Cqy1gmtuuGWBWLmzS+QiXjt4mFZ2Es5OJRCaSA4P0jGHAnzv5Ifp8qGymgHXaOHnweMZKUMb2LbzFficc/wcCObA7HuYh6h+lKRI/2w6uvQl9IRJ6jxX1fPg6vQ7PJPUrF0dZrzoNtm/qlIi/5TTmSTLaUTQ+9MdUPeSeuvyZVqCVNzD7Qxaeedm13vXwGKUj5Y1vNwbgUbPzynu36Rz7yAe0fI/bJwNJ2RuGr0Bl+APEd5v/bXFXke/+lBsVgZ2mUYl0o5OWMgoL+mQ6HOARRasxbgQ41Ks+4aWxjd4K4CPMQmAgND/bqikG+oXB/ceQ9GBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8hui7bUXASJOKoQNXfPeDEGLHoa3t/+/t+7KD5NuwM=;
 b=PrThtvnJQel/+6cGwCzvFCVBgHyrMX41UUJ62A+QPz4MEblN+jxyDraqr3Jl8tiPR51M3evZC1P7a/vDNbR1nM9AR6k4LOJbwEoMup+LPFxHVoP/da7sRhMwTLyO8I+j4NniTay9yV3tuf6mXsk6tLwNAxVIdBSrVA36jqneJNc=
Received: from CH2PR02CA0025.namprd02.prod.outlook.com (2603:10b6:610:4e::35)
 by CH0PR12MB5185.namprd12.prod.outlook.com (2603:10b6:610:b8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 13:01:29 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:4e:cafe::5e) by CH2PR02CA0025.outlook.office365.com
 (2603:10b6:610:4e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36 via Frontend
 Transport; Tue, 10 Oct 2023 13:01:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 13:01:29 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 08:01:23 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v3 15/16] platform/x86/amd/pmf: Add PMF-AMDSFH interface for
 HPD
Date: Tue, 10 Oct 2023 18:29:16 +0530
Message-ID: <20231010125917.138225-16-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
References: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|CH0PR12MB5185:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f2bdcc-7f2b-4e00-f227-08dbc99104de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zs1IkQj5dUUizwW2/UYDueAPF4Uxxi+9uJNiJBbHWxu6Z7pe1N4DG3jWhC3/O64+LYq83meIbgdc5F57HuZu33MjD6dP5kTbVCZHd9rx6CSmt7KiwNksbxjXAktpQBNZx0vagmvt0i6MdEXRI+YpKg5K6bBR4SfSIp4lPWHdwrakMN7LH6reqJzkjTxfZEjLFuP+Uzqh9cwkF9n7nYcAFUfBa+OOZQAFh2qwWJ7lm1ViH7G+0p4wciRbFNUn4u77m4cdy7Yi4iQH5dvI61oFoOGioYmTRcmird+UdRyuDTvbIKfspV77z4/S9PhlwjEuppmrYWuAlswXKZssc/iRtM3f0IOVvwhagdil4AFOsBtCBInkyWMQflXzbikCJPneZZ7CbQE5N9hiYpbLif+hZupCmagUKk+WGJzvf8YHARW4J5VbKVvIMNK6wOiDyhb+8+CHaNGL2m9nEE9tznY+Yz9Qej1YNuuZXY1q9N/qLCoUsaeJpA9tOatd2rGOXdmWaE60pprI+/d8yQ/hakd31eQnBnL5c8z0Aecn48DQLp7UYytnvEeIVp+WwN0RN192eDOGDBXq+Yim7BR/AxmeLZaxKS1L5WFguohgbOhQXAJiCRVszoHCNxm+ClluGHK1oQPIg7osDksi0n7AGuS4/JmWOPfl//yWuDLLgMv7DuX1KORERJwUGHeydl9rRdQtp+5hCROvjnjUW+Lt5coqjOtEtIzJgsMrds51WCtpynvkwUDljUqgy0y0RlyikkAiJVpJwNufF7McfftVzg12fAQ3mqA+htWxQY7vKKvQins=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(136003)(39860400002)(376002)(230922051799003)(1800799009)(186009)(64100799003)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(1076003)(40460700003)(36756003)(40480700001)(86362001)(82740400003)(356005)(921005)(81166007)(36860700001)(16526019)(336012)(426003)(47076005)(7416002)(2906002)(83380400001)(2616005)(6666004)(7696005)(478600001)(26005)(8676002)(4326008)(8936002)(41300700001)(70586007)(5660300002)(110136005)(70206006)(54906003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:01:29.0967 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f2bdcc-7f2b-4e00-f227-08dbc99104de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5185
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

AMDSFH has information about the User presence information via the Human
Presence Detection (HPD) sensor which is part of the AMD sensor fusion hub.
Add PMF and AMDSFH interface to get this information.

Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  5 ++++
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 11 ++++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 28 +++++++++++++++++++
 drivers/platform/x86/amd/pmf/Kconfig          |  1 +
 drivers/platform/x86/amd/pmf/spc.c            | 21 ++++++++++++++
 include/linux/amd-pmf-io.h                    | 20 ++++++++++++-
 6 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
index 2643bb14fee2..cd57037bf217 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -37,6 +37,10 @@ struct amd_mp2_sensor_info {
 	dma_addr_t dma_address;
 };
 
+struct sfh_dev_status {
+	bool is_hpd_present;
+};
+
 struct amd_mp2_dev {
 	struct pci_dev *pdev;
 	struct amdtp_cl_data *cl_data;
@@ -47,6 +51,7 @@ struct amd_mp2_dev {
 	struct amd_input_data in_data;
 	/* mp2 active control status */
 	u32 mp2_acs;
+	struct sfh_dev_status dev_en;
 };
 
 struct amd_mp2_ops {
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index e9c6413af24a..3dc652d41d7d 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -73,6 +73,12 @@ static int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
 	int i, status;
 
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
+		switch (cl_data->sensor_idx[i]) {
+		case HPD_IDX:
+			privdata->dev_en.is_hpd_present = false;
+			break;
+		}
+
 		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
 			privdata->mp2_ops->stop(privdata, cl_data->sensor_idx[i]);
 			status = amd_sfh_wait_for_response
@@ -178,6 +184,11 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 			rc = amdtp_hid_probe(i, cl_data);
 			if (rc)
 				goto cleanup;
+			switch (cl_data->sensor_idx[i]) {
+			case HPD_IDX:
+				privdata->dev_en.is_hpd_present = true;
+				break;
+			}
 		}
 		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
 			cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
index 4f81ef2d4f56..7637da0dec6f 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
@@ -7,11 +7,14 @@
  *
  * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  */
+#include <linux/amd-pmf-io.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/iopoll.h>
 
 #include "amd_sfh_interface.h"
 
+static struct amd_mp2_dev *emp2;
+
 static int amd_sfh_wait_response(struct amd_mp2_dev *mp2, u8 sid, u32 cmd_id)
 {
 	struct sfh_cmd_response cmd_resp;
@@ -76,4 +79,29 @@ static struct amd_mp2_ops amd_sfh_ops = {
 void sfh_interface_init(struct amd_mp2_dev *mp2)
 {
 	mp2->mp2_ops = &amd_sfh_ops;
+	emp2 = mp2;
+}
+
+static int amd_sfh_hpd_info(u8 *user_present)
+{
+	if (emp2 && emp2->dev_en.is_hpd_present) {
+		struct hpd_status hpdstatus;
+
+		hpdstatus.val = readl(emp2->mmio + AMD_C2P_MSG(4));
+		*user_present = hpdstatus.shpd.presence;
+		return 0;
+	}
+	return -ENODEV;
+}
+
+int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op)
+{
+	if (sfh_info) {
+		switch (op) {
+		case MT_HPD:
+			return amd_sfh_hpd_info(&sfh_info->user_present);
+		}
+	}
+	return -EINVAL;
 }
+EXPORT_SYMBOL_GPL(amd_get_sfh_info);
diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index 7f430de7af44..d368d35a49ac 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -11,6 +11,7 @@ config AMD_PMF
 	select ACPI_PLATFORM_PROFILE
 	depends on TEE && AMDTEE
 	depends on DRM_AMDGPU
+	depends on AMD_SFH_HID
 	help
 	  This driver provides support for the AMD Platform Management Framework.
 	  The goal is to enhance end user experience by making AMD PCs smarter,
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 58b51e11e424..e33bbf8a3de4 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -49,6 +49,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "Primary Display State : %s\n", in->ev_info.display_state ?
 			"Connected" : "disconnected/unknown");
 	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
+	dev_dbg(dev->dev, "User Presence : %s\n", in->ev_info.user_present ? "Present" : "Away");
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
 #else
@@ -157,6 +158,25 @@ static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
 	in->ev_info.display_state = dev->gfx_data.con_status[0];
 }
 
+static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	struct amd_sfh_info sfh_info;
+
+	/* get HPD data */
+	amd_get_sfh_info(&sfh_info, MT_HPD);
+	switch (sfh_info.user_present) {
+	case SFH_NOT_DETECTED:
+		in->ev_info.user_present = 0xff; /* assume no sensors connected */
+		break;
+	case SFH_USER_PRESENT:
+		in->ev_info.user_present = 1;
+		break;
+	case SFH_USER_AWAY:
+		in->ev_info.user_present = 0;
+		break;
+	}
+}
+
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
 	/* TA side lid open is 1 and close is 0, hence the ! here */
@@ -166,4 +186,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
 	amd_pmf_get_battery_info(dev, in);
 	amd_pmf_get_slider_info(dev, in);
 	amd_pmf_get_gpu_info(dev, in);
+	amd_pmf_get_sensor_info(dev, in);
 }
diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
index 5f79e66a41b3..76e42552b62c 100644
--- a/include/linux/amd-pmf-io.h
+++ b/include/linux/amd-pmf-io.h
@@ -5,7 +5,8 @@
  * Copyright (c) 2023, Advanced Micro Devices, Inc.
  * All Rights Reserved.
  *
- * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *          Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  */
 
 #ifndef AMD_PMF_IO_H
@@ -32,4 +33,21 @@ struct amd_gpu_pmf_data {
 int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
 int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf);
 void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf);
+
+/* amd-sfh */
+enum sfh_message_type {
+	MT_HPD,
+};
+
+enum hpd_info {
+	SFH_NOT_DETECTED,
+	SFH_USER_PRESENT,
+	SFH_USER_AWAY,
+};
+
+struct amd_sfh_info {
+	u8 user_present;
+};
+
+int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
 #endif
-- 
2.25.1

