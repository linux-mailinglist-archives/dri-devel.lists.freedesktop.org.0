Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD95EB27729
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277AD10E8E9;
	Fri, 15 Aug 2025 03:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a6gwaTpZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3225F10E8E7;
 Fri, 15 Aug 2025 03:51:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGBYYAgKgtQEVT71vTt8nkUkUSGzo2SXVfxw+MPl4UKGEF4yn0cph1UWTHNP6jyl59UWJK8C6uKlHM7vtVy/+d68ap4dw5uE/Fsnu6Q1/SfQfFf6cpKEwArGrRkHRTWQRU+UTozzwsx0lusQWz+HqJBXH1DekPFBvxse0ZJyzEXHr/INUoozai77lbdB5lBcDPFKRmmn2eOROWUNpKtgdrSCvX7vsTgXH2x0r7Reumv6ejfvC6J+DFXGzJI5qM5ifGbbDLIqZnJZ4lTDYLWOYVi1MAgcf3DPCEP91KV+gBbt2gQtRNyyEXmi+3AaqfQhauiqWR+Zz54lmDURfVYScw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBbvKsjvaWuYbuv4gsL2e+7uqu1go96ACil0oQ3K5C0=;
 b=OooSeALv6in2NpWMcNxunQwhphttReOQ+xbciaty/EqOlM+CNdpYiucnqmwVLQQv9ip+Cii6lIDfRUTnOyYJBvfCuTiEoYOtxP4UvRNUKHgWCA7t7TmEotSWa6wghlN1rb0KRCZpDDwRdbkFM77hXTl6J6SJttkOb2htgrq4fp0c2jGBWufArjFjn5Lz7w3iDzr3OuKnb1kRhrDddjSpkNLEZ0lEpudbhqIH8WOs3X1W0X4/zHKFyvzrn01yFGstE/s0JMIhECTaMMSZ3jLm5sI6BclGWqoGQD2T7jBQCVII88SHIXLFlc01Kd4k8kyIRY196dy0biB2MJ0R2VlcuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBbvKsjvaWuYbuv4gsL2e+7uqu1go96ACil0oQ3K5C0=;
 b=a6gwaTpZXrYaQBAm7mFqDJc7o8b0ZzpHIVJUXTp28UwUtARDZX2/lPh0Gd4n2c50zZ8stCIdtSmNoqDXAYO3GtnDgXiaRNDfB8pDHX4aOv90dPK54sjgUvHW7csFpKb81lqNIoPvAgtzwXIpnbFwrlEAd68Sdvr3+WVmdrvF8r8=
Received: from BN9PR03CA0037.namprd03.prod.outlook.com (2603:10b6:408:fb::12)
 by CH3PR12MB8970.namprd12.prod.outlook.com (2603:10b6:610:176::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 03:51:53 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:408:fb:cafe::ef) by BN9PR03CA0037.outlook.office365.com
 (2603:10b6:408:fb::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 03:51:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:51:52 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:51:49 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V11 01/47] drm: Add helper for conversion from signed-magnitude
