Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E7E72647C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354E110E52F;
	Wed,  7 Jun 2023 15:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1190610E513;
 Wed,  7 Jun 2023 15:26:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHZMeI0EQs7o1436Iazgw0YYIDNexAxDekVbMqRIM9DIJ5f2i7TjgpISjHT5weS1TNfdVQPt8v3a0OAYgV97EnnDPH2/1CGDknZ6AqcMW+xHhy/jRbDeljyJiLNukEsxsK6Ih7Uzo9jQ7C0Sk13Yl1oIgQiIGyQmXwWA9/ranToYYLZMXBvLLHX3VPOWgzaIN0UC+CCtuFA4BY4lg3fPrlvlZVoBw7WZRGf1TC+tziRHA8Rrh8MZnwYZGm6HurSyCVFqQslX8n0LZr6xV/7VfuBNGcm/ZsaWKCnUaiTME6bGWRk0YiKDmjz2XwogIcpZafp9fnh4xTp6ZRdbk/snOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFbcwafi8fkfnE/bxl7EzHSoSPJlKrJeUKORp++tlxc=;
 b=DmiKIjaFkPt9vvZUZoLkvAzcsFzKAJI87yHWiFOMuIDveW2y8EzHscFy+U2bc3HKt9A8+BdcHNftB1ze5OXjBjA7fO4Ir0y+3d1Ods7vEoOX7vcvuDFI5uGgjJAhrIToodb127J9FRhZNqNHdwGsQfK0U4S5Yf7FikhFfgG9UUNjQFNNdKU2vVsuaRj3dRGu2rII3oil1Q6dMHEBgVkD0E1rjekFY8Ki/0wP+e7u58TgZz/4UPQAmJ3Eb4RAj2agbCFBPTc8u9v7RolwUr9/uzM1qvKmzO26qOS7JmBVa3nMNgyVh843vV3iFEleuUeFdOIKeFgyH93fGOYPcNxvFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFbcwafi8fkfnE/bxl7EzHSoSPJlKrJeUKORp++tlxc=;
 b=CRxGcdI8mZY6alvLwx1atYgZfoTpCZ4Q4hs6WFtbCGMfJi+o4W/ASpWKlrT4ZWPY+eobhc3xuKVTJx21PV6TfaRm6GXBHTGuVC4GHyV6teZJbTn15Oh+gzhiwniNyoa82VWRj9MCYHpn9ZElBroZZrQxPzziQos7V6U8EVsKl4U=
Received: from MW3PR06CA0007.namprd06.prod.outlook.com (2603:10b6:303:2a::12)
 by DS7PR12MB6047.namprd12.prod.outlook.com (2603:10b6:8:84::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 15:26:27 +0000
Received: from CO1NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::bc) by MW3PR06CA0007.outlook.office365.com
 (2603:10b6:303:2a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32 via Frontend
 Transport; Wed, 7 Jun 2023 15:26:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT070.mail.protection.outlook.com (10.13.175.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.24 via Frontend Transport; Wed, 7 Jun 2023 15:26:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 10:26:26 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Jun 2023 10:26:25 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 05/13] drm/connector: Print connector colorspace in state
 debugfs
Date: Wed, 7 Jun 2023 11:26:09 -0400
Message-ID: <20230607152617.997573-6-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230607152617.997573-1-harry.wentland@amd.com>
References: <20230607152617.997573-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT070:EE_|DS7PR12MB6047:EE_
X-MS-Office365-Filtering-Correlation-Id: 086e1902-bcf4-4529-d1a7-08db676b8f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RctQ5kOgbZDK/pGwffOf3lS6Bo5OtNXQ0HqtsBmvR8i3BKRJ6coxdCX6xOfHIJR+OrZP3YNugdowHYWIUHnTq2yr2KyFtGSZAI26d/KUJiwmpq7i7dRIaZTm7AkLFt1jSQDd6YScwhwcz+ZS4AgKrg35LXbu3LFBQeWEh823sgktZWQAVTJsT07bOAhSiU8xJGFgxXaxS716quxZvWwvGHUiP8Jry7l+aKXlUhUjItEunt9A2Veg5g8woOTBffX/z2gSYTMUe0WLzUs6XqLn1Aw1/Hw4DLEaTce3gas9dtJSPKodfoB6MbiQNVj4RK9NL7tAybrGx3OZdDrAKD4C+bmUtBTexmfnN6V7oqlZEh17g4++1nunmIT5e8GTvYd9HsufURsbSYPLNBWow+FwyCwkqh9BMWCfTFrQNXOnSKDtYMC7CWGSC0it3vB/EzZqXgkv4qFUPYRMX5kbUNqM9ghcP4xj73+IzQg1PqeBvXeCsvOLxu7GSgbD4M/GCuuTk649JDhiWA11HjWkZhmDsrMI+1XuLME3AORmvi92Nl5SNd+3JowXT9BikAndYIhKRIrK6gudzahbzZUN+IyHPrtzopM66JUXxXJ6zGj+Y0h/OhSa1OkSrCQJft1nngJXFolV5inZkMafxlSdgAt9nsluwPGZUZd4vgDnbUUEEbqtqvusnxkhVMqKNyBmNwR1bLfwyseRd0FQuGk82o2Jmc6xelhins3HeYYKBd/Pd5TEvCxMuiPdgDMnevk/DKGFb5z6ZOVvvsN88cGXfe6iMQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199021)(40470700004)(36840700001)(46966006)(70586007)(6666004)(82740400003)(2906002)(356005)(70206006)(81166007)(110136005)(54906003)(44832011)(7416002)(8676002)(8936002)(36756003)(5660300002)(86362001)(41300700001)(316002)(40480700001)(4326008)(478600001)(40460700003)(426003)(336012)(2616005)(1076003)(26005)(186003)(82310400005)(36860700001)(83380400001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 15:26:26.9773 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 086e1902-bcf4-4529-d1a7-08db676b8f95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6047
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
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
Reviewed-by: Joshua Ashton <joshua@froggi.es>

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
index 484effc731df..46bf1f2ad535 100644
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
index fad38cdf4f79..9d9e4d6f0449 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1988,6 +1988,7 @@ void drm_connector_list_iter_end(struct drm_connector_list_iter *iter);
 
 bool drm_connector_has_possible_encoder(struct drm_connector *connector,
 					struct drm_encoder *encoder);
+const char *drm_get_colorspace_name(enum drm_colorspace colorspace);
 
 /**
  * drm_for_each_connector_iter - connector_list iterator macro
-- 
2.41.0

