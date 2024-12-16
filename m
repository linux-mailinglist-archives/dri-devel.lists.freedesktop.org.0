Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D899F3135
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 14:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AE810E65D;
	Mon, 16 Dec 2024 13:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Jj4POjvv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C9510E60A;
 Mon, 16 Dec 2024 13:07:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtF6aQFChIHDaIGnj8tg8eNgnJVbM5oNmIFmsgtUEN517RJV4syuNDYu1Cl5IZYZQwTTgjoEmy0Tj2Dpg70C88odWVhinNl3aG56MkTqT9y/IVev5kbL6krAv+YH198WNVaKy4ugV6tQkv1CQP0N94gUVFsKOeP8M6eSFHu5gp0WDdlU2WXNfdicMo7tPzt/YaR6C9AWZQZJNpcmB+lRRCuvZMyTAhgqyw+T3n3oHE1ogbQDLEStB+qozuhxyRFzK1qSLNl++eAblJMpxmkN8u99dKzyufDsxuPpat7bOEMSOHiyUHlj6fGf8fwGcOFqJVLYj0nWBdCruxkVx5816w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qq/EPqYxpPIWZB6ifTuweea9NtWpXryCJNPdoxCBEjo=;
 b=QNHULf4YuJe4jX8GSdFUFRfBxJ7IZy1Vw+Vsw+Y4D7vA06SdUYj7lgPovp+Kk7L3sfLeOKu+mAaenFeEsE0orbUdU9JsNlFBEIimWECz8P8BYjsJUFF4J/+r6ciFFq6NZm7Nul92M9e+lYFCQdjLeIiXBwq2pbYfuXCFGExAd3PwEtkguuHhbG2/hIVHRPdf+QazgAGoh20FVHNotyloTv14ZGzqS/48drKnEZML0+vUXkz4VxTI7G1STShEHmjCB6ycchmofs933oFSR/kntYK4jJ9Hfoa+an1R1pF/rGOVVfNls4/j7It8MfkEqJcUh1UMDfwgmThQV6k+LRbQwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qq/EPqYxpPIWZB6ifTuweea9NtWpXryCJNPdoxCBEjo=;
 b=Jj4POjvv3NovQ8sSjWS9umXfJ9jBvQM6xG9mX3zZPvhkk2nQhMj/g1uBvo2cQuqHpHz0dTTQIRh+wVS39IsTne4efC6bP1hz0nI3gaXFIBY1VbCKOBLjZP5n9ikt8FlWihTDDbhBVQUy1dgMFH4k/Xr6GLcNGqomI8OhYwFJq+s=
