Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CD1724E14
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905A010E3C9;
	Tue,  6 Jun 2023 20:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D5F10E3B6;
 Tue,  6 Jun 2023 20:26:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JqWPiwfkhKiSunkEMrOjQMbmx7uAAxTGuVast7qZcaKncI/0lXV7GPbraAioOz22keYzEku8U+sAIJIWL/bC+VnKHswPwU0yoVtmpzCgSb5yxPNs7kdkvVMutKgnoAAQKNKtNj5yEEoceC6iu+nVKJ8NuJ2Rx5auDTN+XWRb+flEIIW6sNG60Kg6nptJSeNWUzToMeHi4B6mtqN2XV/ZrNmhW20o/V1Z08YBlsDCrWV7TLCoaXZaML1zJ/GagJbHJECNL+vWbnN6O6SfOpRFwNlMGmN/ozKCvaPm6Spjwcve9cUy03dryLe72I18LIz0WR7AIthpD1IYisgCd4wcmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9tnLWF5JKJdSMyreIrj7MZQXbPVkprrvbVCkeZsfpA=;
 b=nn/kly235fuFAu0l8t9nhybRRy3AvKyrR8S0291HDb4AaR2zpTpDYvURL75v357Gb6BiV59einPB8NP83Ouo9bJPStkGT4+lfyEIxTi/5r7L34Qd7tfHODRFKyO8DHoo7rKSOg1DCejsZV0bUZH0MgfYe560WjMJGz3pqc52IwvqAZ9vYruOyisHBtvHvCn+NIzsc4hI/geWct+sMAnctWLcPJsWE1KNuwANmunNYRIkWuDn/tFlZj3BicuP3tjL8EsvwY3oHPUFVDUI+c89ORYBxJPoZdZQVd9Dxh9HG++VUOGSp678DoaPkuQM3aXtIPD4vdS6w4aqXDmLLWag8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9tnLWF5JKJdSMyreIrj7MZQXbPVkprrvbVCkeZsfpA=;
 b=E1WvxZkgEPOf1Bvxxy4djddKn+EeRrOPg6j4H2ube1YTxSJu9d6AVcCg4VawqqJyDcrS0iTulsWBoCJPAO5B9dpRGuZ/0VcBkqa9mgwGrlxI8zvQKKDR3kXmrBH4G9qnIhS3pModRTyJ2JCvwHbE0nHSGgdodcQGHmxqsRjUEGI=
Received: from BN7PR02CA0007.namprd02.prod.outlook.com (2603:10b6:408:20::20)
 by BL1PR12MB5729.namprd12.prod.outlook.com (2603:10b6:208:384::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 20:26:19 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::96) by BN7PR02CA0007.outlook.office365.com
 (2603:10b6:408:20::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Tue, 6 Jun 2023 20:26:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.33 via Frontend Transport; Tue, 6 Jun 2023 20:26:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 15:26:18 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 15:26:17 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 06/13] drm/connector: Allow drivers to pass list of
 supported colorspaces
Date: Tue, 6 Jun 2023 16:26:00 -0400
Message-ID: <20230606202607.122914-7-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230606202607.122914-1-harry.wentland@amd.com>
References: <20230606202607.122914-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT034:EE_|BL1PR12MB5729:EE_
X-MS-Office365-Filtering-Correlation-Id: 43294df7-6ed1-4489-ea70-08db66cc496a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BxqcoAx/XDYlPBI14eZW67Q0fNJJ8gSC3jTMLWVy+JQEwYt82bvH0N+IcsllvgLKKBBx56yiJAtbZVQQuEOXuvMr6yZNBB/s9lDHl6INN++p04ATEvPOWj567gkTYF8pnwuxUoakZeXM5eK1YVBTtlCJB6bQMIsC8DTH/mbz8uGfvTEJXe/PqMISPqiM1oxVUzbkFKm5oozI59T6nogz6FsBB3KwtrYg13hCKwjL8VLwwn/SFu9MM2sSEhRyC5yFDR5WvB8KuEeg67PzYdLZsO3gwFGSg9yo3nghONcZTINS6vAveTgnvjKDxS3Z1i3XG5YZn6uvE9r6tVDzQb/VB2hnBKw7yj74bIpdRFYT5aFP9NsNPFEIVgcGGpQjvW4OtyrPX8AOAwqn/tCLssGqS1V5pjBLtddiCi07QqrX7wRi0CpzTcZVaJNyF0dTk7lOUl2EKUijCcxTzzLNYCkrBDKDCM3CgKzYvQ9E0SmOdVZ5kDmz2lwKiw5AQmXaMjQPQOQpgJqqKf5UAA4rEA5Pyuwm23tH91GxtJPSAkZ/zh85bDJbJT6vs5ixmtqXB8uGOfiCatW6s1njoRU3tohwyecTdKNZBRzrTF0ewTIRd11401bYmJW08YqAHwtHv4DTG4F75KoK217FxsOdekIUKYj5BUKZA/2r+/ea/7GP62bbrPJLENjxqpjPeFRu+ednd0B5npNgm4dOcPl6+dFPBpvv84mSLDk1GKjpl5E+wevIUf7pbRrY1eLbV03sZG5LOE2SMSe3EFdZeCy4p3wOPQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199021)(40470700004)(36840700001)(46966006)(70586007)(478600001)(4326008)(70206006)(316002)(2906002)(8936002)(41300700001)(8676002)(44832011)(54906003)(110136005)(6666004)(5660300002)(7416002)(26005)(40460700003)(1076003)(356005)(82740400003)(2616005)(186003)(40480700001)(426003)(336012)(66574015)(83380400001)(47076005)(36860700001)(81166007)(36756003)(86362001)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 20:26:19.3224 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43294df7-6ed1-4489-ea70-08db66cc496a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5729
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

