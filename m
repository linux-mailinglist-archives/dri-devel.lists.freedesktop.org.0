Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54129C5FAEC
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30DF10EBF3;
	Sat, 15 Nov 2025 00:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="X+YPw2fX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010031.outbound.protection.outlook.com [52.101.61.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E40210EBF3;
 Sat, 15 Nov 2025 00:09:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcT//poU0VhgqgfCs8tfQOHq3+OHqZYhZdmH6RBUBM6wGYygqLqiuPVZOdVOCAfammWKx0kz6hI78JENaZp3YN3imL4y/fV/BZndq1wI6UUtj8GlM9wnabsZ7oXxQ/D9in0mtKsG7Mx/ayE5grsLz2919zrzlvoslpBtsS0YtNh1OC+V+9UpBCa5BcGKLMV+2Rbe8w93kfCBarhDyDOssFtwg1HdPiVfbvFEamLy0N3LUMxHfcSXSyUOug6mWsusCDQQRaHw039dxO8Q0Kak0c6toj4mktazpMa8V+hwkR/EpXXZQF6uc2R3WGY9WOdYq/GQubPvOuq/vEr2F+gEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tB2qO2V+5dPqQKUJoRLd3bZv1Xya8/qMMtj1ol6Y98M=;
 b=X/kZyFzkYdxgqArl+7KCmIYPmpSWIwibaKGl3aFpC3woaGzNaktgWrzuM+kER7Ilw+e3P+EeRuVg4c4SMB/t4kGMqqgi+kuzVkTFIcpFWfNCdm626Lca8kGL2TPfU2m9ej2ic2jjE3W1XH6CY1Dfs2shgrp61xqUfcZTLWLjfRXE+4Yi6CoSHrVdaG0LRGPEsUPoC3U9uLvsfWIPi01p18qAR9cDf4t3ioetJF0LvE7Ru1Vv5HDBz0kTWiM6B7beKc6t1Trcs0T+8XjdD3L4Li1KqOLzvnesHUrJWzQ/1PoYSNQWOPaePuLr0TXcfW8Dj5qS5HO5cTQvNlZR+SGcOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tB2qO2V+5dPqQKUJoRLd3bZv1Xya8/qMMtj1ol6Y98M=;
 b=X+YPw2fXP8jZqyeg6HQOp6wYXPRWxnOMxFj+qoRc2DQqKyHOLsouYxgu+IrXAZpAhkrEdqJXQcDMkXsjhmJghTpsw3jZf2pp8OeyQCq9OPk5MT02t62yPezBh/fKupCMSDMu6kdUKsW0xivagSbZhZkspATxN5Mm7k/u5P1Qlhw=
Received: from CY5PR15CA0005.namprd15.prod.outlook.com (2603:10b6:930:14::18)
 by SJ0PR12MB6829.namprd12.prod.outlook.com (2603:10b6:a03:47b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Sat, 15 Nov
 2025 00:09:31 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:930:14:cafe::1e) by CY5PR15CA0005.outlook.office365.com
 (2603:10b6:930:14::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:09:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:09:31 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:09:27 -0800
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>,
 <agoins@nvidia.com>, <joshua@froggi.es>, <mdaenzer@redhat.com>,
 <aleixpol@kde.org>, <xaver.hugl@gmail.com>, <victoria@system76.com>,
 <daniel@ffwll.ch>, <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V13 24/51] drm/colorop: define a new macro
 for_each_new_colorop_in_state
