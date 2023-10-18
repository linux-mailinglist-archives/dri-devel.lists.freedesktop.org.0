Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CE07CD52B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 09:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD0710E3AB;
	Wed, 18 Oct 2023 07:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFB910E3A8;
 Wed, 18 Oct 2023 07:06:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFIZpDLUOaRq6aa7Rfy3SJfN/jXlLR6XOWai3/Vh4JkkiJlbPdNFPWwLYsQwy0EjfVaEnVHF4wyUI21ZaZJ1e3AW2rhrikcsRhmDV2SWbyNzfPjn4pX5rGSVS33/TD6fHY6ICzdtQHDfRhegsia4Nrv6uWpfWP7MeW9hXDXE3PWms77F96f9gd5SlqmWi94J0v8ntp56nrFyONQeEr8Gt/1bA0nhgz09oJe/CQOA6kJF0F/CjunisGrn4ElEjkq6LXRQCNBok6PeG13UgngsWc0cMT25mOvZm5iRh4AkA/NWtE/hxg9qoLBLdbi2Zn5h4spYXuuzRKZhA4aHr/mGqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6Rhl3f/cKcNKhHxVbmjiU4JIMtv5GNvT4blo37ris4=;
 b=MTrNSvhowCdM/LsS0jA1hQN3pXBLUIKxGqBhcVbp6oWc3ER8jRpvQD+YAidSTRmjels+1aQStj6jx/6iF6imSW34T8yNyGldfAqhwId0fT+GS+ebRWqSjec/QLjrTSsj880IYjxWcNBgTjxLQ0wCFlLeVdg2tI8D25MOZF/0V8nr0idfhSWGxUO1aE4I2EKMcTynqUEDpiEa33eyMmOirmeLoBJW66/iwIALKEWaJhV2FcXucm5z21EkV3ZwZrCUNCP4kJnLkithN9rOt/f9lWU9YfhiLIoEddbgmpiMK3nqxVyt8V+UBa5Yyi4ZhNDZ7oaMQNErv3Q43SYeyP1n7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6Rhl3f/cKcNKhHxVbmjiU4JIMtv5GNvT4blo37ris4=;
 b=FzKklcaMKQh4zJdgWVfYHpjndle1WTkvYHTXaIfiR9M8TePIN24uBJ6NaZENotdQq1F24C2sew64GGMIByuAieMKnQH+WZlmXR6+Ww8v9fZ75zy5TTbTOPWbn/ILSzAVYy38HT10IwVrEqp1yThcaPo9QrmcEYXE5Mb3fZFwhzY=
Received: from SN7PR04CA0221.namprd04.prod.outlook.com (2603:10b6:806:127::16)
 by SN7PR12MB6886.namprd12.prod.outlook.com (2603:10b6:806:262::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Wed, 18 Oct
 2023 07:06:31 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:806:127:cafe::c) by SN7PR04CA0221.outlook.office365.com
 (2603:10b6:806:127::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Wed, 18 Oct 2023 07:06:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Wed, 18 Oct 2023 07:06:31 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 02:06:25 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v4 16/17] platform/x86/amd/pmf: Add PMF-AMDSFH interface for
 HPD
Date: Wed, 18 Oct 2023 12:32:40 +0530
Message-ID: <20231018070241.2041529-17-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|SN7PR12MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f10b4a6-4066-414a-e7fa-08dbcfa8c195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k49s6oOJ9LHBUIYHLiqyQ3c3TV7swt9wZzmahEZAkDH/srb8zDf4yxMkllENbbv/g7sPrejxaccmxKTftApc0G6RFYR8F/R6JxV3cStDH7R4uiN3HpOdwFjIDMhvhAbkEmzKm0BZGT00AbKXoC3NsSTDP+hfvCHXdnwWvPlOMAjvD1UgnwGXXggyemoB59A501qV7FvOgIIe+IOBtsI6OkPf2tlO14plhtgEqoIWyqv5Rbz4cMy2Gjazr3ZWXaVCi80BP93gW3Gqw91lkz+CS4LC46Ivzq7ONeOovVPf+HQX80Tjcff3jOXG4KET8PNMkv7XMGaSuUFr0/uqPfMRv6CF2mqWzCb3/J++0sgaigqHXobqHCJbDQQmU6WayOFBpn9Q52/dcOBxu8mzzgc70clr7S8932TFdeKe2kLQhELyWzLhF03rd0wYiK3eljg3fhTacNr2reIlYehF2H3axD6f2a63tgXqMunF3M2yPk7/J9SJBi8MshDbD4l+GlH0IDlYfwpnkIXO4N3y3By4f+PAlZA7OFKzmKU4+mfLsBOGCZzUd9div93NtSgZZXdaGALlhI26sU0J8F3v7YD52X9dahqTeCcIl8iu5d66qIJhE8wGtpF9QIWUPccgNTyZyNEpUsiM/fsGeoK548BNq3951QupWP7vT48eUQQjGZ2yxE8mN/rfEwpdiNK9O+6PrwCt0acmCGGux38UFES9P3Lpk+h2Xpzj0+k72QG+oiyyVJ0NjNHCXMhHBxOkRKe86ZsSgsguZijNIC0AO7GOSHEd9IODrMjzJx+et/O3ktw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(1076003)(478600001)(316002)(110136005)(70586007)(41300700001)(7416002)(8676002)(4326008)(8936002)(54906003)(70206006)(5660300002)(7696005)(40480700001)(47076005)(356005)(86362001)(921005)(81166007)(82740400003)(36860700001)(16526019)(36756003)(336012)(83380400001)(26005)(6666004)(2906002)(40460700003)(426003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 07:06:31.1714 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f10b4a6-4066-414a-e7fa-08dbcfa8c195
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6886
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
index cf4962ef97c2..8bdfb395f316 100644
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
@@ -158,6 +159,25 @@ static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
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
@@ -167,4 +187,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
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

