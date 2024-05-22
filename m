Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 537DD8CC8CA
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 00:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7AE10EB5D;
	Wed, 22 May 2024 22:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QcDaentZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F92D10EA7B;
 Wed, 22 May 2024 22:09:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYQOxdwcnMgyUhIegsViKAbtBH7GMw1/LIyt9U1R8RW6c91UwTOrA+mVQ5WbsxU3ovXnHc1sZkhIZctov/jvUbXo0ubgxF13acA1Ov5IfevNgSHGXEULuu/qKpilROPEwnAFbPr21vNMGAxrzj/1p4hXuz1Fg/+aG1H8Vfs9upokuNvG7yNKtqRx2PJZzxUOH910pfg1W2JjfisHgDZbfhs3l+9R0h7YUj1k5pmpoSiXlotsaKGmIGjoZ3JOadogsP+PoPT9tkEu8H9ySbMn/Ajxgr0C42xbZVrISqDZbzwI8akdDGpozCAdF8i2W9svytMeYM9/A/pSHUUQGy9aeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUuSy/hoy4tefE6/pkxEjstrWQoxdahMQjnaMyc12G0=;
 b=L6JQyyx/seP5FXMxpeqducNrFsaP3hi5d6yfyFmxz2ZO2ApeBkEyZPtF2w20gV3nktxXsR0x3x1aLtoPsgHLXqHDXAskkIZ1QKF0Q5bX7jZcGWkThgviHbLj75YMMff9v9kU+PkRstic+20yzL/O/l9+FTNYeNW1jl1FYwSQu700FBv6SZiPB6GsieP7wXLwqebIJhX+1Nw9c7EHuN8Lg8D9Mxbjf4Pao4Ig3hIMXOOwsgcGPavR8Cmryhah1TWot4/kI7+vm7IVFe4QQy0e7yn1dL15PY28/Pt8BXBKbmofrZPlSDW+2vcpT5OcT9jJRww1g+Lfsrxb2Z54oWhxBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUuSy/hoy4tefE6/pkxEjstrWQoxdahMQjnaMyc12G0=;
 b=QcDaentZS1vnGY2jEDEpNn6yqju9NNxDHTLyQEIKMydbXZjwmBg+6uIFaeQZTPcGgWj6zTix3JTzlyp7velGGr3V2KzNQWCijE/nkIe7IUJgzEnmlvyjEhqTsMx+oCvAuZo3C5mOYfcNLFmFSGqwCiN0uYlCjSUXnmub2myXTwo=
Received: from LV3P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::25)
 by BL1PR12MB5851.namprd12.prod.outlook.com (2603:10b6:208:396::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 22:09:15 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:408:234:cafe::b2) by LV3P220CA0015.outlook.office365.com
 (2603:10b6:408:234::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.21 via Frontend
 Transport; Wed, 22 May 2024 22:09:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 22:09:15 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 17:09:09 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
CC: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, <dri-devel@lists.freedesktop.org>, Leo Li
 <sunpeng.li@amd.com>, Sean Paul <seanpaul@google.com>, Mario Limonciello
 <superm1@ubuntu.com>, Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v2 3/4] tests/amdgpu/amd_abm: Add support for
 panel_power_saving property
