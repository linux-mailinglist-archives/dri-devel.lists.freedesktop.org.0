Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D36AEAA4065
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA85C10E667;
	Wed, 30 Apr 2025 01:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eFEUdLm7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23ED910E65D;
 Wed, 30 Apr 2025 01:19:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3T5LCK4+gwhC0y0PdsdlIStOhUJgmMd9Yb1zN20q+ZltlLrEphdwxW8p0qRr+zTNO1Jfj278S8WPX7biye9jyDCax8s577sDd7NQxmLd1b2oyebTtJg+OqkEQazIne84T9c1GS59tYKpFtVN0CBIxmvu2yBj0xs3/QfmQg8TVPNAsG8WWLbRpUpydu2L4F2W+6zWIPR4KrOssQ4UiiYgiJhdQJsPRm2intd3yk6tV0jDMYoC4PSuemiFFjd3NuQNVaceFGAObJeCx0hpBJrPrD4x0o1Sy1IXhXyTE+LtrdtHCM3D3bDQ4LwwdA0oQJRwfN/6lcFQxtDzb2B0EaoIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8trL66qZLZ+KZUGfOZTIBzkqBYMJmvct7ezzQOlFYfo=;
 b=Io4HQN1i6epgMEvvHrXLfLbIhXvueKmYHMXOcEf/dpwU0dsRjG1M6vqxLmbWN1v+8wNsog04G05GyYJsvUk7/TL57YMAEM0Vk0N1OpEAASOMRkBiZLp0iQJDSJ6/7sW5KoNatsW1mt8+zseKIVSkqo4Ejt/u98CKwBvJXRINQ5fil60HCQN9fp4hZRTzgEdPLqYdpNafYRN8LvWQ5REJCsgCL8d6KwloLoV087p6j0ycvvH9BWWWbzM9837s3GlSf0vUXDeKUzD4Ejmx9hr1nr1byQVQKHOMWyWMbtafqV6axu5y5wFR/9ou95VxIr5V4BIjuu0GUIwHxtpmegOs+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8trL66qZLZ+KZUGfOZTIBzkqBYMJmvct7ezzQOlFYfo=;
 b=eFEUdLm7bryUTQSAlkMGgfOQ1gOsb3o6TNkOm3t6PwOJey/dYWT60o1i9fQt+SxEtN716ib6zDZ4w42DspP5x+IWJU5QnZw2h876bEdyIPXFzS+fbI6KC3jlYRpzon4E1CyxeeVwP65x6FKIRSQIqZxBY/av/JY/H1j60rfPayI=
Received: from BN9PR03CA0911.namprd03.prod.outlook.com (2603:10b6:408:107::16)
 by IA1PR12MB8335.namprd12.prod.outlook.com (2603:10b6:208:3fa::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 01:19:02 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:107:cafe::bc) by BN9PR03CA0911.outlook.office365.com
 (2603:10b6:408:107::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Wed,
 30 Apr 2025 01:19:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 01:19:01 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:18:57 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V9 29/43] drm/colorop: Add PQ 125 EOTF and its inverse
