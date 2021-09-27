Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F194F419812
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 17:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775B96E84D;
	Mon, 27 Sep 2021 15:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D77C89F92;
 Mon, 27 Sep 2021 15:41:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m48lwqsiNIJFWwgHBusPP2CShRoUK2B6XgKGqQVTaLutFRGtU1QHYfICcnHr1ItZDaD5DDel2XzcY6irTojMnSnpQuT7gq0JVMkzTRLH9bFv//yyQUeo5PW+GmsGVmu7QXETU296hvtA81JNn6lS7i+gDfMnQYGP708mx55D9FDiCG7EqqvgVPEhA3TG+LCyWVEWGN6Yd/vfOV/vT57wMQyXSsfnpQFcpXofS6jgmfHii61tORn9TdcfKC8oYvPVKdZbNtrjlJ+PW5Mna9v/gIQvIysdYww7/RBQ9ZZPb2Pd+2pZs7BfZSB+SqYNTensSns23Psd7LAo74dhpfXr9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=lNaiS9AOgR670eXV/WrShhySRdwAxL8cyGWv4zfP3qI=;
 b=gTf2nyq10SWii0vRfEutxDVI1YHPuO8TEDxiv+AAVICLgacjzzwR6rtrC0D51UcDYx68YH2Zr8W6O+flesulZp1QsumJn50LBfKAG0pRIN+Moj7R3/23EWMgQLSeAK6rxQESC52aQ8BWCjM4i+giXtzgD8AL76DE2/zEGg0OEW9ZuxtOJfLdGbyTYQqPZzcS8JqQ5+ADw6uSFvaxAbvXPLkjbuo5qaKL340HhhsS2z0EZLBiREsXD8YO/Sp6gp8hpemwn55N9FBzQm+qKsQmPCSLFCSFQUu1njQAFRTj0NrkjUa8G6nbe7Fa23VDa+NEg4kM3qVO0YLgOz1kJ98cLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNaiS9AOgR670eXV/WrShhySRdwAxL8cyGWv4zfP3qI=;
 b=hgoDnL/GY2erRRiUzWSIf3dx2vjE4fYGUatZmgMZRJMeFQOt4EjQ6Zj6sBrtG659PHNgNsuvWEX1ASyWxR+5yO1d/YJfzmpfVs7lkH/hJOgRE51PtA01RjNV/oqTqG4UyHGCCl4sdLk7PIoLNcMrUn5qzQVyf0Th8QQ3Mj67X0g=
Received: from BN6PR11CA0061.namprd11.prod.outlook.com (2603:10b6:404:f7::23)
 by MWHPR12MB1886.namprd12.prod.outlook.com (2603:10b6:300:10f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 15:41:24 +0000
Received: from BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f7:cafe::3) by BN6PR11CA0061.outlook.office365.com
 (2603:10b6:404:f7::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Mon, 27 Sep 2021 15:41:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT031.mail.protection.outlook.com (10.13.177.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 15:41:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 27 Sep
 2021 10:41:20 -0500
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Mon, 27 Sep 2021 10:41:19 -0500
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <jani.nikula@intel.com>
CC: <harry.wentland@amd.com>, <Nicholas.Kazlauskas@amd.com>,
 <wayne.lin@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>
Subject: [PATCH v2] drm/dp: Add Additional DP2 Headers
Date: Mon, 27 Sep 2021 11:39:41 -0400
Message-ID: <20210927153941.2231704-1-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b8a0a3c-c58a-4232-97fb-08d981cd42d2
X-MS-TrafficTypeDiagnostic: MWHPR12MB1886:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1886AD9B35DD30A546E0DE37E5A79@MWHPR12MB1886.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: REtI7GR5AtOz4Hlwl/1Fmkw7yyE4u4o5CjUDux8aYLAtkrklL/ayoW4H30//6iJKKItOE0mRiNY2R9HpQs1vMDFs/i8KaZXCVNvFShKWv00LhSMhESd6yNSnkqU9p/30hNUluapzjxFXKZweLXot77bdSZXg+Ze0tzCgXaIgjRzsKMkmFJn808sO530uML53fIXRjh3Ge2nnx22AsKUYLl8UedQ+kWhUNvdiyL/xcq7lzL7gV2igxZx30X0zHLg8eANOOTSb+pybsAlKYzTFDpyCrASGPWkk1MuUGeuZm0798e6rAKS3M+PS1ydjl26eeLPaav9w0ZiCFI+oifMQhJbu1biZ3POtbxZyhbbz79WdlEuvCPrAPHfenq9eYVpx3ujhgfBIdJxIdqJfVA07cuZZcgdCjXcA5rbOdKAfWjWjnlkiF2AWQynvO25Jo/uxCdpTUbaJQLaNtolEuciXfdsJtCdwQNPGVI8WIBmJxv0Emwye+DdZ1sasBE9TLsbL5YqgpK5aqG/ORbAWdl/LuPpJHMNKwC7OCl/pzMNqvnZf+t+hiJvjqtmQ6Em9EX4EZfOp98o/lpk+EhpUBSPy8i3n4BRpJ0TQY4IjMA/Lu555FVBZwsNeBb3iUDXSf/nRd1u5Nu82Q2TkObZWxq5TVbOrJd6LdLfPLQOENwNyc22aH/hTDpJ2hMzmA/6ZAyX7kxy1xG5S5oq5RKh/2VAFCjOpuP+Arfz6AikNdYPIUOykKX6uR60lzPEMxGwQRoUS
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(8676002)(110136005)(8936002)(47076005)(2616005)(70206006)(508600001)(426003)(36756003)(6666004)(356005)(70586007)(336012)(83380400001)(7696005)(5660300002)(2906002)(316002)(36860700001)(4326008)(54906003)(81166007)(1076003)(26005)(82310400003)(86362001)(186003)(21314003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 15:41:23.8572 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8a0a3c-c58a-4232-97fb-08d981cd42d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1886
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

Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
---
This patch is based on top of the other DP2.0 work in
"drm/dp: add LTTPR DP 2.0 DPCD addresses"
---
 include/drm/drm_dp_helper.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 1d5b3dbb6e56..f1fd9889f190 100644
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
+#define DP_DSC_SUPPORT_AND_DECODER_COUNT			0x2260	/* 2.0 */
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

