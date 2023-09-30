Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BB57B3F76
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 10:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7787510E1E7;
	Sat, 30 Sep 2023 08:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89F710E1E4;
 Sat, 30 Sep 2023 08:39:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TsaLQPwKz+ZDQ0YEqQQgFKl78lDGWdaDvvZD5KZvov6Zt5bH1WzHz7JFVr5qd+r7J/4FUSd43hGVbE3ipcicaDmb6omteyD8QmRn2CVHfcCcTL2VJMwEt2dJ2iTsQIq5CmoWhvPzsBKHhaELIaiSBTzZWMjhMybHhIea/NHOUzqth5mrQm+G/iq7msnDbSuF5EKTlIAvBuh4GwJFrD13T2m73EnxGLzjfm4NYPIFW5pxvUW/WfowRc+FVKXI5q4TZGAaIx/lMSDMQx37fODNulSheJxsOnbZ+V+TM6oLwX00Lj5tx+Tx42G3F4YLN25oO3ves0bXjvE20R0ITUiwXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+jTmfNoVkIqiYQ+hCrelFeX2PgBxIli578HUrRTH+8=;
 b=SLBdkLeazAE2e/1glipB05fKpQZelSCHN8N5t127dkn4ZPqaRyFnnX0OdXKPqghMKBqdYqB31Co0AeeXvI+H13Yo7MLte4NW07kz9/GjBXG81yodPN+DA1ympzkF+2hJGKuHcafxwFkwiEta1qFPpYIsBnmew4ZJsZyvJPIFKsqzFUg/svhcwQyHithohXztWOFp9/01P5MgkU8STWuf0BMUbRin2JlZ189NlXNCdCgqcDK0coyKxm4LSrqaFWpoXAkA8C2OPSAww6HcKC+MK0wzUn9Yz15Ff77NEcYlLEFhXkZrhn8gY/3T3Cnys54BobiQvfbWz/iZnAV2BHJQxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+jTmfNoVkIqiYQ+hCrelFeX2PgBxIli578HUrRTH+8=;
 b=bkbqEk1dWF5aPb6TJH/HAFuCsteVBj7w5xyEUWfnnQ5TNoPi+COUl1U/ACHPXgtfYa42hv+qaOi8kMUn9dPoczWx0v8K3cnEcCM8PFrPS1K4tT6Z85i4ft87x+nmoybNJvYSl+Uc7DguNme1VEWe5EwwFsK3kp8y1AJpyRO0Pk0=
Received: from MN2PR14CA0002.namprd14.prod.outlook.com (2603:10b6:208:23e::7)
 by SJ1PR12MB6172.namprd12.prod.outlook.com (2603:10b6:a03:459::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Sat, 30 Sep
 2023 08:39:35 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::80) by MN2PR14CA0002.outlook.office365.com
 (2603:10b6:208:23e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28 via Frontend
 Transport; Sat, 30 Sep 2023 08:39:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sat, 30 Sep 2023 08:39:34 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 30 Sep
 2023 03:39:28 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v2 14/16] HID: amd_sfh: rename float_to_int() to
 amd_sfh_float_to_int()
Date: Sat, 30 Sep 2023 14:07:13 +0530
Message-ID: <20230930083715.2050863-15-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|SJ1PR12MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: bbfc5cf2-bccb-43df-dd78-08dbc190c614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OGS7h8JuBVBTgC8JTNR24UQNYHL3YXwkppWnJFcHVpakSG+tjLMqXijUzTeyvXIx1+TVpwL/ZA9ng0xrQL0M0w6IQ+s2QFhCj3qoXRb7XhNMjc43nAe5eqXBj5WyWiXAo98NTJvaL8kcN44qA0xGvI44yZntoEvGa4MeMu4877gtAVneG0iEihYn9XemDxZ9G0u1m9WNxaCNOJR9PxM3A6q3YxAVzTAO/41CppZSruPAFS8+OgB6yidHT1zxnngfHIWui85ITe6hv6sLfBrVIHjljXFqpxG/VZl5oDptqf99ny9NkN0HIfYus35tKf5pxXMFrlcYDT3Jbf6QbtHGWr/NGo/7AXlrh2ixdUNxYozUzAaeJhoecKPJ1O5mxxMUoMZQRAjur5WFew1DSeDo1nPTrx7hxn8bN4+guzRS1DUs/k9unBk1Gexxu5AIwFDD1Q3T3XdrcsK3U+UO1iIbc/Ll6uihZv3xsNkVMAZCLFwYLoUhDILYAV2WEZkVOU559YTPMuHFgYNZbgcCtxbvNpEERR9bnfLLg+clohWBndYAWMbwVYoU2UlHzSBPAGA3iFlbXNt9pQNeXtgd/rE8cz998BsodLd5is5AaIuieLdQPLXMD11OU5+wuwd2w8UyntBdongKhD6/vx0nvjGS0hia+FsBMqjGFvv61INVtPWj3er2QNCx7hO7i4QDw+MVuUEdXltA/JG0xQVSU8WmfWIo9rHFN5zFFHlUM1DRf7Wet055YdqSssM78zApUMl8SIbWfq9AYMTKm92EeFtByv5pj8FreYoEpyISNj8xQxc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(230922051799003)(186009)(1800799009)(451199024)(82310400011)(64100799003)(40470700004)(46966006)(36840700001)(40480700001)(40460700003)(47076005)(83380400001)(336012)(426003)(1076003)(26005)(16526019)(82740400003)(356005)(921005)(81166007)(36860700001)(8936002)(8676002)(4326008)(478600001)(70206006)(54906003)(70586007)(110136005)(316002)(41300700001)(7416002)(2616005)(2906002)(5660300002)(7696005)(6666004)(36756003)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 08:39:34.5295 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfc5cf2-bccb-43df-dd78-08dbc190c614
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6172
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

