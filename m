Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1F7B54404
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 09:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974CA10EBB7;
	Fri, 12 Sep 2025 07:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E0z0z4ts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD93110EBB7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 07:37:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdN1MBnqLFTii2t5Te+3VHOVogHYPao2TMo7MoeLaZS76dc5dSM0mzNzSpHnmg8TUVBZJ/FnVmYb2Vc7nvsCniPzMjGbVExk+IEKfrsSOUD0k4/oNhvURrp5Kr8DIHGl/TSuC8Y4HHVRjiO89PNzkx9otb+v5qdRKDsC95N0e83/aF3R0zkwHnpNMyUdEWKhNEy+RfhH/nVa76ozxqtAiRM3oJgsKV2rYkZWqUCf25oij8d8Q196uXvsPgsrP6eEg17R1ju87h+RveBvjfzzcT8qqRczmt7e94A2WkG3kESV8FN0cFF/sgnLVbiSDNqeC/ZZ6ds5/BhkUk7aoUm1eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vwm7kP5ckMg4+ztpwNJfln4Av4IqtA9LNMQNGzje7c=;
 b=ZPasE6iJkz316RrlM6gyq1PzpHtriJu9s/xi+fZEJ7tnrWuTWlJbRhwairUZ11KBFNDOd9Oe2AQPXdb94p/GBAMiFOdEFc0J1UCSTgqFiDpMRHPrue3T1PJd7A9DdRO4csATfPpYf4e5kK2pKwBcVh0SpKjNCZ2wSN42zqKejj/0D0pOYLlWk6syRSi+zGNzF/nuzrNxTOZnhYdzMt/yMGtQnVpuCjNUUZQXYdPFJtqD86/TfUNFxTaTvCkke1b/F79WKx1thmpczdfkh9rSSWTFKIWmXtWjkHJ1baD3xei12iU5dXuox4PKOy67929QEJP8bttiDqaabBaJG5ciVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vwm7kP5ckMg4+ztpwNJfln4Av4IqtA9LNMQNGzje7c=;
 b=E0z0z4ts24L+/FA3GAJU16DhL1DNSkXyXi3PYcYMfLgStOJH8wmezKlMkGe+oSwRXA9DB6QOI/IcfoBmJdZYCOdK6hbYxw7yJvn665b0v7km63FPxK2SOPeKGMCQ9Vsfx8pl+vB88uRUs19raOLYeBuf7dpnX5AIGTlkEOuFksc=
