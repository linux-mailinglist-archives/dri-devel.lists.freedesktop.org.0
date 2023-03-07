Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318496AE4B2
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DB610E571;
	Tue,  7 Mar 2023 15:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95F310E53F;
 Tue,  7 Mar 2023 15:29:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXW0Tk+4wT7LgkVotyNPKwm6jkVvLTLAEJ3f37gvyDwmMGZWSjUlo0Q/3CkZbwb+Vf77/O8pK90DauC4AyexvOmtzleJwv5vop+DuAbZIfQXt6tsHM5hk4ia19bv54bZoQx5aCz9wkONiMgbmfUIESY1SEJkafhsnUlHxyMnR823ZXidSbJfXjkN2E3Wu6yh5yYA3obnElmDQu0VETEHqhWgPPsMDAumXhQLwWltU3ajq8FK6EPj7SZU+1TKwsBQ+uamIORExQgC5jz71mnflK0NSNzZf6XbySW0qdRCOMegf832qpjv52Wftahdh0N9D+65FmqFIkv99D8gfsl+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67dQ9Q7GFt/oaLDc3m7tKVyhMb9neR7ch22Jq7QTG80=;
 b=GUIradDgdKHobhodKWfpA51OtLYQbYn8Cp82/dCeDq0PY+KiED+CHx5ntLmJQGGNCd3ppS2Eh0+aFFMUMIKQb+vY+VOKGAah/CtHQXe/UZ/3+6bPqwUWDxvQc+ZyNmD7KSptNqaYUlfh3sieNkB5t8Q99KlapCcMUsHYrd5b4V7D04V9izTMUgOwL1XFQ328no5s5uyDOcupdNbxKQtcpoLCGvQav52P4bfu6yPTi2XFRH/7i8dz6pdl3zSPSPWVw+8ukpRkGUNf1dMhd2jVmddpPMEBaMyCun1c0K+un5nZVCMD0wTR7TiLQEjwclVGtc2daL0XCWuiJVIGyv5s2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67dQ9Q7GFt/oaLDc3m7tKVyhMb9neR7ch22Jq7QTG80=;
 b=ixtb08fiyZerbV0ltE34B/kYHnN5HAleSMF/c+0q1xzSNMCyK6TriQ6UTGLQv4Bhqdko07e43GdD/D/pc+zp7ugvrb6tZC0BQtZocscv+Ay0ss0i5QHtKkEcoGV/MNT5MOdM6h5KmA+F03HvDhRtKc5remfkzjbDs9UeTYuFYnk=
