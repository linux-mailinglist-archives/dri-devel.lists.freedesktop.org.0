Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A77F0724E03
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900A910E3B3;
	Tue,  6 Jun 2023 20:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1C810E3B0;
 Tue,  6 Jun 2023 20:26:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxRhbDbMJ356/WVp1P1C90lmdnLBeY3qqZEp9QoFIq0/HOAAxL0stJdzpHmyVU1H+3Zl2boEkQkrWzPN/VEMHCx0tKQ2uNwDbEYx0cJHpSEIDK5Yh+2zTsqjrt+wjvDn2kuYTZBmhg2GV+1g8Ar0dpP0PsQPm8cRuCtgDki43KROhq3uoLAmnHPO6NZIkSCoa0CAlQlxi+Z+OFW5wy9QfdnLQVx9PsNkQh01wX3vofia/Y5Fy9vgPj/PSYFPFT+/tAz18TaoQMUaFyRmYwBK6pwLBJp6Wwd+IW6j+O/+copsc1xHtg9ZV+BsGhAZhi6z0F9y5GSQHnEDXSw+UgMsyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIN0/SKkxZnfTVNzOeU/i3NodKVfBXcBL2MKg5tjtsY=;
 b=bcmXylKkkCCGyqHz2EWEsSQlRqPI18Ca9f+siV7pS9pCveLtynRlvXnNHiU6S3iQ4VplvLTdEWVd5hGJ0aqf1StMmi/ieyfFY7dce2x4LL4wCJZsVtS7nMaJ5ZCmDHSFblbKdAlRyWxt51oJJ/mW0sOPZmsRo8CZUm4RgV23e3kcIzBkrNtLgiHSMLN1jVOgJ1VMabb2Ha2yc7nuTaFWKsjqRQuCxnA2oqGssit0+7SnM4Rig2TMx8BKWDwcKMAHZ+GlPEkgtQKDqN/wIMcXYUiE+mj6WEpZ3VQmLPDtPFjYGJo+lYBAkm/lgpW+yJWlq9Tasdwi5iIqU9p2nkaLog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIN0/SKkxZnfTVNzOeU/i3NodKVfBXcBL2MKg5tjtsY=;
 b=qPLCVR3UVMVMzjy5zEvV2/91MDWhU3DJOIHiDXfx8dzvhSXbfwi0NMW2M8sZ+sd684B7WnubyYk9RF9r/kaEeHL5iSwh64tkOXxVBVrOZDjcB9wIWGCmhHo4GM/hl1LRB7iYtkaJG9aBlxXqoIt9uT0KeszX437COsQNubBIdf8=
Received: from BN0PR08CA0017.namprd08.prod.outlook.com (2603:10b6:408:142::24)
 by DM6PR12MB4138.namprd12.prod.outlook.com (2603:10b6:5:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 20:26:13 +0000
Received: from BN8NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::80) by BN0PR08CA0017.outlook.office365.com
 (2603:10b6:408:142::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Tue, 6 Jun 2023 20:26:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT079.mail.protection.outlook.com (10.13.177.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Tue, 6 Jun 2023 20:26:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 15:26:12 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 15:26:11 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 01/13] drm/connector: Convert DRM_MODE_COLORIMETRY to enum
Date: Tue, 6 Jun 2023 16:25:55 -0400
Message-ID: <20230606202607.122914-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230606202607.122914-1-harry.wentland@amd.com>
References: <20230606202607.122914-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT079:EE_|DM6PR12MB4138:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e7f859-cfd0-44ac-9171-08db66cc455d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GhiHHWi9bmyRjjRFqYOeAXoeFpcBlNnIixgOo/iUIq9xj9/5u6OsHuyetFCOA8bD1ZUGnLmzMpngrEr5VC3TU1ctE5vTXIU0Ol5u489RSBdyMeND+HZMqvcWuQFl3t3kHOERC4fDxnEuxXgNmMZhRKg8pX1Ef5sUiRc9bKz2uWLodxItzJtn3Acl+nRIJdr1VcFvDgksuuVIwoClSgkEoalX7jTU6pvFzLhi8fB/eaHaz7DJhpespnx5EmIXMLFoYoXfSXvHuEK/g91gb+WKfOXlFXNHyksqpyKj2Z4ZdUn4pBTO8dxJm2/GquGk7Sg/6o3lLHeGgb3gcwA/b1OlHpqlVUDr0vz8wfgobZqzzfLXPjcde+m/i3KDvAQgLkcc5uXAmopbPT0q2WgPEYCUUQM4W2u7j07XG9JY4uD3rykX2PKE2IdLyE6JLQHteBUYpP8v7hwFl/KNI6EvESs+uMgf/4xxOoNnygAOrtJOAJl/Ekl76Lm/QmZ2YWr9fmhKAOO72gK2CjDYgw7M9k9uI1Rnue7iyn9cgGjj5BMqHffTF1E6I276aRUH0zFp+NQc9j94h2jQQIH1nS3iii1ekU97/8t928PE7m9VaGAm11QszWrWss7TngJV6jfRqdhD7lLvEbNkwH2BFwoLzH00OOWYpsy4L+C6Voy4IamIVALUsqgCvS7Fclkp8DbLa0rbt3avTuLiyRNYLOTcdE5PQJ6so0oG4ISEgvqfMBT3R6WXZ6qEy+ZL51joptG+1v3co+hoMOf9dGOnCMJIKeaVtA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(36756003)(2906002)(82310400005)(86362001)(5660300002)(7416002)(44832011)(66899021)(40480700001)(6666004)(40460700003)(83380400001)(1076003)(426003)(336012)(36860700001)(66574015)(26005)(81166007)(478600001)(356005)(82740400003)(316002)(54906003)(110136005)(70586007)(186003)(41300700001)(4326008)(2616005)(70206006)(47076005)(8676002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 20:26:12.4928 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e7f859-cfd0-44ac-9171-08db66cc455d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4138
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
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>

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
2.41.0

