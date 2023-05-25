Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B47711719
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 21:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4580010E041;
	Thu, 25 May 2023 19:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02EE89BA3;
 Thu, 25 May 2023 19:18:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8ncMnT+OudNBHuz4S8DBLcW6pnlwXASd7WdUqfB9ezydu+ijqAA22PiXYxt2oJcRIZyqce/9qLVfno0gP/zB1o9b1AqeHr8dSeZBJelhmXxcvRNaiz/S0l/R8yDtlWyiOFQmUfxa2xv9thVpzEF68bvsvImS7pjoVoCfW/LW+KTo2lTSmVK/BGUElehb1GiDk07FgyuDwzEwA1UE13WmUyhWAmDgmEQqvCeBABGXTLmCtmLrXnJXoclgr+yJ+qFGlr4ydUeITHeDBNfj9EThLdj3EDCwAumBwMeNlHG+TdcFde1fxUzWqHtNPE/m7ozvC7RTbtZpl9rR7OvR3FKng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QD9EOo5Yp5nCPf5QL6AS1SbQdT/nsZr1xxSyDY8JqZY=;
 b=g0RTM0WSgAMJVaEtDuydRQmRrHAIpnpZP1f7SfkcYmn4QBWrq3EaSLHubvq81KF3tGhbKkGaIb70l7WhfBHUpKTW48PBC7tQiWFMhjKZ5M7mSA90yrqN4FgOCpr4XLiXSw7pDyxQdAx9DL+u9JYC47drBZypXr7M/jbLq69gwifUvBD4fEpQzrpVvjKXOE2cFysOKSgXLKeWFnmmvt3zkXUIcv+Q6Mtwhw2Pn6/At/S2F4R0MDQKe6VLjL8cokY2+B+hTQ/IdNJelZtO+njJEeQPYKI4TK8i2/Ymo9qCM1WNsUMMMBDG5O4B1YQgLbASa0rfkDHd4GY31xQ+xh8v1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QD9EOo5Yp5nCPf5QL6AS1SbQdT/nsZr1xxSyDY8JqZY=;
 b=mRHlsmLVyW+teFECqj1Z5jiQLBOZsSwqTHFnQEDvrcH1XYufYqiLFrAo4MaVy+3ZJ4mWit9HV8AoIQ7IP1ppps756yg9rEiQOSaSH+J/XACUI0jF0eV4BIFGNhh1y4db16+twVBGLM4mRd51Xx+fiXcvej7urXOZOV//mIOsV/Y=
