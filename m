Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BF8AA401E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8913610E5E6;
	Wed, 30 Apr 2025 01:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b0CsRQJA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F32910E5D9;
 Wed, 30 Apr 2025 01:12:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w86x1fmxRupo2Huz5889R13PCnkcH+tn53BWScV+rJgux5Rxr7LZR16Vgu5119MUEnamfKkUgmi3WeqQ7obuJNR35TWBg5NZoC+WeozuMQWDSHugKqnYAhqC0XUNLemjsMPrrS5c4nNGbJws/jKJPt9+BubGOklJ92j3BMa3c5wvpaAZnQY7utOtHUXklODU4DOkUFsGFjM9PGNqC7YADtWdtRt8qbxdHtF4pujTriv9hi2ZaWqmflQl7AydfZujNzDX+D4VGmWisyiLTDwbxfO0vXzCVygvwgoVhEZpZzW2U7P9RhSpIGYPXwgi9X0ObtXBI9affhdNKA4jhC98oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfBz+Ho5A4CXgfgFx+h5vBWndusoAZi2XtnAq906NnA=;
 b=iCL2LQrgI9XmuHx/ECIEUjeF+k7k75GBXF42O2tLQLcN+xj0wKYZ8UtkRFy3aO2KvWxLTKaCnzF1F6xedR6FvemA1y2ZUMmLYeT5qFVzC073nGUV986jgWcJVmS8AP74b05hDFY10DyRD2nmoVsQgtLDEHbYExngtkSGUQ+/qjN1A/B03yq9AKZaroE0TGBTPho4DyTd1b+xD11sKAo0ur2fU6GoNgmjI3VdSOo9aIbmM4ZAlAZidFwkYMiNcz8P2GAcSrwSsPeHvjr9j27TEle2/stg3UEGlXM+jV06khVRMjFor1aYcZNFTEOw+q8b6aj8pFsWMyf7nF2Lh8YFhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfBz+Ho5A4CXgfgFx+h5vBWndusoAZi2XtnAq906NnA=;
 b=b0CsRQJAx+u1CzhbNvo5rZTA7koakv7oe24j356aO3sSp8MD/4yk4t+g5nsIYVu3KaryBwIpMAROqJ6bE4B7kMj4C7yzxZCGJ+jN6U4NrORH0bGwi4hVm8mSeZh9olSzVzVo2VwGkBxGzvWXU0tnUGVkygdjZOgP3VVBSIow0OE=
Received: from DS7PR05CA0012.namprd05.prod.outlook.com (2603:10b6:5:3b9::17)
 by DM6PR12MB4092.namprd12.prod.outlook.com (2603:10b6:5:214::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:12:12 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:5:3b9:cafe::3b) by DS7PR05CA0012.outlook.office365.com
 (2603:10b6:5:3b9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.23 via Frontend Transport; Wed,
 30 Apr 2025 01:12:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:12:10 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:12:05 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V9 01/43] drm: Add helper for conversion from signed-magnitude
