Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8259A68C6EE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 20:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B0510EA1F;
	Mon,  6 Feb 2023 19:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C929E10E43D;
 Mon,  6 Feb 2023 19:37:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwN6zGRz4g6MJNnIIHlfExDghIkTT4SqEe8avTrJ/QTgHg8VyRnuW8E/QGHPqR5JtiXhyeUroGzXrTYYa25tTZr7z90axu/uUghAp5Jue81NmP05YO95IluWBMwV2sa50/kZhH9aifJd0+e+YvNKdNitOOX/TaeHX+TLznkJnuXeSzDthyBTADGMIY0kGplnN9NVuufgrMWnoeSm0gvoFRrSuD2KCR5s+wR4ebciW8ln1RnFaenBL+mK/HP3snDWjLmU32nYr7vQ3vtV8STZmDxw0rGC6v/YrRZ6p315njuSE265ixrOs1JSZRSybwRtS7GQoKqvL1+odnZRvkHNnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVtzhCOw9Q++1L47VX37FTeVAgBUQ6caAUtPLzPTRnc=;
 b=X7MzxYVYpt/FV7ZkGzu8EgqcMacGA/2PpbCfMbhjT438eLHxs+v0iVsY96fGSP8AzUdD/u52NgCVfHhmQSOa2cJlwwL01zqsxF8ZFTxVsjnnvwzdGEbdJ51DTPcksRsNzpzMaA+DDKRvRK6JlfW8gcvSWH5AZHfGNkqqlbTn7SkDy97kjQqqoU8G2j1Fy0fabq4vlYb8bGvnMIEvizVdIhw5vFUyuJ8IYRL8iKcWCqyzFDYTWZ7IQx/JNDq8Q5WWaYfzq5SYK2g4Fhc/A7qpLmuivbVTEoJ/ozk9J96ZXU/i/Vcx60s2rCMRW0KC5ZWI5OW7cdTcYgY4bkBAiX1dEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVtzhCOw9Q++1L47VX37FTeVAgBUQ6caAUtPLzPTRnc=;
 b=DlZO33mK21WOWC3yDQD806gLte6tdmmcrDyQgUJDAlXhKCUdfIdMVMSgM3AsFhEP7b1ooJH8FZjUypUbfNPbo4WxuyC/Zpf7jAihdCJRlghtd3ybAXy6PuK4Ddw7HToSnUbhJYDCXtybt85G9PhYfvfe3eyPLfpBZT2vHK0yzi0=