Received: from SJ0PR05CA0045.namprd05.prod.outlook.com (2603:10b6:a03:33f::20)
 by CYXPR12MB9318.namprd12.prod.outlook.com (2603:10b6:930:de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 13:07:52 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::54) by SJ0PR05CA0045.outlook.office365.com
 (2603:10b6:a03:33f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.10 via Frontend Transport; Mon,
 16 Dec 2024 13:07:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Mon, 16 Dec 2024 13:07:51 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Dec 2024 07:07:48 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>, "Arunpravin
 Paneer Selvam" <Arunpravin.PaneerSelvam@amd.com>, "Lin . Cao"
 <lincao12@amd.com>
Subject: [PATCH 1/2] drm/buddy: fix issue that force_merge cannot free all
 roots
Date: Mon, 16 Dec 2024 18:37:34 +0530
Message-ID: <20241216130735.314298-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|CYXPR12MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: c93dc199-76ff-47f6-8110-08dd1dd2a5c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ku703lK/wvnbRBsFZ/hB44t34GDJgcCJmGL8Pa7P1yVat2oZuDUgwiNTYTuL?=
 =?us-ascii?Q?QEY/3aMJ5un6LmeU6+aHUsC7SbhEiLBReqRkyqNk8/GjGSXnNichjkpRpnhk?=
 =?us-ascii?Q?7ki2sAtYnPoAd7Zj7DZw/T9jcFEuUwHebLuAdzUx+QnO2EKWmNz1I170xh6y?=
 =?us-ascii?Q?bxyNL8018S52/8dS2e3w4B5dEs6YET4ZYoo3ajP2g7jvaJLQ6ckUG5izT4YA?=
 =?us-ascii?Q?DmiVUv6h9V+ysUZEtEWUb967teHzBtLwk2H4oyn5Zud4Q2xdpCGTpAvhyurT?=
 =?us-ascii?Q?NBGPnugI/29At1XWyOw9Y48pmu6c5hMqjY6bCn57PiMrdtu+OAdyvnRQ1TgJ?=
 =?us-ascii?Q?0H71u5ZfKRcNUcJlm4ae/2ZTSpAqrsR6j3NgbbxStX3rhMeGz83iCPYGtJYk?=
 =?us-ascii?Q?vxFEI16i3DnxzqKwe7hl778tgtFkhs4oSr5GxZA75QYtigHoBp34JtYiDKXj?=
 =?us-ascii?Q?db9xzFtLqeAsrO4ZeLQZ2tcuzb0NqmfKyrpS4iKRX9XBdK4NocJvvyGS9Pxe?=
 =?us-ascii?Q?wwvYN3mhCAXdiIYmFw8Nh09m7rov2NuGzkpZQoYZ6ZMx7GKMQ0gEbe9Zx5ZX?=
 =?us-ascii?Q?Ilhg8K3V9lnzF7rwKe26hSRDzMwqUEB0RlRnvNeQ1JF8sg6auU7FIQ+NlvS/?=
 =?us-ascii?Q?54ZkFJE03BRVF1TdybP8o1c9o2q1rHOiWDYcDLuzSb9b0WfbAbtScFvG6L/O?=
 =?us-ascii?Q?9KCFYtlok3GxgyHS8SNsRgkixtSREj8RAu0sInNjn1DQKFjxeFc2DBqMWteV?=
 =?us-ascii?Q?38ENf597dZPacjMFyeZdA2aThDpbJro29N3X7jpi6R+nCC2CvYk9UP6Hhcef?=
 =?us-ascii?Q?1O5v1NvAdNpXoakpIZp2O0pnhfWDinlDHfkAhqJj1TJA+6ByO2lkDiZcNGTd?=
 =?us-ascii?Q?V9bH1Rx3RRoV1jeR6Cv4LgGxHdtSINfqUC9oeOb4h6RzyhBnumNIrgajoI2y?=
 =?us-ascii?Q?X93/JPf3dxiKgxaQ1dW778L6C2qDjSm8xywYUz55NjNiEBFOMIDcaLSxdlwO?=
 =?us-ascii?Q?Ju0m/mAlp1nzVDKsxzjeA01Sm6EinhYgD0Rv7NEfP9hSJbTOZDsFHKsM2NOk?=
 =?us-ascii?Q?mjmVjg9P27EF8Cll4Mp9F+8QAYFLniXiBLQo2NxXKAy1u/NQYaPYtAPrUJ/4?=
 =?us-ascii?Q?x3lNd2h6J/CFfr2WI0egrU6GdZXZQR1t+kNRfjB1aek5NuocnKIepr+dqMTW?=
 =?us-ascii?Q?eHcxDIAOynAaNdLrkSVkDkOp3Dsq8RiKf8OtfTXeD4HxYd1CB/Dd16L+7/jC?=
 =?us-ascii?Q?deaM6QbTCqFVVhPYQelgAAh1/rJ+/T1BlkOFT3ofNbdZDz7MGaaEjwex/D1n?=
 =?us-ascii?Q?siHY134msmWFVUD69AZYRRJr8OESkq5aNwlNrPpY99PzXMnXEWTHrGe+ByjK?=
 =?us-ascii?Q?UMTAPbrc2B2yqFuuLFGNe4amDKZtkn3dU2OIN8Y1nkYl7DYclHW/F0zdPxld?=
 =?us-ascii?Q?kb5e+w/mAOunX5t3l/Gui4lfRjqYmZauJxkJGcC9zpVHJRicE4Y3RuSNYS5d?=
 =?us-ascii?Q?utwYPsCeVl5i3qI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 13:07:51.6437 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c93dc199-76ff-47f6-8110-08dd1dd2a5c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9318
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

From: Lin.Cao <lincao12@amd.com>

If buddy manager have more than one roots and each root have sub-block
need to be free. When drm_buddy_fini called, the first loop of
force_merge will merge and free all of the sub block of first root,
which offset is 0x0 and size is biggest(more than have of the mm size).
In subsequent force_merge rounds, if we use 0 as start and use remaining
mm size as end, the block of other roots will be skipped in
__force_merge function. It will cause the other roots can not be freed.

Solution: use roots' offset as the start could fix this issue.

Signed-off-by: Lin.Cao <lincao12@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 103c185bb1c8..ca42e6081d27 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -324,7 +324,7 @@ EXPORT_SYMBOL(drm_buddy_init);
  */
 void drm_buddy_fini(struct drm_buddy *mm)
 {
-	u64 root_size, size;
+	u64 root_size, size, start;
 	unsigned int order;
 	int i;
 
@@ -332,7 +332,8 @@ void drm_buddy_fini(struct drm_buddy *mm)
 
 	for (i = 0; i < mm->n_roots; ++i) {
 		order = ilog2(size) - ilog2(mm->chunk_size);
-		__force_merge(mm, 0, size, order);
+		start = drm_buddy_block_offset(mm->roots[i]);
+		__force_merge(mm, start, start + size, order);
 
 		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
 		drm_block_free(mm, mm->roots[i]);
-- 
2.25.1