Date: Tue, 29 Apr 2025 19:10:31 -0600
Message-ID: <20250430011115.223996-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|DM6PR12MB4092:EE_
X-MS-Office365-Filtering-Correlation-Id: 197e0dc3-eb2a-4f6b-2fab-08dd878408b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EhK/FzdL02kV1a2iQyF6nwgpagy7BPOqzssQpU1UWTFIq2ekfwm9GmHaBYdv?=
 =?us-ascii?Q?nOsqAvJOpJHmnEFRoMWPNbW7yuO0QpCGAPvr6oMbL6z6Dwk2koLfAbMV6hNM?=
 =?us-ascii?Q?eMLKWXAQPZdrtWNJGrwga/oCamOFI/prN6UMI7P1xIfmsF7/HobO59rivpH/?=
 =?us-ascii?Q?M/Lhb/vT3KvRyBCZwAcrDLuXllY7JM7r5LEqRZjYq2+4VclcK7CVmqVSaqjH?=
 =?us-ascii?Q?haiowZY1baTvSDZQwJ0ue74r5u8wNS5pb8A8461PO0rucrCvc0G3dXJ/0a0w?=
 =?us-ascii?Q?dxaHH29DDja5BA00z9C7nBBem+ijdPqnfiG7xOa7Av+udoq6VV7i5jNT9ziF?=
 =?us-ascii?Q?STPdGDmAxMcSt/1XgKbtAGaZ27ahw+uyjCZ9f/Zh0MMte1utCVGHaBN74QeL?=
 =?us-ascii?Q?E/HkKPNn5oP2RgMRnxdydjEWqnOXqTMJ1ev4RAFJozLrxEQyd5Q7tLdRt3xM?=
 =?us-ascii?Q?cCn602dWty/I6e3ymWKT7+34xTkMrtN3n74x7P5CyZixQmCBePhU5UenBP9p?=
 =?us-ascii?Q?55qH+JE/yFSWxb9RSajvXrOh5jlLDjW4pVXF9GjQmYxAqcIHxqvxdY88dyUL?=
 =?us-ascii?Q?Cw0oV1ERoG8bGCUsRACHB1h97BQZmbes67Un2I6Bq84HDI2YPlrTFxworDp4?=
 =?us-ascii?Q?TT1/zZjGTm+4f/WX59dbG3m3hRv013aUzB6qIrnfHL0saXFDlEcKxWP06O3T?=
 =?us-ascii?Q?hdHLnDmnpPGfKDopj4FKmYCj+zja1/xer840YAW0xG7gtILmi6slhDqbh5Aa?=
 =?us-ascii?Q?mEItUpgV0OFFGkT0MD2EOjbZkxo/JsfEi3sSYk25FZchJ+IiDPhdfBDn8m58?=
 =?us-ascii?Q?eRVEdI3kk8A+huRPZfi0hDs8CV8EIwAq4dp4FzcNDobyCRPg1OC1GH54xt9z?=
 =?us-ascii?Q?X5GJPPovYENElk19CSBBgpvmtVOH3h90T2i11omnFRYkNy2MuX36+U4i43MF?=
 =?us-ascii?Q?UMHTPF8zDw42wFAxSghjr6ILBI9iJp4h2PtFzZf2BAh+m59JjhKNeIcJvTNW?=
 =?us-ascii?Q?zXmq04UL0wIdDDzQcGyaG/TeXwCvShQLXJfUuqWK5MOyIQg9IOGUgtnukk/3?=
 =?us-ascii?Q?nw9nBOEmTCsqZwwLFqFzX+pA3QcKhgHLAEoaWYzT9u+BW7HU5HBbyrF6aFK4?=
 =?us-ascii?Q?OsJZPjqq+SlXtj6Z+jb9HrLXoWKxG6Pc3ZrawrR7cE92tNk0AdMqbBpKK6RY?=
 =?us-ascii?Q?7TU+iy1h999kOWRWd8VLbtk3FaRQCJpbJ5QPUxBxAgpX0ytP+9jB5GaOWbt1?=
 =?us-ascii?Q?ub1+OA8f0m4VlR8/wSmEcU5kbu1cAOT/G9XqtxS/CkX+7HxRsjSHauUGy5L1?=
 =?us-ascii?Q?qPjolHoq8WcBYa+/EEMRrKN9t/KG4OphNfSTuVKAE0WYFQ3Lz0ikhFA1NzBP?=
 =?us-ascii?Q?jLaaTAj2DSCqvZkvN8xr6OVcKGCFErfAsYVhcQEDntYiUoraeavvVEUDUtpk?=
 =?us-ascii?Q?XadKLtvzp/edsMKf/Eqzy8kTbgJz56Va+PPxxTql4pidbFUCIOGTnpj7sN26?=
 =?us-ascii?Q?RO+xx1/UnAk2k8hDduxopidvojHXPK9Q2/JS?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:12:10.7477 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 197e0dc3-eb2a-4f6b-2fab-08dd878408b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4092
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

CTM values are defined as signed-magnitude values. Add
a helper that converts from CTM signed-magnitude fixed
point value to the twos-complement value used by
drm_fixed.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
 include/drm/drm_fixed.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
index 1922188f00e8..0b44f2f294ce 100644
--- a/include/drm/drm_fixed.h
+++ b/include/drm/drm_fixed.h
@@ -78,6 +78,24 @@ static inline u32 dfixed_div(fixed20_12 A, fixed20_12 B)
 #define DRM_FIXED_EPSILON	1LL
 #define DRM_FIXED_ALMOST_ONE	(DRM_FIXED_ONE - DRM_FIXED_EPSILON)
 
+/**
+ * @drm_sm2fixp
+ *
+ * Convert a 1.31.32 signed-magnitude fixed point to 32.32
+ * 2s-complement fixed point
+ *
+ * @return s64 2s-complement fixed point
+ */
+static inline s64 drm_sm2fixp(__u64 a)
+{
+	if ((a & (1LL << 63))) {
+		return -(a & 0x7fffffffffffffffll);
+	} else {
+		return a;
+	}
+
+}
+
 static inline s64 drm_int2fixp(int a)
 {
 	return ((s64)a) << DRM_FIXED_POINT;
-- 
2.43.0

