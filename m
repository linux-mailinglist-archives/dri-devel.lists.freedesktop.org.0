Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ACCAFF9B6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 08:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFA410E87E;
	Thu, 10 Jul 2025 06:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LQ9BLMrR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943E810E87E;
 Thu, 10 Jul 2025 06:23:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJdH1D4w0BW78hWGFFro8poGhhro5Q1WTJe1tDDAFFBFFpfGXFv5J6BuKOof65c7ueGJ81pod2kRcXbES0y+rI5kakgq9RgD95Mcf673dB0BgUrSX2fW5wUw3bQjPgjaddfph8nPrV2G3oyx6k83JoBgvGvbAinOWGcUFlGgwH8J4KpGuZNrGwqnihqHS8RAz9Y49+x39qVFZ9vFr3QDO9IJQlpPFiUSMyNmdiL9zO2kznVAn5HuruOsLkY0QSqK1/bNcmuSchZBjNydr0uHsEenXjULNEcZkuOD3HDsFms9D69TpjMkGPpYtAzyDCQmr06ttHKre8wUX0jjziH+jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhip2z1PdyAhIJEjRwtH8QTK2sEk2zYioa65zld3x5Q=;
 b=yK1r3z58P+Y+b7h3KeZmgwjfE3OvD53QmnjgyxZGdxWRNZ3Iu/3ht/nxZ2fv+sWS8yPpSQndesoLBmyEpsvUl3E9qZa1ma8oXC+/QT0mr6tqJutLBerP0vleFE+fC/B0/wgCnPK+ILQJl1SHJ9XdpGmaUht0a/+38OG4dz0DtssAEFom4OqkfLv8EgnwoDFYFTU6QCX++AgpB1ECaPT9T8wKWenZwNpKUUgrWlbibW1Sk9VL4pSrc3/ulqt9pfx5AUEYxppyJF4gw/AblJoyMvq5REjtO6ucdM/8AH3hxrNXSyEIK+x5tS0tuUbt0AhI5Gh4sGN7metoK21Zy/ioow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhip2z1PdyAhIJEjRwtH8QTK2sEk2zYioa65zld3x5Q=;
 b=LQ9BLMrRgqYCP8HfMzDh/FTxFjGTulIeZx4JlNEzyFbfxDjfYxev/5uDsoE34vG+mwTutpqy4Ut9MjStn93TwdXc7+AG2iGmJ5ZQkvNYcdUBOPx1GWGr1XZCvCn6+4Dxfdhh9YiIt9otu10NAytoB2P5dZUjsh8k/tOPSf/dgh0=
Received: from PH2PEPF00003859.namprd17.prod.outlook.com (2603:10b6:518:1::7b)
 by DS2PR12MB9688.namprd12.prod.outlook.com (2603:10b6:8:27d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 10 Jul
 2025 06:23:52 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2a01:111:f403:f910::1) by PH2PEPF00003859.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Thu,
 10 Jul 2025 06:23:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Thu, 10 Jul 2025 06:23:51 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 01:23:50 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 01:23:50 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 10 Jul 2025 01:23:45 -0500
From: Samuel Zhang <guoqing.zhang@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <rafael@kernel.org>, <len.brown@intel.com>, <pavel@kernel.org>,
 <gregkh@linuxfoundation.org>, <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <ray.huang@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
CC: <mario.limonciello@amd.com>, <lijo.lazar@amd.com>, <victor.zhao@amd.com>, 
 <haijun.chang@amd.com>, <Qing.Ma@amd.com>, <Owen.Zhang2@amd.com>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Samuel
 Zhang" <guoqing.zhang@amd.com>