Received: from CH5P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::18)
 by PH7PR12MB6763.namprd12.prod.outlook.com (2603:10b6:510:1ad::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 07:37:29 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::58) by CH5P220CA0020.outlook.office365.com
 (2603:10b6:610:1ef::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.18 via Frontend Transport; Fri,
 12 Sep 2025 07:37:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 07:37:27 +0000
Received: from maxZ2mini.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Sep
 2025 00:37:22 -0700
From: Chuanyu Tseng <Chuanyu.Tseng@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <Mario.Limonciello@amd.com>,
 <xaver.hugl@gmail.com>, <mdaenzer@redhat.com>, <victoria@system76.com>,
 <seanpaul@google.com>, <Sunpeng.Li@amd.com>, Chuanyu Tseng
 <Chuanyu.Tseng@amd.com>
Subject: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
Date: Fri, 12 Sep 2025 15:33:04 +0800
Message-ID: <20250912073305.209777-1-Chuanyu.Tseng@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|PH7PR12MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: b0523b6b-e818-4a43-0244-08ddf1cf395e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dHeI8voqv0tUSgAdFkYVJK13YFNdwmSaRFmr2Py/MF/KtRGRiAk9SMHQZGW2?=
 =?us-ascii?Q?1+Zwx0Lb3nQsGPI9uqrohs8IrwNI48h5iL5Wk7JPvPhoTXthFbiSfjxwDRuX?=
 =?us-ascii?Q?I40NRzmIT59D/z3qlrEJ8Asg8kyAdCg/tw2I3NTV28oGHdOa+GRr0ehXqy8l?=
 =?us-ascii?Q?aSgu2/rl12MAc35yO9A0i5xDRXNXFZUITWJO7o5wqX7BgBI6BxEHu8/3EIaJ?=
 =?us-ascii?Q?kCefW+ASF9cc2wV6tWo2LTIsnS5PAvoG3g1Tpo8WjY2cnNGfR3gmr/qSquHF?=
 =?us-ascii?Q?MPKdppqeutsewg23b/yLvmDKDvRq3wsyRaJvEmnY2zSEfYMT4g1r9H6Rd9Gx?=
 =?us-ascii?Q?CEkYPoD/oZCYTgDqnliyG6KOJUnx2Fj+L+ToZmiOPjeimYUPtTe3ScQxcNzL?=
 =?us-ascii?Q?n7YXUiTtVYrdy+jhZjYCl+thv5GzWpRA6MyTNRVXkXRpo/Wr2G528ey0R4BM?=
 =?us-ascii?Q?np/AI/1IJlVzjdsYuVMknkPLOOoJu9asTyBwz3aEUluvS4Ns1THTQ7oYvyz7?=
 =?us-ascii?Q?XRh/GcrWDmakQnZOoaXkaeQ97ZzCZLjfmw+eEUcgoBkZfFujVYNYsBo8uW29?=
 =?us-ascii?Q?gulneacoMDITawmegTAgROSTpNpnmc4OsN+6Rw0OmsdZgzXZ7yBrQyzcU+Cy?=
 =?us-ascii?Q?B7u5w0T9AZvj/0C14T2Z0nOQzW/5d6WNYgJTbOpCWN3juiFqa/YqvGDv/TZk?=
 =?us-ascii?Q?ofIDecNWhaCcFQc7gyc9h1fze2uN+U66qgC68LbuNjzPImHkTc4ohgvvmRpJ?=
 =?us-ascii?Q?qyllszG6dMoiGwDQjmk+mzThiagOI9u0T1XkLq7/J8k8GzQl/xhL/ew0eVJz?=
 =?us-ascii?Q?HBtcCvah/Sj5V2o5GoKRdmi5Gd1FTlTPJLVPCMp7hZuDEIK59kam7VPvwgsD?=
 =?us-ascii?Q?3K6nvzxSW1Ug9rj+nBCCPP3YyH8fXYgU0HgKwvTSZeGM5KV0MKr1Be93UtPM?=
 =?us-ascii?Q?irpcQmXF5JJxrVEExbqPh/7DdQLZbTU7j1iZrClwJWR7QgYeDzMu2uZrLzG7?=
 =?us-ascii?Q?P6fVwVNrbwtGwAzRzUubHr9qhVVm9o1Ni+YJc16xHJj0pM9j8b5x5b1MsHJ3?=
 =?us-ascii?Q?22Nq+i8mjv/NIox8veMHFdUtplwKdAivbqOCUD9ZlJCfBrVcVG1ptg0GLDQP?=
 =?us-ascii?Q?Hjbc1baGlwwFVUygh4CEGObgY9FU51lmqFtNd8Dlr+67lXxjq7ynp9rKaNiA?=
 =?us-ascii?Q?j6HlUMNPyYk3fmglUtQPKqm4Y4NT1L1CXH3shpL20FUZoAOt1qiKwEK0bsWs?=
 =?us-ascii?Q?C+7Dfwtc/jbcsKAhHRzvaY1Y2YQFxlJZz58gHSS2pljRdMIZoH+01iOHIQ59?=
 =?us-ascii?Q?PFgPRpBIkT+l4YwaL2gowIWydzE5rYjkBn4xK+H3nz2fNziuOa6Du+Ip2ZP/?=
 =?us-ascii?Q?7C2KYgJposSmr0JnG5R6G910vkXT9wfJs6Fxuus2wMOJysN1KB2WO/i42jdA?=
 =?us-ascii?Q?m0hst5mLClhtFZdQk1f1NIaMQfLtSlEGfVtAFgFlEebdCqlVeHq1uf44njZL?=
 =?us-ascii?Q?ux2gURBSZi9TtZMcg+o/n8cSTOANo6g8UoQB?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 07:37:27.8925 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0523b6b-e818-4a43-0244-08ddf1cf395e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6763
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce a DRM interface for DRM clients to further restrict the
VRR Range within the panel supported VRR range on a per-commit
basis.

The goal is to give DRM client the ability to do frame-doubling/
ramping themselves, or to set lower static refresh rates for power
savings.

This is done through 2 new CRTC properties, along with a client
cap. See the docstrings in patch for details.

This RFC doesn't include a driver-side implementation yet; that is
coming soon. Currently, looking to get some comments on whether this
interface makes sense for both compositor and drivers
---
 drivers/gpu/drm/drm_atomic_uapi.c | 30 +++++++++++++++++++++---
 drivers/gpu/drm/drm_connector.c   | 25 ++++++++++++++++++++
 drivers/gpu/drm/drm_file.c        |  2 ++
 drivers/gpu/drm/drm_ioctl.c       |  7 ++++++
 drivers/gpu/drm/drm_mode_config.c | 14 ++++++++++++
 include/drm/drm_connector.h       |  1 +
 include/drm/drm_crtc.h            | 38 +++++++++++++++++++++++++++++++
 include/drm/drm_file.h            | 10 ++++++++
 include/drm/drm_mode_config.h     | 18 +++++++++++++++
 include/uapi/drm/drm.h            | 17 ++++++++++++++
 10 files changed, 159 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 85dbdaa4a2e2..73f929cff4e1 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -365,8 +365,8 @@ static s32 __user *get_out_fence_for_connector(struct drm_atomic_state *state,
 }
 
 static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
-		struct drm_crtc_state *state, struct drm_property *property,
-		uint64_t val)
+		struct drm_crtc_state *state, struct drm_file *file_priv,
+		struct drm_property *property, uint64_t val)
 {
 	struct drm_device *dev = crtc->dev;
 	struct drm_mode_config *config = &dev->mode_config;
@@ -421,6 +421,26 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		state->scaling_filter = val;
 	} else if (crtc->funcs->atomic_set_property) {
 		return crtc->funcs->atomic_set_property(crtc, state, property, val);
+	} else if (property == config->prop_vrr_range_control_min) {
+		if (file_priv->vrr_range_control) {
+			drm_dbg_atomic(dev, "Setting vrr_range_min crtc property not"
+				"permitted with DRM_CLIENT_CAP_VRR_RANGE_CONTROL"
+				"client cap\n");
+			return -EINVAL;
+		}
+		if (!val)
+			return -EINVAL;
+		state->vrr_range_min = val;
+	} else if (property == config->prop_vrr_range_control_max) {
+		if (file_priv->vrr_range_control) {
+			drm_dbg_atomic(dev,"Setting vrr_range_max crtc property not"
+				"permitted with DRM_CLIENT_CAP_VRR_RANGE_CONTROL"
+				"client cap\n");
+			return -EINVAL;
+		}
+		if (!val)
+			return -EINVAL;
+		state->vrr_range_max = val;
 	} else {
 		drm_dbg_atomic(crtc->dev,
 			       "[CRTC:%d:%s] unknown property [PROP:%d:%s]\n",
@@ -446,6 +466,10 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		*val = (state->mode_blob) ? state->mode_blob->base.id : 0;
 	else if (property == config->prop_vrr_enabled)
 		*val = state->vrr_enabled;
+	else if (property == config->prop_vrr_range_control_min)
+		*val = state->vrr_range_min;
+	else if (property == config->prop_vrr_range_control_max)
+		*val = state->vrr_range_max;
 	else if (property == config->degamma_lut_property)
 		*val = (state->degamma_lut) ? state->degamma_lut->base.id : 0;
 	else if (property == config->ctm_property)
@@ -1062,7 +1086,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		}
 
 		ret = drm_atomic_crtc_set_property(crtc,
-				crtc_state, prop, prop_value);
+				crtc_state, file_priv, prop, prop_value);
 		break;
 	}
 	case DRM_MODE_OBJECT_PLANE: {
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 272d6254ea47..dc4b50ff5fe0 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2866,6 +2866,31 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
 }
 EXPORT_SYMBOL(drm_connector_attach_hdr_output_metadata_property);
 
