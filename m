Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 849377AB86B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C88810E6F4;
	Fri, 22 Sep 2023 17:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E42F10E6F0;
 Fri, 22 Sep 2023 17:53:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnEUX9cYUkZtNAcm2qyJ9AySB8LYlTEy1GH5GyJq6CAKls7VOL00/3FAW8RsJJZDZ6Ss/K3acSf+8j0jZuQr0klGHNQwDkuI8xGe+8zkgPPVmYpP7uxBi+Nuw2KzNAQCVfjQtkQG9ZO+Y+qRFUeXWgx9J532KuLaVx4dSgjmRIJM+lXEaPQH0nFrASg7TQrrTsUUat7BOgY411cMns2ncq1rkY5ku5n5TwRGHxeOY9JRfa7e7CybgyUtF7/FHkqrXtUB1uUJaHVveL/3yZDaHJGHBlKLBQMPHXy48wyxJZ86IdOYlPGoDasK5P4ldFq9MSREJ5xRlXrIXeqVSgkMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbQuQvkZfDZ13Sj4SXzVEcaw91G+GkWRwS7S4VyP9ZY=;
 b=ZNkfB7tixK8Uz//vz+IYPw2+tLa2Z6uiSzST6V0LRxKgXsAwu0Tiu8mAdVRbTtGthXmW8xzzYI9Nrc8S8Zh3hWZIMxe0+xnNDMt53ex5YkKjOPdu2IQ075whVggxbyAjEjLYe4SSpJtnahrAew1VKSaRfxKM+Yib0paHE9Ngqr/3tUihoP+KJoMczxUVAucYmJefIiifSF66/71hx+TE67aCQVBFV86IY0zN/GTuQjPHJYO73h3FU3w1RqTHuDgo1dpouPlmY/9v/JG6x2WHx48LVxopsh9VSAXWxoHvF2Y9bqfk6g1hJi0MrmU7+mgRlWNs3P5F2JC+STJ/4nwmqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbQuQvkZfDZ13Sj4SXzVEcaw91G+GkWRwS7S4VyP9ZY=;
 b=H0DCXoEcloqSPS/31ws0IiWEGnQXAcMe06zbvfS70Wp99z1EV98uBfh2CEgYYZcNXEHtDMoGAWICr5INCYQ4QHpOZ7tH5+Wx/U6/D/9aZTeDPHDDU1AVpRc6JEALGzkraumlNcxwC/+7B6BNmEaMRuwTogm5F4oMWMmCAcbl42M=
Received: from BYAPR05CA0073.namprd05.prod.outlook.com (2603:10b6:a03:e0::14)
 by SJ0PR12MB5675.namprd12.prod.outlook.com (2603:10b6:a03:42d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 22 Sep
 2023 17:53:15 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:a03:e0:cafe::2) by BYAPR05CA0073.outlook.office365.com
 (2603:10b6:a03:e0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.14 via Frontend
 Transport; Fri, 22 Sep 2023 17:53:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Fri, 22 Sep 2023 17:53:15 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 12:53:07 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <basavaraj.natikar@amd.com>, <jikos@kernel.org>,
 <benjamin.tissoires@redhat.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH 15/15] platform/x86/amd/pmf: Add PMF-AMDSFH interface for ALS