Subject: [PATCH v6 4/5] PM: hibernate: add new api pm_hibernate_is_recovering()
Date: Thu, 10 Jul 2025 14:23:12 +0800
Message-ID: <20250710062313.3226149-5-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250710062313.3226149-1-guoqing.zhang@amd.com>
References: <20250710062313.3226149-1-guoqing.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|DS2PR12MB9688:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f0404d6-16d8-4283-cb23-08ddbf7a566c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|7416014|376014|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9Dsk3ekJ5HWZmVHLQzovDf2ubwyAXSGY8M5tvcNjkyQyg7thqTUlrkxPa0PU?=
 =?us-ascii?Q?vW2MU6PNq3ehRBGuRnH+964cmgXR++pGe7mSu39U1IkXfPXQ46QH6xPjFcoE?=
 =?us-ascii?Q?SHR3F4k6dYcSab+B5XpsoIXdvSb3gKCmZvsOEOlS7S/zDKuH8KXxjB9gKgD1?=
 =?us-ascii?Q?p/4E7P5hrym3P4j3UDS6cLlPc8I/N2F1O7Xam1eCpJGfmydNsDNZ9rMqI4g4?=
 =?us-ascii?Q?7I7KdifKS6oybUnO6zlDdcsufD4qCgDSyKMue4EZoDL/7pq7fEYnFylMRwvW?=
 =?us-ascii?Q?sbx7OvjnhrrFo0VCC2jivrcnjA4d45498YkEzoRfnCSR7fIUPn/40HLRRncn?=
 =?us-ascii?Q?DJj6C57/RCmMYjNjzX/nAH47E7nnE1n6DJCr6yuwIjNQGrR4h3y6T3rGZ8E0?=
 =?us-ascii?Q?cRE4MnPowsoJ+3BBAdq0ZYV13qg4axlLFQ3Oun+vbyL3+Xra6py7k3RjxO5+?=
 =?us-ascii?Q?OMQeeDPpQjOWDtdmUZDQ3gcSIkGURPoGgh9CsiQwTJwJjbZqWyirqBdNZDqA?=
 =?us-ascii?Q?Aw+2RqYHEuVw/ObjwJNdmAWIQFEf0oTGivqBqd29vyafYu37/+tXDN0G9RyD?=
 =?us-ascii?Q?Rba6b+weoGMB03zlnzRKPbSGP154bQ9wMGMjUCdFQq52qDINzUyPLz+Xx4oQ?=
 =?us-ascii?Q?+Xh+bV3lCKaJzKjeDnXfZiZ7oV4TkgBTbtccZaaaHueBtatlqmU8MgOSQO39?=
 =?us-ascii?Q?1wBFP/CEUCiZLEr3ciTWaJFZXhYO6TQthyDERxEPvdIhBTdP4BXKnJEnzvo2?=
 =?us-ascii?Q?sTuSu+j2uL8zGIHD32ZFzKCFTXjjzgogIoBNTIJbLcpnZW6Wo7E9D0pr/f6m?=
 =?us-ascii?Q?DNzwW4ufWvZiL4tObei1baqrTevmM9ETp0ETAN5oNCR5/DVrKTdXZeroxEDD?=
 =?us-ascii?Q?Z5hYKL26/o9R2zrhqcUknxcrnEYVuOfYd9WkI3n6x95Yxw5Jw4BPq8LRlmYE?=
 =?us-ascii?Q?z0ivwkVPuPqCsMyDHelkrlMqCt5LRtNiYqGQH/3VpMXKGhk1YKpVGrUEmGTW?=
 =?us-ascii?Q?l/dc3fEVLLhUDeb/6KZGxmQRfm4qh20ozzP3UtlrFeMIlllEeTUWrlpI+GCi?=
 =?us-ascii?Q?rfMFpbybxf+w9yhB4TTFMFrN7Wd7dstqAtQDUAcC8Ahjwx5JYOhwhiG+O2YE?=
 =?us-ascii?Q?AAGlXkKu4/YMKLhDi08HSb1BnHWK+/6Tla0h7C+3JlB1ypDzvCx01IMJ1HFQ?=
 =?us-ascii?Q?YD0MnHBPX16toPdSbk4YD2rnEf0w8YEqhezg2PgJOv+nBK4K4dZhGXwc8SaE?=
 =?us-ascii?Q?GcgwsihKh5OHeD34DUY0q4irRYA7UDo3OXjpSKlL/Y0YI89yXWKIokhh9z6H?=
 =?us-ascii?Q?XZG9LV4Ocg2yG6ZLKx6Rebc8mGQqasT60pBAWyz3LULQRtV+4igISN/Po7++?=
 =?us-ascii?Q?looMGlqRnwoggVfmH7HcoYWzIaBEKzpJ2a8i5A1OezmyvWFDONRfvORbAh3K?=
 =?us-ascii?Q?xYewBtXouEuC4knScOdnJwjuEu/jlXIv4Ys/B4M/J17f+HgegG4JuPN6ybyC?=
 =?us-ascii?Q?uQuRhW9qvB6SpYAhI3eKsi3XR06nnhrWO2ggrYiwppsmZqyNZvNhM5nlYA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 06:23:51.2520 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0404d6-16d8-4283-cb23-08ddbf7a566c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9688
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dev_pm_ops.thaw() is called in following cases:
* normal case: after hibernation image has been created.
* error case 1: creation of a hibernation image has failed.
* error case 2: restoration from a hibernation image has failed.

For normal case, it is called mainly for resume storage devices for
saving the hibernation image. Other devices that are not involved
in the image saving do not need to resume the device. But since there's
no api to know which case thaw() is called, device drivers can't
conditionally resume device in thaw().

The new pm_hibernate_is_recovering() is such a api to query if thaw() is
called in normal case.

Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
---
 drivers/base/power/main.c | 14 ++++++++++++++
 include/linux/suspend.h   |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index 24ebe7a635a7..c4817b379230 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -66,6 +66,20 @@ static pm_message_t pm_transition;
 static DEFINE_MUTEX(async_wip_mtx);
 static int async_error;
 
+/**
+ * pm_hibernate_is_recovering - if recovering from hibernate due to error.
+ *
+ * Used to query if dev_pm_ops.thaw() is called for normal hibernation case or
+ * recovering from some error.
+ *
+ * Return: true for error case, false for normal case.
+ */
+bool pm_hibernate_is_recovering(void)
+{
+	return pm_transition.event == PM_EVENT_RECOVER;
+}
+EXPORT_SYMBOL_GPL(pm_hibernate_is_recovering);
+
 static const char *pm_verb(int event)
 {
 	switch (event) {
diff --git a/include/linux/suspend.h b/include/linux/suspend.h
index 6a3f92098872..d11a124b7a91 100644
--- a/include/linux/suspend.h
+++ b/include/linux/suspend.h
@@ -426,6 +426,8 @@ int is_hibernate_resume_dev(dev_t dev);
 static inline int is_hibernate_resume_dev(dev_t dev) { return 0; }
 #endif
 
+bool pm_hibernate_is_recovering(void);
+
 /* Hibernation and suspend events */
 #define PM_HIBERNATION_PREPARE	0x0001 /* Going to hibernate */
 #define PM_POST_HIBERNATION	0x0002 /* Hibernation finished */
-- 
2.43.5

