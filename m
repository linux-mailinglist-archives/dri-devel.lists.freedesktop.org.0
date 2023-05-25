Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8AB71171D
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 21:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C1810E124;
	Thu, 25 May 2023 19:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2054.outbound.protection.outlook.com [40.107.100.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16EB10E110;
 Thu, 25 May 2023 19:18:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXR3yym/NzE402Qv3zc+q+iFcel2H2cl93LXHdocv34XH8PzdjiPdw73R0RgWtALbx6PSYwx1Wg12Qphek5xBD7JZ588lGGV8aBgZYZx2B2Ger7g0q7dol9Odv+BA9l/nBUfTClS0vYnyQPqu8dEvEVENl50sjTiFkwIb93UlCwVN8PFDnutoLLiGQsLl56Z5X84/4vCDeliz5O86Mh75X2NZYdGaF2ZVV2oco+T+X4q+kx4kkvNxuWgod5E+Et+fijmY/Rip2RoyFNswEFowP3D5Oqt7RvF2EvP9mDIGxyJiJ23wZylN5OEgVOKPRr9xhlVhIBQwQDiAi2nvqRATg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7poHcbsHTBQNqHvSfSaKY9q0F/ODq1J0sQ0wn7WT5Y=;
 b=YoT1LgEJ7mJFdvj+0ghBBYtMm1xaE4QpNcr51oZbB/zDcpqDa9Rp+enUZaKmaxnzbFwlPd1iHThars7iY7pgz6Ful3ahd6aGS1neVmtI17RwLBo0lyn0yo4eWAaXwj8Rwd23BqaTrZIX3knJzoFizMcwm4YX9geIAFLb1YeOtxVnsjDil7zCRv5UrYblzJnuMveoCrSLobJbnKLxunaG78I/suG5Uj3cq5+UmyPkFWIiMrwlLmeEf/OHEvajQdhAOg66OzjIgbXVw3EwlNmhm5GJJWTljHURImne2kh7kubTcStecRnbfjsRbr9/TEDoG1Vxht40JRKFRj7g0h0EGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7poHcbsHTBQNqHvSfSaKY9q0F/ODq1J0sQ0wn7WT5Y=;
 b=V4v/CVYBgDrR98BDp17PMAbzQJ9UvV7Pwo04x8zWU/vRFY1habeEc2S7N40pkcGLov+7EkMcascdgzsJL6wAHKVMcPPWSNLks6MR8Tfo5roqN2Gw1gQjIfeOZcD8aqWAUpQB/5PqvMKm6xCQ7EIMcLYK9/lTMn9pNVhuqf8fwQQ=
Received: from SJ0PR03CA0210.namprd03.prod.outlook.com (2603:10b6:a03:2ef::35)
 by DM6PR12MB4330.namprd12.prod.outlook.com (2603:10b6:5:21d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 19:18:33 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:2ef:cafe::3a) by SJ0PR03CA0210.outlook.office365.com
 (2603:10b6:a03:2ef::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 19:18:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.16 via Frontend Transport; Thu, 25 May 2023 19:18:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:18:31 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 25 May 2023 14:18:30 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 05/13] drm/connector: Print connector colorspace in state
 debugfs
Date: Thu, 25 May 2023 15:18:01 -0400
Message-ID: <20230525191809.3524-6-harry.wentland@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525191809.3524-1-harry.wentland@amd.com>
References: <20230525191809.3524-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT014:EE_|DM6PR12MB4330:EE_
X-MS-Office365-Filtering-Correlation-Id: b0860c27-d755-4df8-a6e0-08db5d54d49a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W+k6dlHLopg5nDW6erROA3DbJZ+ufDd12wi5TOQHR73Iwbmxo8sleS1cHMQ7zonQ1vyEc+3w9enaoBe2jH4YfWFdbuMp9kx85nQIx6db6VtBUpz/i2vmcOHYRHJh5kWu8swAgttMcrm5F2vBUxahXxgYxRojWYQO3qVdnPCBuS9+e/ttCW2cX71AftDifFlFd65PYf2Oa/2oCSMtle1HgdJFkR0lo+z5FsjH/iNmO3oU1c69fVzpD7a5M8x2k5BTpB+8CEZeiQ2hZ7rdeoUw/IVyw4MLLcC41zPV0wi0Xiw33lYoBzFBkSd+xVwdw0uWzV5QGOOs3ITdx98L1kGBiAwnfu6sBLclz5QWCRvboPatwC2SMhYCNc9vOb5sNQpb3OYNsY8xXovc9Ps8Jghu5b2K28TYupf4ZZZy3AxNUmdDsrv0/NEnE3be9pnTZAd6uYntYsackffrqO6OSWl92Q0Wv1Jv3o2b1/ho7kX/VqlrDq/JBxCk1cQMrcZwhCJSm1bJbz0y9V97DxaqcFDJ5nJy5BxUTRdWl2AWC/If3AiKjOYRnZd/hBS+UJDiTLWc6vZ+Pz9kRg9JWrU0aq0gA+UnydDWisPZFT0GDOIC8Qla3FbHeOkwNjGWZSAFyVkSLxXF2wvhCbd/Ok81fjGhNgywmIq+a0v/cC65Gzib72ncF25iGv6sD1rZvB6T0/Bl0MTPccoDPXOwxFpjwG9+5i5k79ygMBqbAosgtgVjhfz8rjPtYrP/f3nd/ry8GB//6u9FNG9QQXwPwwLM1Be6Ew==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199021)(40470700004)(36840700001)(46966006)(1076003)(26005)(40460700003)(5660300002)(44832011)(7416002)(40480700001)(8936002)(8676002)(478600001)(86362001)(36860700001)(81166007)(356005)(54906003)(82310400005)(6666004)(110136005)(82740400003)(70206006)(2616005)(41300700001)(36756003)(426003)(83380400001)(4326008)(70586007)(336012)(2906002)(186003)(316002)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 19:18:32.7817 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0860c27-d755-4df8-a6e0-08db5d54d49a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4330
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

v3: Fix kerneldocs (kernel test robot)

v4: Avoid returning NULL from drm_get_colorspace_name

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/drm_atomic.c    |  1 +
 drivers/gpu/drm/drm_connector.c | 15 +++++++++++++++
 include/drm/drm_connector.h     |  1 +
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index c0dc5858a723..d6d04c4ccfc0 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1071,6 +1071,7 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 	drm_printf(p, "\tcrtc=%s\n", state->crtc ? state->crtc->name : "(null)");
 	drm_printf(p, "\tself_refresh_aware=%d\n", state->self_refresh_aware);
 	drm_printf(p, "\tmax_requested_bpc=%d\n", state->max_requested_bpc);
+	drm_printf(p, "\tcolorspace=%s\n", drm_get_colorspace_name(state->colorspace));
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
 		if (state->writeback_job && state->writeback_job->fb)
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 8d24a5da4076..69480385eaf3 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1048,6 +1048,21 @@ static const char * const colorspace_names[] = {
 	[DRM_MODE_COLORIMETRY_BT601_YCC] = "BT601_YCC",
 };
 
+/**
+ * drm_get_colorspace_name - return a string for color encoding
+ * @colorspace: color space to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorspace_name(enum drm_colorspace colorspace)
+{
+	if (colorspace < ARRAY_SIZE(colorspace_names) && colorspace_names[colorspace])
+		return colorspace_names[colorspace];
+	else
+		return "(null)";
+}
+
 static const u32 hdmi_colorspaces =
 	BIT(DRM_MODE_COLORIMETRY_SMPTE_170M_YCC) |
 	BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 565311e194da..ae0b1ee5b99a 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1980,6 +1980,7 @@ void drm_connector_list_iter_end(struct drm_connector_list_iter *iter);
 
 bool drm_connector_has_possible_encoder(struct drm_connector *connector,
 					struct drm_encoder *encoder);
+const char *drm_get_colorspace_name(enum drm_colorspace colorspace);
 
 /**
  * drm_for_each_connector_iter - connector_list iterator macro
-- 
2.40.1

