Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0004AADC05F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8F710E5D5;
	Tue, 17 Jun 2025 04:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T6gbG/Z2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68B010E5D5;
 Tue, 17 Jun 2025 04:23:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cuUPNGsqDQpBi7EFuNjYbQH3/uLTqe6GXhyPWGGlws2jHN9xEUUnTssMtv7dIPI6sGH3zta160CnDdy1QANPQmYRGlnlvbN7036GWpdb53Zq8Azcw7j3NiwO6K68GPW6AsS9g/sCP8SfdX6zi1myYDXJAVgtfvgknNSPW9VGPR+wyRDZLsIkcbMrUlhtprOQJa/PfPXmOGwhBJ2y6cacm1NNCAR6ag9iG5QbiDifR0MX/Tthr/LPnuwVzwCGOdu1EYI2pKhpzAp/IvMq02Mpjq81kYCWZ0CTLW/CNbJ7cxUMC8usCXBfxhsV3OyQW6ZE2Uv4XevzKVZq7h/V3WJXVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eq1UTx+LqMwM0hAbOsjwbRYxDpRET+0XsCnASTCr+oQ=;
 b=yKzP/+9Q7TMWSRLRWf/SzHo2MI/6V/+lw/VgT0BkVMmP+lVsUwj9rh9ZvElr2nzmq1gRMB9V8hM1rz+EIw8cddYTKObylS3MSrmp1j0PI0PJDIxbJRgCYFcX26922G24WpUob7XSZgvW6LF93tx4eM8vxJz660c8iu9NEeeV/7xn4PgG/1Ow3Xx1xjnew2AniNN9C6NjMwA+ICUCLiAQ2Rl41LlqUvBhSpPxGsMC3dEgacz7T2UxJf95vTca0gR/NO39oEdUhVYyPt7FnC1xaj0bNEIwMfYeHYB1ZHVDSJQmqEyC5WfRfzpOhy1Q54D7/qhNe/yIMEIn1uYHjH7SxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eq1UTx+LqMwM0hAbOsjwbRYxDpRET+0XsCnASTCr+oQ=;
 b=T6gbG/Z2W4bAX0w4wAPx4nUWqQa5DQ7cA3Z+sWeq5C04qihT43indDayVIdR8WRZsVBP/iqYxq5uyvTxk8bnz2EuLcuZBsGrJlO4QgRQlw0cZSF+qA7Bphp1tsdJZoX/2X7UADNaq40tt21PSXQI4tM7TB28kEogsrK0QYI5Z1I=
Received: from CH0PR04CA0049.namprd04.prod.outlook.com (2603:10b6:610:77::24)
 by SN7PR12MB8172.namprd12.prod.outlook.com (2603:10b6:806:352::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 04:23:41 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:77:cafe::ab) by CH0PR04CA0049.outlook.office365.com
 (2603:10b6:610:77::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Tue,
 17 Jun 2025 04:23:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:23:40 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:23:23 -0500
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
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 22/46] drm/colorop: define a new macro
 for_each_new_colorop_in_state