Date: Fri, 14 Nov 2025 17:01:49 -0700
Message-ID: <20251115000237.3561250-25-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|SJ0PR12MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b7eba12-2c94-4960-a363-08de23db3ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KuTFldcMD5xCitxJJSTg3fl0dwYNbkKyjIYtDMXy7egpRvAZ7qUhj+8KSNB3?=
 =?us-ascii?Q?PeUfPGzVQTqiMT7uU+5m7kH1OWHTJbKp8ol/dPhoO4mQkplTi7qBd3zz9Qq2?=
 =?us-ascii?Q?GofkEMVOt+XKHH9DWMju5w6qeK2uHEEz0mTKkYe5Hx/Hhi2/jy+shXo9twd0?=
 =?us-ascii?Q?4Ui1gHg+g1UtYVx50wp5BdhL4ao3/zcNX4mqvIgBe20XPnO9KW2ufyIqfzNb?=
 =?us-ascii?Q?jW85pLcAGHkI7LqnqBTDzK9U2b9oTnW+7dji9nmWzSrONvCfXcewVYqVEQuP?=
 =?us-ascii?Q?i9ms/qum0fxPd48MwJNDBPIkWxjnrlFslSR7jsKVFeH611wRCgW+3WMW5CM0?=
 =?us-ascii?Q?E70fHpXCQhuJf3gVOD3+3nT/2TC2cPnYAvpaqbkmHrsxiTJ7kKENIDSgKsLF?=
 =?us-ascii?Q?lCDmzl+MOaLEgPcwJ6qK05jfjzZKJ+VRV0D8Oab3k48Qy4NDY207m1EWPmtw?=
 =?us-ascii?Q?JT4M7SsT8XoP6IzQUFpDYlPxALoLcMjCM9+pn7EjayYNaXs/DJxOK1jbt//k?=
 =?us-ascii?Q?5uWjVw/DEocgU4kwPMP4ywQOJuuwWti/FuPYQtnteB37L4S4Pw7D1R8ZVkb5?=
 =?us-ascii?Q?GAV6lIaVCxzfVGOfRtat6fOby0RxJew/fi2aEqvYNKO0lvfkTXTPn+frdY5X?=
 =?us-ascii?Q?rdBpO7zp30VrYNVBoHUSz4sqkTYWl738MNUetfGXu2BNxY7RrMDA4RNLm4zv?=
 =?us-ascii?Q?N3z3IyargRUw7tNkUdosk1fE7rtvzz/vI04NqvIHMRyxHerhc9hQETt2TpFE?=
 =?us-ascii?Q?sRNgqsnF2p/KLQfu5gQ1eI9hVVops9dkuRc6XYlvT7k/yc0QJDCDuNEzrNJJ?=
 =?us-ascii?Q?oy6iWLHdtwdIr+KHH3sK8RxE3PU2umW0WsW9luqxXtoOuiGFAXKiQ6gBsbFJ?=
 =?us-ascii?Q?6U7msMMS8ONx4erfnZy+gkmpVH/3/7sv45EWREs/CmRu7RGV/002sSch82p1?=
 =?us-ascii?Q?UlyfmqjET1wJgxeXv2Lck9LTmH/cpgRLOkjFA50AkG31qlvgC+M4tVGDaxDb?=
 =?us-ascii?Q?Bf3mm9xDZRt0QHpAb1Vp8KP04TkUQzR1P/E5zp15s899EEwA4HJuuu7slpKJ?=
 =?us-ascii?Q?rnrkTkAnV2V4tuglrtonIVMy2QDd12NMVj6b4w4ez88UJsNH8ljO2uNXuXXP?=
 =?us-ascii?Q?6cIUAgglzkA9730O5mt+SLO+zviCQS8mWCJvobkhnmJtXyOGaqNlYcj84dEW?=
 =?us-ascii?Q?dwEKegZLSKN4GR6QMXyc6z35dWRusy5bF1rt28p4LY7O/m/oj50nsWxl4nHa?=
 =?us-ascii?Q?HQUoGBYnHpT30q60cPQuvx7r5KzOikRdt0FqYcHuogrG9UUi3QzDeFH+YFbH?=
 =?us-ascii?Q?5zbv0s9GcVcrxETjgz8C9D4n8Qr2NPlN3KgoethcV7wB6p4rPqPzZFWhi0jN?=
 =?us-ascii?Q?ZeaGeS6CFrmA05Njy3QSOj6Im0kprK6Kz5W+8IePD4/AJqBwDGvM9Mj96+f5?=
 =?us-ascii?Q?yjbcIAL2sVHNd+Mv3PsdcwFmf7LFdTh9NSDRXeVQ/GDoOs6WMDqHpkJqnEns?=
 =?us-ascii?Q?mTI6WSoRfDoCXxTinMq4EIOxn0oqt+UO+LB/Wk3aSAQZCr7Dr94JH4O82iop?=
 =?us-ascii?Q?6OZLFSb1x+k/CVqiOLo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:09:31.0265 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7eba12-2c94-4960-a363-08de23db3ff6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6829
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

Create a new macro for_each_new_colorop_in_state to access new
drm_colorop_state updated from uapi.

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
v10:
 - remove duplicated "is useful" in comments

 include/drm/drm_atomic.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index ed989f0cd8d5..065b183358d2 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1089,6 +1089,26 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
 			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))
 
 
+/**
+ * for_each_new_colorop_in_state - iterate over all colorops in an atomic update
+ * @__state: &struct drm_atomic_state pointer
+ * @colorop: &struct drm_colorop iteration cursor
+ * @new_colorop_state: &struct drm_colorop_state iteration cursor for the new state
+ * @__i: int iteration cursor, for macro-internal use
+ *
+ * This iterates over all colorops in an atomic update, tracking new state. This is
+ * useful in places where the state delta needs to be considered, for example in
+ * atomic check functions.
+ */
+#define for_each_new_colorop_in_state(__state, colorop, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;	\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))
+
 /**
  * for_each_oldnew_plane_in_state - iterate over all planes in an atomic update
  * @__state: &struct drm_atomic_state pointer
-- 
2.43.0

