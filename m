Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A2DA9FC3A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 23:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CEF10E265;
	Mon, 28 Apr 2025 21:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="42dpD7R0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDBA10E259;
 Mon, 28 Apr 2025 21:34:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTyMmoyEhz+mlj9xpaTQgJxtbMH+aLG9EKY3cojydy2QWZKKZMp/tHlH0/nyDyQ00vPeDC7S6tl+N+aqgVIItDhXaDoeXgjmzr3idobW8Ijehs39kj9e37p6TMnvOSZOzf0pYNbaOXBCVA3027/dU07uDfF3y8quh/cnrW+lNCbMB4XoPmsLuMUK4YzODWhXuuKyHQcQFTbPzY3eSYxkrXerJ8kjFYX5CXRds4YqSqvrv6Yt9r7l8A/5fCYCWAnC5m1EprWPxz1JPbmEi1nHtC/epqHQsG92LinKKNjoEiDcbAOWQe3MFAhqUsqk1/0bqR+bYuA/ka1Lg08i2Nnh4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VI6I9Y7/5sdnSsYfA9dofHj+xepyObA9/NKVZPP09Wo=;
 b=bPPdLKTj8XGZpAbDZalTc3dUzoVmS/xO+V8KnFByySurlMwQ2AaRiOsKOZMoyKrzM/sj6CIVR3KVwUsEaoy0CDRPchWw8GIRDu3WnmQwI30IR+xojv0g46zenurlLKb5TiIptnUmj7LJGiDH30GRyvJIctBOz0K91lComP1s4egBxeK4loeAQzVMixfyE6436g5FoMnfoNqVO8EhaGqiVPNqXZ/NZkqitZPr9J5tf/rWHZeFpktI5RSOpNm+t2EWyLvKt7qQEVT7h/JKofBl2gS5GxjUCtaSZGyVHq13b76zlUf/ZnJV1au0+MKdMunQzAChzTcW6hWZ4b0XxeInCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VI6I9Y7/5sdnSsYfA9dofHj+xepyObA9/NKVZPP09Wo=;
 b=42dpD7R07tXKur+vJKzpXFzOdm4OQQ32NaSDaK0ddhrSWBcaxsIkKH8pXgTTcEZLO18nkq1vfrS38NXmyY9YJopOggkRqOXmNi5fPqHIM0k4Y8UM9AQFO+QAtfwoNIZsMXioqCa/gCkGOARiiUH3oYg1WuHmPA1xQqI80gma8w4=
