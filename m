Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC2871171C
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 21:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8267310E121;
	Thu, 25 May 2023 19:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6867510E110;
 Thu, 25 May 2023 19:18:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Go70EgFRdvjiFzIDV4QED+KzZzhMFK3n1FqAmLQ8ZKogJZA3pW6J0o/8AAs+NUYUlazcGUQ7FdSjhhYKkmFzVD++qN7T5ETMFhDvSW8x9wAuRY6c7U4C1sSuK1equS4fFNjHWJGRpYKefrmdQ0lXnlK7eXLig47wMxs+10uNuX97WhnM11VZVFBvUikdBJB583+CDWZmAVCOJL8XwQlMmrjPyoeH8NTLWxGFPFYTdWCnF5C+6cInbXghaocxH9i2FKJAp8XztrDqSiodwDBrjpEE2ypcf3YGIsTUsxShNyzUvzuTtOnpd6PV3jcUd6BVRVHZkTjRAMiBNAh3job4Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giS9uUXyRByxXY81LUUZ74QkTKJt/25n1Fa381frW9g=;
 b=JejQ3UmroVTa4kN8RKgheEP6dAHAN1VXLWWTloEOIVPeE+HDZMrWaDtDafdYI9cReQAJOqsV5jOgT4Q26/Sa74FNGRDkHRuBIVTGdUGaPhp6GF1QrUd5ySz6GE4wQkBBKPZiVihUDOzQsO9N6ekWlHIPRq1jo1Ohq2+6JH5tFE/syO3ChKEVTK7Ntk2BFikFtkyJPq7Z6G5aMcOG3Tlxq32G+tYX75JTA6OaDRPP0tc1UdY5orFmFNN8sGS94iu68UCAbhvZsJ6GJweXnUTvV4OE12iaT1VWniAuqmeieCA7Kb/T3grEQ1fBpbOWlQTnXF2HHnqmBgIPhyy1rMgXZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giS9uUXyRByxXY81LUUZ74QkTKJt/25n1Fa381frW9g=;
 b=g5re32NNvk9lkH4G4NCpUv1bsI5q4+30zRhBGG9vR5b0gTzAn/cXFPjWRS+bLs3NOLc3qUhrMEEMY/9w6zrfWAgfWTyK7roWSsYlawD0D/HY1d4Y0EFHFKMcXdsuKfpUXP2LzakCUjorzb76uQ5uWnpQ89Wr6hf1sQYr1O4PThw=
Received: from SJ0PR03CA0208.namprd03.prod.outlook.com (2603:10b6:a03:2ef::33)
 by DM4PR12MB7720.namprd12.prod.outlook.com (2603:10b6:8:100::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 19:18:30 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:2ef:cafe::3) by SJ0PR03CA0208.outlook.office365.com
 (2603:10b6:a03:2ef::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 19:18:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.16 via Frontend Transport; Thu, 25 May 2023 19:18:30 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:18:25 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:18:25 -0700
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 25 May 2023 14:18:23 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 02/13] drm/connector: Add enum documentation to
 drm_colorspace
Date: Thu, 25 May 2023 15:17:58 -0400
Message-ID: <20230525191809.3524-3-harry.wentland@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525191809.3524-1-harry.wentland@amd.com>
References: <20230525191809.3524-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT014:EE_|DM4PR12MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: 160703d6-556c-4422-fb26-08db5d54d302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TEw8pquP24poof6/KScIN/VdphpmW9nVGSBva5GueigQ60Qo8fL0zVIxonA/pGGJyzLZJWIvCuQwA6xnHylbRHstI2MWMMOrE//FtSwvbzyzc2gPe/4l7CkISYQq4DujclQh4UGKOcQWFHBjKkFDulFmz+Uh9YD+WMui6hENODE7qVTI9NNzhk0zzb9uUUVdRDe325fmyfGB46IqzgaFFU+GNLZqZflbeUA15G4hqtD3wu6Bn7bcrsUfLtwB+PtTBUKg53SLw16eWH7hInp4W2VgQVK71uk+hJe3Cbt476V7VxV2umW4vayILy9vW+GTCj0XjV++/ij3bKsEzywS8H0FK2hRw5yYcWxPsdfqEL6pNxjeEqt4V2CiqdE5TC4UeUuwO4S7/Btv/dfxn3swG95D4vYpSu0BFmKwK4Pe35Y3NAL0t54Z1QPGqF1c1VYUs/DgOiAJKs5GpxgFTPbfqs1Tsk0K4bZI11P3K/SQFnGz2iCVq+mOowTkiF8bTwgQGHMpV7Eq4uF2vZWQ88Kp35/6JmPJcHe8rzO/02bu0k6J+pK0N2zMUs9ZztiI04+RaP1va2CDuXHmNsTXTEZ6RixhsO3wHZc1r/CINxVa4NzzoN9zub8RUm0aY/vRzYOJcj7cM9j8rpRhVLP2mvuC2rP7stx7u8L0y6AMWQyHH250yY9PZYjOod3oiiC3Uqkk5a8isCWtgCV5f+ooEGzO/cvmtx3uonESSjGxT21H0Du+evYpZ+Q+jO1KjGwYVRIu9U3KC52XfUZ/ZWnpUFq7og==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(5660300002)(82310400005)(2906002)(8676002)(44832011)(316002)(70206006)(66899021)(4326008)(54906003)(8936002)(478600001)(83380400001)(47076005)(2616005)(66574015)(110136005)(40460700003)(70586007)(336012)(6666004)(36756003)(26005)(41300700001)(1076003)(186003)(86362001)(40480700001)(36860700001)(426003)(82740400003)(356005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 19:18:30.1099 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 160703d6-556c-4422-fb26-08db5d54d302
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7720
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, Melissa Wen <mwen@igalia.com>,
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

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

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
 include/drm/drm_connector.h | 62 +++++++++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 77401e425341..ee597593d7e6 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -363,13 +363,71 @@ enum drm_privacy_screen_status {
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
2.40.1

