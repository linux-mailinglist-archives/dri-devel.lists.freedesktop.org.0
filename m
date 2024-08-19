Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9427E95760D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB1C10E3B2;
	Mon, 19 Aug 2024 20:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ghwRTvQS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C8910E3BD;
 Mon, 19 Aug 2024 20:57:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9h12WCCNUG+IKfrlOV1NdlQBDs8OhnRfpy8g7buPzOa/Kj5TaJSh8w52C7DjuRs1Ig8KCrk/kanqHcXtaQwXHxxSNMEBw+aVqv9Q9EP6pNuZJx0YhzIXl2oqaCRFPL2OUJfxtzUH13WeA5U+RON9rNqj/DFx7kG9faLNcKwdTickGL+7Ry1NMHHeieoJ5bIIj+mFlFcqudy43iGUJAFqmG9hTjG1zPI4pD3Hov4OkNeFMyS3eLmw6SPvOl6ZgnyhGWHfq2Sj++JkaIXrpQ7mtMNdQg1s+R6DwbcIppSx7eYBuVguzGAVej3wksbVKdsqKYERT1dwaHtew6YhxLKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pu4oYD+a4RSP5JSmjLmw6bfvFU+JjHlIHbqEo5qenBA=;
 b=LSrdTKxoWXjh48axMmBenIBPek+B4E5Ak3jRLFDCEcnlTDgtVyieoK5UaWsXTPrIWbxLWzKI0F1QONrRQCbccUS2BpZsalQMHCo+2hwtZLWwIkUeIPx4qTzdkRys8oD0YXgL8ERHnDu2kDyNYHhy4TA5uAqopxEWQlRS4iI+WLNquBc5WNVEZFcWG+E1tW6gskpZFFmdYeC3eGvOT7MRjHOkzfEuHwOjIH47hKWuiQ2GWIJGv2/85E63EO38AzP52LGPG2rhVQSyi3N6+8dxW1t8fPDQ7zvPpwh0tRCr6R2Zzqj2Q/kgDWDm9eykuVoXW7uGylFcsFizJzzcQJlumg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pu4oYD+a4RSP5JSmjLmw6bfvFU+JjHlIHbqEo5qenBA=;
 b=ghwRTvQSbKlIvQwUBOmlRJP3fVIpqSinh3HfyX70krR/MFC+vB3xgtLP9O9FRp0zN3cZ3WFBbjGAaSYKZXKh+RIfaADt2VKXOey294rgAOY8Ntvz+SWbAx1iqRfNW1feMUseduJtOFD1x77p0yNkxGi64qM+8AJ6IJiV96eG0Go=
Received: from BLAP220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::12)
 by DM4PR12MB8474.namprd12.prod.outlook.com (2603:10b6:8:181::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:34 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::a8) by BLAP220CA0007.outlook.office365.com
 (2603:10b6:208:32c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:34 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:33 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:33 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v5 23/44] drm/colorop: define a new macro
 for_each_new_colorop_in_state
