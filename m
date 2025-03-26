Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8369CA72771
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:53:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B606510E7E2;
	Wed, 26 Mar 2025 23:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YQik1weN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07AB10E7E2;
 Wed, 26 Mar 2025 23:53:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3+wZ8aNY1xeh71dGMxKnIhPh00ua1qcvEjA4wcDHOYGsxynaBvozZxR31fIOpnxINfH9Ts7KExcsrp//M1Ls5GE3P054N5g7Lv9/07fFZXRRr+akcpbgFlPKUsWb95nMbVwH5GHrz+ryRcApxP85K2TzKXiwsVDsI3SQLeuTjT2S6ezFhwasSPpumuVC2eKp1769u6st6QPglAJDOoau8DavKnZBDI4cG3PHXh2XdIXgn9CDzAFoH8BEGxK7xdmN3/5z+aTvhEMZ6TXm7r1BH3IrXWQg4ED4CZ0dfMjx/pz7MmsMczCZc1E4hy86EGBPhdFFyWXPplezhxZ4mmCYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WE2mdVabXNeHMJlqT3vuR43/48m9JvwCOFYeFBxfhLM=;
 b=R5wsFrZENBHVqQUEvm8Y7NoCDz2nGiD7Gybfe1et++vPPZCA2a/EcXsc01Fl+g8Ey6HWErYGkV/TC6G3DpcFVJSusr60Krlpt2hL7WspNP3CinVGwn/ts6F0zAcgwNvNBA+5BnJiHuCRVi4KyHzXY/kkp/i+I7Uhw9ad6mYmjnix9OCKDfJiEzUQm5RmzPy2voiZVTAURGHIhqRgoFjzuVN6AyMSHUe188NxvuD5Rj/19iGua/DvJgOGGGKVIilWn1DS9rFz0YFVYaPBPXro/iKgk5SqK9QREBDiROhAfmas8W4dJVmR9Da2J7aB1MWBMsR8IT4x4/FBPrXsNrx20Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WE2mdVabXNeHMJlqT3vuR43/48m9JvwCOFYeFBxfhLM=;
 b=YQik1weNW3AY4zKGca8+XyxB/IxoCo0mrlfqSCw89mgktA/GyX0pqCk6PbfQ1e6VMu8voJENxkzz4LQ8m7dNxC2ersMuPfnzrYNpmURAnLeEN0ICVKhh268TvzZwAwNBpyQjLEsNuXEEdtYVIBJMDw9tJVQbY6fFNpVqMnQWaWU=
