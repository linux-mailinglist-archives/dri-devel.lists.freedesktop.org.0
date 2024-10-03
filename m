Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9398B98F78A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3C610E8F3;
	Thu,  3 Oct 2024 20:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bBZKEjJm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5835610E912;
 Thu,  3 Oct 2024 20:01:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3RLDsElmYMAbplS2eIuOS1pdhEFI4TNwHM+nh8it3xoBDyScR1bI0e/8Qussp1NMgkZaEfwhgZTBu+pIf/koTQXJrt3dHXfhyMCpHWg7DEJSMQzu0+MZfH8Df7E9XG1Y7/GWR76boXPMyZHREc0giA4IOlejZkq2xCmS8DJlUA49fTfQzJp3GWjZCy2yuSwS6fdZURub/P1qNVub8wwtUSd9ecRpSkclsJVnkT2VOEyJToVWaBnTMGUvgAX254Dxmt1+NSG1w+URSBU5BghDEaGKMdnKwAoOXq7ec1Je52F+Tddm+4M5TfaQ0uljcubxwdnJdSrRLtL+oACK/NrSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WIRcrG8jXQrlSzQktHMP2dWxS1Vvi22DWyvKMIVAGI=;
 b=yRoyEf6sZQae76wY8qxoDaJnWrtN3QBAzTKxgU6hR9M9ytTm7FPHUfwZs7MVyC8NJ6LXj1homffzQQ/tORCQMk4MWZWcZCt0Ey9mBd46KuUTpq5F3VAOvMMPaRj7nZaO5jUnoc4LsMixETaEjk9zsHh1H9lXorfGXhGCVRkWzq30QU/B8Xo/exXU6dI5jgonW7vqwjK1VxGxoZik8cRPftlG2vf4cbaKz5RK+uBKW6lsitvCQJzlbu07puQyz8c0iZgnKDz0cs+9GjNbJBHY/uZCKOts1eFusqlrNaFaOcUrxO2fEKZ4wiZ49sZMwAUeRW2roYkVjHR6dS4VEQDSyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WIRcrG8jXQrlSzQktHMP2dWxS1Vvi22DWyvKMIVAGI=;
 b=bBZKEjJmlittVvsdoKAwBlPZlYt49lWzJaYou1ItTDYEMdUb178s+SXo01wrWcYc3EFVn9aD0NfVJXKlx7wu0DGF9nUCZIR/0cVoMmdc2ta7ABvXX6gab9SflclplHWyTxbmtJh6TqSp0BfcB5+cphL1rv7L/sqzGesegqK6sJU=
Received: from CH2PR14CA0047.namprd14.prod.outlook.com (2603:10b6:610:56::27)
 by CH3PR12MB8329.namprd12.prod.outlook.com (2603:10b6:610:12e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 20:01:40 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::e2) by CH2PR14CA0047.outlook.office365.com
 (2603:10b6:610:56::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:40 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:33 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:32 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 01/44] drm: Add helper for conversion from signed-magnitude
Date: Thu, 3 Oct 2024 16:00:43 -0400
Message-ID: <20241003200129.1732122-2-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|CH3PR12MB8329:EE_
X-MS-Office365-Filtering-Correlation-Id: 35db2853-0978-428f-491b-08dce3e63267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GkFyW05V+T1Dw+D5AtFu+4HqqP8/gmWU+A8oYblKppGJ2JznWfFMINUV6Qjb?=
 =?us-ascii?Q?TZelVnfLRS5Vzjm5Ry7dRG5h8/eBCkzrwVIANbN4642OJTLqVkIKgzz/ClDN?=
 =?us-ascii?Q?lFI5gWUSJC1GiUTNXfrkOSoCd1zBok62ZujjrfULVawZ2L3oBo4l6Ss8Rd/G?=
 =?us-ascii?Q?Jrnk4pAWIbr4MMmvMeAfV23GQHXHXhXZVpa+eQhhnql26tEcy2Cb9YdNoZP6?=
 =?us-ascii?Q?5RieZROMwwGWkSVLYOpqBzR8tRpFjOAqMNQiis94twUre1KduXfrQxiAqV2x?=
 =?us-ascii?Q?MSeD7iNK644DsChUOSKzrQciQx7iPJg5zdmYlQIAwcElcVeYE42oH7nerNyN?=
 =?us-ascii?Q?WnJJLVq9wElEAQ6Qtb6Pwv+e+FRie4JuoISEZfD73TaR2AjexrB//u6ISrFy?=
 =?us-ascii?Q?cKfe9E/P2szWNv6Rx3y5yPNtu8ORTZS3I7JqAi1w3K39iAa0b1oSQNnfwBnc?=
 =?us-ascii?Q?sV96GYchHwLppT/OHqfhrzKHKeUVyMal9Ys91FOLTeB+SW8VlEZUcvfeOVf6?=
 =?us-ascii?Q?rWw2uN0Y6hWiDkKN6u8o6/CAQn/DL6YNNbj9ZFFq5w7BZ0jVQTNYpJx7U5ef?=
 =?us-ascii?Q?L/iOtSaxQmz6Pxfz/CMqKCA1Sihp1jdccohp6zcH0RKo9DbgOS97oLlDgC37?=
 =?us-ascii?Q?au8O3HJeGL2/8pl4gebxhLB+fVO6/KMcZXItl5SREPCKIl/losmoMVnLEdL0?=
 =?us-ascii?Q?GUfyJnn1MXj8yTNDxrMmvvEI5mdqLL5igbOJLYzI+7mTFkCxkQSidVF0vPlA?=
 =?us-ascii?Q?au+9JT9deK0jRQcpu7Qfoh9S6aVUpbq1hwHuM/5DE6v6hz6ITgB3P0mL3IGe?=
 =?us-ascii?Q?lVgmyNayLtWi9F2pxFfZMEIA0QaqRl9rHDeUm8l3+/j38Sz13r4ffoSvK/kY?=
 =?us-ascii?Q?KK3msh5mN/6TzMD2scuMaO7FbG3IrGI7DlAqyFBogH5bWBHyz31L/R4avybD?=
 =?us-ascii?Q?XrARFdf7HwrvuWQEFVXt1jFhb614YKXuAUnlG9vH82cLGVeWOHzeePm5G8Mu?=
 =?us-ascii?Q?JKNI8eGJN9ac8Y2y6w25fQzxQHsMjXlPgT7ShpMlvJl9hJsulDdlKs3axws9?=
 =?us-ascii?Q?xsWXTDBKIirNnfH6z+LAu1RdWaK4dbA5ICkR3Gmy2DQUuQXK9PQWGIS4wHxg?=
 =?us-ascii?Q?XTWW3sRWBdo3Wdp4KovSQgC/B+qXiJVsKb1pn84HkPkHL/q4QuPWN2df/bKe?=
 =?us-ascii?Q?77IsZeNZ8KGn8hkaZL/InA9t8YptXvHuA5CeFXdq9wYCnYQAdCWcVvWhw/GI?=
 =?us-ascii?Q?cV6pgKf1znEh6Jd6R8S/s3raioPbUJtzjVPRmJpzJPqrsZRd8CQn+jvtB+gG?=
 =?us-ascii?Q?kwR6yFHGpE16+jPK9ojJggyfzITaVjFLTzfsAvCt6xAIZb1UXlbbvSZmKXda?=
 =?us-ascii?Q?WI5O2h4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:40.6287 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35db2853-0978-428f-491b-08dce3e63267
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8329
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

CTM values are defined as signed-magnitude values. Add
a helper that converts from CTM signed-magnitude fixed
point value to the twos-complement value used by
drm_fixed.

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
2.46.2

