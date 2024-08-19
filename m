Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 422EC957625
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881B710E3F3;
	Mon, 19 Aug 2024 20:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UQWGQ5JT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70A710E3D2;
 Mon, 19 Aug 2024 20:57:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHWshycedjmcowte63Uqq2pMk0ZS9ACAZA1ySOqIU7V4r1LjNUHLiJMP8Y9u2jgzr2e9eHlW+xuBfcHHWFMUG30nQvUB7pD6fw/ZVqhMjDCR2z0idtCcnWS6N6bbH8T8LrcdvGr4N3jdGV9UnJ86OEPNPuJ88/bZLS7KBHn0n7catkXPrGB492kw0ixh1CSU8iIBHSbnbVA2FCbZgcx5locOITjEgkrhMuQXcW1cfDPwjXhE8wehZ5plZ7VsXHbFRnq7PESy/pnYXoJ5sNZ+71u2HOvpqaYs7QJxQjVh0Eo/IkQhqd6sNd9AU47OgR9yHP5cx1vhG471kFHN+iyFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bXkphBwAC6JT0wBPel98O4MpvVLigMoeRJVhpCc/rA=;
 b=s5W5PjlRye5HYfJ1007z+o6LQQjEsbW2yjxg/RHVOTpnVNhp+iU8mw/+yDfOEHb383qZnFstPI6UTe6KOlbLhkF0kFcoRxj0iXLhM3ZQMxae7vyNzP/fbHh7/c/nZ/35nIKdj3XjjFhVwwRNgSFs5d509pXOTT4wSBc+bvDh3OME/pBLaQcdFqBt/XA5CQNIQ8FA2s1He73nL3neQMoZDQJ9Zy4qvdMxWRrfHRif1/qzXC+wO5RmcN1weTnZLNX+pk0CAi4roBEDFIITRVluRnPh9RhdNhznXv2BUbqbiAxtehLrjUPvIaecTfIaiM7d2n14563QbV8PklcZ03gpLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bXkphBwAC6JT0wBPel98O4MpvVLigMoeRJVhpCc/rA=;
 b=UQWGQ5JTELlNUOl0aKAgEZu7KbaV9eTAfMYYLl0Qt2yDeoGKEn0uvxR655H02ULjX4jZDKf1Kjemv28KS+YpPn2TMwE+J2kEjrWAKhN2VysFZBaW+HzDwyGxF5SdFbuvBIBAOxWrKrdVBanF0SqNVJWuZ4vtvBSajOYIf7263MQ=
Received: from BN0PR10CA0021.namprd10.prod.outlook.com (2603:10b6:408:143::24)
 by DS0PR12MB9322.namprd12.prod.outlook.com (2603:10b6:8:1bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:35 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:143:cafe::e8) by BN0PR10CA0021.outlook.office365.com
 (2603:10b6:408:143::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:35 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:35 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:34 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 25/44] drm/amd/display: Add bypass COLOR PIPELINE