+/**
+ * drm_connector_attach_vrr_range_control_property - attach "VRR_RANGE_CONTROL_MIN" and
+ * "VRR_RANGE_CONTROL_MAX" property
+ *
+ * @connector: connector to attach the property on.
+ *
+ * This is used to allow the userspace to send VRR range control min and max value to the
+ * driver.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_attach_vrr_range_control_property(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop_min = dev->mode_config.prop_vrr_range_control_min;
+	struct drm_property *prop_max = dev->mode_config.prop_vrr_range_control_max;
+
+	drm_object_attach_property(&connector->base, prop_min, 0);
+	drm_object_attach_property(&connector->base, prop_max, 0);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_vrr_range_control_property);
+
 /**
  * drm_connector_attach_broadcast_rgb_property - attach "Broadcast RGB" property
  * @connector: connector to attach the property on.
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index eebd1a05ee97..7ed28e94544a 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -157,6 +157,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 	init_waitqueue_head(&file->event_wait);
 	file->event_space = 4096; /* set aside 4k for event buffer */
 
+	file->vrr_range_control = false; /* set as false for init */
+
 	spin_lock_init(&file->master_lookup_lock);
 	mutex_init(&file->event_read_lock);
 	mutex_init(&file->client_name_lock);
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index d8a24875a7ba..273139688ba1 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -373,6 +373,13 @@ drm_setclientcap(struct drm_device *dev, void *data, struct drm_file *file_priv)
 			return -EINVAL;
 		file_priv->supports_virtualized_cursor_plane = req->value;
 		break;
