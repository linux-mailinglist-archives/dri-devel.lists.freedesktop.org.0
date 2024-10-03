Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DE898F77C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A4F10E8FC;
	Thu,  3 Oct 2024 20:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CNxhX5Lk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFDA910E8F2;
 Thu,  3 Oct 2024 20:01:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIlZueeLRRz18turLjuGFx3gw8VPLg2UGFSDJF1EV3KSzSWhTaM/yRTtOC7hXgb3rTVQuIvqP51QX1ERsQ0Jhk+/kVbhytU45f5v/rDH0/byf1pYkWQauoCSi361Trlj6ME59M42lCdQNHD1PAu1gel1K1rySSok7tPsJO6xPVNV88IA4OnW5Nl0asMi07FYyTuUCgaLqcFxiT+bSXWwOvKIp+k5PWPuFV7PfkAuV3qlyNrIp3+tTTiFHK7ATtHzR4yFDkhLk0IP6xlaM2QgWy9wBlx3PY7nkrhbIMO9xqXPU1qpuVRzPUmP63z/M70LJAgWr0GAYc8xsGbFYQnOSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2+bviKUSTa9gVfLALtIAE9OtEO6eW+RBqn7qKp8BLQ=;
 b=S5ci39vP4YTgusw3IecsaRhh8NQBeu0Pdccaohu5aw6sePbvJsIjLdiKb2IndnE3pe0IbLksQBqMID/Pg1q5juRNzM0nJm36JZLFD8Q6KHpF+uwZ2jw0I+Yn19nEoNllucgvpM/ir9L5KtKK+Yv3mIwXJi2cCBvA0jOaZLMTU35AUXODKFX+ozIM7NL6vxYCAze+ONju02Km/6ofyJocyXN0YIgOUapCmZklURI0fd8PqiUD27hTVfcaZSi44RKHPx4KplTUovGvi5Lu3DQPo6jwV79TaubIAw/U7Pys2ARCcq1+6pCD+IB1+khhiaJPAng6DX/w9T6ccw/X5arsJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2+bviKUSTa9gVfLALtIAE9OtEO6eW+RBqn7qKp8BLQ=;
 b=CNxhX5LkyNTvar6aCf6XT7kyVDgL0mus7IQy10D+P+SC5Ahvo/cdgaWs6Ori4lMk1CS6LhF2DBYiy7RbFfZwR3OcGMSdLyeWBaiKkwsJx4t+AMWHNo4tT1WQr0sH2Y7YNLJQ7XGtOA2l8BOreP4lTtTtZlfRHXVaozDoa1ZTg10=
Received: from CH2PR14CA0044.namprd14.prod.outlook.com (2603:10b6:610:56::24)
 by SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.29; Thu, 3 Oct
 2024 20:01:38 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::4a) by CH2PR14CA0044.outlook.office365.com
 (2603:10b6:610:56::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:37 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:37 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 08/44] Documentation/gpu: document drm_colorop
