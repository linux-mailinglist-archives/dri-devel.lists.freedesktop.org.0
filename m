Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037123085E6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 07:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC0B6E1A2;
	Fri, 29 Jan 2021 06:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2086.outbound.protection.outlook.com [40.107.100.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2957F6E1A2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 06:37:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DsJAt1D8e/mgY79lqr9vOzWw3lobh7jfLvrdo46gaIDg5dosDZJzMjExXi+U2jehiLevInK/XzCjx7Th6wKLMRxKVQVh5MI5HibpqnzzJFOQkgZGuCNd0quxFREx7mIMBjMSeoAFAqBYNLuV/tD833W3N9NUrQDQiVQy4x7+wnk9j4YLxqIgq1aDzC42lUcy9Fg7JdiADDzm+RGeXRGEaOUJJpd+W7Hu7naHGcVfn3LJVlxiDGIwWy9PPJ3mLLpKgrsf434Xlii5ooxNASeaUcLb8VcVDTNpA1nCuDmPaq9XxhcFkU6gaXX8x7n6XLjV5sVaIXI96OSB/ia2E3Jv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7+6p3xnzdPyN45CYp43fnnCayaoC4FVb10hjZRy4HI=;
 b=Oj4rlB2cHjBUI9jY+w1UIVuMpdAJfCo+ar+qfsICsNIHrIKhGjSnnn52JoQSM0mvdUdGX881TwzFFXTV1UAvJmEbYlbYOERWWCm/IIOwFoYd924CKbVEGb9a16iif/mOOUFJXX1pFBvjkEU9BVJIeo39/L2cNuc7zVd3BVJ70IQmB5+n0AHwpqgC5l+7rL2V7R8izwbQESeAs/6yGAbR5w5KvAetjg8eAvGaZzUmRTla5A8fyenzKnt1eGzH/tFqcdArp/6pOQQVACa3QR5qS9nFURhg91kqbgc/gaL5u0R3uS70FAhuMKK9rUcnJMnaxQE7uCLcM7xatqxZqzKWbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7+6p3xnzdPyN45CYp43fnnCayaoC4FVb10hjZRy4HI=;
 b=UOgwrNrKruzP89TZpHB7hYGoyI9GuDxwRgcrEh/wwsP+GF7qlh/GJZvvfiCKdHLcYYqgRPDYeN5Pbrxb3bwEvcv8MbEIr4ld7P9+5HKysACFU6IFQ7rqVQeg1/eHIn9WcVrtHOUG8hR/Br5Jytj3vQySQoc5q8GB3cyTfwrBf7k=
Received: from DS7PR03CA0261.namprd03.prod.outlook.com (2603:10b6:5:3b3::26)
 by BN8PR12MB3218.namprd12.prod.outlook.com (2603:10b6:408:6b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Fri, 29 Jan
 2021 06:37:16 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::aa) by DS7PR03CA0261.outlook.office365.com
 (2603:10b6:5:3b3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend
 Transport; Fri, 29 Jan 2021 06:37:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not
 signed) header.d=none;linux.intel.com; dmarc=fail action=none
 header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Fri, 29 Jan 2021 06:37:13 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 29 Jan
 2021 00:37:13 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 29 Jan
 2021 00:37:13 -0600
Received: from chingli-LINUX-KPR.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1979.3
 via Frontend Transport; Fri, 29 Jan 2021 00:37:10 -0600
From: <Ching-shih.Li@amd.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <sean@poorly.run>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] gpu/drm: Parse all ext. blocks in EDID
Date: Fri, 29 Jan 2021 14:33:53 +0800
Message-ID: <20210129063353.95852-1-Ching-shih.Li@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 647e8768-25da-49e1-e813-08d8c420506d
X-MS-TrafficTypeDiagnostic: BN8PR12MB3218:
X-Microsoft-Antispam-PRVS: <BN8PR12MB32188FC22C49CF6A61B25F7BAAB99@BN8PR12MB3218.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rDVo/XVja5za8WGR4X3PkEZmm2BHiBJ2X64qsVx2z4xzJAk1E7QVHf7XPqLcc3uCU0Ro3BVzv7EXUnMF29z4rRg05Uy52QAIYacuG8CMNcvMjVH5ayu7KsP5SnkZy5V7z6Of6oPyhcVf1AvWHtveuqyyek5QMmyH/WhYmt1N4ZlBIivgPDxN2xmZqUe4O/VJtX9ZZsziQaBVRSDQuchTDNf6m6vC5tcy29HlWBHzX17mgXBzhsXDrOaXWOQzy1bhnRtOSnUe4rClqqUor7Nv6hwN6Nx+fJoyTQwlWm/qypINF3x7Xus0tzEKM/Xvep0He4UgeH0kdv3nXexBDVQx/1q1rwkI9XMyq91jg9O3o1TEdC7xWFM5i0SDwnpeM0S+ubN7PfEbtbu58a6H4J/Edphj1nfAat6E0onMeGveW/pooi0OcV5w4EEmSdSV+msBJlz1EdI/kyT1yyijBPr5WbVrYJ3nNrLm1KatggdNcx9np641LcgKnzV7QnzrUFWbeWz15xQ6B+DXH1iX9C06Fncon3YSF5+OxkPYl3hbhhLdHEiBZcvp7n05Jc9hMBKhjgWrtWAwQxooCEKKXbjo7NYNhxAEoKJF4/VCl1Sm/aKy/LosXRzcjC8dr3RrbbKg
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(46966006)(54906003)(336012)(2876002)(47076005)(6666004)(186003)(36756003)(2616005)(7696005)(83380400001)(316002)(1076003)(86362001)(110136005)(26005)(478600001)(82310400003)(70586007)(5660300002)(81166007)(8676002)(356005)(82740400003)(426003)(70206006)(8936002)(2906002)(4326008)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 06:37:13.9323 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 647e8768-25da-49e1-e813-08d8c420506d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3218
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
Cc: "mika . hsu" <mika.hsu@quanta.corp-partner.google.com>,
 Louis Li <Ching-Shih.Li@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Louis Li <Ching-Shih.Li@amd.com>

