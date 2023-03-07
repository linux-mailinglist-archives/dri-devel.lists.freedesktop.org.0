Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2093F6AE410
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B30810E4F2;
	Tue,  7 Mar 2023 15:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A740310E4E8;
 Tue,  7 Mar 2023 15:11:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKz1K1qeKZHYtFnY4jrHlwAErr/RtfVDgabFBp+RuKk0wfvMO1Yj5S8LaK4hl9GXrLmQ6M+gLt4N/TJzXAuahyVpp8qprf2e9A2LyT5YOXCaBZfgWY+y69Q8PTo2dl4yM2tANQIyiVkiYfpSO2tKO8Qcz0Cj9Q807gnXMn/x5EDdRNz8fVdctB5EesnbfX2Et+9+mxOBiW72dwMvdinnjhDJvhyklra+upSWKFK28Aacvn/uZHMk677NivjWrXsLHZASoQ3lK+Xb3VEbr0A+OVffCnPISVXpKVILKInl6ypKLdiydmDBlxKXmfaDy6fpW4H9Q8tGS0jArXs6V1SrIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdpNofxcQLjwx4frJIOEvNn3bj56ijS515mmkM4jlnw=;
 b=GhTpEh+FRIP8AIdFk+GFczBCu2wj00wuFbhoD1vyMM6gAOaxffk5cnvFzJMd9K9Dj9QLRGclzmrp4CHMZJqfssrlXianpMlmaDewuFSeC/xzsGe/0jKhZa1sq/Sos8anOyO0mlmZhsFmmisyyg0X2WOD9RwWOb90t2HzalDuzcy/T2m17y0DkFJ9Hb6Sc/43uHs8DxzE137rg+R+TOvt433qFGN/hYKdMoEDbF7z2qPsy4VUkdL5g+xdJdiaVMb77b7zcqlGzxYOS2ZEFsRXroC6rwXmWSMxRDxTDmeXVVGFGAW+BwSZq/KRForf7WiUfbuZsmyqHWrXjoTkVW8/rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdpNofxcQLjwx4frJIOEvNn3bj56ijS515mmkM4jlnw=;
 b=i3rlhi2UcMxFBMg62WUp/b7V1KdPNIwjdaMM2ObFbJ0DdYDy/m4Uedm1L44te3XSx1StEjg845mX3wwnauOlSg+WP1RK0e6+Kzm5W6xAt32vrHzBTqY+HKci7lBAB5fO0SIK3quIu/vezHpxcvnix5/OHh7+UjVNU+zhKF05HQs=
Received: from DM5PR07CA0081.namprd07.prod.outlook.com (2603:10b6:4:ad::46) by
 PH8PR12MB6724.namprd12.prod.outlook.com (2603:10b6:510:1cf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 15:11:22 +0000
Received: from DS1PEPF0000E631.namprd02.prod.outlook.com
 (2603:10b6:4:ad:cafe::ab) by DM5PR07CA0081.outlook.office365.com
 (2603:10b6:4:ad::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29 via Frontend
 Transport; Tue, 7 Mar 2023 15:11:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E631.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.13 via Frontend Transport; Tue, 7 Mar 2023 15:11:22 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:21 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:21 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Mar 2023 09:11:20 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 07/17] drm/connector: Allow drivers to pass list of
 supported colorspaces
Date: Tue, 7 Mar 2023 10:10:57 -0500
Message-ID: <20230307151107.49649-8-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307151107.49649-1-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E631:EE_|PH8PR12MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bf4c3c3-deb4-46df-488d-08db1f1e363f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mgToDOYiR0ap4tE4CurMD1hzHUyu+RgKxjTkaAS3m05lLPgh0+9UBp5CrHm0tGk6PBHfMTYeNO3J8t19N0yhJJXQHwfbNRzcf7dTqgXdZRXMlR6cGjNEdcH8AoDPmhjXP7shjUVENXdVtoe60Ez6EZ3G7K8ImwAwaeofyp1CrujM09P4a9RRjMuOQcMegXWCJHKACCXBEqARyJPdMcdWn2XHd4wcF05GpBkVOXpeEvwRCIg/9qAnAub3UixhPfBgZ5cbcJscE94OApeMwwauNO98PGwErmlZQYABGbW2mZ6IOu/onGMy1vsSexl4kOSRAJAr0cUouyL5pVCsJ8P3a1PwR9od5KVHj//mTnQ0IC2PX3pU/s2SKkD1yLIiwG/DP/W/S+wfG+Dtvc7vs+WI83qHNYHAj7Fimf4/V8XYoYbDJ4N/RZvpDqADL2sRoYRfbFDWNJYcoUnvTxjKSKUAu887q0X2j1TMQ6Yeaw8fUJn0GN4iP5/qOiFyIWck9Ut61eVQWwjNVeXbDIq9xtkiZSiHS0ACzps2Tq9OalaFT+HE9YYta6fPHsgl9xjsJGSHXbUnfnylv9epskL9FG+IlK0KLcWBOiksed0Jxjr0eq6CrdZlFswqj5FVFGYEZKU/yZurnAzJqGqz8OCxIfMCJ3LVkXx395GKdYY7K0Sds1XuJTqFpwY1GHhV4KGgBIXzXyCN9GGei+9AX8RsJ6xkBAMSgELLd4/vVECGuRXUB8Y=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199018)(46966006)(36840700001)(40470700004)(8676002)(36756003)(40480700001)(4326008)(70586007)(8936002)(70206006)(44832011)(5660300002)(2906002)(81166007)(82740400003)(356005)(86362001)(36860700001)(41300700001)(6666004)(1076003)(316002)(54906003)(478600001)(110136005)(26005)(82310400005)(66574015)(47076005)(426003)(83380400001)(336012)(2616005)(40460700003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:11:22.1872 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf4c3c3-deb4-46df-488d-08db1f1e363f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E631.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6724
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-By: Joshua Ashton <joshua@froggi.es>
---
 drivers/gpu/drm/drm_connector.c                | 14 ++++++++++----
 drivers/gpu/drm/i915/display/intel_connector.c |  4 ++--
 drivers/gpu/drm/vc4/vc4_hdmi.c                 |  2 +-
 include/drm/drm_connector.h                    |  7 +++++--
 4 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 7ed48f9cbb20..2581cab7f936 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2043,9 +2043,12 @@ static int drm_mode_create_colorspace_property(struct drm_connector *connector,
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
index 6d5cbeb8df4d..9e4b054266ea 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -283,13 +283,13 @@ intel_attach_aspect_ratio_property(struct drm_connector *connector)
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
index 9e145690c480..95d73b817b05 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -605,7 +605,7 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	ret = drm_mode_create_hdmi_colorspace_property(connector);
+	ret = drm_mode_create_hdmi_colorspace_property(connector, 0);
 	if (ret)
 		return ret;
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index c77e42408522..693e4cba9cb5 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -30,6 +30,7 @@
 #include <linux/notifier.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_util.h>
+#include <drm/drm_property.h>
 
 #include <uapi/drm/drm_mode.h>
 
@@ -1886,8 +1887,10 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
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
2.39.2

