Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B59E669DCC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039BD10EA46;
	Fri, 13 Jan 2023 16:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5757D10EA3F;
 Fri, 13 Jan 2023 16:25:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyS5P+Yp4f5ymo9oAazpV0rwwXbUg+T+qq19KYNdkdQk6QRYbpTFySjOLvhcOz+ziHauFXPih2anNmsPS7vABvSX6lGpiyOXSnjusethr/cO9e/eGcWvgehUFprWnxJsA7AcbJ1nuzQiMpmnY/YksfEvZfcUYRhXaJaZuYbbpgc5LP2j1uIDLgOahXeE33untUsg7nQbgOxgnQglYM+VOTV59YASMBkBGoUq1j/jBVYiQm31hfzOcoOehEDpByUMVXs8lAxv4ngWWzAZ21Hth3oDnwM6QiCLU7UBVhZ4Ag0JGQpwHiGd1SyLBaSOGb5NLBq9NeHdtbxR6PMwj4UCzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRfBP81zMXERwt3tcb7lniYMS35doyZbkdoXuvLjBaM=;
 b=PeU9qp/QEqFWgqUujG27eHekpP5dfpvHq7tZP5o1MVPk7rLRJsAWsXbf7bSlStFNu3MEvbWE7io8ooM5rXyU2ePZmymm9rvqusXtRvxu3KZBV/BblHOKB+1posZeTfI0RJmlO2UowSbQoLWrcgwUyWasvlwStddamwsHCVZc454q1YgOSqRvTli55LACEwIRrnKLRW7YEW7K2P3vvXbqoXFxDzSsimoc6XS+gPD018THSIrJ0UGWe5DZ+KrJBRDUAO1vA4pqAgcEhGlhCDHGKM8qTik9FQiUF/Mltb7DMuJdtHlQh49Puq8/NaEQn6W4n6hi9S0OARswlgBRW/cNTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRfBP81zMXERwt3tcb7lniYMS35doyZbkdoXuvLjBaM=;
 b=JjJMJWaR4L97hsu+c65L8yVChHXmd1LyQ1BP9AwIz3KsZnQPX9Mf/6bR4ucWl1MQUq/bt1M/foozpIIkCX0Vaekf0d/WT0eZoAV8DdICkfWY7jYvjKCtHcco678Ja6jcPw0gGHDV6AzSrdDlafk8sKg9Gt1DbXYz8Oq5XPOJen8=
Received: from BN1PR13CA0005.namprd13.prod.outlook.com (2603:10b6:408:e2::10)
 by MW3PR12MB4490.namprd12.prod.outlook.com (2603:10b6:303:2f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 16:25:12 +0000
Received: from BL02EPF000108E9.namprd05.prod.outlook.com
 (2603:10b6:408:e2:cafe::81) by BN1PR13CA0005.outlook.office365.com
 (2603:10b6:408:e2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Fri, 13 Jan 2023 16:25:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF000108E9.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 13 Jan 2023 16:25:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:25:05 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:25:04 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 17/21] drm/amd/display: Format input and output CSC matrix
Date: Fri, 13 Jan 2023 11:24:24 -0500
Message-ID: <20230113162428.33874-18-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108E9:EE_|MW3PR12MB4490:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a0a5889-ce03-4998-814a-08daf582bedb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GBLZSbRT7OAx+k18qrSTxqv/SbaUWwxr1LNQh7Lv58jj8+FcQ3pwef4iRHwBYmqDFAx/UNB9GmSfQ+RPmwN0IrwPFx4uWBKydXxE5NUWg90QWStwO7+Cqe+LlMOu7OJN5MsopY876vjJgjAc5PV9+7AlKwHYSuucMjVo2rscSIwX+SqFIn7Im4xyLryPBK8pxJ03Ou3qr2cUpHKuhDAmUWTd8WnM4uOdtyTzZ7y6AChxO3Fgf0IFEDC0SSY5riaGwE2NAOIv8KvpjPZpCiVVjpFTmeG0WupSi1PmwLwlsICUReDtnz+Hz3bElKrwhilQa/DSimjdhvETeCalZActUPul2DDW8+dyGmktJZE+vp3gELwInWSu/4FJsk/K51laLmKxpCpDP9F5VHzSSTpCzELUtbugYhKQMohJNqYPeJNAq+k4p+PbwdQ1MUNfzRQcSwW4YYjKuTDkYfGROHX+9oIOV5BCNENIFDlOm1unu7X751Fg0gZb9+Tniqn4C1CFs2OzBFXC8QwpMjZTLAzKsTHC0qyylhY9U2l7xDxnC7mODOrNZ8nKSd0gZJyN2gvZUeC51eJxYdtAY5AV8Zh6W8dBO38h6u/HclQDp2xn7LoulYcyW49Cmi4JbwFy2ACOtTcofRnB2CjdGNeqTlcXMpEBa+UP7FpnW9pu1nvi590iBgdFMa8Cxer5+wbo6OXEbl9+ktSOGZpIrrqEBgZLw4JIMOK3TWrhGx+/QLFKq4Q=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199015)(46966006)(40470700004)(36840700001)(82310400005)(40480700001)(5660300002)(8936002)(40460700003)(44832011)(426003)(41300700001)(54906003)(8676002)(316002)(7696005)(70586007)(4326008)(356005)(110136005)(70206006)(81166007)(82740400003)(336012)(2616005)(26005)(47076005)(2906002)(1076003)(86362001)(186003)(36756003)(36860700001)(478600001)(83380400001)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:25:12.2488 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0a5889-ce03-4998-814a-08daf582bedb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4490
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

