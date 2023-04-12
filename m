Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E246DE866
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 02:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7424910E6D3;
	Wed, 12 Apr 2023 00:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F112B10E6D3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 00:10:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUU8YdRxFr8uf+Ao4zba39BvJm4zyIxed/i9ZfPTFKZCFMUxezBYtFH6gZ66xEA5f+LtvTPxr3Z0UdoB3/L1y1prUQj2aL95FtZvIvDdsPt5xsodRaqt3iD+vxa+EoEkdwg+gX7v5KG9H10D8rVT6lZBDkgPqci+OlMIPczEOX00QYWQ5DVrkk17VbmXdFPeplS2RwuJWxUCKkdddoZJGT/ODhrC2VwXRUdLverZHFb2ltEZg2QotByuKcbQOtff0FqFAFGjdULp5qkiH/EtsMlARB/0GZigGlIgL6QVatrpeOJMmTvI2ZdPYJrRZW5qmwXEOv2sONM4BZRWNhmjtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E95oua5PmlULaxqqutfKvb+BXc2C/6aGLoleJj1x0pI=;
 b=kFWatfzcXGlfEBNPDlPnQeuAnevvWfAhB5SaAE76c9J6Mh0NDm3WVa3mbsQ51vmzFDScKkHZUvyGnCsyp+B5iRS8T/P4fwhf85OPqy+d3ZH2g942pY+EDxJPag6n+9dM4glFXUpzzzfrzNUmyrPlBykLvc67rDesi/9ez373VsxhMlkVBr/2qAuMU6Xf8SFAt2Pd7AFXVT6didwk1yeWg9QjQGJLtt2rVX8t+EpnyLDSS1VSYyrhX6t44hNmt/phu4LCKQc8K5hTHcQUNd0P/lusbBLbEXaf3lgrvRdLtSuPiSvWqqr1pqNEwKNRUXHPfbXP7Z7h68sQQnxbYhyv1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E95oua5PmlULaxqqutfKvb+BXc2C/6aGLoleJj1x0pI=;
 b=D3yw4LrSG/aDPZODt2SnbhYE1ItaW31wpjGrRi1vjRjsb2Rd85NOKZ/De8AobDBtNIPulbDORE0chqDGrTrPyNaY5qWcWQqOxQJ8/b7hjc563ZnUIQkk9oRQdTweABAd9hYw9rJD0wNb/c1OjWajuejoBsLmaxqG3B5ntj8Qfx8=
