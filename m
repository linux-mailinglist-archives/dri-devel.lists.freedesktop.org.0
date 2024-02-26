Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E51EA86826C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2532C10ED7F;
	Mon, 26 Feb 2024 21:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WljIJsPb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF7310E70A;
 Mon, 26 Feb 2024 21:11:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eg+vXK2iIKV+K3ok99egvPQ9LZaxb7+RdG+8n9xqA+jeYuzpniB5sO27G5BpEJVhqJlK7wpOkzV93GF0vx23gJuu+01Z/X4+Cue2lGBkHpJm2kshDURcbyXDwNMC7SV0e2mKShaYlGygIwK0JCrI27fXKpAhWHjMPg0atjWp07GgQrdYUw/h9m0dmwsFwG+ZYUet0f8iogAVHNDQfs8QIjMAi82AxsZBngDL806E4JEvZb4ftnHAAL923I8ipE9N0OwfffMk5UF9ALmv2Aj1Xh2wYspg6zWE8kcCKTjBimhqCUKpO4rj2U/JzEeY3Vn5NTGwINuK2cQ+ePfY1BBTjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEC8nHmS+I0/+Ll92oY/Ct5vlUHF4a+GGD2qbU1N404=;
 b=i10wuHVuR75drxSopYNSvO4yNeAkvEeMPIXKfHPLetC/wo6z52Q8OGHZgQhqDSapi8peEqtIBdvekkaBbumpL+OSXj11NtQpfXbys2igSRN41uBPdQvX4USrigfrPvry9wmfKMmmuuz2Fgij83SFVOdrXjpYScyLXRsFxOCGwdlizOo1dPr8DolQl6GshSOlDGQJ62mwKvFSGxht4FEScs0nBOsu9QXSoTr/G///EFfFNMo1Xvdq9l+TfJ6dVxgqNyJizPxy87WJBcUMhsjO/9mEGOmqczemWhFjX7glKqm7ydpuGCLW+Q06BFvpItoKbALiBY/dfB85AQryvEZ79Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEC8nHmS+I0/+Ll92oY/Ct5vlUHF4a+GGD2qbU1N404=;
 b=WljIJsPbxzHMPwZoNGfPf40hdLoPBK+psMyamEjUhyNsjacXPlzj9EtimJAgE/xMIaf6IuAhEUEpowmsYqk2Di2XskRKsRxnQNWfBXZSefJL/Arj9MIO0mUWx1c+rq/4ogA0b6ZlAf1Alyxcpd4IN8zg6h1xXzVfXsxhS0Y8S48=
Received: from DM6PR12CA0010.namprd12.prod.outlook.com (2603:10b6:5:1c0::23)
 by PH7PR12MB9255.namprd12.prod.outlook.com (2603:10b6:510:30c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 21:11:07 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:5:1c0:cafe::69) by DM6PR12CA0010.outlook.office365.com
 (2603:10b6:5:1c0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:07 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:06 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:06 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 03/42] drm: Correctly round for fixp2int_round
Date: Mon, 26 Feb 2024 16:10:17 -0500
Message-ID: <20240226211100.100108-4-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|PH7PR12MB9255:EE_
X-MS-Office365-Filtering-Correlation-Id: 28cdf226-2ae7-4a77-c3fe-08dc370f731a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: abP79bzrTy6tKTJuyTkBn0CbT0fc8063HEZMLlRtR6+WVPrd6g5Q64UWC8FdEEJ+ZyzGmZ2Mn+6F5haD434zPWlgRDHjl8T6duRXzvhShxiXjZJdTCSa65bRo2QrAAhIxVAsFdy3sI9Pvj1kNFNGITmVImUdPJNRxPvpfKcjpm7mNxGy7/RNDntIVjFqBrLn5vXIy3Q3TW18jW26I9x4U22ts+P1Bmd4f83vJgDq7P/TsE4ZLTGx7eHtm8AM1rF6J/A6mlLTxEh7fJC4wIaCo1O37aWjvGRsv+wP4odWAdgk5A3WtViEc37gdFx+Ba7DfoG1CfLFQFZlWWBEGtN01C4HtWH8ai97uUFcqMyEb+kK7CGeBIDnsMzGXiC0815oh/LL0nhyazQGXpzA51jD28ajksLYpXpQJdUjnoClJIoWxUBjSWe2dVVXmgbjapmk6bGzZVqNFOFJP4lnrW7dS6vPlI9fH79eUCTILy5VYQhcA3EBHCG1DdsVi5XghoxAZ/l0C5/6gPGNS+TjkmUJOpKNnJAeggS9NQdzmQn1hJF43NbOBuaaX5nh9mjsCVG4Py9WRR78hqaIyTfdtrFUuAP/8Q/s4mcl2b7+N9Iwo83gFUhDhy7Q4bnHHatFuOwfYy6euIqQ5mNcO3iQTqypKE2H4O/UTj55a41Yhk1WQ7LM9N98JAyVEX7MBO2MS5K702o6kqG+yRTtwAGu1CPEPyZYE0TxEw7pIJI6CV1tEH/CpyxmE+AIAVXnDeTMrWyY
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:07.4157 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28cdf226-2ae7-4a77-c3fe-08dc370f731a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9255
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

A value of 0x80000000 and higher should round up, and
below should round down. VKMS Kunit tests for lerp_u16
showed that this is not the case. Fix it.

1 << (DRM_FIXED_POINT_HALF - 1) =
1 << 15 = 0x8000

This is not 0.5, but 0.00000762939453125.

Instead of some smart math use a simple if/else to
round up or down. This helps people like me to understand
what the function does.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm/drm_fixed.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
index cb842ba80ddd..8ee549f68537 100644
--- a/include/drm/drm_fixed.h
+++ b/include/drm/drm_fixed.h
@@ -77,6 +77,8 @@ static inline u32 dfixed_div(fixed20_12 A, fixed20_12 B)
 #define DRM_FIXED_DIGITS_MASK	(~DRM_FIXED_DECIMAL_MASK)
 #define DRM_FIXED_EPSILON	1LL
 #define DRM_FIXED_ALMOST_ONE	(DRM_FIXED_ONE - DRM_FIXED_EPSILON)
+#define DRM_FIXED_FRACTIONAL	0xffffffffll
+#define DRM_FIXED_HALF		0x80000000ll
 
 /**
  * @drm_sm2fixp
@@ -106,11 +108,6 @@ static inline int drm_fixp2int(s64 a)
 	return ((s64)a) >> DRM_FIXED_POINT;
 }
 
-static inline int drm_fixp2int_round(s64 a)
-{
-	return drm_fixp2int(a + (1 << (DRM_FIXED_POINT_HALF - 1)));
-}
-
 static inline int drm_fixp2int_ceil(s64 a)
 {
 	if (a >= 0)
@@ -119,6 +116,14 @@ static inline int drm_fixp2int_ceil(s64 a)
 		return drm_fixp2int(a - DRM_FIXED_ALMOST_ONE);
 }
 
+static inline int drm_fixp2int_round(s64 a)
+{
+	if ((a & DRM_FIXED_FRACTIONAL) < DRM_FIXED_HALF)
+		return drm_fixp2int(a);
+	else
+		return drm_fixp2int_ceil(a);
+}
+
 static inline unsigned drm_fixp_msbset(s64 a)
 {
 	unsigned shift, sign = (a >> 63) & 1;
-- 
2.44.0

