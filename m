Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E947B3F77
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 10:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DEB10E1EB;
	Sat, 30 Sep 2023 08:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F7B10E1E5;
 Sat, 30 Sep 2023 08:39:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFsrn/Dyj21E0Sxtbx3h2JURiYU+q2F8lAtXfRvGRJYJajdgbKOUOt1UgdwWOc27qngDwB8UsYhGDpQtbUWEzHHFqpLhf7+qhjnGIUaeGYnYkGzvl+fUhlFjq7uSTuUtWQuQIH336toiy5EZUyOQ4YI5SUGcbrqClPjJO6p1gGAlEwEQTDv1dlx+5iBU8BuZsv+iFxXeZHvNkhH64fgfYf+G72d2qslqyVj/NYeJzrqMOBwvphFyCFzDnbLPynz1wvqNiN4GyWzoFjZz6Sck5C7iUVTOxAiopV6G5EbuG3y8NDtb/LrGwaDOkTb0FIJLobc/xzgkCqckGDPe418yMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNprEuylK+kJWqN3PvwrP8ULOynKqZnssj0Jaa2vYT8=;
 b=PC1v1aXyXJ+SndalrqCM6iSpnV5n50I2FZb1yhyNimx3fFmBRtk719MRfmvgA055kbjIv/HvkBWElxbj7LWZRmw/+5SGhaPIXropeV/y1yvNeD6Dt4rZWQbPGJc+IDMBFpS5A+/U3VEKewknX5cwtFiibygQEZ9Wtjrmc2isepxLm7rDSOYC6ir4mX4huI30fAL+mUmiLA3HQwKeMg482vE90JCTgJEwS7xuE7gKLdpdMLhl8WaeYhS75L6SGXJAeEotZbSZJE/VcihRs89VbFdtf+9Z3OGOhbkwSV3X3ana0LXa38gaJhIJHJiUtbhw9PP8+ulpVvYaxLUEN0Pbnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNprEuylK+kJWqN3PvwrP8ULOynKqZnssj0Jaa2vYT8=;
 b=DBawKAFs9bpo+cjzbPXdtvV4Qjjsr0jqnF9ErhuzKUNGruxVW4mmF+gvWU2+pv5w/irBTK7WAeFfkO+Nsvfx2zCMy/tfLgpc3udyjiBOfLaZJi2PpnUSI9Nw6QaKi5SCBvWmnWKTe8NKhOx9IfVcpeik881SglYibUBAwg6IqM8=
Received: from BL1PR13CA0076.namprd13.prod.outlook.com (2603:10b6:208:2b8::21)
 by CY8PR12MB8066.namprd12.prod.outlook.com (2603:10b6:930:70::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Sat, 30 Sep
 2023 08:39:44 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::14) by BL1PR13CA0076.outlook.office365.com
 (2603:10b6:208:2b8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.15 via Frontend
 Transport; Sat, 30 Sep 2023 08:39:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sat, 30 Sep 2023 08:39:43 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 30 Sep
 2023 03:39:38 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v2 16/16] platform/x86/amd/pmf: Add PMF-AMDSFH interface for
 ALS
Date: Sat, 30 Sep 2023 14:07:15 +0530
Message-ID: <20230930083715.2050863-17-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|CY8PR12MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ff1fae5-19e1-444d-dc99-08dbc190cbb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a/WzSxl1w1TVHv3zM8Y7m91Ec3+P/iCvhxoiBYJc3/ont4fbV+Z4idXKjZb8jTVewdg/Bv2itG7aX3h6IcVDNQbkIXlrMm7lZP6xWGqD/uE5NsAHQRzY/Ka5nr3M6hOD9T/W7sDo2fGhM06CRmIWV57hJegwz+R0x46HLaZW6OJzPLap9WlGVWBrDIbvzQLKndkvGlj5+DfVInX9YvZTHSedIxU2RJNuT7eyag2hLkRqUlk7h1TRCrYGp0IbDMGYfmHgaA4657z4c9clKv443sr1F8T0zC7tLpDeq8/Y+uziuRtrFRVoANIMCaCsbRuIWMsCkIAd5xEe2ezL23PgvAG8C9DEHxZn9MOJaqsXSWEEaZswkVtdLFDRIE4v1m5NtU2LPqDRjIg1fui+TKH7Xkf3ndwYnFycQDWfBnx1mqw2bjXpfqSkZUixHvskSvlrvnwqZKtck4rsf9Wt+2s7IiAGDtCMhMzLeSM20hXwiLjn4F5AJD0aV/TJUK22zMYG9BZOHsOJSBPZAz/D4XWN+jISh0joVnio1TSOpLozWDPFRvMwWJ1ASRHiPHx5kGnZBrpcOFrkLt4WMG2kXwgcOXDkVjo3QNT9xa3m+woxl4fXiDHPazruqbsCxFrxvDMms8KI1t1WEEE1nlaEpT6tBtNxKzcx4NnDlY4jH05Ka89CCu/4ZxkOzFURvOVEaMr0jMYX8LxPZdndRU6I4gfrB+cU30iw+ugGSoXNe6mwPX20vFXT4BpEuFsnHbZKcL3pCCdtkM1kPCyMPcjZa7enGd5pFE9bYTg/Zp1xwNubyHo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(39860400002)(376002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(82310400011)(40470700004)(46966006)(36840700001)(47076005)(2906002)(40460700003)(7416002)(356005)(82740400003)(40480700001)(86362001)(81166007)(36756003)(5660300002)(921005)(4326008)(70206006)(36860700001)(83380400001)(426003)(316002)(26005)(41300700001)(1076003)(54906003)(8936002)(8676002)(2616005)(6666004)(7696005)(478600001)(70586007)(336012)(110136005)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 08:39:43.9733 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ff1fae5-19e1-444d-dc99-08dbc190cbb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8066
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

make amd_sfh_float_to_int() as non-static function so that this can
be called outside of the current file.

Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c |  2 +-
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  6 ++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 20 +++++++++++++++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |  1 +
 drivers/platform/x86/amd/pmf/spc.c            |  7 +++++++
 include/linux/amd-pmf-io.h                    |  2 ++
 7 files changed, 38 insertions(+), 1 deletion(-)

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
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
index 47a87b28e00e..dbc8c6943ca1 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
@@ -132,7 +132,7 @@ static void get_common_inputs(struct common_input_property *common, int report_i
 	common->event_type = HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM;
 }
 
-static int amd_sfh_float_to_int(u32 flt32_val)
+int amd_sfh_float_to_int(u32 flt32_val)
 {
 	int fraction, shift, mantissa, sign, exp, zeropre;
 
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
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
index 9d31d5b510eb..7ecddad430e4 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
@@ -149,6 +149,7 @@ struct hpd_status {
 	};
 };
 
+int amd_sfh_float_to_int(u32 flt32_val);
 void sfh_interface_init(struct amd_mp2_dev *mp2);
 void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops);
 #endif
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 4fd1953167ed..10c35291e7ae 100644
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
@@ -161,6 +162,12 @@ static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
 static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
 	struct amd_sfh_info sfh_info;
+	int ret;
+
+	/* get ALS data */
+	ret = amd_get_sfh_info(&sfh_info, MT_ALS);
+	if (!ret)
+		in->ev_info.ambient_light = sfh_info.ambient_light;
 
 	/* get HPD data */
 	amd_get_sfh_info(&sfh_info, MT_HPD);
diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
index 43e5a88d2cad..a2990c0d72f6 100644
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

