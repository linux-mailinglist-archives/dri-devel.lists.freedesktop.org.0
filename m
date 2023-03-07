Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03856AE422
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5605010E501;
	Tue,  7 Mar 2023 15:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2079.outbound.protection.outlook.com [40.107.102.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA42010E504;
 Tue,  7 Mar 2023 15:11:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBcULTTEyFqbOobrm0lgbuiIvE6fNBWhKtXP34jIffWG+/clYR2NjvW1wAQnkue/siybz58AcRT5hfyU06D9e7TLPv+95n6EJdMMSZZ4Ujmo6xkDwU1WlAFhBaPYPL2zlTvDQuKPq7Dy9zZ48TUuzHxZixQVJf9l8RyUGBcdIbiH8yA8HuYrAlhQY8gUL3Iz9Xhl1lM99Ik2X9pmK8BrOINtdGye6jEZYGMSwVGbN80EJOQDLzFWbyOT2qEn1OAofqHrq8ImyImZYKErfd+dnC+LySPca/ewjJJY6U2tasV6XOSvbm40abU2FaRSR+6HFC2lIxY1gLeBS0dXmABW6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZjQ/ElliK6i9TnKrvkE9vyEF0Fd4l+cfTzXdK7RCtk=;
 b=N4xB+rgbeNQRqYFIV5wIwDOjYpPMCGy51haHA0RlP8OfnoDlUqXD/DxGL8oDEIJos71jca303GYXH2pXtOmatYP5joZhvNHPltMSl0eoNi8DQ4J+eJq13J+6JFLW8b4k+m+uKhp3lYenwriexziKSU96fDtAEN9qA+Xw5d6dxyW3Fl+pMOAL10gA4sCZd8RK0R8pFkr0Sdco3Zz4t5MJUmLAz0KSUFAeUA09L+rTMZZbQmzq5yZ4I6CG+nLbHPKhG5xCUucdXKPfSE3G6RNKUwols6RyIrf8gvkbmiih0EGbo90zfIMxIrZPgFSr4DDf3hGw82sdKxSxujyHYuEeuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZjQ/ElliK6i9TnKrvkE9vyEF0Fd4l+cfTzXdK7RCtk=;
 b=mV1hJbf1srBaeeHytLdklJM02EAEkoxLC5qs7SKtktI8rYMIOKimZQNtkxvMthuMkGb5HcbEb3rvouHJZR7p1vlFYtaomOj3RYcAgqDh7e3+gb7YESfVsQAotKjji58BaoO1nkErrDEHGDestkfXCETVc8ginQHAk8M8OgHccqY=
Received: from DM6PR13CA0069.namprd13.prod.outlook.com (2603:10b6:5:134::46)
 by CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 15:11:30 +0000
Received: from DM6NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::38) by DM6PR13CA0069.outlook.office365.com
 (2603:10b6:5:134::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16 via Frontend
 Transport; Tue, 7 Mar 2023 15:11:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT095.mail.protection.outlook.com (10.13.172.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.16 via Frontend Transport; Tue, 7 Mar 2023 15:11:30 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:29 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:29 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Mar 2023 09:11:28 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 15/17] drm/amd/display: Add default case for
 output_color_space switch
Date: Tue, 7 Mar 2023 10:11:05 -0500
Message-ID: <20230307151107.49649-16-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307151107.49649-1-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT095:EE_|CH2PR12MB5004:EE_
X-MS-Office365-Filtering-Correlation-Id: ea495a9b-45c6-4d45-fe4b-08db1f1e3b11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cgkel1xEJMpCcI/j+Q/ToMOrUIWLzS79Vaqq7QMrkUuQM6kWx0V18ROOgVoQQYutiLg7SXwTn+6oSJzccVAxJre28vx1ZTxLEIGs5MZtRbTjCJl58D7PHUUT3VnFhgjL8HNVvQjfLW0qDhDAFw0/FOcYQNe1sUFEpiAUHjfFr2KmBIXj0Cfb33b49dF169lwxbcCVxBT/NzIQqv98n/CU80gRbHzUvfTHLGC5mqbfmTi71q8DC/cJTHngA/ogIMgriSEwKJpCfe/vhwWsTyw0pLIwaQhCvINkl0R9P4lWmX/siA7q1HtSTK/3/H/gW2ovZLBfPnkG2etDSRUPldR3LAO58auC0eo3rpQH3yqooZ10IceBzq2rvo6d041p/8KklNmNLHuccWUBTNmUEQ4bELfJCPrrvvRSqdFAeFkRBIfWPe2SeJ040qRdqJLY/SKRSZ1FulnY2tBcflMPh3b9TDV7h4pIyWEg9i7T0oPEsi3tdXdzKZtbaqKdd2H9JhwNYto56yJv3PGxcexiIB90eA7tc7IbI5aVjFXBvnQIR/QiFRE6vs7lb6ZDBa4qHfFcnK6AJnH4uBiZ/Ajz65mCCUfGwAAqwSMNhLXZmVW4d8odPK7jp4BAKxNACmZqEKAPM3va7o0oXW2Blm/wUNybJB2Z9EODwKqGw/sVIIVZSzKCXbpvRGrY8mQH3hwsagZILPf6U4XRM8LfQCR3nTAdO9QoGK+2Cjl1IIKAMTpyQ0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199018)(40470700004)(36840700001)(46966006)(478600001)(5660300002)(336012)(86362001)(47076005)(426003)(186003)(36756003)(26005)(40460700003)(1076003)(2906002)(2616005)(44832011)(82310400005)(70586007)(70206006)(81166007)(8676002)(4326008)(82740400003)(40480700001)(83380400001)(6666004)(8936002)(316002)(41300700001)(36860700001)(356005)(110136005)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:11:30.2790 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea495a9b-45c6-4d45-fe4b-08db1f1e3b11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5004
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-By: Joshua Ashton <joshua@froggi.es>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 43 ++++++++++---------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7f77e226f1eb..a15b26962496 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5308,7 +5308,29 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
 	enum dc_color_space color_space = COLOR_SPACE_SRGB;
 
 	switch (connector_state->colorspace) {
+	case DRM_MODE_COLORIMETRY_BT601_YCC:
+		if (dc_crtc_timing->flags.Y_ONLY)
+			color_space = COLOR_SPACE_YCBCR601_LIMITED;
+		else
+			color_space = COLOR_SPACE_YCBCR601;
+		break;
+	case DRM_MODE_COLORIMETRY_BT709_YCC:
+		if (dc_crtc_timing->flags.Y_ONLY)
+			color_space = COLOR_SPACE_YCBCR709_LIMITED;
+		else
+			color_space = COLOR_SPACE_YCBCR709;
+		break;
+	case DRM_MODE_COLORIMETRY_OPRGB:
+		color_space = COLOR_SPACE_ADOBERGB;
+		break;
+	case DRM_MODE_COLORIMETRY_BT2020:
+		color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
+		break;
+	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED:
+		color_space = COLOR_SPACE_2020_YCBCR;
+		break;
 	case DRM_MODE_COLORIMETRY_DEFAULT: // ITU601
+	default:
 		if (dc_crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB) {
 			color_space = COLOR_SPACE_SRGB;
 		/*
@@ -5330,27 +5352,6 @@ get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
 				color_space = COLOR_SPACE_YCBCR601;
 		}
 		break;
-	case DRM_MODE_COLORIMETRY_BT601_YCC:
-		if (dc_crtc_timing->flags.Y_ONLY)
-			color_space = COLOR_SPACE_YCBCR601_LIMITED;
-		else
-			color_space = COLOR_SPACE_YCBCR601;
-		break;
-	case DRM_MODE_COLORIMETRY_BT709_YCC:
-		if (dc_crtc_timing->flags.Y_ONLY)
-			color_space = COLOR_SPACE_YCBCR709_LIMITED;
-		else
-			color_space = COLOR_SPACE_YCBCR709;
-		break;
-	case DRM_MODE_COLORIMETRY_OPRGB:
-		color_space = COLOR_SPACE_ADOBERGB;
-		break;
-	case DRM_MODE_COLORIMETRY_BT2020:
-		color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
-		break;
-	case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED:
-		color_space = COLOR_SPACE_2020_YCBCR;
-		break;
 	}
 
 	return color_space;
-- 
2.39.2