[Why] EDID parser cannot correctly parse EDID which includes
multiple same extension blocks (e.g. two same ext. blocks: <Tag=0x02: CTA
 861>, are included in EDID defined in test case HF1-66, HDMI 2.0 CTS),
since it only parse the first target ext. block only. This causes CTS fail.

[How]
Original parser searches ext. block from HEAD of EDID,
and always return the first target ext. block.
Solution is to find all ext. blocks and pass start address
of each ext. block to parser to handle.

By this change, no matter how ext. block is placed in EDID, all
target ext. blocks are handled.

Tested-by: mika.hsu <mika.hsu@quanta.corp-partner.google.com>
Signed-off-by: Louis Li <Ching-Shih.Li@amd.com>
---
 drivers/gpu/drm/drm_edid.c | 52 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 14c6a4bb32ea..adcb04516b41 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4160,9 +4160,8 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 }
 
 static int
-add_cea_modes(struct drm_connector *connector, struct edid *edid)
+handle_cea_modes(struct drm_connector *connector, const u8 *cea)
 {
-	const u8 *cea = drm_find_cea_extension(edid);
 	const u8 *db, *hdmi = NULL, *video = NULL;
 	u8 dbl, hdmi_len, video_len = 0;
 	int modes = 0;
@@ -4206,6 +4205,55 @@ add_cea_modes(struct drm_connector *connector, struct edid *edid)
 	return modes;
 }
 
+static int
+add_cea_modes(struct drm_connector *connector, struct edid *edid)
+{
+	const u8 *cea = NULL;
+	u8 *edid_ext = NULL;
+	int modes = 0;
+	int block_index = 0;
+
+	/*
+	 * Based on HDMI(2.x) CTS: HF1-66 (Iter 06), two blocks with same
+	 * tag (Tag = 0x02: CTA 861) are included in EDID. Ori. solution
+	 * checks for all additional blocks, BUT it always checks from
+	 * HEAD. Result is only 1st CTA 861 can be found and checked.
+	 * Therefore, any following CTA 861 block is never found
+	 * to handle. The modified method is to check each additional
+	 * block by pointing to the start address of that block, instead
+	 * of finding from HEAD of EDID.
+	 *
+	 * TODO: EDID parser may need re-designed, since ori. parser can't
+	 * correctly parse multiple same ext. blocks (Tag = 0x02 in this
+	 * case), since it finds and parse the 1st target ext. block only.
+	 * 1. Ori. method is not flexible to work with EDID like HF1-66.
+	 * 2. Ori. method is not efficient: a block may be checked many times.
+	 * 3. Ori. method does not support new features, e.g. Ext. BLK MAP.
+	 * etc...
+	 */
+	for (block_index = 0; block_index < edid->extensions; block_index++) {
+		edid_ext = (((u8 *)edid) + (EDID_LENGTH * (block_index + 1)));
+
+		if (edid_ext[0] == CEA_EXT) {
+			cea = ((const u8 *)edid_ext);
+			modes += handle_cea_modes(connector, cea);
+		}
+	}
+
+	/*
+	 * If no Video Data extension block, go check DisplayID block,
+	 * because CEA block may be embedded in DisplayID block.
+	 */
+	if (!cea) {
+		cea = drm_find_cea_extension(edid);
+
+		if (cea)
+			modes += handle_cea_modes(connector, cea);
+	}
+
+	return modes;
+}
+
 static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode)
 {
 	const struct drm_display_mode *cea_mode;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
