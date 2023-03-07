Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7596AE427
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9E710E4FC;
	Tue,  7 Mar 2023 15:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2068.outbound.protection.outlook.com [40.107.96.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C03910E502;
 Tue,  7 Mar 2023 15:11:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xk9BGYRzmGmO3+iMwInGBGF0lf0u/mVy8Z89x7vpp2LoGeIIUK2TjxxyPk4ZbjmSyIWsagZYu0k9UkVGbgmQhgXMgyHU6BR9P487/Mg+S/PBTtKP9JSCN29LyJ23pOQH2F4GkKI/N+dcZOVPjYDO2MLtgT4UY3XUPW/bolQW5yPYYpMhL7Vm9lxEjJmy4PAzo8sHHdxmm+ai9+C41Bp+GxXkV89QOaBeHFVbgaqKKtO+aLk2+bWZsef5qm4N2yNMnxzAA9yOBVBQYNbnJOGP6L/HgiTZbmfhO+ush8eJawOhVF1mq7m+1gagzJfe5rqmEyfO1gOjyWD0M/A0YPIPFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBFhl951ym2UNumFe1k59ihjYJ2aeOvXEb566EniULA=;
 b=KHJNmq2LNNT8XT/hyxFxXRBWeOT08IypuJ15gOoQFzhO4ozsVq7CqdijC24Ev31V84ru9nRuJpi4ZcDqkqrgs2hIrPwdnkfyS3x/b81i390vvuJRXsRPGYBcUttXrXBm/gov8da4A+anHERdbQLcCNyPTSQg13PeFfchXUL3bSlVd7aZT8D8nCRN938BXUjdf2EwKNtIwotkAQ/drtu6h32uW0kDpHUBV79Eog1rRFkY68FkZx2lcLp1b/31rSqXRyv2F6q7VPKGScmyh5SZQ0/eNWBmE59hBkhR44mQf7P2EL+YnaMuYMQ/W2vu/CLykI69/KQXajLvo/jD8PBtJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBFhl951ym2UNumFe1k59ihjYJ2aeOvXEb566EniULA=;
 b=qCQmsA2eeXo6I0aNRrTdKqiBeLiUAtGHzA9T1URPkgfvJJChUTOFJ07/vq2AXlV4kDzu3T0NnUk4PBhRDg/h7FBk93KOeghg2FwCRuYBHrsHT2ODRiAVtr5ZoAFBIwwuaulokOYVGdOjZezm1e8xqyjCyB5kQ3FOTBZbseaNu+M=
Received: from DM6PR07CA0104.namprd07.prod.outlook.com (2603:10b6:5:330::30)
 by BN9PR12MB5275.namprd12.prod.outlook.com (2603:10b6:408:100::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 15:11:32 +0000
Received: from DS1PEPF0000E62E.namprd02.prod.outlook.com
 (2603:10b6:5:330:cafe::f0) by DM6PR07CA0104.outlook.office365.com
 (2603:10b6:5:330::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29 via Frontend
 Transport; Tue, 7 Mar 2023 15:11:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E62E.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.13 via Frontend Transport; Tue, 7 Mar 2023 15:11:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:31 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:31 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Mar 2023 09:11:30 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 17/17] drm/amd/display: Refactor avi_info_frame colorimetry
 determination
Date: Tue, 7 Mar 2023 10:11:07 -0500
Message-ID: <20230307151107.49649-18-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307151107.49649-1-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E62E:EE_|BN9PR12MB5275:EE_
X-MS-Office365-Filtering-Correlation-Id: 571cc641-9db0-49ed-15e0-08db1f1e3c29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1qEChgW9xGu+E30xYsXhgYr6NNpHq1y97RItmkjoXX7/Lo6qmuzstLBIDR6N5HwSZqqNoXJGuUD5FJ7JEojo/M/L+mKVXKMjlFHTUasIf6DBqnY1abfABDHdV2UUvSH7f+iDX8x4ppEQbCtoOtbGROlM/us44snjjq7wCEJJaSNv0Z4Rn2PBtI761PWyJiO1iLB1TKlqhXzNWoxlaDN6Nw9cokfGKf3s0wcJykWMBsSHWFMUq4DG8HOJYHkMYIoGN8Fxn+L1QObwEdrfDOvVaI584zQ2tIRlBaH96BpPzD2PAbD3daZgTyi2GzunpZg5kxxE7u1LQtLa8E3xqhgwIWMJEhZ3NaYTk9ZBx8ZuevIHzDvo5FXkJe+vOjuO1amNcjU2jWHUE2XtXZlQgJ32t2NxpbfRlS+75wmvXxVWnamn0Dzz+bF07bJACe+K0yBJgVTyUPYqHFyDo0t9fCi0uwNkLohMSXfW4C/r0mfwOBe9qLrW6qkrV4jgNAYKg0a6WvdG9r4gMSY+S+ptYO86wAXO9NdbbeONOogzb8+oh0ylgcMvFHjM9lR/lSNbKX1BlT2l4rQwza3alSqE33NMUhdjhkjr02BsXGoKqyt+nzJbpQiUtgO/9PzSHrtTWrhxi/t4gOTVW0rMB54Bur2fo8eU3CWSpIhwNH70qroWJB1S2cusJaZTwlZeV6Hxr8oytViWPHBqElFUJ4oFWDOC5zxHBCbWPIr3/SIjNfYrcbw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199018)(46966006)(40470700004)(36840700001)(82310400005)(2906002)(2616005)(336012)(83380400001)(47076005)(426003)(44832011)(26005)(70586007)(70206006)(4326008)(8676002)(5660300002)(186003)(81166007)(41300700001)(1076003)(36756003)(82740400003)(6666004)(8936002)(478600001)(54906003)(356005)(110136005)(86362001)(40460700003)(316002)(40480700001)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:11:32.1082 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 571cc641-9db0-49ed-15e0-08db1f1e3c29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E62E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5275
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
index d9f2ef242b0f..34a7fb225629 100644
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
2.39.2

