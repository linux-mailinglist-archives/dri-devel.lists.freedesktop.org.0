Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AD041B4B8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 19:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C54689E8C;
	Tue, 28 Sep 2021 17:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA90D89E7C;
 Tue, 28 Sep 2021 17:08:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTBUZdDHqrpgELogUzk5r/ycPW5vImpb0KgTN5UJ1kvSjPi7Zi5X7urYUMfxfVCxPtSTf90kBZj4nb7y58sm4srpWX75owHZcyzlK9484NTSlUaJITupeLkSBBqVOopZ1amPVIlyWZJ6R0wDREzxX7HnzvVrz3R3X3GzxQ4ZrrrvqYGCl3Ni6g5sN5ww6ws4aVwjIwRdpywlIMk4k9H7gsgkeSGvDj/nbqtsVRX+NEpwhxZv7D7KnfZLTa1xID3CjOf52uFTQt+lvQgKTszrewtcCb6/T6NzMuV4AhvumCtl0/aUS9U/KPcAUSzcVsgONg8xu9Ih1xsCVo6dBUe8rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=BAiIH5O8RK9hSo6r/5vJeZkVh9JEMy+pTgxQmfncCWw=;
 b=BMpLFvGgei4YxJ18FxA9HwDlsiuk4T1J/uPrFQ64nY2GggJlCDzz/w/tHMskZ2Z3UpvL6gnqPIqKVbx/v8C9l7WFpnj5tEkWv01UZqTVYYsRXa7AXFoYvzadiToY4v/4B32q6gS5tC/yPjJAm9ypfFhmdaGryldVbWKhSkMTO69PgQ5lk3JbxUaDMk1MI7msECZ+f9a1GULWprrNhMy44jmrOMeqhAaQXFc8uR19sUREkOif3LuQfbpEUWoShbeFXUovlkIJjkdi3Xu1u9UwZrlsJc0fnrcYtRPu8VlsIXWppde1tF8xypnxLXBgtf8WSZbQoxHs6VacmOfDLeG9wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAiIH5O8RK9hSo6r/5vJeZkVh9JEMy+pTgxQmfncCWw=;
 b=AAD540yfsqIiCfz1fzZQc5ivG4gtP3E2FqkX7IDUPT1f0JrOKutTfX+S5XPmxFfY5RAmcKskraCcwfHTxBHL7fjZRy8550MBsM4abWqRFdOR3eCS5LJrSKejcVvkkesrxnyOEUn5e3ROCtfMsuab/h1CU4m4nlAssIIJ4gRTkT0=
Received: from MWHPR1701CA0009.namprd17.prod.outlook.com
 (2603:10b6:301:14::19) by MN2PR12MB3375.namprd12.prod.outlook.com
 (2603:10b6:208:cc::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 17:08:44 +0000
Received: from CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:14:cafe::a1) by MWHPR1701CA0009.outlook.office365.com
 (2603:10b6:301:14::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Tue, 28 Sep 2021 17:08:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT007.mail.protection.outlook.com (10.13.174.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 17:08:43 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 28 Sep
 2021 12:08:41 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 28 Sep
 2021 10:08:41 -0700
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Tue, 28 Sep 2021 12:08:32 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <jerry.zuo@amd.com>
CC: <jani.nikula@intel.com>, <Sunpeng.Li@amd.com>, <nathan@kernel.org>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ville.syrjala@linux.intel.com>, <manasi.d.navare@intel.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <sfr@canb.auug.org.au>,
 <linux-next@vger.kernel.org>, <airlied@gmail.com>, <daniel.vetter@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v2] drm/amd/display: Only define DP 2.0 symbols if not already
 defined
Date: Tue, 28 Sep 2021 13:08:28 -0400
Message-ID: <20210928170828.26452-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea7f2e8c-76bc-4de3-1f4d-08d982a2a067
X-MS-TrafficTypeDiagnostic: MN2PR12MB3375:
X-Microsoft-Antispam-PRVS: <MN2PR12MB33750DCE42CDE4053A5339A58CA89@MN2PR12MB3375.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eMzRp0r1tpRdZhJnKUj7PwkJH/3hf16xVRmtU5Hbv6dyRA8tPSxsbstKar4iM5F4UQkhi3kaHVsrhcvIOVrHPUkgCq7IzJ5U1BXYdrtzKzW+qxlccP9//0bjco7/BsVE3FAQa1jOOgFeOrtqnUFah8jMiNvxKFAx59ToMePE4ReebtskE7NRJYICJrLf46RNhX0i4M/rJ8doJy4UhQtG/yXSXwhnwgI2icIf+D6hycSHQems2ix8aJ2YflGITUOF6bvRT/sicWbYmu+HF/MtBvooOmYsGJVtPnVvbrT276bD2rxGXmkuzhx6t1voQPdKHWA2SUkWOjqsjMHUddCYf1tRUoQUu99fpnZeZAcFC5csCBisc/ZGahGjDbH1xd45tzsq0hl/DKv94oDMngGRckiM2x7nYLd3//uvGKISeYWxb6Lylok5oVc1catP95l2rrY8aWPwTDkOHvXwOvwAkbAjbeq554Tm19MKA3Su/HOKceBm4tigkFYIlqfTxAMDJxSem8yMNK05dJlQPL4yYRNSYerohXy1oIRzdPfu9u+1x3DHb6IK3YGzc48BR/a/3Em2DjIv8tsexfLOM4whFPLq7SAM2nK85wTIv3x5k8qfpQOymnqUjNVglYsDyUIuboePD+EbQycfQPahJ9IL4Eaob8LXh550wtYFhUo4EK/+2fBojpEdpRDuRmSneQxlqQ73fAw4xzjdUB4NnHz6rNvTz1QTo8Pi/TAHa9q/wv1r3M6PV4Bq6UHnFyMQetbv
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(1076003)(81166007)(426003)(186003)(6636002)(508600001)(83380400001)(86362001)(36860700001)(7696005)(336012)(2616005)(36756003)(47076005)(2906002)(4326008)(82310400003)(5660300002)(44832011)(7416002)(316002)(110136005)(70586007)(356005)(54906003)(6666004)(26005)(70206006)(8676002)(8936002)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 17:08:43.5512 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea7f2e8c-76bc-4de3-1f4d-08d982a2a067
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3375
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

v2: Add one missing endif

[How]
Guard all display driver defines with #ifndef for now. Once we pull
in the new definitions into amd-staging-drm-next we will follow
up and drop definitions from our driver and provide follow-up
header updates for any addition DP 2.0 definitions required
by our driver.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h | 54 ++++++++++++++++++--
 1 file changed, 49 insertions(+), 5 deletions(-)

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
-- 
2.33.0

