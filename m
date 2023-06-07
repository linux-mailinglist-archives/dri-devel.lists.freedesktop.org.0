Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12003726473
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5475010E50F;
	Wed,  7 Jun 2023 15:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA12910E50A;
 Wed,  7 Jun 2023 15:26:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QlXjiTVd8UR/EquVE5Zlro0TrEQMczYh+lcP0/FB/2Kbn8wP/v349hLNWfEmwlkE8Tss5uzGVsvjOeMBIK1PcbCHUKgXnOIVicxttiaUhViqSii0IwQtIc0Lo6PGdZ5BUkvRfcchc2HYY22LkQYx7AFF0kvHHjsYacGxi5vbwjGsoXkeJywoDTU0yFt7WyJzodW432sbv0PB5w0E7zqNIPoRGDjunOQ2Z8UmyuWZX/MgNQ4uO+WAnC4SVndpMC6Il9aqJgXf7T2nFXl25ISy8tvWmNTlxo29wURgwrj4sRjTcxiipFipqNTBA8JQ/FUHxHmbKncqAmqvGq6P+RYUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpoDThbFgL/dq0K1vV2TWgr2FFpAW2XvxwC50PIpZcE=;
 b=ENnTbHqW5dJowGTTbndr2VOp4ecDypQU44BBHV7rrDrC6YxgNzj080LcWeRf8Hfoo7Rk85lZ8ELU0OGQTAf/NxGN54k0ISB/7TWM8z5ix6I0hmXpY9v7sr3VsYG5WrYON2MV3MljyEAx55LbXL3o9xgyDAQbWC7sWP5yCggWHWE0Ub3O4Car3ataBtdke0FSld7Tieosb3rvoqNYCc5oMnOJFugpIf5iKKOESE0Doj4LTses5yKkh4hV1xK1/v/le0yQP8dcoLpLa1IKY4KHO+QxEwkLkokKARQsDp39mtUk6LsVopM9wqG+lTK9w/gveq8IU1MVqAqONaj4DQEF+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpoDThbFgL/dq0K1vV2TWgr2FFpAW2XvxwC50PIpZcE=;
 b=WCopbdxgC8F5CuFkNngcLEVellpTpfyYM90NLwlM8AApbUtVlfqYX+L5f3LSXO++ZDTfULUUUIscUAi+iyHFodXJi0g54n2o85wk8oB9+pIQB3Dh/GXji4WSC4TNDcpvqZ8stk0BQbCMcs5D/bfI8+8F4emmn5Fz3v/x53p04/Y=
Received: from CY5PR15CA0119.namprd15.prod.outlook.com (2603:10b6:930:68::27)
 by SA1PR12MB8860.namprd12.prod.outlook.com (2603:10b6:806:38b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 15:26:23 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:930:68:cafe::ab) by CY5PR15CA0119.outlook.office365.com
 (2603:10b6:930:68::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Wed, 7 Jun 2023 15:26:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.13 via Frontend Transport; Wed, 7 Jun 2023 15:26:23 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 10:26:22 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 08:26:22 -0700
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Jun 2023 10:26:21 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 02/13] drm/connector: Add enum documentation to
 drm_colorspace
