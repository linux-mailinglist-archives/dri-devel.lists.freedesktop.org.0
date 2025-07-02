Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7407DAF5DB5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 17:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C9A10E327;
	Wed,  2 Jul 2025 15:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hE8OkemH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEA510E327
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 15:56:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRlRSIGYWNkrokqQjoOIvaGAlGFR6TZrTMgizWaqTHvP54x4552o8JO9CmWFazaBO7btfxVdGsfrrcsODW508F14bqon+UPqBQafnIDrvxjGp/XGKOLWYauB9HM4MPm65KqHn5d0hoI/FIvL0Js/wwUYEsBGzhw02ifaGndVoOaQAkhf2el2SLsMwmhTb/NUDGqZiTx+iApl/j1u4rdNseIONBx3UCSdeQxgOkf7QyxQp0EU68suEdh9arTv17jDayvWktDUqBZxRc5jhD8hat9Kv+CQQdQFXt8nbJQ4u3leERx05fx25uBEvAqZEw/AypsVdqEhPZS2frc5j9DkZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAMLdSRlFB9c1yGAU+yZG/gQ0qLWyuDV+SNap2uJKxQ=;
 b=tK7nMDab/0c5o+3QWwG+2dfwLNE+xQ4V2VvQJOSpameQNGIzk7BZ3MBwXcccO+vEKhn6OzWuT/P+qhkW2m3eOYSWqMTfxX4ATvZl2u213uK0Y8t4DjuMhgAzHf3cUtfFNNjwFM1Uxg2Tlnqir6oELnUC6eZFArFNCjS479VjfW7NlJUhnpfsFJCk2gRum0oAP60rBCrrd/nbl25itWbPfBjKT5NUKQIdyt8mMgbvtOWGpb/W5MJKS9DTJgbq9FMiBTQRHnWPZwqID7Dt9cjeSDDvkK12A/1vidrTMEPJ2xWcV6V7wRTv/CvnOu5b6GssRU+zduRDCal3hRoiFKhGcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAMLdSRlFB9c1yGAU+yZG/gQ0qLWyuDV+SNap2uJKxQ=;
 b=hE8OkemHLjxRV5vfIomFpYdB17kNy0plljrQq5gpL4OZyBgG8c+j3t5GdxuF9roXG3RDWY9q+7aW1ZY7xhLbb+1vNBXrECPcuSYNI2I1bh+I0UIfhkAOZii7CoulFefdWk9oOUtkoygVA6nqvByoDfKeCOwhg2XOWpYHrEKNFlo=