Received: from DS7PR03CA0257.namprd03.prod.outlook.com (2603:10b6:5:3b3::22)
 by SN7PR12MB6909.namprd12.prod.outlook.com (2603:10b6:806:263::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Wed, 12 Apr
 2023 00:10:24 +0000
Received: from DM6NAM11FT105.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::af) by DS7PR03CA0257.outlook.office365.com
 (2603:10b6:5:3b3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35 via Frontend
 Transport; Wed, 12 Apr 2023 00:10:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT105.mail.protection.outlook.com (10.13.173.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.29 via Frontend Transport; Wed, 12 Apr 2023 00:10:24 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 19:10:22 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v2] drm/display: Add missing OLED Vesa brightnesses definitions
Date: Tue, 11 Apr 2023 18:09:43 -0600
Message-ID: <20230412000943.429031-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT105:EE_|SN7PR12MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: ae2418a0-7b47-4388-13d6-08db3aea4ff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q7PboFcve4o+7Ne1MazbcJNL7lkWXXPZpM+kidXuwojg9YTXMosJCDIdeEcLZqu7XNGvAwIag1VBI3TcZkjhRpIxFCK9pL6noHDPAI3yqYB0/jObaxGYs2fm9J5rSNmylZtiqEzJLZMFkvDcO5iu9t1VUwXwUvuvE2voLrq/N9w8U6M81awDycbJvAlhxLQ6y5angTXt3vrLKjrE3kbuknn8RNjQp06BHZkd2aVzdabmGx0tmRbI8xomiP1EGUhzCqYFN79dnyIPi8xlZ+9mG2OjKqf63iN2ZBlpMbahg0C5G5cXqNKrz2L4mfTgGnhQH6zYUIYYQhTie4uR1Oex0bRJx+TI8NoXS7AhX/9iFyscPKLROFWm+i6Lfl8oYOg+rhaEtKG+udqqJVLgmd5hEIGhP5cxj+dB2xGzmlgrFoBKX2IH3vR5N2zWyOGVmKJsVLhDFmqVYCYtM78hmPv4X9BTXt+g6XxgrKkpQdYJcCjZX+iD8D/BpPApzGWo4Gw6EO3pGRSAVFV0KRTVVkDNQaYidClF25ia1RGB6ABGIJhJtHreguItuYOdu9aiZZQ+sf24kduRygYvPUwuLc+QR6nHcHlbBdV00OJNycNeW6nOq3r+LRD/yfrw76uNGiPRiZyZD3hHwc6fICQZ0Pge54FRgZzYtIZIH6nesZij3NwQVQl6cyytYvvg+QPOWf0F6EhnAgigLISoTKI8oFs+KOWPluOa8XQRUnXQ1jNeGfQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199021)(36840700001)(40470700004)(46966006)(66899021)(40460700003)(54906003)(8676002)(4326008)(70586007)(70206006)(478600001)(41300700001)(110136005)(316002)(36756003)(86362001)(83380400001)(336012)(2616005)(426003)(26005)(1076003)(6666004)(47076005)(8936002)(2906002)(82310400005)(5660300002)(40480700001)(36860700001)(16526019)(186003)(82740400003)(81166007)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 00:10:24.0692 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2418a0-7b47-4388-13d6-08db3aea4ff8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT105.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6909
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
Cc: Felipe Clark <felipe.clark@amd.com>,
 Iswara Negulendran <iswara.nagulendran@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Anthony Koo <anthony.koo@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit adds missing luminance control registers to enable a more
standard way (VESA) to deal with eDP luminance control.

Cc: Anthony Koo <anthony.koo@amd.com>
Cc: Iswara Negulendran <iswara.nagulendran@amd.com>
Cc: Felipe Clark <felipe.clark@amd.com>
Cc: Harry Wentland <Harry.Wentland@amd.com>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 include/drm/display/drm_dp.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index ed10e6b6f99d..7ad749423a48 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -973,6 +973,7 @@
 
 #define DP_EDP_GENERAL_CAP_2		    0x703
 # define DP_EDP_OVERDRIVE_ENGINE_ENABLED		(1 << 0)
+# define DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE		(1<<4)
 
 #define DP_EDP_GENERAL_CAP_3		    0x704    /* eDP 1.4 */
 # define DP_EDP_X_REGION_CAP_MASK			(0xf << 0)
@@ -998,6 +999,7 @@
 # define DP_EDP_DYNAMIC_BACKLIGHT_ENABLE		(1 << 4)
 # define DP_EDP_REGIONAL_BACKLIGHT_ENABLE		(1 << 5)
 # define DP_EDP_UPDATE_REGION_BRIGHTNESS		(1 << 6) /* eDP 1.4 */
+# define DP_EDP_PANEL_LUMINANCE_CONTROL_ENABLE		(1<<7)
 
 #define DP_EDP_BACKLIGHT_BRIGHTNESS_MSB     0x722
 #define DP_EDP_BACKLIGHT_BRIGHTNESS_LSB     0x723
@@ -1022,6 +1024,7 @@
 
 #define DP_EDP_DBC_MINIMUM_BRIGHTNESS_SET   0x732
 #define DP_EDP_DBC_MAXIMUM_BRIGHTNESS_SET   0x733
+#define DP_EDP_PANEL_TARGET_LUMINANCE_VALUE 0x734
 
 #define DP_EDP_REGIONAL_BACKLIGHT_BASE      0x740    /* eDP 1.4 */
 #define DP_EDP_REGIONAL_BACKLIGHT_0	    0x741    /* eDP 1.4 */
-- 
2.39.2