Date: Tue, 29 Apr 2025 19:10:59 -0600
Message-ID: <20250430011115.223996-30-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|IA1PR12MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: b570e686-7cc0-4bcf-6adf-08dd8784fdc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ujQh3G7eGDuos0Az9tCl3es73eNRs3eQk0q7uSM8l8WOxMFgAJoH1MoMI5PJ?=
 =?us-ascii?Q?X5LlpcHxqHp+qZzrP8o0Jn5yWTUebCmJur80MmSsy94jjKg/JTh05hMM0NCE?=
 =?us-ascii?Q?PVH6UdrjFdhzlgePKw8d6PGqOhRNI5FwtKfXDhsy6cTCNHQv+gqdlkFqa9xU?=
 =?us-ascii?Q?1OMQJi3nhNx6aJT2ZZ55cYV5lwswZqdjUFx7GW99EixlZFKSVY8S7OCmf3h0?=
 =?us-ascii?Q?HGoyMrtXG8wW3BrZQWKkhmZot5DMgqK6OeeHk1D4gnseWSScZ8FUwJW0ZvMs?=
 =?us-ascii?Q?mwh7IpQB+AGysXPotvq2WWupafmr6DjtQmTpWfMg00teQHQ1Ju98jmtKwDVY?=
 =?us-ascii?Q?5G2MeKQ6HS2poYRk/xjvpI6J85D2OZl13a//6rnck2PorFliUcsAZFzawyvf?=
 =?us-ascii?Q?eZxh6mdS+3yas21RYcPQHg6DvoSM6K18U6vDANni0PJOmK39UUjAbu5fohoF?=
 =?us-ascii?Q?PcIaKZgniTLnxgjh3Q8qYNvz+c9k0ryjy9e7gSkSGQyQAsrFx8sXWfV9wfB+?=
 =?us-ascii?Q?A7hEzcklCMf2S63mIdZd7k1fnfBHQPKLyXkMIL8i7yOcWLkI/vkGv+C7928T?=
 =?us-ascii?Q?Kk7sXiouKU4U9XKu8gUoCeJXM/UYO+D9FfjUvLPYDET8kZ9CTa1J0uA3s295?=
 =?us-ascii?Q?ae48K6d8BTJpmpT4Ei6CAM/O/vC7XWA36z7g9sCTf0HWy/WZ7dwshYDwniJU?=
 =?us-ascii?Q?BE2+JVNXAskocXpPXnuaFDrPp5u81MTGxk5YzuYLwpXEE+J3UitI8RYebHW6?=
 =?us-ascii?Q?jC92pckNX79MOftJgJG7pThjJaIpLxepNipXL61gYoR2csGuSZgLvVZ6Swp1?=
 =?us-ascii?Q?VVLsK9K1/PA+OGhIXCEA5Lm4WV6DG3m+J5NZjSKYRr6xd32Gxy3kZySQ3yoH?=
 =?us-ascii?Q?W6QtdSFKXzaCJ1t/cKur//fAuYN9oeBco583DLEpCnuLxXz3kwuE3J/Sm+BC?=
 =?us-ascii?Q?e0dBmmpmIraSMy05J7/wv/+FMINayoqn+IwliqHFtuPGkjJ80+gHzYhsp5Jq?=
 =?us-ascii?Q?GhKzLw1MWtbbvS1JPn93scpbgO/cOVt9J+pn3NdXj8WBV/dD/7ParI1JC7jV?=
 =?us-ascii?Q?Qk3ZgfUnTEz1VV6jcEas+LSGDWz5jXwdL1+6OI8KrNgFOtrXct5wDroVZr3G?=
 =?us-ascii?Q?kdl8xedU0BkIU1dcT+/jHVv9/RMm7l0kSz8/vo73tffXjQilkeCRolVJ5dzY?=
 =?us-ascii?Q?CNGHh8Y6jA31B586eVBf7vcBYsK+i2+EB2khDfROE2wFgLwRAaw8iB6yzyPe?=
 =?us-ascii?Q?fmt3uCkCyhWV4uLc4jXZaZdxTbqxgjrR+c5TV4oUYg1qq0eU9UUcKmHwQN54?=
 =?us-ascii?Q?TWeN4Id3HPFh98bncGjObeOsFC2yHbY8ZY361QfhLq2HEkpesbexqEJ1NReh?=
 =?us-ascii?Q?fSgE6LbowhW1ao8f5wgJepTPvbA2+V9A35j+cGovphL6YczqOf/SJ0u22R7+?=
 =?us-ascii?Q?0yUXAmDCisV/llvAezM5BphSp/VTmCzFWh+zhtDNXei9pEiAS4Nj/WVu5CCi?=
 =?us-ascii?Q?zXtPYG03jli8Y+KT/T2ygY6l854kU+3RRpbN?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:19:01.9032 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b570e686-7cc0-4bcf-6adf-08dd8784fdc2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8335
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

The PQ function defines a mapping of code values to nits (cd/m^2).
The max code value maps to 10,000 nits.

Windows DWM's canonical composition color space (CCCS)  defaults
to composing SDR contents to 80 nits and uses a float value of
1.0 to represent this. For this reason AMD HW hard-codes a PQ
function that is scaled by 125, yielding 80 nit PQ values for
1.0 and 10,000 nits at 125.0.

This patch introduces this scaled PQ EOTF and its inverse as
1D curve types.

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
 drivers/gpu/drm/drm_colorop.c |  2 ++
 include/drm/drm_colorop.h     | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 65351aaa7771..9ddb3dccaf72 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -70,6 +70,8 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
 	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
+	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
 };
 
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 5f0cddc3922f..40d70d4a34a0 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -59,6 +59,30 @@ enum drm_colorop_curve_1d_type {
 	 */
 	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
 
+	/**
+	 * @DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
+	 *
+	 * enum string "PQ 125 EOTF"
+	 *
+	 * The PQ transfer function, scaled by 125.0f, so that 10,000
+	 * nits correspond to 125.0f.
+	 *
+	 * Transfer characteristics of the PQ function as defined by
+	 * SMPTE ST 2084 (2014) for 10-, 12-, 14-, and 16-bit systems
+	 * and Rec. ITU-R BT.2100-2 perceptual quantization (PQ) system,
+	 * represented by H.273 TransferCharacteristics code point 16.
+	 */
+	DRM_COLOROP_1D_CURVE_PQ_125_EOTF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF:
+	 *
+	 * enum string "PQ 125 Inverse EOTF"
+	 *
+	 * The inverse of DRM_COLOROP_1D_CURVE_PQ_125_EOTF.
+	 */
+	DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF,
+
 	/**
 	 * @DRM_COLOROP_1D_CURVE_COUNT:
 	 *
-- 
2.43.0

