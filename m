Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0FB669DDF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798AF10EA41;
	Fri, 13 Jan 2023 16:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEED410EA2C;
 Fri, 13 Jan 2023 16:26:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrOfZ6Vpq7wPKmXwAeYnc/GcOSletj1ovXINrO2SLUnxyyJ/ppjKdAmaUIgaXoeOeejQ6cOX2S0fRNqNuvfBaW0PIocZ/mpqBA1bFNB0P0UYDSZe/1+Kg8+rTgOZQU9RT7Kft00KkwOE1V5AZ7xfvDD6J8gGmb3uKfnWGb9yw3vZAy81mVDf7rjEYk/6bN5fwQ/4A8p+I+Ul0AocNAsir+1ANK3LN8XZ1JUMh9HlXlGU553KUzY+NTkmIUXzjWuj6SKc32TWdAD5QYohv4Y8KXOQL/YUhUPUdAvQXcnI2/vcXWJ7pGUE8X8BugcXNHXRZAS0oLTSHKtPl8Yjzd4cHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGs5adAp657AM/dYIPE/acEs4J9DPMwVtX9JoYE1+CA=;
 b=DW/O+XcmWmZ9eRp/a8WIzskHdAZ+hWSsZaWsCuGPgMtNdF/Bwpt7rI9EDbuDX6C2kSbB1aMgLkycT6etkVXNWCkwqo/WjVqUOX7tz3qoF6M7scLyiGMiIDJtF2KTqbocRPkxAQOcmv2PU+/YHxVhwPFGgQ15T0Jc3XL50Roa8jgnKCasF2Us5yuSU7nKQZz0gnC+hhp6HSF5RiyQoB4AQ/tQ72XoD2DCU5iNN8SvIZPNcV+1J2ReVom5N43MysGk7iyD719BeNvqbep0iMEWmxILLyEKtGF5ElLLKuaIwyiNRVeGhQAybLXgV+f79kF9BrwPqCitGKxT/picylI8rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGs5adAp657AM/dYIPE/acEs4J9DPMwVtX9JoYE1+CA=;
 b=nmdudz95ncOXp/kTI//T05sHkbHVjU0/xJh1axeIUFOcue84hmraXG3L3FH78qC9Z8MuJn9E6sUl+4MMCx09j66QxoFt9p1bXfzx4kJ+cjJvvSQiLw8NFgi7HBehimMOYh4K5XqQAvHJZrn7ayGtIRKZvb0FqbXntdRsKtII6z0=
