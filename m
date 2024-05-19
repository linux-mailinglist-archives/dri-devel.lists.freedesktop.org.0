Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF998C94BF
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 15:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D635F10E25A;
	Sun, 19 May 2024 13:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4wFsZREC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECBD10E248;
 Sun, 19 May 2024 13:07:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZkqcWQ0D7nQ6Pxo4kbAde+IP14CvEvtJzWGeFuuDBWdJNjuxxxLszrIC9Bfnf1IB0iYTK9p/D/aC9jzzPUok6MLS7wo4KneRIF51/OWJA7dHlT9Jy9RnLfuTaH0dWChiEF/lvDMDlaPNojPiFnOpbdWkvi+rhZZDUees0xV5SFbC7wTtbTlUoFmwz/jOVKXVOSdE6yYwJuUG2W4N6biJbiUgTx+LHwRIhQjf7QcOzF8saNwQvVZ32i9mA4qzjQ3irW3ICkUy23S+W6J4tEccVzSIfHcbASgQ+V37PhPdpFZ7OV/Rv+yiavANI5Y6BuvwNmesToQUWYyPzAv23O2/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyC1wgfOhY6qig9W4AN7VfTwTvfaabGzMTMgpAxcRbk=;
 b=A7BAfq4Ac3DiXZxsIaywrUDQNXZnSnZUG3h3IZNCV8Ep5/WddksSmqA+o9SPujYxlLQ2DJ8NVd3Q2YoRruryXOb21z+C+9BV4GywLDFiIOIxKNU8yXbDy9tHPe/nydi778La8JYFabV7+sBbyQleacIkEq+qOKfOzT5G73oX/4hODNFd61nve8d3A+QqoBzWb8LDAIzpeGkudMB6u7nzf43PHDEqxlm8vGMGfOZk/Y+gBZ514GU6u5Qst5UR9Q3YZ7ySZ+B3V8nDC/ECo9Q61cdk6PIw7oiXo33+N2d8Fr/6OgpL22XYkf+9REfc+2mNGx7dnC6WwALW7imvFnz/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zyC1wgfOhY6qig9W4AN7VfTwTvfaabGzMTMgpAxcRbk=;
 b=4wFsZRECjxrKw4oZYwgnf3iaLL9/DDi/66ZdyiYocGS2au2mSCwjjC8XfJl+qESsztJffyrUtOcpkjY4ibJLTe2CB0huyCxCd1sRrb7cSLHgCpBlKLVsSBqacDvzktJqDg0TjNgewjhAzpDBKmuPozsuYknqbyI81qx7iIlmxZQ=
Received: from SJ0PR05CA0181.namprd05.prod.outlook.com (2603:10b6:a03:330::6)
 by DM4PR12MB7744.namprd12.prod.outlook.com (2603:10b6:8:100::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Sun, 19 May
 2024 13:07:32 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::ef) by SJ0PR05CA0181.outlook.office365.com
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
 15.20.7611.14 via Frontend Transport; Sun, 19 May 2024 13:07:32 +0000
Received: from SITE-L-T34-2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 19 May
 2024 08:07:31 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <xaver.hugl@gmail.com>,
 <dri-devel@lists.freedesktop.org>, Mario Limonciello <superm1@ubuntu.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 2/2] tests/amdgpu/amd_abm: Add support for panel_power_saving
 property
