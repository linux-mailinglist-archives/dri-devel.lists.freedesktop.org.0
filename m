Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD63724E05
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262E110E3B8;
	Tue,  6 Jun 2023 20:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39AA10E3B0;
 Tue,  6 Jun 2023 20:26:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdWJhIzxP+C0UKGY5RGXeyhd2okoVjrfHMm5BbABI6gyktJNR355xbl0dSsnIYWS75KbvSY2EaZnB2Aw6yRqF6V+ybG79ubYadyL+bOhRPJtqB0vkfbOMf/I9eFTId4rQLRG6TsZVrd0UB6yYxXLkLKEQUlpQmKmoy+2za8RHYDAxWe9ghmRFtqF9suofQP71AGO2V6hkafs7LjaUERmBwUVriS9OiThHh5g7NU99dQHCI5umTl72+Od8z/5CuEpHXSFFtyQpj5CEFqD/YJEkWZ6AT74AiXtBV+mwAwVy4SC2z3ffnKWDzb6WfJhYWU/nfyoFc6amoJHZ5w12aStJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpoDThbFgL/dq0K1vV2TWgr2FFpAW2XvxwC50PIpZcE=;
 b=Z673JHFgj5G5RsEdGREc7UxSf8fognW4BeleaL7pnhsIQ6QO7EYP0Xf5zGPWmct86lZUXDGNP9z6lky8js6DzKEL2Nms69R56Yh0BHANWdPJ8htv6XuZ0rwOeAG4Zq/pkmTxAACis3Z0J7eiQucO2YJOrk/grIJp26Qx1sien9YpbLsAgFygfZMgjvBmhNj0HtTcQ7/XvocKGLVeFoMV+H+INqYJlGBxLXZN79N1PJkO0tWnZRdZTi2TpTKx5h0nhjQlqASj0ULArX0r/3H0/SywpPlVKAf7d/FvWwrmEC/OgI6LAeWL9z8ScMvAolV0HKIPrBgsQ3cC0/2pSfsHTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpoDThbFgL/dq0K1vV2TWgr2FFpAW2XvxwC50PIpZcE=;
 b=fU4QQfd8m/tdNoIc9znkNxd36RoEBseLNolMxni5vPTA3N8+9876gkxtoeQwdGO8lS0Bbmf/JT7sz0CbEXl+gUWuIFcmF2F0v4yNRoZ7xywfdDal6ea2Im5bQjFEmAaEEN1LwRY6WQTGwm8xUKASsdSNjoQ2TmgA9RjGTkElPos=
Received: from BN0PR08CA0019.namprd08.prod.outlook.com (2603:10b6:408:142::12)
 by PH7PR12MB8825.namprd12.prod.outlook.com (2603:10b6:510:26a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 20:26:14 +0000
Received: from BN8NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::f) by BN0PR08CA0019.outlook.office365.com
 (2603:10b6:408:142::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36 via Frontend
 Transport; Tue, 6 Jun 2023 20:26:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT079.mail.protection.outlook.com (10.13.177.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Tue, 6 Jun 2023 20:26:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 15:26:13 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 15:26:12 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 02/13] drm/connector: Add enum documentation to
 drm_colorspace
Date: Tue, 6 Jun 2023 16:25:56 -0400
Message-ID: <20230606202607.122914-3-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230606202607.122914-1-harry.wentland@amd.com>
References: <20230606202607.122914-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT079:EE_|PH7PR12MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: 17e1b66b-3de4-49f3-c40e-08db66cc466f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1LEU1UGPAhOj+JXv9g+JuYhY44kVjlLTjNyY5Ip91bj8gLwe1bQ7vNygvBaTEJ8NSO0/TbUw3T7udn1w8LCgD1CRRYZUK8nqMKNL/Q4GUypTWn7ENq+Gu5Qe+OV2RpEG2kHml55bqAfaT8u7KP0r/q6xXHeCd0nVAVDEmOmtwdMMot1LZR2uV1A0iLGORnILiQQuSH+poV0BpJYOXX1WdmjKQyMghQmb9XwMnJ7Jin7y/P/8LDCAzf+QsLUKXH3Le+YyohJxZjhD/F+66WVLxoLZzDjGwhGiRq+bmcjT1EqaSw84lzdk5gIW55V40LISgIcfHHYCK5N1ZA+hs0JFPhMWMrXm03oD7JxepoH6nwVhIYk5l7nUcTV00lkGPHO6wdpJbd9u+Ysg3e9ZRbsBAztTDTEJ9i1lHOBeDABHVVo0idmgpFuMnKXMR18x/d1FplbwAQNUn9l3J+xmxgr6sWuzl/94twc0dnnO53ELwBayUQ3fbIWDW3b/ghNuo9PssKShUL+EQIwPIonsDanVdaNDNlmcoSQ9DwflHPRfuNjIHRLYWcAj8SgM35fKYxipNtucmzuUls0OfDvQUi95UAb5mTuoGrlWwonRem0jt1280e0epIMo39SoKCaBRgsr0G4e0pxkQ0OFUmbEAjz9JWfko3XXZXn7iRvtK+8onlfZVoOrfl80UJQQMz6Sa5QLw6zGU9UdiijsEC/9UNUZCmV2oAuxgjJLMu1OvTFDH21Fpw/qauE08zbCH49Z+IG7TfQfMrb6nm1QThmNNUx/1g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(40470700004)(46966006)(36840700001)(8676002)(8936002)(54906003)(478600001)(41300700001)(5660300002)(316002)(6666004)(1076003)(26005)(44832011)(7416002)(186003)(110136005)(70206006)(70586007)(4326008)(66899021)(336012)(83380400001)(2616005)(40460700003)(47076005)(2906002)(66574015)(426003)(81166007)(356005)(82740400003)(40480700001)(36860700001)(82310400005)(36756003)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 20:26:14.3367 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e1b66b-3de4-49f3-c40e-08db66cc466f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8825
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

