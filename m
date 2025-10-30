Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921D5C1E443
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:50:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D379110E93C;
	Thu, 30 Oct 2025 03:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rAcfiwhm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013019.outbound.protection.outlook.com
 [40.107.201.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF87510E929;
 Thu, 30 Oct 2025 03:50:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuajwdbRQiN7RIK8NjLSjc/cATj50DSrSCeRjt3CmIuzOBh01ymXFyGbH+A7xAqFF962vVJKfz7PAqIazPc77Vgk7BwinCCkVB4iZhGghQ7UZaZz7auooft/H6yiVWRkQKREVYm26BcrjvF4krWOJLrWgoQUm875eE37ezdt/JSZI+lQaOTzlAW43d5ksZyZ4Qau/jKEu9tksNKuC4ZJgD33CPXSVzrnjsPH+IiGLyLuFVkJrGMeW6VinpRTjVAUdtO08ZvDy7BweyD2ygJg9dBCXGkF7U6+YksaSx8UjCp2cw2HHTMys2QYu6KzOVgW7c8lzb7HYusByipZRoL/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctOXayUVoTOesPxnz9+LCXf3ZrORdOXgoLn9x3IUuIk=;
 b=VvRybYRgWTfEAwCHjAN3POtorlprrDNG9hH9f94ag9qtHkPGraeiMcEMAnOHsCRbwLEI5K0XJitwwGep3h09rLAmhjyPkbAEjKBvqq8ioLSZjieORbBFEAexlSUZTnNQVeKrTmUOWB5bUxZle/bknFpJiQZ17AUzmpocM4Ul1yCeKKRspgVaMp7ROoaYo7EB9i5Rpwh7nYJONDlqhTXuDOcdnxeczYKZ+CHUP0I4s8HsO8cyXcjhhLoUtrIrfrXwA6kibBCqCX+XMqE3Q363EjUh6pbF2StIo32NvOKfZ13AJIWln4qkzXzvo91ObRKmIApetpTVt6U+Wh6dqguxBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctOXayUVoTOesPxnz9+LCXf3ZrORdOXgoLn9x3IUuIk=;
 b=rAcfiwhm3ONS2Iwgk+sOHhoZH1fa80UQEixMOPxA1Us25TN8RRew6egmWccFY1qtT9RFhT4PqW6ZxEHGa1mWEJgdtFF8uZTRW9W1GD+q7KsSH1pvZHPOwj0PGudIkSlI0Oba8jDXgPAB0x+0DmpG23KmpU6zxILmmwtDodD3wi4=
Received: from BN9PR03CA0103.namprd03.prod.outlook.com (2603:10b6:408:fd::18)
 by DS0PR12MB8455.namprd12.prod.outlook.com (2603:10b6:8:158::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 03:50:00 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:fd:cafe::69) by BN9PR03CA0103.outlook.office365.com
 (2603:10b6:408:fd::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Thu,
 30 Oct 2025 03:50:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:50:00 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:49:56 -0700
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V12 21/49] drm/colorop: pass plane_color_pipeline client cap
 to atomic check
Date: Wed, 29 Oct 2025 21:42:26 -0600
Message-ID: <20251030034349.2309829-22-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|DS0PR12MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b29e5ab-2da8-4ed8-afee-08de17676677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RtwPnHqq359ZzDBPasXPXXfpPfJJqVhaxW6UXf/dhJaZOTQqFxljC4RVFIfT?=
 =?us-ascii?Q?J2IMy4L1HOPbn/TJuY0srNgfG1wnoCr+80Ivay6o+bF59EQtsbwORnexc3+g?=
 =?us-ascii?Q?uE3YxCi/LDUBj3lMYXDqeMUlf4sULS2Ku2TWxdNIsXZ5ErWNOvpeEY6H2TeK?=
 =?us-ascii?Q?78HFb/zDgA+gDKoDht0wPR03AI+w5zAqe6KGR4JQv5xYVqwqKXD7R/HcPXCz?=
 =?us-ascii?Q?URS00dEClqOpV029gySK2nc30B9BlGZsZb/f69FlSnkBIeWHsbrJ4qH2o0Bm?=
 =?us-ascii?Q?9oOfHB+bO2buuPoDFwbAJrGcl+4GTRJ9kGM2QWKw8sTLw9sQ8jexA9QfC+//?=
 =?us-ascii?Q?YUGp3IG5gXHU7sE/uOGhuj66jXYMlZm9NjPRYTi9He41DsR4U6I7b9ttA6um?=
 =?us-ascii?Q?K2aZWYRPeZa062FCWctWqFJGVBA1MRZ0DmMqAtwAYHqardcuUk3n0VCVPgO0?=
 =?us-ascii?Q?lOvDQ2HMrn+3FGcVy3pXSYm6UhKJHHVcMi34zCkLkdnjp7wO8vwKb0A3l4Q2?=
 =?us-ascii?Q?EF49XhMm4I1U5gep+DzTb25t5goKQ4dSxRkocwtGvI5MgJaZCHc+MUudtmNF?=
 =?us-ascii?Q?Em1QK8pvsnvYwYmuICoB5ZjjrZse8b+/v3MiehuwkkBo/Mb+DiEi97kb01xf?=
 =?us-ascii?Q?2QfwfSl8PXKSiMowSx4F5pPHyzftgiPi6ge5LpAK6be4LorVAczKuIXgy2ct?=
 =?us-ascii?Q?+Nyn99XqHwpGd5XGiGfXkEpw/ocvWxYixZYyI1eY5iaJ2Aw+apfMzNvLe8u0?=
 =?us-ascii?Q?2bq78P+Zl+nH4XAD4JpO2DI6GQF3U4G2LGGumgGJR3Ttsg2srB1xCyMAc8PQ?=
 =?us-ascii?Q?MTEVTCuJfFOUkP9W2TonTRe76OC6v9eqg2ZGOljUX7LSkC61f8vYPXOfx/fC?=
 =?us-ascii?Q?ONZEE3x2rH3PNG0rtCqboMHbXs62bKKU56weXWOBMW/OseFGwHadaxWKWnj7?=
 =?us-ascii?Q?E601wNt5+mSGfx+8lhkloKOR45Nsbv9CNExoCyS+dDwTMeopQ2KSy9KVuM0u?=
 =?us-ascii?Q?ffOR9CTEXLe2adqLfU/DKtqsSKcX63/E4xafnLxP/W5qi/YWvLEoDRI8u3mH?=
 =?us-ascii?Q?6MbqjK9uBfHRiD3UZS9kv6fuFkGore2nCOFCoQViOqWq0/fueIE+pUZ8EgAT?=
 =?us-ascii?Q?zmCa46gH30blHmB2luneg6ymHLsbSMy7GFRaJMZY9xYqt4BFta7tj0WdmLLb?=
 =?us-ascii?Q?bwGHvmaNMNRmC8dAm/dwdoEDznVjIAeU2QCExE0qHzfBLlzqe845yGQhG6VN?=
 =?us-ascii?Q?/Dq5lF/kMZS2HZ2iwXECTG6F7pYDKp5lrKWxxBIN6RgzAZY9/eMurDdpoQGj?=
 =?us-ascii?Q?N4D+L6+ImET7i90Uw9zdsn9VsoKqJ/APHv9wJvquMPABjmxDp8htIRwF9eY4?=
 =?us-ascii?Q?ac+N0Dg1qV6Ich7LQS9T3Cly+ggy71tKT2vyWcNTEeiUxw468QH9Xb9FrpUk?=
 =?us-ascii?Q?d02o4x5hBz5aR7HuOW3x1IZ/on3JWGOTN7ARkWmaitXV9/I+YENLNxPOMRm7?=
 =?us-ascii?Q?m/Hai7DBr3Jxb8lalhPh2/Xw+CglQH6+dg8wXzO6ViONjSaGXEOpoEVWv7gr?=
 =?us-ascii?Q?retg3+cHqsJXtNuamh4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:50:00.0955 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b29e5ab-2da8-4ed8-afee-08de17676677
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8455
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

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
v5:
 - Fix kernel docs

 drivers/gpu/drm/drm_atomic_uapi.c |  1 +
 include/drm/drm_atomic.h          | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index ba4327fc0a87..53ad341216ed 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1583,6 +1583,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
 	state->acquire_ctx = &ctx;
 	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
+	state->plane_color_pipeline = file_priv->plane_color_pipeline;
 
 retry:
 	copied_objs = 0;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 2cad09a3879b..67cb0c602b7d 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -529,6 +529,24 @@ struct drm_atomic_state {
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

