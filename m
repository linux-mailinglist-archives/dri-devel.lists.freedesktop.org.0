Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B266198F79F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEA710E931;
	Thu,  3 Oct 2024 20:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JYrUkhsQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1F010E92D;
 Thu,  3 Oct 2024 20:01:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4PkU75XBRVyq1K+LZJJuziml00H0vrcclyqghorDc4hUDw9he7nYxen7IG3CN/2AQqIly0gaJQSbfFgEgjhFb9nDMm6CXnXgKyWiLpz6+4A3LuXBcPEyfhsvWUIPjYiys5JMk2VPTD5yXhCQV8Xw5l0wa5PhrXFrpuz2rNYyVeyEC70++6DiA8Z67LtmkjM6/grQtAsnLhOYTXg1yK1cDCH/PaliPGralJcLGd21pASFVreObeTEK3Ys6Oh9S0B+hUHiRrOgiCMzvX5UEfSmV274zAuTVXChupt60UbYKGrTCPLUGc7//SdrOkszkPwkEM8OXYBu0+oCiBoqHa3rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2P0NN1OGUCeMabbtVdaccWSYjnzGFiUdU0g52YAZ2EI=;
 b=ESPloU6SWu70DTizjSvyBhSxrEnFn+2YsKdgRrnrhbuKfcDaSN5nmJ1X2YJ0Jt86J9br2ErvKtW25VhaKFcI/R8HYxh18vlOcSPirodet53VEKAx6Wmby7BsKSZXMsTjf4y2ZgYnHd24tMfZSrehjxT+eZXBCHzJ1sdjmpbVCkHlOAwY04uOuf6/PYiFCVcHx1PnKgGQLKcjDvb0YH9RUZqbwuVw09c35rGvY4uZfiCbfBzaToURe1yLrIrq5Au1DGY+XzdKoKgm6FO2RmMgHwEVC7bVQ0+UieySUvz16eviVTQ25VjpL8jaoRNCWSgRYAGzzSr7WIDhiITH6+h1Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P0NN1OGUCeMabbtVdaccWSYjnzGFiUdU0g52YAZ2EI=;
 b=JYrUkhsQoy6CcwT3pdg7m/YGujYURdJj+tjYBLGe3h6H7uo+MQHsiRDderMbiqHCfupaQSJplWh9SJsbwwIibgN9XUTIcbgIvPirfYlnT2omk18pbwSA1JAUoh5OSAfTdkouQtiDBcZkwJ5XlX3rUaT5E07GThUh9DM16+9yNAk=
Received: from CH2PR14CA0035.namprd14.prod.outlook.com (2603:10b6:610:56::15)
 by IA1PR12MB8494.namprd12.prod.outlook.com (2603:10b6:208:44c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:01:48 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::c3) by CH2PR14CA0035.outlook.office365.com
 (2603:10b6:610:56::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.17 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:47 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:47 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:46 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 25/44] drm/amd/display: Add bypass COLOR PIPELINE
Date: Thu, 3 Oct 2024 16:01:07 -0400
Message-ID: <20241003200129.1732122-26-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|IA1PR12MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: 38aa3974-cef5-4bb4-03d2-08dce3e636b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WBGMd2BH1wxyjHRpq7xvNk4PJU6Gqv/fnqcp8DF3N8V9g6Xl7Hd502WCTUw4?=
 =?us-ascii?Q?QlTayDzl4q5+9j2roCwX3T1XYcdBWBPrnwZIKKTWlhXywk1ol/dBRSdd4L5a?=
 =?us-ascii?Q?oCENyUEn6I8s1GQg6yxti+brtAgzjZbYn4sBDydJWczDHULCDXrYb1lBZ56y?=
 =?us-ascii?Q?/OqXtEbUUGyjMv7ux+ES/N/lOo5mawgRl6q/aCrAHViiFiFiivKoWNrjg2kC?=
 =?us-ascii?Q?ehQEv2zqwEUbRo5nwKhYaNa9pU0/rkNT4DmV3svapXMoY03/Rbwz1Vl1cHFU?=
 =?us-ascii?Q?UqKlrndxqClP6kym2cxsIsVtutQYzR2vQYP7hh+JHmhvjQvNkuSgOZszr93B?=
 =?us-ascii?Q?6xQpX7TGwG/RyuRiQ6BiO73oTT4J1Y7DrY6XrGStYEJyxpzuZ25Y08WKsete?=
 =?us-ascii?Q?BvyYAjLMVpYJvKsNLP0wgKzDrJ/ohCQ8EZCoAewC4YTPZNa6etr1snG8whB1?=
 =?us-ascii?Q?Tqe8a3tNSEq9yip5XjzNDxKX8b+tjno+EnSy26DsvxfAXDc3ffDsMk6L3ggT?=
 =?us-ascii?Q?LpYNqq7sMJrPY/IhTdJa02W1z1AJWaPGhVJ/Yor/G6Q9VLqHaof68m4wi4pe?=
 =?us-ascii?Q?XjccroOBBJFhyZySDpdqZVW+DOUinN6AKRdOsqKwPcQfjvsz5xzM7gwmsAOU?=
 =?us-ascii?Q?9xPXsAuc0kAjivi1cyMkFuwRc11ysKd+3hIg/9qJpfyVsvk/ECTJk+OdFMo0?=
 =?us-ascii?Q?NkFyYXleoO4AOvn6+2LJPAlSkEy+wdkfIGgCXJRVadIw4ScHWnPq0uw+V6o7?=
 =?us-ascii?Q?B6fbZOcZW+srybyMe9Gh1uB9Mwz/mTtis9go0wUbkffCvI0itGhHyOFVvoLM?=
 =?us-ascii?Q?0UUfcumC9/7dcuP0zNbLT7Kkz3JMhHckem0ULaxwUMJ4OhmRGJNN2x1hgHJv?=
 =?us-ascii?Q?S1a+2huAncn+56dpNER3ULajg7m6izpzx52KHrd5R8/PBRoE6NN40PdsYnfV?=
 =?us-ascii?Q?veS6qIVEHoXzWqOicn0fxqYuPK3iJNjnB8QbbkQQe6orj5hjEJo26CfdC7By?=
 =?us-ascii?Q?EN4fr51YTPKXP31yPkd1hjbp+vxgzZl4ESC/29qp5SJBuobAX8SpN/FuPXp1?=
 =?us-ascii?Q?+AnTUVovOVbKSNsfT//VXjHj39CpikC3wT7xJKH36YxV6gwLgXvQkdAr84Ei?=
 =?us-ascii?Q?4Cm8472SW8eB/w9HPps2bKAvO8C7X/c4mw40sLmsKlIQfo/V92V1JB276RZW?=
 =?us-ascii?Q?EqUC/0vK8wspNwAgE+HAc+pNMjposSRCH5BNAKnqA+enZ+zvtoEsKhdcEiK/?=
 =?us-ascii?Q?3Fhmh8HinOFygZAT8Oc6SmLqe+ZUq7HPIug2a+/1XsNAHzUvECItz6g1IhvD?=
 =?us-ascii?Q?YexMTyZV1NORhkN/hNVkycIzp4ZO/RLaHn4VJNYwuPTSmQN763H894C/pomF?=
 =?us-ascii?Q?i4MMp/XO0M9WqdYCPIt7i9rox+9v?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:47.8006 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38aa3974-cef5-4bb4-03d2-08dce3e636b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8494
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
index 495e3cd70426..22ff9a31b592 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1756,6 +1756,20 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
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
@@ -1859,7 +1873,12 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 
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
2.46.2

