Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B36C36B82F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 19:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EBB6E85F;
	Mon, 26 Apr 2021 17:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383356E85C;
 Mon, 26 Apr 2021 17:39:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejoUfPuEMu2DposODwK0ZpCwsuOy77PFrS7J7cjbqNceTBCOTA1ZVrSu2W1ijTnNiPSY1uSN5DUD/+L/0h0srmJK6E8DilRGUMrXkhKDayvGRVgKtud6jCIcgVYqscH9HAxYKNYuzSizqUFkUVyn5AlSX+iACubTeYnx4C2nMUWFmJWwrBR+fG/ZfJ/WH9Zj4ocnFcx8yyjVxbeIey1Q8i5f+K+pXT9vlz5u3UAgm6pctiJQc+FRS8HtvrLJk7/eQh6h6w7AM8UORs+9csGTgqG7glQCFLDGCYLrv5I9c1gypPCk3hNCgrrh9JVM52tnPFXjsytx7awPc4H4M3KH+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLAMk5lIZoYzYokETm2j+OLSsExTo1lcknIMTgD3wi0=;
 b=iR1nkvaO6d+g6D5KtUXbayR2BPM7JuSw1VZ9vrdrtA3q3KT6erRrmeywi60J0K+9v7aXOOCb6PIkt2hELRQ2zskJStwx4lrb1wszWRuEqVglilR0kIOUm3UzG3OnAQ2hd+7j4jKJrrlTEPkV/kGSxVGZ0lZm5D54Ym3Gc2hjPqLELCXTnLPygDarCkdDwISLvz3rfmwncmptGHhhSc9FwxdKVwJl2EuBVjQFEXfyg8UodfYgx5Yd0uOO08SLLjwRK74+fPE8jCZfh1KydGV6evOU4n1orpHTGA1DxMnmcJlchEguqEHelvORgOuT0z4hgBxuPnMzJjS5eiFhlqUKdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLAMk5lIZoYzYokETm2j+OLSsExTo1lcknIMTgD3wi0=;
 b=njx1qP2wxBbsPnDmb8qsI3Kw7jv8mm8xxQc/GkH18RgHv7ugHBfSW9j9lrthxsRRq3L6NsvFNvCuSvqiD2m6jhWMYeLHF+OpJ/5hrCXA7FSzx3tjTrjIdHXv8UwwJPJWxVDw3Xk5IAAAQxKtyhf/gY1zVu1zzs8ZCMmC3JwbmrU=
