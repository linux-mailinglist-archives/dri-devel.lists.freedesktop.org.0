Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF287CD52A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 09:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B621310E3A8;
	Wed, 18 Oct 2023 07:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38F110E3AA;
 Wed, 18 Oct 2023 07:06:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMx3UUV9+IIC1sf1Bb8D4BBDOx3Ky255+awhBN1Ijv8Y3EXHmMobBa/+GleDaq7NiBEBi+ZF6BHM+29Jx1/1E4Kxf9SrYcjHYyRtpsJm5QCPewhS2oy7EQG0Sda31aQrAE6ZliQcEQlSfi5PCwDcT4JnPCuLfqWjO4bJlHSpyI530bl6szGNwR/eTu3TEtvH8Y+ounH7ieJ2c8HTMUOYuV0G0JYpjXHRzsQNekVvDbRGl3r924QgjeW/UxsPiiHZGFLHjv2Bbf3paTrcMMPuPl6As93gHI8LViTMd+gE5jE0xdHPDlFZr6J+IiK4N2JNQ2fHQTP787s7xP+DQlm5gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuNFyqlpTn2w3FbqRjeEvX91fcvnPhkhZplxElTPv70=;
 b=JhMaU6yECpbZsWtEG7B4qP/PaCQx5hNw+v+jOqGHMuTRx4XkhRFNAs0DNZ8Zgpo2pckVqehZyX0K10FTGah+E56vNAHUgZCnEFKbrsoOIENo291s3Yu4iTov/q7ynHJrLSWtXAnBbuv5NwOhCYe/rssOmISlsffK91ZD8HhTPmk9uPqwVcSknbnhg5DralhQwr9jnWrpbUqsj4zz1oZd6qfxjnZofibRMFrEc2xWxEj/3M8fn6dWaWnngvFs6UqbNDL34yeIwdG8mEIoTFH0AkZ+qgDlN9u9ez2gQdCpli9uyp3e1mmg4sagSHLm92/+n3NvIZngXIPt0RY4QAm6XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuNFyqlpTn2w3FbqRjeEvX91fcvnPhkhZplxElTPv70=;
 b=mtgokX+IXXEFMsQozJjKVY1JIB99iGfcfSjmRUcx9wXuQahUTCyY52i5ENqoJWrKSSArk+3rvCZ9CUV/xhzsJKLFObfdIhj7ldCodXHt50Yr90TirXBTsSApxAa+sadpp6A9Zq0S5mgTyYfcUlCFbw6M/wvAaJhvUcu00ebuBOM=
Received: from PR0P264CA0218.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::14)
 by SJ0PR12MB5612.namprd12.prod.outlook.com (2603:10b6:a03:427::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Wed, 18 Oct
 2023 07:06:27 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10a6:100:1e:cafe::be) by PR0P264CA0218.outlook.office365.com
 (2603:10a6:100:1e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Wed, 18 Oct 2023 07:06:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Wed, 18 Oct 2023 07:06:26 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 02:05:50 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v4 15/17] HID: amd_sfh: rename float_to_int() to
 amd_sfh_float_to_int()
Date: Wed, 18 Oct 2023 12:32:39 +0530
Message-ID: <20231018070241.2041529-16-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|SJ0PR12MB5612:EE_
X-MS-Office365-Filtering-Correlation-Id: dd3f4867-7784-4043-b40f-08dbcfa8bed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qAPPFQHFy/3GOW2ufrdtheRuy7LSupWTTziCG88zkc/bp9liaNuoL6csv+XFhR70s0pomd1pxn3lsyrVnEqq5WafWSKjocHtcZwaC/40eKyuvkLlsyU5uZRDr84mPf90WYR5icZnvM9bWEe8mvLIOaqWIEHi3ne+HzRg5Y0qVCTzp16xqM9j+AKj8f+VzYAKLfj7fjaGRCgyRdBeAEf3HKK29NTUzpQgjHGmJrg+xCh8Jj3Mk5t0pZWFtceAocnvUQiSAtRbuohvYNEfHThMtzhn89NA2wRCys4LdEeocpyHcBvSKaN+LaDrpy1FFkXMjsAzjFnQHO9CF53fG0oxCTqY9WThXjvkbS95WRmMwirFZay9X1ExsNePpivv4E+v2P4WQBQx980Alh4JUoEoDotyZwITA188Dogn+friYxXgrmBOBJALGrgdynKkHcB4AawJGVLJeMvElW4cZhjGoX3WNbZSx327b6V2tkhrPGk1pC+9WSAQyKW/uxtVRaOUyDBAU93lYF89FkCekoh1V1jK6rJp16Ki6WZHB2+VtUxKNNrsOHuPcYd0qTrg+V+U9R0H7cH6JyO8oaxozOSxXBHuwAosc9r0YR/YjSLRWUjV3z/kh2M0eJH+KLgkJV+FY3zS+o2hz7sTHfHYJOO8k3KQ+YJ04xhv+VBFmBNqze9Slh+iN76N/IMgcAW4FZJPjJgnMdTSPIq4GUM3Af38YgEBtIz0Xxb+PIluNyW5+p/XJlPBSY0XzBy3GFS6bcp0cR9CEYEzJklx0mfdSarTbFI/hn5sInWLbiBJ8qdqMYE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(186009)(1800799009)(82310400011)(64100799003)(451199024)(40470700004)(36840700001)(46966006)(54906003)(110136005)(70586007)(478600001)(70206006)(6666004)(2616005)(16526019)(26005)(86362001)(5660300002)(1076003)(426003)(316002)(7416002)(4326008)(8676002)(336012)(81166007)(2906002)(8936002)(41300700001)(36756003)(356005)(47076005)(921005)(36860700001)(7696005)(83380400001)(82740400003)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 07:06:26.5629 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3f4867-7784-4043-b40f-08dbcfa8bed6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5612
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
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |  1 +
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
index 06bdcf072d10..dbc8c6943ca1 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
@@ -132,7 +132,7 @@ static void get_common_inputs(struct common_input_property *common, int report_i
 	common->event_type = HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM;
 }
 
-static int float_to_int(u32 flt32_val)
+int amd_sfh_float_to_int(u32 flt32_val)
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
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
index 9d31d5b510eb..78e22850417a 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
@@ -151,4 +151,5 @@ struct hpd_status {
 
 void sfh_interface_init(struct amd_mp2_dev *mp2);
 void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops);
+int amd_sfh_float_to_int(u32 flt32_val);
 #endif
-- 
2.25.1

