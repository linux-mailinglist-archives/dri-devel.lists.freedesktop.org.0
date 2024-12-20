Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A75D39F8B53
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAB410EE73;
	Fri, 20 Dec 2024 04:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="f156kTZe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B8710EE70;
 Fri, 20 Dec 2024 04:37:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ToNTdUoLvJDJfqhozYDh9krz3rKnV5GTPj0iMefYOvsUWuXhTeiSz27VoxDCAbnBNp9zdChmgWoMaigpNQqbCIgZTejjWrnskv2ULrApEtgZmPjSXh9GWNUhLANFpoOLip+uPMve3y+IRlLcGURFoGQ6BybYfxgbjPeDrQiSOUUOZQs3DkxdaZY1nvcd9HCcmyomuZ3hSRYpyFDDtix993bN1JOM6DeH9n1fp1Q3jcUI82zVoOTgLLJOj+WjwJlzBMH90z1FOXCwdtgMJuYnn1rgyJCHBYFAoNwqFxht4S1mgE+ksEBYOdsdijOLSCbmvuVtWzeFBloMrNT/ErTfjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTlyZLU3JTT0zOSWqu4zO4IwXBi2qBFlRsK6dAuzRLE=;
 b=eNY3pFURFRPF33luLFSFyfyBL4DcLzvCzmA3b1C1eFa4o1ezkt29wjRRrQSQA3CrIi4bPbY9F1z/VdpJ1wUh0jYnSXjlieKOb4+ldHZd8o0f8k/P7PDGLj6vRWQDI/Ex2oBe/Sdj42ewH7jNuFu14KmzCQYcjV7Ie5vvPFGd9uKKfDQ15liSRm6EtJiPM+/PAtc6PQrF6G/LD4jom2S6L4ew1DLybbOpTMBaqg3xINMIRReywuXBB3bwMGzTm3rqSko8nxkFppkpupy9XbRRnDqdzN9RUhIxwNgH2I4n/UupbHWfWV94Xggp/UgeTco1Wy6MFntW/QKPewifZEuonQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTlyZLU3JTT0zOSWqu4zO4IwXBi2qBFlRsK6dAuzRLE=;
 b=f156kTZe9zOiiA9xQty7iyGLWfoysR+ax1Hp/Bq+stSWrIlNkFLMhk5ij5tXA2SZ/m0csNX+IrzycyVna6PNPti71FhESuFtNud+k3ZFODLUUCKH50YoLPuQMP/WZHcWsRblzcMmcTBvR6cO2AoItne9Mybv6zqdD9sQJ+HZ4Yg=
Received: from SN6PR08CA0023.namprd08.prod.outlook.com (2603:10b6:805:66::36)
 by PH8PR12MB7279.namprd12.prod.outlook.com (2603:10b6:510:221::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 04:37:38 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:805:66:cafe::65) by SN6PR08CA0023.outlook.office365.com
 (2603:10b6:805:66::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Fri,
 20 Dec 2024 04:37:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:37:38 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:37:37 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 08/45] Documentation/gpu: document drm_colorop