Date: Thu, 14 Aug 2025 21:49:50 -0600
Message-ID: <20250815035047.3319284-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|CH3PR12MB8970:EE_
X-MS-Office365-Filtering-Correlation-Id: 577ece34-fe2b-43cb-639d-08dddbaf1210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KLqnLmJpGr/orXZWqjtam+VMSi4yWxnPGvjRDTwwGVovmOiGOM9Vyt6FfqEK?=
 =?us-ascii?Q?x+j6CHjvPJCmvi1u05aWZv/UTW9trG94ggCsd5jegBaKporCTwAQS703cx1I?=
 =?us-ascii?Q?Rw5p8mbxyW5uNIBIluIxC7mwxwPiCdcxvQu00IjPOzeInZMlwCtPiVU7EgPU?=
 =?us-ascii?Q?olfzymx0CGIDXOc/MUFvIeti7Vc1UqYxIxtFhouZBKt+dZUqgEE/2N7U6Jd7?=
 =?us-ascii?Q?6WikA4wn8DDQ627K0vKQMh2uKTF5UDVfkyt+RFpDTGwRCQgcwHkDvszW51Ma?=
 =?us-ascii?Q?VOy76ZHxAJaqggaxL4x/6xySjZnH+w723DsPWvQ9t2wqT7N2fJBUyAr0L2ZU?=
 =?us-ascii?Q?zo87n7nNZYzxlY970HF802tkyhATUfO4eJ+j3vwJOme4mModoiM989ga72AK?=
 =?us-ascii?Q?H4YCnmH3v/VS1gpLhaS+kcs0lCPqP+d5aP1jLo/sgbfaU56cegJONFWKLeYQ?=
 =?us-ascii?Q?92h3Pd5G70DYZBgiGrs8yyJm3nTR2RtZRXO+4ObvTwF7n2HTLMIIMct1dx/+?=
 =?us-ascii?Q?GMuAhqSb26gOuxTHQH7Fp4b+pCwpaZnST8zs8MDIvy7WR1pl1cAMTWBk2dAO?=
 =?us-ascii?Q?WiOCcKvej4mNOiHejAhHGSAmil4OXLdcWr74ID/LBOWUrVc0jzI62YIMyTW4?=
 =?us-ascii?Q?0Mb1+Y9923LX4XMvneSKENWwN2VoVrKxzumisLAb2C29JTmTCQaQ/ri29liI?=
 =?us-ascii?Q?TcZ9KZjlD+sppyYUUdXReEC5SOipdElmn/4UC3bmld/CZi02DQDyDD4VYQik?=
 =?us-ascii?Q?k1Ks5sYfLpgoxoarJkrIN8Kp4ByWj2tK1TL5xPhpPBaOa/rS/lQqZbloBSJO?=
 =?us-ascii?Q?RbvHViqaDAelaIkdcW5mqwjXT9MjZTG+IjbQSFRces948cy2GwLcMifruFY0?=
 =?us-ascii?Q?8rXXW3qG3fmR9K0J+0Eza8lW5jvLBiELp+HoL/6v6uMjsNpBIKlQLLY8RShn?=
 =?us-ascii?Q?nQsUhI0i/9evczVUISriS7sXxpiqSYsADFy9wf0dqvIQbROpxnpWccFFg9l1?=
 =?us-ascii?Q?fWd6jfAYu0xWIHoDlc07OHe6UAgd5kmHGHumqHVpIEMJNv/GJ5UsGYD0dMa4?=
 =?us-ascii?Q?/X66j3YpEtjwJCgCuRZgIeZi+MZ6P1VdWbl55qjdJlkfdDWPVFMG1f/8QRaN?=
 =?us-ascii?Q?a4qE/6RnQROWWBAeReve7d6lENWG035xi3Mcl35YU247jEMrWF7rRJKjBGCl?=
 =?us-ascii?Q?aFc21vFYbT/TYBmQJweJOXZw7TCv1HvAW+DfU1ffU/lho40xeWBhHAIM2h0D?=
 =?us-ascii?Q?gzpxULZD3LCoxFZE3Ag3ZhSDzryycEHG43ZjbSQ8rNFB5KkC+3iCD1LxnEQu?=
 =?us-ascii?Q?MO3YD+adz04MGKkgpvf1czsOOhNX61NkYM5cS33DQpDs16P55drsWIU8qNud?=
 =?us-ascii?Q?nPEkD73MHwsBSFzHbnyGXxOAJwLt7qJXcJPS4kv4AnlQ0xwt6aVYRKhdMWEm?=
 =?us-ascii?Q?lkYG5shGTZm4GpY6Ke/dqIjC0ZWepIbsF2m8H9Fz1rg/5v6gC/yZcMsW2mwm?=
 =?us-ascii?Q?RrONPVcaCqUvm9iqzizVsi0CZR1t4wmeTOZf?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:51:52.4853 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 577ece34-fe2b-43cb-639d-08dddbaf1210
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8970
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

