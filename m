Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 027D36AE412
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1784210E4F4;
	Tue,  7 Mar 2023 15:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838E510E4E5;
 Tue,  7 Mar 2023 15:11:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H07T9a1862jamy0NKCVUYFr1wf553MgJL6HyfAw2bsy5Rg4BtMRB3Z5xSNl+c8Qg6802llOf5r9SO/a5AJhtg1uWjIHmSxN+IgnDZkhRowf5pnwCky+7kHiexA4KmIp2kOU6jsIiKKIyDRniOadl8TPlCbtTrNKx/RaF/oZZ/IAVU7PwzmwekiAUKDx+wZzN1bOF0ZI0d/JNQTUcqZq4Exc2Ez1Fhmd6/7f/ZC3ITO2hl+ZoERy8Jr1tQz2xK1Pect5xVxHcugg476VB2iAGD+8myBSK29sTJyAAKsSjYNToM/RVxtOK0Q+2Z2C8Ee7VfWT4V4cWj6rvYGqZKjkXhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIZW19DbvDdWC/r9RavW89hiQoRl/lkW90EAvIsKTGs=;
 b=EDsRa5mEaxzMchAuKE1OVYXoUY28vfhq2F2I5rPapvXzi4a0COLvUYCRbW120eAPa/PTo0zTwOLxkmGyVmQxwKiZd3dQES61/M1ahzRqR7kMw4rUyJIjYm1j0RqpY0OB6smhgSo/2BJvk9pUuCF8EN6gRzxC+mOb+7l2PLWaJphjh1SyhK+ZDRHGMwRl1cwLWN7FMTqzheJVzGScyZsUSsFw7m/4Pr7w61x3p+FUkch85Q2V/F4ySWuYX8rTYLxVm2kBsieeKz4vindSeZdoK72vPnxE6ytV/opMcWqd0gr5JJvV8AKdWxarTrTxRV8jZ3/dVnouAyFQ6yAn+kTBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIZW19DbvDdWC/r9RavW89hiQoRl/lkW90EAvIsKTGs=;
 b=tasB4vxzb7AWguW7210FaXXrfbqEMXXqwaG7XYtAyrk216W6mrRuU2YfOc6QntdxqblaW8MRqGi7s53cZzCorvubFuzg3EmaYELSebWWpYYYP8JOMynMW1VS3uTLjUpQM6/vh+E1+nykf9cU85iCGwEQ2YhiQ3nW8SieRmAJeLk=
Received: from DS7PR05CA0050.namprd05.prod.outlook.com (2603:10b6:8:2f::9) by
 PH0PR12MB7813.namprd12.prod.outlook.com (2603:10b6:510:286::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Tue, 7 Mar
 2023 15:11:17 +0000
Received: from DM6NAM11FT078.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::30) by DS7PR05CA0050.outlook.office365.com
 (2603:10b6:8:2f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16 via Frontend
 Transport; Tue, 7 Mar 2023 15:11:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT078.mail.protection.outlook.com (10.13.173.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.16 via Frontend Transport; Tue, 7 Mar 2023 15:11:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:16 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:15 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Mar 2023 09:11:15 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 02/17] drm/connector: Add enum documentation to
 drm_colorspace
Date: Tue, 7 Mar 2023 10:10:52 -0500
Message-ID: <20230307151107.49649-3-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307151107.49649-1-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT078:EE_|PH0PR12MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: f67e50ef-ac8e-4c20-9d9b-08db1f1e3306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BuLyX/uZA5SxGJQQI7WbHRYUNzW6J0180qtyLb3poDz4o+MZkuKlU4UjzmrVu0U2rxaexIK653kRi4lDrOwj2Bg0aDRdYSU8JolCka4tr81+ZvoB31JF8ooNJLIvAoWAsDcPu5vQkAqAFvZ/S0HvALdyuQ4aLL0qcN8gFhLgZn28POHYzZvF0ImX6Tst/j1ZNIhdvejrB/YnaEILOzkimKTtx494S8DVcGE6IDjdPD5P80LySIOlAAJ5qEJpEmMFM1Oxz9iiVEBDWq+lJgSYOxGOlNn1M1ACbQJESIxzHe7j63bWEFmFuHGxF3uFcaDokVrxz+HkT39zAoLulFEquBIykWHX5boTGgMpgEijrVpWIRGyrathOecp8EEK7RFaTdal8E+4w7//PLuwX6WwqsHyM7I/cXouoDGufjipUkBeUzWjcxrjjFNUc1Gr149RvBBcL+q0o+7QaqXIvi/b+Z8Ah8bjnspDUqYc3qJMdsSLhUEMf8Wwo8JgcmiYEpX6+Rt58mLr5Sq8dEtCEBI7CU7kXjKXvjM8ZQYmTZ1bFPAwlLzZ3ZFA2ZEOTfikb49jd4nORiirc/sZbZx90/V5JtkfxNGgbcCmzPpKpkL3vEeBpVOJBXjqOhRBvbTmXV3AqZ104XcVeeRhFAzwg6oq8FyVtRCnZNSYIKBFycwaT+5FWoRVO3Dp0AfbN/UAWKIGsURwPF0xoS+1JC0IsbpCFBpbEPmbK0MRaslFqwBtU7o=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(36756003)(6666004)(82310400005)(478600001)(426003)(47076005)(66574015)(83380400001)(36860700001)(40460700003)(86362001)(2616005)(1076003)(186003)(70586007)(70206006)(8676002)(8936002)(40480700001)(4326008)(41300700001)(5660300002)(44832011)(81166007)(2906002)(54906003)(26005)(110136005)(336012)(316002)(82740400003)(356005)(66899018)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:11:16.7827 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f67e50ef-ac8e-4c20-9d9b-08db1f1e3306
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT078.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7813
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

From: Joshua Ashton <joshua@froggi.es>

To match the other enums, and add more information about these values.

v2:
 - Specify where an enum entry comes from
 - Clarify DEFAULT and NO_DATA behavior
 - BT.2020 CYCC is "constant luminance"
 - correct type for BT.601

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 include/drm/drm_connector.h | 67 +++++++++++++++++++++++++++++++++++--
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 6d6a53a6b010..bb078666dc34 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -363,13 +363,76 @@ enum drm_privacy_screen_status {
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
+ * @DRM_MODE_COLORIMETRY_DEFAULT:
+ *   Driver specific behavior.
+ *   For DP:
+ *   	RGB encoded: sRGB (IEC 61966-2-1)
+ *   	YCbCr encoded: ITU-R BT.601 colorimetry format
+ * @DRM_MODE_COLORIMETRY_NO_DATA:
+ *   Driver specific behavior.
+ *   For HDMI:
+ * 	Sets "No Data" in infoframe
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
2.39.2

