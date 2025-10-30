Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1C6C1E49D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B4C10E9EF;
	Thu, 30 Oct 2025 03:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sB4z3N+H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011004.outbound.protection.outlook.com [52.101.52.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4320910E9DC;
 Thu, 30 Oct 2025 03:53:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=re/l87Tyri/AcNI9rdOREEAzWGbZfOvFGaEK2d/kOpDI+//0ppV4lHBVGTDQBE6ksnYfg3upipnawl8535mzaTK5+DQJaPVolKyHAVInYNWWxs0W+3OrF2bjrGoK/n0kEpfZmPfJXKCu4DtKXeBTtGP1HL7036/x6+Qz4oHwInFGErbVuk9iVOtS0DxcVC57JFMpDTdfbHbA+ZruwdsqKLodJB4OeC4aExzKhnnZZxUC/VKNS1dWp2Y1R8yS4GhJkTKr5rH7qj+LA5kXpPlhzuRCTuUV8CzmdRlmK6TivYMyBFAillc03yqCcdKhJ+A4QBfjPC++anQb5e9o5LRo8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=574KmEhBdgbF23fKdtHZj7VH0L4c/bSnEpnpwr54MTw=;
 b=glKigZ0l02GcvtGOEAnNivDZBW4s8eH3rZ1kfrPb6+y6r8a5/r1ErgTC2HVipgPqa2uy+XewAdOM7Rt85MD0TJjsHLLUO9KMhE5jWcwfsZNhEIuuG0XC9O6jbgavSQ2+qaR7EObkvYPdTZED3zs07PNd5zIYfBHzylvgayW6MGfJERvTSQ6uP79ynyyslLlsCqdqhqhHBwy1ZKg7RhYgV5IdU4OTil4vvO3KEMvLUVF7wA51naP0/ETXZWCf8quJzjIR5gEqN6onAkN2SYxJ/5O66OQjC2e8g42Hclm5N952S+FA1PJ/+/nmHezjWZBlgiLZumPWAHSMVpefl/h+FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=574KmEhBdgbF23fKdtHZj7VH0L4c/bSnEpnpwr54MTw=;
 b=sB4z3N+HrWlZ07NTfDy7xF0gCiD/+JlZ8WSHCJ/PjcxReLpOEMJiGEZeCneSR0dtnBpEV/ZJdx/KdXApzxmpl90NDR+BHZwcY298rDG8Lw6MU7ZR1uvOcV6xkkRHV5PwOZlxoW4+TmysyMGrpKHgtjbtnf94ywFuN9+rBWsl87M=
Received: from BL0PR02CA0128.namprd02.prod.outlook.com (2603:10b6:208:35::33)
 by PH7PR12MB9126.namprd12.prod.outlook.com (2603:10b6:510:2f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 03:53:14 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:35:cafe::41) by BL0PR02CA0128.outlook.office365.com
 (2603:10b6:208:35::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 03:53:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:53:14 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:53:10 -0700
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>
Subject: [PATCH V12 34/49] drm: Add helper to extract lut from struct
 drm_color_lut32
Date: Wed, 29 Oct 2025 21:42:39 -0600
Message-ID: <20251030034349.2309829-35-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|PH7PR12MB9126:EE_
X-MS-Office365-Filtering-Correlation-Id: 11937d3f-b7fa-4b7f-1253-08de1767da0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GEUZGe5d6SPiF78Vbp9agQvuU5J8+w+p4ghpIpYMR0u698zseGagpL4BtmQV?=
 =?us-ascii?Q?MrRnyZa2TnPM1qmG4yOg1F66wdyZAE43BDTkU1W/PiPmEqMF56XiduSM/tf7?=
 =?us-ascii?Q?5wOP9iaQ1HpRFhvwJmiE4RlUlgILzU43HBRHaSrNQqh0vTBcsFMJuwtMHZdA?=
 =?us-ascii?Q?EN14ibOLcyziGa7OiEnRH07hRguful1qynSeXJJ55nzaD8ANLyy7tqE5uCI0?=
 =?us-ascii?Q?UEYTRUIv9WvRGsDJMXxDtsNCpieKBQdRBg4Tn6YQGaS3Bu7hkUihxqSDaMwz?=
 =?us-ascii?Q?s3T+R8UUbFGD/yFEOcuUbgqQepv2KBoelUsjLlUpxIFzbPFWoIutCRcgfH26?=
 =?us-ascii?Q?PmSYR0wFM6mONcqdCrTCk31fM6fs5tYAqQZbXsblmxQ9+8lJ0gqAdvY57MEy?=
 =?us-ascii?Q?5s0G9ko/0G9KCuFTX+IH69yXmdUrUwyBc1VfpuoH6V7/mGDB8jeb3W+h8Dr+?=
 =?us-ascii?Q?lMEU29HF2UiUYC6OU9zTo/CCg9BvCLadpTXkXKtyy7WbhC23mjf14MqENOkC?=
 =?us-ascii?Q?EoNmuurpvlSLaBnqryVoTCYSUIe7FK1q00d4t1I01u7N/2Kr80lrLXaWrPAS?=
 =?us-ascii?Q?zCaBhbWnyBZIbMNg8PcSVln5Bl5VEnw55FEWvhAWyYDn6Q+b6bRTP7NBvkpl?=
 =?us-ascii?Q?2hJ3A4AX6lfeAxadQ9tXC0jIVe1Z7tYmWILBFvxZE5Y1K9bFTQ+hZvzFLQxa?=
 =?us-ascii?Q?1vfthEofCJHHWOraGChoYg23Fx9tD038ROLptoa0lePQvEBzBgHZj9lTWFkz?=
 =?us-ascii?Q?AtXWt3pMSHjJh/04Z955sepp4zc7/4JlDbgyvkmzrIQ2M1AhqT3aYk8sCHY4?=
 =?us-ascii?Q?JpkJ+pL1KhTXlCdf7xCSUfstAyhgD6nE4EuvvcxDVtqmeWfAmPSXaFZslE2c?=
 =?us-ascii?Q?zrWJISft4sYGLTsl4MEYhan0E08f44lNOncVc3G0RnUGeT4w8TEjYh6Qdfgo?=
 =?us-ascii?Q?EK5nk/krkZ1qpYUSDVvnARETRwu1q5qxWCT2HZnd7hsDp4XoZfewLbZz1pka?=
 =?us-ascii?Q?loKI2buzqS6X7AIeSdmO0x1nlZMJq7Yk480N2c9ix1ukqs6neBANbXjBQIwa?=
 =?us-ascii?Q?hwofi1QEt1UpQvwOBSMwLOr1r2vJwcKefbDXEcPZfFXYH3Y2c0Vkzf6SArud?=
 =?us-ascii?Q?dx08sA+79fFvX2NwPXoXB3DFsC3mwZQBEGVNODSBE7KLEuhbuNJC0+8ZrzCL?=
 =?us-ascii?Q?2BUUumL+ly4j8Hr/hSMjEeX96K4mP6R+H221IEnn6t1IzeD7bwWJfBjeFYVU?=
 =?us-ascii?Q?rwbkQqOSgwUuvHYWy8p0B4ngT1HrWEh9ExOiwlR95CS+e0EaO+8flkUuKEdd?=
 =?us-ascii?Q?wbgBU0FMKbzZpkNljiNtrY68PrmJI2HxfUljJVoXGhtuTXAzCitNHnVJ+OJo?=
 =?us-ascii?Q?o/raOIPBuXAaH37BVsMkBsEe6sRTrq/upGIl77Sx9ZKY48zjIN09WOZhLhlE?=
 =?us-ascii?Q?+YC9h6P16+m+SlhsLiv15outw2gfPFYsDRjDwETGWnT7u2U7XsSftCdRpdjS?=
 =?us-ascii?Q?OHrbHl8ett80+hibtA5dfN3HHqE3a0Q/M+ioNi80OTjYPSSqitWwreu/B7y5?=
 =?us-ascii?Q?6xybY9chaiqC4nUBy8k=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:53:14.0048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11937d3f-b7fa-4b7f-1253-08de1767da0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9126
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Add helper to extract lut values in 32-bit precision needed by
hardware.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
v11:
 - Include help function drm_color_lut32_extract (Uma Shankar)

 include/drm/drm_color_mgmt.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 527582c20885..5140691f476a 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -50,6 +50,22 @@ static inline u32 drm_color_lut_extract(u32 user_input, int bit_precision)
 					 (1 << 16) - 1);
 }
 
+/**
+ * drm_color_lut32_extract - clamp and round LUT entries
+ * @user_input: input value
+ * @bit_precision: number of bits the hw LUT supports
+ *
+ * Extract U0.bit_precision from a U0.32 LUT value.
+ *
+ */
+static inline u32 drm_color_lut32_extract(u32 user_input, int bit_precision)
+{
+	u64 max = (bit_precision >= 64) ? ~0ULL : (1ULL << bit_precision) - 1;
+
+	return DIV_ROUND_CLOSEST_ULL((u64)user_input * max,
+				     (1ULL << 32) - 1);
+}
+
 u64 drm_color_ctm_s31_32_to_qm_n(u64 user_input, u32 m, u32 n);
 
 void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
-- 
2.43.0

