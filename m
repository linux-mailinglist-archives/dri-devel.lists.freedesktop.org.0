Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E152F2DFA4E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 10:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE106E480;
	Mon, 21 Dec 2020 09:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AC96E081
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Dec 2020 18:32:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+bRiiLvJ9wh8CttmOkg6h4B/ECZDTh2j4It/LPFP4QONlUUxP2DCb67PgGgQ0gszDyZ2yplCac7POgOhV6KsyyPkn9k3W/SN+DgHs1q1/bqBLVnt6UXYti0uJBBYorTeoCQGJsrX7ifrhTekt0LXFviK1KvMQ1yy3tpUAXGGELhRU2bc0qjCmN13jlI7aRw8VL9LwJotm9SoMeOEzbFVV5eNq1YwcktvyjcYUnxnnBjD68vk1diG/7/LiGzuwljVCCYhiXp1AlM+WEwZ3vGd3WLh6doxkmaj+RxiWKK1+2wC3tT+haFSzs7ZRi4WptWLapL6VyAwl7nyf7f54T06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7+6p3xnzdPyN45CYp43fnnCayaoC4FVb10hjZRy4HI=;
 b=aQWzfx8pUanzA7+Nzn5PK371FlU4oGdI1Lk6+yO6j03yepnCg4dV9FP5YHwtr41kC63DR9je48s1WM6VTorAvpGbF3hiJ1Mef0JX8xiTbJT+Ckp9UFe3YiR9bqLP3m40RjJl2ZsrqIIUWv2gc1I3vf5brgvI4n5JpJLEZiq419teYrApQ3MPHwQ7j7tBpT5nRPtFA8ZB3zxKNufxTtsw0IvpDYLm59fVBNaac1ODGydoZMjetWYxCr280W1PnkOojk6BfnqQSDZouTM8qAB26i+T+wqjO7qEq7u9Esj+e+Rq1GJm44UyzysrtVDg2xVGfMBMTjB5cPj7KiVWmOw2Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=linux.intel.com
 smtp.mailfrom=amd.corp-partner.google.com; dmarc=fail (p=reject sp=reject
 pct=100) action=oreject header.from=amd.corp-partner.google.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7+6p3xnzdPyN45CYp43fnnCayaoC4FVb10hjZRy4HI=;
 b=2Jl8Wo+YEbN8OxPD115GMk/06A1smvfMVFT+dzsk2ar+N0sXQImXfdbxzpIncpAzRcWxUvPZ/t9MU/aA1f+wz7EqcZY8U3L6YZvBNx86egm4rGm795OzNI7r7sMnqOBUtkNDptIYfM4hqPwkBEmn+igst5lRbdzmpIA2O69abgw=
Received: from DM6PR07CA0096.namprd07.prod.outlook.com (2603:10b6:5:337::29)
 by DM6PR12MB3513.namprd12.prod.outlook.com (2603:10b6:5:18a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Sun, 20 Dec
 2020 18:32:27 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::3b) by DM6PR07CA0096.outlook.office365.com
 (2603:10b6:5:337::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29 via Frontend
 Transport; Sun, 20 Dec 2020 18:32:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.corp-partner.google.com; linux.intel.com;
 dkim=none (message not signed) header.d=none;linux.intel.com; dmarc=fail
 action=oreject header.from=amd.corp-partner.google.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.corp-partner.google.com discourages use of 165.204.84.17 as permitted
 sender)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3676.25 via Frontend Transport; Sun, 20 Dec 2020 18:32:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Sun, 20 Dec
 2020 12:32:24 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Sun, 20 Dec
 2020 12:32:24 -0600
Received: from chingli-LINUX-KPR.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1979.3
 via Frontend Transport; Sun, 20 Dec 2020 12:32:22 -0600
From: <ching-shih.li@amd.corp-partner.google.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <sean@poorly.run>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH] [PATCH] gpu/drm: Parse all ext. blocks in EDID
Date: Mon, 21 Dec 2020 02:14:36 +0800
Message-ID: <20201220181436.756740-1-ching-shih.li@amd.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff760730-5163-4925-4872-08d8a51599b3
X-MS-TrafficTypeDiagnostic: DM6PR12MB3513:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3513C32A494E2AC246AE4475EEC10@DM6PR12MB3513.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ShynG4WM9eNGOzu/dPOVE6klR0spaH8CzOoQE+EWx2Pk6EGJLaSOZsKpv1dXzEeyqiEF8GbKuDsam3YpOLhSvxEQxMecI5N2pMhxurkmP96UAtmRMq2r8ZLhhmdAGQDeblWJ42iv/ERKo9EOTa0ANVrvRed+HupcRiPgtrNl7d8OuNMSlycS4+Oo11BkAN3G8/bDCcfefc/NmPMmz+XjQvQWWHYTLdWmCfsYWZ47QUGA20/zvHgD0yBPfWfThSwSQtmXnuHmyRzFXgZFQv6VhFFRWZS5hfiXSGk+19rRA3UHBc92tGMHrTo4LXmpB00FiAg8lfZYErDnUhxb8ncEtZCKb3QFtygzyGZNKAFhaea5HIhbFzPPRLOzGJSzN+vSRnVeYROFeg61wTOWAcck4aKGX2ohLkU52oMu0wBP2Hfz2p2q5HM+wOr1Oqpul34h7jjTdkCoGGGlTncljyTtPFvtSnpis5KgdBSpntvwRbI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966005)(316002)(498600001)(5660300002)(4326008)(86362001)(8936002)(54906003)(83380400001)(110136005)(356005)(8676002)(336012)(2906002)(76482006)(82310400003)(70206006)(47076004)(6666004)(26005)(70586007)(1076003)(2616005)(82740400003)(2876002)(81166007)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2020 18:32:26.3545 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff760730-5163-4925-4872-08d8a51599b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3513
X-Mailman-Approved-At: Mon, 21 Dec 2020 09:36:18 +0000
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
