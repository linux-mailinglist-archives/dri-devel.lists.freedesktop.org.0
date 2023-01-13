Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68209669DEA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8913310EA54;
	Fri, 13 Jan 2023 16:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DBD10EA4E;
 Fri, 13 Jan 2023 16:26:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXtgIgxVIRk7BMT7eijcPE9oogWjfZztCMjHyQEByt2kVajsDDR5JrJIRmt7gIHzn3PsT1oaU2nkDHfBH9+ezEGPpMvBn7PoijeHbZcZ6pLucz/Snn6pwD9PHx+vSo8znkjg7xhcLMiVMUfn2n4Eyizj3gcLaNdIUxXm/Nfpo31rp0wpwFwUoqiJd7hEsfwWpUtKQJ9EU/UwV67G+BNaZLmI2c5vi0H9/aFdCPs1Y0YcCeh+es+/hxQGCZW8nOwdrg48NAp/1DQyGAuXheBTpCn6LMS3ZoijYHkHI9w4JUVbhXv78qtrGWXqhaUyLMprFAHIGWQIHctZjOotmGzKaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIo57x4geoKKsrkmhF4K5SIiNyJ+cYMq1U0RRqpGivU=;
 b=HTmSG1c2avaXsQT3fho/8Q9xMjj1U7czm4PO5Ncz2rF+9iz6fVokr3UPQPb9qq1x99wviayh+dvHiQM9P050Lq1bvocTOsLQf4XGuf2X00QzHu2jeF/Jq3P6nVSG1LbyM//gI6ryL59laOFdUMSBaTsD6FrN/x5jz7KHd9rPQsvRB3xhlkjXtMYBFA9HybGhwbU5JLrwJGbdwdzb7EZtQuNRLj9a+Qek2MH8bXjlIJT2Klv5l7AO5atPzXN/BbZXG7C0PnYsk7wrDtgxeYShZQo8yIHqhxfIeahrQyqr0x+ATEDei04GhARaGS9ivFdvnF/BnJLeW46wvzWF/OEv0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIo57x4geoKKsrkmhF4K5SIiNyJ+cYMq1U0RRqpGivU=;
 b=xsCQZL7Ck4I0nO/bLG0jGIPlFlQO4LI2QXDNfHtiyI3JkEHADNSULIsQpcSqfMl4pjz5krCa1fS91VOxoIjjtMbu5Mm6Gzzy72UzBelZ7pRkptshcj29lNwiBsCisbazaFUhKofyQ3aLTYl+xTTToKZs271uwuCdOb/ywXljFbQ=
Received: from CY5PR19CA0125.namprd19.prod.outlook.com (2603:10b6:930:64::24)
 by MW3PR12MB4474.namprd12.prod.outlook.com (2603:10b6:303:2e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 16:26:48 +0000
Received: from CY4PEPF0000C964.namprd02.prod.outlook.com
 (2603:10b6:930:64:cafe::5) by CY5PR19CA0125.outlook.office365.com
 (2603:10b6:930:64::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.16 via Frontend
 Transport; Fri, 13 Jan 2023 16:26:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C964.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 13 Jan 2023 16:26:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:25:07 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:25:07 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 19/21] drm/amd/display: Refactor avi_info_frame colorimetry
 determination
Date: Fri, 13 Jan 2023 11:24:26 -0500
Message-ID: <20230113162428.33874-20-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C964:EE_|MW3PR12MB4474:EE_
X-MS-Office365-Filtering-Correlation-Id: 07445219-e701-493e-7caa-08daf582f846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t4rg6i8SMjzAx8jDT1f1PxTgO0EbhpigL1cefieN41QFSgDBhNQLJQPvB29QKvTTetcGznIYavEfZGYPUHOPZ/mCzxHF4FOPUWDcxQwrtXhO8S4G2DxJ/WtwYcOnY+MXUdoaFUqnqOsc5buzv9jWoKaPjj5Q4FOA+4BMI8U+QVow65EbNz9pehLbWGqIhX+cjEb/3bWywN/TyY8rWMjRxFOpJezonhBC9WfADsa8lQ+xsZx57NbiZ0bHhX8JkARwjHKgJF06OtIm0Fmx2s0fOs4/wlSekqlGLplhVVhIeMOSQr5mRSFkE+cBKFLiBQZ9rGbO5hUNxLZSxNDjKyWXfKqALUTOUZTtxDUitWmeNdCfscBNIGPZWrrPpgWHYeKXHMQ/hW/E3tHhM2CqLsaTE6RWK5deoIrTJJSdzByptzcKODBptRv/rXwKM/0dGgSoKrmkl4DhAVYBXQPiSR1/rcHCBClFamTTwdraZ8OTZLMjJh0OPnqMmho4GE8Kc31sL/xcf1kTFkXh/CbUFd1+zjz2lpK8IZHr3E0zxpljU9I4ErJnbo2jUzWlstve5+zc1QuqoHbYRJjjchpBtEXTu2fPuU5nPpqQ+g9pG3OV6Se51G6tBVJbJfZ9WcBrvktfzBVf6liUOymNJjsBA+h5RJ1jcY70qLeHzxySQ2FBA/5FHoNkAGLoQzXrZ/r3PFtTJG5Apm1IwtAYs4sHSgBii8sLk7FEK1Y4KdVfJP8ekRg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199015)(36840700001)(40470700004)(46966006)(47076005)(41300700001)(83380400001)(426003)(36860700001)(82740400003)(82310400005)(2906002)(81166007)(356005)(5660300002)(8936002)(44832011)(40480700001)(316002)(478600001)(8676002)(1076003)(186003)(2616005)(40460700003)(336012)(26005)(4326008)(54906003)(86362001)(110136005)(70206006)(6666004)(7696005)(70586007)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:26:48.5332 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07445219-e701-493e-7caa-08daf582f846
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C964.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4474
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

