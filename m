Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5318D957621
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3D210E3E8;
	Mon, 19 Aug 2024 20:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZTxFlQis";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D20A10E3C4;
 Mon, 19 Aug 2024 20:57:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPVZxhUQ0Jk2dffBpoi5DDZXCeBHyI9j8EnqmN45gWt4Qxw9lumJ0S4Z1IST9RwhlHK9ouI19B6JxYnGzTuygINSCNEIghVVAdVY/GG49b+VTfUVRP/C0T2ojn9/YQw4Lo3okUwITEq2ZvvYhVSDEoKQwFM1gH/gnYGxRkJOJ6mkSSVqnPPkK69na1XTMmKruhmNGn/Bce5kvvUbKwkc+Jgrcv8srth55/63e95269DKKn5+Jpd0KHba9kLgj0clLYixAPVVsX9BLFosEKApag0qbzleNOPGD2DjDFt/htnFdmbeew2iJqp05aujJ4IAup60nawyGkCY9aLdIEMpbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/c1irMJJnKov3bjFb7iMYDx+hU2OWsY42DdRh18xZi0=;
 b=K8p9bzWHvm5b6Kl0Fi1JJNmXnVi/+e3HsbA8ljc8EwpJMGp8bi524Q6gwuu4BEY5Q2iN9eG5ZVXWqoTiut5luuT2szZLiNB3AvDDTWPV9BdrWVg6fHxclowmJSRuHRsmSoXkA5wH1rCNH2gPzLizykAkPfxUpzn4+9wCgiIc4tyvp9uUI2600nUGh736ytTykFSwn22eroJ/82iD9D0cT3Ov5xqTCLv+8T3BkFXNnbEPn7KJQ5LxjU7Zg2qWNEOisqxTW+SufTYqGH/xPu3kRsaMbGu4enDyCZ1zRPpH4bAmbJZi+vhKaP6rLVS5PFWkZdEnzeA+Dz5pvwKYLj9cSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/c1irMJJnKov3bjFb7iMYDx+hU2OWsY42DdRh18xZi0=;
 b=ZTxFlQisAKGfkx9feUZctP8RnEsSNGxZof0f9Why9rcF4+JbSp8+Q+XXdo61HW0mmDd5kT0gktcKpPuA00QozOqAIy7B2T+15dAF+Q6awQEKEni0oNNSlakq26xGqkcya8wogJgRajFrJ10KRXvcCFuM3aodhXkIzy0W3alYK7c=
Received: from BN9PR03CA0744.namprd03.prod.outlook.com (2603:10b6:408:110::29)
 by DS0PR12MB9273.namprd12.prod.outlook.com (2603:10b6:8:193::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:34 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:110:cafe::bd) by BN9PR03CA0744.outlook.office365.com
 (2603:10b6:408:110::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:33 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:32 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 22/44] drm/colorop: pass plane_color_pipeline client cap to
 atomic check