Date: Wed, 7 Jun 2023 11:26:06 -0400
Message-ID: <20230607152617.997573-3-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230607152617.997573-1-harry.wentland@amd.com>
References: <20230607152617.997573-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|SA1PR12MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: 8934fdab-202e-4fba-1634-08db676b8d3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dOAJ+S72su7uBY0+x0U1ghAv9j0dX3QK6SBhTZ6C2ibQiiWAZi1j8Ad7ChDsq6dBvR6alqCDck6slUCwkXQ2qMmcC584MTcLa95PuoFkDjspjlz98vg0rZGjzPWeggtS7WSls/ZmirJ2nv2y6LGt/7GL1GzI+VqVrsFthbEMV+59wmsFc2lHkGpNZsEggg3H7ndp/rJqwyufKIo5zpxke/vKXdlbYq8a/xJMlGXr6OPt9aguKyiD7VFwsAZmLUWWh/TTuqK4mzoqQprmY2VCaTk6cw6kunrmu7rhbb+0p7DR26F/Bke9t0b+irXUKvKV0Sz7gytWKSWyjHvtE2yX7wXGWjv/2m0ADecd74gxXe8HuiTo6M8HmV+/N2PKNAFZB/gL9pFC1OiTsA7iDSbf8XGN6tQSi/OPryNztq9m0lFIxF4yQryqDMOG9Sr3x77kDPXcSlvXVaFjTo+2bPUEUs8id53wcMrCAqq7teauEX33RsubunOPnOFdVhG2fJzkSbjqYNpVybAqykb8lou0fMpl9jAffx2dFRF0o4s5jvTGguPt00MV5rp4MFBSBqhA7JlCKMtwABd1pV+C2rJEHTsVlhfDruM0u/ITL2nSQAxhgK8SPb9te3N2ZNwl/owpRf9xtI4qBgcGGkdC+QziybD9V5pbJK1liEQjBOhfPygkhVvBE4HLIwtSszRmxpI9G1EnoOBB6EuN0x3mGGhHuJQjmYFSTVKa4pfGZUyPH/n/hfooHVVcjCPlFINWu+vT2hinYxZIlT6KUtpR841hMA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199021)(40470700004)(46966006)(36840700001)(36860700001)(47076005)(66574015)(83380400001)(86362001)(40480700001)(81166007)(82310400005)(82740400003)(40460700003)(478600001)(356005)(110136005)(41300700001)(6666004)(54906003)(8676002)(44832011)(4326008)(70586007)(5660300002)(8936002)(316002)(2906002)(70206006)(7416002)(2616005)(66899021)(26005)(336012)(1076003)(426003)(36756003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 15:26:23.0650 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8934fdab-202e-4fba-1634-08db676b8d3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8860
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

From: Joshua Ashton <joshua@froggi.es>

To match the other enums, and add more information about these values.

v2:
 - Specify where an enum entry comes from
 - Clarify DEFAULT and NO_DATA behavior
 - BT.2020 CYCC is "constant luminance"
 - correct type for BT.601

v4:
- drop DP/HDMI clarifications that might create
  more questions than answers

v5:
- Add note on YCC and RGB variants

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

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
 include/drm/drm_connector.h | 70 +++++++++++++++++++++++++++++++++++--
 1 file changed, 68 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 77401e425341..907f40851e80 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -363,13 +363,79 @@ enum drm_privacy_screen_status {
 	PRIVACY_SCREEN_ENABLED_LOCKED,
 };
 
-/*
- * This is a consolidated colorimetry list supported by HDMI and
+/**
+ * enum drm_colorspace - color space
+ *
+ * This enum is a consolidated colorimetry list supported by HDMI and
  * DP protocol standard. The respective connectors will register
  * a property with the subset of this list (supported by that
  * respective protocol). Userspace will set the colorspace through
  * a colorspace property which will be created and exposed to
  * userspace.
+ *
+ * DP definitions come from the DP v2.0 spec
+ * HDMI definitions come from the CTA-861-H spec
+ *
+ * A note on YCC and RGB variants:
+ *
+ * Since userspace is not aware of the encoding on the wire
+ * (RGB or YCbCr), drivers are free to pick the appropriate
+ * variant, regardless of what userspace selects. E.g., if
+ * BT2020_RGB is selected by userspace a driver will pick
+ * BT2020_YCC if the encoding on the wire is YUV444 or YUV420.
+  *
+ * @DRM_MODE_COLORIMETRY_DEFAULT:
+ *   Driver specific behavior.
+ * @DRM_MODE_COLORIMETRY_NO_DATA:
+ *   Driver specific behavior.
+ * @DRM_MODE_COLORIMETRY_SMPTE_170M_YCC:
+ *   (HDMI)
+ *   SMPTE ST 170M colorimetry format
+ * @DRM_MODE_COLORIMETRY_BT709_YCC:
+ *   (HDMI, DP)
+ *   ITU-R BT.709 colorimetry format
+ * @DRM_MODE_COLORIMETRY_XVYCC_601:
+ *   (HDMI, DP)
+ *   xvYCC601 colorimetry format
+ * @DRM_MODE_COLORIMETRY_XVYCC_709:
+ *   (HDMI, DP)
+ *   xvYCC709 colorimetry format
+ * @DRM_MODE_COLORIMETRY_SYCC_601:
+ *   (HDMI, DP)
+ *   sYCC601 colorimetry format
+ * @DRM_MODE_COLORIMETRY_OPYCC_601:
+ *   (HDMI, DP)
+ *   opYCC601 colorimetry format
+ * @DRM_MODE_COLORIMETRY_OPRGB:
+ *   (HDMI, DP)
+ *   opRGB colorimetry format
+ * @DRM_MODE_COLORIMETRY_BT2020_CYCC:
+ *   (HDMI, DP)
+ *   ITU-R BT.2020 Y'c C'bc C'rc (constant luminance) colorimetry format
+ * @DRM_MODE_COLORIMETRY_BT2020_RGB:
+ *   (HDMI, DP)
+ *   ITU-R BT.2020 R' G' B' colorimetry format
+ * @DRM_MODE_COLORIMETRY_BT2020_YCC:
+ *   (HDMI, DP)
+ *   ITU-R BT.2020 Y' C'b C'r colorimetry format
+ * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
+ *   (HDMI)
+ *   SMPTE ST 2113 P3D65 colorimetry format
+ * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
+ *   (HDMI)
+ *   SMPTE ST 2113 P3DCI colorimetry format
+ * @DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED:
+ *   (DP)
+ *   RGB wide gamut fixed point colorimetry format
+ * @DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT:
+ *   (DP)
+ *   RGB wide gamut floating point
+ *   (scRGB (IEC 61966-2-2)) colorimetry format
+ * @DRM_MODE_COLORIMETRY_BT601_YCC:
+ *   (DP)
+ *   ITU-R BT.601 colorimetry format
+ *   The DP spec does not say whether this is the 525 or the 625
+ *   line version.
  */
 enum drm_colorspace {
 	/* For Default case, driver will set the colorspace */
-- 
2.41.0