Date: Sun, 19 May 2024 08:07:17 -0500
Message-ID: <20240519130717.8087-3-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|DM4PR12MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 780ec1bb-7d65-479f-b7eb-08dc7804a539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|376005|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lS4ckQJ9ldzVVrURLemB9OETj+XqSIk6ODEdH3YKSxkjtjKlRE6NNtOIPehN?=
 =?us-ascii?Q?VslM9orW5VKKyf/wd8EF1FZehr/28jzr0zhwACRt9V0tZWlCLhlL1x+gI6YB?=
 =?us-ascii?Q?pkU8K1fSPibwjXeBaRj4+tBNsg7LNdpYXJjkXBp9M2wdaUiUs7pnSsEBp0XV?=
 =?us-ascii?Q?AyS13VWA4Q1bCL2vdJzsWLL4IDP1/yzZstcbefgdcYSQxi/lcIbEtxz6zQZl?=
 =?us-ascii?Q?Qzedx47fgGJRd1Kb5KE4H1uUMC4CXTMSMs1e1ndHtX1ate51wSrloEpOuRK4?=
 =?us-ascii?Q?zs2pZ3yqBI5GgWLpYpWJFocb9uM1i4DpLmLItN09LGOQnn4aeZW2CduN1H6p?=
 =?us-ascii?Q?oayQoqA2jsJrlhGUVG6GSYJrt3aaL/mwZzvnR4lgdESaWhQ8vlTc11fKoZTB?=
 =?us-ascii?Q?x298CV2+NSlyXGIGgSZHJxc3LxwS165Du0c89RViopWfeohGbD2cRrD8Vdmz?=
 =?us-ascii?Q?g/r3nbti5OrDoRaQI+IlWpgEseY11QkqquCiNWKB4DMEGOcyzicDWTadlcH2?=
 =?us-ascii?Q?McMHMfvfz0jyeqpXFLJRB+Oqm5RAG2H8qz2YoXz9R/t5XFrZXqlFl4flByXN?=
 =?us-ascii?Q?6FuMQbMpo/QSl1byxrAO/1NznXmKPT8b5StVxPGar8+9M0wD1kQ+p3/4rrXV?=
 =?us-ascii?Q?i6x/eBM/lhrB0aBYM3ga1VZx95IdtSI/pPI4JBvBU4wTopBhfgi5BzYsBdlU?=
 =?us-ascii?Q?Esu7+yGWB4bse9Xl+mkdCr9gSysZV/Rm3t56wBeaK5vokYY9d3CKDDqjDFFx?=
 =?us-ascii?Q?xKCqu8t3bXhGBEND3vkszQ+BaAWBmJdbqo64yedYuzxBn8YZeeoiXkD3iCDn?=
 =?us-ascii?Q?RaiqWssddw0yVetGuDemsFYTUJumacnFtQa8w09C5wCkjN4djVPILMMt5R6b?=
 =?us-ascii?Q?Mcfa3XyN5gNuMJd5O1SyJSAKgVlBsmIsx7SjjH0f1WwrOfl22RxOsTwfp2VD?=
 =?us-ascii?Q?4icL8lIOf+t2xTToiZg0L1+cYOL7t0a0wp9mzhwq2OYPfCe1g6sWftGT9Wfc?=
 =?us-ascii?Q?d1PNXyewjYFQWiOwko8mvdKIlZvbV7ahqOfQ78GCoCU44zmb9fXpBcXoAnMM?=
 =?us-ascii?Q?NeMyOqKqOFbubU6k6n7f660xC7sAWN5CVFRCDHGAwsjDZqqPn3dRh1WgO1ol?=
 =?us-ascii?Q?JngGfM19EqgRtdoZ5ddaYO1jQCTRUvughRNu1uCtStXFTpVorguFrpyVCol8?=
 =?us-ascii?Q?No7RH8gBJDHNaAkKOnu5KSglM0ij190dv0PbjIkAncL+CDbS+LEq4AgZ1cBk?=
 =?us-ascii?Q?SeuoDYSjYPviOvXhcniBvLjYcYEy9OX+sKvcgREj1RZgCfOhk74G4J/HKp3s?=
 =?us-ascii?Q?NKCShOoDB8NzVvcO88EmQ0BeCOFYdUZOnBovotCTvk/nSSobqPQWi8TvRXDv?=
 =?us-ascii?Q?P2J/qQ8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2024 13:07:32.5743 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 780ec1bb-7d65-479f-b7eb-08dc7804a539
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7744
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
 tests/amdgpu/amd_abm.c | 65 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index f74c3012c..971cda153 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -104,6 +104,32 @@ static int backlight_write_brightness(int value)
 	return 0;
 }
 
+static int toggle_panel_power_saving_prop(data_t *data, igt_output_t *output, bool forbid)
+{
+	uint32_t type = DRM_MODE_OBJECT_CONNECTOR;
+	bool prop_exists;
+	uint32_t prop_id;
+
+	prop_exists = kmstest_get_property(
+		data->drm_fd, output->id, type, "panel power saving",
+		&prop_id, NULL, NULL);
+
+	if (!prop_exists)
+		return -ENODEV;
+
+	return drmModeObjectSetProperty(data->drm_fd, output->id, type, prop_id, forbid);
+}
+
+static int allow_panel_power_saving(data_t *data, igt_output_t *output)
+{
+	return toggle_panel_power_saving_prop(data, output, false);
+}
+
+static int forbid_panel_power_saving(data_t *data, igt_output_t *output)
+{
+	return toggle_panel_power_saving_prop(data, output, true);
+}
+
 static int set_abm_level(data_t *data, igt_output_t *output, int level)
 {
 	char buf[PATH_MAX];
@@ -365,6 +391,43 @@ static void abm_gradual(data_t *data)
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
+		r = allow_panel_power_saving(data, output);
+		if (r == -ENODEV) {
+			igt_skip("No panel power saving prop\n");
+			return;
+		}
+		igt_assert_eq(r, 0);
+
+		target = 3;
+		r = set_abm_level(data, output, target);
+		igt_assert_eq(r, 0);
+
+		r = forbid_panel_power_saving(data, output);
+		igt_assert_eq(r, 0);
+
+		target = 0;
+		r = set_abm_level(data, output, target);
+		igt_assert_eq(r, -1);
+
+		r = allow_panel_power_saving(data, output);
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
@@ -393,6 +456,8 @@ igt_main
 		abm_enabled(&data);
 	igt_subtest("abm_gradual")
 		abm_gradual(&data);
+	igt_subtest("abm_forbidden")
+		abm_forbidden(&data);
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-- 
2.45.0

