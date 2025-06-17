Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D67ADC02A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD65710E4B5;
	Tue, 17 Jun 2025 04:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="o2CYYLOd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B3810E4AB;
 Tue, 17 Jun 2025 04:18:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7KrwVIXVHuw+HPX+m9r+wQ0qGkGVqz1pyFgIPZHcoQI4M6iS94zgLEQT3WXvYXcKV3iN8XnaSFDT6ku7Ydw6VKzZKLar2p431kUsc6+49lDEoDRn4xEi1fkPVVHHF17+Ecx1JcMgC7XkghAMh9rFHoM3gtrva6GJsVSUOMW65CY7fRz+wM8jvlXaKJB3yyTiw8ABgpJyclJ8M0f3FlMHTk/TSkCSg46tmWcYdKMFIg16C9IDzHSVFeiwHyXICBUeKSTTBHRcT4DZkwOauEuRbXAsHRM1pDxQV2zKrxR17U2jPGIvtk1JDvw0ijVl/RUOgFBguTdusgWsw5cgKJ0UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBbvKsjvaWuYbuv4gsL2e+7uqu1go96ACil0oQ3K5C0=;
 b=xPuPfaF4rrgZUXY+iKYtxwSMnYoCAqh1kXjSRUU9myk0JqSF8tMzDbLjUd2Q/ScXC2fCHpFJHRtO6Ko4K5AgUmF8fCoL9bju6WOKyVLekapyU1a7ZBKCVL3DxxeQwmFgLndZMXXFDw/5wv5kOElykTeKf/VZxOdseXydjAsyR3NZGtuqaXRP1FsRgv0enj3NLHJLoGBcDdQuDXATApLVydn6wpV4DpHYAdvDqnjfleJPPcG2cmzhrcMKDf7I44ygv80OGZFHCubhRI5snLir2SNLJ5zper5/3s+QGX+VES9tKyEO/2OP2d9DL7vNDqGvyy3dFD2zSo8N7Xs8NuJhxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBbvKsjvaWuYbuv4gsL2e+7uqu1go96ACil0oQ3K5C0=;
 b=o2CYYLOdHKdxwAqC/mUH4Y3ScEYy0DJzNYxNYz4V2QKUAbIW3iKXMM0I+DqlbGK/HHgRXHSdM16zLLWmgNgqCZJTukYo1WZenWg2ZSLwvGGEpsk7Mjic8BiLKnCORVxIFjMlBJv8LyN5gZnX/D8C6hXY1w5N/yMsrSxeBruPqLg=