Date: Mon, 19 Aug 2024 16:56:50 -0400
Message-ID: <20240819205714.316380-24-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|DM4PR12MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee0288f-ed24-45e9-c236-08dcc0918cd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tYVC9Kn76xkxI+GbQQDP3j1ME6mw6nwnpvzeJld3ssS6JwUWMbJapK0/8asP?=
 =?us-ascii?Q?FvWMPpOg89Ptso20g6ccz9NWV08BfbhQzTyXGSvhbx3P+ocCWRSZdiSnIUEq?=
 =?us-ascii?Q?w4uAHIzzMmVoN8Y9P3eJDge+4nguoUS6SnrMK8RieECGhWAOXMpLHVzmJHH1?=
 =?us-ascii?Q?R7t5ZboRlxxjok5ZEhEX/kNsutuz5QoIb10/fMHZZT5wXKJMFs+WcJlhtR65?=
 =?us-ascii?Q?IYL2w/2bgxTIvwwQGTFkiYcA12NqzFYtoAtNaPlSHFYT7cFcN9uqB3TGIgb5?=
 =?us-ascii?Q?5mAde0a3IYWe29B/dQgdD/dKZN3lpMAjrK9WWHmzQV/t7ajKcUqDuVQbvwue?=
 =?us-ascii?Q?MUfleBexEBlwZByX9ScoO/x+un523u3KGI9VL3FdkTLmhqFqIfIQl/lv2kKD?=
 =?us-ascii?Q?RK75iHg8sMiBn+3Y+CbFv1NwZ9A8wP77Ak0iuYA76Otc+Ao79Qgxjhyto5my?=
 =?us-ascii?Q?hiBNAjb7/yPIVJhfyh5UZ+63rTfsCe2YMQwW0rIg3uJJ4zUaKkp+bv5SUB7B?=
 =?us-ascii?Q?sIimtfO+pC+4dkeYUuA70x1QQx/ELLmNwYv0FjIRWR8kid+Qtjf67pV/EodK?=
 =?us-ascii?Q?R4LJT+yCc0HJht/oz6ZgYnndhCNca5fE8J0wtsZHXlmdaBOiGlKqywQqE3Og?=
 =?us-ascii?Q?8wzOHDuSmSs2hKDFiKlclpeoiFipTtZZAYCqdT/QPftBnvQfIrBRy+pWM2R8?=
 =?us-ascii?Q?kA7y26Ioj5DpLb7727N7RBM2Odd9dI7xKn+lrwZgpQmN3cYm2rq2TCuWMXWs?=
 =?us-ascii?Q?jo9m5/KlFoJOfUFZxa7THZ5dIdCiOEYi/AI26PTXPWasI4EkFfzBqPmzrwhq?=
 =?us-ascii?Q?VecyaI5eNLrvJM/UF5aV4gJ4nbn9aeS+5RjlRJSfbIHr0aLInmRuFcGBmjV+?=
 =?us-ascii?Q?r9cPPIMGMAQyAtbYQys0oE4MaWR0FtGwodV0EJbhOVj1Apc9hpJxw69rxq7t?=
 =?us-ascii?Q?wybtqw/kWWPmFD3ROkL49fG1yvifvnHHy4iVlliH0vKM/Qvf6ENGDzS4deoL?=
 =?us-ascii?Q?YN28x8HnVCvYghKx3xXQL0gDx+1Dntn3t1JFeUg072MhBS7aCUb+318Nfz2C?=
 =?us-ascii?Q?iWN6kEpPbeKs+dnUkJGklSqlofq79owGE+5oF0lsOF4ZHeDHdNwM/nDqmK+d?=
 =?us-ascii?Q?h8eOKkQsLmwNNcJGwkzDv11OerxSeeT/QOYEKxhPe7V4/BwBdDQgup99/vjc?=
 =?us-ascii?Q?MTB5GMKCjssoc649JIuHr8kAReZ7bpS76hFbowqTGJwWg/tfeg7jmvRmYRaN?=
 =?us-ascii?Q?399ajnUicmnZgUuSZX40UMsOrMBRTw+tUjf135sLwylyY0Gw3gsGZcYQJV9q?=
 =?us-ascii?Q?zVe+NqY5OTjESiPta5tBy5/+Iz1zGbcQ3WqIa/Q/U3WyMuc0G884WlvsQsiQ?=
 =?us-ascii?Q?GTn0gGn/8A65iFwRO61LdjBTIrMegxWU3q9k8arQBoD/hVLfNycJKgc7SMyD?=
 =?us-ascii?Q?1w1XPVW6PODi204Ksj5QnXl7KMiZRFkt?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:34.4727 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee0288f-ed24-45e9-c236-08dcc0918cd7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8474
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
index c908ad75b95a..ed767cb7a55b 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1035,6 +1035,26 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
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
2.46.0