Received: from CY5PR15CA0091.namprd15.prod.outlook.com (2603:10b6:930:7::10)
 by BN9PR12MB5180.namprd12.prod.outlook.com (2603:10b6:408:11d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 15:29:39 +0000
Received: from CY4PEPF0000C96B.namprd02.prod.outlook.com
 (2603:10b6:930:7:cafe::87) by CY5PR15CA0091.outlook.office365.com
 (2603:10b6:930:7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29 via Frontend
 Transport; Tue, 7 Mar 2023 15:29:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C96B.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.13 via Frontend Transport; Tue, 7 Mar 2023 15:29:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:29:38 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Mar 2023 09:29:36 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 01/17] drm/connector: Convert DRM_MODE_COLORIMETRY to enum
Date: Tue, 7 Mar 2023 10:29:34 -0500
Message-ID: <20230307152934.53372-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <vT46Q_J1ih6YRi8a30VhwbuI43l7uCbTnS9ReApjeTZFD79HaDTZ-9FiNu_sS4iDn-XHhOsQYVQT-Bc699_qGmqMSSyc6XG7YYHVq-EJ-2s=@emersion.fr>
References: <vT46Q_J1ih6YRi8a30VhwbuI43l7uCbTnS9ReApjeTZFD79HaDTZ-9FiNu_sS4iDn-XHhOsQYVQT-Bc699_qGmqMSSyc6XG7YYHVq-EJ-2s=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C96B:EE_|BN9PR12MB5180:EE_
X-MS-Office365-Filtering-Correlation-Id: 3453a136-5bff-4c09-63a7-08db1f20c3d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KI8JqVPiiW9FM/XlU1/MWkSwwYpSgOa80g0NMFHXsxemlGC5V6yEl4QmGWFEnd0Wq3JSPNkYbFSpkkvD0NIixi08sw1g6j51AOBBEzb3WIGnVyUCkbUJOrMBTeIJwNE+OevmJMwBl3pUkYSLaOrMnRaqXyLK80fQsZHFcIMzUpS1StQuAmmcHfmiLfidO0+DYBJi5rUU42dONAryJjA0FnDPF5nBFPm8TSW6FExTmtzi57qA3QxyDQKy+yZJ3mnavXCxNB6SIDTDB/yPBDX4HE07rX6/aGiAKvQHkQ0UvFPGGgRXGT+K7W53DgEoLJ/4AvUwKOgZs2dgJJJPi8zygsot1X3IwmCf5vZ1srpKl4E0bmx95l3IgA46+fDBhGf1mbGN1ncrVBYfcSmqQYsF1Ys/fX4WGvPAVmPyT3e7C6trCihF+6qqWxtsXuY+iz+L2ln6imPxr2HpVX/AnvqOae71MDk9t1qkD3UVtafYDHpxrEmga4Xs8LPrvoGxrZjcgUrXixeeYOV2IcRIMFadCNAmCkV2cYqTQnznVk2CrJ8j7a41JOFq3DvN46oPhJJhNIk/1HtKVUZ0X4GdhBw0M75qIQYmVPT5rU1De45pRIRFIX/cyxwvwBtDT6bAe4zryVhhRJwkOAPNghAZ/kqV1p+HGTmkRwWceGfg0KUTWqK6fFgaR+fXUNMBjZ/frCpmCEcj81BC07w0ngAAAZOwNSW4g/6bdQdY7LkBPTuIUO4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(26005)(1076003)(36756003)(36860700001)(426003)(47076005)(66574015)(356005)(82310400005)(40460700003)(83380400001)(86362001)(82740400003)(40480700001)(81166007)(186003)(2616005)(336012)(70586007)(8676002)(70206006)(41300700001)(4326008)(2906002)(44832011)(5660300002)(8936002)(478600001)(110136005)(316002)(54906003)(66899018)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:29:38.7272 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3453a136-5bff-4c09-63a7-08db1f20c3d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C96B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5180
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
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows us to use strongly typed arguments.

v2:
 - Bring NO_DATA back
 - Provide explicit enum values

v4: Drop unnecessary '&' from kerneldoc (emersion)

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Simon Ser <contact@emersion.fr>

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 include/drm/display/drm_dp.h |  2 +-
 include/drm/drm_connector.h  | 49 ++++++++++++++++++------------------
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index ed10e6b6f99d..dae5e9c201e4 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1623,7 +1623,7 @@ enum dp_pixelformat {
  *
  * This enum is used to indicate DP VSC SDP Colorimetry formats.
  * It is based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16 through
- * DB18] and a name of enum member follows DRM_MODE_COLORIMETRY definition.
+ * DB18] and a name of enum member follows enum drm_colorimetry definition.
  *
  * @DP_COLORIMETRY_DEFAULT: sRGB (IEC 61966-2-1) or
  *                          ITU-R BT.601 colorimetry format
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 4d830fc55a3d..6d6a53a6b010 100644
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
+	DRM_MODE_COLORIMETRY_NO_DATA		= 0,
+	/* CEA 861 Normal Colorimetry options */
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
@@ -826,7 +827,7 @@ struct drm_connector_state {
 	 * colorspace change on Sink. This is most commonly used to switch
 	 * to wider color gamuts like BT2020.
 	 */
-	u32 colorspace;
+	enum drm_colorspace colorspace;
 
 	/**
 	 * @writeback_job: Writeback job for writeback connectors
-- 
2.39.2

