Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11936C5FB6A
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4134C10ECE0;
	Sat, 15 Nov 2025 00:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wDwta33E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010058.outbound.protection.outlook.com [52.101.56.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5242A10ECDF;
 Sat, 15 Nov 2025 00:13:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYjHf2Ioyicr5W/x0gjSb7n0dcZMAdNENJsVw531BLCoNrrsq+SJf49jH7DhnhrxbQGxWHokLt/BCdjWIL/wkb52TrzjJ9h4TAQnHSBifVQnDJBQnI6hXsVgw19l7Wrl6D0ESS71YBCqQzGWlihwRQ/Vjqu4DSKNvWDHUzNEnRDOMAmKFps1lAT2oJVT5b8Q1rmgGZD/lBeqvt8GqQImiQ7FBr2VGpxqX43Wwy56vNktToNNn/TTHr9noI/fEYEC7O2Aozlt/Mw0DhMDmMHlbCXlXoVjynOY8f5B8zJrerYri+1MxVJIO+Ws7bNQ4xwfwbHtfrm45OLwyPz4mb6aTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=574l6wc6anoXkVl3uFY03jnGWPj6x74MGg6mLeyqjps=;
 b=nZ2NwICQjdjqPIWnKv9uXcYeDoG2ILd7GB3u4yWy+WyIOWEP246kdHGmYRJWzqxUkCDohqlzDOSY0632sw0nDsVrpQs6u8pDroZOFSQWqRIx2RpgOIUxH+qzWo8WfDjivILQTJyry5f8YHdVF7K9IjiIHMvOfnZlEyQEf1K6KMcOu41QlvjQzo9oVksP5th0c7/LE1BDvkVwsdGVO9Hp9dp9YzEI5WAavkMijHupqNAza3iZyhIfZlhPyIlZlTeV6AdQ8rjtpA+Wvshm9kRajtyg6yyqba4XPMUsxwrtNhBM2Og3Hskk3lv+mLi8uiibYK4PoKIWxBR6hFSBS8F9mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=574l6wc6anoXkVl3uFY03jnGWPj6x74MGg6mLeyqjps=;
 b=wDwta33EKDnO5VaNirwlBRTJ2hTfHtEDnlVXObKq8MsC5a1oOaDVu/EhELuyDgdAbAdVTY9neC90OQRz1sssG/mJlX//PuHMUwfT8ky7NkpBPZtSDS5OIIlA5UNVbHS4yQj2l5fdBsqcDHL1w84ud2LZvXoKUMxwmYnbeKP/Duc=
Received: from DM6PR05CA0053.namprd05.prod.outlook.com (2603:10b6:5:335::22)
 by SA1PR12MB7368.namprd12.prod.outlook.com (2603:10b6:806:2b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Sat, 15 Nov
 2025 00:13:49 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:5:335:cafe::de) by DM6PR05CA0053.outlook.office365.com
 (2603:10b6:5:335::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.7 via Frontend Transport; Sat,
 15 Nov 2025 00:13:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:13:49 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:13:45 -0800
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
Subject: [PATCH V13 42/51] drm/amd/display: Swap matrix and multiplier
Date: Fri, 14 Nov 2025 17:02:07 -0700
Message-ID: <20251115000237.3561250-43-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|SA1PR12MB7368:EE_
X-MS-Office365-Filtering-Correlation-Id: 65efdfe8-48f0-4cba-5c4a-08de23dbd9c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7TBNEIMFSm3EP8kaCAysRsc2LQL/iuqMO6q9aQDwDfEyu8fFOYa8sKXxq2ZS?=
 =?us-ascii?Q?6/Y2YtWZYRhcZtMR0Zz/0I5QsZivFSD/wexcmBdUBazvHy5whBqWq/ITasIR?=
 =?us-ascii?Q?kUDQOO/BjvhqzLq2xF3MOjUZ7OCpJVpRqsyJYUBNDErsDk8dqhO7ZcbiHzUM?=
 =?us-ascii?Q?NC88zpw9QdcpN317zl83LFdEDgOxUIzbI2ixt2YrMeb86TKcOfwcPcbZJMj4?=
 =?us-ascii?Q?yT5pBIvMxPhHJBqG4glQ+k9YhrAAgqnf3dIzn4EqyS7bPoysC+YR3/qIs5B6?=
 =?us-ascii?Q?hHrW67WCFO+CBR/BrycWWVojhfPfLfnRBayRgaaSpy7KkWIkt0ehxIAS8Vmd?=
 =?us-ascii?Q?0s9F3gcDXTq3VUXWLCn5Q7HhFmerxC+D42V8OHJZFHtaOR78ewej5jnn8Q7R?=
 =?us-ascii?Q?hnjyA4nOID/0PSqu6I2vdVoc86Or7T00cYqVKyDKdeQ1tpbxzK/EAhUKQgK5?=
 =?us-ascii?Q?U9Y7pgmpl3W88tDUFIXODH2p8YQipA1gckVxwB34gNB2vLOXWxbEoB/O+GvE?=
 =?us-ascii?Q?cy5NJdT9ZCUvUYMZCPe9BKpi5YbeCX8D0yea+L8R6Wlg01At4qmHEoZNQVuo?=
 =?us-ascii?Q?VPhs5os1L0uZef3sp8LnmV8yyBd2aa3aqdzlx60JNd4tUx6tH/xJTC7FJ34W?=
 =?us-ascii?Q?ZGcbNOYdjFXo75HOxed+PYj1L+LLSchIIv3E9XlYPRqEtpN5y+8AHv3gr8px?=
 =?us-ascii?Q?2sUBOmQJLLfwM0fWynBvpXDhLYGxKmSsngUsGLBJR90Zh9PG/K829xpmz7hf?=
 =?us-ascii?Q?4QQ3JwUp1julC4YNMeQSksDetk6E28ZYY/9snIxNp3CzA+1Ih6mXZRGyi6uZ?=
 =?us-ascii?Q?K2jJL9ZZ263W3iP4j1qz67dufugUv/fmxomCk9f5IXruAPt+D2rDZbcpIUux?=
 =?us-ascii?Q?tykQ4842JBurrAAj8jyZOJFNbyVDvH0w75rl6fpVXQ95vEld8zXIe+mVsIUf?=
 =?us-ascii?Q?e/tSBbIPlSbxQXbyzc7xjjMYIWCX7OTZ71YpWpRn186msF+uyKn7CabpiK94?=
 =?us-ascii?Q?Rnm5HoX9G41pzuP6M8Y/gBQ0JFYSN4RLcqEN09EumOoEzaifSWtk8ZRJGIJa?=
 =?us-ascii?Q?NMF5oSFlt1pdawYB7pwBhEuk8HJvgHKMmWflQbD2+xy+AKpYV14M7b9noDBW?=
 =?us-ascii?Q?jZ30lNXsoBovcKgxBB0Jt1Nn2ujSx+DjRjpmyB+mn28JX7ZLspy6usae8d++?=
 =?us-ascii?Q?qQeb32zyXgvdGU08lzk5dcEoXoo0L0zSsi71RReCdl9KlWGQpNJzP/ZuV2Am?=
 =?us-ascii?Q?cfq45wSEClVSYQP5bkhdZUY2a3MunGO7Bpr20SFqpnt/TiXy8bcsqm1V4cNi?=
 =?us-ascii?Q?1AgZCv669hIIZ6vyVl/4k/5bU1+qJQgp9G3AbJlkWvqdmrbLgbkapXGb9ReP?=
 =?us-ascii?Q?3jzmPlfzrlIH07wfcRSjzO34NWuxH3cVigUmGPeRInTaba99J5F0ccWaiB4v?=
 =?us-ascii?Q?jzYnSJiVnypze8/C7zQmQp7d5yLyxVw+gqZ0f7O8l3zkTYCyIUQZeVmKbGFW?=
 =?us-ascii?Q?xggG85Mql71835RrGmSrRfs/C/hxUCFXP5wfOELBmOW6RqZNeSEIjkSUpuDw?=
 =?us-ascii?Q?MjWaDazYEzw2f27zILs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:13:49.0783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65efdfe8-48f0-4cba-5c4a-08de23dbd9c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7368
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

Swap the order of matrix and multiplier as designed in hardware.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
v9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c  | 12 ++++++------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c    |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 751e8e2b0c4f..5df8f13d56b2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1651,25 +1651,25 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
-	/* 3x4 matrix */
+	/* Multiplier */
 	colorop = colorop->next;
 	if (!colorop) {
-		drm_dbg(dev, "no 3x4 matrix colorop found\n");
+		drm_dbg(dev, "no multiplier colorop found\n");
 		return -EINVAL;
 	}
 
-	ret = __set_dm_plane_colorop_3x4_matrix(plane_state, dc_plane_state, colorop);
+	ret = __set_dm_plane_colorop_multiplier(plane_state, dc_plane_state, colorop);
 	if (ret)
 		return ret;
 
-	/* Multiplier */
+	/* 3x4 matrix */
 	colorop = colorop->next;
 	if (!colorop) {
-		drm_dbg(dev, "no multiplier colorop found\n");
+		drm_dbg(dev, "no 3x4 matrix colorop found\n");
 		return -EINVAL;
 	}
 
-	ret = __set_dm_plane_colorop_multiplier(plane_state, dc_plane_state, colorop);
+	ret = __set_dm_plane_colorop_3x4_matrix(plane_state, dc_plane_state, colorop);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 888494d17509..934cbfca0168 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -74,14 +74,14 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
-	/* 3x4 matrix */
+	/* Multiplier */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
 		ret = -ENOMEM;
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
+	ret = drm_plane_colorop_mult_init(dev, ops[i], plane);
 	if (ret)
 		goto cleanup;
 
@@ -89,14 +89,14 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
-	/* Multiplier */
+	/* 3x4 matrix */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
 		ret = -ENOMEM;
 		goto cleanup;
 	}
 
-	ret = drm_plane_colorop_mult_init(dev, ops[i], plane);
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
 	if (ret)
 		goto cleanup;
 
-- 
2.43.0