Date: Wed, 22 May 2024 17:08:48 -0500
Message-ID: <20240522220849.33343-4-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|BL1PR12MB5851:EE_
X-MS-Office365-Filtering-Correlation-Id: b98949c6-37e0-4190-7f93-08dc7aabd1ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|1800799015|82310400017|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uBZkdq0BFHzFmM/5EeBY+kkfCEnRH6XKEa8E+hTWbBAg1JEliPqSz6GcTlhw?=
 =?us-ascii?Q?8/UD/kMbd1WjsE9/enGSX7RTslzC+y2UoJltHHB3X2wkHN2nPjTrn8oIGvYu?=
 =?us-ascii?Q?1LJtdPJ9E3g2xXv5CuzctMDSIpKSDTWMiWj4rlQl7irKIEBK3T/bTEi6prjJ?=
 =?us-ascii?Q?6MaL+5dsfEcn0NqGkHGNOBaEh+my/ehFgSjl1kYuYu5OQhZX/9ct9apH4HqS?=
 =?us-ascii?Q?Tnzdvi/U/WIFwN0hwqT3YRCxOkBDcjzfBGHPhFh6lU4KEN5jkaQ3tDNF1Tw4?=
 =?us-ascii?Q?h/y0VVIr3TK4qki4UP8af+hbJDb9HOLQ1P3VqphnrfW5nDmrZ6vcvLhas70L?=
 =?us-ascii?Q?uUxXaDt7kuxdmYEUZq+wRBK14Yyi7TPMfWXXzSGEloHKi/dd5LpUiidJmYQh?=
 =?us-ascii?Q?FwiKcKILw74rwEKDpWo/W8fFrdoY98GWcevhsc7cRY6BQ2NcQyHTqs82QLQT?=
 =?us-ascii?Q?uGOT/0GvV9WvE7K+xdQs7QlGlQB7pAmSwADCKXbVqAQoLzPBwKs2EhsvmMaH?=
 =?us-ascii?Q?0VZXIh9Mp7Aa6em2e8O9ywFgGipqqDQWXm6zkZCn11OOHm2YWflazTUXKQwC?=
 =?us-ascii?Q?CHR+D6RnUfKuD65yFlOX2dQ/76G0xBrzYA4P1hrZIXzuvL/l0BwFLm0CphEV?=
 =?us-ascii?Q?/MghS6R2gatrandUOgM24C2mJcfK4Ym2krxspNl19V3/OxoMInSCr+rrozvW?=
 =?us-ascii?Q?ADnLhNmeMlLV5Mgj8nqDJILHQIrXPJ/2NnCxWi943oFTAzXJhoXIzHl9/MXt?=
 =?us-ascii?Q?5Zt6TS9+GZdnpebJX087ahW+txH8CHZQxXdarrGDTg/E+QOMnFq91QN7CiGE?=
 =?us-ascii?Q?P+u+7miKbkeSFjnBkGEpGzrczm6lxmgvqxrSm1ScvT+huLc78YcRWSKfY8Qt?=
 =?us-ascii?Q?zZdd+wTeO3+Z1WTRQ5l06TZUp8HJhwlqvcdy2eXjn2Tu8oXxWJqV4VuYn5VV?=
 =?us-ascii?Q?Jvzym2tEG0D5QlTym4ieA6hBFiuqNILIlkKbcRPnGuQ+rLmKiSuSQVppAOL7?=
 =?us-ascii?Q?1MSNrPr2Vn6RE6MMomTLD9NL2LU7l6O6s7FW4KTSIFNVx8NujcCLJBJhnPvs?=
 =?us-ascii?Q?iFxDAmJpnhDRUpFfwYMFQSkb9iUP0OiD5Mimiv3IPKj7JBRN1DTV7tdGdwNx?=
 =?us-ascii?Q?w5qMNzs7lh46OsEehFo6swQ0t9Y2etzaMSCp4KW9waufsCGjnnlpkSc2QuBI?=
 =?us-ascii?Q?LKDu3E85RtzYpjKUUeuN88GN5z9KkF9dUgpMsed7Is+GjT83Ueoo4X5zBceB?=
 =?us-ascii?Q?efaVLQSr8QbRGSE9jPXl5VqenU14eAae5A/2nB85Wqh0okiZ/4OAM3idhCnR?=
 =?us-ascii?Q?lBgaosBHrxBGA8z9flaVbBK4L2uvPtZxHR//Qxqjp4j4Md4hYh5YiyeWyF6F?=
 =?us-ascii?Q?0jRdkKs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(82310400017)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 22:09:15.6112 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b98949c6-37e0-4190-7f93-08dc7aabd1ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5851
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

When the "panel power saving" property is set to forbidden the
compositor has indicated that userspace prefers to have color
accuracy and fidelity instead of power saving.

Verify that the sysfs file behaves as expected in this situation.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 tests/amdgpu/amd_abm.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index f74c3012c..3fa1366fa 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -365,6 +365,43 @@ static void abm_gradual(data_t *data)
 	}
 }
 
+
+static void abm_forbidden(data_t *data)
+{
+	igt_output_t *output;
+	enum pipe pipe;
+	int target, r;
+
+	for_each_pipe_with_valid_output(&data->display, pipe, output) {
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			continue;
+
+		r = clear_power_saving_policy(data->drm_fd, output);
+		if (r == -ENODEV) {
+			igt_skip("No power saving policy prop\n");
+			return;
+		}
+		igt_assert_eq(r, 0);
+
+		target = 3;
+		r = set_abm_level(data, output, target);
+		igt_assert_eq(r, 0);
+
+		r = set_panel_power_saving_policy(data->drm_fd, output, DRM_MODE_REQUIRE_COLOR_ACCURACY);
+		igt_assert_eq(r, 0);
+
+		target = 0;
+		r = set_abm_level(data, output, target);
+		igt_assert_eq(r, -1);
+
+		r = clear_power_saving_policy(data->drm_fd, output);
+		igt_assert_eq(r, 0);
+
+		r = set_abm_level(data, output, target);
+		igt_assert_eq(r, 0);
+	}
+}
+
 igt_main
 {
 	data_t data = {};
@@ -393,6 +430,8 @@ igt_main
 		abm_enabled(&data);
 	igt_subtest("abm_gradual")
 		abm_gradual(&data);
+	igt_subtest("abm_forbidden")
+		abm_forbidden(&data);
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-- 
2.43.0

