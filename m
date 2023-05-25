Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CF9711727
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 21:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9678B10E1B0;
	Thu, 25 May 2023 19:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349FD10E173;
 Thu, 25 May 2023 19:18:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZjio8M7cutbU5PFLmSOAGW4hLKURp1DuNTKEfTe1P5pKm0u/dLKG0k8LheXw3/tHomSslPmZ6IMtF/EVzNqPHsLFbO2wVAsQhGXZbzzTRTfxbv6YKCQLpv6wHN2UCHL4rwE22Mp/qLq9sm0OVBKJ3A5Kkao+7YmZpI3UQkUnGfHJWf9T+P939Hf+C8u+mZykY0j6shMCinQ7jrYLIsEdPLTPOz0xK9H3V+iK6QKwGdzmlQpb7w4xy+Qbqf1oTziPGVMtQNz1efZmxmy/FZsqsrP4nhkYhBnhEIlIOKkJlMvCjFxYOS8jJGR0cG7zmB7gg1yDQ88MosjKBLmxVlRew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXmpsiOgg8pLlUlQcSAxHu2f7PYjAQ38vk77Xmu4LXk=;
 b=a5VBmhC0B82E92gqQ79QUMG44uQ3txK4dzX9F95YR3vRsgmGdSNVm/bc58QS7OHt2FKD4T0HV1E8C2pO9NEhSdhVT42SmBOZNNqhEefLXhXhVkHYGIWLZXewaNCMkXSUbzUmRP32Fr3wd1SzahX5OEtUm8VHgmruJ5stkxfu2nvwsV5ccQYXUXQllGcKofWGmeK49DHhpQKU/cvwISyjM4DbQXztXrL7ReUq6moJv3efRsmdXQmtGBsyl93eafef1RSB3laAGIfT2XrG2EpqjcuTNSu77xsic30BGHkUeAd8eHOiL4+jPoJRYUJs32A/9Sf9S3OVbhJSS7ZP2gyvjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXmpsiOgg8pLlUlQcSAxHu2f7PYjAQ38vk77Xmu4LXk=;
 b=x8Idp5HlfSfFV8lpSK2NZx6CMCoBa17CH9+KSRqv/bWxgPqY7c9H8NadY48xCo/dCgqPr/3VjTnMKz1ZLdS+mQoxABWZWlzq3RCsuduv2Uq6ZPwOeCsO8KGO74x3JmeSH7IpgZ34GqITl586ZapSve1PMIUQiIfbIVuvtMstJXY=
Received: from DS7PR03CA0110.namprd03.prod.outlook.com (2603:10b6:5:3b7::25)
 by SA1PR12MB7101.namprd12.prod.outlook.com (2603:10b6:806:29d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 19:18:35 +0000
Received: from DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::1b) by DS7PR03CA0110.outlook.office365.com
 (2603:10b6:5:3b7::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 19:18:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT057.mail.protection.outlook.com (10.13.172.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 19:18:34 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:18:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:18:34 -0700
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 25 May 2023 14:18:32 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 06/13] drm/connector: Allow drivers to pass list of
 supported colorspaces
Date: Thu, 25 May 2023 15:18:02 -0400
Message-ID: <20230525191809.3524-7-harry.wentland@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525191809.3524-1-harry.wentland@amd.com>
References: <20230525191809.3524-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT057:EE_|SA1PR12MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c2d1860-7726-4dea-02d8-08db5d54d5d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZMEhnHV9xOnF2orfFCgWjVF7DUCMQnJ+BSvUldEgbUB6dtgkkUJEYOWvxg0OMJVh2TG063cpP3pfZCqbUH2Sbnm1o3E6GzSI8ojr7pO72xxx1FgiW3uhe8HtYwxwkBx9PFjuHvDd0FW9B5zRmMS1CfNznufFZqOuRYuVrs3K8wveLmWWppBbIW4Vq6gRonQH9H6tJDeOVS968Exp55PaqBG9Q0ssIPphTX7fQbZ+6eVJdA9aZ+6p/FUucy//VbFT9f/weff4LDpnuuZPpYUax6xP2dyorMxLAyh+yN66xWXUCFMuNQqwUECEckZqPM5QwWd0sAzy27NTXjnbKX+p8Z3vsC+3eZ+KgUXC/gQEor/JwHaLuT+P6zJixEkint9wU6TxcfYQixa2Y7Yexc1z1eMeC4t8Wha2Swz/DEgRpWhQ5OpygyutiHB+Bb2AcaG+P8Vur0MmZ6Y1UpsahED9VDp3esaKJgXK/dpyiDkZ8RiCZLG3nv6SaDONloUgPXq4lz2yyrs7Xj/nLuqoFn0pFFVV/PP3UQrdl8zn7jdL5IePYJAN01R722qKMbKfTVi4UTOMY0oZnvz1XI7UXiZOG7MsNoohJUY+bpjoa0tHCqV2Hrpc+jFfrHJFhZtazZWN+QOskZedekf8AVSYBQpF9AKJvtjoGguGNwURb+qO1595uczsRuWtAn5WBSTrGulEHHujfiJZu0kIOOS3IlN3+xJB+ir9bexUyp1H843rxIm+1XIkeOVzrnVfV0vlTRiACpN+xd6SHbIcJdsU7A0Lvg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199021)(46966006)(36840700001)(40470700004)(41300700001)(2906002)(40460700003)(316002)(6666004)(82310400005)(5660300002)(82740400003)(40480700001)(81166007)(8936002)(8676002)(36860700001)(2616005)(356005)(186003)(36756003)(7416002)(86362001)(26005)(1076003)(44832011)(110136005)(54906003)(70586007)(70206006)(83380400001)(478600001)(426003)(336012)(47076005)(66574015)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 19:18:34.8353 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2d1860-7726-4dea-02d8-08db5d54d5d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7101
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
index ae0b1ee5b99a..abe775e1382f 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -30,6 +30,7 @@
 #include <linux/notifier.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_util.h>
+#include <drm/drm_property.h>
 
 #include <uapi/drm/drm_mode.h>
 
@@ -1896,8 +1897,10 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
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
2.40.1

