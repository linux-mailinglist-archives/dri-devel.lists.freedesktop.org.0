Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7703698F7B7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8962A10E965;
	Thu,  3 Oct 2024 20:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nEn2IWEA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2083.outbound.protection.outlook.com [40.107.102.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D93C10E95C;
 Thu,  3 Oct 2024 20:01:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWrCijD0IHUHfS3fBz6ncFnHPupT93ASkbj7X4GXliQpjLYBjw09r3OaUOqCHU0czNFf/C3sXjdCku/0wS2ws+h0ao4pW7yAZFvRM3YqGn+XCxVWXQd1sebm95PJ820C60Anh0RXOFEiGhKeZE7+wqjN0i1EZLYc6p+QJDAsnUCK4eNmfjlyEySaWtIzwRKqv6cc4ApMF0jObotl1F4eVad816kKimw6rCoIIgqRWbtQ1ezYjDh7RO5tGgG4tqAL0x5WaSeXs7onud3n1EIn/5UsJebA4z5MwHX1aNEL81nn2GGMH73+Dqtl82Ra/KYIYDEo+8LOvytkjcY6Jb+XOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQC79tX7+L2j5Er0hVpmFINJsUGj9Xr5WCFOOPSat/E=;
 b=pafifSjfJ7PlX3RxaGt4PZ3HxggWosvOV6VNg9tv90kIHX7SNy2P3jJDVB7TJTa1Vjm2wk30yPi/Y3CjjelLq/54ytCikSH/uON6+fTOp/2EcH7hUvkFgmTPexmHljjIXNl95A7OwXBGwueCktmn1CanInyxHiHB0cjyyM1jxUYrY1pOAohYWRUpYSphxxTWP16dCDpx/icfQyKIEVdPasHOMCwd44q3q2yMNC/TuM82RCqAtqzwvpYMrmDuxOQsm3WtCWwF6g4LYR2TSI7524FiPN/WwGI3pay+IpcrLiKRYnc0jkG6kGKQEb9jC5UUnc1VVp6v2N6V3HcPjhOSYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQC79tX7+L2j5Er0hVpmFINJsUGj9Xr5WCFOOPSat/E=;
 b=nEn2IWEA27ReN5bHt2UzESzqGAl4V6RerP899TIdR3GHl7GgY4RHMbeEnrLEfKVSv8waKBjoCPXj6X5bFZGpJHysNKz3x+I9FSFraDVNkAFJrMqUUYmH/Bq2g2D+avX0UIQLamnc6ViqcGPRqOEtnoxVxMP9JvxMXN1sjR/E6yo=
Received: from DM6PR04CA0027.namprd04.prod.outlook.com (2603:10b6:5:334::32)
 by CH2PR12MB4264.namprd12.prod.outlook.com (2603:10b6:610:a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:01:53 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::1f) by DM6PR04CA0027.outlook.office365.com
 (2603:10b6:5:334::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:51 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:51 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 32/44] drm/colorop: add BT2020/BT709 OETF and Inverse OETF
Date: Thu, 3 Oct 2024 16:01:14 -0400
Message-ID: <20241003200129.1732122-33-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|CH2PR12MB4264:EE_
X-MS-Office365-Filtering-Correlation-Id: ec68d9e1-4f65-45ea-e0da-08dce3e63a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qgx/2CAnY7lLJcmD/0bUHgjbs7SsGWUwfBAcAktXUFSJE02oSkCH0osyYbuH?=
 =?us-ascii?Q?WUy6q2cwU3JszFdMr4QILhT7Tv87r5m1v/lgz/KBWhvnG3VFBci7fcg72P78?=
 =?us-ascii?Q?Tvllx2pqkySNqUelshG8AMqRUgZY121sl9cc/WR9QdgkHNeJ/JpVZx8HqY6j?=
 =?us-ascii?Q?kPoNilLt1kWK5qXq9SX5JBDcfMc6AZ3h5VYtuE8LMWQHz/Lf4z2T3xpaEWZH?=
 =?us-ascii?Q?gGMO1/CEpN3h/YmY+X93iSjcSejWz1kp+6wKlHr+1y/M6KrES++t6ruv6rzJ?=
 =?us-ascii?Q?viZKqgkJrS0cHfemPlmhUGD/CAegHu/LGUaK79v0KWF8KzV7+mX4aNWMyWY6?=
 =?us-ascii?Q?a29HBugzm2vpkYnflQKaqlnyzL1ESzQm55d7Bq+Sp8Gu64AA5OPQbq4oWW7B?=
 =?us-ascii?Q?u67GBhypHyeo1aLE+2k0PqnQe+NzkJV1bPQHxQCltMWDX/wTHDGz2CjL8St7?=
 =?us-ascii?Q?7zbEfaQPF7zb17taYhoo2WHejEb/v4UgQ3XmMoNKjCIfomqDPITtHLyDUESe?=
 =?us-ascii?Q?h4EK3xkNhRgddzlIjIhbgVJLbyTnXOQmSToJnvQJ8c5DO/kfp8vQuNmM+P0/?=
 =?us-ascii?Q?7vAYOCo1wGqKyXu5HhDi0t4bY16j3Rt1pe4XUE85sc4ZoHBH+/ikM/ektNyR?=
 =?us-ascii?Q?Gy2e8hCKvPLQV5yZZ0rVqQPTg2aA4Sl28b7d+KR5YucGEboL2L74NK0kZ4nl?=
 =?us-ascii?Q?vae3EkeNiI+UWNa9OVXNoF/vjfh25PtJVRHjIblGoDbap1/TjvUgc9+fXO7W?=
 =?us-ascii?Q?n6NZZQeuh/5aI6nWYAoIIlSMB8NshZj2OSLwMT7xrNjfNuMoEVeDyMpYLVJs?=
 =?us-ascii?Q?TqZLhNV4ZxMyiPoB+AX1o3g8wLv4rOOgSKasZ8CVwCzi+ftHvwoeix8CvYJL?=
 =?us-ascii?Q?DI+T23a3vtCCXz9+UmYurIg7y2/pFvVXBHQz44L6RcVHH6FB5Zbkaj8rXsKq?=
 =?us-ascii?Q?hG6IbjZoi+kaC+XJj7b1LvTN4McaBqorKqQNiL+T0KVUlmPIVYGsCimf/D8D?=
 =?us-ascii?Q?Ty3VSFQxWwyYn0tuTsUxnMhkppd15JA9WlnqV7QDgSI19DxunvyUs0W4XmoG?=
 =?us-ascii?Q?OZWSu/xKgiewfV9Rqd1a4Knby07stVujACUaYww2KSZGAspPWVZu5XLh473o?=
 =?us-ascii?Q?3SXcH3HE/fc7RwxbIjgsHFqw5xgo1jLmPbHcg2PLSbx2eJND6U3790EtVGLh?=
 =?us-ascii?Q?1Dp3en+LFmn8LvhqGDGCy/APwsjv+G5ydvQQWXkt0PS0SwIlLckJ6QzHtAIa?=
 =?us-ascii?Q?cONGzcbDxADrsT1JVO1X7xIYjBpfEg6fBt2avU/1xh7Oc5i7P6BW4JCX3dM/?=
 =?us-ascii?Q?XEsy/z3NAhcFcpkOD6H4lRqF4v4VRInZfY6d36KGp84gFsTiqxmwhj4R5+t0?=
 =?us-ascii?Q?pUabSAJqRU2ZqKyg28RV57dcrYHe?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:53.6192 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec68d9e1-4f65-45ea-e0da-08dce3e63a27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4264
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

The BT.709 and BT.2020 OETFs are the same, the only difference
being that the BT.2020 variant is defined with more precision
for 10 and 12-bit per color encodings.

Both are used as encoding functions for video content, and are
therefore defined as OETF (opto-electronic transfer function)
instead of as EOTF (electro-optical transfer function).

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_colorop.c |  2 ++
 include/drm/drm_colorop.h     | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 6e1d733ca50c..d6af7910ffc0 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -69,6 +69,8 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
 	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
+	[DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
 	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
 	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
 };
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index f0cd4cbdd99e..ca3a480db787 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -54,6 +54,25 @@ enum drm_colorop_curve_1d_type {
 	 */
 	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
 
+	/**
+	 * @DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
+	 *
+	 * The inverse of &DRM_COLOROP_1D_CURVE_BT2020_OETF
+	 */
+	DRM_COLOROP_1D_CURVE_BT2020_INV_OETF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_BT2020_OETF:
+	 *
+	 * The BT.2020/BT.709 transfer function. The BT.709 and BT.2020
+	 * transfer functions are the same, the only difference is that
+	 * BT.2020 is defined with more precision for 10 and 12-bit
+	 * encodings.
+	 *
+	 *
+	 */
+	DRM_COLOROP_1D_CURVE_BT2020_OETF,
+
 	/**
 	 * @DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
 	 *
-- 
2.46.2

