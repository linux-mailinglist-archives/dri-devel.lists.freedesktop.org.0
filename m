Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258148C94BA
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 15:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E0810E24F;
	Sun, 19 May 2024 13:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wltxjiI0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2049.outbound.protection.outlook.com [40.107.100.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD7D10E248;
 Sun, 19 May 2024 13:07:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/r7Xk9IYr24XKmLjs8910v5Q+R7ja+xBa0/DFjg/m3HLC46axRZbiIgwdCv3w+I31SjNW2GJSiqw7DJXQomSzVzNvgjY4anWD/iGKfeL5i08jECm2AA/9DjLwWM3lrTbtSe5UrQTOkMiOHmL3Xg8ShefBEarc7XmF6PekdlILZ7P+264CPRA7lgxhzvvl4tgmRtQosWDtsC3xqqRdv3u8RIVHv+br9JyJ72hxb8XT89xlHiYhp4SoU+YLU1G8wVas262yPuMevM8RQolgFzZEFbUufQ2ZDRU4qh2JXIiC0PpMSZoxPJM4DBBw2d04/CCvRYsM6S72cj1dkFJxpVqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeydpEBtLYY7iYyMC2dyGgS1ZgQ/zw9g6SlfzPEarcc=;
 b=LY/goSqbHuXyQS6ifysszGD7Gaq2yEQ6OE0FHag41koOEU5u7PYCzVIWizN7jymRqMzx3leKSpmmNgH4qOx0cBAJhjmo4TgHgc88Dq6oiFRzGPPkM0fkugcyyzo4tTj0bZVpQ5B0LHDoqawOJWnFEYdMuIzZxBXnzy9WrFQ+ugEp03m5ob4+9iE3a5gBiT/9Jl8W1LGo/1iwP7FWTW4aMvGT0Nkrx+4fBGiEdsZ0oeiZ8xJUV91rIK9FhoI0efJkyRSnFjDNVFN0InAT4qtg4cyHe8MGfa5gpXjWtxu4LJGCT7jmvdGBW9MpzW+ujFH4+W2VNirw/SGJbYtk7PXmKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeydpEBtLYY7iYyMC2dyGgS1ZgQ/zw9g6SlfzPEarcc=;
 b=wltxjiI0rOMxZ0Np0gVA5EkjsxXsCakpHKHtbb0M8pRxhQLIsSix7OT+9HX4YeeDQSsGPnmyMzvdVN16vTYiI1GvlkqHDTc5DXSVYyCuMo67szzxOgf0uDtYpcaitBhZc6E0tvC7Tx6L/dooe1KDjGp9zDfmGKUVG7HUTH16ePI=
Received: from SJ0PR05CA0181.namprd05.prod.outlook.com (2603:10b6:a03:330::6)
 by SN7PR12MB7451.namprd12.prod.outlook.com (2603:10b6:806:29b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34; Sun, 19 May
 2024 13:07:32 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::da) by SJ0PR05CA0181.outlook.office365.com
 (2603:10b6:a03:330::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.15 via Frontend
 Transport; Sun, 19 May 2024 13:07:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Sun, 19 May 2024 13:07:31 +0000
Received: from SITE-L-T34-2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 19 May
 2024 08:07:30 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <xaver.hugl@gmail.com>,
 <dri-devel@lists.freedesktop.org>, Mario Limonciello <superm1@ubuntu.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 1/2] tests/amdgpu/amd_abm: Make set_abm_level return type int
Date: Sun, 19 May 2024 08:07:16 -0500
Message-ID: <20240519130717.8087-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240519130717.8087-1-mario.limonciello@amd.com>
References: <20240519130717.8087-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|SN7PR12MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: 330046d3-33e7-4451-330b-08dc7804a4d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|36860700004|82310400017|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qldB/Gx1xPjli150XCkpjGiMjfsDBOQ9T5cvY0CpetLGpUsDlRxj021+42eK?=
 =?us-ascii?Q?s8cZPObomonOS09dqHgjDX1spKZYtXmTCLG9ijvFcIh6YY1V0+DpngExd5TL?=
 =?us-ascii?Q?HsUmPx6oVKN8Ul2n7S2XVHCDh3IGryTIK2MursbsyAAAbpaPbpBfDIVY10j+?=
 =?us-ascii?Q?B8AtfCk4uShdu4EfnBReXkpd52SAnDju2+B/0bWNkE5yzogCvSWIw22FW6Zm?=
 =?us-ascii?Q?3p5NpAiHAQbgTHp7GpNI3Ixwol527MDcFThrxftgv9U37lbtq0nAkoHDiUHU?=
 =?us-ascii?Q?kefClbNsBO8gnrgVI9Z4XwB5gAfkNIKZEmsQkVlJ3L8Rx8xtn0krpmqTMlV3?=
 =?us-ascii?Q?pU5CMejeFR5gwpdSeaF4jxa2kFV09SuaoadOhfZpc6+/OD6FhepKeDLwL2jr?=
 =?us-ascii?Q?sHVhSUvHVBNv9ZfThY53KMn/4tu3IvBSNEaRfSBcFCFlwkDAPuJO7sWKZ3Tt?=
 =?us-ascii?Q?6ICuSNguNyzwyP7XPoGOiRrfj37thDVAlCZZq7TDPi+mBU+oebchBHDFzBi1?=
 =?us-ascii?Q?pGxvA51NJaZ+wRVcEvGsA+8EhOCoi51x2OWoaEVvFNTOmVmUdiTtYUVSKuQd?=
 =?us-ascii?Q?LWGTdO3T9Zn58edKFXnOvcnWTs19SIE9JN2V8iyxlA6vSFeuc5dUOssBhUb/?=
 =?us-ascii?Q?wVMZeTCDXf6039l/M5ynF6zaD7aZvbtZQQM0OZlVuceSCwwNTy82g+KTh+jf?=
 =?us-ascii?Q?HQdG5pJeiqK8LwHmi1QicSbsHbbRG2HojqsGpxgxRbHA81ErpV3MU9Q+N/q/?=
 =?us-ascii?Q?U/PqeoWil7FfbjratozVlKZl2izkYaN8BI/R7u65deZBQxxN6pIhyGp4pgLq?=
 =?us-ascii?Q?LZ8lgkjx39nm35+deMZnQajhOwUw75SEeSIEGxjBEPrEoeaEPFTo+IRtXa12?=
 =?us-ascii?Q?MzOcAN4LN9MiUhD5i6bvFqwyKaZCgbLYR46F6D4m/yXur3f7unfGKV79vhV7?=
 =?us-ascii?Q?YeDELEE1bmRjUgcy8MYuLbc3AnvLfocrsPhU9HO714c+zw8k9vREIt/fpWuL?=
 =?us-ascii?Q?yvIy5xRFMOeUxZbr1hrHaPc3imvI/0lfXI+MmYLDKwDKTUryRLQ6QMvKKfI5?=
 =?us-ascii?Q?XlT05CQSKRawHQ9pfM1htTyZiQ6nmAWs2VjhPH5xZHUkLXEv+pceI03XmiC7?=
 =?us-ascii?Q?qFp3rFZuu2jcA78YpqchiPgFA31GeKD9yxI2q++JPq2QOeEQa8eyX97MS6Wy?=
 =?us-ascii?Q?eX3INzVNJMvDgcuWvHgp7Yyy6RS5F4KKdDX8qP5pDknf0e+37mEVBSwOMpLH?=
 =?us-ascii?Q?oDLV0ra8ReN4iUKl2t//uFjDwJW8YelW6B12P5WNuEcg0HXyYOThL+31viWv?=
 =?us-ascii?Q?1dp9mKvVUh3vlKeFkfkxrMx4h/fzOYdUTzGt+QlgEIKmCGGfjxKFhva6BpHg?=
 =?us-ascii?Q?69gdURCp6nVF7RAbRpsMd3F47l/B?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(82310400017)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2024 13:07:31.9024 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 330046d3-33e7-4451-330b-08dc7804a4d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7451
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

From: Mario Limonciello <superm1@ubuntu.com>

In order to bubble of cases of expeted errors on set_abm_level()
change the return type to int.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 tests/amdgpu/amd_abm.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 2882c2c18..f74c3012c 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -104,10 +104,11 @@ static int backlight_write_brightness(int value)
 	return 0;
 }
 