Received: from MW4PR03CA0147.namprd03.prod.outlook.com (2603:10b6:303:8c::32)
 by PH8PR12MB7109.namprd12.prod.outlook.com (2603:10b6:510:22f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Mon, 6 Feb
 2023 19:37:23 +0000
Received: from CO1NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::90) by MW4PR03CA0147.outlook.office365.com
 (2603:10b6:303:8c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34 via Frontend
 Transport; Mon, 6 Feb 2023 19:37:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT096.mail.protection.outlook.com (10.13.175.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.32 via Frontend Transport; Mon, 6 Feb 2023 19:37:23 +0000
Received: from jasdeep-System-Product-Name.phub.net.cable.rogers.com
 (10.180.168.240) by SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 6 Feb 2023 13:37:21 -0600
From: jdhillon <jdhillon@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm: Rename headers to match DP2.1 spec
Date: Mon, 6 Feb 2023 14:37:08 -0500
Message-ID: <20230206193708.82187-1-jdhillon@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT096:EE_|PH8PR12MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d9ade2d-606a-406f-8aac-08db087991da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tPpU1F6L08AOZnQlp+F+7+0AnuOfspvp8oI+qT897+/a0LQMzHDBPMS2gBkXUXkJaHFUNqStOMp7489tcCYxRXYCOkfyivfOn67eTKy23KzxzH3FPpKiu/XYEfVIWjjdBBtY/SJegmcZx+ScJf6kZg0MbWsZnV/NzPOr5B90lPgHHULwrajIG9CnRUK+9K+oRPAy1PknUJGIcKV6CQHUNS64ibrDTzC1Yxj6QSejg/GUK6iQGJjp3qP3SpPfME90f2lRe9q/9vNcmYrCN4rBupAvQoS56ocYGKIw9xD0T8tblCI7qQIPCIgr8xnt1tIcwT9WLcd+hQwVQCcEA/1z1uSXdP3s255hIs62eCEEsePfjHfzBFGwsyY0Cs77ZO5SdCSP5h/A86QR+8L5NAsHsArzksfP/Z7x+DgAErVgHBvMwO+ojBSMoq7fKtbQkutPHg7W2qH72H96YG+aY+ty6rfpylpbQJYDjjIoevmmdaRCw4XVphWrWR/0BB96xZe1YXcSh2X9Su13xW9r55LzTxrcJcnqQFP3z2uzA1ScQOgDCWO92YdCt84eRb/Lxwuyz0xkar+rrCqX6NcHWHKhV+h2uRqQmq+jaDqEoDAX5Wn697xermtfycbUl9UNMIn7/xIH8t18wZ1UmlYlA7D080+wcQqadBMUXIuJr3hDCCb/+GDz7SHODEw6QD+0u8E/+o8Zoz/vsttTlGo5bJER4pKr22m0sVt8Ps6XEY8DLN4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(82310400005)(16526019)(83380400001)(40480700001)(426003)(47076005)(336012)(2906002)(5660300002)(36756003)(26005)(1076003)(478600001)(6666004)(356005)(36860700001)(70586007)(82740400003)(81166007)(186003)(41300700001)(316002)(70206006)(2616005)(8936002)(54906003)(40460700003)(4326008)(8676002)(6916009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 19:37:23.2734 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9ade2d-606a-406f-8aac-08db087991da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7109
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
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 dri-devel@lists.freedesktop.org, Jonathan
 Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jasdeep Dhillon <jdhillon@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch changes the headers defined in drm_dp.h to match
the DP 2.1 spec.

Signed-off-by: Jasdeep Dhillon <jdhillon@amd.com>
---
 drivers/gpu/drm/tegra/dp.c   |  2 +-
 include/drm/display/drm_dp.h | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
index 08fbd8f151a1..f33e468ece0a 100644
--- a/drivers/gpu/drm/tegra/dp.c
+++ b/drivers/gpu/drm/tegra/dp.c
@@ -499,7 +499,7 @@ static int drm_dp_link_apply_training(struct drm_dp_link *link)
 		for (i = 0; i < lanes; i++)
 			values[i / 2] |= DP_LANE_POST_CURSOR(i, pc[i]);
 
-		err = drm_dp_dpcd_write(aux, DP_TRAINING_LANE0_1_SET2, values,
+		err = drm_dp_dpcd_write(aux, DP_LINK_SQUARE_PATTERN, values,
 					DIV_ROUND_UP(lanes, 2));
 		if (err < 0) {
 			DRM_ERROR("failed to set post-cursor: %d\n", err);
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index ed10e6b6f99d..2093c1f8d8e0 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -641,12 +641,11 @@
 # define DP_LINK_QUAL_PATTERN_CUSTOM        0x40
 # define DP_LINK_QUAL_PATTERN_SQUARE        0x48
 
-#define DP_TRAINING_LANE0_1_SET2	    0x10f
-#define DP_TRAINING_LANE2_3_SET2	    0x110
-# define DP_LANE02_POST_CURSOR2_SET_MASK    (3 << 0)
-# define DP_LANE02_MAX_POST_CURSOR2_REACHED (1 << 2)
-# define DP_LANE13_POST_CURSOR2_SET_MASK    (3 << 4)
-# define DP_LANE13_MAX_POST_CURSOR2_REACHED (1 << 6)
+#define DP_LINK_SQUARE_PATTERN				0x10f
+#define DP_CABLE_ATTRIBUTES_UPDATED_BY_DPTX	0x110
+# define DP_UHBR10_20_CAPABILITY			(3 << 0)
+# define DP_UHBR13_5_CAPABILITY				(1 << 2)
+# define DP_CABLE_TYPE						(7 << 3)
 
 #define DP_MSTM_CTRL			    0x111   /* 1.2 */
 # define DP_MST_EN			    (1 << 0)
@@ -1127,6 +1126,8 @@
 # define DP_128B132B_TRAINING_AUX_RD_INTERVAL_32_MS             0x05
 # define DP_128B132B_TRAINING_AUX_RD_INTERVAL_64_MS             0x06
 
+#define DP_CABLE_ATTRIBUTES_UPDATED_BY_DPRX					0x2217 /* 2.0 */
+
 #define DP_TEST_264BIT_CUSTOM_PATTERN_7_0		0x2230
 #define DP_TEST_264BIT_CUSTOM_PATTERN_263_256	0x2250
 
-- 
2.34.1