Date: Thu, 19 Dec 2024 21:33:14 -0700
Message-ID: <20241220043410.416867-9-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|PH8PR12MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aecc49b-32f1-472c-ff1f-08dd20b00889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S94RBBM+bXvb7dzLDb3kyUIDc4tPk0BG8wiR/zei+sYgINf/bzKLOYQ1DqhP?=
 =?us-ascii?Q?rZ+caolvRzRcVwMnb7zsKN+X4lqYAsYPVQyis/CiuxEJaIe6SHxAWv5WxaFY?=
 =?us-ascii?Q?0grjMMlnw2IDn0J3Rr5GwLjeJwIfj1vkSYvU9IvIYQYiXXAixrJvAkHGkVRM?=
 =?us-ascii?Q?zI99hLLK++vLe3ciUm/qw3Q71Q0/J3qTdcDWcmyeKlfuSgv47ZVF7e75ZvSI?=
 =?us-ascii?Q?KnEjsLANBP61GkHNLYTonUNDsWwk0xnCF1y1oVnQfqb2YLexidyAnArtMXx5?=
 =?us-ascii?Q?Ucf3stocsOY5SARWbnCiwbNb1uhyX+g8asRu/BDwbCjUp76OuYMy2sLEKnPR?=
 =?us-ascii?Q?/Vtpz1OG9UGWAIkoff5LiNP8v9HswdVigh5fJe5k5Y+HHsL3suhQZxb/GWgq?=
 =?us-ascii?Q?X8IqRE7zr9o7YIFRJlU9sV6snTTEu1Q6el4ppVxgfBeufqNzP3zrPPWusIf0?=
 =?us-ascii?Q?52pS2Xax2Op8n1btG1pW6EZENUAP1tRIe9iiJ14w9AdMj9yqnHfxc9lGEAnr?=
 =?us-ascii?Q?Hr4eATNnFUgegtz+6an3GT8aGXm4MZvRljzadNNx+cH2KlEuO5AD1MG73QV1?=
 =?us-ascii?Q?c9KDJDYwrkZTbDDS+otZJIsJI8y1FAeFiASaeU/4CoPY/GnFY+5aCXz6VJS4?=
 =?us-ascii?Q?lL4dQol6LUlQKZ1cKJAsVWY1RwQPmoTqWk8Rx9UNUosqu27AiwG9ghDRpnnL?=
 =?us-ascii?Q?lxfn9HdyMoB8EhfulXAnFpjvFLDsw4yPj/ivZ+y3qEJW9qD8s9zn1n+YvbeB?=
 =?us-ascii?Q?r+mm2wVHKBosTqFu9r9P4TQY3BEBubIuE59S8KCRPxC+WMI7dePSfdwy2vkA?=
 =?us-ascii?Q?IcbKpg4u72C1mN/FI9TSFDIx9QAuHEJdPvFDEz7DWXG0it3Afdr5eSxv3o8Q?=
 =?us-ascii?Q?c4lIJFDWDlf30UKxz8JdZqVLg3NOv2odi2KVxFoMSyzCIni935or/T5FBwMD?=
 =?us-ascii?Q?vLFROE+3fHAsY5EtjmfTWhe7esP3OSncSTuIsHT0DHQLVB17E9QHAq9Q/upk?=
 =?us-ascii?Q?h+lSq6OvEBkVIeC4xJDG9YxN7bfbS4tHFarA7013TRULHnipgVx5kFe9q0lp?=
 =?us-ascii?Q?CR6JfktCyW6fGz33j7/FQoaYlAVPWm+Y0pWML26m7cpAjxmigl9dU9DuEMij?=
 =?us-ascii?Q?8vVs7KEQjRkMQJH8+0XHGbUOsYtO+imbefR4YVYqwMJy7tPyPGxnsVqxRKuC?=
 =?us-ascii?Q?BmwTNnI8U1vD7gSnHnzvgkvxYLFf7MNC+foaQHrZfenKtpzpjylmvoLh7aeL?=
 =?us-ascii?Q?i8PuNNEgyarM5Jof8h4swfQLXLm03lTe7hM6/fE5fWomgZ9dr2cXpJv2Ne4z?=
 =?us-ascii?Q?N1QQ0SbZoAQrAuYTWFy7uUWOFEVA9S1Di/jSW5DfRA+TNALUJNCauBM+MWby?=
 =?us-ascii?Q?6Pj2cCu2SX/89Cq8b2hHufuKiFd2vZ8/ddMPvkt0eczA3aIir+I26wyt1Q1O?=
 =?us-ascii?Q?OXeLj8m//reTML+kvg5STVpRSh8B8tn+i6zQWrWjLtS7iR2IHvyKpSFfTV0B?=
 =?us-ascii?Q?eQFqlWSuQC6TWu0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:37:38.5291 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aecc49b-32f1-472c-ff1f-08dd20b00889
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7279
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

Add kernel doc for drm_colorop objects.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
v7:
 - Add a commit messages

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
index a42de0aa48e1..aaaf96d729b9 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -31,6 +31,37 @@
 
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
2.43.0