Drivers might not support all colorspaces defined in
dp_colorspaces and hdmi_colorspaces. This results in
undefined behavior when userspace is setting an
unsupported colorspace.

Allow drivers to pass the list of supported colorspaces
when creating the colorspace property.

v2:
 - Use 0 to indicate support for all colorspaces (Jani)
 - Print drm_dbg_kms message when drivers pass 0
   to signal that drivers should specify supported
   colorspaecs explicity (Jani)
v3:
 - Move changes to create a common colorspace_names array
   to separate patch

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
 drivers/gpu/drm/drm_connector.c                | 14 ++++++++++----
 drivers/gpu/drm/i915/display/intel_connector.c |  4 ++--
 drivers/gpu/drm/vc4/vc4_hdmi.c                 |  2 +-
 include/drm/drm_connector.h                    |  7 +++++--
 4 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 69480385eaf3..b63b3e3168a1 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2045,9 +2045,12 @@ static int drm_mode_create_colorspace_property(struct drm_connector *connector,
  * Returns:
  * Zero on success, negative errno on failure.
  */
-int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector)
+int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector,
+					     u32 supported_colorspaces)
 {
-	return drm_mode_create_colorspace_property(connector, hdmi_colorspaces);
+	u32 colorspaces = supported_colorspaces & hdmi_colorspaces;
+
+	return drm_mode_create_colorspace_property(connector, colorspaces);
 }
 EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
 
@@ -2061,9 +2064,12 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
  * Returns:
  * Zero on success, negative errno on failure.
  */
-int drm_mode_create_dp_colorspace_property(struct drm_connector *connector)
+int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
+					   u32 supported_colorspaces)
 {
-	return drm_mode_create_colorspace_property(connector, dp_colorspaces);
+	u32 colorspaces = supported_colorspaces & dp_colorspaces;
+
+	return drm_mode_create_colorspace_property(connector, colorspaces);
 }
 EXPORT_SYMBOL(drm_mode_create_dp_colorspace_property);
 
diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index 6205ddd3ded0..e8b4a352a7a6 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -283,14 +283,14 @@ intel_attach_aspect_ratio_property(struct drm_connector *connector)
 void
 intel_attach_hdmi_colorspace_property(struct drm_connector *connector)
 {
-	if (!drm_mode_create_hdmi_colorspace_property(connector))
+	if (!drm_mode_create_hdmi_colorspace_property(connector, 0))
 		drm_connector_attach_colorspace_property(connector);
 }
 
 void
 intel_attach_dp_colorspace_property(struct drm_connector *connector)
 {
-	if (!drm_mode_create_dp_colorspace_property(connector))
+	if (!drm_mode_create_dp_colorspace_property(connector, 0))
 		drm_connector_attach_colorspace_property(connector);
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 55744216392b..eee53e841701 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -618,7 +618,7 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	ret = drm_mode_create_hdmi_colorspace_property(connector);
+	ret = drm_mode_create_hdmi_colorspace_property(connector, 0);
 	if (ret)
 		return ret;
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 9d9e4d6f0449..f799cbd755a3 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -30,6 +30,7 @@
 #include <linux/notifier.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_util.h>
+#include <drm/drm_property.h>
 
 #include <uapi/drm/drm_mode.h>
 
@@ -1904,8 +1905,10 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
 bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,
 					     struct drm_connector_state *new_state);
 int drm_mode_create_aspect_ratio_property(struct drm_device *dev);
-int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector);
-int drm_mode_create_dp_colorspace_property(struct drm_connector *connector);
+int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector,
+					     u32 supported_colorspaces);
+int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
+					   u32 supported_colorspaces);
 int drm_mode_create_content_type_property(struct drm_device *dev);
 int drm_mode_create_suggested_offset_properties(struct drm_device *dev);
 
-- 
2.41.0

