Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F2B724E11
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA9610E3C4;
	Tue,  6 Jun 2023 20:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B4A10E3B4;
 Tue,  6 Jun 2023 20:26:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjOHzkurRXR6UHXqqUlVm7zZfUN8sEvLBaUah029BBj/WBt7OHDHCMz4d2K0syyCVIqxYGUzLQyTOTbHWVH3t4GgsJGsQMg22ImJx8FcPVG6E6n2O2BtD9i+k0LIu4Xjp/00HZ7fQrXAfFRxfjAYH48+T4jrxLkYfm1ucEDX3TFz05gn37aU0/O3yN0R5+L6s3djxDXdVTTy6zp8ATQPXFOzYBMu1eM31YCbVI9rhjVFCectXku9Vi6c6n6NL+JWaIJsUjPm5Pen/czrrpWzTpJHlK2BP2zkdL8Us11kywREzjkRV2lIdCGIqSHvupwLM5dbtqfh4LjLXNXlyd8yyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBZb8aCcnKiTYjN605PHlphR0OuL2NprPcfTQ/NC3ck=;
 b=eYQKKDG+751zahT64Sqb1laQJ4Y259zgGSBxout+ZRyw9Ans2Kq2OXvKxt29Phm0GHL1bpzWk7bEgm/ZucFxNMQVmZLNdOf3S4gOzsm3zvbKcvHvk+QaE1zVjfhqIo6WZar7p7ylazGcJ+ciFI0Zy4WZfONuDZykde+10iCKe1XcBlGS8EmzuL/X5aRY1WYcyTPAFP35vIDkOd8bK2HMBX0ok2LEFvH6kM1ObyMxtBX9O3qOQczY8k3V86BMtCY71LoaZFx1hqgV/9uTj6kzlEgJcD1MODjcFPobIdR+3Vg5QSw8xLizkdC9qIKfqgYoQJS2GmnxESYdSiDGyfQv1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBZb8aCcnKiTYjN605PHlphR0OuL2NprPcfTQ/NC3ck=;
 b=RdWbyaNyKcH9qfSSbirSmiS9ihFFWJSq3eriuLq84tOI9m5FYzvg4jO7bgupqCnAG6wnwSDW5wBNKa1ENWserQdfkjfBR0EUF1SoONIBGO5inzt4n4ww25aLu+bRFBiYbX4siOhnvmih7D4iQFY6CD76IrYGZyh4OjFFN1mWPNY=
Received: from BN7PR02CA0011.namprd02.prod.outlook.com (2603:10b6:408:20::24)
 by PH8PR12MB7351.namprd12.prod.outlook.com (2603:10b6:510:215::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.21; Tue, 6 Jun
 2023 20:26:18 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::ec) by BN7PR02CA0011.outlook.office365.com
 (2603:10b6:408:20::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Tue, 6 Jun 2023 20:26:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.33 via Frontend Transport; Tue, 6 Jun 2023 20:26:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 15:26:17 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 15:26:16 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 05/13] drm/connector: Print connector colorspace in state
 debugfs
Date: Tue, 6 Jun 2023 16:25:59 -0400
Message-ID: <20230606202607.122914-6-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230606202607.122914-1-harry.wentland@amd.com>
References: <20230606202607.122914-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT034:EE_|PH8PR12MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: ea2b19b7-a810-4f2b-bfb8-08db66cc4877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VBzo9CAKDBVW4G9jMYgLW6CIeqROOfEtC35xNBl52azf27CMT2tYUQw7R15Bu/l86/CmmsT8VUyOEKPIRF9xfFjLGSRfhlyBoq39wYGyNxZs8kRN2wSQGgXpgv48aHWY25A0YYVIQzzApBfk/MkXjK60RouFmDKt0DnVbVbT1VyEk5ILpPzVbVNeMSU9qGttG+KDsqoIkK8rjeYvoydmLl5RpmTgJWSUPuzVs1epgDohdkgCjznO+nfiaNg7hmHf0rP+jVLnyEipQzvJBk8x1mVqnXEjHJQ7nMdewxs/tpI2aG4MfGTfFVdQWcS6bG5hoJfTNr8O+Fqazopbngr2K4RZIFfJXIcW8cMb8lg92/iuaVThz6P7D0vBziY0aEn9COMqpOcFXVK2+gvPz7eOfAZx0R4WShoZKmLJInt4zd5ar0bKNUL2kQkBG9eVGYVrpTV2Fv50WZpBQaCMkCl/lKd4b76pUxZfTHTuw6OWlLUQqxwyIfdYcBswLwTWs98mhjdQ/lu8R59htPuyPGBJtt4qp3jE4CUoqOZkzuY4rdUAKOXXKAJT/5UrZhPWTnYUxev3IhKvXRRjt8i9owmgGJzqLZP4zmDwv1SnEbQJ3S+iVwPsZDnxiB9kp7YIoYPFHFCjpuip9+PfbYCGvBsW5nGhxlSPPIWaM3B/0rY9wg3y2s9S6b19mVOu33dfCJ4tHAiE994zAN0ez21VrXHHnm/nDuSNlo8BPpi0AM1Lv91ouy0L15FwEh6pWXUDA4mNiNlM2Tqopi+1nYtugKxBOA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(316002)(82740400003)(40460700003)(40480700001)(81166007)(41300700001)(356005)(110136005)(82310400005)(36756003)(2616005)(44832011)(7416002)(86362001)(36860700001)(186003)(54906003)(83380400001)(4326008)(47076005)(2906002)(336012)(426003)(1076003)(26005)(5660300002)(6666004)(478600001)(8936002)(70206006)(70586007)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 20:26:17.6976 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2b19b7-a810-4f2b-bfb8-08db66cc4877
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7351
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

