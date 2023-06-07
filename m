Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC50726472
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2ECC10E50E;
	Wed,  7 Jun 2023 15:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2077.outbound.protection.outlook.com [40.107.212.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C46E10E16B;
 Wed,  7 Jun 2023 15:26:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7cZXkhjS8eznZLL01iprMHmun2FWdEqCohqZ+hbiSFAnF6L837Za+QT+s4nTL9CQH5YXrNwcW+tT07gs7Jm1ABEw0NJdraecxu60y1NRM0h3oFwD5C1oEAqFIjw3ovHEJ8E0oi6MhbluIOpE5vDiazQLVAo5AifJeQeOVEdzjUGwSs8c9OFrfCPgSyqEgxaBHUqzbVc6RCHckHXxkOXXpKBegaGFhtdi45DJ5fPN3F3LVmRy1/8csSdr/3DDuABywKYSL6A4AEXtgspXHNgxlhKziMW6sJrUbxJ19fXxdcoZJOA6YbQh8RDSOZhFDOTTrUgzzvZwzdOdEzP5tq58w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnSjvk0QnkXeJ3C8gHlaUqYPH6eYPumOkutvCPRrEGs=;
 b=ES4BeUAoD3/JZbfKj2PWHIx2Jbq4ZuKmtzq/o3OIRFX/Qdywpppzw+QCQkgYfkt+daD353NvgMwThayB1n+5j80wxzqY2gCaiy2LlDCl9Kt7/s0kfS+M9BbYCNDepLKSnNe4tqyby7Ex1ET4eUhVdVgSqLblR8BQ6EPYP2nlHDUi0toR5rsUrfsyuX6UHODWlgdFysWPzARo7zvGpyoZx+B6WMw39Soqe6M4ZIjnu/W6T0AO2aOOCJoZL34JCMRXoc0X9y3bX1jZylRMLaYr8PTJm7TVyx+0vswZgS50OmG42rvbS0tvvjxOT+heptPYVcd0LLSQPgvEg56fRqJ1Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnSjvk0QnkXeJ3C8gHlaUqYPH6eYPumOkutvCPRrEGs=;
 b=HMrZLpXgUNrAmixSTI7qfLOC66ArIUGLK6a5/2USlrkipenvPiFhZZkqNMZ9ut6lWgRI5KIhLat1gckVvrzef2cOsb6DeCjTTo76PHeKqNepu13bq0XwLb1aFmHvW2+hw8si8UUbGLfidU+SSkzpP4o53UBhivnHxEnzHWKyLCs=
Received: from MW4P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::28)
 by MW3PR12MB4588.namprd12.prod.outlook.com (2603:10b6:303:2e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Wed, 7 Jun
 2023 15:26:22 +0000
Received: from CO1NAM11FT104.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::64) by MW4P220CA0023.outlook.office365.com
 (2603:10b6:303:115::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Wed, 7 Jun 2023 15:26:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT104.mail.protection.outlook.com (10.13.174.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.35 via Frontend Transport; Wed, 7 Jun 2023 15:26:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 10:26:21 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Jun 2023 10:26:20 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 01/13] drm/connector: Convert DRM_MODE_COLORIMETRY to enum
Date: Wed, 7 Jun 2023 11:26:05 -0400
Message-ID: <20230607152617.997573-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230607152617.997573-1-harry.wentland@amd.com>
References: <20230607152617.997573-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT104:EE_|MW3PR12MB4588:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e8bbdce-c32f-4ba8-9ab5-08db676b8cda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +V4GXeFwAN9SjBnvVCkQWE38SuLDaaHBW9Me3+eW84P38Emw3PSkKW7RafcRbYbMLwlQPDpJJ5Q1c2399SJRcnmknGgtHH0iJIRWLRHB33OyGuHWFbtRpBdS+Ea+hUwBXugp7XrftqxJI2JRUUJhZKnrCn42JU17QQnn/HHaRikYYpLyeUJP0iISvAtETuBO45Iwayg6KpajAVdDkniLix/aZH4o/euBot+Ba/gHXyrT0TVI8n3qlIbqZ7ikay65OLyJ8G1JYoCb6YN2bxfUP4yep4UirOKC4X+lKUl9XVoXm6gG8UPWwyIsAA7dWulhp/xlNuNBnMQnqDgz/mtYSWNTQKx0+Tx7IcKva4EWTD9t7n+GphnMLze9KqVrC14RIp7JSzKrLp0jPwP4H14aE5GJNOsduTaC4MdOD+3AnqtyuLFEzphGcQ53BhvTo1h4kPsUSBC3T2oUDvwBEJjOEb2EiL+J837f4yHKE5OjEBmuZ4UuSSIpPSmnNFLnpprLEmSYqCChkGsBM3GBRA2NAOP6+El4XFkEXfuj/Gw0R9nINDzjgu9xL7iMvDegfTZ3wMcdwuxkTTxRO3qHT/7qRtWli8AYVoJdzkFFY8m84W/PpA1yHsETookTRhVQHoDr0Rjqpe8e54xHITfrOOu10+39JEDDyRS+2Avmh3iRA5xw9YXuBjXAezD4UbC5jef0udi9xomx0DSn3jPfoMtuwyg+vWKVdqfJcmGln++45bU6Uq1fnhV2k4Y7+Pc1VCTNFz/6tKcnpGd1MQ1zDENTaA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199021)(46966006)(36840700001)(40470700004)(54906003)(110136005)(66899021)(40460700003)(478600001)(8936002)(8676002)(5660300002)(44832011)(7416002)(86362001)(36756003)(2906002)(82310400005)(4326008)(70586007)(70206006)(316002)(82740400003)(356005)(81166007)(40480700001)(41300700001)(66574015)(26005)(47076005)(1076003)(186003)(36860700001)(2616005)(83380400001)(426003)(336012)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 15:26:22.3793 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8bbdce-c32f-4ba8-9ab5-08db676b8cda
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT104.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4588
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
 Pekka Paalanen <pekka.paalanen@collabora.com>, Melissa Wen <mwen@igalia.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, Joshua Ashton <joshua@froggi.es>
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
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Reviewed-by: Joshua Ashton <joshua@froggi.es>

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
2.41.0