Date: Fri, 22 Sep 2023 23:20:56 +0530
Message-ID: <20230922175056.244940-16-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|SJ0PR12MB5675:EE_
X-MS-Office365-Filtering-Correlation-Id: a020a714-63fb-42a0-3ee1-08dbbb94cbfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ig62JesUl7hpBtwm0vMnbgkvtsjKHj43GCbO+t9prcHGiUohKQkS8fDEi2ohA/9kb4etj2I6lD1+nnvFGKVKrEHsmvKi3gzWxfKU4acf5Vqbqj24vI3Q6A9u+KaxYQGg4mT6v6ZQcIwVoN8E7jXnFPm/+CXYfUqeVem8arrYkpSvIzrC9FE6p5W4+zzAG7PwehNqgcKyfP/Nvr6FJcsX9JjtdiLfs+hd5rrQtdph74YVXe+c3PKJwDZWf5TfswUcYPElKFBTitEXtMDHhI+fN3kHoCpjhM4ieO0sFqyshe+oh880RnPPVvIOH13JhsCul3LYd5NE2Gup4BNGNElsfp3uM6CUBSLWdSs8Q5f/nLGiFssCeNHogoAkvdKxvbo7sRqr73wWHVZimWHqwZKWOcX9AeqXhThyfBFBDko1Ns0RIfA0iH2Km0j89gUB2vfTYOFZsRqzIUzDgJhfow1OFXfMQFmBKJ+6UQ0fvnHl4Y93TMv0dmklz+Q5I6Qr5nwrL0ww9b8hpt6bdHoXMmBIDrvGCpXMZwJ7YWCiRWOFufOeTvuwkDtSBBnzF4uX7gKg1QRaMdUwlNu0vH2410CSbtUvh4i08XFpHHpvdMfWeOZ77qUcmFe+4GXjO6j1+tYUpAifbdn/flY7J8OrlC0+2a0bfJAl4ZI9+BmJC8k02cp7Jb/0EK2snPUy7Xo7uiI1goXu0nkxkpfm62K6ZExHMKzZggtGUdwCJ0q0RXlZcdXdGCvji+y+rWWQk/pR3YauXs27HujPlBlLTEepl3iwcwL00A3P/6ye56sEWSaGTmtQvYkIPLZfcp3Z4KebeA9oO9jyK7D81wgS/q3N+lemiA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(346002)(396003)(39860400002)(186009)(1800799009)(230921699003)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(6666004)(478600001)(7696005)(47076005)(86362001)(921005)(36756003)(81166007)(8936002)(356005)(36860700001)(82740400003)(336012)(426003)(40460700003)(2616005)(16526019)(1076003)(83380400001)(2906002)(7416002)(40480700001)(8676002)(26005)(54906003)(4326008)(5660300002)(110136005)(41300700001)(70586007)(316002)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:53:15.3067 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a020a714-63fb-42a0-3ee1-08dbbb94cbfa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5675
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

Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  6 ++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 20 +++++++++++++++++++
 drivers/platform/x86/amd/pmf/spc.c            |  5 +++++
 include/linux/amd-pmf-io.h                    |  2 ++
 5 files changed, 34 insertions(+)

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
index 9c623456ee12..d8dad39d68b5 100644
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
+			privdata->dev_en.is_als_present = true;
+				break;
 			}
 		}
 		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
index 63a5bbca5a09..2f8200fc3062 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
@@ -94,12 +94,32 @@ static int amd_sfh_hpd_info(u8 *user_present)
 	return  -ENODEV;
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
+		*ambient_light = float_to_int(als_data.lux);
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
 	return -1;
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 97293ae25cf5..8e19b351e76f 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -49,6 +49,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 			"Connected" : "disconnected/unknown");
 	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
 	dev_dbg(dev->dev, "User Presence : %s\n", in->ev_info.user_present ? "Present" : "Away");
+	dev_dbg(dev->dev, "Ambient Light : %d\n", in->ev_info.ambient_light);
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
 #else
@@ -161,6 +162,10 @@ static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact
 {
 	struct amd_sfh_info sfh_info;
 
+	/* get ALS data */
+	amd_get_sfh_info(&sfh_info, MT_ALS);
+	in->ev_info.ambient_light = sfh_info.ambient_light;
+
 	/* get HPD data */
 	amd_get_sfh_info(&sfh_info, MT_HPD);
 	switch (sfh_info.user_present) {
diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
index 4f82973f6ad2..dac0af573a16 100644
--- a/include/linux/amd-pmf-io.h
+++ b/include/linux/amd-pmf-io.h
@@ -31,6 +31,7 @@ int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
 /* amd-sfh */
 enum sfh_message_type {
 	MT_HPD,
+	MT_ALS,
 };
 
 enum hpd_info {
@@ -40,6 +41,7 @@ enum hpd_info {
 };
 
 struct amd_sfh_info {
+	u32 ambient_light;
 	u8 user_present;
 	/* add future caps below */
 };
-- 
2.25.1