-static void set_abm_level(data_t *data, igt_output_t *output, int level)
+static int set_abm_level(data_t *data, igt_output_t *output, int level)
 {
 	char buf[PATH_MAX];
 	int fd;
+	int ret;
 
 	igt_assert(snprintf(buf, PATH_MAX, PANEL_POWER_SAVINGS_PATH,
 			    output->name) < PATH_MAX);
@@ -116,8 +117,12 @@ static void set_abm_level(data_t *data, igt_output_t *output, int level)
 
 	igt_assert(fd != -1);
 
-	igt_assert_eq(snprintf(buf, sizeof(buf), "%d", level),
-		      write(fd, buf, 1));
+	snprintf(buf, sizeof(buf), "%d", level);
+	ret = write(fd, buf, 1);
+	if (ret < 0) {
+		close(fd);
+		return ret;
+	}
 
 	igt_assert_eq(close(fd), 0);
 
@@ -129,6 +134,7 @@ static void set_abm_level(data_t *data, igt_output_t *output, int level)
 			 DRM_MODE_DPMS_OFF);
 	kmstest_set_connector_dpms(data->drm_fd, output->config.connector,
 			 DRM_MODE_DPMS_ON);
+	return 0;
 }
 
 static int backlight_read_max_brightness(int *result)
