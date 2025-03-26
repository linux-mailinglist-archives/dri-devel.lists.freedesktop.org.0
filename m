Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B8EA72770
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB22810E7A1;
	Wed, 26 Mar 2025 23:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UcrSmxUw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061.outbound.protection.outlook.com [40.107.95.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B561310E792;
 Wed, 26 Mar 2025 23:53:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEMrwhxfXg8+LbLhyNVkfpNtpLCb7vU+8jKjT7ViF/+NV+mZoVkavcuybT5KHvSM+yAxDv6aFv0YaHrVRpregJ4z9tUt2csWYp67UVypO6kKG1TUH4KQXkoaETWERQEz5ryZJVMuL6wn4obydkAlVz2mZEuO6jeNiBVt/dj60dYDx8b48gCaMZBH4rBgTpozB0tmVsQVX1tTtmXDoWFINFkipx0jVMBpbryLSGn1qdXSuWE9u2KWRZDTApmCRYukCqEg8FMJn0Ulw4iwqaZYwzcR8uufloaVpSjIaxHvZYYA1hkSplScuUIr285Q53j8LC/61VI1XOpHJS7KhbkF1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJzpWqOCMbY7FMRCwJBp+UJlpNtnL/QRP8KlU0vqkkE=;
 b=Rk77BCphpTNRaOd4R6TMsCrzIH1gBGbtn8cswwhcNMJKZACbK5/SmAIhk72OvCbTx/2VjdUoFzIxdj19Uo75z3YNpM997DxootRXjJ9Y/brO6iEJ0I5fkICuuJARevLitJn0DxzIxX1Q6szxj9npfyhxkUXOvLfgXxDLnh11LSY29oc88wq/0O/Syf5XMwjT09h0nmQemA7sHbfTbIkMULcdcF22+TxHdoxGnJ74ZOZwuBn6vnckL7XqpfKKV8+6xWb86hvcGP1Tz94RzSt5geUOjmLYl+bWVXEMbNKxGJmX01b5fwHovqGkvibNzJIoycu7yENh3rHP7GcIIF97pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJzpWqOCMbY7FMRCwJBp+UJlpNtnL/QRP8KlU0vqkkE=;
 b=UcrSmxUwqjWh5GDrk8PWok3VzdLWw2XN/gPZQisKT2iM2B4i8a0mbMJkFKXsdE0iWX9QyOfFh/RJhTQfzQ1BdR2rI37ndi8s4z0wLcGsrQZbqcTj+rEmTgMBipdNe6AP09ktmqhhxHsHvsfoan/sgz6n+mo5IN0fVAqoiSzVVKw=
Received: from BL0PR0102CA0036.prod.exchangelabs.com (2603:10b6:207:18::49) by
 MW6PR12MB8867.namprd12.prod.outlook.com (2603:10b6:303:249::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Wed, 26 Mar 2025 23:53:18 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:207:18:cafe::4e) by BL0PR0102CA0036.outlook.office365.com
 (2603:10b6:207:18::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.32 via Frontend Transport; Wed,
 26 Mar 2025 23:53:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:53:18 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:53:15 -0500
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
Subject: [PATCH V8 20/43] drm/colorop: pass plane_color_pipeline client cap to
 atomic check
Date: Wed, 26 Mar 2025 17:47:01 -0600
Message-ID: <20250326234748.2982010-21-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|MW6PR12MB8867:EE_
X-MS-Office365-Filtering-Correlation-Id: 77d3bc04-967c-4e6c-42dc-08dd6cc161c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4x2V8EIdR45UOhmPT8gLkdhzErPAsR5xNAjHQ7mYeFfKFLY4TLIPhOs7Jwi4?=
 =?us-ascii?Q?5cRklOhgRP55cYHUJpJuq9JsA/bflTHjkb0WH5AJWcuIgNLSGIBcbJLOaIG1?=
 =?us-ascii?Q?Dss80qWQOPh+GwcFKunGlwEMZVG3CrPKBqTLb5I44qkWmTvTkzdlpLxCPLce?=
 =?us-ascii?Q?70c34v8r7lXl7fsil7tLdbtlK/DKuWDGJwYCKih7LiXojfc7TemkkAfIkjDP?=
 =?us-ascii?Q?8QBUj2XrK7BRBKIfjgIPYHaCK4epb6Uocbscs6lhgsXvR/6adjxWVL764DRk?=
 =?us-ascii?Q?J6HxJAUxRmH//lnGR5WY9yVR8lJRqjKqG9cy2sZCek/vNoDyh/Cxa1K1+jcO?=
 =?us-ascii?Q?fwfHDTups9Yq35MdN7n3K1bBHWJhFIIEzpCqdBYFepv9AxrSGwwVMBih8+Pu?=
 =?us-ascii?Q?P9oXEsGBlPgj8Y3AU+awKEaMROuCtKrZwaelOKTYuxBXvq08zVOQRilB1G5C?=
 =?us-ascii?Q?aaHRViojammnZ519HjEmToXb15AsQvr4v+h6cZ+RqmIuMEOFgLmaMy626MQA?=
 =?us-ascii?Q?9Z7EgbnfTVwNgoEu46vJX4WmxLusLagwO8ZOl2OwITAsX7T4CrVIfMNWHkqC?=
 =?us-ascii?Q?yAmQ1WJwhHGe+DG4o3UtrEsGcxlZvm1aTYb2aBpfR8VFOmAGUDQniW7Ct8P7?=
 =?us-ascii?Q?Sz4061+iZT3QwHaOzfby8hF9q7xN+KAl/VZOFAoMRxxuEhDl2atRkqilh5iq?=
 =?us-ascii?Q?MIYp2NkU4TAAkxnHUBFzu6ZSUc/8zVdt2moUsr2AhYtmVvNm5hVSXn0ZSpM6?=
 =?us-ascii?Q?xQkNfHPqKBRi1hZQNLt7zk1Kb1Tz1rDS27Hfe1L35txJECq6xItetqDIQ1IC?=
 =?us-ascii?Q?Nf/3rwY0pmOSpgJ/P1hoJ6Q1OZ0O3V7Rj9b40W5kHd3P19ZK1bHe8jjgSw5O?=
 =?us-ascii?Q?mzRs9jGg1n/YrnhtCU9q2LB3xyBO20ryO79nIhe2kVbom9Kwp2I5lZ0Q+5lK?=
 =?us-ascii?Q?iIqq6zOU/ITPB6b2jlH6mPMX/EgxWUz1zMOJ0vTsBKidi4MvoJqbh0YnDFdG?=
 =?us-ascii?Q?/TY1Fn7TsRv6+z15U/LDT3F5tEJdfp91Xn2fmNK+0Knol6Zp4u63XAi4Vfi1?=
 =?us-ascii?Q?lpP3qCoCOOjeP1d2xSYVycxHPAoZ5R64blnaLgb/tIlR/j6zZrmtn7lSouY0?=
 =?us-ascii?Q?X6n7kbRUKG7l1SX1bvZ/sZTuBNMSjTPUJssJwwPiDzGzE34p/S+LY5hUmM0u?=
 =?us-ascii?Q?aRYV4XCGFR2bHmAjxgMVs1Pf7MOH9kbRj2he+ByOerlQpWnuiFaafBG7/Qwo?=
 =?us-ascii?Q?a2d9eVXWPu+5QjtNfcIwqRHRBw0JlC8gaOdHNxlbmuA6+M14t7mVt+QsJc8V?=
 =?us-ascii?Q?ajURMyILyKdVOXd3NdGvleL9RrwKOBeDWEkCW/FUAyeOpbFz2Qpe8BEtpbaL?=
 =?us-ascii?Q?oxyZNZmFrLLuphW26bPStU2zDAD3lNNKxmqo5qP5YsGVSKVpeVxdigetaI73?=
 =?us-ascii?Q?ScDtrFufYiNBOCU9UT0IxjN6pygOmLq3N/ljuApe7Lw4md5NyC8k9gFDwmkJ?=
 =?us-ascii?Q?jGRlqio3Uk0nFmo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:53:18.0840 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d3bc04-967c-4e6c-42dc-08dd6cc161c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8867
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

From: Harry Wentland <harry.wentland@amd.com>

Drivers will need to know whether an atomic check/commit
originated from a client with DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
so they can ignore deprecated properties, like COLOR_ENCODING
and COLOR_RANGE.

Pass the plane_color_pipeline bit to drm_atomic_state.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
v5:
 - Fix kernel docs

 drivers/gpu/drm/drm_atomic_uapi.c |  1 +
 include/drm/drm_atomic.h          | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 52c6a4dfbc47..dcd12fc0bd8f 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1600,6 +1600,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
 	state->acquire_ctx = &ctx;
 	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
+	state->plane_color_pipeline = file_priv->plane_color_pipeline;
 
 retry:
 	copied_objs = 0;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 0f76ee3caa9d..2b088cef946a 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -464,6 +464,24 @@ struct drm_atomic_state {
 	 */
 	bool duplicated : 1;
 
+	/**
+	 * @plane_color_pipeline:
+	 *
+	 * Indicates whether this atomic state originated with a client that
+	 * set the DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE.
+	 *
+	 * Drivers and helper functions should use this to ignore legacy
+	 * properties that are incompatible with the drm_plane COLOR_PIPELINE
+	 * behavior, such as:
+	 *
+	 *  - COLOR_RANGE
+	 *  - COLOR_ENCODING
+	 *
+	 * or any other driver-specific properties that might affect pixel
+	 * values.
+	 */
+	bool plane_color_pipeline : 1;
+
 	/**
 	 * @colorops:
 	 *
-- 
2.43.0