Date: Thu, 3 Oct 2024 16:00:50 -0400
Message-ID: <20241003200129.1732122-9-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|SA3PR12MB7901:EE_
X-MS-Office365-Filtering-Correlation-Id: 06e38070-0083-47bb-83b7-08dce3e630bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vbmrQ5yRW2342I3phUAW2FHzJArM95CvqFTOkzRTeswUwdUfTjgKAMYfbyrM?=
 =?us-ascii?Q?cmftVsK7WmWt/BJFd5iQxHmGNOMwypTeZQ2L/rn8fL5rbBdddHJP5YY5rEvo?=
 =?us-ascii?Q?LEnqkyzpA2M0vhtgdlj2WWPEAkmkZcxvHXrXguuZzXeRjec0X1hY3UeN/3MH?=
 =?us-ascii?Q?ZyS6LGydjRirz7H6L6V4MbpUUrMExnskv4lpk4nL0pRQik//In7TmIvoh/5p?=
 =?us-ascii?Q?GvR0IS/d/j4x/rf6SuD6gMc6vZ2V20hx6BFD2zAxtUcDVO0M0kHkBU+LgQRT?=
 =?us-ascii?Q?S92097BTYfwCfsGqSUPP7JVg6xKB3JlC3XHtWKvKJZ/BJRsLKJQTwgW3fTPO?=
 =?us-ascii?Q?ZdD8aOEFPUpEC8Z7AF2t1Ny44BIjOh8lQGG+b4EYoqkGXCPFBQoPL7WlSeT4?=
 =?us-ascii?Q?95VESq+ML0T4icwM6E8n4PIqZ0lsCE2MOJhU6n5ZzMWzZHP1ycrwtzNp4ktJ?=
 =?us-ascii?Q?ZXgXa5B4kCHfQXRvbXokOkVjR7mAX6Dc88qLnVS2mU7U9bUBRcX/2AHpv9ZX?=
 =?us-ascii?Q?kY4ZCgC5oQQrd0H/DjaLuJB/XsR9p/yvlkH6LufK0U/jA+wRMgdRrJmuQSGf?=
 =?us-ascii?Q?fVNH3M2c2uHVwlVDLdTh5R3Hesu6c1AWBU3J4y4bzX7Ixm+BmmD+KmVp2s3X?=
 =?us-ascii?Q?fYFBe3bJIvdBuq15jddiL7yR/6c4JXcN1jsvt83nQ7uwJ/8WbuYOKQ7d0WKF?=
 =?us-ascii?Q?kobU1nzyF/JPeOIoLMhLqF10SjEWcNYn9GOoVqJb1uDF3vKRyXpBh7t2kOs1?=
 =?us-ascii?Q?xZiV90Hkdva/MOThhl6vZ/Otf4QHI4XG1sXJLq7TyEcHwlbhpCh6V6ElxKIR?=
 =?us-ascii?Q?mpFd5FkQ5V4+mxXmbldRE9wVz3zWsU9paYeMkzi/c6kuepMqa3Vr8xGiGvg4?=
 =?us-ascii?Q?B+4jpqRMnSw1kNKBm4JqDYSKTzEyjfy7AAZBK0cXJUAsNwvbT0tEqOpFkjTj?=
 =?us-ascii?Q?+sePC1ofR2Nkt2+wYOqpDRITH6mQuy4Wr7svDtF/SA2kznmKHkuhYJpWX8qT?=
 =?us-ascii?Q?a+5BI7pZVG/k1usgN9RD98Hf4R5VwNYQjDL4r6FRmSAhz59QTWT6dZBRFYL0?=
 =?us-ascii?Q?jyF8zV2LHUK7K24GHgSt4fY0KEz/azaxX9X/8fXNNivF3UBVRdHwolrI6kYq?=
 =?us-ascii?Q?s6Ou3bBFO0SwWM2HuwoJwMl0iqjDSQXT8DCpnbkeGdZzL4HBKPtakfWR7LIP?=
 =?us-ascii?Q?llPi/QLlZi8a4bA4XC8C19ev0fb4BBPqPxuXoC/DjCtrJMthQfkr1I+UFjcN?=
 =?us-ascii?Q?moUYctGb/R3cXNLqJx0NM7msYG9FBTkiqzTephTaxEr/rKstH1Rv8Y7cO8pl?=
 =?us-ascii?Q?HY5e0kIQ4RvGqFscK5pN/YGc/Y0vjTPxF8JQJ34sXwBrvvUasRoH2XwICkbs?=
 =?us-ascii?Q?qoIgxfNTGzB+825DQG44qeL0acwj?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:37.8161 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e38070-0083-47bb-83b7-08dce3e630bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7901
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---

v5:
 - Drop TODO

 Documentation/gpu/drm-kms.rst | 15 +++++++++++++++
 drivers/gpu/drm/drm_colorop.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index abfe220764e1..2292e65f044c 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -413,6 +413,21 @@ Plane Panic Functions Reference
 .. kernel-doc:: drivers/gpu/drm/drm_panic.c
    :export:

+Colorop Abstraction
+===================
+
+.. kernel-doc:: drivers/gpu/drm/drm_colorop.c
+   :doc: overview
+
+Colorop Functions Reference
+---------------------------
+
+.. kernel-doc:: include/drm/drm_colorop.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_colorop.c
+   :export:
+
 Display Modes Function Reference
 ================================

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 98d22ac163e8..5b844daabd44 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -30,6 +30,37 @@

 #include "drm_crtc_internal.h"

+/**
+ * DOC: overview
+ *
+ * A colorop represents a single color operation. Colorops are chained
+ * via the NEXT property and make up color pipelines. Color pipelines
+ * are advertised and selected via the COLOR_PIPELINE &drm_plane
+ * property.
+ *
+ * A colorop will be of a certain type, advertised by the read-only TYPE
+ * property. Each type of colorop will advertise a different set of
+ * properties and is programmed in a different manner. Types can be
+ * enumerated 1D curves, 1D LUTs, 3D LUTs, matrices, etc. See the
+ * &drm_colorop_type documentation for information on each type.
+ *
+ * If a colorop advertises the BYPASS property it can be bypassed.
+ *
+ * Since colorops cannot stand-alone and are used to describe colorop
+ * operations on a plane they don't have their own locking mechanism but
+ * are locked and programmed along with their associated &drm_plane.
+ *
+ * Colorops are only advertised and valid for atomic drivers and atomic
+ * userspace that signals the DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE client
+ * cap. When a driver advertises the COLOR_PIPELINE property on a
+ * &drm_plane and userspace signals the
+ * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE the driver shall ignore all other
+ * plane color properties, such as COLOR_ENCODING and COLOR_RANGE.
+ *
+ * More information about colorops and color pipelines can be found at
+ * rfc/color_pipeline.rst.
+ */
+
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
 };
--
2.46.2