+	case DRM_CLIENT_CAP_VRR_RANGE_CONTROL:
+		if (!file_priv->atomic)
+			return -EINVAL;
+		if (req->value == 0)
+			return -EINVAL;
+		file_priv->vrr_range_control = req->value;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 25f376869b3a..1f74284208c6 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -340,6 +340,20 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.prop_vrr_enabled = prop;
 
+	prop = drm_property_create_range(dev,
+			DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_RANGE,
+			"VRR-RANGE-CONTROL-MIN", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.prop_vrr_range_control_min = prop;
+
+	prop = drm_property_create_range(dev,
+			DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_RANGE,
+			"VRR-RANGE-CONTROL-MAX", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.prop_vrr_range_control_max = prop;
+
 	prop = drm_property_create(dev,
 			DRM_MODE_PROP_BLOB,
 			"DEGAMMA_LUT", 0);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..dd2c3337235a 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2451,6 +2451,7 @@ int drm_connector_attach_vrr_capable_property(
 int drm_connector_attach_broadcast_rgb_property(struct drm_connector *connector);
 int drm_connector_attach_colorspace_property(struct drm_connector *connector);
 int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *connector);
+int drm_connector_attach_vrr_range_control_property(struct drm_connector *connector);
 bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,
 					     struct drm_connector_state *new_state);
 int drm_mode_create_aspect_ratio_property(struct drm_device *dev);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index caa56e039da2..39d1bf66f713 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -299,6 +299,44 @@ struct drm_crtc_state {
 	 */
 	bool vrr_enabled;
 
+	/** @vrr_range_min:
+	 *
+	 * This is desired minimal FPS number.
+	 *
+	 * Default state is 'vrr_range_min = 0', (and 'vrr_range_max = 0'),
+	 * indicating legacy VRR_ENABLED behavior. if both are set to a non-zeo
+	 * value, the new VRR range control behavior will be active.  See
+	 * &DRM_CLIENT_CAP_VRR_RANGE_CONTROL.
+	 *
+	 * If setting a non-zero value, the driver should check that:
+	 *
+	 * 1. Both vrr_range_min and vrr_range_max are set to a non-zero value.
+	 *    This indicates the driver to switch the new VRR range control
+	 *    behavior.
+	 * 2. Both vrr_rage_min and vrr_range_max are within the panel's supported
+	 *    FPS range.
+	 * 3. vrr_range_min is less-than-or-equal-to vrr_range_max.
+	 */
+	uint16_t vrr_range_min;
+
+	/** @vrr_range_max:
+	 *
+	 * Default state is 'vrr_range_max = 0', (and 'vrr_range_min = 0'),
+	 * indicating legacy VRR_ENABLED behavior. if both are set to a non-zeo
+	 * value, the new VRR range control behavior will be active.  See
+	 * &DRM_CLIENT_CAP_VRR_RANGE_CONTROL.
+	 *
+	 * If setting a non-zero value, the driver should check that:
+	 *
+	 * 1. Both vrr_range_min and vrr_range_max are set to a non-zero value.
+	 *    This indicates the driver to switch the new VRR range control
+	 *    behavior.
+	 * 2. Both vrr_rage_min and vrr_range_max are within the panel's supported
+	 *    FPS range.
+	 * 3. vrr_range_min is less-than-or-equal-to vrr_range_max.
+	 */
+	uint16_t vrr_range_max;
+
 	/**
 	 * @self_refresh_active:
 	 *
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 115763799625..4cb57a503a02 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -240,6 +240,16 @@ struct drm_file {
 	 */
 	bool supports_virtualized_cursor_plane;
 
+	/**
+	 * @vrr_range_control:
+	 *
+	 * If set to true, the DRM driver will allow setting of the
+	 * &drm_mode_config.prop_vrr_range_control_min_property and
+	 * &drm_mode_config.prop_vrr_range_control_max_property CRTC
+	 * properties, if the properties are supported by the driver.
+	 */
+	bool vrr_range_control;
+
 	/**
 	 * @master:
 	 *
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 2e848b816218..e02dd46ca5c2 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -680,6 +680,24 @@ struct drm_mode_config {
 	 */
 	struct drm_property *prop_vrr_enabled;
 
+	/**
+	 * @prop_vrr_range_control_min_property: Optional CRTC properties to
+	 * further limit the minimum allowed refresh rate within the panel's
+	 * supported refresh rate range. It's invalid to set unless the
+	 * client advertises &DRM_CLIENT_CAP_VRR_RANGE_CONTROL.
+	 * See also &drm_ctrc_state.vrr_range_min.
+	 */
+	struct drm_property *prop_vrr_range_control_min;
+
+	/**
+	 * @prop_vrr_range_control_max_property: Optional CRTC properties to
+	 * further limit the maximum allowed refresh rate within the panel's
+	 * supported refresh rate range. It's invalid to set unless the
+	 * client advertises &DRM_CLIENT_CAP_VRR_RANGE_CONTROL.
+	 * See also &drm_ctrc_state.vrr_range_max.
+	 */
+	struct drm_property *prop_vrr_range_control_max;
+
 	/**
 	 * @dvi_i_subconnector_property: Optional DVI-I property to
 	 * differentiate between analog or digital mode.
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 3cd5cf15e3c9..e4d918342e67 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -906,6 +906,23 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
 
+/**
+ * DRM_CLIENT_CAP_VRR_RANGE_CONTROL
+ *
+ * The driver shall not program a refresh rate that is:
+ * - Below the &drm_crtc_state.vrr_range_min, nor
+ * - Above the &drm_crtc_state.vrr_range_max
+ * Even if the panel supports a wider range than the range requested.
+ *
+ * Once set, the driver will allow setting of the
+ *
+ * - &drm_mode_config.prop_vrr_range_control_min and
+ * - &drm_mode_config.prop_vrr_range_control_max properties.
+ *
+ * Otherwise, setting them will be invalid.
+ */
+#define DRM_CLIENT_CAP_VRR_RANGE_CONTROL 7
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
-- 
2.43.0

