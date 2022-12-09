Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE07648A74
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 23:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E3410E58E;
	Fri,  9 Dec 2022 22:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5829010E1FF;
 Fri,  9 Dec 2022 22:01:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTCzv/AzdcQwCtFsQ1eVcSkIUvweaQU0drU20qIj6OfIA4XI6hxiC0ylii3fh+qzzCFXxIIrw/f9HxDzZVLKtOKngvnlC86czkHjnYgcWwUji8wYbS2WfmitINpM0EQHXnGMofrBb68o/GplUuQexNqglUMdkwF0Fn+MlXyafh+t72nYiEhgwWcOEaX09/EGvqpa7Lbpjhz3BXyf2F9zgjAr7sJrdOiPpHNtIy9x1I2ln88MSn6a018ZukrOm83Fmb+b0q0hT+AVPgfhhVNa2mgU0cmG1GZ7Uv5oqu7LTX+YTRB9fAA2aiQg/qtw4YrRRCu6F8DPL4OIGu1PqAfyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIAGPF9i6eNfrLobLtUp3VG8Lo/zlgo31BBZ4Cam7CI=;
 b=Q3JlBFKxLiGG/qlZUNMtrEynuRiczvGHUVm9CK6+GIohNZzcQ+QUrM+P6SB0jZrRkmrodUgsroirPTxc/qIsySX3asCd20Y01l4VSysPLYNkapWcZgigGDFdex/4DXGXZ4jIVJNrcg40PibeVqyav8W2GPXuo+uMdzWua/Fxzy7YnQH1JxawygiCDpg8SxfjP9/xQZEUfjSjmBP17QKiJsZQTVJ/edZS6uuDfpdIULpccGTAUKcOQ4DDF1JnPMeB/t8xLLpbsgvYJY4ln5qmJGEtaonf+pbLY1BKLnxUSeTyFw2HlHFVkD2T3EsdU/zdC7h4YtV8Va31Ey5DNeanZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIAGPF9i6eNfrLobLtUp3VG8Lo/zlgo31BBZ4Cam7CI=;
 b=pJGmaX79vGu2mp6o7mUaMk5gDK+6KNEeQoA8+VDmPgU5L+HBT3PvnrTU1pwDy1rZLtR4P0Dsmt6D31uLqfHcJLrjXULdWN2z/ga0ZRF+QQVlPjGF/UYXxJjXxbVOuKtxx8aqGh0kactNoun3hXjHC81Ar0iU5cipOGCyuAAa5f0=
