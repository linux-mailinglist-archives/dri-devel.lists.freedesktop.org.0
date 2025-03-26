Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F02A72738
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D8410E7A8;
	Wed, 26 Mar 2025 23:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YrMs4v6z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2074.outbound.protection.outlook.com [40.107.96.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A363D10E7A3;
 Wed, 26 Mar 2025 23:48:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYtVyNj/skS1qTRRWm+TKYnkM0eIoN1bM9rbQ2SKs/dhEuDLdCk0D/XSECtilvmy+PF+v8mlel9nLOQ+FQYRQAounQK+CBo1aJYVmyJDW6luJc2qsoiTaxA+42ROlSlbfKjdOmQ4HAo8Q9Z+lHaKcwFKiQyquQHHCPFML8r+qI2zekmuh/+mm+yOJowsrAEFzfE7HA33lzx7kWzrYWF8TsgdK2EM9ALaDhl8iN4YsOhppaiApWdJih9z5gzkuf91X0aWL3XPGepvJiLdDxZwFXgCFXzkqIGg/moclEYsQxM9LJUJcN/bI/02AfARG2E6pQUeG+psADtFFpeGEEFBNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+XSP7dhFzesET7j7FPDIgHOjUhsspNONXxqQPM1LTo=;
 b=V1r2mclhoeeaDRtZ8sav9I7OaIclHUYMR9KSgV0tagvuEgmb9xz5MsqaZdsdQqDNhdk5uiOKWbar4S0AYpQSrJKLxkAHEhjPcVGuPybrrfCN+ABM6blFMs7k+4ArA9gaa732QRO9u5kcRMcY4eDISQw/Lxma9yb0kg3hHHLfjuiPlFWE+FmXpZuM3CPWYnTou+E7nrjnyzgaoIzlMsf7XWEPubNzzuFV9qYtLgFNt8rv3kcHHwwkPSXC1LapWaWbxt9AJrL4cQhcWWz7a5DtoVyhAdIj1GQ1ZUPHcYIod7ZmgP9wnXpozJSd2nHQJiP2xr1mXg0SwspELhMiKKaWFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+XSP7dhFzesET7j7FPDIgHOjUhsspNONXxqQPM1LTo=;
 b=YrMs4v6zNPI+FBCpkHk7OTmixmN8aG6ErE5YZ4KymI+Tu8nMby91xUBfWZj3JRYWkDaw6Wko7ABsP7DHU4ulFwuVYeREjdK0q99Ed6eLYFaJWGpaxewjJMGhbaPYD6SU/sOVHkC0xxDDc4D9UPP2JpXNOFz+U1QxSYW9FRMeL2I=
Received: from DS7PR03CA0077.namprd03.prod.outlook.com (2603:10b6:5:3bb::22)
 by CYYPR12MB8892.namprd12.prod.outlook.com (2603:10b6:930:be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:48:48 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:5:3bb:cafe::97) by DS7PR03CA0077.outlook.office365.com
 (2603:10b6:5:3bb::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:48:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.2 via Frontend Transport; Wed, 26 Mar 2025 23:48:48 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:48:44 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>
Subject: [PATCH V8 01/43] drm: Add helper for conversion from signed-magnitude
Date: Wed, 26 Mar 2025 17:46:42 -0600
Message-ID: <20250326234748.2982010-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326234748.2982010-1-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|CYYPR12MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: 182e53ac-9afe-4ad3-2138-08dd6cc0c0d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2RzB/ljNoaENWOuzR4gD2XjwNNAG0fy/xJtwuNn7QTbhjaG401F9j0FkJZ/b?=
 =?us-ascii?Q?yL/v4UTy7CPJJrkh+h5Cl3kGQb5m1Z36R53tnP7hSuihA1AEy322MBA25XtS?=
 =?us-ascii?Q?+9H+V0if8SQY1KdqzTpTsl564I3KHwUghTy1YWOAW0k1ktCvdO0yBSn/QDDg?=
 =?us-ascii?Q?PIFZC1kjlWgOezMxoV5WR15sEmUd5beTIwdqtHstQq9Hsl1zboCPz9Iuw1Gu?=
 =?us-ascii?Q?mOAWb3MajLLzZeuawGhE6yQj0/krJUQJZnnOB5IZUcvwA1ZOhxGLIJuL09F0?=
 =?us-ascii?Q?D9VGkJKpFaAeQJWKN9YDB1IfXddShviHvoyqGjxk55feqVvfF1MDnzF+zjeP?=
 =?us-ascii?Q?/RgolXF+jQIFP5kfaJe3V7QOdStNtch8XQ8r4WiHIu6e9Bh5X1UchJzlDk7N?=
 =?us-ascii?Q?vHAePjk2cuiNuMGkH9KBMIJfP2xxGujkfMTEztUmJizTdI0fWnLujZCoJMpl?=
 =?us-ascii?Q?EMRnyC0pb0NAs3IYzdS3aQmnubQHL9x0foHSk0Vlc14Kkx882jFIVwA1r0uL?=
 =?us-ascii?Q?//Xs0/rBnNOrTkHT0oTOuioV4ASauBG2uKgZHFSmQtooPBHrfpdt7UqksnL5?=
 =?us-ascii?Q?hMSpInpfbiSOacIFmvz6aBLhhyt3oI4nfpcAyBrbvjc4UDSb43jSFp1oFh9r?=
 =?us-ascii?Q?7VHPrZBQPgiL3b58dfMkM3nQGnaBupAfzHEAF44AtMvFVGSv9V8v/cbBd4Lj?=
 =?us-ascii?Q?ZWqG/oYQVAHk2zSUtD6ZiZgEjtWdd9ihOZmzLIeUotTJQ2jlB29aA9NzZzxt?=
 =?us-ascii?Q?7nymVgkUT1gs07Hbtcpl61q2AlY/jcjRQ0YoqDfShDxoec9aXMUG87/Kastc?=
 =?us-ascii?Q?AjH8SFtqkn2bnGsLvqsCep1MqZfezev1cVRJUPSUJicvo+vEPVju8eIl9T1w?=
 =?us-ascii?Q?+GW2QBS7Lq/jgYaEcL6JZ3OUJyP7XYfHJKBsB04cYIAKYVi2Od4/7MNiqds/?=
 =?us-ascii?Q?UZxxjApKZ2kLpIyXqNrdPNfgK/5wwHzA1EY5Uh2cOK8fHO/H87aHxOihU1WW?=
 =?us-ascii?Q?H/a8f2R7aHIaETYN6PGXb9bORY/No+vbpjOg50hQJtVN99lNXnNWVXthX96W?=
 =?us-ascii?Q?MS2JUnqQxHwxRB8OxpVavX/SuDl4TwZOPDmPug1J3xNKpZIa7z+NzLvFq3zW?=
 =?us-ascii?Q?DKwD9WIonY0D+s8qKsv9CUBoeTC+XHO9o/YlBwxnOY+UbYrDgGxWAaJ8LqAi?=
 =?us-ascii?Q?GP2cKgpIlrsP0yfafetM4TwTJgFAFt2CnnGuCpnLcwU0QV0hbEy8cGLyLW8E?=
 =?us-ascii?Q?nY59tUURz5/cJ+f5Gfqq663ivOSPAMExIrdnlywlSCOWz9COfuxoNMOwWozT?=
 =?us-ascii?Q?vGxB8Sa9wzvpJl7+kICjuaKqIQSdUxvShxM7JeBKz7M+X2cz87K4cfHjDuv6?=
 =?us-ascii?Q?37Myi+v7gUXfkO+UOiX8Uyr8wQR0dAqZCNWJLimrtKKB1MpsWcYE57JjUhMS?=
 =?us-ascii?Q?eQTJx72NuFQIJ5e9fd9y68IfcQk1Xhh/RhCdjg9OOGBIwaRBsJB8UbEG8M75?=
 =?us-ascii?Q?0CVoDStER2y/WBo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:48:48.0738 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 182e53ac-9afe-4ad3-2138-08dd6cc0c0d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8892
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

