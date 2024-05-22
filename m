Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259E38CC8CE
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 00:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DA510EF0D;
	Wed, 22 May 2024 22:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xJuArExu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEAB10EB5D;
 Wed, 22 May 2024 22:09:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CctIkchQS0zOt/+RMGDjTVtab5MtABwH+ZkXiPe8qwfm0zyE7bKZap2wTSmLnYkZGGLUIobxK5O/9BCyPV2Gh0O203WWW220fPDNp2cNhEOTD0kSbuVzGAwjQpXQx3HBh8fNo0H0CbGS3JJHvw+ldIMu2HYR6VQ+pGLrR66/GN44bv6xM8UWUC6PjLDzh2gCEUOEi8vZIarh42pR9FVWGLkaxdJ104L8syLmyuZfINHfR2HfgdJeeqgnEc4WkYvhAndqFbUB9duBnvrUo0ATzuVFOyJoWEjDtlxfPsZ+cBV2HT7XogPFDq2xrybMN3WNNlwAvDHE1JUPfD/PmO0DFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5t5nnJXOIJS97m8Vz+8mkhhPiUJyV4OYIgNCKCDOlI=;
 b=FhUrUquz2BfMhLL8JDSzy5FolHYdR9fw6jrOYtJNztrKGuk4GIZJdRsvYoIE6Q6e7t44eCABzgvm2oWc4o5+2/hrybbhKsPnpOmHiV90Nf2iGr4LhgRpbkcrmMfRpwzWW7Z4ZmI9awxRLFAmi5mDdw3CrGDhc/qZ8CrcEwMGBmMlLdoSEIafsRYKVgGnT5SChoZmYlgcPoTRLw0NAyAj1Ip0brDWQBJj6ccKo0kSp4Z5h08tENpVCwS6pqIfaFgxUPrZnO+BIf5LkdgITN07EZUpynITkKqaiiWGtN1HFxeISCKLM/YAkjqUguZRwZrPmq9KBJucg9Eda6p09qAPsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5t5nnJXOIJS97m8Vz+8mkhhPiUJyV4OYIgNCKCDOlI=;
 b=xJuArExuK9pV7HZ943qYwxc7Ma1uOkzEWKti4gpRdyLevEFzvvWl4ZTu56SEPVZYwP2TL7JTz6m7PZ7cBpLDslm58EtVkTRySlbbLaOKhzBmBQBxwU/gJxb48q1Bq0O4KsG/JhSNbjIeuQOhgbNRgelGDGqHNDNuMzD6c7JPJDg=
Received: from LV3P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::14)
 by SN7PR12MB8818.namprd12.prod.outlook.com (2603:10b6:806:34b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 22:09:16 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:408:234:cafe::e) by LV3P220CA0014.outlook.office365.com
 (2603:10b6:408:234::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20 via Frontend
 Transport; Wed, 22 May 2024 22:09:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 22:09:16 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 17:09:10 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
CC: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, <dri-devel@lists.freedesktop.org>, Leo Li
 <sunpeng.li@amd.com>, Sean Paul <seanpaul@google.com>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH v2 4/4] tests/amdgpu/amd_psr: Add support for `power saving
 policy` property
Date: Wed, 22 May 2024 17:08:49 -0500
Message-ID: <20240522220849.33343-5-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|SN7PR12MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: 57c53f9b-5b5e-4a8a-df32-08dc7aabd1fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|36860700004|376005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HVDdK0XTbiEdqPpZgJJIfg+26eB7S7phxK6iITE6flu/Bx1T4hsGIcoXh78f?=
 =?us-ascii?Q?rWrnLqqCZP2KktiHMiZYjowpGtpXhdtNA2E5k7A8XVy5qfEzc/AJFSOLWAby?=
 =?us-ascii?Q?50pdxxIZaakorJoiOsBKnUvOSy5Yaynv5pPz5atd+MuofmGo+3ert9g+C+pV?=
 =?us-ascii?Q?73vZbI+k1KA//f9gO+wQuHM53smQiBF8kAql1QuZY0rsB4S5NBhKEivqc+gK?=
 =?us-ascii?Q?uGll7ywG8c4qwtPR3BCsPUcpejF1h3M3P6bwT5NgJbeEHLnwKLLfEWzEl8Rw?=
 =?us-ascii?Q?3u569mnDa7S1jFzywKAnByORKztfpsotHqUiWHW5d3QVn3c6Qdufq3WB+Qb2?=
 =?us-ascii?Q?MW7smq6TzcNghGCHciH87Iqv+dOqJQwr6YC2bX77oSAQTsgWI2lldXJvOcJ2?=
 =?us-ascii?Q?dlvcDF0T3dz43pHqAcMeWAIcbuRD4J0sN9Ap9n6CV4Ib3lZn9IJRSfOge5QO?=
 =?us-ascii?Q?CydvRjL1Po/CFm8OXwKOsmdPTeTbJaYXhteuDXln2Ja3Wl0L61NO7p/z47LK?=
 =?us-ascii?Q?YYiVPnIr/IFwoNiR+tRetwKMXFADvyRby0YVSD6qMVIhvrv8/4RgdlRGCciR?=
 =?us-ascii?Q?pL+YNgqARYoLz8EjtkPCLqL34SZNe1GWNY/zjWz7cw4xtrVU01+XRRZ3/CFj?=
 =?us-ascii?Q?cC+N9jo8PI2WA1n6Dey9Cn2PRvmB4l1l0T/XtLEgHxHZQfadAMShuWENTL+8?=
 =?us-ascii?Q?tPcFpql9SDO0LUcKcAEvsYEZgs1sFWSoIkst7wi+LeXVz1SJQHCLVJL4Nme0?=
 =?us-ascii?Q?/98Uk8k97b9M3VvO79XElc5fZM6400MH0rr2sQpXgbyuBiuNho6WVastEMm8?=
 =?us-ascii?Q?M2zP4+hH1C9l4MYfedq11Tu6c+WBrywuELig7ciU384Qi2DLn5tbh64lB4IM?=
 =?us-ascii?Q?OYRJd6yegvcs6geRPOFGOEAAP1GC8Wjf/KIzqM4h6blyFykdFYSoWBry4xbr?=
 =?us-ascii?Q?q9M+h5L9o/O5BkFw9N1L8FF/9WyDdlAfhU+eOD8dfNeo4h/FbjKmrOH7rbrz?=
 =?us-ascii?Q?2kg0NyYops3p5UT6PZepkMNjfe18exzaFj1LuHsF6wpofNBkgShh5q17NUF7?=
 =?us-ascii?Q?I80RpH5VJOYyrIzbsHdNK+Dk2odfmSjMBmcdRXFunO9n0BIn5kSXMgfcYjxG?=
 =?us-ascii?Q?v+vjGtK8ajXe4sVKW7wUvIE3Mx+Us4iKYGtqudDNZh8hvJhY7lmjCHYTAH2Q?=
 =?us-ascii?Q?ZDO2OI3GlD4XZSITB00doh7b4wzAnL0/u6jfrV6i+PbvjUoVPAB0WcaQd3uV?=
 =?us-ascii?Q?clUHEeaJvzfRFAoN+eoECgirqOWxN3PtPOB4l8hvPI9Wz0aoptgQXsf1/XHi?=
 =?us-ascii?Q?qONEsfnDe2OtYU+GngItHRuVi6zZVvU92ZaWPeJv2I0I2uJZN6Uo4twxP3yc?=
 =?us-ascii?Q?brEdPs1HrHfOQ8OtSjKK0vh7AfZU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 22:09:16.0330 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c53f9b-5b5e-4a8a-df32-08dc7aabd1fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8818
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

