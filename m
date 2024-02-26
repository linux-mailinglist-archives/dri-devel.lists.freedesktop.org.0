Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBDA868296
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7676210F1B6;
	Mon, 26 Feb 2024 21:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0q9SsEFg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A02110F179;
 Mon, 26 Feb 2024 21:11:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kX0THRa1Lu/vL3HCqe/EZYMjbr+JKiuRyK9oxbI93QOQD2b73y4mnKyQNkhk7xRhtvUfbEDRWvZUSrY3VGkK+XA/NbmNGNelAqKB29mKkEeenFJVyuGtQsuNDlGBMUD0N9a9QIaC8WSCDyGKNZEQB7VIo9kSaSYYxDlU4eAoPEo2827dM31SAoTTBdJwAHKtNnFk3DiY/ZwJGxMhnWqFJSLEOFmsWFcG0H7AQ6FcKv0EYtWivy/akoDUSQ2AE0aDaBf3+m3w53LjfIUjQhLElMZb5suPWkpEsOrRtQerCQvsutdMSkJ+6J0k4DVtRrdAGrovo2RxWpfwki0cTiPQmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4xKqDsoG98c2GH8alVJzH3a6piptaGzHkHYWDvDa8M=;
 b=hoFwHJal6tPLEcanUtK3gkciQjOuDsS9BMg5GW5ynesPI/WRJNAffPlBiUDgxancZhyJ6jXRqhlR4O1mS3RtxtZ7JXnpo2buEEiYps8yb971pluWNCxSUWIpTEamc+bZDpNGkQQ18gIdyWY5hwDM9JZeXR/cqoXC0k262+7PD/gh1H0KiheZ/ErHdPHSePVW+kAi8xNkZNkt5tuFLc1jqClFPy6nfxy+U0bNI+aMPC+DetAwpURWHqW+Imc0sPZrbs3RoQrD9wcsxcHt1t+e3gJBpCvp8BiZa4CMk7OLm0GidY91xi0zGZcFQbZQ+6DqPd5zQwddYzzW1R0ADCjOVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4xKqDsoG98c2GH8alVJzH3a6piptaGzHkHYWDvDa8M=;
 b=0q9SsEFgDM69FwHe0tF+jFtmBEKf8AAfjx0D540EtNsNhDEImOXe3W4TvntWjYlAZX05HmO5qKzxRcTNHm3ElP0LyKBEhF+d8yjh7nziD61MAosuf09ouMb7gH9AQLqlGCY48K6ZR3UHH0y1tN352aTGvHCO7QZKuvejBmRhzHY=
Received: from MN2PR16CA0033.namprd16.prod.outlook.com (2603:10b6:208:134::46)
 by SA3PR12MB8803.namprd12.prod.outlook.com (2603:10b6:806:317::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 21:11:23 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:134:cafe::26) by MN2PR16CA0033.outlook.office365.com
 (2603:10b6:208:134::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:22 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:22 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:22 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:21 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 26/42] drm/colorop: pass plane_color_pipeline client
 cap to atomic check
Date: Mon, 26 Feb 2024 16:10:40 -0500
Message-ID: <20240226211100.100108-27-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|SA3PR12MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: bf38297b-0e4c-4d30-4218-08dc370f7c4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4W7/q4rWCk8ADe66P+gUkgbX6UXYZNPqYqY/uD564Ti6jA4GyPwEsPijJHa9LPuX/d+s3IrdtjkHHufQmOwNtxj1Lz8gsO6/0/kIgKJ109eaQMcaxYyQJo088AmoRkxvtqYaPVCPrq0W1hWa3bure+SgtfBNGvqpbP61luJVN865TPkpbOm6N+o75M6H9wHWbCFkiShNPZu3HLX5Rr9cR1vyf6mv0ZmDnr4bJyteooySOA3q1yRFtcHre9yZhCIlWl8Vy/gUmH4ndx3hXw5/Nj5gbxi/3teLfnxFAnJiCXSpJBj2RLuJq/DQ3rWLKcRjSyhGW6Livl0caK7uwg5vpU65DFgbkpv4Wecf7TpKCiJx6tDVWAKyMLcevHOUWn3ZO35mBOcxwotBbj8QRazsOUUBQEbtcsnbZxvWdzDsSDS/4kvReLhJqPgPltx+iYD4w3YXq8LkFC/q/YOLiDsRF6HlhWz5WkclH4iAOJZb+/DUzo2bRJg4ZwcvYzZoUFRs6y83E1zpdzrfCi+vKcWNdypmHn01f+rC/U1DjEzkKUOHfUrr5XvjsMsIRGks4AwwU4NTZwtvzSGVXRihLpGqQZooGptMD2gN/REUn+u88kGAZ/sdnsmgOLckPVQ//cYHATjlAy0qZZtI3eoeQQ7TvDRiXGoamm7PCioXAuGe5IdteFn4MrX4HikSRqM7gf+K/YLkCHwXoboXNXWH+Qwv51iXCSDUnYWVtIJqlOgGTkjt2SYjXc0wGHsZKtpnpc45
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:22.8774 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf38297b-0e4c-4d30-4218-08dc370f7c4d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8803
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

Drivers will need to know whether an atomic check/commit
originated from a client with DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
so they can ignore deprecated properties, like COLOR_ENCODING
and COLOR_RANGE.

Pass the plane_color_pipeline bit to drm_atomic_state.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  1 +
 include/drm/drm_atomic.h          | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 23b248987a7c..c7c1c614b0d9 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1571,6 +1571,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
 	state->acquire_ctx = &ctx;
 	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
+	state->plane_color_pipeline = file_priv->plane_color_pipeline;
 
 retry:
 	copied_objs = 0;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 2346f19eda9f..61e6b5553eec 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -404,6 +404,23 @@ struct drm_atomic_state {
 	 * states.
 	 */
 	bool duplicated : 1;
+
+	/**
+	 * @plane_color_pipeline : 1
+	 *
+	 * Indicates whether this atomic state originated with a client that
+	 * set the DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE.
+	 *
+	 * Drivers and helper functions should use this to ignore legacy
+	 * properties that are incompatible with the drm_plane COLOR_PIPELINE
+	 * behavior, such as
+	 *  - COLOR_RANGE
+	 *  - COLOR_ENCODING
+	 * or any other driver-specific properties that might affect pixel
+	 * values.
+	 */
+	bool plane_color_pipeline : 1;
+
 	struct __drm_colorops_state *colorops;
 	struct __drm_planes_state *planes;
 	struct __drm_crtcs_state *crtcs;
-- 
2.44.0

