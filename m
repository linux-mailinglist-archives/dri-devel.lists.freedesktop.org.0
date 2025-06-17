Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82101ADC060
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931AF10E613;
	Tue, 17 Jun 2025 04:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Wyf1f06a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D6410E600;
 Tue, 17 Jun 2025 04:23:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZe+fnl1VKoRp77oBg/Xv9ZOJXvmDH+5LQEbhKQu3uFBIX6O1iTx1v+tfaE/z9UIpQlfZDrkOHFTtgWWLabpK1VFkQIwk+9oydpGa5UNwNt0SOmHNN8GTpV9Swj0Dj8k46qTRjeGjkl4jj8LF8CBiPZoEIrZbJPeuSqv0r8sNgMs1WVzRRFY5UQ3j3eNyw5uBseR5+jXe6AarmJLjaRvHEkspthjKE/8x8Pn+IjhYP8ctC/pffO2wsgz5fwFY8WFCXFtVciuOyh2vFpPRYu/dvs5A+nCoLHBEIn3tmMY496Lt8pJ9ubJaBLKCoMF7CKSzG9lCwtJ65Yv1xYYrGCT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIJcvgyqU2nVlS+vOkYhEoTY7G3EWnA7aL5UlIX402A=;
 b=Jq9X8iEabb1AOtt2rZJMX4hDljsOqUb9ZdxzHxHlZSx52liogUm7k3hFvHJWj+8uq6hC2vz7qXUnupsNZg1/tW2Ok8P0miBLbsJ9O5UDhMB/Sl1PuUT3o4li4z5a4fclma4OSsueO+WbyQAqiYXd1o5mIMOzEGLqUU8ZVeb+6G6ZPEJTCB+n11uZLYhDLAgJE+aiSCE6yA3w89GJzm1Ohnb5gIOQ38PXpHfF8p1wZ1Q7mtdJTo2X1l6M1E08QWGZuRKs1FeR92MHI2mpq1peOq7RJ95cqdOa/rTTMqj3oQw0mbEizr/RvNqsjvlfsOvUmB2JfVgdGUdBO6CJGmP4cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIJcvgyqU2nVlS+vOkYhEoTY7G3EWnA7aL5UlIX402A=;
 b=Wyf1f06aG8yTn/uyOmIZ3DVNONJl4sZ/IfsWhzWQfMMSdRVdsb3qkYDviuAEmXnBR+hFP5W6Hpt6EAGmSOAWuN4+HwnqRMEiquy4QR9r4ueFG2kVNYmGfIzA+H2Vmf2sc2+QV9KkYy9iXIypRaF1qlV6eCc4ETl1fSSy/7xluO4=