Verify that the property has disabled PSR
---
 tests/amdgpu/amd_psr.c | 74 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 9da161a09..a9f4a6aa5 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -338,6 +338,78 @@ static void run_check_psr(data_t *data, bool test_null_crtc) {
 	test_fini(data);
 }
 
+static void psr_forbidden(data_t *data)
+{
+	int edp_idx, ret, i, psr_state;
+	igt_fb_t ref_fb, ref_fb2;
+	igt_fb_t *flip_fb;
+	igt_output_t *output;
+
+	test_init(data);
+
+	edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
+	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
+
+	/* check if eDP support PSR1, PSR-SU.
+	 */
+	igt_skip_on(!psr_mode_supported(data, PSR_MODE_1) && !psr_mode_supported(data, PSR_MODE_2));
+	for_each_connected_output(&data->display, output) {
+
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			continue;
+		ret = clear_power_saving_policy(data->fd, output);
+		if (ret == -ENODEV) {
+			igt_skip("No power saving policy prop\n");
+			return;
+		}
+		igt_require(ret == 0);
+
+		/* try to engage PSR */
+		ret = set_panel_power_saving_policy(data->fd, output, DRM_MODE_REQUIRE_LOW_LATENCY);
+		igt_assert_eq(ret, 0);
+
+		igt_create_color_fb(data->fd, data->mode->hdisplay,
+				    data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 1.0,
+				    0.0, 0.0, &ref_fb);
+		igt_create_color_fb(data->fd, data->mode->hdisplay,
+				    data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0,
+				    1.0, 0.0, &ref_fb2);
+
+		igt_plane_set_fb(data->primary, &ref_fb);
+
+		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
+
+		for (i = 0; i < N_FLIPS; i++) {
+			if (i % 2 == 0)
+				flip_fb = &ref_fb2;
+			else
+				flip_fb = &ref_fb;
+
+			ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
+					      flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+			igt_require(ret == 0);
+			kmstest_wait_for_pageflip(data->fd);
+		}
+
+		/* PSR state takes some time to settle its value on static screen */
+		sleep(PSR_SETTLE_DELAY);
+
+		psr_state =  igt_amd_read_psr_state(data->fd, output->name);
+		igt_require(psr_state == PSR_STATE3);
+
+		igt_remove_fb(data->fd, &ref_fb);
+		igt_remove_fb(data->fd, &ref_fb2);
+
+		ret = clear_power_saving_policy(data->fd, output);
+		if (ret == -ENODEV) {
+			igt_skip("No power saving policy prop\n");
+			return;
+		}
+		igt_require(ret == 0);
+
+	}
+}
+
 static void run_check_psr_su_mpo(data_t *data, bool scaling, float scaling_ratio)
 {
 	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
@@ -756,6 +828,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_describe("Test to validate PSR SU enablement with Visual Confirm "
 		     "and to validate PSR SU disable/re-enable w/ primary scaling ratio 0.75");
 	igt_subtest("psr_su_mpo_scaling_0_75") run_check_psr_su_mpo(&data, true, .75);
+	igt_describe("Test whether PSR can be forbidden");
+	igt_subtest("psr_forbidden") psr_forbidden(&data);
 
 	igt_fixture
 	{
-- 
2.43.0

