Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9110041B86D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 22:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D8B6E975;
	Tue, 28 Sep 2021 20:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2047.outbound.protection.outlook.com [40.107.100.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727CC6E0EC;
 Tue, 28 Sep 2021 20:38:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0rCvirL3rFs+xQhuPKer9EZsGlBnYyvR7hrykQC9Dt+tjHaWJi3FkerZv3ZP1EXGM8YM5MJ9X9gtJ8KqXJ6ekH3URam+7t08YTvi5aCNtMFkMAJ9F1MstuVHdXcJ9PzZ+IO+eapEzadKtw4kAZX0/ytXRNgH4wC5C1oElyA4EhF929/wAbP9me4VTqVLGoUI6LOJzgLKQuUZFeRlNRgKGpGUyrW+6u31ZSwqA1N5aX1naz1m2pTeY3FHqXYEr2IwGW74VWFtzLHlESL5hkYEcvveT8PP6yHotev8NZLiMghDUn1Ji+5C5faee5pvyRp8ez0fsNAEfzTfKpR+bDdUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=cEmjsHrxsXKlST15sl6o6mQ6LmEjStamEd8Jm01C8VY=;
 b=H4JnFnf4ROPjZGbRlJb+a2MdCtxp7NCRMgymlNrN06L08x+CGGGMaM8+GFnc05oQ7Sob0LyoWIvcDeB2RXgLJ5kteyNKwTWevAv87uLlNVe6dCCscsFo+rPyphrUBidN1VAw2HKBqcBVIB7ijK6DT8VVfnb5X8nHghiKV+YPhoybZbaysn+t5TZ7H7dm253ilNerOcR2GT1QU684EWZePww2xnC01LhLzDjG0kviqER78Wyw40Sqvemr3C5mdFzWIyAggpnYXarvxbI1FWUG6aoRIf8+phRFJxR5jy4FJW9CJMacg7zlR7Bw61x/GcEBJutbqLM0Uj/uumxETzKhag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEmjsHrxsXKlST15sl6o6mQ6LmEjStamEd8Jm01C8VY=;
 b=wk9tBcDEpK0YFDm94VAaLrzOXMzFoviL0Br2jO3Dd2Imw3GUugY9WR5hbOp3iyN0YYkglSQo8ykROTqyT4TQaw+o4Zsm0o1o8JmNJPyqxzVEjls/uTjebU8pk9XGTt9d48Q0wv6xQBrOL0hP3OQ9p9Orw2Dhav1v2xAA9czHFnU=
Received: from BN9PR03CA0330.namprd03.prod.outlook.com (2603:10b6:408:112::35)
 by MW3PR12MB4473.namprd12.prod.outlook.com (2603:10b6:303:56::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 20:38:19 +0000
Received: from BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::7) by BN9PR03CA0330.outlook.office365.com
 (2603:10b6:408:112::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Tue, 28 Sep 2021 20:38:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT006.mail.protection.outlook.com (10.13.177.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 20:38:19 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 28 Sep
 2021 15:38:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 28 Sep
 2021 13:38:17 -0700
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Tue, 28 Sep 2021 15:38:02 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <jerry.zuo@amd.com>
CC: <jani.nikula@intel.com>, <Sunpeng.Li@amd.com>, <nathan@kernel.org>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ville.syrjala@linux.intel.com>, <manasi.d.navare@intel.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <sfr@canb.auug.org.au>,
 <linux-next@vger.kernel.org>, <airlied@gmail.com>, <daniel.vetter@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>
Subject: [PATCH v3] drm/amd/display: Only define DP 2.0 symbols if not already
 defined
Date: Tue, 28 Sep 2021 16:37:52 -0400
Message-ID: <20210928203752.760237-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f54533d-4916-4082-9103-08d982bfe7fd
X-MS-TrafficTypeDiagnostic: MW3PR12MB4473:
X-Microsoft-Antispam-PRVS: <MW3PR12MB4473820E8DDB2F154AEF43708CA89@MW3PR12MB4473.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rYVhcEFtNIeRztChsQHOp9lsRfMMy3lLWh5GHEownpzptFapTnyYWL2HDljX9Ec0PKKZRkbX8Ytf1g/BYlyPC42Wzy+QRNthe6IyzUHeoMJx5an/lWrJNwyLfQVFYcyO/UkE+y/NHPjNXd2nzU9f8YbEL8OUqoAP9IqPUmG/r0g8BUpgg5nTUUHtzBAURqTur0R+5d5O46mJNrDwXF2vtdgxajAIPH9CYe/0R+vXkV8X3wPihsXiv8saUVivRcVS08q4zPBeVf8uhNgqOUlali+1r7cx0bpx+Ds5quLbopXOLposoZ+rj4zmGHqs7ONz6jKgv/GQaVjukKYL+9xmJJFGNUL+3r/X8S4HrmPPNjj8hhx5UHWSbghmdM5AgmVUQhcEmWcsYQBnBD4fcetZ2bzh8ou8EBeefrY2Wt+WlynOXDQVuM70LF4UrSHJHpAh9QyrjdfAb/F54C6Hsvqu5uVnQK1BpyEfdDzNiKTs0OGhOX22UVFjn3xewfuYDvH1e0zpEoMVxsPLbYk7DzNC/99KwbnqiJEOLubpF6FH3B1kUJRLLhxZx1RJimKg3SYhh+7m7ObUmkApPst1i3p0lh7qruS1voTDt62KReVczgOBeofMYJFyB7wCiealOOXZPTIXh485BRL+qinv1Yj7Mg0TUVrvUlYiduPIkv7Di1+pECQQs8dhRUyqHMILxxu4OtiQ9c31gWd03Y6W96Ke9wmo/sM/q/SwgZ2sjm4jiD95LwbGgnC9K4jnaXmPlv9L
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(508600001)(426003)(6636002)(7416002)(110136005)(8676002)(86362001)(2616005)(26005)(356005)(54906003)(81166007)(2906002)(8936002)(6666004)(5660300002)(336012)(1076003)(82310400003)(7696005)(83380400001)(316002)(186003)(36756003)(44832011)(36860700001)(70206006)(4326008)(47076005)(70586007)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 20:38:19.1735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f54533d-4916-4082-9103-08d982bfe7fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4473
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
For some reason we're defining DP 2.0 definitions inside our
driver. Now that patches to introduce relevant definitions
are slated to be merged into drm-next this is causing conflicts.

In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:33:
In file included from ./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:70:
In file included from ./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_mode.h:36:
./include/drm/drm_dp_helper.h:1322:9: error: 'DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER' macro redefined [-Werror,-Wmacro-redefined]
        ^
./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dp_types.h:881:9: note: previous definition is here
        ^
1 error generated.

[How]
Guard all display driver defines with #ifndef for now. Once we pull
in the new definitions into amd-staging-drm-next we will follow
up and drop definitions from our driver and provide follow-up
header updates for any addition DP 2.0 definitions required
by our driver.

We also ensure drm_dp_helper.h is included before dc_dp_types.h.

v3: Ensure drm_dp_helper.h is included before dc_dp_types.h

v2: Add one missing endif

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h | 54 ++++++++++++++++++--
 drivers/gpu/drm/amd/display/dc/os_types.h    |  1 +
 2 files changed, 50 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
index a5e798b5da79..9de86ff5ef1b 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
@@ -860,28 +860,72 @@ struct psr_caps {
 };
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
+#ifndef DP_MAIN_LINK_CHANNEL_CODING_CAP
 #define DP_MAIN_LINK_CHANNEL_CODING_CAP			0x006
+#endif
+#ifndef DP_SINK_VIDEO_FALLBACK_FORMATS
 #define DP_SINK_VIDEO_FALLBACK_FORMATS			0x020
+#endif
+#ifndef DP_FEC_CAPABILITY_1
 #define DP_FEC_CAPABILITY_1				0x091
+#endif
+#ifndef DP_DFP_CAPABILITY_EXTENSION_SUPPORT
 #define DP_DFP_CAPABILITY_EXTENSION_SUPPORT		0x0A3
+#endif
+#ifndef DP_DSC_CONFIGURATION
 #define DP_DSC_CONFIGURATION				0x161
+#endif
+#ifndef DP_PHY_SQUARE_PATTERN
 #define DP_PHY_SQUARE_PATTERN				0x249
+#endif
+#ifndef DP_128b_132b_SUPPORTED_LINK_RATES
 #define DP_128b_132b_SUPPORTED_LINK_RATES		0x2215
+#endif
+#ifndef DP_128b_132b_TRAINING_AUX_RD_INTERVAL
 #define DP_128b_132b_TRAINING_AUX_RD_INTERVAL		0x2216
+#endif
+#ifndef DP_TEST_264BIT_CUSTOM_PATTERN_7_0
 #define DP_TEST_264BIT_CUSTOM_PATTERN_7_0		0X2230
+#endif
+#ifndef DP_TEST_264BIT_CUSTOM_PATTERN_263_256
 #define DP_TEST_264BIT_CUSTOM_PATTERN_263_256		0X2250
+#endif
+#ifndef DP_DSC_SUPPORT_AND_DECODER_COUNT
 #define DP_DSC_SUPPORT_AND_DECODER_COUNT		0x2260
+#endif
+#ifndef DP_DSC_MAX_SLICE_COUNT_AND_AGGREGATION_0
 #define DP_DSC_MAX_SLICE_COUNT_AND_AGGREGATION_0	0x2270
-# define DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK	(1 << 0)
-# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK	(0b111 << 1)
-# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT	1
-# define DP_DSC_DECODER_COUNT_MASK			(0b111 << 5)
-# define DP_DSC_DECODER_COUNT_SHIFT			5
+#endif
+#ifndef DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK
+#define DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK	(1 << 0)
+#endif
+#ifndef DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK
+#define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK	(0b111 << 1)
+#endif
+#ifndef DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT
+#define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT	1
+#endif
+#ifndef DP_DSC_DECODER_COUNT_MASK
+#define DP_DSC_DECODER_COUNT_MASK			(0b111 << 5)
+#endif
+#ifndef DP_DSC_DECODER_COUNT_SHIFT
+#define DP_DSC_DECODER_COUNT_SHIFT			5
+#endif
+#ifndef DP_MAIN_LINK_CHANNEL_CODING_SET
 #define DP_MAIN_LINK_CHANNEL_CODING_SET			0x108
+#endif
+#ifndef DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER
 #define DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER	0xF0006
+#endif
+#ifndef DP_PHY_REPEATER_128b_132b_RATES
 #define DP_PHY_REPEATER_128b_132b_RATES			0xF0007
+#endif
+#ifndef DP_128b_132b_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1
 #define DP_128b_132b_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1	0xF0022
+#endif
+#ifndef DP_INTRA_HOP_AUX_REPLY_INDICATION
 #define DP_INTRA_HOP_AUX_REPLY_INDICATION		(1 << 3)
+#endif
 /* TODO - Use DRM header to replace above once available */
 
 union dp_main_line_channel_coding_cap {
diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
index f50cae252de4..34efb708ea12 100644
--- a/drivers/gpu/drm/amd/display/dc/os_types.h
+++ b/drivers/gpu/drm/amd/display/dc/os_types.h
@@ -35,6 +35,7 @@
 #include <asm/byteorder.h>
 
 #include <drm/drm_print.h>
+#include <drm/drm_dp_helper.h>
 
 #include "cgs_common.h"
 
-- 
2.33.0

