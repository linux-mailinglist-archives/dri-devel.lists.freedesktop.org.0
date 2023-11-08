Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EDB7E5B71
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC0A10E7D0;
	Wed,  8 Nov 2023 16:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F154C10E7BA;
 Wed,  8 Nov 2023 16:38:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6pZmFKumYoRzMsZHbhEGX423w7/rRvNfcAifG0zK+2ln31G56AJgNqf+S88P7NFzLxQyl1lgKCRrXzSXkgVU2x96C0p8pNaGSsymF8hVBrG4ljJjITKlnmyuGKcnfAD2nA3o9gqHMsW3WXtFtl7UNW9D8jJNyImRyWovm2Byg1uxTerb58k+Qmboe1DWOgBYbQ2Oaz/M3QTUxRoHAtSZYlc16vp92s4mgm36hHEpwfxP5sF8aod1ql+7EuTM8JK9Y8lptfx0Zxrz0B6MTHDOj311fl4IGZYwLtr+dTv2Qsd+EAmNHFDVMqoIfz+L6IzNaiVOAXecgeSVbJXeo79Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zViv4Qw1Q3AZN+0sBaT5s+tQOjJoTs/Zg5EF4A6pjZ8=;
 b=ZjoZMlKNbfCnyJjOjzx2OeQCGNNz0ZCR6BXOSdnsczwDFQnVNpVpdduH6QQpJURSxpo2otZBlI8F01kuOQeo4AmKInftMb3YcdPygszJZYrSxjZSjcTwBnZ9E2x1EAe7GvqkM4m5JGDm9Dqp22jAEYRQbrBsFGMXdugmAMY/LKeFbBUCrjByvPA4DtlIyEHXI+Rg3b95+24p7pjwC3T5oOFPMvRIpFdU+tI6GqXwHKcsEYh7/sNECWzLJG2HDHlvIO/lXey1qutw5+tOtl3o0dB1+/hsvoM36YUcbw5dIIVfLcJKfnyW00hhlHTivLPKAtSPAF47Zi6kTRL8OjlMOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zViv4Qw1Q3AZN+0sBaT5s+tQOjJoTs/Zg5EF4A6pjZ8=;
 b=PopafiolPwuC0B1mIq14oRzvBO+9Z/TTrPR+rasF+kqeNLkFvDMP3uaVZBefUNeDDw9payWQbRvnXe1RHTksRcW7kmeOvQlL3rb1KtskYZ/cYzW0aZedSFeC/NoM9Kh2CXwyNAyAKHyL3JS7+HlFd6U8LbYrf1lq/KEWuvNuJEY=
Received: from DM6PR07CA0112.namprd07.prod.outlook.com (2603:10b6:5:330::27)
 by LV3PR12MB9118.namprd12.prod.outlook.com (2603:10b6:408:1a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 16:38:01 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:5:330:cafe::7f) by DM6PR07CA0112.outlook.office365.com
 (2603:10b6:5:330::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 16:38:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 16:38:01 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:56 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:37:55 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 17/23] drm/colorop: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Date: Wed, 8 Nov 2023 11:36:36 -0500
Message-ID: <20231108163647.106853-18-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231108163647.106853-1-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|LV3PR12MB9118:EE_
X-MS-Office365-Filtering-Correlation-Id: a195210e-8ce2-4703-2780-08dbe07912df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q37OsKYWw53npvAGZ6p3R653Nk7xQsyvxX5C7UiLWxoQu6kdMef96zrKCvdjxVzRWXof7zrfACzFkOqGlXQ5dMR4e4EFYaO0s1LMSjmUfnq1/PCR7adJ8Qhl4B1HXm8/bPC+lEIMP2b0k+mHUP2iQPpiLRqdKNN9HLYzaHBWU0V8K5dGH3LMdbze2vxTygJHxj4h39VvDKDBuEJWzh+Pk0T/ekbdxgfrxmedHN1nwJoYlIH6e4GMu0bVv7Eflx8qFLtjltrmWcs51Rle1ijZ8zsSCgAOuACw5T8i8CYH81xGY1JvmQD89K+rAPWvNE6S5G/nczram6rnfFaWs/MyQohOztJvRAvv0WPV5qNrcnyTfUalWp42zvNTX5d0B6LXieDQzl89kHzlhkDmxbeBOgs/ASYUsmaCPe5Lhj8QHXNJsIyn/jQPfBk0Kbk/7KePEAVIkpvMU7/ooxY0Bk7mmT8BGLInHJL4AqnGhkQoCKDWahPzIs/j0Zv0L3j+rFumUFXeG+n+B/rltyek+p0G5N0PYLh36EYtIp9CYD86rJLgOdonTI8RQS/KjQlNQLJj2Rx1esEV6oWJ8aV7vLEKUjwjiv385YWtmAy0eiB+JpQe9rTto/vnahUyazhM/Gv+Go+kfh4JPoqNWZeG1BxcX19ci0eDJVdOpB+truVekFaWC++rXUVzWu1biJ9So9CuOy+sJjExh/GvOh1NOu0BKq+IoBw6h2tOaPfMKh8X39ZQ2wEq6iusmNUnOiugxV27QEf2fHsS3vndIptpT6bjAw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(186009)(82310400011)(1800799009)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(26005)(478600001)(6666004)(6916009)(2906002)(70586007)(1076003)(426003)(316002)(2616005)(8936002)(8676002)(4326008)(450100002)(44832011)(5660300002)(70206006)(54906003)(41300700001)(336012)(82740400003)(36756003)(86362001)(36860700001)(47076005)(83380400001)(81166007)(356005)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:38:01.4242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a195210e-8ce2-4703-2780-08dbe07912df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9118
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
Cc: wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the introduction of the pre-blending color pipeline we
can no longer have color operations that don't have a clear
position in the color pipeline. We deprecate all existing
plane properties. For upstream drivers those are:
 - COLOR_ENCODING
 - COLOR_RANGE