Received: from SN4PR0501CA0033.namprd05.prod.outlook.com
 (2603:10b6:803:40::46) by SN7PR12MB7978.namprd12.prod.outlook.com
 (2603:10b6:806:34b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Mon, 28 Apr
 2025 21:34:14 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:803:40:cafe::1) by SN4PR0501CA0033.outlook.office365.com
 (2603:10b6:803:40::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Mon,
 28 Apr 2025 21:34:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 21:34:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 16:34:13 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 28 Apr 2025 16:34:13 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Leo Li <sunpeng.li@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>
Subject: [PATCH] drm/amd/display: Don't check for NULL divisor in fixpt code
Date: Mon, 28 Apr 2025 17:34:01 -0400
Message-ID: <20250428213401.752738-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|SN7PR12MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 5baf945f-bf61-4a4b-ccd7-08dd869c6c18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uC6KsK7+OjPpf77eid9Qb7kHIWO/xv1a0vSoULCw0qDkrZXpau/sMcgTLpx3?=
 =?us-ascii?Q?m0Bmx3PexuJxmmgCv7yt9g66QnCccy8csyMsa/9HbXtBey9a5PDxIZocEdcU?=
 =?us-ascii?Q?ljs7GfC9hFuVStaPBi5wnbVXLpEa3fTJcvaeCpijQdK4fkP5d5Ar8aPzaJlc?=
 =?us-ascii?Q?8ElvJPGlH4HAToMGY5kDS6gxv8a5Az1qXHRSawlRYUVFNK7nyJKcUWkZhBhg?=
 =?us-ascii?Q?Ivj3mgORHq/KaCEdR4s4rXN17kWCbI9ZqgtsoYxb8wrHN7phHfK89xFjw7Cd?=
 =?us-ascii?Q?MKSKrycpL8gacJ3FIok8dyUppdCpyRjxWfYyuOgP9grSy5yjaqW0+P0bxZxI?=
 =?us-ascii?Q?ZRWjnAbtVnZ6gyBPREyRs8QTZfXuIVitntE1840XCAirDNzNx9+d6OPTVJRg?=
 =?us-ascii?Q?59dYpinfoKXtWYyrO6CHk1T14iZJdrfp3FCT9ew66OB8gUrJvgOKhXoIudRW?=
 =?us-ascii?Q?+M4ZikNtZSUWB9m6YYyUOnoP1TbIJQ+9Z4QBpnIoZHdeLs1EpFLiR8ghUfUZ?=
 =?us-ascii?Q?3kRKWKZ/eL+eT6XMkif5WeXUUfmudmrxEEzNyS34H3gmM/WYnKklRtWNKN/F?=
 =?us-ascii?Q?yIdllSYVyqW4zK17Npz6vUL4jdGWW+e27v53W3FC+Z+zfrOtlODUBfnShIWA?=
 =?us-ascii?Q?lhbxrpMxUv5r/V71jPSvXx4JrsbFRbjo+4qVsObTTvmM3zDqp0cuEc10uByQ?=
 =?us-ascii?Q?q838H/jEO60zgyXPi/INS8LcDPlk+Z0+V3qCHky9MomWDhcHXEAJZ7CQndkw?=
 =?us-ascii?Q?AlHoq3BHflTarS9TryyQiOSyCUMHsZJXjP7qWH85ux9FyznOm+B0Rbqk7+zs?=
 =?us-ascii?Q?ihNBvDEl/e2/NqCjIuBHp+3wQy4lRtXYqHEF63/Gp51xXq5k9xkYFsvA/Zg9?=
 =?us-ascii?Q?Rr6NEcVGIb4UBtsyUMvNhp0j/ZDW9BhwUXC2wmByW96CXS7x8Z0Nq/kC5Xti?=
 =?us-ascii?Q?N2REfripeFZn1ltdnN/xH4qMKs8BMHyBiAAb0wvw7dR6wAC1rDbJ58TCoJFn?=
 =?us-ascii?Q?eGag9hLGH34qo+AdenANKQmoIfem2bTjX1iLX84cfSQCR9YiW5ZJO8emhLCo?=
 =?us-ascii?Q?qulbLy1vQUUDRHsEO673r8pXGRul/3AQ0tRR+cVqG+uW2FL/6N7cC9XISo0/?=
 =?us-ascii?Q?UAiwCyDfBbtqfIwNOCtdNenNal+jdGNtS7qPNAip0HbNoHFdq3reeJ9xnzfx?=
 =?us-ascii?Q?EkGkji+FR4ZhTw2XK7zEUjD6ZKAuNg0wg3d9fVNRowIBAY5Xg8ceI3VywXZX?=
 =?us-ascii?Q?B9Fu6xT0BnmBVrvrAqSjNY/o0B1VNN4UtJhWlEd9TqVA3iPkxg/YWDaLHs/k?=
 =?us-ascii?Q?tmuZOkw4Pqmq7ttpMxzYq4ZoNV6hYo2DR6LOLvmeL7dsncxu4BbyWVPROgeR?=
 =?us-ascii?Q?ts2WNoL79Y2Dxy6wwpnwUZQyN8Rv0ifL8yq8fanFfRZR/GpfxWJowQyD/Giq?=
 =?us-ascii?Q?l33gtAxOzzO6ASslXQ3jeaV6zx6WwwYrMw9GV7rnyGqyN8PYrtriu7QRC3aa?=
 =?us-ascii?Q?+wRUs+1T2WSMM4dKYDtWUnJ2MyT5p7ZLVKQ5?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 21:34:14.2377 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5baf945f-bf61-4a4b-ccd7-08dd869c6c18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7978
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

[Why]
We check for a NULL divisor but don't act on it.
This check does nothing other than throw a warning.
It does confuse static checkers though:
See https://lkml.org/lkml/2025/4/26/371

[How]
Drop the ASSERTs in both DC and SPL variants.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c   | 5 -----
 drivers/gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.c | 4 ----
 2 files changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
index 88d3f9d7dd55..452206b5095e 100644
--- a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
+++ b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
@@ -51,8 +51,6 @@ static inline unsigned long long complete_integer_division_u64(
 {
 	unsigned long long result;
 
-	ASSERT(divisor);
-
 	result = div64_u64_rem(dividend, divisor, remainder);
 
 	return result;
@@ -213,9 +211,6 @@ struct fixed31_32 dc_fixpt_recip(struct fixed31_32 arg)
 	 * @note
 	 * Good idea to use Newton's method
 	 */
-
-	ASSERT(arg.value);
-
 	return dc_fixpt_from_fraction(
 		dc_fixpt_one.value,
 		arg.value);
diff --git a/drivers/gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.c b/drivers/gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.c
index 52d97918a3bd..ebf0287417e0 100644
--- a/drivers/gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.c
+++ b/drivers/gpu/drm/amd/display/dc/sspl/spl_fixpt31_32.c
@@ -29,8 +29,6 @@ static inline unsigned long long spl_complete_integer_division_u64(
 {
 	unsigned long long result;
 
-	SPL_ASSERT(divisor);
-
 	result = spl_div64_u64_rem(dividend, divisor, remainder);
 
 	return result;
@@ -196,8 +194,6 @@ struct spl_fixed31_32 spl_fixpt_recip(struct spl_fixed31_32 arg)
 	 * Good idea to use Newton's method
 	 */
 
-	SPL_ASSERT(arg.value);
-
 	return spl_fixpt_from_fraction(
 		spl_fixpt_one.value,
 		arg.value);
-- 
2.49.0

