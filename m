Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC199575FE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F7C10E39C;
	Mon, 19 Aug 2024 20:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cPe2L/G1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3719C10E378;
 Mon, 19 Aug 2024 20:57:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wbe6wWOwkAP6Inl1AdJJ+Q6eqiM0k4jt6VJks7llPaVC7aNXtrIrS6A4hrRkF9Tp4NM4ZoEWSFO28TgEAaT6sghRbhlpKmf2ekflWKIb7G/lPvl38cN0mrdyM+Bx9U3FrOv4PFsxJ6tn1roRqxO8zEgPe0WmW7VkuPnrW0v78gqCCa58g1w+mchqbsTfAB6w2gXIBd5Uj3jTgocHsbSb2lvowYoqDlEMgixy1fjhRwv8Gn8hyJcum1b5L0wRhPwq7W1fFtQlZt58TpvXpQRZNsJsS2iViEcSwt9rkO459xAsK+FDdyx7qeuy3jMvkkzHSwv49D+zY7rX5D9jnyHKxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbGCSymrFIO7Am73oOmhkbcqSWq/9vYvSYeE5O3rR9Q=;
 b=SAhXxxjZ9Anh8rTekZlZyZR8z0ASXOlDC2272zFlaYi6NcphigWlEnwS3GRI57k4dX4bTbvyQB1/pq/TdUfNNg54ZEDf/fBJF2o2fV71vm8UECZq9CS+Jc4fzp6Q9WUvS+x2MWgZgttvml2aHRimShQZ1+qxcBKCcM54We+6zKBnOr9QCM7xMYyixzfTGb/Wv4cTQHygjEO992mqyCgreSm9/0/E1YC+l4caFyc0FI67AWPdJlxZJl0mufxEKP5F1us9HtFi2+7aOlau55coCSeoVReowu+BPxE8ezImVSPpoQ/d+k0O9PEQpZTg8UNi1Dop5Ddg+4Mu8y4z1+oiJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbGCSymrFIO7Am73oOmhkbcqSWq/9vYvSYeE5O3rR9Q=;
 b=cPe2L/G1R+A6yEAl+jQIUEYwGpFjM6/MrAlY7rgVS0Efv6CnkMvIk1yT5+iXmgfq2yMeyr3Yue1CeAP5jwjdG0ydPNr7Z6P1t1zGREo3eqNGM84ovg1pbStYUd8CnYLw35Q8IBqPYPa1Kjsiwos4h8I2ZcOcPcT74BImMojkNPk=
Received: from MN2PR17CA0004.namprd17.prod.outlook.com (2603:10b6:208:15e::17)
 by PH8PR12MB7373.namprd12.prod.outlook.com (2603:10b6:510:217::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:26 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::1e) by MN2PR17CA0004.outlook.office365.com
 (2603:10b6:208:15e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 19 Aug 2024 20:57:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:23 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:23 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 08/44] Documentation/gpu: document drm_colorop
Date: Mon, 19 Aug 2024 16:56:35 -0400
Message-ID: <20240819205714.316380-9-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|PH8PR12MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: 21de3b5c-2469-47c1-2e64-08dcc09187e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AfN4WkUIBevQ7t/tMEaPDUW3ZPtoSUwnd0ra3nUMMiUT9CvZx7BrFDZNeyk3?=
 =?us-ascii?Q?LfjituiLX9/ahXDzQjbS0WBqxkqH1mkcnRVyVFKUG95BpDVMAP8Kz3rWMf3f?=
 =?us-ascii?Q?IZpgMUrOlYs5C1L1Nsk2EAZWvrrmfxBoIFDcvA8vXeptktDHKz5RFPFerIUS?=
 =?us-ascii?Q?PI6wZr3gOFpJxvQgK5uVXOx704B0HJsMPKOHmcFoN0f+qIg+3bnI5jqsHniv?=
 =?us-ascii?Q?6eKhhVoSkzee3jlaJbtPuRIKf0Ii451zrg6AYOAbpmPqVxFOwSkqloFdV5X8?=
 =?us-ascii?Q?MQ8lOB3vfTwgm69OHpLDjf3VSa1WJw4zOzlrDjgEkgn5QmnaMkeLW5vNzMaw?=
 =?us-ascii?Q?04HuGQb/F1Aw2ZnDdreMoIzaVeXIQP7c2vEK7Jaux62A1ArWDDCxmsdkZn8t?=
 =?us-ascii?Q?Rpd5h+Z+HhvsdwZLxop3jpn8Cvcxnl4AFOkfqlIWb+3NHPExDoPcJtTpoVB1?=
 =?us-ascii?Q?qLTyLM4prNNz9WHi5nFOgEDBuKBCfra4SCFzDfKlQbSqNsa6rWH9iFzetRIo?=
 =?us-ascii?Q?Vodl+LiDHVuPvVuckUzV0eC6R8S/UBszD/RUYv0Nz6fjj2SVQUaemBtkypVd?=
 =?us-ascii?Q?TA+OP7lD9waAJWzpe0t8EZuDndHjhjTixcRzz/xZ/4HWse4QqMEcIfwG16jp?=
 =?us-ascii?Q?jU9thgU8J7jRLciLNmrclbuIQZIB5IEOE7WEgU7XZq3qnaB0drjMz5rDcKJT?=
 =?us-ascii?Q?bfgUHWzktQJpaAzR7yQ60RxuaFs9TGxAnOepUmMzH9SNxU4AgnpoOg2fG5Ss?=
 =?us-ascii?Q?OokzPyxEBy9yetDgH2SVLeW3blgnK5cLHnK3XvbSsBLcn21NX6nlwa8VzKjr?=
 =?us-ascii?Q?FfJiYDOMWByl320Oq2TvXWv1IAipD3XPYEhzpa7E8crf8jylHgN/bxyOdSUW?=
 =?us-ascii?Q?a6x3pe49y6TgF+zWLseHqI8E+7E5wINBTHTOA/18X/rGuGOBgdA8l/Mn8gvU?=
 =?us-ascii?Q?Pb6ywYmrQuW/QJrhc5UgNGhADyam+jYQowtgqUybXRzgA5YrpMzVCh3sArxx?=
 =?us-ascii?Q?vk/U16Zr2gQ56U8HjgGmmmWLNq+sozUdwJwoAqItyAvcNA/6PGa5Uyso2e5E?=
 =?us-ascii?Q?LnuaaUq2u/BpLpWqe3yAoVcWFOfbgxg0FiSYf4AZWhv6obEbepEt0m2nCvqj?=
 =?us-ascii?Q?g76+GSlPAHfRgusYuG46FGEAqZSKAkqu0AE2WbBZCvD/uARkF71pOadXviRq?=
 =?us-ascii?Q?y+3ZUrkhPX7AIgnYCsoVgtWLh1hsSnhHugFABjdfL652FdNEi/rDQ9pfKoEk?=
 =?us-ascii?Q?CAueLGZDb3dwvNXXSIIdsVrC39kZAa/dro2QhR/IBlrRUcMloRrpbZW3iJKX?=
 =?us-ascii?Q?8YN4YVcUFl9wgCQufbKvO4OuH7jLCSaTdu5zgVHOfCAAD3oAtdQ7fFtIVwkw?=
 =?us-ascii?Q?m+0A+EwvHDScdGuONsYH9cP9xUVEin41Cr5w/rJH9kfh15Q5EqI7pMh1Wgsw?=
 =?us-ascii?Q?usCaYK/7ebLmBgLhBqZD1hJ1G/LGiaIR?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:26.1983 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21de3b5c-2469-47c1-2e64-08dcc09187e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7373
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
2.46.0