Date: Mon, 19 Aug 2024 16:56:49 -0400
Message-ID: <20240819205714.316380-23-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|DS0PR12MB9273:EE_
X-MS-Office365-Filtering-Correlation-Id: c70f5074-3a57-4e48-d9be-08dcc0918c70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D77HG4U7Fjf4y0IwB2oGR1KIRvxnUcrOIcFqGz6QjdtUPPMrYWLLbuididWP?=
 =?us-ascii?Q?NXA8ME5FlK3v0A/A7syeAEDX0Qxsh9fm/kjegUC/zmqRUvpj8cgTugjK+0sM?=
 =?us-ascii?Q?eJ+R9g9F2ef5czfBHUw935VLtLyr7NJUSJGB3CJYSZ1wmU3AnIKFw6Gz4J6F?=
 =?us-ascii?Q?7H4dw1fwqZXKs1IOsUotmxJQhrFsTYJe5dzDto4GD+vOWn9zOdJttPDTORwD?=
 =?us-ascii?Q?mc4tvLi8YXxO002degCh0sn3fjtRPeI8llH9+kjAQyxje5y3SaWahGp+ZG+A?=
 =?us-ascii?Q?dCcEqoGvraMi3TOysziJIXmIZDekO9/BVncE1FN0OW0JHjXR0+Pewx98/bsH?=
 =?us-ascii?Q?aCKe5X70uPGmX4qBMF8n9VaoJegdx1OLGbNNBRIG5BT3IlmrInzqRl11LNS1?=
 =?us-ascii?Q?0qWBHeoDeIazyixdTCr26rYJY25cgY3ru9BL5meB0RXpF8llaC7OwmXkeMKl?=
 =?us-ascii?Q?Mh3jG3YFNnxTgXoMf3MuOrHkieALVpVLYsi1ZiXALJu6YGhtG8lAWRACIXrm?=
 =?us-ascii?Q?qZfTCjMRHJITvIUFdmUmEeoYAV3F0mDRJxq4cP7eA5DrImiZbE9ieEm+nH2j?=
 =?us-ascii?Q?E0LIpHfCOcOAGkVJZKaT5BkYI5ZhWIHg5XfJMxo0bxULawyMLC96zUUnObaL?=
 =?us-ascii?Q?jbgkgwdp0U4aEukrNS3Wxrl06OcPkRf+mgCR4SMS4c86jFr7Fs5j1DOxmcL0?=
 =?us-ascii?Q?UHovSIT32pAPxshyQqblifB4lHum3vwML7cTygfL7RWvRPK8/d9BTpyWNNTD?=
 =?us-ascii?Q?/S2GeoOZmTvCEuJtPNuD7uXA5XaSS9Ya/BwbvEGG8BkauMOGy5dBN26NF6GL?=
 =?us-ascii?Q?9SUP2pDbHLWQQa3XHfC2Vb1aRvECI10dszfxHTmFgyb48tCuRsZ1pKjqwH4x?=
 =?us-ascii?Q?PXJlgNB9y1HMDIctkqYIw9ZK7pVjjwgM6ZPJPW96gVQbC3EzEndcPKgFFYTO?=
 =?us-ascii?Q?iXsJHcxN31yvHK27fuGfhkDxQlBJMCgcYC14pysUEtS0wgsDA0cqvPPyW+Y/?=
 =?us-ascii?Q?6Drf/5dpl6SmsUYEztUFYrRG6YkMdUgMopFk6hMrJ434HeH5C32ZIMcDJvk5?=
 =?us-ascii?Q?Unu7bSO8/rA+Jz4qEBD+V/Y1rGoJ2ixJiEVmX/iBxbTdLc9P8Slz0rDBAQuT?=
 =?us-ascii?Q?w2PaRa2nGQwlHVZjcGL6vyums9kEDp5oNfhBrkEQwwsoIBeek4rXm5l1qYJ3?=
 =?us-ascii?Q?PyBK9mg8hCmaHMvi+byUUqhTQInXIEaEW0nTdXNsx9eFv/PlB0xarXqboO+T?=
 =?us-ascii?Q?dTRcLcGdZ4FlgZOF8K58GEYZ5JLxvXfqS/k06fvucq5oUYl64HILpGuvMuOg?=
 =?us-ascii?Q?621IOp1CcLJHirCgZVOZBVrTYL1CWuFjwqXPPr2CqDH9OI+9JdIJQqPFbV2E?=
 =?us-ascii?Q?2r29carkU2mSC1lf43xa62jv5AeuDS6ybb15yKdIUaLhqYgIuT9wpH5gEOJw?=
 =?us-ascii?Q?yxL2WeKssljz/4neZ/EBGVdZFAnbAcxk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:33.8139 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c70f5074-3a57-4e48-d9be-08dcc0918c70
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9273
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

Drivers will need to know whether an atomic check/commit
originated from a client with DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
so they can ignore deprecated properties, like COLOR_ENCODING
and COLOR_RANGE.

Pass the plane_color_pipeline bit to drm_atomic_state.

v5:
 - Fix kernel docs

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  1 +
 include/drm/drm_atomic.h          | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 4a9cb1f7dbf7..39805f822d44 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1578,6 +1578,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
 	state->acquire_ctx = &ctx;
 	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
+	state->plane_color_pipeline = file_priv->plane_color_pipeline;
 
 retry:
 	copied_objs = 0;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index d8232fbb002b..c908ad75b95a 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -414,6 +414,24 @@ struct drm_atomic_state {
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
2.46.0