Current amd_sfh driver has float_to_int() to convert units from
float to int. This is fine until this function gets called outside of
the current scope of file.

Add a prefix "amd_sfh" to float_to_int() so that function represents
the driver name. This function will be called by multiple callers in the
next patch.

Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
index 06bdcf072d10..47a87b28e00e 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
@@ -132,7 +132,7 @@ static void get_common_inputs(struct common_input_property *common, int report_i
 	common->event_type = HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM;
 }
 
-static int float_to_int(u32 flt32_val)
+static int amd_sfh_float_to_int(u32 flt32_val)
 {
 	int fraction, shift, mantissa, sign, exp, zeropre;
 
@@ -200,9 +200,9 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
 			     OFFSET_SENSOR_DATA_DEFAULT;
 		memcpy_fromio(&accel_data, sensoraddr, sizeof(struct sfh_accel_data));
 		get_common_inputs(&acc_input.common_property, report_id);
-		acc_input.in_accel_x_value = float_to_int(accel_data.acceldata.x) / 100;
-		acc_input.in_accel_y_value = float_to_int(accel_data.acceldata.y) / 100;
-		acc_input.in_accel_z_value = float_to_int(accel_data.acceldata.z) / 100;
+		acc_input.in_accel_x_value = amd_sfh_float_to_int(accel_data.acceldata.x) / 100;
+		acc_input.in_accel_y_value = amd_sfh_float_to_int(accel_data.acceldata.y) / 100;
+		acc_input.in_accel_z_value = amd_sfh_float_to_int(accel_data.acceldata.z) / 100;
 		memcpy(input_report, &acc_input, sizeof(acc_input));
 		report_size = sizeof(acc_input);
 		break;
@@ -211,9 +211,9 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
 			     OFFSET_SENSOR_DATA_DEFAULT;
 		memcpy_fromio(&gyro_data, sensoraddr, sizeof(struct sfh_gyro_data));
 		get_common_inputs(&gyro_input.common_property, report_id);
-		gyro_input.in_angel_x_value = float_to_int(gyro_data.gyrodata.x) / 1000;
-		gyro_input.in_angel_y_value = float_to_int(gyro_data.gyrodata.y) / 1000;
-		gyro_input.in_angel_z_value = float_to_int(gyro_data.gyrodata.z) / 1000;
+		gyro_input.in_angel_x_value = amd_sfh_float_to_int(gyro_data.gyrodata.x) / 1000;
+		gyro_input.in_angel_y_value = amd_sfh_float_to_int(gyro_data.gyrodata.y) / 1000;
+		gyro_input.in_angel_z_value = amd_sfh_float_to_int(gyro_data.gyrodata.z) / 1000;
 		memcpy(input_report, &gyro_input, sizeof(gyro_input));
 		report_size = sizeof(gyro_input);
 		break;
@@ -222,9 +222,9 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
 			     OFFSET_SENSOR_DATA_DEFAULT;
 		memcpy_fromio(&mag_data, sensoraddr, sizeof(struct sfh_mag_data));
 		get_common_inputs(&magno_input.common_property, report_id);
-		magno_input.in_magno_x = float_to_int(mag_data.magdata.x) / 100;
-		magno_input.in_magno_y = float_to_int(mag_data.magdata.y) / 100;
-		magno_input.in_magno_z = float_to_int(mag_data.magdata.z) / 100;
+		magno_input.in_magno_x = amd_sfh_float_to_int(mag_data.magdata.x) / 100;
+		magno_input.in_magno_y = amd_sfh_float_to_int(mag_data.magdata.y) / 100;
+		magno_input.in_magno_z = amd_sfh_float_to_int(mag_data.magdata.z) / 100;
 		magno_input.in_magno_accuracy = mag_data.accuracy / 100;
 		memcpy(input_report, &magno_input, sizeof(magno_input));
 		report_size = sizeof(magno_input);
@@ -234,7 +234,7 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
 			     OFFSET_SENSOR_DATA_DEFAULT;
 		memcpy_fromio(&als_data, sensoraddr, sizeof(struct sfh_als_data));
 		get_common_inputs(&als_input.common_property, report_id);
-		als_input.illuminance_value = float_to_int(als_data.lux);
+		als_input.illuminance_value = amd_sfh_float_to_int(als_data.lux);
 		report_size = sizeof(als_input);
 		memcpy(input_report, &als_input, sizeof(als_input));
 		break;
-- 
2.25.1

