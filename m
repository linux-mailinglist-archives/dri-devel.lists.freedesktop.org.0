Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D427DE6FC
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 22:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09EA10E79D;
	Wed,  1 Nov 2023 21:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A572C10E79D;
 Wed,  1 Nov 2023 21:01:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ek9WBuHQARMYBAp/YIEothSNSirpdpDB5k2FN6mznj2gQYcXLiig1+js/5UjymzgCgmJV9YIgpB6Yovmyab6iA+THYglJcDoqN8TfDDdW5/F/aSlF/DbfWr+UUms9YTyQyWExAGc39BRnKfM12wGCZiOtb/VqmK572T9cXowxQQFD4hCYwd09Gukyzlq5sgJZ/z2pPpl10rjz5fk128+kDCyntT+z5bp46DeJalViK3rGrvsbMcSL4FYdn1cm6+uMlDiKGj3ddCLrcbSrNC6WsFu46oiLlNixedLfDd2yFeGZ4AOldTF5LfiGPvYUCl4SSBQTuMszpt2FGfqsQTWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOyzGbHDjAo81CbEl0nNGY8kW++DK5earoXJANxvLUQ=;
 b=ipH8w4FKx3vQ6VU3LLJ7mYFgdQrQMj9wGpXJqctKvBEDUhcUL61vl6DbDTG+6bxUNJg3IBYuXvAemCrNW6iWBdsoQXDfkU4ABe5F5wqmwxeJVXuGUvkQ9TwSLeqra2Xq51IHNp051aGh8o8wLmJhegORli57QyycAyg/2e1bNJLIklMWlmTgjF/19wNeHe18G/XrCMnvDKxjEuJt2TDAXZqJi9bruUYJKeP2U5YG73bnrlHG7Zs9lrXR2Ez8Hqjx/w2IrCIXPeOIAhnbEW4/khH9tFC7rLTL7P0dZd8BcVqayYi+SCQ25MAkfl3ZkZN1pL/opF16WCg4aFUZ4iif7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOyzGbHDjAo81CbEl0nNGY8kW++DK5earoXJANxvLUQ=;
 b=J02LGlOekVCQzB36amLRogcMwpf/SwQuJktkGzdSQIHDmEPewEWy+zv6nwQ9C4IVoQ6IOAIZB8KJLjYV5yiuTEtVIiH5kKYcn6kqfCwicbvnXvwHlwLSYQSObHyu7uoyid8Yf/lYfIKpQdrDBvcIVViYSlb0EqFl0TecgeNOLkg=
