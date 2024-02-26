Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C8286828E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:12:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2621B10F1A7;
	Mon, 26 Feb 2024 21:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="X3o/26Vo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E3A10F194;
 Mon, 26 Feb 2024 21:11:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZOXTkxU4PfDf7xFLA9vgbsML9p9I/IaBxWm/S0OFBdnUwBs0sVUn/5rEfNRSXMHO7UvTYpw4fGPLc6kyKkgDqC6toiHpngJUFbn47uwyGsZtfSbYkOu9X3u2MyB/7VPTbQ4sK8tgVmj2tbg8j0Ih8A6TlJ27pDa9NhEZYrqK4tqcezYSwWlHBTOc22bHCPiUXJAQlriXLQtTImgHzAjdDejXRQFGjmOP7X0aBAbpJFnQ6kzqQyDjyKuB+j0jbdtD4KPtnuwFjeQMbVPRR12ojWKRrPO68S37JOO6gqc3NCsb6A6enujfkVTGwTbjXtnfYV51rPxcxOujkjCYcw4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V45HxJnsf/20+5/F0g80jTKccZi/aTErVxpgKqJfNzQ=;
 b=HpGT42hl/96f7K3Wx3VpH4jj1F3VhMB2J3hCl+Lx/SfKA53g02AML7/lkL6K2lHnBG2OBuPK5AK/soPW+Y6DPxSEvpVPnLeqrGPfg6HyepC1Bc3blcw6Xm02cbzF7qtV9O11iCJM+YbNdmdslMnB3QM1amDyy5lXrWTuqgGlfqTJvTpv2XELF3zSbFh9pd+NKZp0Nap+s05VEX910EvW3epjcDuitdhDSUk2+pdJjBZpZklWfIgvoi2+Ucph0WI05BWbSvARXRauJ78wHDkRKO74O5ILDgGMZOyxcNKtjiCTHkGoSIXAxMtDGUGBdmQcNXR8DUiDi+TgAY16G8ZxAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V45HxJnsf/20+5/F0g80jTKccZi/aTErVxpgKqJfNzQ=;
 b=X3o/26VoB9PHMuilP5j5laEYNDyQv4PE9rTanqVwgbEt6vn2UC4AlS4/ioi9/P4gktXsHIeGPQewivuD8nYhNFQCUMlYNT6K/fmqx4mglJNj/nWwWx1paAzXcnpRIQsT23au9MMbWV2naVgsePQUXYu8ULpmcnFThba0+NTqIrs=
Received: from SJ0PR13CA0063.namprd13.prod.outlook.com (2603:10b6:a03:2c4::8)
 by MW4PR12MB6923.namprd12.prod.outlook.com (2603:10b6:303:208::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 21:11:24 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::be) by SJ0PR13CA0063.outlook.office365.com
 (2603:10b6:a03:2c4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:23 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:23 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:22 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>
Subject: [RFC PATCH v4 27/42] drm/colorop: define a new macro
 for_each_new_colorop_in_state
Date: Mon, 26 Feb 2024 16:10:41 -0500
Message-ID: <20240226211100.100108-28-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|MW4PR12MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: f87cac66-cd3a-4846-4faf-08dc370f7d43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tLg6qG16TqPnYNJQgoFMqcO6NcSjeiQpMXEkoHXo+rQM7w6ISIAb5qUDeFJVvUFAK/zka3juJ4XzCPlSIYPYqg+COkj0eyRySdtNBQezgtH/32bdKHMO6/9bfwSolSmoP2N6FNNL8Et8Hin2OoPNpVKe7yA0BxnEg4uwN+L4tzE0dRLJBJ3DOacOH2NZMe7rukMajHEtwtUwcsgyWa93LgzhnKYOxLaK9QrvnOrXKyBm6FBZiDbcn7e8j7SQM1WbtjblQhFtAf0xpQZTvweNbM2a8fCfeibTY8xzzfBeIRjsRWiqGI2KPrPaF9ovplJULGoLIinmy78xqqhr4aXXXq8cm8Sj8qQlYn50hTws4fiJ8OcTq6Fm0bIRhuKkbGFvJiub0wdwdZrhw399VbpiJFKY2YXezINDX05hU7t0TvkJr+Hzoi59UxOWQ4QigQ/y0JHQgdQn+gqLUadubiyzKed/GfBM0CFNUtirq2rLjUyuzOXnEx53imPf+zAxHLDKpuZrneasOM0zzFGpdWuLPYaZQV0urE9u4fmvTiM5QL5rUCNC2+xSL16Fl3P9g3x7yCP7s9zCZI1AU9MYxN7Ngzk8hKNFid5f/6XVEsxjZwZ5QaX6l3toCyRW4qwvVgkBPkmBvm8DJJYICADWD4eooMqfUJvcO1QLLu5P8KnaGGsEx7QJHzkdZgHE4TQ6OJvvR6pl9bHvfHVbtL6o4B88dTvuLCeUYMkzkPEo+vMQSzQBlHJyTkL50QAm9dF8vLgd
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(230273577357003)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:24.4586 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f87cac66-cd3a-4846-4faf-08dc370f7d43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6923
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

From: Alex Hung <alex.hung@amd.com>

Create a new macro for_each_new_colorop_in_state to access new
drm_colorop_state updated from uapi.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 include/drm/drm_atomic.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 61e6b5553eec..a4c5ff99a515 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -979,6 +979,26 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
 			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))
 
 
+/**
+ * for_each_new_colorop_in_state - iterate over all colorops in an atomic update
+ * @__state: &struct drm_atomic_state pointer
+ * @colorop: &struct drm_colorop iteration cursor
+ * @new_colorop_state: &struct drm_colorop_state iteration cursor for the new state
+ * @__i: int iteration cursor, for macro-internal use
+ *
+ * This iterates over all colorops in an atomic update, tracking new state. This is
+ * useful is useful in places where the state delta needs to be considered, for
+ * example in atomic check functions.
+ */
+#define for_each_new_colorop_in_state(__state, colorop, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;	\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))
+
 /**
  * for_each_oldnew_plane_in_state - iterate over all planes in an atomic update
  * @__state: &struct drm_atomic_state pointer
-- 
2.44.0