Received: from DS7PR05CA0091.namprd05.prod.outlook.com (2603:10b6:8:56::12) by
 BN9PR12MB5242.namprd12.prod.outlook.com (2603:10b6:408:11f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 16:26:41 +0000
Received: from DS1PEPF0000E636.namprd02.prod.outlook.com
 (2603:10b6:8:56:cafe::e5) by DS7PR05CA0091.outlook.office365.com
 (2603:10b6:8:56::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Fri, 13 Jan 2023 16:26:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E636.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 13 Jan 2023 16:26:41 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:24:53 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:24:53 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 04/21] drm/connector: Convert DRM_MODE_COLORIMETRY to enum
Date: Fri, 13 Jan 2023 11:24:11 -0500
Message-ID: <20230113162428.33874-5-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E636:EE_|BN9PR12MB5242:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6f0965-2f40-42f8-49e7-08daf582f3e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3m9XuOKrgY64gp9WdZGXjXB5X3Vx0rS6+ZyzgMMTltg91YCDcReOOteehcCM6pKWwsSbeX+o9fxZlasyIAo6xeudwvapbSchzGJ9rw8DW5ITD3aiPaiTJdkppGFVciAHGVrgX69+hCcemZiQH8Msi2rLi2cPtGvaZwBYgMWzfyyT1FIjUuvON+I1gomrybAhtFHraLBIHSfzXawNq4GwBHuRmczfu9P/vFD+Jr7LK9YVj3o5IB3Rl0lUqPiJ5bxeX/ARLZOBiGt3BcqLX7z3xonxWJZ5fIVEV+LyByB3/0xNz7VnKVeh0/4r8I05DThR4L6hp6rY9BxhDTPtjN38IFHwYzpSxT/RhM0ebOQKzBk6788VzE6sMKYae7oJ4zENN4TFFI2yfONTyU6CXGpLawM1XgGUs/K4C7nxXew43EHb6jcGuU4KlRW0Pw27L34C3if26bMOeQCPngkqWwzaAO8LvCoPsdpc6R5FPl8VkohKEYxZMxtN87s+vowT5C93ReUOCsy0jE5NQ6M0W8NZB4UvtR5SDeIU0Z2SDKjF8nMe9dzAVddhHLTQpWunPAHQaFMPhemGVivm/2hit0ZiJvi44aRXSJ2LIyn0XO8ILUGLTZ6301IcIwg1n03kLv5Ny0det1M43tLuNJO5U1luLJJxhLcPR376tdDVx9arfE5/QLL54kJJkzyVBV3OgVh7pjH4WNAXzGaYwj3Oh2yGtgSFfxrOUe9r0zNo0IpDE/k=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(40470700004)(36840700001)(46966006)(426003)(478600001)(82740400003)(81166007)(41300700001)(356005)(66574015)(47076005)(1076003)(316002)(110136005)(54906003)(40460700003)(2616005)(86362001)(336012)(70586007)(40480700001)(26005)(186003)(7696005)(82310400005)(70206006)(5660300002)(36860700001)(36756003)(2906002)(6666004)(44832011)(83380400001)(8676002)(4326008)(66899015)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:26:41.1746 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6f0965-2f40-42f8-49e7-08daf582f3e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E636.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5242
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-By: Joshua Ashton <joshua@froggi.es>
---
 include/drm/display/drm_dp.h |  2 +-
 include/drm/drm_connector.h  | 47 ++++++++++++++++++------------------
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index ed10e6b6f99d..28899a03245c 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1623,7 +1623,7 @@ enum dp_pixelformat {
  *
  * This enum is used to indicate DP VSC SDP Colorimetry formats.
  * It is based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16 through
- * DB18] and a name of enum member follows DRM_MODE_COLORIMETRY definition.
+ * DB18] and a name of enum member follows &enum drm_colorimetry definition.
  *
  * @DP_COLORIMETRY_DEFAULT: sRGB (IEC 61966-2-1) or
  *                          ITU-R BT.601 colorimetry format
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 62c814241828..edef65388c29 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -371,28 +371,29 @@ enum drm_privacy_screen_status {
  * a colorspace property which will be created and exposed to
  * userspace.
  */
-
-/* For Default case, driver will set the colorspace */
-#define DRM_MODE_COLORIMETRY_DEFAULT			0
-/* CEA 861 Normal Colorimetry options */
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
+	DRM_MODE_COLORIMETRY_DEFAULT,
+	/* CEA 861 Normal Colorimetry options */
+	DRM_MODE_COLORIMETRY_SMPTE_170M_YCC,
+	DRM_MODE_COLORIMETRY_BT709_YCC,
+	/* CEA 861 Extended Colorimetry Options */
+	DRM_MODE_COLORIMETRY_XVYCC_601,
+	DRM_MODE_COLORIMETRY_XVYCC_709,
+	DRM_MODE_COLORIMETRY_SYCC_601,
+	DRM_MODE_COLORIMETRY_OPYCC_601,
+	DRM_MODE_COLORIMETRY_OPRGB,
+	DRM_MODE_COLORIMETRY_BT2020_CYCC,
+	DRM_MODE_COLORIMETRY_BT2020_RGB,
+	DRM_MODE_COLORIMETRY_BT2020_YCC,
+	/* Additional Colorimetry extension added as part of CTA 861.G */
+	DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65,
+	DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER,
+	/* Additional Colorimetry Options added for DP 1.4a VSC Colorimetry Format */
+	DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED,
+	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT,
+	DRM_MODE_COLORIMETRY_BT601_YCC,
+};
 
 /**
  * enum drm_bus_flags - bus_flags info for &drm_display_info
@@ -825,7 +826,7 @@ struct drm_connector_state {
 	 * colorspace change on Sink. This is most commonly used to switch
 	 * to wider color gamuts like BT2020.
 	 */
-	u32 colorspace;
+	enum drm_colorspace colorspace;
 
 	/**
 	 * @writeback_job: Writeback job for writeback connectors
-- 
2.39.0

