Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D097BFC8F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11D910E354;
	Tue, 10 Oct 2023 13:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B9210E354;
 Tue, 10 Oct 2023 13:01:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFdES5gOPmcaklwGzHKp6Bt0IzzC1p+AU3wxZD2xVqrGQ6NQgOyqUVMauNJArzRhJLBaSDNUIB4yjis3f7fMummPIrcZnE7KarYMGGeCXcs22bgxrcspifgT/ou0aSZwErTBEZ/XcnqPpbeCz9YJpJZKieEJ6OL2AoJvu+5o9H+dxVGxHDEtYrbzXaQzGIi1QIjjxHAY969LZafqwGcz9iolTH1bdw6MLGZ1XNzDs97fqLpcWvoHA0cbdzmiZqsH/qFQ0RxmPd9MfGoTSAgQKlR4zWHToMl8NQEAn67rFIF6aNaugVZxgnDvNPl0C/m+eSq4UmgmIJ8XnSdHNsuINw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3q3GFxVTrbHkFPfvXgFrfxEImyloTWV0tmUR0eY9+qM=;
 b=clygLznPF+RTk4dez+rHL1TMhEHzlkg8ezDOmJgTdjE42QSpyCU0eOc+koob/+40uJnKFi1crR6sVdxRoia2MbEN+nZogYi200777SVLSns9AB8FK66COdxj+uPTjkiGJsZ348qu5oiNtfsnF1cTezEfhzztu4+yptyEm7llbIk7jRRjEBC2tPut5lm9oCncncTde0EsagwZEFprgGC9Nt7QYZvRgnP22TcIFXD/I6Ia+7TCRo81RYwNh8cEe+Txw6LscqlKkwAK9r/3TzEemk/7qqm4X3C54WqZlFqqV4hS/C3zLEJYxTcwO6X7UG7PD8mvVazoizZkVmEWsRsfog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3q3GFxVTrbHkFPfvXgFrfxEImyloTWV0tmUR0eY9+qM=;
 b=NSrwsoJCNCtkzslzLJo0SuGGmWUrbD/QE4lLFGO1xsUYeo6smcfcZySAbINsW4hk1fyHE5Vs9w7vbxq8mZP+GBFlAI135bIN+3E9hS9JnsOoCOAwfhYNFPLerfu21ArFHQ+oYXZ8xU3kPwSOim3GyXrmFsnuP2n6d4ppLrhzVvo=
Received: from CH2PR02CA0005.namprd02.prod.outlook.com (2603:10b6:610:4e::15)
 by DS0PR12MB7510.namprd12.prod.outlook.com (2603:10b6:8:132::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 13:01:35 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:4e:cafe::9e) by CH2PR02CA0005.outlook.office365.com
 (2603:10b6:610:4e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36 via Frontend
 Transport; Tue, 10 Oct 2023 13:01:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 13:01:35 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 08:01:29 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v3 16/16] platform/x86/amd/pmf: Add PMF-AMDSFH interface for
 ALS
Date: Tue, 10 Oct 2023 18:29:17 +0530
Message-ID: <20231010125917.138225-17-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|DS0PR12MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a2f637e-7714-487b-dba2-08dbc9910893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sQI+FVnqQpSMHI1JT1Z5CNP2X5jfaPeKKp+WvmEiD/q1o3xgXtX4KahIQksakHTjYgGOQAsb50uYh7Wg4shS9NXTqR+r1SJGNrVblNXAllV1B7PdwfZek03lP6Po0AsFDSXPv4g/0tq49vHrQzf1ZqMD6Ru62YwfxqIKJb/6KCtA0/uv73L4s3UqbcnV1k6zfue8ewdX84pI3s/A2cJ0Z2s5TAGpRM0pPbJ1rGYgs8VSvh44WVwVXz9t5jbltKW8mUY57zGyqgkTiYD7emf+MWhrSqdwk6VIcwlpsW7aiZhgeN5dZ/rSxkkT8dYzZITOnhsRCiqdILZtMS/kQHqTzZVzndZ+sUATT3tYo7Mdp9Bg+VOXqWTedOP92j5c3UrrkQzZSpNM3Xr6QbdWZAaMiEjZyMTAtB6WFi7LJFoJE3iafU0In6Qfj1Za5anb/MlDklWorkv2+Q8ZmiLmkeYqKoAd+Hwx0eXe4ktMQPm1G2QzsGWYKeJ8OZ9vawrjak97/xxFQk8W8yEwEGeGBAPRYF4h9XbWHLDNp4i5PZpLa9Y/qgkqLefSZvIm/c6WhNdyXPwJs1FeSrYWD9/CsQ6xD1+pjC2e+Z5KYNOAjwDlPeX/w4t538hp84LxqVAobpeVBOFGGvcbt5B0UAQurW+NFdxOTduW8E70trki6TQEfLj+8tC4e9POXOCznSxk+acMMAHWSIULGm70mtPfZALBDRlmJ3jDcZeyFIGZ9pHcQgtkZ3U0iJSgz3gXw9dx7t7YNx4SoiZ0ZYs/LQ4SnZqAe5Pb2n0uro7omvbJmPxvMQA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799009)(46966006)(36840700001)(40470700004)(921005)(81166007)(86362001)(356005)(36756003)(8936002)(40480700001)(6666004)(2906002)(478600001)(82740400003)(7696005)(4326008)(8676002)(5660300002)(41300700001)(1076003)(336012)(83380400001)(2616005)(426003)(40460700003)(47076005)(7416002)(316002)(54906003)(70206006)(110136005)(70586007)(16526019)(26005)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:01:35.3624 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2f637e-7714-487b-dba2-08dbc9910893
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7510
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
index e33bbf8a3de4..b6cf6d7e6ef5 100644
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