Userspace that registers with the
DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE will be permitted to set
the COLOR_PIPELINE plane property and drm_colorop properties.
But it won't be allowed to set COLOR_ENCODING and
COLOR_RANGE. Userspace that does not set this client cap
will not be permitted to touch the color pipeline.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 23 ++++++++++++++++++++++-
 drivers/gpu/drm/drm_ioctl.c       |  7 +++++++
 include/drm/drm_file.h            |  7 +++++++
 include/uapi/drm/drm.h            | 15 +++++++++++++++
 4 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index c6629fdaa114..69c56982e2d0 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -610,10 +610,26 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 	} else if (property == plane->zpos_property) {
 		state->zpos = val;
 	} else if (property == plane->color_encoding_property) {
+		if (file_priv->plane_color_pipeline) {
+			drm_dbg_atomic(dev,
+				       "Setting COLOR_PIPELINE plane property not permitted when DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set\n");
+			return -EINVAL;
+		}
 		state->color_encoding = val;
 	} else if (property == plane->color_range_property) {
+		if (file_priv->plane_color_pipeline) {
+			drm_dbg_atomic(dev,
+				       "Setting COLOR_PIPELINE plane property not permitted when DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set\n");
+			return -EINVAL;
+		}
 		state->color_range = val;
 	} else if (property == plane->color_pipeline_property) {
+		if (!file_priv->plane_color_pipeline) {
+			drm_dbg_atomic(dev,
+				       "Setting COLOR_PIPELINE plane property not permitted unless DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set\n");
+			return -EINVAL;
+		}
+
 		/* find DRM colorop object */
 		struct drm_colorop *colorop = NULL;
 		colorop = drm_colorop_find(dev, file_priv, val);
@@ -1158,6 +1174,12 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		break;
 	}
 	case DRM_MODE_OBJECT_COLOROP: {
+		if (!file_priv->plane_color_pipeline) {
+			drm_dbg_atomic(prop->dev,
+				       "[OBJECT:%d] is a colorop but DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE not set\n",
+				       obj->id);
+			ret = -EINVAL;
+		}
 		struct drm_colorop *colorop = obj_to_colorop(obj);
 		struct drm_colorop_state *colorop_state;
 
@@ -1170,7 +1192,6 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		ret = drm_atomic_colorop_set_property(colorop,
 				colorop_state, file_priv,
 				prop, prop_value);
-
 		break;
 	}
 	default:
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 44fda68c28ae..0d869658e13e 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -361,6 +361,13 @@ drm_setclientcap(struct drm_device *dev, void *data, struct drm_file *file_priv)
 			return -EINVAL;
 		file_priv->writeback_connectors = req->value;
 		break;
+	case DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE:
+		if (!file_priv->atomic)
+			return -EINVAL;
+		if (req->value > 1)
+			return -EINVAL;
+		file_priv->plane_color_pipeline = req->value;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index e1b5b4282f75..bf11b646c898 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -204,6 +204,13 @@ struct drm_file {
 	 */
 	bool writeback_connectors;
 
+	/**
+	 * @plane_color_pipeline:
+	 *
+	 * True if client understands plane color pipelines
+	 */
+	bool plane_color_pipeline;
+
 	/**
 	 * @was_master:
 	 *
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 841d393fb84e..2576b170e8d0 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -842,6 +842,21 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
 
+/**
+ * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
+ *
+ * If set to 1, the DRM core will
+ * - expose plane COLOR_PIPELINE properties for pre-blending color management.
+ * - reject setting of these plane properties:
+ *   - COLOR_ENCODING
+ *   - COLOR_RANGE
+ *
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ * This capability is currently in development.
+ */
+#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
-- 
2.42.1

