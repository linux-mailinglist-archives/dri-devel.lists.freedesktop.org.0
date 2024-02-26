Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 354BF8682A2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BAF10F1B2;
	Mon, 26 Feb 2024 21:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yvPEP1V0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2057.outbound.protection.outlook.com [40.107.96.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7AB10F16C;
 Mon, 26 Feb 2024 21:11:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+aQH4G9pUAv0tWAzd67vBs66kPvDf/HTH/lppzCu0yNjgH+YTuvGkQldIgdfULepxczQmdJBCNc3RD9xldC/uD09NDsBXIa0/xl9w5lXFcJHkQXS0Z9fzW2KxKADuidPXW0eaOdLAml5upJAYEAwulRu1S8NvEQ8Zd+Sz2TACfLKWc/ZPwmC9rieCFDZrM1zs85XUS+fLkzQEa8rqBqho09Tkj0tgvRmzo8zxh5rPKFp7OBoYYe5U/VhTgwFsTLutrRwh6yztvxQ/tqt6IEkU+kM0l0GbdJh0CtDW1Qenul5mVMQwV77uwkByocYcoGdKCRdFD83k1rC+4JBHVm3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQp/3WA67qzabOfvijvzJPvS4fe08Q+1w0vJlS+bFmU=;
 b=an5YIPEuogDbMW7YX2tYhzSWe60BpTxBLs26nJWjA0s13BVZ5TnwEPuBWFqVs+i0iboEVBJfdEs0TgSDKGM1eglXFvRk9h0uQKVdQpvIH7N24sMhdPajuLW9UHGxz8ATEZuYYcCBB9hcvSHcaBqxc4BL+7emeGFW+8B6Ul7FkgO7vP7f1ajluPqbWqxgzo6tkzNRzyKTbau48OkUXgt0/claQHk/EDlVpXfhO7g6ZfH/le/2NJTf++3kDW7UpJeCkhPP3LO1gSMEbMLeGhm5UF4NUyMwC0LbTIm2wHCyqp2vJHHi9POoad2uJ8/TkdNMsReGYxnWdqo+Jco6d7i9tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQp/3WA67qzabOfvijvzJPvS4fe08Q+1w0vJlS+bFmU=;
 b=yvPEP1V0ztyu4F3WgCh23jOZdHgp7We+jTaEaB0ZFx+XVuhsYHN4gzaJN1LT7KCsrGivUixlWuGCxHUPkOtsh5vLEg8abrC5cjtvT4yAdJf91TYTQthRxB4vqX1oKv1i9aVbzTzx1S6lqW3NKHgi2PDfMAMiyo0T+vI+HuOze+U=
Received: from CH0PR04CA0086.namprd04.prod.outlook.com (2603:10b6:610:74::31)
 by DS7PR12MB6191.namprd12.prod.outlook.com (2603:10b6:8:98::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 21:11:25 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::1b) by CH0PR04CA0086.outlook.office365.com
 (2603:10b6:610:74::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:24 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:23 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 29/42] drm/amd/display: Add bypass COLOR PIPELINE
Date: Mon, 26 Feb 2024 16:10:43 -0500
Message-ID: <20240226211100.100108-30-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|DS7PR12MB6191:EE_
X-MS-Office365-Filtering-Correlation-Id: 062a4893-20f1-4441-f51f-08dc370f7da2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v2GBa0rt03xZG0a7rng2JHCRPLFvkZWByYlnSZqiIikhygFYWqnMO6gW9N/HoOG4R7crn+v7K7Fb9uegf6Aa2umTN4OhHK9WQ0bcn9z6oytJJVoW2KA9hLTxxtKTwEXU/TVeFiBUFYJgbTvgia2b6vl+Q/a4ScS/OP8K23iiW5FrJZTP7G3FAOVYEHnvLPBQs2AVhTYhIRVEPC9AtZzi7DHEAe29G9dj8bay5sav1Smc4UKbSX9+q1zRH+Ty9R/bgfx+YteiKi135TEuAKltWYI5cKsV4MHWTeJeMQjnPFLF/RmVfI5eUfDP6X5YDjlh070evkv+17ti/qzuGOISxngqkN93BbaXLcDSNoACB7rGad0iwm8AprDRlxGXaB9cM7ydo2yw9rPDtSIsk7fOYDZ/0YbUN3vVdN5IElLqATEi6bm3DLGhONWYfsxo0BovwNUqqUwJcAHfN5i1vCyzYv4HO4KIEzuANsRHefp7t+dXSKENqF2a+MZG8+jG5thOhQku2+51sOFlbduBIJEwBLP0q9zM9zx+t+OLT1IjHr6KbTTFoEfS/j3szcTSInf3UORe8aq/UoxTHM8pR0TOYFTxjU69Psr1k157ParTRuAzkTRJJXwzBUDU9CGN1FL9Zoa5Hpf0rLCgpJmKb73GdvMeocNFt6MYStDFCR9tn2dVtJwPDFB5v6sCK03P2OvzbiMgRCWYnHYYITwy4bVPuTkqy88B1jLGmRc7jN06tilVps+TWoFKsXJ9j4vUvkd/
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:25.0855 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 062a4893-20f1-4441-f51f-08dc370f7da2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6191
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

Add the default Bypass pipeline and ensure it passes the
kms_colorop test plane-XR30-XR30-bypass.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 8a4c40b4c27e..c5c07b4cd6c9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1651,6 +1651,20 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
 }
 #endif
 
+#define MAX_COLOR_PIPELINES 5
+
+static int
+dm_plane_init_colorops(struct drm_plane *plane)
+{
+	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
+	int len = 0;
+
+	/* Create COLOR_PIPELINE property and attach */
+	drm_plane_create_color_pipeline_property(plane, pipelines, len);
+
+	return 0;
+}
+
 static const struct drm_plane_funcs dm_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
@@ -1744,7 +1758,12 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 
 #ifdef AMD_PRIVATE_COLOR
 	dm_atomic_plane_attach_color_mgmt_properties(dm, plane);
+#else
+	res = dm_plane_init_colorops(plane);
+	if (res)
+		return res;
 #endif
+
 	/* Create (reset) the plane state */
 	if (plane->funcs->reset)
 		plane->funcs->reset(plane);
-- 
2.44.0