Received: from CH5PR05CA0004.namprd05.prod.outlook.com (2603:10b6:610:1f0::9)
 by CY1PR12MB9649.namprd12.prod.outlook.com (2603:10b6:930:106::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 15:56:42 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:1f0:cafe::3b) by CH5PR05CA0004.outlook.office365.com
 (2603:10b6:610:1f0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.11 via Frontend Transport; Wed,
 2 Jul 2025 15:56:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.1 via Frontend Transport; Wed, 2 Jul 2025 15:56:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 10:56:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 10:56:41 -0500
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 2 Jul 2025 10:56:40 -0500
From: Gregory Williams <gregory.williams@amd.com>
To: <ogabbay@kernel.org>, <michal.simek@amd.com>, <robh@kernel.org>
CC: Ronak Jain <ronak.jain@amd.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <gregory.williams@amd.com>, Amanda Baze <amanda.baze@amd.com>
Subject: [PATCH V1 2/9] firmware: xilinx: Add IOCTL support to query QoS
Date: Wed, 2 Jul 2025 08:56:23 -0700
Message-ID: <20250702155630.1737227-3-gregory.williams@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702155630.1737227-1-gregory.williams@amd.com>
References: <20250702155630.1737227-1-gregory.williams@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: gregory.williams@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|CY1PR12MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: dfdc42b2-62e1-4a52-bc22-08ddb98109dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IRxZGi+kcVlyzwn60I1MAHc/tiplMqFR/3KkF1eKR0tHPrs2jXmcoNjt8SOa?=
 =?us-ascii?Q?4ILoLwuR7KXNdyiiI7/98LyUCLiNEjPxVTrk31c6tCQQzxk3WzMo2mtm6ET9?=
 =?us-ascii?Q?yqFi7joWFH9yMgAn0Im5VvCX+1ACFZKaO042/CgbexjEBt2Y2TA1baOMETA7?=
 =?us-ascii?Q?fIisToW0ckFkpaAl0TD77qaMOKguoAI+KmZO8Vk9nni1RHakUfPEn/tv/XC3?=
 =?us-ascii?Q?XRfQlvUnBEEd2OYSI0/VvTd/GZF6hS+U92si+AexbbS2pDfjP/x3roI+JtuC?=
 =?us-ascii?Q?X5ErusKX8VNeI949BX0QTV0Q+O1s90q2UdqWVbQbCpp6EbzB5pn4866uSTJj?=
 =?us-ascii?Q?i/11dMRqwOch0flLczbHPG+DFh61Ke5I6pjA48s/9JclS72yhmMrl+p43ylc?=
 =?us-ascii?Q?eLNf5R8tmoQjDx7tHsHbhWkEbCgcy+UkB+XfMAFl+ms5bUCHS4blPs6TRFz3?=
 =?us-ascii?Q?rXHnVzVIV59zuzqCXrsrWhUYSwNQdm0DBqg2fUSDWB62Bf/Jr5fIs3aBi7HG?=
 =?us-ascii?Q?4+uTQacknttAF0/hw5ys75dnhT6Bti5r5W/99hcdSY5e7Y23qFRBwjn87qkS?=
 =?us-ascii?Q?tt3AZFsPukr+YR0LQnAU6FDQ/MmO7yz0CrHNxmNgjumRQ2kgOUXaFsz5wRJ3?=
 =?us-ascii?Q?ytqqQyrOOGknJin1u5Us6gjL6zXwYJ3RRUB9BP37vi02bxeNpjDnz70yBtXM?=
 =?us-ascii?Q?oUlXPi2z9ZbBLLGVVHuuj3xD6F2HNzjCIPpIZPjtBND6gotUE2O2zliprgCv?=
 =?us-ascii?Q?T89ctzp1XJz5jkDRvNX+p9R7ZKeAozu+QmN9HKmYEOdiOsvphUAtHtghGEkx?=
 =?us-ascii?Q?9dlJ6uE4eyxR6SLC5dILd/69Mbit/JDB0sn5u2ISp7tGpGL8LDaBlpBUXbEq?=
 =?us-ascii?Q?xWNFN2dJXcarMDoqgMbWseHW//w2gzYVbcKq71w+VDiMd+kJ4q2HKKxsCldd?=
 =?us-ascii?Q?N0YXEs8RyPxQv/76syv2fMAwAGBY+XOf2bP00O0/c18wuFVEWXDiNtMLy+LX?=
 =?us-ascii?Q?QqIbkAuzjvNrzXgF8Uv5hG0e3ZjTGZd492lShsFv9DzzUxo724IhpalhrLXj?=
 =?us-ascii?Q?NrnT5vyY0BXA/Ybv3pMGK/RUJIi8uQ4VvUCI5Peie748EF9HQXGNoMUnLbMt?=
 =?us-ascii?Q?KAGmr0tnE8pK5Ia/Hxt0Kw71oG2re2JW7fG7v9FYWWG3CkkKuAC12fG4hxVt?=
 =?us-ascii?Q?7yrUUQmPuS6nfo/cf/XnZodyAZkZdWcLLVgZuUE4IW02Ph9BrIXxJTz9nFKd?=
 =?us-ascii?Q?Y5ZSMZ78y0Ur3kgZwYIUQebKh8zZlplRgNN/tbYPwHQEBvUR+q1nkgGE89Zj?=
 =?us-ascii?Q?1eIF49WXSJHIfYQvqK1Lf6384M3JuloabVV6hIqNgfxByGm6Q7JOYoSxicja?=
 =?us-ascii?Q?mgwR2sWLio15N1o7Q637XWPH9DnXGpOCp2waM2z10Ikjrb04njLlx3kL6p3Y?=
 =?us-ascii?Q?Z30yycBJX2FGN7fU1A5dZ8LpsVJWN1UEEZKnZ5N2GiEH66qf5sqdCkM5EKx3?=
 =?us-ascii?Q?w8HvVV9Q/E7+YCWzFxoOpeiGyJy61j5RsHsb?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:56:42.3383 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfdc42b2-62e1-4a52-bc22-08ddb98109dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9649
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

From: Ronak Jain <ronak.jain@amd.com>

Add support to query the QoS value on a device by using the PM IOCTL
EEMI API.

The caller only passes the node ID of the given device node and IOCTL
API will return the default QoS value as well as the current QoS
value.

Signed-off-by: Ronak Jain <ronak.jain@amd.com>
Signed-off-by: Amanda Baze <amanda.baze@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 26 ++++++++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h |  6 ++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index d9fdfd232d11..52dae076d2cb 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -1636,6 +1636,32 @@ int zynqmp_pm_get_feature_config(enum pm_feature_config_id id,
 	return zynqmp_pm_invoke_fn(PM_IOCTL, payload, 3, 0, IOCTL_GET_FEATURE_CONFIG, id);
 }
 
+/**
+ * zynqmp_pm_get_qos - PM call to query default and current QoS of the node
+ * @node:      Node Id of the device
+ * @def_qos:   Default QoS value
+ * @qos:       Current QoS value
+ *
+ * Return:     Returns 0 on success and the default and current QoS registers in
+ *             @def_qos and @qos or error value on failure
+ */
+int zynqmp_pm_get_qos(u32 node, u32 *const def_qos, u32 *const qos)
+{
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	if (!def_qos || !qos)
+		return -EINVAL;
+
+	ret = zynqmp_pm_invoke_fn(PM_IOCTL, ret_payload, 2, node, IOCTL_GET_QOS);
+
+	*def_qos = ret_payload[1];
+	*qos = ret_payload[2];
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_get_qos);
+
 /**
  * zynqmp_pm_set_sd_config - PM call to set value of SD config registers
  * @node:	SD node ID
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 1d30366f741b..b2ca960d3bbe 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -657,6 +657,7 @@ int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config, u32 value);
 int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
 			     u32 value);
 int zynqmp_pm_aie_operation(u32 node, u16 start_col, u16 num_col, u32 operation);
+int zynqmp_pm_get_qos(u32 node, u32 *const def_qos, u32 *const qos);
 #else
 static inline int zynqmp_pm_get_api_version(u32 *version)
 {
@@ -981,6 +982,11 @@ static inline int zynqmp_pm_aie_operation(u32 node, u16 start_col,
 	return -ENODEV;
 }
 
+static inline int zynqmp_pm_get_qos(u32 node, u32 *const def_qos, u32 *const qos)
+{
+	return -ENODEV;
+}
+
 #endif
 
 #endif /* __FIRMWARE_ZYNQMP_H__ */
-- 
2.34.1

