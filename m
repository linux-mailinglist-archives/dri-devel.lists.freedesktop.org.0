Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9338682A5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A409A10F225;
	Mon, 26 Feb 2024 21:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i868ZAwH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A2810F16C;
 Mon, 26 Feb 2024 21:11:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3hU6/yeNB9fjW2Y2IA3Fnjil5wKQlIWwfTUy3JzX7D7WI0D7VMmATqb3jsm4xCnZ0VG/Y/DTU+Du5E8QkFH8G0+zBJQyolfNg75jkwZBf6hqm4Eso0fetaGNBKxdYfw6V+VHS03jQaAuNRST/H6jTmN84qmSmad7gavQPmBpw+aUh3gnfk3wDWR77SyWRYSdQpqFzTtbZJ0MyBXotiw3sCxguY7SsjDrDaUb28HkznQ6/JixNh1V/P8sgkm2dSqE816Zv1vT11Q+5mOXbISIN8xZShuXwL4y2Uaf/Cg26WPZRVAWLa8VQilNZTuBH3CzlOvIHKqJeRQAZbFkWl8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZH2HSqhtA4w+l0YUzMRO5KA43blkF6rKuyZih8RR9w=;
 b=ECj8+AXJP4HH+HWIS8p0W1Dvz8IO8vlIU1dxkGvPQMuJtA30ha+pl7r91z2IuGK+hd/dxGBXwSy6B0xhhshqvA6fFe4oZOwU0abDpaRLc7Es3EzfDFjb0T3FsSg4HRVVxhfcAdAChvoGLpuDfkUYvaKnmaM9hmn3zZZCMg+VVMPmqThWyqDs3NuLrx0Zacd/ML3ZqFQCWBke0DaaHrh622k4BgOl0Er8zAFeCcd8XrbAMVi5N2t8e/NtsM6ZP0Zrhvg/PWdWGlOWGrT92aKMioWGV33YIst1W9O2Rt+CBnJD41U2AXbxfZmHRw97+Jfk+wHvnv2ONkDErXKalbaYIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZH2HSqhtA4w+l0YUzMRO5KA43blkF6rKuyZih8RR9w=;
 b=i868ZAwH2s/UqplHrGD/CIZC/1LYuKaZc/qiYVwUECfKZ4O9Hmh3RKnLfi2E2uNmOniFyqxoyMktiyZBG6U2OJIauWhB3I/62HTRQCtiDa4+2Uscmj4HAzK2+A/i2TZx689lHnAsLRWBIO724iP59LFk4Aq7lvoxf7jgqUaWyTs=
Received: from SJ0PR13CA0087.namprd13.prod.outlook.com (2603:10b6:a03:2c4::32)
 by DS7PR12MB5885.namprd12.prod.outlook.com (2603:10b6:8:78::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 21:11:09 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::66) by SJ0PR13CA0087.outlook.office365.com
 (2603:10b6:a03:2c4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:08 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:06 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:05 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 02/42] drm: Add helper for conversion from
 signed-magnitude
Date: Mon, 26 Feb 2024 16:10:16 -0500
Message-ID: <20240226211100.100108-3-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|DS7PR12MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: ed7bd0d1-f7b8-45ef-68e1-08dc370f743f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XAjUQbhepVA2evKFVcLB3eH/KKdim3aqwIEBiET99BJO741cS4f+HvgL2A3nYZ6w/IImXjGGYgwKEgDvTZ72guLa3hHkqRyyjsukEMEHN4/KVXc5O7c/E5/zM7c/ApNkyae2dRX+snZ4MoIauDoCzm5xFZXQoJylIvUq9ldKcpUt1j94nOTeBVLBnSoXNHBFLY1ry9xJyLbmHXjvWv0oxcrHdBhRXpQboJg+ZiZ2xT1pF5aNR1FIPTShiCp+ZGu2IoLcG1hapjIIc3KzH8l2XengnZrMRBtKRntGP457O+hehmMDA6pCgVkIrTS+g1+fhoVkT09nE6dUuEzfd6i8iu/5xsAHkyEGx7ZudFYmIma251bv5cdD6h84aVfNadYC7/5YAvPy1pz0nYImdgWZCpX1BF4vjLow2+JWKlVYqdiEY1PKJAMjoKroncU/tEs4/fTRU35CedGPLhDLmQygJYGUqYWgx3vUhtJlX1Jk9bZdENrdYKErYoVpM5ci3xq9RuPXqtMEf438XnnX/H741EyUg3Rdjdqn1frKzpSp6aqSRCLGb3oDEW9SReFjhDAWq+6v7T5fXbOyj147kBmRSqvZorxhCXF0XErgh9PJFliu+azJ2Ycmak3MGmLaJpOH7TWJt5FYWLcSP16TUtMnNKwzuqRv8nkaHejtu1CbuHkWSOI//z0+phWsJEDm7mrNMxKNpmgH0YcToFexmlZhhGXxSApBQk7yQQ/gi2qqbRYco6ZHt2ZOm1RB+ZxqdIA5
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:09.3336 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed7bd0d1-f7b8-45ef-68e1-08dc370f743f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5885
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
index 0c9f917a4d4b..cb842ba80ddd 100644
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
2.44.0