Received: from CH0PR04CA0042.namprd04.prod.outlook.com (2603:10b6:610:77::17)
 by SA1PR12MB8919.namprd12.prod.outlook.com (2603:10b6:806:38e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:23:42 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:77:cafe::7f) by CH0PR04CA0042.outlook.office365.com
 (2603:10b6:610:77::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Tue,
 17 Jun 2025 04:23:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:23:41 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:23:38 -0500
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
Subject: [PATCH V10 23/46] drm/amd/display: Ignore deprecated props when
 plane_color_pipeline set
Date: Mon, 16 Jun 2025 22:17:05 -0600
Message-ID: <20250617041746.2884343-24-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|SA1PR12MB8919:EE_
X-MS-Office365-Filtering-Correlation-Id: c021505b-0668-4aa3-e30a-08ddad56bdd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ccs4E5DkDAgHT4ItC4e8540onVXJ4rwiQ49D8O7xTcWa9XL0bIiRcHh15G8J?=
 =?us-ascii?Q?3wuBuxf9zEvcDIsoGsSImMGMhVb+VV4DeZ2DDrHCtjJHy7V/sGrlqp3JJn87?=
 =?us-ascii?Q?J6hkjpfhUbIpIbIUqXPWjZCgLwoCm2G3m6bANHKSeERha4STOX5H4Fh2cAKs?=
 =?us-ascii?Q?cDDO9GajFQWropv5Y47bjPRItmQZLjayi0FxaDhF4NZHgz+hTUU6ap4/IV4e?=
 =?us-ascii?Q?egjZhTkkiv/LSGrjvuKOdRI7ly8f/P/Z2jrTq5vEWS+Oyengbpij7Duks0dx?=
 =?us-ascii?Q?OCTzwIY8al5eoMB89tEYD0u/3JLuODlrTtjAEZg3o2aQ1zb4VgG2wHGVyCkf?=
 =?us-ascii?Q?8kFTf4bAor2V8b5l+fN/+vgCVXTf8ZUK0CuxGpOwuMmbqQIQ+ijbYnpcs74c?=
 =?us-ascii?Q?K+5nUFcQsrWsXGg1yh2ZI0T8XYe8fnPIu2kNBCvgMg5xx2yQEp19IvKWnlfN?=
 =?us-ascii?Q?IUi3pJdR8rtPOxRgo41B9hQqFD92RBRhMNvbSAgkFapEeigEaFkv0XbyIvXJ?=
 =?us-ascii?Q?lmVyZw8RPtMWeDQg7BErjw78k3CLy4L+KGVNrzfyqaGdJ78qKICqLwQ8XzFp?=
 =?us-ascii?Q?doZ0ynHNvQqXm+9QmNvmASzlWhde2kaBh8HYoVf3d1QiianQTwT303cf2WOt?=
 =?us-ascii?Q?prCai54+xEv3B7Zp93z3wV5lgHkhzLBcQ1bS9M/KOC67zyR71mGc5cGgOZZ8?=
 =?us-ascii?Q?GVG3ODRq5lbk+bfl2hqqisK4ZSEC9yRtcozjnKz/SH74j++D4cBr3RXIDjSO?=
 =?us-ascii?Q?Ua5uGlNyiS0rx1Qn+dNrtmOJaJiF3ArxVb5CpZzcYaSoEV6swg3fy/mzgv9P?=
 =?us-ascii?Q?tQ1IPDK6BieBTGLp51j8liu4M01bVlcpDeUuVQirh05C8VD8kP82CgYSEFm2?=
 =?us-ascii?Q?xDhjptZUxp1rMI+yZ7bZWl/VjqkHsvEJPpPk6eXIAZSTXwKtRdRI2aOy7JiZ?=
 =?us-ascii?Q?brVDnxJnQsozmaYtyp/3wL8VYT1WQIab5UsIzE2ZSx3Age3hWrEfjdhw2Dgd?=
 =?us-ascii?Q?kkXHgCmrmE46JBykv23ic2FR6+NHLE9JryQSqBQJmTntPCuB0p+MODCHjZVd?=
 =?us-ascii?Q?Qi9ppVrFsO3nYiauU/dynGLYBN15Gj+FAQRpjJrpDJA84PkOk7ro5l+iXLQX?=
 =?us-ascii?Q?YrEIzHkwiyhXLZiazLpV2o5p8c6gCSXG7nutb/yvwx9+Giy4rO8P9mnyDzzE?=
 =?us-ascii?Q?SsWND9DfgJTDi6JC/GZxhxmC7TtuNs43JwRm/z8hETgpdHnUSzCBtsyt+dpp?=
 =?us-ascii?Q?IhkDE39b3mWDIEc/nm3jdAxgtlvZj/u3tD8Pn16kvZ8PJpcnhAkcgdtrQL7B?=
 =?us-ascii?Q?3PK1cwaLEanKKVo0m6xYNrtFPaxYCuawv9I5MLwVbQqAQPsavvhGP66CnsAJ?=
 =?us-ascii?Q?uVMTTMVQQ3e2/QS15JcnACjyBS4UzgVNny8fP4GDy8azNZ41+o9ta5Fsm+Ky?=
 =?us-ascii?Q?VvJJpN7CeHxYHGPnTOHOSPhAu3vvDUoWIkiPCtS8NXd/cPHOa9k2A+u2uogo?=
 =?us-ascii?Q?7xCxBUYO0KKHcNTyjWZBqY0eOhgrhH9ev9jB?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:23:41.9891 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c021505b-0668-4aa3-e30a-08ddad56bdd9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8919
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

When the plane_color_pipeline bit is set we should ignore
deprecated properties, such as COLOR_RANGE and COLOR_ENCODING.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d3100f641ac6..352306164387 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5658,6 +5658,10 @@ fill_plane_color_attributes(const struct drm_plane_state *plane_state,
 
 	*color_space = COLOR_SPACE_SRGB;
 
+	/* Ignore properties when DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set */
+	if (plane_state->state && plane_state->state->plane_color_pipeline)
+		return 0;
+
 	/* DRM color properties only affect non-RGB formats. */
 	if (format < SURFACE_PIXEL_FORMAT_VIDEO_BEGIN)
 		return 0;
-- 
2.43.0

