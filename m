Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F26ED60B742
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 21:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8717410E777;
	Mon, 24 Oct 2022 19:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8954F10E75B;
 Mon, 24 Oct 2022 19:22:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRo/0MszIt0mFuvGMv76gBjTKd52BJCyAk7Lp7PXuAjonXjERB32CIbV/TYB3DnBHh3eHEEeuUWuB1UsTAK8fw3HHJi0BT+qH2YoGE9QvV9jF83PgUB6alw2hVSgAddCHzgY+R2HXVKsMIT8EiqHk8RoTJmvImoWsaKnSr6P7N2m5aA2z55GfYIFXmKTToTcYdvr8H6zGzq7O2zhHQKBNa7MejgCPgzKBv7tqrhtu5DBlhDVDt2NaeCfJqeJqoQqi2qTYGU2GFMP2yyR+v7STr1SPOBRSDKK562Dh4ct1sy39zlAJ4cNLcOIPtUbcg1qdcaGfjXwTaT+BUUTL/sRMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GL/1Le8oCy2H3t+2uzVA+mGJeHKilVMqGe2csm2b0GI=;
 b=TsIQaR6zEM+NIEa9/CGhYhGHaenNvO9vFQs5eqPtCbIIwiHsBGXhECtwLQOuk9iJ+3hXrAjVuNurkP75ditCNvFeDlV0wadnFHn9cVDnnAoUPLsw783Shdklo7nMfZi7xO/Z4Fl1agr0aWdOwF9WTJhbbyI70DProlxIe0sv3HJvuKeyIVdsX+lFKWtC/G0YySlV/vSIOioI0JOUeTez3+ttZr96Xosw0koNJF3/LS2+JoiAiI4RpXyeSTYVroVo2rRyDSYA89jFGUbA9bX61wVwG1p9j2t5KPcZqjCupI+G4P/PeK8WJhxmQS8rLNyqUc+AxzcRwyS5orirRxsRyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GL/1Le8oCy2H3t+2uzVA+mGJeHKilVMqGe2csm2b0GI=;
 b=OM0n41pmuhYK0BFarv4Cqk0UTHlLDDEzXqe8pIunbcFHTk4CMZ776qdWOxcUeLT6XLljIsQdRvrwA9pCgj0dzXvVeP+69DB1hiC9RgAXat1dBNT2gVpGa0Cy7OwF2Bm02tR/jIyfJ6vo+Jq8bKIBnDuFWHngIy/lKbDH/qNK5tk=