Format the input and output CSC matrix so they
look like 3x4 matrixes. This will make parsing them
much easier and allows us to quickly spot potential
mistakes.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 .../drm/amd/display/dc/core/dc_hw_sequencer.c | 38 ++++++++-----
 drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   | 54 +++++++++++--------
 2 files changed, 56 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
index 471078fc3900..a70f045fc5c1 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
@@ -73,28 +73,38 @@ struct out_csc_color_matrix_type {
 
 static const struct out_csc_color_matrix_type output_csc_matrix[] = {
 	{ COLOR_SPACE_RGB_TYPE,
-		{ 0x2000, 0, 0, 0, 0, 0x2000, 0, 0, 0, 0, 0x2000, 0} },
+		{ 0x2000, 0,      0,      0,
+		  0,      0x2000, 0,      0,
+		  0,      0,      0x2000, 0} },
 	{ COLOR_SPACE_RGB_LIMITED_TYPE,
-		{ 0x1B67, 0, 0, 0x201, 0, 0x1B67, 0, 0x201, 0, 0, 0x1B67, 0x201} },
+		{ 0x1B67, 0,      0,      0x201,
+		  0,      0x1B67, 0,      0x201,
+		  0,      0,      0x1B67, 0x201} },
 	{ COLOR_SPACE_YCBCR601_TYPE,
-		{ 0xE04, 0xF444, 0xFDB9, 0x1004, 0x831, 0x1016, 0x320, 0x201, 0xFB45,
-				0xF6B7, 0xE04, 0x1004} },
+		{ 0xE04,  0xF444, 0xFDB9, 0x1004,
+		  0x831,  0x1016, 0x320,  0x201,
+		  0xFB45, 0xF6B7, 0xE04,  0x1004} },
 	{ COLOR_SPACE_YCBCR709_TYPE,
-		{ 0xE04, 0xF345, 0xFEB7, 0x1004, 0x5D3, 0x1399, 0x1FA,
-				0x201, 0xFCCA, 0xF533, 0xE04, 0x1004} },
+		{ 0xE04,  0xF345, 0xFEB7, 0x1004,
+		  0x5D3,  0x1399, 0x1FA,  0x201,
+		  0xFCCA, 0xF533, 0xE04,  0x1004} },
 	/* TODO: correct values below */
 	{ COLOR_SPACE_YCBCR601_LIMITED_TYPE,
-		{ 0xE00, 0xF447, 0xFDB9, 0x1000, 0x991,
-				0x12C9, 0x3A6, 0x200, 0xFB47, 0xF6B9, 0xE00, 0x1000} },
+		{ 0xE00,  0xF447, 0xFDB9, 0x1000,
+		  0x991,  0x12C9, 0x3A6,  0x200,
+		  0xFB47, 0xF6B9, 0xE00,  0x1000} },
 	{ COLOR_SPACE_YCBCR709_LIMITED_TYPE,
-		{ 0xE00, 0xF349, 0xFEB7, 0x1000, 0x6CE, 0x16E3,
-				0x24F, 0x200, 0xFCCB, 0xF535, 0xE00, 0x1000} },
+		{ 0xE00, 0xF349, 0xFEB7, 0x1000,
+		  0x6CE, 0x16E3, 0x24F,  0x200,
+		  0xFCCB, 0xF535, 0xE00, 0x1000} },
 	{ COLOR_SPACE_YCBCR2020_TYPE,
-		{ 0x1000, 0xF149, 0xFEB7, 0x0000, 0x0868, 0x15B2,
-				0x01E6, 0x0000, 0xFB88, 0xF478, 0x1000, 0x0000} },
+		{ 0x1000, 0xF149, 0xFEB7, 0x0000,
+		  0x0868, 0x15B2, 0x01E6, 0x0000,
+		  0xFB88, 0xF478, 0x1000, 0x0000} },
 	{ COLOR_SPACE_YCBCR709_BLACK_TYPE,
-		{ 0x0000, 0x0000, 0x0000, 0x1000, 0x0000, 0x0000,
-				0x0000, 0x0200, 0x0000, 0x0000, 0x0000, 0x1000} },
+		{ 0x0000, 0x0000, 0x0000, 0x1000,
+		  0x0000, 0x0000, 0x0000, 0x0200,
+		  0x0000, 0x0000, 0x0000, 0x1000} },
 };
 
 static bool is_rgb_type(
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
index 131fcfa28bca..f4aa76e02518 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h
@@ -70,28 +70,38 @@ struct dpp_input_csc_matrix {
 };
 
 static const struct dpp_input_csc_matrix __maybe_unused dpp_input_csc_matrix[] = {
-	{COLOR_SPACE_SRGB,
-		{0x2000, 0, 0, 0, 0, 0x2000, 0, 0, 0, 0, 0x2000, 0} },
-	{COLOR_SPACE_SRGB_LIMITED,
-		{0x2000, 0, 0, 0, 0, 0x2000, 0, 0, 0, 0, 0x2000, 0} },
-	{COLOR_SPACE_YCBCR601,
-		{0x2cdd, 0x2000, 0, 0xe991, 0xe926, 0x2000, 0xf4fd, 0x10ef,
-						0, 0x2000, 0x38b4, 0xe3a6} },
-	{COLOR_SPACE_YCBCR601_LIMITED,
-		{0x3353, 0x2568, 0, 0xe400, 0xe5dc, 0x2568, 0xf367, 0x1108,
-						0, 0x2568, 0x40de, 0xdd3a} },
-	{COLOR_SPACE_YCBCR709,
-		{0x3265, 0x2000, 0, 0xe6ce, 0xf105, 0x2000, 0xfa01, 0xa7d, 0,
-						0x2000, 0x3b61, 0xe24f} },
-	{COLOR_SPACE_YCBCR709_LIMITED,
-		{0x39a6, 0x2568, 0, 0xe0d6, 0xeedd, 0x2568, 0xf925, 0x9a8, 0,
-						0x2568, 0x43ee, 0xdbb2} },
-	{COLOR_SPACE_2020_YCBCR,
-		{0x2F30, 0x2000, 0, 0xE869, 0xEDB7, 0x2000, 0xFABC, 0xBC6, 0,
-						0x2000, 0x3C34, 0xE1E6} },
-	{COLOR_SPACE_2020_RGB_LIMITEDRANGE,
-		{0x35E0, 0x255F, 0, 0xE2B3, 0xEB20, 0x255F, 0xF9FD, 0xB1E, 0,
-						0x255F, 0x44BD, 0xDB43} }
+	{ COLOR_SPACE_SRGB,
+		{ 0x2000, 0,      0,      0,
+		  0,      0x2000, 0,      0,
+		  0,      0,      0x2000, 0 } },
+	{ COLOR_SPACE_SRGB_LIMITED,
+		{ 0x2000, 0,      0,      0,
+		  0,      0x2000, 0,      0,
+		  0,      0,      0x2000, 0 } },
+	{ COLOR_SPACE_YCBCR601,
+		{ 0x2cdd, 0x2000, 0,      0xe991,
+		  0xe926, 0x2000, 0xf4fd, 0x10ef,
+		  0,      0x2000, 0x38b4, 0xe3a6 } },
+	{ COLOR_SPACE_YCBCR601_LIMITED,
+		{ 0x3353, 0x2568, 0,      0xe400,
+		  0xe5dc, 0x2568, 0xf367, 0x1108,
+		  0,      0x2568, 0x40de, 0xdd3a } },
+	{ COLOR_SPACE_YCBCR709,
+		{ 0x3265, 0x2000, 0,      0xe6ce,
+		  0xf105, 0x2000, 0xfa01, 0xa7d,
+		  0,      0x2000, 0x3b61, 0xe24f } },
+	{ COLOR_SPACE_YCBCR709_LIMITED,
+		{ 0x39a6, 0x2568, 0,      0xe0d6,
+		  0xeedd, 0x2568, 0xf925, 0x9a8,
+		  0,      0x2568, 0x43ee, 0xdbb2 } },
+	{ COLOR_SPACE_2020_YCBCR,
+		{ 0x2F30, 0x2000, 0,      0xE869,
+		  0xEDB7, 0x2000, 0xFABC, 0xBC6,
+		  0,      0x2000, 0x3C34, 0xE1E6 } },
+	{ COLOR_SPACE_2020_RGB_LIMITEDRANGE,
+		{ 0x35E0, 0x255F, 0,      0xE2B3,
+		  0xEB20, 0x255F, 0xF9FD, 0xB1E,
+		  0,      0x255F, 0x44BD, 0xDB43 } }
 };
 
 struct dpp_grph_csc_adjustment {
-- 
2.39.0

