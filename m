Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08272414F2A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 19:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F3F6EC5E;
	Wed, 22 Sep 2021 17:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4286EC5B;
 Wed, 22 Sep 2021 17:33:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpvpVSPoo1yZqXTu30ZEIQtrjs0jVgFiVTJMKnfHJx6v9CKjaJ3dJGTReCKi6g4gaIJ7xxx4OJ10DNzRzVS3vLfoYC2HbSdyvpsRHJXe3yGAuOEq4iEYsr6JlCllC4YtGGAKW2KirzvmSabzjWpDeZnEKBPCNfI87KpodO9+dXt77hNeB8R+QMnKMui3C45qCkxWMfr2umolmQxrDEOFbnUGSFTJ7L+6JGZEDW8kAQ1xIsz5OYMqz5l01i+Rr0hBE6fzOIQWV1ZuBo5NmAUPt70V8Iakn0wP//jMONhpCeWqgb94NAnFmb+5g99hQaNf7rNiosiVlwbDDmBzVEbADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Qd0ZZKWj2ZTA8hah9FZ5d5kGfMsnNAgTupZYMPcaNV8=;
 b=QTsQif6rq+fDdMjhtDrNRM+RCvhlMsgjNiUqxokkHV4IHsjX1e17KNR9AqpxJdbiiUgYPngm8W6Noic7wIIKdGGzn4N71xEisMp8m/N06Ohz6UYxfHT6Y+mvpI7ZHRyPOOvB7dIcKtzpfKDk4/+mzu6LxVNShgNQuqvwoMKqI745d92jYUDQKCmV/Crjqb5Y2bTSPAl9yp1vPt5xEuu+lpBmRQa1IrTiBnjIZFmIqy+1a9tkL638EtuKK4VYRkm37xxXptY9yxEP7rstMBA/JXzWp3e9pSLirY6rXr+xFPiS74UUTXmGxh3LqRYDPUAqitj8pibdIiHjJYVWJgpAYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qd0ZZKWj2ZTA8hah9FZ5d5kGfMsnNAgTupZYMPcaNV8=;
 b=EcpkuQ8zJ0D98lsI9Ec1JKvg9O+gzFZITDH7NDPCaOTm3uLsROaxGOF29u5KnIUCtoZto27D3mwb7XWudzwlug6P303GjN3imQVgZlOAW2mVJBGnQANPeLMpmfn7oPVkk38nuCz3fGE8FcawGcMxp4q6SKh1NfKbjCks6nmnvUg=
Received: from MWHPR1601CA0010.namprd16.prod.outlook.com
 (2603:10b6:300:da::20) by BN6PR12MB1746.namprd12.prod.outlook.com
 (2603:10b6:404:104::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Wed, 22 Sep
 2021 17:32:58 +0000
Received: from CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:da:cafe::f) by MWHPR1601CA0010.outlook.office365.com
 (2603:10b6:300:da::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Wed, 22 Sep 2021 17:32:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT044.mail.protection.outlook.com (10.13.175.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 17:32:58 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Wed, 22 Sep
 2021 12:32:57 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Wed, 22 Sep
 2021 12:32:57 -0500
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Wed, 22 Sep 2021 12:32:56 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <jani.nikula@intel.com>, <Sunpeng.Li@amd.com>, <nathan@kernel.org>,
 <alexander.deucher@amd.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ville.syrjala@linux.intel.com>, <manasi.d.navare@intel.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <sfr@canb.auug.org.au>,
 <linux-next@vger.kernel.org>, <airlied@gmail.com>, <daniel.vetter@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH] drm/amd/display: Only define DP 2.0 symbols if not already
 defined
Date: Wed, 22 Sep 2021 13:32:48 -0400
Message-ID: <20210922173248.40850-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <CADnq5_OCbZ8Y299ZcC+7ZwhfgqN+TRM+TWPZtkvFGvvNguvuzA@mail.gmail.com>
References: <CADnq5_OCbZ8Y299ZcC+7ZwhfgqN+TRM+TWPZtkvFGvvNguvuzA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9f3552c-d44c-4898-72fe-08d97def04f5
X-MS-TrafficTypeDiagnostic: BN6PR12MB1746:
X-Microsoft-Antispam-PRVS: <BN6PR12MB174625BF60133B5112ED6E868CA29@BN6PR12MB1746.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oJs8/uFhtVHeHNP00J7M30zuRs9I3IQnPr8AHi3XriVx6AQ2tmGQeICl6C7zKqfy8CnkbumWX2AfMZ+eWaRVqV97HbmjXHD0TL5ZjBrUS7iucePdhk23aPacz11JMGN5cJsU5Cf5NS0jxGTaNUpd8xsyapuYDtNoUkoaRArDe6NkINescX0cVH3VZWzBFLc2fYHLznYujUbKD3lNVHuQX9Ak49TA5olPiQlkN9z55jWDxcbv9F5QSG3pZsUEdzxapZox8XdvrWuVai1T52xeaV/IHGgisF56aklHrWx0nRgZFKWBB/VrtD+uCvLSHny7Hxc0wAKqi+J/c2n04r3doLT1iQ6EyINYLWLrRHplFmxzfFNJx4TJyylQOkipfQSgYb6KV8oMbWrgOxEQh5pDm20/moZQCDnfC02aaOsTob3xF/noKQjf3ggbW1MWP1sOkJgn//jF3TfRygEYBaqXkBhvqLu1oWjcB9cDUXs7hw0BwIGUNqtUSYCDR/yredwQ4UgD5QnL0wsG0uTwd16psyrJbtU+Mf/pWHZ70j6h56l+iTerQq83zzXvcvwyUiLEwTOj5kBy+CbEVod4LCLb7JbVQ2FfoqGvUJ7dd3SjMfmi95b2MC+jwyDoz0xNziJZTt3XxCe23ti6xPTyBlas4Hcmk5OcjxlyoM6aokneKSZCigWZuGz1oz9DKHEAOKI6ondfVbaz/Pjtt0SmTPCPLf94VEzPu/1WzaQ8FpOBR4Q=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(5660300002)(356005)(47076005)(426003)(83380400001)(2616005)(36860700001)(4326008)(6666004)(82310400003)(508600001)(336012)(36756003)(186003)(26005)(2906002)(54906003)(8676002)(1076003)(6636002)(81166007)(7416002)(8936002)(316002)(7696005)(86362001)(110136005)(70206006)(70586007)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 17:32:58.1977 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f3552c-d44c-4898-72fe-08d97def04f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1746
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h | 53 ++++++++++++++++++--
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
index a5e798b5da79..74b8de616dcd 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
@@ -860,28 +860,71 @@ struct psr_caps {
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