Received: from DS7PR03CA0214.namprd03.prod.outlook.com (2603:10b6:5:3ba::9) by
 PH7PR12MB8156.namprd12.prod.outlook.com (2603:10b6:510:2b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Wed, 1 Nov
 2023 21:01:11 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:5:3ba:cafe::71) by DS7PR03CA0214.outlook.office365.com
 (2603:10b6:5:3ba::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 21:01:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 21:01:11 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 1 Nov
 2023 16:01:08 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/edid: add a quirk for two 240Hz Samsung monitors
Date: Wed, 1 Nov 2023 17:00:36 -0400
Message-ID: <20231101210037.130494-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|PH7PR12MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 189e38c9-b1a5-403a-9e29-08dbdb1dadb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E6KCRVNKFgL/ghEwvHDTsZPv6wY8K+LJ02XlzUEs1VGeCDRs+pedUyUP+xMd9ETO3O5teMayBUswpITYe25BwYucVUxZX1mwznTT2jF9sj2MLz9LN0Is3Sy6i5KMqcE1NnqoqqQ7/AG3A4KJgLsd8K1IYKegnokNh+hW7r8abBxI8WhClUdJBbH+1SeDhyTpxcAXApU9Gkum1iALuGWEdIneW0CN/6e7vXghDdSW7i9hzjL39v1MCpOSrrviKg0rD+aoVNv/clNQb9zY2sFk6jHbxBSaE6R3cojoVp1gpIxktx5dBfjM2y6wIs7l/8GMMhuf0AnOcTTL5phM1RnH+6kA95G5GXQy2yatdqEjKO5iN+9PvJjZPbkwj1MYmwpeRp8V1vlAvivV6i7smjp+mHIaEoXe/0gndQIyxqmgkJfleQDQ2ps966Ym5H1bMaAofSGXqD9pr3vOpWZBuLiiKxMtIczErDfb1+SWYcc+jkyWKVonOsVN2zL4a5gM9dptY2J3gttrMx6ooipe0N4/7irabRUru5rQJLdqO5PbGq1rJzTUJkBPxwEQnth6vPxOtosNnnnA8XlfTkJDtzBPIrjMnGiJy/6/zkBYDwxm7DCol+MuqnFyYVN3H3QvdQ94hemsiJ+X6vjymYbx/vFdKauxf/VnS1QmqdHHVyaoniIu4IWoT61edGvs/cllvHl0am89qFwuf3jgCVbghm8wTDrG5A2ZkBsEoA7bszyWKbpVAlbiQs6+0TKBZDJMwmgBJtx+JvOgBPchtIP5dd2LM+cNl98bEyA8Hcsin/6Siok=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(451199024)(82310400011)(64100799003)(1800799009)(186009)(46966006)(36840700001)(40470700004)(426003)(54906003)(70586007)(316002)(70206006)(6916009)(336012)(478600001)(82740400003)(16526019)(1076003)(6666004)(2616005)(4326008)(26005)(40480700001)(44832011)(8936002)(83380400001)(8676002)(966005)(45080400002)(5660300002)(36756003)(47076005)(2906002)(40460700003)(81166007)(356005)(41300700001)(36860700001)(86362001)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 21:01:11.4877 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 189e38c9-b1a5-403a-9e29-08dbdb1dadb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8156
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
Cc: Maxime Ripard <mripard@kernel.org>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jerry Zuo <jerry.zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Without this fix the 5120x1440@240 timing of these monitors
leads to screen flickering.

Cc: stable@vger.kernel.org # 6.1+
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1442
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/drm_edid.c | 47 +++++++++++++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index bca2af4fe1fc..3fdb8907f66b 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -89,6 +89,8 @@ static int oui(u8 first, u8 second, u8 third)
 #define EDID_QUIRK_NON_DESKTOP			(1 << 12)
 /* Cap the DSC target bitrate to 15bpp */
 #define EDID_QUIRK_CAP_DSC_15BPP		(1 << 13)
+/* Fix up a particular 5120x1440@240Hz timing */
+#define EDID_QUIRK_FIXUP_5120_1440_240		(1 << 14)
 
 #define MICROSOFT_IEEE_OUI	0xca125c
 
@@ -170,6 +172,12 @@ static const struct edid_quirk {
 	EDID_QUIRK('S', 'A', 'M', 596, EDID_QUIRK_PREFER_LARGE_60),
 	EDID_QUIRK('S', 'A', 'M', 638, EDID_QUIRK_PREFER_LARGE_60),
 
+	/* Samsung C49G95T */
+	EDID_QUIRK('S', 'A', 'M', 0x7053, EDID_QUIRK_FIXUP_5120_1440_240),
+
+	/* Samsung S49AG95 */
+	EDID_QUIRK('S', 'A', 'M', 0x71ac, EDID_QUIRK_FIXUP_5120_1440_240),
+
 	/* Sony PVM-2541A does up to 12 bpc, but only reports max 8 bpc */
 	EDID_QUIRK('S', 'N', 'Y', 0x2541, EDID_QUIRK_FORCE_12BPC),
 
@@ -6586,7 +6594,37 @@ static void update_display_info(struct drm_connector *connector,
 	drm_edid_to_eld(connector, drm_edid);
 }
 
-static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
+static void drm_mode_displayid_detailed_edid_quirks(struct drm_connector *connector,
+						    struct drm_display_mode *mode)
+{
+	unsigned int hsync_width;
+	unsigned int vsync_width;
+
+	if (connector->display_info.quirks & EDID_QUIRK_FIXUP_5120_1440_240) {
+		if (mode->hdisplay == 5120 && mode->vdisplay == 1440 &&
+		    mode->clock == 1939490) {
+			hsync_width = mode->hsync_end - mode->hsync_start;
+			vsync_width = mode->vsync_end - mode->vsync_start;
+
+			mode->clock = 2018490;
+			mode->hdisplay = 5120;
+			mode->hsync_start = 5120 + 8;
+			mode->hsync_end = 5120 + 8 + hsync_width;
+			mode->htotal = 5200;
+
+			mode->vdisplay = 1440;
+			mode->vsync_start = 1440 + 165;
+			mode->vsync_end = 1440 + 165 + vsync_width;
+			mode->vtotal = 1619;
+
+			drm_dbg_kms(connector->dev,
+				    "[CONNECTOR:%d:%s] Samsung 240Hz mode quirk applied\n",
+				    connector->base.id, connector->name);
+		}
+	}
+}
+
+static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_connector *connector,
 							    struct displayid_detailed_timings_1 *timings,
 							    bool type_7)
 {
@@ -6605,7 +6643,7 @@ static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *d
 	bool hsync_positive = (timings->hsync[1] >> 7) & 0x1;
 	bool vsync_positive = (timings->vsync[1] >> 7) & 0x1;
 
-	mode = drm_mode_create(dev);
+	mode = drm_mode_create(connector->dev);
 	if (!mode)
 		return NULL;
 
@@ -6628,6 +6666,9 @@ static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *d
 
 	if (timings->flags & 0x80)
 		mode->type |= DRM_MODE_TYPE_PREFERRED;
+
+	drm_mode_displayid_detailed_edid_quirks(connector, mode);
+
 	drm_mode_set_name(mode);
 
 	return mode;
@@ -6650,7 +6691,7 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
 	for (i = 0; i < num_timings; i++) {
 		struct displayid_detailed_timings_1 *timings = &det->timings[i];
 
-		newmode = drm_mode_displayid_detailed(connector->dev, timings, type_7);
+		newmode = drm_mode_displayid_detailed(connector, timings, type_7);
 		if (!newmode)
 			continue;
 
-- 
2.42.0