@@ -192,7 +198,8 @@ static void backlight_dpms_cycle(data_t *data)
 		ret = backlight_read_max_brightness(&max_brightness);
 		igt_assert_eq(ret, 0);
 
-		set_abm_level(data, output, 0);
+		ret = set_abm_level(data, output, 0);
+		igt_assert_eq(ret, 0);
 		backlight_write_brightness(max_brightness / 2);
 		usleep(100000);
 		pwm_1 = read_target_backlight_pwm(data->drm_fd, output->name);
@@ -223,7 +230,8 @@ static void backlight_monotonic_basic(data_t *data)
 
 		brightness_step = max_brightness / 10;
 
-		set_abm_level(data, output, 0);
+		ret = set_abm_level(data, output, 0);
+		igt_assert_eq(ret, 0);
 		backlight_write_brightness(max_brightness);
 		usleep(100000);
 		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
@@ -257,7 +265,8 @@ static void backlight_monotonic_abm(data_t *data)
 
 		brightness_step = max_brightness / 10;
 		for (i = 1; i < 5; i++) {
-			set_abm_level(data, output, 0);
+			ret = set_abm_level(data, output, 0);
+			igt_assert_eq(ret, 0);
 			backlight_write_brightness(max_brightness);
 			usleep(100000);
 			prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
@@ -289,14 +298,16 @@ static void abm_enabled(data_t *data)
 		ret = backlight_read_max_brightness(&max_brightness);
 		igt_assert_eq(ret, 0);
 
-		set_abm_level(data, output, 0);
+		ret = set_abm_level(data, output, 0);
+		igt_assert_eq(ret, 0);
 		backlight_write_brightness(max_brightness);
 		usleep(100000);
 		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
 		pwm_without_abm = prev_pwm;
 
 		for (i = 1; i < 5; i++) {
-			set_abm_level(data, output, i);
+			ret = set_abm_level(data, output, i);
+			igt_assert_eq(ret, 0);
 			usleep(100000);
 			pwm = read_target_backlight_pwm(data->drm_fd, output->name);
 			igt_assert(pwm <= prev_pwm);
@@ -323,7 +334,8 @@ static void abm_gradual(data_t *data)
 
 		igt_assert_eq(ret, 0);
 
-		set_abm_level(data, output, 0);
+		ret = set_abm_level(data, output, 0);
+		igt_assert_eq(ret, 0);
 		backlight_write_brightness(max_brightness);
 
 		sleep(convergence_delay);
@@ -331,7 +343,8 @@ static void abm_gradual(data_t *data)
 		curr = read_current_backlight_pwm(data->drm_fd, output->name);
 
 		igt_assert_eq(prev_pwm, curr);
-		set_abm_level(data, output, 4);
+		ret = set_abm_level(data, output, 4);
+		igt_assert_eq(ret, 0);
 		for (i = 0; i < 10; i++) {
 			usleep(100000);
 			pwm = read_current_backlight_pwm(data->drm_fd, output->name);
-- 
2.45.0

