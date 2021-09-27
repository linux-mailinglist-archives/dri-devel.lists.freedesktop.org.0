Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF133419F14
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 21:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C166E44C;
	Mon, 27 Sep 2021 19:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2054.outbound.protection.outlook.com [40.107.100.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6F06E03C;
 Mon, 27 Sep 2021 19:23:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLQDC9N2my9mFPlJoXgZ9V7vRPmpc5WwmFmZnifscjf8UOzXnWRayX7nFJsnPR+ocuqpOS34eIEFNUiJgcHCQtb925LtLoKqCacetXZjwt9AvV9CY/VDMbgQ40hpBUfFmrB0UZFCD9/p2Idjoxk8+pxO/+OWm/bGk+IrLQ2er1xB+cw7bfJ2e0nRXU4YbWjWM0wuPIb6u6j7EtMhAzhflmrS/l2iLZ9K7TytUPKCQouLaG/MlT3FI6ZemsQEaNHe3gVxdXwN5nNUVdPg0S7yb9iFU3DEvNJY4J79H9t/Q5/mGCqVqwgLxUOS0i16yDCDeV9sS9P5SyMR/lJUvNnKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=kvIJIWD5n6XE0ncp6SL7Npx6TrVmG3iU+tti80Ul/t8=;
 b=GocA0GkWiqop5T5MDm9uE1vAkKWrdxJ0cm4qHEpc91lodvg4AnQZNEp0gzZxPw5hXQhrkRkDT1NzMdCtZ17F8DnZEINAWbZGOV5o4Zm0e3LJS6PnxKQaTZfg2M6Ur6hoZfPzbaMwFneX+YxtUeqyHjTYnxQgIsIS7jU0UJ1PyWecLSPBTRjb6MC+6awmgGBbxxHPuC4h5ku/GqPpLB0oPK06u9V7vEcLSmdVCZzkJB9iJ/laWdJrFEM8E7JmAzmX7ynzGCGWuGRb9HNyzfULBS6M648FPnlQCt+fRo/PlsQswAB3RJc9ni7Kx3AQpsT4N1DE3ZPeVDx3rnfjNGH3KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvIJIWD5n6XE0ncp6SL7Npx6TrVmG3iU+tti80Ul/t8=;
 b=x9krzEGn+GjF3qGB35frqii6RIf7Xlkn2z5jI0S8Oia/q44KFeaM0Ffj3oT1QG++sa1JwFNqsYnjo4wieHl3pGhAenRbrJ/pLyxNPrBS4OJtDzrzL0ze+9/i0BM68iai2dJNPb26CjTUE0XT67BaWT9aDzE2g7HTry3eChJUmUc=
Received: from BN7PR06CA0063.namprd06.prod.outlook.com (2603:10b6:408:34::40)
 by MWHPR12MB1872.namprd12.prod.outlook.com (2603:10b6:300:10d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Mon, 27 Sep
 2021 19:23:37 +0000
Received: from BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::44) by BN7PR06CA0063.outlook.office365.com
 (2603:10b6:408:34::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Mon, 27 Sep 2021 19:23:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT018.mail.protection.outlook.com (10.13.176.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 19:23:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 27 Sep
 2021 14:23:35 -0500
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Mon, 27 Sep 2021 14:23:34 -0500
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <jani.nikula@intel.com>
CC: <Nicholas.Kazlauskas@amd.com>, <wayne.lin@amd.com>, Fangzhi Zuo
 <Jerry.Zuo@amd.com>
Subject: [PATCH v3] drm/dp: Add Additional DP2 Headers
Date: Mon, 27 Sep 2021 15:23:24 -0400
Message-ID: <20210927192324.5428-1-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afd7bd3f-fe5f-426c-b174-08d981ec4d8a
X-MS-TrafficTypeDiagnostic: MWHPR12MB1872:
X-Microsoft-Antispam-PRVS: <MWHPR12MB187215FE2A1642A663F3A6BFE5A79@MWHPR12MB1872.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8HzragutXGv4nCM63HucRXda4FyIr99f+3kMoXgUZexhhXwFDZfu1pSp0XSWk/WJg1KcmLXIQODhQLUcis5Dyf3F9J427oOZ2q0UExdC5qZ8XzzthEExMVvjNYDK0DQf0AJBhFVQ/gBCIg7Xr+f+o988CePONctFWmEO8vU82Q8jrQ6bGNhZy9nzFIVL1eZ4IUkXwCioLjncAeMQGrhwu7lsyRBMuIUeXD+2aBUAzDsSHbdlB9DF+anMVmIQwQtZANQirTJ8NzdApjfsE7adBaYT0gb2CSamiFLtd+0IiQpldCQijmauloADf7FmFmVhj/udeirEcSHSZfpaoKJaPEKaHshrKdzWN3TVcjAmHM0yDrLKUTqSQf1lsVI+lX/+XP9iTRmRZvwqF4ol/GF4s6fnAsRrXfxkKgG1xRm2/MUU93a9DG7pA2+SccDyFjuOz2w57/kukTNozYkl9EfO463reeXjkgRPq+r6oUxwblSoCK2BoafEbPJge5r+YDDivoU+KUzuLVAuIkTZJAFSyZOpZokKsttB0F2KkpG5drAdsgQkgHZ5xEPrl6NLvKJSUz+8CtzyQkXsOHAjSPiRz84TImcDyjau5s0aZMeyngD65pz5qKCIsHRoQpKUULDXzP1RZV5fR2p+9k/p3xf81U1q0Zty7vSfJj7TW84Zqbjtcg6N7X02EfsafxTM1TdBVwhyeMGi+yiJGitVppCiNQv4F4bptT9KJbCf4HnwRgY5rAId/0FTcTeHvrPkiNnP
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(1076003)(82310400003)(26005)(186003)(336012)(83380400001)(47076005)(70206006)(36756003)(81166007)(70586007)(7696005)(8676002)(86362001)(5660300002)(36860700001)(8936002)(2616005)(2906002)(426003)(316002)(54906003)(110136005)(356005)(6666004)(4326008)(508600001)(21314003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 19:23:36.2396 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afd7bd3f-fe5f-426c-b174-08d981ec4d8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1872
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

Include FEC, DSC, Link Training related headers.

Change since v2
- Align with the spec for DP_DSC_SUPPORT_AND_DSC_DECODER_COUNT

Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
---
This patch is based on top of the other DP2.0 work in
"drm/dp: add LTTPR DP 2.0 DPCD addresses"
---
 include/drm/drm_dp_helper.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 1d5b3dbb6e56..a1df35aa6e68 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -453,6 +453,7 @@ struct drm_panel;
 # define DP_FEC_UNCORR_BLK_ERROR_COUNT_CAP  (1 << 1)
 # define DP_FEC_CORR_BLK_ERROR_COUNT_CAP    (1 << 2)
 # define DP_FEC_BIT_ERROR_COUNT_CAP	    (1 << 3)
+#define DP_FEC_CAPABILITY_1			0x091   /* 2.0 */
 
 /* DP-HDMI2.1 PCON DSC ENCODER SUPPORT */
 #define DP_PCON_DSC_ENCODER_CAP_SIZE        0xC	/* 0x9E - 0x92 */
@@ -537,6 +538,9 @@ struct drm_panel;
 #define DP_DSC_BRANCH_OVERALL_THROUGHPUT_1  0x0a1
 #define DP_DSC_BRANCH_MAX_LINE_WIDTH        0x0a2
 
+/* DFP Capability Extension */
+#define DP_DFP_CAPABILITY_EXTENSION_SUPPORT	0x0a3	/* 2.0 */
+
 /* Link Configuration */
 #define	DP_LINK_BW_SET		            0x100
 # define DP_LINK_RATE_TABLE		    0x00    /* eDP 1.4 */
@@ -688,6 +692,7 @@ struct drm_panel;
 
 #define DP_DSC_ENABLE                       0x160   /* DP 1.4 */
 # define DP_DECOMPRESSION_EN                (1 << 0)
+#define DP_DSC_CONFIGURATION				0x161	/* DP 2.0 */
 
 #define DP_PSR_EN_CFG				0x170   /* XXX 1.2? */
 # define DP_PSR_ENABLE				BIT(0)
@@ -743,6 +748,7 @@ struct drm_panel;
 # define DP_RECEIVE_PORT_0_STATUS	    (1 << 0)
 # define DP_RECEIVE_PORT_1_STATUS	    (1 << 1)
 # define DP_STREAM_REGENERATION_STATUS      (1 << 2) /* 2.0 */
+# define DP_INTRA_HOP_AUX_REPLY_INDICATION	(1 << 3) /* 2.0 */
 
 #define DP_ADJUST_REQUEST_LANE0_1	    0x206
 #define DP_ADJUST_REQUEST_LANE2_3	    0x207
@@ -865,6 +871,8 @@ struct drm_panel;
 # define DP_PHY_TEST_PATTERN_80BIT_CUSTOM   0x4
 # define DP_PHY_TEST_PATTERN_CP2520         0x5
 
+#define DP_PHY_SQUARE_PATTERN				0x249
+
 #define DP_TEST_HBR2_SCRAMBLER_RESET        0x24A
 #define DP_TEST_80BIT_CUSTOM_PATTERN_7_0    0x250
 #define	DP_TEST_80BIT_CUSTOM_PATTERN_15_8   0x251
@@ -1109,6 +1117,18 @@ struct drm_panel;
 #define DP_128B132B_TRAINING_AUX_RD_INTERVAL   0x2216 /* 2.0 */
 # define DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK 0x7f
 
+#define DP_TEST_264BIT_CUSTOM_PATTERN_7_0		0x2230
+#define DP_TEST_264BIT_CUSTOM_PATTERN_263_256	0x2250
+
+/* DSC Extended Capability Branch Total DSC Resources */
+#define DP_DSC_SUPPORT_AND_DSC_DECODER_COUNT		0x2260	/* 2.0 */
+# define DP_DSC_DECODER_COUNT_MASK			(0b111 << 5)
+# define DP_DSC_DECODER_COUNT_SHIFT			5
+#define DP_DSC_MAX_SLICE_COUNT_AND_AGGREGATION_0	0x2270	/* 2.0 */
+# define DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK	(1 << 0)
+# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK	(0b111 << 1)
+# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT	1
+
 /* Protocol Converter Extension */
 /* HDMI CEC tunneling over AUX DP 1.3 section 5.3.3.3.1 DPCD 1.4+ */
 #define DP_CEC_TUNNELING_CAPABILITY            0x3000
-- 
2.25.1

