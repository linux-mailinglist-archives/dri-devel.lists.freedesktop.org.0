Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 486C08CC8CC
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 00:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C684810EE35;
	Wed, 22 May 2024 22:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sLR3+Sag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A4510EC59;
 Wed, 22 May 2024 22:09:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlJhrnNimYux+bxnKSauylwxYksTjPsG2RMTACLEJ6blWFE10B06ScljB99qIMKCIUWu4du7SsBdkKMijKNHma9fFnn4vSItgeNR2Wug9e/usNbOvSoOAkAbT5kQop3x+qGQrPIWb+BvI/iFpUK5w7E8fUKz3iOe0fsysYFSYeqUN22ILfOYPNJx51ePXpOuTDpvF7dsNNPXNxH2+W2vd2tUpiSWa+3R5jCGtzkAcDybvwC9TYXJXJ4Zjo1Si+Nf4x9uDnkxidsZGFjFG/8L+4VL+PthARbBLkzm3a+lqIYAWmH1qVbC29hXVe3HikUo905fM3tNFnG2BdP7sRsk2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjHZankrXsOb4Mrmxh40iDmZf7PJnyV2Xlb3To3csDU=;
 b=VCapy8+/CurtQwh0V5TW4o0xcss+gKxpMyfA4R6LhfRe/UytuXJ5WC1quCqjIYHotM/ogLbPQWwN4mf6hOGY72mATjp3cDUdFS0KBQzxIJUVaYQwKlN67SaTIPuhGLB0hhiRuljpLb3cRnD2dC2Fm5eoj/jI4FkwhkZ8ca7MGNgFpf+2eMOBsU046+hsTKx+w44wmBsLSUWVpKeNxephtPLhAbq/7xsvtT/BSmNtsy6uznEQ53hGUtJUkB9r708uFDdKnrRsJFQ0eh2zFzrmqKWGzlKQRzeONj9KVGEljxR68WzmDpzHKIW+W1ILXd5jAjHfYX+G6rbqzcfKUT/WBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjHZankrXsOb4Mrmxh40iDmZf7PJnyV2Xlb3To3csDU=;
 b=sLR3+SagKcPsYiRwJlsYWmey9LBRQjGbmmOtcPl5puxQte6LGexOE0RShbR6gZWNnOL4GPxkRbCkbGwPOpaCH+6uigXbwZClCsNuo9dFXpGbfJ52fiu1JZQwv9Uvhywh49Tq3vU7ZXjky+dBgOHsGHt4r6thAVEWZ/REksiKgVI=
Received: from LV3P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::19)
 by CH2PR12MB4054.namprd12.prod.outlook.com (2603:10b6:610:a6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 22:09:15 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:408:234:cafe::59) by LV3P220CA0018.outlook.office365.com
 (2603:10b6:408:234::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20 via Frontend
 Transport; Wed, 22 May 2024 22:09:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 22:09:12 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 17:09:08 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
CC: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, <dri-devel@lists.freedesktop.org>, Leo Li
 <sunpeng.li@amd.com>, Sean Paul <seanpaul@google.com>, Mario Limonciello
 <superm1@ubuntu.com>, Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v2 2/4] tests/amdgpu/amd_abm: Make set_abm_level return type
 int