Received: from BN0PR04CA0112.namprd04.prod.outlook.com (2603:10b6:408:ec::27)
 by CH0PR12MB5156.namprd12.prod.outlook.com (2603:10b6:610:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 19:22:08 +0000
Received: from BL02EPF0000C403.namprd05.prod.outlook.com
 (2603:10b6:408:ec:cafe::48) by BN0PR04CA0112.outlook.office365.com
 (2603:10b6:408:ec::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Mon, 24 Oct 2022 19:22:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C403.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Mon, 24 Oct 2022 19:22:08 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 14:22:06 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] drm/edid: add a quirk for two LG monitors to get them to
 work on 10bpc
Date: Mon, 24 Oct 2022 15:22:21 -0400
Message-ID: <20221024192224.180507-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C403:EE_|CH0PR12MB5156:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c4de3bf-299e-4077-0122-08dab5f50b2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ea7FrIMOAWRj9FnKolmr2weZfpaX6zutlLQeepGjZGMyqcbkXQgaKjzn3mlm0pS2AyYjjccrZm89UBN7Z7QN7Ne5pHYL2u2Z8fJDwLKenD+rTBKHhHVuzwfkBPL4lO5+k4vDkSbqun1SYURCHOwHvvY1DsTjmY0AkSpT3uuBG2dE73kK9Zai5R5BicnllXebIyzLe+I4T2oeBv6Sl7zQMD4Vem/io4xYic1DjsgMweHQ8UJhYnTwPNgcObZOanw57vy9B5/4YT6KceFn4IJA0cyZKmR6lJQYFer3TkjrM90OUTvk1ap85JZS+pxlUKpMDu+hb+1Zk9/gD3DNT3vaPSXOMkhbgPChlSJlHmm+p7FHMOcB9aboMudpIGMKzD1adbSXsmobGC55+Rc6/7Xw1Zd67d0hmUwFvZn9cylJXwHZdvjRaCkIjPj8iFY94zJFfyw+TVJaT6/b3aUQlYkT4bUXnyOMxG9SSYgS/C5AKgtV2MxyWyBaW6SHonflkQn9Q/oBcSMtulYADGBVrEp+UFblS0xiTsZ5zS2u2H0LBPo8KdjhwnWP00F1Lt/8XBWrI2vxyPZtZ6rx+DPd+ZPJVdWVhLt1q0KNnQlNNELB8LDcbOOzS6U9fT72OKEcO8tn6EexSl+Cww2VVnB1k9/XeXOIssQwA8sO4EUc2QTvaE2at2HNadEOwcH06FVG5gfVl84TGrk11rNM8fy6ZNsxc15OLHDI0d0tGToktnyxIGajMBK/1i2LvxV7aHzgp04BuOVAKGW1lK7IrCst2OjrzZigTwTcdRAVDhu0Ri6p7DGTSC3KiR0WKkBIQSV8A9sZ3P95vWeE6nrSoMJYOyU8UA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(8936002)(82310400005)(426003)(40460700003)(47076005)(6916009)(54906003)(36756003)(26005)(82740400003)(45080400002)(40480700001)(86362001)(7696005)(356005)(478600001)(316002)(36860700001)(81166007)(41300700001)(7416002)(2616005)(336012)(5660300002)(8676002)(4326008)(2906002)(44832011)(16526019)(70586007)(1076003)(186003)(6666004)(70206006)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 19:22:08.5057 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4de3bf-299e-4077-0122-08dab5f50b2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C403.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5156
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
Cc: Ian Chen <ian.chen@amd.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Leo Li <sunpeng.li@amd.com>, hersen wu <hersenxs.wu@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Roman Li <roman.li@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Claudio Suarez <cssk@net-c.es>, Thomas Zimmermann <tzimmermann@suse.de>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@intel.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The LG 27GP950 and LG 27GN950 have visible display corruption when
trying to use 10bpc modes. So, to fix this, cap their maximum DSC
target bitrate to 15bpp.

Suggested-by: Roman Li <roman.li@amd.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/drm_edid.c  | 12 ++++++++++++
 include/drm/drm_connector.h |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index bc43e1b32092..f4f96115dce7 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -91,6 +91,8 @@ static int oui(u8 first, u8 second, u8 third)
 #define EDID_QUIRK_FORCE_10BPC			(1 << 11)
 /* Non desktop display (i.e. HMD) */
 #define EDID_QUIRK_NON_DESKTOP			(1 << 12)
+/* Cap the DSC target bitrate to 15bpp */
+#define EDID_QUIRK_CAP_DSC_15BPP		(1 << 13)
 
 #define MICROSOFT_IEEE_OUI	0xca125c
 
@@ -151,6 +153,12 @@ static const struct edid_quirk {
 	EDID_QUIRK('F', 'C', 'M', 13600, EDID_QUIRK_PREFER_LARGE_75 |
 				       EDID_QUIRK_DETAILED_IN_CM),
 
+	/* LG 27GP950 */
+	EDID_QUIRK('G', 'S', 'M', 0x5bbf, EDID_QUIRK_CAP_DSC_15BPP),
+
+	/* LG 27GN950 */
+	EDID_QUIRK('G', 'S', 'M', 0x5b9a, EDID_QUIRK_CAP_DSC_15BPP),
+
 	/* LGD panel of HP zBook 17 G2, eDP 10 bpc, but reports unknown bpc */
 	EDID_QUIRK('L', 'G', 'D', 764, EDID_QUIRK_FORCE_10BPC),
 
@@ -5511,6 +5519,7 @@ drm_reset_display_info(struct drm_connector *connector)
 
 	info->mso_stream_count = 0;
 	info->mso_pixel_overlap = 0;
+	info->max_dsc_bpp = 0;
 }
 
 u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edid)
@@ -5595,6 +5604,9 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
 		info->non_desktop = true;
 	}
 
+	if (quirks & EDID_QUIRK_CAP_DSC_15BPP)
+		info->max_dsc_bpp = 15;
+
 	return quirks;
 }
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 3ac4bf87f257..7a8fb486b6ab 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -634,6 +634,12 @@ struct drm_display_info {
 	 * @mso_pixel_overlap: eDP MSO segment pixel overlap, 0-8 pixels.
 	 */
 	u8 mso_pixel_overlap;
+
+	/**
+	 * @max_dsc_bpp: Maximum DSC target bitrate, if it is set to 0 the
+	 * monitor's default value is used instead.
+	 */
+	u32 max_dsc_bpp;
 };
 
 int drm_display_info_set_bus_formats(struct drm_display_info *info,
-- 
2.38.0

