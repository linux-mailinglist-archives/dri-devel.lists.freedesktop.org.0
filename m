Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4CE726482
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F45010E51A;
	Wed,  7 Jun 2023 15:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724B310E50A;
 Wed,  7 Jun 2023 15:26:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvDopRdNyitVugLFHE9bKOp8y4cbLXYDXeNt+J/Rd788+RFuN5o+n9Fk9E9ew5Wsqg8uPXnbX8nENWqn6Dj5Do8NewXbbNfBEnLDibxR1OPyO3HgoDAdleDqWspJu78W2qZKaWvoriTJ61ENr8CmG+7D1mZEsfWFbT/IBGogyfGwpvaKhwshPJhvVpIrVaadtw3gBVjZRJXibT6M76yXgBziqYk8Yg2l/bdVw8rM+/PpkQTC2pkNFsgnUd18QmzEzToW/eFEslH+c8NpKhom3Gpha64fSYGubtZ6MM+5f3/NWE/2rjJvCC9i3NChnfpb8oi6dEqZ8w+zPlGKIvn9fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkN1nCr/9IQqaJ1FtAHMgEeHdOcMaqtSlRWufTHLl9c=;
 b=Qn18w69bbWCtLx7obu4mSjA/Wj6zHMHZLi2nGa+GkoONi+mg9fZL37U57UVyDxwZAAcAAC9lGIr5nHP/dXwNQCi9TRpjNhd4iCtS5JD/ppm23D3LFjqEu76V1pwH33F7jn98JjBZdGhkPKOHasPsyW7HeOm4aPYtBzTRXpgRyQv5fkwdiOXuJZiE5k6DxkR7ykxd5dP69bR++KuQi8VBIQNnFq1KtMJD+/MAsC8gnvq+VKpolNu5FYxdyRS1J8PxJHCWs6uBZioCmXsVDhpSZkEKx3x3sWcnukrIQP3iwSAu5jKBA5DwQskHWwFzB2s/gm011F+Rwp4elb7lMClm0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkN1nCr/9IQqaJ1FtAHMgEeHdOcMaqtSlRWufTHLl9c=;
 b=MRO8aLUvNnuo1PdUnRC1mRnqfNPW+Zku7H62zI2DUVwKcjYppy4v22w0FI1ey4mQeJf10gv68pyYEOPmq1rVWZ+MdMfg0zQVb5TlINiNPWqldYbC/Bwh4L7I0z1aetVTQrVuDK+9RijEG8rzjJpb2CCba8wbM9K9cFgzeLx68YY=
Received: from DS7PR03CA0347.namprd03.prod.outlook.com (2603:10b6:8:55::6) by
 SJ2PR12MB8110.namprd12.prod.outlook.com (2603:10b6:a03:4fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 15:26:29 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:8:55:cafe::90) by DS7PR03CA0347.outlook.office365.com
 (2603:10b6:8:55::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Wed, 7 Jun 2023 15:26:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.13 via Frontend Transport; Wed, 7 Jun 2023 15:26:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 10:26:27 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Jun 2023 10:26:26 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 06/13] drm/connector: Allow drivers to pass list of
 supported colorspaces
Date: Wed, 7 Jun 2023 11:26:10 -0400
Message-ID: <20230607152617.997573-7-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230607152617.997573-1-harry.wentland@amd.com>
References: <20230607152617.997573-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|SJ2PR12MB8110:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f53df88-dada-4564-4050-08db676b9066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dCKgX9TSlLqe/0Ja0KipLO707w+VsRdIudELuveztWBn6C3xAuZOYYhpu16JQ+xXna0Llrc56AZxgiOXlAcaPojPnnBDJ0wraWUskt2VSpoYUHb38vnfHx5LS0luZf0QQGBfaqL6AVMViJr4NzN/Q47aE6Rrukc0zBFyjb0eMwhUDZZNJnybOV53TcJO1OTFHpbD4EEQdHOJ3hf+8m+yoAy/6SztCd9aJk/Hg9jnEuj68e3eJ4PsTV1FGriCOF6KR001OdGQgvfNRSDQkrvjm6TiBWPgKwOmGvVnqf+UFsREEsJYyU+ZYvhVAPlIxUJB7Fa/HWpJBsseBu4n+jdOBCihgFUIER5CegYABZ4pX4JZSah2TO8B7MB3RFw6r5rrdvQC1FXwR6sfM+bZGGSJamiudd7C2lkDfQXwa8jmUyzrZjAx9x07/+ZyZnsz2U4V8okDT1gqulUULybBKw0mKCv6v+8cOGCDmLA+OLkX7YUVY78PDhAVhxNxV4Hp2vxS/4X+4Ez7Fofy5Wm9ip8kBTpVrTgNxqI5bkZOxNwh9NyTJ7ZaY+WQXoGl5Bem+FWyKrp9mJm8JvjN/3Y28X5xH2lsL9coCZEeOnhKWL4gOzIJosgpfn8T5OIzz2hjO40axaH0W0q8jrSRytfN/etyrUCtZiBBZg91+RH8z53Ni0VtcQyNtJ8nguUKlcZi6d5TA9e+gFoh+PljaFuIHZxx+rskGOaf/v92VUPrzDWzY4KoXQsM/R1FfdXGlCo+bzTAiC4fg3bZ5LlfwHWyzpl2kA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199021)(36840700001)(46966006)(40470700004)(40480700001)(478600001)(2906002)(40460700003)(356005)(36756003)(6666004)(82310400005)(47076005)(2616005)(36860700001)(336012)(83380400001)(66574015)(426003)(86362001)(81166007)(26005)(82740400003)(1076003)(186003)(316002)(5660300002)(110136005)(8676002)(70206006)(70586007)(7416002)(8936002)(4326008)(44832011)(54906003)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 15:26:28.3745 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f53df88-dada-4564-4050-08db676b9066
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8110
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

v6:
- Avoid magic when passing 0 for supported_colorspaces;
  be explicit in treating it as "all DP/HDMI"

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
 drivers/gpu/drm/drm_connector.c               | 24 +++++++++++++++----
 .../gpu/drm/i915/display/intel_connector.c    |  4 ++--
 drivers/gpu/drm/vc4/vc4_hdmi.c                |  2 +-
 include/drm/drm_connector.h                   |  7 ++++--
 4 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 46bf1f2ad535..8fe695047ced 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2050,9 +2050,17 @@ static int drm_mode_create_colorspace_property(struct drm_connector *connector,
  * Returns:
  * Zero on success, negative errno on failure.
  */
-int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector)
+int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector,
+					     u32 supported_colorspaces)
 {
-	return drm_mode_create_colorspace_property(connector, hdmi_colorspaces);
+	u32 colorspaces;
+
+	if (supported_colorspaces)
+		colorspaces = supported_colorspaces & hdmi_colorspaces;
+	else
+		colorspaces = hdmi_colorspaces;
+
+	return drm_mode_create_colorspace_property(connector, colorspaces);
 }
 EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
 
@@ -2066,9 +2074,17 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
  * Returns:
  * Zero on success, negative errno on failure.
  */
-int drm_mode_create_dp_colorspace_property(struct drm_connector *connector)
+int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
+					   u32 supported_colorspaces)
 {
-	return drm_mode_create_colorspace_property(connector, dp_colorspaces);
+	u32 colorspaces;
+
+	if (supported_colorspaces)
+		colorspaces = supported_colorspaces & dp_colorspaces;
+	else
+		colorspaces = dp_colorspaces;
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