Received: from SA9PR11CA0008.namprd11.prod.outlook.com (2603:10b6:806:6e::13)
 by CH1PPFF9270C127.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::62b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Tue, 17 Jun
 2025 04:18:38 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:6e:cafe::85) by SA9PR11CA0008.outlook.office365.com
 (2603:10b6:806:6e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.29 via Frontend Transport; Tue,
 17 Jun 2025 04:18:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:18:37 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:18:21 -0500
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
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 01/46] drm: Add helper for conversion from signed-magnitude
Date: Mon, 16 Jun 2025 22:16:43 -0600
Message-ID: <20250617041746.2884343-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|CH1PPFF9270C127:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a82d0d4-8ea0-4f1a-12d9-08ddad560898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dQr7ufttxMGfb+6NDcdErKtlMFiyr5NHzbEJhVu+ha7ekqe5On7NE2xctHCo?=
 =?us-ascii?Q?Z4kIfWIwqGzzsGoEliYOGQH0t67woR7pnsvgIFaNoiISum14Cb3JpxWpduIG?=
 =?us-ascii?Q?amygrQdNLlYwLQC3g4+40WSIScjgvVl+vXh9eIoPrnJnSR316Xc2Z0APnZr4?=
 =?us-ascii?Q?T3EDQpulgRbeIzM6+rUmXxwFrO3X2YZl6iRmvvCInxRGor8pLlg2xi8goLY7?=
 =?us-ascii?Q?GsIH9Tbo2rvCYpZrW0g/p45YW1gqAdeQqNHUON3Yr9hLfO2l2Cj9pCHV3Cac?=
 =?us-ascii?Q?LcjxT4CdJ//QT6XvyQnVagFyFc557j6Gb0jjSRkcqTxvMy5+JTvTCU+8D7tj?=
 =?us-ascii?Q?wcOruDzRnhlWRDhV5WuI2g1sNPMAE9hekuVogIX2Ii1vgXNuWg5kEoXV8/4B?=
 =?us-ascii?Q?9gXWVt9Sr2kbJnGfWWK8r9fBwuVNR5zSy0LXxZ6UjHByaAvvwoync1Rb4lfw?=
 =?us-ascii?Q?8VTkKptm62UZ23Ucr6FcimxNzNTiMMSSfLUEFbNhIDhctluMx8XBzhNvTZDE?=
 =?us-ascii?Q?XYSV9ACKlwNGoO6KpSCNwJxVZaLHkDgUhLYNLmtebgVB4WniwCS9w45/UATz?=
 =?us-ascii?Q?wfAyC8omlSvdMh4HJUx/6h0zZVhZtgV+wQSvDsdC7HX6qyItQL1dt5NkS+Ux?=
 =?us-ascii?Q?0EEokOzhhIIPFaNMAs8gfwNFAYAGbaQSJ+7+ZkoDj0eioteoUqA/1xl3qUp0?=
 =?us-ascii?Q?zucuDFNsNaav6WoN2aHvhGyVKo/2nJykdQiPJS4dhhDr4LgBUIIcTzDk5ny2?=
 =?us-ascii?Q?tRbZ762JBKalf6IB7VlPyz5CRumxxpg3hmzT3OhT1C3MZ/xai9CINyVFi1W3?=
 =?us-ascii?Q?gVPLNfcqTsOxaklgG+x8+H+E6EZ8b8MVpkgeOksrkCB4UCE0KDr+t2MotjJp?=
 =?us-ascii?Q?DIv6peR6EDJEQo8IYR/4wqa2YFhaxVWrI5Gh+FufO5Scssrst/kBzUhQXKfo?=
 =?us-ascii?Q?hG0ew9I/ubxCbmz/7hoXLt7ITQfyfVNsotGMvQ4D0bgM9FDfegE3PyBj1KOh?=
 =?us-ascii?Q?s8E7Wevp4csVN/xBoSUBS2oQDkSLCB5hUaGHzvWYzARpYEGIojkMRIjMihEE?=
 =?us-ascii?Q?ZycNCkrF2UiO5Oo0mV4gD19d/yjt+/1R3tdjHLMDOUs5566XlEpvDdSRyZ9l?=
 =?us-ascii?Q?/YZPXaYcOFRThpmr79ROx90xzYci+ZUVsmviWRePUBfTHVtkw8P33hVxEOdY?=
 =?us-ascii?Q?QJJF3nciAKLiIMsdkmxv/uRxk4B2zzRT+d1QYU7JSdTqOoYuRUGBmChag96G?=
 =?us-ascii?Q?j5rH4i9wJ93Re3B6ByA5ZHwkyF7ugX29p2+QvX7u1PW6fTmM5J9ORr/LWMW5?=
 =?us-ascii?Q?Cu5/1aejK+bjACKnzrsbrxSdxyp+Sxae3QUZNW0VljitMIxcQBEIHUuQQQ+Q?=
 =?us-ascii?Q?4D2vU4mdRB334HoM1IBSpZLuKigqP47aIyh8IlbhsYsxsoDl+luJ1l7jVI67?=
 =?us-ascii?Q?30jkfsszr2a/Y3n9ky/zm03M1hN2MrI+Kyuc6gJtNmed51COHI6Xu8qyVJjK?=
 =?us-ascii?Q?l8yHW4IWG+jgehIau5l7omHqcjVzS5+DOud1?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:18:37.8804 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a82d0d4-8ea0-4f1a-12d9-08ddad560898
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFF9270C127
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
Reviewed-by: Melissa Wen <mwen@igalia.com>
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

