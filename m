Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 759656AE402
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8EDD10E4E2;
	Tue,  7 Mar 2023 15:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC0310E4E2;
 Tue,  7 Mar 2023 15:11:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlH5C+Fym3EotCJwDm02g8h/e4e+/Pp5Iw8LETxA5GwhLBG9WFmXTOzcKHX1kzZ/F/aUPERjzQaTekaItPSBK+uUb56H+csFfRsU0kgAACX4tgIIAI6aFTJVOjdhzpSph9fjlNppc4FsFf7nFD8NTPI3bJFAnpE7yB0SZZcEVJM5xLZnz6gVOF9TTgbLwV3p47K1yB89AslRWs0mKF7tJq2VQoBPB/GkIs9cA1gAMrC5Ugv+BQXfix/7BqczxT+PH1otdMO94txbMB0m9q+TRQmRV4iHW6fMMOgBfjsqkzNp67mmX6hpGhuJ5lA9rGOYiEFpeUAPe+aJ+JD2ZYtBeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFVgjIymUnsEKDLkCdipXD9qxY6s3/lolvt3xhbgANU=;
 b=ZEGMdjSHhAcDtn7p6dtheIJn3W2yghYWDARmhOJdwuCvhSxfNDiaUGEMe9I2jq/c4vf//WZn5FvmEDcFOiIV3Piauesnq3+zsUcFRPOhv0l7QDhE6TdR9T6RHSsIeek5lP2CEpK70q60hZMNvxvpurGqBbUVnFJmFzyTal2egA6XnhYgoh5gvvVHqnDOP2ZNU/oLSW3hBJi3F0szWibK0w35xX6jVG18GdHy+PVc0B0BSspvOzaLNeku6e1x4Ax+ui/tdfrbItGQ5kfbOqEW+Nn/wlrZuoXp9VI5fOrq8/e6YOo+FwTLuFqTcALJGp1MoiL4Cd1bOKsv+leq3kVQtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFVgjIymUnsEKDLkCdipXD9qxY6s3/lolvt3xhbgANU=;
 b=kZ7/hqINXhtmJAPOcBjXhAjtuTbuvfEfjMEcnViAgyWOr5MXKJtK4CJD1ZsYeGEgSyX7pp/3GSqLDSq1clNjULI8ZaA9d/M2XZafrSHvuwrc5il6+CO140IzBLiDMGgTbvlx7Lwqk7WQ4ttoZi3ODNw5bVsBsKsGy77dRHs69Lw=
Received: from DM6PR03CA0077.namprd03.prod.outlook.com (2603:10b6:5:333::10)
 by CY5PR12MB6455.namprd12.prod.outlook.com (2603:10b6:930:35::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Tue, 7 Mar
 2023 15:11:16 +0000
Received: from DM6NAM11FT071.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::8d) by DM6PR03CA0077.outlook.office365.com
 (2603:10b6:5:333::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29 via Frontend
 Transport; Tue, 7 Mar 2023 15:11:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT071.mail.protection.outlook.com (10.13.173.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.16 via Frontend Transport; Tue, 7 Mar 2023 15:11:15 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:15 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 07:11:14 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Mar 2023 09:11:14 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 01/17] drm/connector: Convert DRM_MODE_COLORIMETRY to enum
Date: Tue, 7 Mar 2023 10:10:51 -0500
Message-ID: <20230307151107.49649-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307151107.49649-1-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT071:EE_|CY5PR12MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: c0b7670c-5381-44c5-6c26-08db1f1e3267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kPrFaFnsiJzxZ/ey3eZTANgikzSuuGLoynw/omAjikVs2gCuBxsszbdEcA1ZULc3HvoTeKNhJPC3NAupYGri5E16F95X0nh4TB1On0K6x540uuD/Pr+L6itWZIClyCiqtrI9nb4p9VWUaN5cUsWPJcrL8cPrbtXrG6fZh/nTp45HNE1pb5MjdwguSqJzD5Ycx8ML3o++0rZXd/aSP3+4F0W41yEqoBKulNB8W6N+RYTuG0yYHOUqkm6y624JWJxhs2jIHH72sip80hpuYOaQRanTsnHlkVHCVAFO6XgbNe20JU5pA/C+dmF3IsznJsGNgITFWbrKnmbdMHaTPLqAOQJxFYADVkO9qm4pZEGDPGJKSZRT7p0ZmMNcyqp9elipFke0y72c93KaHGUGl6lzzaiOutbQIDRZNN40Nw1NdcyrzM5cM20wexcN/T55kVtXgzXpisx1zCRm2225w1EEVoeDZ5yMmvMcVMFSxSMG7eeWQ8UZ2h0JT2b4Q8mg8AWdnSwn8pDsbUqWbeBPBwYaopJgNWUSgqa050CMXRAfwn05wXQmMN/Te/WPB06dj8IBdMMbIaNd6xsN17ZF6vtUtnae69V97oP5LTAlBve5tgARWdk6wgxejdL7RhqmId/WdLvnBJzqszYK/veREP9toNzHeD8by2Ib2q+E90akMTv2iihGZMb+/3gktVlBRXvfm8MASyy0H23tBObxCRA56DXYWvAaUS+2RZtBacFwDiw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199018)(46966006)(36840700001)(40470700004)(5660300002)(44832011)(40460700003)(36756003)(83380400001)(478600001)(82310400005)(426003)(26005)(66574015)(6666004)(336012)(2616005)(1076003)(4326008)(47076005)(8676002)(356005)(70586007)(36860700001)(8936002)(41300700001)(40480700001)(70206006)(54906003)(186003)(86362001)(110136005)(82740400003)(81166007)(66899018)(316002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:11:15.7238 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b7670c-5381-44c5-6c26-08db1f1e3267
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT071.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6455
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