Received: from DM6PR05CA0040.namprd05.prod.outlook.com (2603:10b6:5:335::9) by
 DM6PR12MB4356.namprd12.prod.outlook.com (2603:10b6:5:2aa::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14; Fri, 9 Dec 2022 22:01:10 +0000
Received: from DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::26) by DM6PR05CA0040.outlook.office365.com
 (2603:10b6:5:335::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.5 via Frontend
 Transport; Fri, 9 Dec 2022 22:01:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT025.mail.protection.outlook.com (10.13.172.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.17 via Frontend Transport; Fri, 9 Dec 2022 22:01:10 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 9 Dec
 2022 16:01:09 -0600
From: Sung Joon Kim <Sungjoon.Kim@amd.com>
To: <harry.wentland@amd.com>, <rodrigo.siqueira@amd.com>,
 <alexander.deucher@amd.com>
Subject: [PATCH v2] drm/display: Add missing Adaptive Sync DPCD definitions
Date: Fri, 9 Dec 2022 17:00:21 -0500
Message-ID: <20221209220021.4413-1-Sungjoon.Kim@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT025:EE_|DM6PR12MB4356:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c1d7671-574d-4cd5-976c-08dada30e190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GXz4vmcowVS2zYS00udNRRb+a136eWjLMZwS6bucH8l+H7VKaiPcXXfBBnwkjBdMKfdkSaBr4fVj6rkl0Bx0NDAgBSsYlweNwoAqO1GAPXYdQNJp0p/9TPH21MuUi7nbbUJFvpVwWOR2ANAAqwYu093PWZSYrYSxjl406kRRaLPQ/hd7Tz4O3qlEWxryqRmvQ9p4Wg5x5p7Mzk5YSF1IuIV8g0Z8tOFXHc2XnV3SRhIu7fljKd0lGV23vGuEnF1sQIDOx9FnoFG8SRBQ+HG9G98y4zYCQWSCoUrYQAM7tAB/SnbzvXVij1JNRKEdGi7IfPL5oQ4riNcgqf/oHteG/N7j7Pppu2M+/tF2j8YqOHZpB0BdyjZGvo3Y+Znh8k0yjSU/CmFGLTg5j4n1pRRpdHmyRufffHCHG/47RLIRftHvdg3ZrkRW7LNPKuX0HNNJdIayDO2B5bjpNUnX7HZ4k7xcUPujAkkk2uG13L3ykQWT/qb0BocriK6yGzzehDVrbd6aCZVSS80P/M8qD/yMEBhMRHbghXIsRRCo4yWW3dFyVC4NDSccgBD2Ebw4Ba5eVD1wzgzcr0ZvgiI09VPo3CvkJQsLWtTeV8Y8C+80mXJelty56Xm5PWMXQwJNIzJjpwTlVQspym/hAv/RtZ+K1HOHMcA2OYWpQG+4A2mfEBZu7E/5ag3AGkAF0g4reINDnnQKLv42Yq2ev8L72+e60PP4ZO3AczYyrb0SRtMJ3bI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199015)(36840700001)(46966006)(40470700004)(81166007)(40480700001)(36756003)(41300700001)(86362001)(478600001)(26005)(70206006)(70586007)(5660300002)(316002)(4326008)(54906003)(6636002)(450100002)(8936002)(2906002)(6666004)(110136005)(8676002)(356005)(1076003)(2616005)(82310400005)(82740400003)(336012)(36860700001)(16526019)(426003)(186003)(40460700003)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 22:01:10.3200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1d7671-574d-4cd5-976c-08dada30e190
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4356
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
Cc: Sung Joon Kim <Sungjoon.Kim@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, nikola.cornij@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The missing DPCD defintions from DP2.0 spec is as follows:

DOWNSPREAD_CTRL (107h):
	FIXED_VTOTAL_AS_SDP_EN_IN_PR_ACTIVE (bit 6)
		For sink devices that support Adaptive-Sync operation
		and Panel Replay

DPRX_FEATURE_ENUMERATION_LIST_CONT_1 (2214h):
	ADAPTIVE_SYNC_SDP_SUPPORTED (bit 0)
		Bit to check sink device has Adaptive-Sync capability
	AS_SDP_FIRST_HALF_LINE_OR_3840_PIXEL_CYCLE_WINDOW_NOT_SUPPORTED (bit 1)
		A sink device that clears this bit will generate VSync pulse
		leading edge of the HDMI output on the line count at which
		Adaptive-Sync SDP is received as long as source device transmits
		Adaptive-Sync SDP either in first line or first 3840 pixel cycles
		of the line whichever occurs first.
	VSC_EXT_SDP_FRAMEWORK_VERSION_1_SUPPORTED (bit 4)
		Bit to check sink device has SDP framework version 1 capability
---
 include/drm/display/drm_dp.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 4d0abe4c7ea9..1bd6f9af0b46 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -603,6 +603,7 @@
 
 #define DP_DOWNSPREAD_CTRL		    0x107
 # define DP_SPREAD_AMP_0_5		    (1 << 4)
+# define DP_FIXED_VTOTAL_AS_SDP_EN_IN_PR_ACTIVE  (1 << 6)
 # define DP_MSA_TIMING_PAR_IGNORE_EN	    (1 << 7) /* eDP */
 
 #define DP_MAIN_LINK_CHANNEL_CODING_SET	    0x108
@@ -1105,6 +1106,11 @@
 # define DP_VSC_EXT_CEA_SDP_SUPPORTED			(1 << 6)  /* DP 1.4 */
 # define DP_VSC_EXT_CEA_SDP_CHAINING_SUPPORTED		(1 << 7)  /* DP 1.4 */
 
+#define DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1         0x2214 /* 2.0 E11 */
+# define DP_ADAPTIVE_SYNC_SDP_SUPPORTED    (1 << 0)
+# define DP_AS_SDP_FIRST_HALF_LINE_OR_3840_PIXEL_CYCLE_WINDOW_NOT_SUPPORTED (1 << 1)
+# define DP_VSC_EXT_SDP_FRAMEWORK_VERSION_1_SUPPORTED  (1 << 4)
+
 #define DP_128B132B_SUPPORTED_LINK_RATES       0x2215 /* 2.0 */
 # define DP_UHBR10                             (1 << 0)
 # define DP_UHBR20                             (1 << 1)
-- 
2.20.1