Date: Mon, 16 Jun 2025 22:17:04 -0600
Message-ID: <20250617041746.2884343-23-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|SN7PR12MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b906401-e21f-446d-c093-08ddad56bd2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q7jR+VGy84d78YwtriQi8So7YcXj084GNJCYhZDJMrm0mhtJKMQupObl0aw6?=
 =?us-ascii?Q?AKVpRo9bN7ybahjr6BxN9Drc+gN02z6k3vggjl9M5IeRYNYb5QQsciWDgX17?=
 =?us-ascii?Q?25W4EOausVK0b1r8xkjxvcEGk8kJuvGxnPtkhref1wKz5q5ERVADF3BQe4c9?=
 =?us-ascii?Q?TQ7KZUkBXl6epsfp/mNPPNuTRK5sp9Nd1eZxyA4YscwtgE5BXUFIUupB1hyF?=
 =?us-ascii?Q?HZWRcNwIbaBGeKFO3d9Ll6NQZgfER6jmjccmtCWdBsB5Garemg5cORiw5/+6?=
 =?us-ascii?Q?NhviPXrNsq36snsROQBwRi3HFS7XY/m//4hHJCN3jlNn3+VPjjdhc8AsOV2r?=
 =?us-ascii?Q?Owf9uUbW7FGA2r68oa2eQQIl9P9pKzmsa89rZdg1vq+xIrcDydROLuO1WoUe?=
 =?us-ascii?Q?DqMLbNUbuF2DOkdEpfY58j3ZlDRRK2ehsIQ5OrBAI4knnsh7nt5/wUzBwk+x?=
 =?us-ascii?Q?tDQnMeQVt7ZL/6vL6cEWOJYzbuSy36iBXzVkhX5GUgAQWf23wb62H4A7nWE0?=
 =?us-ascii?Q?WaucUDxfgjAQ97eO2bVGUoMF8pfOCEb4SetVis+lp96G94Hw0t/0tslaOA8T?=
 =?us-ascii?Q?UnQEfND4nwXZ/XroDAnsuYRFHINcSWG6CAKQjL1a0LESkTj0TWFoFAP1S6Rr?=
 =?us-ascii?Q?+wcD4gtmvfu8MAO0kZW+dS8T7hwjhh67bW2QX6LPxcx3ISa3S8++FV9FG1XM?=
 =?us-ascii?Q?yRwqFhHDOaB6qFhi7KAmT7O2lOLYykAXDIeh3MC7srpsGfWXNQpMIFOwNnVH?=
 =?us-ascii?Q?9w2ve47/PjI5JUy2E5FQYcrixm9yD19nsaFbXXE1dNd+5vBoG4XU6jAk8+dB?=
 =?us-ascii?Q?noQGwnrsKZOk1eXnlolWW8LAPPS69Ls3I4YN12SnlnhLqbbR1+P3uWOhSrji?=
 =?us-ascii?Q?YuNnaayS+euW0mAgY2+A9uMxGdoUhBQPYM8sZD28h+lSjvPUs9EA0E+jC5Iy?=
 =?us-ascii?Q?oUwx6T7DE2cL3gJdMP9WBRx78HwXJ4Yy85tTBbNg21OhG4dXQBydOV+RamRz?=
 =?us-ascii?Q?GMMBNiXTL9pbT7M1dfRt1K7JM4feQATE3nB6FDk+Fx9X21MuOc1Rh4tYPdzd?=
 =?us-ascii?Q?wLXNvYBYI+ZfTcy8H6r2j/ud0MzVT/21RLlOFOvduItamayZfJRWtXDxKtmo?=
 =?us-ascii?Q?FKQrbOL3eXDJ3zpZ94KrWjHMog5agqzgJJoVPO+QRUn8CTST2gA0BhpaClPv?=
 =?us-ascii?Q?bZmOSd/YGtZdNTIT4jw0mKvnmIxB9Zwrsm8BskDNbSRNArGHUwH6HcvVvhN2?=
 =?us-ascii?Q?KuH69aoZkt6IiFXtTrIvQ8Id3NjRGuhrnyJsI7E+SYUKSgLu8NOImbafgNUF?=
 =?us-ascii?Q?LYl2tktHRXboHmcpqN/zCsR3F/0Gbn7rrhJtvQkrESYoOnypTy/EUXNOgcl3?=
 =?us-ascii?Q?d+Uy9hV1D2owBIa2a+7xNXwStio3HEwJwTa31U8b6Z8SyFqZuzjzuetS7tvR?=
 =?us-ascii?Q?7gKoc+9lTpAT+BfGj91+RElPZfc7ITzzEQ4KME9kXN52uyZptGbPP8q++ACY?=
 =?us-ascii?Q?fxEGI2Pv0/9EU7oDXFS/P/y47W+OgH0f18QY?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:23:40.8745 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b906401-e21f-446d-c093-08ddad56bd2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8172
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
---
v10:
 - remove duplicated "is useful" in comments

 include/drm/drm_atomic.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 4a30ed8ab1a8..678708df9cdb 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1069,6 +1069,26 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
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

