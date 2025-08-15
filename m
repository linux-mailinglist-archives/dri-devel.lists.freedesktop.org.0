Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C1EB2777C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7A810EAEF;
	Fri, 15 Aug 2025 03:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ki5YQktD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA37710EAEF;
 Fri, 15 Aug 2025 03:59:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgWdHBX282b0e3NAQxg7XbzXVplWIeyvdRjjDbDcIhKcSONBm89+IJe9d7I1O7Byx1XDMG4xwW5T/lc1Zy/TyuiNGJ5WhSJ+4Py6GIknxv3PnEQb8xJ0lZRED71QFsjj76iyuyAs4j3Hh3hATTi8jSusic+I0pqYfB+Ty2uhbgg2oypOhkNu+iNJdxt2Sy/UUh3PTRJx8rDa9X1Kp32EQFIGBeky+REDWSzecsybvgoOBWBRL6Kh5F9DbLgJVG5ONCwJ14luwVO7OH+sCIYbhu5hG8yMwyJSMgKJsktrvJTPTlxDRc7xpjiQVSZL/UxwMO5ijNBDNRhuUyxYFEnhXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnhk2RuzCH/2wSSEHKXU3KDkUNNxXcL9vT5Tjm6SakU=;
 b=TgTNP6wzFsG6hvH152E6pY0O5b4fikgdumPETXjk2iPVsBN0Hd8zy8VaAtvG+s+prIwY20EU8VThb4vMJBGKBOKpKZhUeeSZvREVPATEBiwSKTFJKnaedqmYZhSPGRADbK5IAjiDslgFjl8fmc4aC89APhaxIKfEuDTwb0oImQ7XiTOBPpotw/sfEinw+d0V0yoEOn+YDravJgw3R6wcqY7l1QNTOKrdGl0nIsa7wHc9N/aNR2iumh81cgyc6yWJC3HLor0iRfSURbnYMZY7XTh4afMEk5YrBq6q6DREus8vXmXMHL6RGbyhw6uCFjKTHU9++jQeKIOsfgVdni01Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnhk2RuzCH/2wSSEHKXU3KDkUNNxXcL9vT5Tjm6SakU=;
 b=ki5YQktDTZmZ3Rj3BkImP5WPTaZtxzyrmZ8qbmev4iReDeHKprCzvSOptGZcNtCxmB6OEb/JH4NAWHs9ItC4wEsLJ18qjNcJeJmlQ4iWm5GvQbejPX8K8GTUcT7KY3QvAirPxwjPkk5tE38+aHrztLkeWNT/NJQMidD2ggzrOec=