Date: Wed, 22 May 2024 17:08:47 -0500
Message-ID: <20240522220849.33343-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522220849.33343-1-mario.limonciello@amd.com>
References: <20240522220849.33343-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|CH2PR12MB4054:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f0913a1-b2bb-4aba-0d22-08dc7aabcfc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|36860700004|376005|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pq217k0yRhT/3pEjwQGYX68BnC7BhnfNmkIfEvYhxpYW6cY64jptzYWNu0KC?=
 =?us-ascii?Q?tJp0K2TKk6rb/XW1ev+BuZD9qNeeGU1B3iKFsD3RpNk+waYdiFieVWFVd8IW?=
 =?us-ascii?Q?+krBCE0uqSz6/9QVIa1XCrVhU5CLqCFPp+cOZ2rJ6pcwbz0yvOCssgGkrbOG?=
 =?us-ascii?Q?odRCSPL+bLSUVDMoy2g/WfT1f/76VwfBo9Z5hBaeIRgCXb0neiCJTYklIX12?=
 =?us-ascii?Q?opnCdp0xFNkQIeUnEA3NqS6Z3lcg6e5EA6ueQ15GcA2yoRtcL90NfxCZccYB?=
 =?us-ascii?Q?v4IBkttvO1JxcinTvwLFhaVbGEV4DSPwuXXnWDoeTKQJP/LWuumeeNwivMbu?=
 =?us-ascii?Q?GiFJrRYwVVEhELHixa7PeUN05uU7YDAIRUjL781B//XBgfN1WFbsYJe3//lQ?=
 =?us-ascii?Q?dDaVY6jNUmR3j0u04ioZBnx2quNVVxWXnecgmR0/pDJ2q37eIPEcJBkekHRY?=
 =?us-ascii?Q?jOvJ54VYsOYrI+aU9OvTIKJXxbYPyJScKCdcwFhaFIl85GfGjk/9CxmYHEtn?=
 =?us-ascii?Q?B/JG7JlZKCCRYU+jNd2Y95E3pbKpquA/lcIGEjFyBcc80oVTda0j5xwzhH33?=
 =?us-ascii?Q?saLnHCObyPNmC74OGmAqzNNSAY0dFnHhl4h7bsFP2A4yXURbcuRMAkRH+n07?=
 =?us-ascii?Q?k9bP2YpSCVvEg3baoEXw0jQUEnoqCaSqGgBHEnUM5APayxX7cGQsapY/8tsC?=
 =?us-ascii?Q?D+6paVCo74njTdMDbFxkIx8XbsHqnDvg4d8Kf+6G9+3rHH6Bjz2CY64YPeHT?=
 =?us-ascii?Q?HX1qy83pezp3LQO3bmijhys3QK4toFtRljxUiy27F1AfEVGdUxnqrt4ekX+l?=
 =?us-ascii?Q?N/Qijw1HS53ixEk6U29cuaE03ejZ7tZngScAxFOWlw0RikuAa/+3/3nVxw0e?=
 =?us-ascii?Q?3EKYFnruSrx93vc6JHctdvnGHzQDcGv3s9BgdGFgbmNUmEUsAAgj+xTlzwFr?=
 =?us-ascii?Q?jDMijT7hgQaVdO2rkz2ERj4TsTumunzHmEGJTKuWD4pVeubsMInB0JbAK+rY?=
 =?us-ascii?Q?EEVEfont2W3X+Wqoncfy+Ik7GIPieKVN3tjN/+4o92g0obHPZ6y26w/TmXYe?=
 =?us-ascii?Q?WbOJFhpR6yWTbNI/Ws5OLURpBSMfv2k13PV5kNsahj4SYK6LoWAfA/foN8U7?=
 =?us-ascii?Q?lHu91kz8Ldp2Ea0GgMv7BwxAeyO0lD+i8gjjI2B1YBQYtWryOKeN9ud014An?=
 =?us-ascii?Q?QPtKwWEv2TKL//6iNMlgNnmzOQ3T7BDQcLDdiUWGjPsTVQSOvgy43RC1KGJb?=
 =?us-ascii?Q?9LQ8v+P7Hih52ivnOpF9BOwDKYG3RjWl3jBrpEUJtNq9EQRv58MEL3JMfXVC?=
 =?us-ascii?Q?xsC2RtyZv2XmWM661O3niZD8TnLD/PY+C5QcOblGb7qbZqGsDtTC8+yIGzGG?=
 =?us-ascii?Q?csb9TP7mTBuez+Jw6BDpMY41cDgm?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(376005)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 22:09:12.2987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0913a1-b2bb-4aba-0d22-08dc7aabcfc1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4054
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
2.43.0

