Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A477AB86E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAF910E6F0;
	Fri, 22 Sep 2023 17:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E24A10E6EE;
 Fri, 22 Sep 2023 17:53:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaDHyqEV20DprEr8lgePLr7vFybaGYl7a29PoayJG8HjgDjrprG/Gb8b3Z7qGgeFOEe/R8xAgDOUxpLQrpjWDknptCTkKLAkrE99FCvkEI1eYuHnNfEvPS71/UIc92NfMOgX1R0lJ1sTcQBLapp7oIPjZ3Zj1dmWgBkKerK/vSeUkmAdpTaR/aOCQi/+utINz6gRfxbd5X0uhxbKaeAes5tEJdrWoz15Ma87yTla6I0rBJnPfdUpJ2tEcj9S+xd2RbMDP2babKmNWOQlChO/NQRaFDqaO6z95gLJtCUy7rYWNuXxULHEdl43nPqUQMTzWSYeTWMEG7qMyOvQoKvCag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIeZlv50GF+A0GlcUULwxGe4T92+O4Eo3KJvtr+bF08=;
 b=Ij487NBY0cylA3Yh96IrLdvCXoMQtziorFk9mXdmrHiXUiAPC4+FIrP1rL9xIx4+gLVWFwnz/8gZC33rIuzcyVaj+t19/+Ss9RlB6ZYrI0YHrNbQOe66XUavzt7KIN5xpkoP5rHRT6zfvFzB+4p19rDO9TPJMRaquO25r2ut5AN/GjUehaWUP6Y7aMCv5a8wcFV8kk5wqhzikhKDhl/UAms1COkNsG0kFJxfKB6JQeitN/2rzv1JgVfge7xrbi3Tfi03TtbVia8J1CiELxa05TOnIEm+7BRvRUUBNbeFcr43NSivCfKeL4HY7/iSdKRxnL4RXmQ5sGM/uWU+t+iHvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIeZlv50GF+A0GlcUULwxGe4T92+O4Eo3KJvtr+bF08=;
 b=SCsyhuESq2Y1XfQ2dSJ3YdVQ2K4pW9/dZ7C1MFiaNgOHm6ozQi5xxcqUU5ihKVlnbisHhvJsyptm6chLfjTUikaE9kUEnGblsB2tD7SYqL38nYjZVlepxtY1oBks5HGKw7VwSbjG00jHOSjzrpX6JEvrQItc9x5rHFRss7iijhI=
Received: from MN2PR18CA0013.namprd18.prod.outlook.com (2603:10b6:208:23c::18)
 by CY5PR12MB9055.namprd12.prod.outlook.com (2603:10b6:930:35::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 22 Sep
 2023 17:53:07 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:23c:cafe::d2) by MN2PR18CA0013.outlook.office365.com
 (2603:10b6:208:23c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.34 via Frontend
 Transport; Fri, 22 Sep 2023 17:53:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Fri, 22 Sep 2023 17:53:07 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 12:53:02 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <basavaraj.natikar@amd.com>, <jikos@kernel.org>,
 <benjamin.tissoires@redhat.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH 14/15] platform/x86/amd/pmf: Add PMF-AMDSFH interface for HPD