Received: from DM6PR11CA0029.namprd11.prod.outlook.com (2603:10b6:5:190::42)
 by DS7PR12MB8203.namprd12.prod.outlook.com (2603:10b6:8:e1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 19:18:24 +0000
Received: from DM6NAM11FT078.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::eb) by DM6PR11CA0029.outlook.office365.com
 (2603:10b6:5:190::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16 via Frontend
 Transport; Thu, 25 May 2023 19:18:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT078.mail.protection.outlook.com (10.13.173.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.16 via Frontend Transport; Thu, 25 May 2023 19:18:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:18:23 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:18:23 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 25 May 2023 14:18:21 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 01/13] drm/connector: Convert DRM_MODE_COLORIMETRY to enum
Date: Thu, 25 May 2023 15:17:57 -0400
Message-ID: <20230525191809.3524-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525191809.3524-1-harry.wentland@amd.com>
References: <20230525191809.3524-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT078:EE_|DS7PR12MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 743304eb-2a54-4ac3-a3c9-08db5d54cf69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v7tvYjKei5nfLsv8El3Sckct0vfzaAEjv3zBuLaCLaJb26OUawEEvHpG2um9JLr14MiG3NBlOdPANPvk11tLSQ6kX8fDv/Kt2PXHDRudsF0pTFybhJf5BHzOdbFqIU76MlEqXICf6qE1DwFC58LX+CaineCWuvuMogCylzQhHbYJTXsZl42ifMwxiXUamGO/qMcj86J7sBb3njmxbFGnqaGWqF1G6nhwXDKp1tQPYPOTA7agwzzkvl0Nc2GLDf4lMx5xFFbdtQmaT1PtCXYB5+geUAoojk8UcXn24IYv/pWyF5zAE4q4ThKPZfUnbR14y/H3bQmbViUZ5WuAFzQ32JNywM98shkFB9mXA2AVJoYPm7gG8BgcW+8BMN6fSa0kTFl86xjJTHePuiUIwWw9UxNjTpvLlTB46vYKonL3WphESYjmDjdrORZCMRPUNZD+do5Ls9jsLTAUAHf+PMlrjlC6QA40rZqf6eWgr1WOJeNnMD7/2SkjP6kOh2wXStkqsTyw3Ep4cWt1k/RlgvNXcw0zY7n9Dvf9CIZJanvVVuw6qsEPgJDGiwRzZI09kIxvp/uGs1NYDGTce9cXO1WBCiQSy9UtVBN8q+GFJx9zcgU2igc0MbNbtAk9sMsd4lUePtRNwLBYD2A2D4lMvTsZW17rRCXMgML3Z1K2H+cXR6re89p1v+WjCSPJicB349J8gRt8xljmDUPvpG0OJP7Qfrs/Ja3VfVmaw1xIn6w+1wREUmEcSVfvrkwN7CmZPzdf/jcGHugW21TdWQZGBYIVAQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(70586007)(70206006)(4326008)(110136005)(40480700001)(82740400003)(66899021)(316002)(54906003)(478600001)(426003)(40460700003)(41300700001)(6666004)(186003)(86362001)(356005)(81166007)(1076003)(8936002)(8676002)(26005)(44832011)(7416002)(83380400001)(2906002)(82310400005)(336012)(66574015)(47076005)(36756003)(5660300002)(2616005)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 19:18:24.0718 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 743304eb-2a54-4ac3-a3c9-08db5d54cf69
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT078.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8203
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Melissa
 Wen <mwen@igalia.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>, Vitaly.Prosyak@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows us to use strongly typed arguments.

v2:
 - Bring NO_DATA back
 - Provide explicit enum values

v3:
- Drop unnecessary '&' from kerneldoc (emersion)

v4:
- Fix Normal Colorimetry comment

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Simon Ser <contact@emersion.fr>

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Simon Ser <contact@emersion.fr>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 include/drm/display/drm_dp.h |  2 +-
 include/drm/drm_connector.h  | 49 ++++++++++++++++++------------------
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index f1be179c5f1f..7f858352cb43 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1626,7 +1626,7 @@ enum dp_pixelformat {
  *
  * This enum is used to indicate DP VSC SDP Colorimetry formats.
  * It is based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16 through
- * DB18] and a name of enum member follows DRM_MODE_COLORIMETRY definition.
+ * DB18] and a name of enum member follows enum drm_colorimetry definition.
  *
  * @DP_COLORIMETRY_DEFAULT: sRGB (IEC 61966-2-1) or
  *                          ITU-R BT.601 colorimetry format
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 565cf9d3c550..77401e425341 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -371,29 +371,30 @@ enum drm_privacy_screen_status {
  * a colorspace property which will be created and exposed to
  * userspace.
  */
-
-/* For Default case, driver will set the colorspace */
-#define DRM_MODE_COLORIMETRY_DEFAULT			0
-/* CEA 861 Normal Colorimetry options */
-#define DRM_MODE_COLORIMETRY_NO_DATA			0
-#define DRM_MODE_COLORIMETRY_SMPTE_170M_YCC		1
-#define DRM_MODE_COLORIMETRY_BT709_YCC			2
-/* CEA 861 Extended Colorimetry Options */
-#define DRM_MODE_COLORIMETRY_XVYCC_601			3
-#define DRM_MODE_COLORIMETRY_XVYCC_709			4
-#define DRM_MODE_COLORIMETRY_SYCC_601			5
-#define DRM_MODE_COLORIMETRY_OPYCC_601			6
-#define DRM_MODE_COLORIMETRY_OPRGB			7
-#define DRM_MODE_COLORIMETRY_BT2020_CYCC		8
-#define DRM_MODE_COLORIMETRY_BT2020_RGB			9
-#define DRM_MODE_COLORIMETRY_BT2020_YCC			10
-/* Additional Colorimetry extension added as part of CTA 861.G */
-#define DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65		11
-#define DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER		12
-/* Additional Colorimetry Options added for DP 1.4a VSC Colorimetry Format */
-#define DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED		13
-#define DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT		14
-#define DRM_MODE_COLORIMETRY_BT601_YCC			15
+enum drm_colorspace {
+	/* For Default case, driver will set the colorspace */
+	DRM_MODE_COLORIMETRY_DEFAULT 		= 0,
+	/* CEA 861 Normal Colorimetry options */
+	DRM_MODE_COLORIMETRY_NO_DATA		= 0,
+	DRM_MODE_COLORIMETRY_SMPTE_170M_YCC	= 1,
+	DRM_MODE_COLORIMETRY_BT709_YCC		= 2,
+	/* CEA 861 Extended Colorimetry Options */
+	DRM_MODE_COLORIMETRY_XVYCC_601		= 3,
+	DRM_MODE_COLORIMETRY_XVYCC_709		= 4,
+	DRM_MODE_COLORIMETRY_SYCC_601		= 5,
+	DRM_MODE_COLORIMETRY_OPYCC_601		= 6,
+	DRM_MODE_COLORIMETRY_OPRGB		= 7,
+	DRM_MODE_COLORIMETRY_BT2020_CYCC	= 8,
+	DRM_MODE_COLORIMETRY_BT2020_RGB		= 9,
+	DRM_MODE_COLORIMETRY_BT2020_YCC		= 10,
+	/* Additional Colorimetry extension added as part of CTA 861.G */
+	DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65	= 11,
+	DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER	= 12,
+	/* Additional Colorimetry Options added for DP 1.4a VSC Colorimetry Format */
+	DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED	= 13,
+	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT	= 14,
+	DRM_MODE_COLORIMETRY_BT601_YCC		= 15,
+};
 
 /**
  * enum drm_bus_flags - bus_flags info for &drm_display_info
@@ -828,7 +829,7 @@ struct drm_connector_state {
 	 * colorspace change on Sink. This is most commonly used to switch
 	 * to wider color gamuts like BT2020.
 	 */
-	u32 colorspace;
+	enum drm_colorspace colorspace;
 
 	/**
 	 * @writeback_job: Writeback job for writeback connectors
-- 
2.40.1