Received: from MN2PR13CA0020.namprd13.prod.outlook.com (2603:10b6:208:160::33)
 by DS0PR12MB8218.namprd12.prod.outlook.com (2603:10b6:8:f2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:53:34 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:160:cafe::bf) by MN2PR13CA0020.outlook.office365.com
 (2603:10b6:208:160::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.37 via Frontend Transport; Wed,
 26 Mar 2025 23:53:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:53:33 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:53:29 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>
Subject: [PATCH V8 21/43] drm/colorop: define a new macro
 for_each_new_colorop_in_state
Date: Wed, 26 Mar 2025 17:47:02 -0600
Message-ID: <20250326234748.2982010-22-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326234748.2982010-1-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|DS0PR12MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd50d22-1f77-472d-569f-08dd6cc16b3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5LX7WDfUZx+yyKST/wtPsY38omTrg9Cd1/LhXwZcWeApoSkBee4JE4y1Rg92?=
 =?us-ascii?Q?v92Xqnwl0Ar3KVYBaHzEb31lwvUqQP87mARCQeGTaicsAR9Sdl9/49O4sdyv?=
 =?us-ascii?Q?W7FMvmrqwzqm3fYWMRD36thJ1u3kdG6U/JoFZ6sHDWSnE87YSSMHSPgBKAaf?=
 =?us-ascii?Q?mG2XK7Lf7n36Kt3s+6f5Eg1Xn888Fk/ss23CWVborZcdEVdnBT+bPdV/mD56?=
 =?us-ascii?Q?6y/iO7670acvOCBMAwjwiPn0S1Kj2QbnqFCsRagyOVOd+cypjNVEpOHSZtf3?=
 =?us-ascii?Q?wbG65ASreIOboY4CPtSkNjIUhtBf01EgEPnY5/h5Y9o7OVKyXopOkE118rZe?=
 =?us-ascii?Q?sb0vdl2OFhVOGHzNTAHUuXaUT8tGZ7/K2P5xAKqSwVMCwkUxQ+GgKDODWQEh?=
 =?us-ascii?Q?KcbciDC+bAJxaEK83rEZ03GbN0GaoWjmtEikLElJcGpJBgSbtsP5cwwFwDW5?=
 =?us-ascii?Q?gNF5WIPUKShvgJ70icjHVyemuptFXE5MQs3bNzBuMuoKhHe+w6raE1SdIXPd?=
 =?us-ascii?Q?iP96h4mW4ytj8xTZzAK3/eOHx2yyDdy5dwAukO7bQnMmhlYsuqstvXaEc2k/?=
 =?us-ascii?Q?R8LOSJXXOgIyiLvxQ1cwu4D2FRZrsC35z4unbDzKI+HEBRUl62lMhQRsQsG5?=
 =?us-ascii?Q?e58ZKzoIN741ML8wYPC6ANkaDoTyU1WUSxF5l9yOJ02v+mt58mXPbWS2CLOL?=
 =?us-ascii?Q?52ugt8Ky1ir3rt55YSmliCDmRzA7BNBeoejcK1iQeu10s2uQssMe21SqRfNe?=
 =?us-ascii?Q?l8xJbNnuvovynEPW/RGrlzvA6yiH0MhE96wi2hiqWETdFSJsCK/vMUhaDzqr?=
 =?us-ascii?Q?Eq9BMAdyhM7H9FrWJQV/8GV/iEGV0osMrSFV8SsHBDYXhZb/iIpOPa+tKbj2?=
 =?us-ascii?Q?tjVGQVBxGYifxlpUvU13CPmZwop56+oN3EKv4aUKzsGq+7eATZl5PVqthdr6?=
 =?us-ascii?Q?AM6eqAg+8Y503eXYJ/96iVkrhcBGMDHDGh2w00v9/RCHrzEPNW+2GTCqTn80?=
 =?us-ascii?Q?AumvaKY1HRpuRapEUEDgR0nivM3TNZpOFcQhLWNKqDQfSyU8zCWR9KV3Z8gU?=
 =?us-ascii?Q?8zrGECRH9c4eUkbOKcSLqp3yqrvlBDRYEkhXy8i90nr1YFDdKpIbNHYjv6UP?=
 =?us-ascii?Q?P9L0w0Zj6+Yw3qbcx874Tk+SaUORW5efVSmnusaDK1tgHEonPWCPr5ZtJEKC?=
 =?us-ascii?Q?PLpB/oh8AZrP2d+xOnvrO5zZvqFW3efSTTTmGv0QBZmsvbwAxLXK5aqZ4w8G?=
 =?us-ascii?Q?nTUWj9AP9aPAxwSGns2GjvE0Y0SgMwN+jqf+q+H4/toO8hHplpyFzlrSIdjO?=
 =?us-ascii?Q?YWw8NVUArHN496ss8OcOu1ONTwoDgRZSN7ajHcuJXJ1l8t3EV7+lpoH+I5dE?=
 =?us-ascii?Q?8kkFwgm3soRGI3B3hxifivZHtrcb0oE3qmL2jljeUcANnS4gJyVjiDmVtVGK?=
 =?us-ascii?Q?BM6a1NLqlBnNdTNozuL60hVn9P5EVg5VVdD0U8FkINa3gv+BqsPh31xS1yFy?=
 =?us-ascii?Q?CXSvPakzS4BLGx3av8gWxRlFzzMGnXkrGNWq?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:53:33.9614 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd50d22-1f77-472d-569f-08dd6cc16b3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8218
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
---
 include/drm/drm_atomic.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 2b088cef946a..266b2e6d58ea 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1066,6 +1066,26 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
 			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))
 
 
+/**
+ * for_each_new_colorop_in_state - iterate over all colorops in an atomic update
+ * @__state: &struct drm_atomic_state pointer
+ * @colorop: &struct drm_colorop iteration cursor
+ * @new_colorop_state: &struct drm_colorop_state iteration cursor for the new state
+ * @__i: int iteration cursor, for macro-internal use
+ *
+ * This iterates over all colorops in an atomic update, tracking new state. This is
+ * useful is useful in places where the state delta needs to be considered, for
+ * example in atomic check functions.
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