Date: Fri, 22 Sep 2023 23:20:55 +0530
Message-ID: <20230922175056.244940-15-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|CY5PR12MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c775c9-6b33-4ff9-4e93-08dbbb94c74e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JYTVMfHELFUJXEXSDmmCPETVYdKgDJrHo+r+8e1I4Pk3ieHRmL2zz5U5qo4XthC65jF6sbBRlB86feiFDRePjP4IBwGOcCTldjI9040Sb+fVzd7B1La6yyCcCIkGgNvgaiDrV/6qCGYUTHTW/41TFXabHmk4dyehUxcPFvMHB2FoEUVnMsUks0S6mqbv7VYMZl862qbIMIlNserDcvpFjK62RP1tOIg2QiHEeg+gA53U1dLKnHcpkAncHv5xVo+fmfU2KIqqPGlX4md6h4QbhzMtndl/lofqhQJrDq0M4sf2BJTUuRi+DcV8/27fuca++0SEaowGy3M9cToLwKDe8mkdOXM0t1OFC6+geivWVBEhSow4+Yc8xek7/nd4q6zLYCR/x7zk1rbE7mztl8JGwt4/IfyUBIsYaNsZMY3aAPTmJF8pSIQ2nnybYiXs0529tty7QJsniDVyXE9i2XN659bvUQYP6USsqRo+0K64uAUs+jMDMGrq1AWLY0+AJScA/wLTWCjQhbgDUsygp1Ra+GXj+LpTv+gZQwKfIZ9bp2dGSof5ylEb9DvE29+wWvqAsxD6Vg+0wd7J+bjro681VFzrQp+wBFKg7k6xSxhnqDkqr1UJANKbFNY3IWsSa9xg2EOU7rWKRXWhqIHklnO4o34SJIcg2qnAez9O8kIkdO4UvFX9gePuTa3BX0ziGCctogFb8sPh9tRU+5XdudVJOFXIvV8rkKY5Eizj0I0omUXDQhKc/T8AdKASxMj0rQ1cR0O/OgYXa4sQNHyYQ8F7gZ+Xxnd+PHWB9qUih3QvnyT0HPH1G42uptaekl4BoGR9BD0xL8DPflH3Utd5F0YJsA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199024)(186009)(230921699003)(82310400011)(1800799009)(36840700001)(46966006)(40470700004)(86362001)(2906002)(5660300002)(40480700001)(26005)(70586007)(1076003)(16526019)(41300700001)(70206006)(316002)(110136005)(7416002)(54906003)(336012)(8936002)(8676002)(426003)(4326008)(478600001)(6666004)(7696005)(40460700003)(36860700001)(47076005)(36756003)(2616005)(81166007)(921005)(83380400001)(356005)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:53:07.5940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c775c9-6b33-4ff9-4e93-08dbbb94c74e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9055
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
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c |  2 +-
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 11 ++++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 28 +++++++++++++++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |  1 +
 drivers/platform/x86/amd/pmf/spc.c            | 21 ++++++++++++++
 include/linux/amd-pmf-io.h                    | 22 ++++++++++++++-
 7 files changed, 88 insertions(+), 2 deletions(-)

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
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
index 06bdcf072d10..d7467c41ad3b 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
@@ -132,7 +132,7 @@ static void get_common_inputs(struct common_input_property *common, int report_i
 	common->event_type = HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM;
 }
 
-static int float_to_int(u32 flt32_val)
+int float_to_int(u32 flt32_val)
 {
 	int fraction, shift, mantissa, sign, exp, zeropre;
 
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index e9c6413af24a..9c623456ee12 100644
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
+			privdata->dev_en.is_hpd_present = true;
+				break;
+			}
 		}
 		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
 			cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
index 4f81ef2d4f56..63a5bbca5a09 100644
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
+	return  -ENODEV;
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
+	return -1;
 }
+EXPORT_SYMBOL_GPL(amd_get_sfh_info);
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
index 9d31d5b510eb..8a36386e6bce 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
@@ -149,6 +149,7 @@ struct hpd_status {
 	};
 };
 
+int float_to_int(u32 flt32_val);
 void sfh_interface_init(struct amd_mp2_dev *mp2);
 void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops);
 #endif
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 5f3ab1ce09d2..97293ae25cf5 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -48,6 +48,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "Primary Display State : %s\n", in->ev_info.display_state ?
 			"Connected" : "disconnected/unknown");
 	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
+	dev_dbg(dev->dev, "User Presence : %s\n", in->ev_info.user_present ? "Present" : "Away");
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
 #else
@@ -156,6 +157,25 @@ static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
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
@@ -165,4 +185,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
 	amd_pmf_get_battery_info(dev, in);
 	amd_pmf_get_slider_info(dev, in);
 	amd_pmf_get_gpu_info(dev, in);
+	amd_pmf_get_sensor_info(dev, in);
 }
diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
index ecae387ddaa6..4f82973f6ad2 100644
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
@@ -26,4 +27,23 @@ struct amd_gpu_pmf_data {
 
 int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
 int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
+
+/* amd-sfh */
+enum sfh_message_type {
+	MT_HPD,
+};
+
+enum hpd_info {
+	SFH_NOT_DETECTED,
+	SFH_USER_PRESENT,
+	SFH_USER_AWAY
+};
+
+struct amd_sfh_info {
+	u8 user_present;
+	/* add future caps below */
+};
+
+int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
+
 #endif
-- 
2.25.1