From: Joshua Ashton <joshua@froggi.es>

Replace the messy two if-else chains here that were
on the same value with a switch on the enum.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 .../gpu/drm/amd/display/dc/core/dc_resource.c | 28 +++++++++++--------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 06b5f49e0954..151981217c5f 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -3010,23 +3010,29 @@ static void set_avi_info_frame(
 	hdmi_info.bits.S0_S1 = scan_type;
 
 	/* C0, C1 : Colorimetry */
-	if (color_space == COLOR_SPACE_YCBCR709 ||
-			color_space == COLOR_SPACE_YCBCR709_LIMITED)
+	switch (color_space) {
+	case COLOR_SPACE_YCBCR709:
+	case COLOR_SPACE_YCBCR709_LIMITED:
 		hdmi_info.bits.C0_C1 = COLORIMETRY_ITU709;
-	else if (color_space == COLOR_SPACE_YCBCR601 ||
-			color_space == COLOR_SPACE_YCBCR601_LIMITED)
+		break;
+	case COLOR_SPACE_YCBCR601:
+	case COLOR_SPACE_YCBCR601_LIMITED:
 		hdmi_info.bits.C0_C1 = COLORIMETRY_ITU601;
-	else {
-		hdmi_info.bits.C0_C1 = COLORIMETRY_NO_DATA;
-	}
-	if (color_space == COLOR_SPACE_2020_RGB_FULLRANGE ||
-			color_space == COLOR_SPACE_2020_RGB_LIMITEDRANGE ||
-			color_space == COLOR_SPACE_2020_YCBCR) {
+		break;
+	case COLOR_SPACE_2020_RGB_FULLRANGE:
+	case COLOR_SPACE_2020_RGB_LIMITEDRANGE:
+	case COLOR_SPACE_2020_YCBCR:
 		hdmi_info.bits.EC0_EC2 = COLORIMETRYEX_BT2020RGBYCBCR;
 		hdmi_info.bits.C0_C1   = COLORIMETRY_EXTENDED;
-	} else if (color_space == COLOR_SPACE_ADOBERGB) {
+		break;
+	case COLOR_SPACE_ADOBERGB:
 		hdmi_info.bits.EC0_EC2 = COLORIMETRYEX_ADOBERGB;
 		hdmi_info.bits.C0_C1   = COLORIMETRY_EXTENDED;
+		break;
+	case COLOR_SPACE_SRGB:
+	default:
+		hdmi_info.bits.C0_C1 = COLORIMETRY_NO_DATA;
+		break;
 	}
 
 	if (pixel_encoding && color_space == COLOR_SPACE_2020_YCBCR &&
-- 
2.39.0