Received: from MW4PR04CA0108.namprd04.prod.outlook.com (2603:10b6:303:83::23)
 by BY5PR12MB3809.namprd12.prod.outlook.com (2603:10b6:a03:1aa::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Mon, 26 Apr
 2021 17:39:00 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::1a) by MW4PR04CA0108.outlook.office365.com
 (2603:10b6:303:83::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend
 Transport; Mon, 26 Apr 2021 17:39:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 17:39:00 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Apr
 2021 12:38:59 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Apr
 2021 12:38:59 -0500
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 26 Apr 2021 12:38:57 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ppaalanen@gmail.com>, <sebastian@sebastianwick.net>, <mcasas@google.com>
Subject: [RFC PATCH 1/3] drm/color: Add RGB Color encodings
Date: Mon, 26 Apr 2021 13:38:50 -0400
Message-ID: <20210426173852.484368-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210426173852.484368-1-harry.wentland@amd.com>
References: <20210426173852.484368-1-harry.wentland@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe954c36-11e4-462a-f377-08d908da2d2b
X-MS-TrafficTypeDiagnostic: BY5PR12MB3809:
X-Microsoft-Antispam-PRVS: <BY5PR12MB38092BB972D00C217351C4538C429@BY5PR12MB3809.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LY28GP7bmTeoMRt8x309hXPdPeRHR39ksz9t/qTM96fq6Neu89G6sZHg78DeVGofvWede0iD5o8CvWIBmnsuVDV+5GaW+9m6VZMMILsBh46lqKHmzHqCE3qLgWsNmJ2sTLT6tQHT7q5EQqWWrH9fZ/JP9fK0AE40XxMtG8lV++SRj63DbUX2n+0J4g/qtn3II0+U5rDhgumC5MMp4MpkK/G+dAZwUkDz5Nm32WnalOCDQnGeQfa7oQt+P0iRQpgEsNukF5qTPdIu9i2BP7M1Ztrh3wTrEgDRBzLYV3a43MxfqwU5IIQjlP7jQiGb8HJ0bmQWRnOa84/fKNC2vBVTeLmnKyIYgX6aslIumcElFOYIw7hw0mjUFlckCTke6qP+QPrdRxR0CvaGwxzia9G2FQ3rhhWjJ82YKeFyPW3PvpBtX/soRNR04KCrm7+SbCZEQQ8SlvPsKmSpYAB6+DmqtUVylKEN92KHD3KKaIJyYRQmB3Ydv+tsGWDeSnaJ/135iHzG9pvSpiOM/KQuXhGOOpumyzToUfuXyD+Mer8asLOS89QyOLXu3Plt0ramOwN6oW3V3bsSife9zETccM4uCCAru9H3K9ZKfwjWLHk4O43eJjwGcYru+7YkR8bGXRHuSKcWkAR6NMek6/lX0/430g2l8WcmrQvFeyJWeT1tlS1Tjo9Ew3tvAMNq/SzxggvD
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(36840700001)(46966006)(36860700001)(2616005)(36756003)(356005)(8676002)(6666004)(316002)(86362001)(110136005)(2906002)(82740400003)(54906003)(478600001)(70586007)(186003)(70206006)(26005)(7696005)(81166007)(5660300002)(426003)(1076003)(4326008)(47076005)(8936002)(44832011)(336012)(82310400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 17:39:00.1784 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe954c36-11e4-462a-f377-08d908da2d2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3809
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, Shashank.Sharma@amd.com,
 Shirish.S@amd.com, hersenxs.wu@amd.com, Vitaly.Prosyak@amd.com,
 laurentiu.palcu@oss.nxp.com, Bhawanpreet.Lakha@amd.com,
 Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

Add the following color encodings
- RGB versions for BT601, BT709, BT2020
- DCI-P3: Used for digital movies

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_color_mgmt.c | 4 ++++
 include/drm/drm_color_mgmt.h     | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index bb14f488c8f6..a183ebae2941 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -469,6 +469,10 @@ static const char * const color_encoding_name[] = {
 	[DRM_COLOR_YCBCR_BT601] = "ITU-R BT.601 YCbCr",
 	[DRM_COLOR_YCBCR_BT709] = "ITU-R BT.709 YCbCr",
 	[DRM_COLOR_YCBCR_BT2020] = "ITU-R BT.2020 YCbCr",
+	[DRM_COLOR_RGB_BT601] = "ITU-R BT.601 RGB",
+	[DRM_COLOR_RGB_BT709] = "ITU-R BT.709 RGB",
+	[DRM_COLOR_RGB_BT2020] = "ITU-R BT.2020 RGB",
+	[DRM_COLOR_P3] = "DCI-P3",
 };
 
 static const char * const color_range_name[] = {
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 81c298488b0c..3043dd73480c 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -78,6 +78,10 @@ enum drm_color_encoding {
 	DRM_COLOR_YCBCR_BT601,
 	DRM_COLOR_YCBCR_BT709,
 	DRM_COLOR_YCBCR_BT2020,
+	DRM_COLOR_RGB_BT601,
+	DRM_COLOR_RGB_BT709,
+	DRM_COLOR_RGB_BT2020,
+	DRM_COLOR_P3,
 	DRM_COLOR_ENCODING_MAX,
 };
 
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