Date: Mon, 19 Aug 2024 16:56:52 -0400
Message-ID: <20240819205714.316380-26-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|DS0PR12MB9322:EE_
X-MS-Office365-Filtering-Correlation-Id: b08b20fa-0c9a-4eaf-6ba4-08dcc0918d7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LqczSUn7WaVg4SezoNYLCeBnVgRh/VYKErArCPTclBwJKAoHZIWQsYdgkBLh?=
 =?us-ascii?Q?x30JhvUsTd9S/s9VLOWm2pXTnZFcg74wvNmo9l1lYN2R446CdNYbjIJtX19j?=
 =?us-ascii?Q?EbgrEXkRd2TVdt1+gOLNPPgzexSMk0JvFaD9YFkdl9CWbGDk+iaBEf7kG9w4?=
 =?us-ascii?Q?reEKOMOoCtYxsB5n1qTa12DbMT/3pP3KXKVn8uUkEQY46xI/jyv7y4b/8iUD?=
 =?us-ascii?Q?gSUz58wOrmJ9mfhmbsj5aLx60Dn3uSA7wSp5M1FEZ1VODNXjSeaKu38snqMh?=
 =?us-ascii?Q?DGKeJUsoJi9PaBpSM6ZtIBFU1qJzOz/VGx+aNGWmsYBnKhRNiFVIS/M4lirH?=
 =?us-ascii?Q?mwygjp1gRw6P5c56VXkd/pHor2LZ+7EtUuLwDHiEw2p0FHTWnBMCKL/F8nlJ?=
 =?us-ascii?Q?7FAP5OULgFVwfkB+LZ03pk+lziwOcLkSOGtAEnkLO5QgoPhm+oqV/TlbtMaU?=
 =?us-ascii?Q?xZgqcFH0yBSVY/pd1Cdkmlm9r1o6BEQYUIhMwSsUbZ03qKK56YJwvTsoK7dx?=
 =?us-ascii?Q?NIkG0vqVmy9nfKaoCd7SbDgdLhUVJ44AZLGe8bDQ0ZykfxX/GZBGTvjKRWII?=
 =?us-ascii?Q?80EyjBD6QhnyWOnLVGIKkCbaXkt2VC+8sx+EOjBM++XOoT64EC+3y3Tm9M62?=
 =?us-ascii?Q?rwDfgSl9ouLMXErBwaaFATtE90WBOG9EG9UOw+JOfLJTowb4dTIfwwBWLb5B?=
 =?us-ascii?Q?AmBsgmUg6TjPn9f+Sjk0WVlcqpGLvx5q7vvQHSJSknHu/wkGRLVrDSOGCivs?=
 =?us-ascii?Q?YqnXvWP8XINVB1+QrqYJJY+7MRfW/QjcExPpfGOUI97ava5/OC1jWTf7MQHN?=
 =?us-ascii?Q?xQgcJ4cVqeKAjOde8A45KGO2c5I3kPQ4Wh9x8CjDLJqn1C1uE8YSiEftJFFd?=
 =?us-ascii?Q?hIuwzZ7Y8GorVmRq4+s/u8Jf5sQCWvac/EW/O5oatW0T6SLiVhvE+dlpMqno?=
 =?us-ascii?Q?j1mZDf1MVGChCjLYEHT3cj6ssAlE+bQXlLmAfwjdK9D+lj7hIvtX5epSxHAG?=
 =?us-ascii?Q?Unl7YY8go+7nE5NOm8Fg2Z3WR0hzFSL3cGXBzBIGcagoxJRuRP3730k+Q+Cl?=
 =?us-ascii?Q?7ZjSaOa4vrJcXQCc8DpiIwAFcRX6Vu9biyPz/H8rq1Ap6m5Mz2MLF+1reN25?=
 =?us-ascii?Q?xZumHZTJoiSXx1a2Sqr6vG9/4HXCloAZl2G/hVSx2zFRWcfMVehlmevY+69h?=
 =?us-ascii?Q?yfXsx26xXGnaISQmYP58NSedJuOSzpHkLG8xMJGcfrZdzh/Qx8L9nOnVr/p1?=
 =?us-ascii?Q?d9jsvmrI5sR6YkcIWuQuRHhreSd5IzsaYiuBm3aXRb2EsEc4rRohhoMZcPm5?=
 =?us-ascii?Q?ZoitMG7eO9z2Pa2IJ8Oum7E2bfK15hWWGhCVmZUCL8MFxsY0l5rxyf9fCBZT?=
 =?us-ascii?Q?voNtLIgh4cuva9sLwrLEuZkjwsbLLVi7sFG80DZxOFxmUzdzaTqyepUoEemf?=
 =?us-ascii?Q?rHHkE4W5mC4VQCka+BejgWOFZvRzHKdR?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:35.5387 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b08b20fa-0c9a-4eaf-6ba4-08dcc0918d7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9322
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
index a83bd0331c3b..d260db42d407 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1746,6 +1746,20 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
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
@@ -1849,7 +1863,12 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 
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
2.46.0

