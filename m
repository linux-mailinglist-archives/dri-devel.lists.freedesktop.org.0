Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9789C5FB97
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6A410ED41;
	Sat, 15 Nov 2025 00:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jcQzIm7b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011060.outbound.protection.outlook.com [52.101.62.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C3F10ED6C;
 Sat, 15 Nov 2025 00:15:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqKIq5y8lyJxj3571YHOmB0FcZsEP4XW2UQxPI0QvZxXl8fwQrs0ceeB5szCXmD6R/hA2rS4jGtGxQ7jS5AgnL6D0SlT/YalRZPBcegz19IsSDZFnkVeG69F0Lpkz9FHZemVthBAfdFNCB+rM+jvPdf//I1i4B6uAPZSJFbwTAWVxP9TFbF4cHg6pyWjt5IyYdni8t9y6yJfzt0MPn4jXeQOGXAQdy/7u/Mu+NbdmYOqmx+X/NWFuHaO9BnBibJ5BkOpxEGv+vUwci3oqGjdJnp4QuK8//cuRa/VEakwm4E5GTdlLQ1FE9pyrW5owZ1USaXFMT2oqRFz+A64M9H9dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CH0iN8WbnQ0x4HXIwUnbZ25nlENaAx32356Ls2d56Fo=;
 b=d3TsjU/839o7TORoT9bldQ5waoqfGsJK0FqCp2vsvVVJ/2zM9Zjv6dMzcIgX8JQGnv/4kOdd+Cl7ocqW9Sq2U3DXVns2i33JGYQl3F7o/qx2vyq55+nSwbXTbVghmWwR7zrG8qc31TcYoxwqc5ZQDuh0H6V6WGMsgex/ll/mXokt21KiZSnB96/Pg9YG92vSuxGl38ejhn3bl2QqhbhA2H34jAqQWhj/HcMuswpKcNojAaBzDKFRs2D6vE7s3HgjMDvreRfQINzD1jI95XWQ/3ogCyWjdnaPzW6oVrWEOTDytN7COdL31XHp3fg5xBbE/D9EsAVle4B5TJYYpjq2/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CH0iN8WbnQ0x4HXIwUnbZ25nlENaAx32356Ls2d56Fo=;
 b=jcQzIm7bV26uewFFaLTFUGauqTBRMjVd3R1BPSbLsXqHMyNEXmIzDGlRipOzOv0prcvubS6o1dJFZiws1UhVwly4gvcH4GrhAtEiwLJi7/oNJ5bFvu0NFFUNrAcHMmfWXspjJifQdppduFikHkqK0IbrzdtKu4MCENRQ36wS6Ss=
Received: from DS7PR03CA0337.namprd03.prod.outlook.com (2603:10b6:8:55::25) by
 MN2PR12MB4422.namprd12.prod.outlook.com (2603:10b6:208:265::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.18; Sat, 15 Nov 2025 00:15:44 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:8:55:cafe::a4) by DS7PR03CA0337.outlook.office365.com
 (2603:10b6:8:55::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Sat,
 15 Nov 2025 00:15:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:15:43 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:15:39 -0800
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
Subject: [PATCH V13 50/51] drm/colorop: Add DRM_COLOROP_1D_CURVE_GAMMA22 to 1D
 Curve
Date: Fri, 14 Nov 2025 17:02:15 -0700
Message-ID: <20251115000237.3561250-51-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|MN2PR12MB4422:EE_
X-MS-Office365-Filtering-Correlation-Id: e7042902-c487-43ba-368d-08de23dc1dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JPVqdbjzFercnc2mc+csucvGUNB0PwFyj2GkO8/ZFUd/5Dqm6nLe4hl/Yv+t?=
 =?us-ascii?Q?eXDs61LwEtJSoK3Lzjze3Jnn2O61G35o/zQOWpOVrUoe4N57IKt5teaWQBXs?=
 =?us-ascii?Q?ItnDw8o/DInxtMJ4b/zMIwciYPdpAvCX994DbdfZDSFmybMBkMHk4gqfX2wv?=
 =?us-ascii?Q?lJ8auCNXJWq3oYkDamh9myZFbJ9yWbNy7xMJHOclBZH/rwsntNLOjLt6eaRF?=
 =?us-ascii?Q?Cte55xTa8MPOWtysd84+P1aLbPlIJEnxLk4VRU4kQU9hKxwSRCFNVEwB7VLc?=
 =?us-ascii?Q?QolG2R9pMGo5QgzCpayzioZx6ZTXRbgL088l70Redon6APCqMILIgbbWIeGs?=
 =?us-ascii?Q?C0TfAqGBl3vIgYH6HkDgwYcwrqPknw0Pqw5PjTVrvbX0oZgDAYzHEaXHF4eH?=
 =?us-ascii?Q?DNFCuURzFozkKcxTVke0VTgVKd31C2KXkjLlhINprHTbHpxTT9TgnaCMrn8g?=
 =?us-ascii?Q?jvxx5ssR0XK724uD3LRKoI9LMKk2ZIW1bAdBW0lQp5VWaGk5T0m5AJQprG8J?=
 =?us-ascii?Q?ixe/iyGekuxneS3ePalT9lNkOOg0BNn+ZHGH4uIScFPFwDs16qEggphK7h2Q?=
 =?us-ascii?Q?zUOm7ObvVeu4Un7Y5I6OQZ3S6Tc+ZUZLtd7058U3PVmesNMIYwVwNjGUnP02?=
 =?us-ascii?Q?h/9WQRjtNGl5bjRvISsR9+YJNF8MWUWXkbfYT7Rv1T0cR1R6DUksA1T6IhSA?=
 =?us-ascii?Q?e3zVQcBT3pAgwE2+fUfu+egsneG52B4rDNSYWEk/U5k0b65XiNv6Cid2mAbI?=
 =?us-ascii?Q?UA0fev/bVJdSItRh7DJEh5SWY5gziKGcSnLZgOCr/S7LiwdyRHOk/0XrI9ej?=
 =?us-ascii?Q?zOKXXc81Jm3ju00VJ0bt5fts7QmSy6buuHh53yNCPEwEa+jz0gz5OyiXmmDB?=
 =?us-ascii?Q?oRgsC0zIlKRcp5JynzG+eEs4T4G2eo3Iy10uUdD2eldmXeiZOyCGuXirfWlc?=
 =?us-ascii?Q?s2LW4p3bs8pR/CYj/UUWToHQ3uqQeK+6YJOjqlug6hZWoi7EkhObSbJ4pULZ?=
 =?us-ascii?Q?A6ShVm4SfPJJlWqze+7MmYjgOPMioAEVNX20iw6tX4+u6JhVeZeo1npH+aIl?=
 =?us-ascii?Q?IT2lEcSNHMaU04G6ZIgN+fOuxNpIXtPo18m3bzTqS4YVn/+IswtQ400eZ0Yd?=
 =?us-ascii?Q?cXYvUFJtw6IBarWQu4oS9BXVv3o8Bh69JCOigsERM8pAlYDXBlaEdkEvrsuu?=
 =?us-ascii?Q?e0ppQzFRV+VGn+ZHte1ZBUhfp+ccXl0STzr26eib7jKmO2PSie4lujTr/lXi?=
 =?us-ascii?Q?1fkSvjkZJgHAH3kmaTuzZYKAfhu/zbuj8aNOHBZFV7PvqxkUTw3/X1RvCBwZ?=
 =?us-ascii?Q?RxaDlHPc2VgofVEVvSHWwauuWTKS7SSmxh8MuTlLCDmXPPdXxunf5LyNTHom?=
 =?us-ascii?Q?eAoqWRFW5XdlumW9OLwzG0UBPhF5zaNiY7ydNUY6EWlWpbjthRdXm3jhRDcv?=
 =?us-ascii?Q?eeF2ejKnlIKpaHq6dOUyY/+JGAaVA7rjyYyPq/YqBMvk2pmsTvgkFJGrAE3M?=
 =?us-ascii?Q?veVBBHwV89d4Uqb7GpHJnMIqIopmBlwN0xO+vnA0jgMTaG+wVWZio18rNrB5?=
 =?us-ascii?Q?xZK8O099hjeinroJ4ks=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:15:43.0996 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7042902-c487-43ba-368d-08de23dc1dbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4422
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

Add "DRM_COLOROP_1D_CURVE_GAMMA22" and DRM_COLOROP_1D_CURVE_GAMMA22_INV
subtypes to drm_colorop of DRM_COLOROP_1D_CURVE.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
v12:
 - Add gamma 2.2 (Sebastian Wick & Xaver Hugl & Pekka)

 drivers/gpu/drm/drm_colorop.c |  2 ++
 include/drm/drm_colorop.h     | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index e1b2b446faf2..4e54bd46be7a 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -77,6 +77,8 @@ static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
 	[DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
 	[DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
+	[DRM_COLOROP_1D_CURVE_GAMMA22] = "Gamma 2.2",
+	[DRM_COLOROP_1D_CURVE_GAMMA22_INV] = "Gamma 2.2 Inverse",
 };
 
 static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] = {
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 3e70f66940e0..01e6774c482e 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -108,6 +108,24 @@ enum drm_colorop_curve_1d_type {
 	 */
 	DRM_COLOROP_1D_CURVE_BT2020_OETF,
 
+	/**
+	 * @DRM_COLOROP_1D_CURVE_GAMMA22:
+	 *
+	 * enum string "Gamma 2.2"
+	 *
+	 * A gamma 2.2 power function. This applies a power curve with
+	 * gamma value of 2.2 to the input values.
+	 */
+	DRM_COLOROP_1D_CURVE_GAMMA22,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_GAMMA22_INV:
+	 *
+	 * enum string "Gamma 2.2 Inverse"
+	 *
+	 * The inverse of &DRM_COLOROP_1D_CURVE_GAMMA22
+	 */
+	DRM_COLOROP_1D_CURVE_GAMMA22_INV,
 	/**
 	 * @DRM_COLOROP_1D_CURVE_COUNT:
 	 *
-- 
2.43.0