Received: from BL1PR13CA0247.namprd13.prod.outlook.com (2603:10b6:208:2ba::12)
 by DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Fri, 15 Aug
 2025 03:59:50 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:208:2ba:cafe::58) by BL1PR13CA0247.outlook.office365.com
 (2603:10b6:208:2ba::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.6 via Frontend Transport; Fri,
 15 Aug 2025 03:59:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:59:49 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:59:46 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>
Subject: [PATCH V11 34/47] drm: Add helper to extract lut from struct
 drm_color_lut32
Date: Thu, 14 Aug 2025 21:50:23 -0600
Message-ID: <20250815035047.3319284-35-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|DM6PR12MB4171:EE_
X-MS-Office365-Filtering-Correlation-Id: c271fa06-6d27-4b3d-e9b7-08dddbb02e8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L02qTV7ZJBtFVq1J6h0Qawf+K93TfNXGt99/b/i3kN/5ncSOPnzrPyM4WfCy?=
 =?us-ascii?Q?Aiex1m8oBcpr/1SFPEZ3GD5XhGBmP5tFPSgABtq8FDUH0nRZ8ED0mBS6II7j?=
 =?us-ascii?Q?YPUTDVeoiiW5zAm4Gt9j4xuE8itg0A2wJ2vUzzPDsU1nPL+2CJnERuOAucIv?=
 =?us-ascii?Q?0vETVZK6VOKKru0mtKsTHJNwWpfeFLCRacjDiEm4j5TqpJxCWs4Dl0sA6BqO?=
 =?us-ascii?Q?FNI0N6AAlGdldr8h+VOI+gQbG+omRKcS4y8UyuvWou4xyrOWH0kp8GT3X8Hr?=
 =?us-ascii?Q?Ij3Td1NiN3ZxsUR+OwlAgMNi57mtlSBTshU1+nieIK/41UqGA/UitGjNICLD?=
 =?us-ascii?Q?LxGUYUCLlVV2HcGm2EF3yKo7R7TRzkDaRM7a1XHewd/lf8n0e99gN3TayUzr?=
 =?us-ascii?Q?u/vPnM25lSxm3rLVZbmhQr3v28C7x+dF/KILTTlt1JKE4fjZwUhqpE1bqXTm?=
 =?us-ascii?Q?SbiVJOQC29LJWKuMyykIfUYmAWAB+KVf6Y7bajqcaPwhXOhVtaEtnRMi8e7q?=
 =?us-ascii?Q?Q47JKjM/ANERtOorltLZgT1C6xw++tbo5nvNWJ8x7AUTbZa5W8KmT8yXs09t?=
 =?us-ascii?Q?PQntyA+EzTebdF95Yv4zhRoiJMBjCH/fBCYcZKYSp378zDXeVyl8/+r4TY/c?=
 =?us-ascii?Q?J2u/vM1CUlUG80VaJDcD8RMDmB8aKd4P9k+yizDCmX3IhCPY8VCMHdHgxrcL?=
 =?us-ascii?Q?jT35jLDrrflhNgkafyvg3jMeXXCOAWviOxJq8NFkKVZVoim3mqNsFCm7E4xt?=
 =?us-ascii?Q?uMd/uGdzjmMOrnvDgp3vx7bhUAl6Old/A4f9+PvBStAYWwqJq8PQWdfuUugG?=
 =?us-ascii?Q?GWRQQzc7AXo66Pn2swCEtwolaaAaR2B4y7pEve76CTbwIPVR/5OG8SKvCPSW?=
 =?us-ascii?Q?z5sbpIAjy3v3oKjqp2mHL8KImGQ1i/AHb1r8wiXgAJDVa+wmRdQi/pnySnub?=
 =?us-ascii?Q?8B8VsUW1859UJIj9d7N60s0GlyQDPEYm4jQk1jxN1kzzbuqEucsr9gyug3qz?=
 =?us-ascii?Q?EBbMqptdzhFSLb2Ks0LFFfoULTtZEOZowPqL4f3McQXiogozHjizxcLugRqr?=
 =?us-ascii?Q?0ADMrvnVf+USuIdW3dGbNd8C2uMTxEakB1DK+5WOk5c/VO776cGOebSoN6lr?=
 =?us-ascii?Q?dTZsjvEsP3hGN8iQ5ySbR6sF2eLBUKZfVI2l0fdYKvDRbpkDNsq1EfLnUwXh?=
 =?us-ascii?Q?17lK6A0BC8Vi3oNz+QQsVmmVAhMeni3ayqzprjyK+vSMrb1puj4t1io7KxrG?=
 =?us-ascii?Q?tTAVj4ty7RhbMYEDW5tX4LnaQHkkNSXGucK1Gg5xAIxRT4pil0pLIt1cjWqg?=
 =?us-ascii?Q?o4CedT6VQvSGbmL5VchA2X3rE8wOT5L7EJF+ViloZIVedBt7daR/ahcH5WKK?=
 =?us-ascii?Q?ZMU4tsZO7o41vs6y39Sohq0FoMHf+Y+gz256HkXCkRqfe2DESsbNJRJZV5aa?=
 =?us-ascii?Q?SiaEMYvmmc9t21wug7y+hhSwxqCQxEeu6jhgJAI9sDclEnrEeBtRga97CfvL?=
 =?us-ascii?Q?oMcEuUkrlvuUFaXvl2lH9PucuCgklkSjFasP?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:59:49.7620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c271fa06-6d27-4b3d-e9b7-08dddbb02e8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4171
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
---
v11:
 - Include help function drm_color_lut32_extract (Uma Shankar)

 include/drm/drm_color_mgmt.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index c422f352a150..90210bd2f5bd 100644
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

