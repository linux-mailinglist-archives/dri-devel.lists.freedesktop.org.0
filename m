Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98346C5FB46
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB40A10EBC8;
	Sat, 15 Nov 2025 00:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yUb1gajM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013063.outbound.protection.outlook.com
 [40.107.201.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2D610EBA4;
 Sat, 15 Nov 2025 00:12:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVzesQXbbKMcH6VquIggaJxQF5jzH8MFxjXLq+ys6pmTd2ZETRI0PxmdBuUH6JEMSK+EZGuOkPLrZ9VrvebcEwscNOjedDXyU7/kJ65AD+6ibLRJ9OCpjNNOBB6X+YcUhFUDzOPyAXXOXKPL8thMzRXj3GLY1Mlf4EEB/G6yOYggWC1i5aSC+Ak1cTtTyMwtysc/wA/P7aYhp5L9iANS9cykd8pUlEJIApugTiP/h/dKs52/GxembrHcovRhJWO5w0FYDb31An5mVgv0D4VQfwnJdD59NHz5K+XF84zyzAMueuVQCQiMncEhbsNoT8fhUpQXq5i5g7WfEvmrAe0xAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=574KmEhBdgbF23fKdtHZj7VH0L4c/bSnEpnpwr54MTw=;
 b=efZjzfSVhmkTTfyWrRcylWv2BPDcbqpN+e7Ug2yDqT4c5wfnxEdcuQD+Z1U2YiHSLRcztQiaRBQD9m3vCB8hY31ZSvBYhPcrNj5F5DHL0wwOUi1D0CYaD731q4HKdQENDdLZJ3p6o2B1CkihFe4AUbbd2lD4SI08Pw0DGrhY3ddJby2RoZ5KUGxmqBNELljtoJSuettDgM8fB0meN4cYGV8rVGfTqgyCxbcT6/WFHd5ecAkf3mIqrkTQiFgsMU116P9V28U3e8P6gBiFMtdXrmp/oeSM828AQltz9hu3TMvjdrm5rSY2zIkisQKPvfhfq4tGhmMXEeYXMQRtQCmifg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=574KmEhBdgbF23fKdtHZj7VH0L4c/bSnEpnpwr54MTw=;
 b=yUb1gajMpx/7TjzcMzUQ8rqRD0btD39fQ2cjQTxhYaWKPP5CNzKdSPHHh412ErW2GpchXfdrPfd8tXMQYz0ctvDcjlO1gO2edMjSAVazZdXs+7HGJk7btxTOj/sYnU0w9ESCH3ko6Vm7YXVv1FU5rrHyYWLogltWVHy9iUstsFY=
Received: from PH2PEPF0000384E.namprd17.prod.outlook.com (2603:10b6:518:1::6f)
 by PH8PR12MB6937.namprd12.prod.outlook.com (2603:10b6:510:1bc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Sat, 15 Nov
 2025 00:12:23 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2a01:111:f403:f912::2) by PH2PEPF0000384E.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:12:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:12:22 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:12:19 -0800
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
Subject: [PATCH V13 36/51] drm: Add helper to extract lut from struct
 drm_color_lut32
Date: Fri, 14 Nov 2025 17:02:01 -0700
Message-ID: <20251115000237.3561250-37-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|PH8PR12MB6937:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d8f80b8-1f96-4cb8-6274-08de23dba66d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FvwEFuFJuspANd8nmkIPO/U622oXJ5odC/QezmbXBl4YjQFGYggQTiwknok8?=
 =?us-ascii?Q?OJWNMsni1VkbGwawPXDoNVQZB/MI5z3iAd+HoGD7kq8hUVdtF7pp6c+Yumb3?=
 =?us-ascii?Q?gSKp8AlA5MOBwrCbOUfYZK5Hda5vbZsK/mCyQMaWkF6EH7hmOCkLvR56C9Jg?=
 =?us-ascii?Q?y4HaU7gaUTitCkCsbYr1R+baEJmc4dqolDJGVH3KKdEAkvxb1cOTwAcePCmU?=
 =?us-ascii?Q?/Rcclwsq2D++qFB8052FSdhDoDvKg9lV2lK3AaqlzvTh1ELgq66AkhOVJVqC?=
 =?us-ascii?Q?QJfJrWxbFMoUDd7cXfvTWEq6SJZ+0Gc8S6P1xsBLFTc1MOYWD0cF9mKAUaPg?=
 =?us-ascii?Q?2/vr6/6ECCvKAOmU3ZFt5Oq7sSwTIhhxbmaUJ5Pit0JNJBCLD2lCfd7GZd3v?=
 =?us-ascii?Q?khKSnGtyywxjjsi+AD8dCeb+AN8UCBAGDxKsUefHvuzjRc8298SQIldBP9j1?=
 =?us-ascii?Q?Agg/ZWCAiCDFlc3qJ9RoXFT6OGQu8Yjt/ZYVRBCazHC7Ventr5RKiGzIR2cR?=
 =?us-ascii?Q?WBcWVoaIcN0hKdu+Us+bEXRALrLuDO2Fy7lWDqjEtcWqg69tlgfF/aPPL1nt?=
 =?us-ascii?Q?9gRfAJgC1aPNXnHz5FBoAbCxvfOTOlrUPS96vcLpMwvWqqbB0x7O6NRHQFmT?=
 =?us-ascii?Q?1W+59dGvWDeUlcBnHOOASsz2fSGBkGSjF0zPMx/gQ9PjjcFRsW+XmiOHWV+U?=
 =?us-ascii?Q?UdX5oCUodFUKYmoVO6ndR1PwQqgBnQZ9m5pJywSpnnZV0Y6WegWEnLYZT6yK?=
 =?us-ascii?Q?oUGUhW8yRWAYg4CLH2NK/l1Z3APGb5Wvdy9xhlFx4qfysCBpdCMkwbMcpEG3?=
 =?us-ascii?Q?mWyFi2wibcFaAMwOYTLFqxceQHkk/6r6/KACLEnMq4WqHky1c4XWcyGtu8Gr?=
 =?us-ascii?Q?USa0IXXJzkZ7G2EVu0aTAYQnnMFGRFl1kg8XMOLrjR34G0YvSNdyY2pEKLLj?=
 =?us-ascii?Q?SG2NLH0Y8U2Uc/kx5lFsTZE5BESNnpv1upVW3TNG/cYBzp8Gcxu1Q58XY1oW?=
 =?us-ascii?Q?5qQLosrQpAwiHMb4dgT/H1QX8v7FRotmrViqDSu8v4NyKcfctOq0d2OLHb+j?=
 =?us-ascii?Q?U3oEchFmTQgkKjmlCLNXsfC5tRYAc5rzCPbsf7BsmwsvSbX1kV8cgxR2XA5l?=
 =?us-ascii?Q?+1Tf2sw90In+J1ajAlqtzi0DRESG+NhuSPGRa2LPzSZA6Ry/K3vvevlfr/LI?=
 =?us-ascii?Q?00jfOaGjssIo4l3NztMMEZTqIzAecZ+IPuAz55RmadVAgb6WnnD0sjAWUaXP?=
 =?us-ascii?Q?6A8HXFADjdy3lTwI/NyQuj+OQSLLnFU3Blul8peeN6bA1uE+cluy1AsfXYHy?=
 =?us-ascii?Q?FKEXd9t9X14/mpbLNPtuJPkA/koT97UX8SqefpKwyzJ3eMXMTGKGkL6xxhsL?=
 =?us-ascii?Q?xQ8RRfmLm7cuMQIYsKzOloOzPP5fIzwWrMLcdjmDCbTTSGEghrz45gcPvXEI?=
 =?us-ascii?Q?+gf7YgCEuUzI7E3H53fx7He4hKhiWZ/iV7ZLMGPKW+5qyYVYIFtnNEh5WJuR?=
 =?us-ascii?Q?QHiS0jc/iTQxr+3d82RWWekd0qpCe9+jyp/g9tkudpnCPRg8gCrqKOgmFg7v?=
 =?us-ascii?Q?34glo3aAqmWGXPJPU2U=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:12:22.9302 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8f80b8-1f96-4cb8-6274-08de23dba66d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6937
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

