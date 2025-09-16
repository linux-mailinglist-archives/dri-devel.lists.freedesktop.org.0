Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D49B58BE4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 04:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFC510E54F;
	Tue, 16 Sep 2025 02:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="q+eecJx5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013068.outbound.protection.outlook.com
 [40.107.201.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309AD10E54F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 02:36:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQCB91zqkopl0CiVDS8ceOCJnV1vtS4ltx4ZoSbhHrkKS8SZeLDf8LTWLj9ad0AF8G0LNkaV+euy2n8kDRUKfgFyMpbMi02sZTi8ZfNufImMlLGFcVuMNMgA7sTSeCtT+Bl/036Ug6SozNjz6WjRHAMR8ijOBLYOjrDol+ZbAuBZw1Daze2tNLRJIm+BhH5P2N9dvlMffUgfx+vIf/Uea4QujCAO/c0SyI6dJDyk+01l5pmXdwXugGAJ77XGCPxYLaLe0r9yV23qnZrcQNk2FEgibPSan6dG18TcRQmgzbSLzphSGcad5sL0NEzxRTkm7mRdGNurGJu4xJnWKWzJhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yma3SNOvk21xljXvsup32PEzl5bxZ77OxbOQHRGG6o8=;
 b=uAtE8/jbVmRSIJvmmcaJm37CW/u6UalgPl5xCnNSp/ynDcmhqCDemmUWOb/HLzmqMykuOh0S+c5FJQfhxtBjuMOI2KJ3b/L+jBktGdZtwbS091e/bm7FigeTh1pTgIQAN+ZkUdnR/MJMAf7U8e+IiDr7+5EJ04i7qPiUzqrglQH7FKEdqCV6lZ/5J4C0mLW7ZaNJ2R4bDZ2eznUlZP9NtYZ3VZ94Bx5YfOzqOykhuaXOoNrAKXrTao8OakClgatBOZeDlFnmg5Epre4C0lUNNko3EXJGcIJvz3bkzw9ELBebjlAZhg3NVgFQc8/lrplJhDX2LCqrPMX8xS4shUipdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yma3SNOvk21xljXvsup32PEzl5bxZ77OxbOQHRGG6o8=;
 b=q+eecJx5zxy+JhZTt9J/qKAwWjCkfoLjPqzH9lLLJ6yIC7Yi3zRrYF6Y3i4ggjiG42gGEe+j9RLUsPbuYsizuqfHbRae0NXOvtMRZPfOtdwLPttrjpo+n6EJhRBaiMxIZFAiWKb+CM3/9fcnTT/Rxj7D0gYZzxi4LKCRcxm+RpA=
Received: from DS7PR03CA0183.namprd03.prod.outlook.com (2603:10b6:5:3b6::8) by
 SN7PR12MB6887.namprd12.prod.outlook.com (2603:10b6:806:261::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 16 Sep
 2025 02:36:01 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:5:3b6:cafe::dc) by DS7PR03CA0183.outlook.office365.com
 (2603:10b6:5:3b6::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.21 via Frontend Transport; Tue,
 16 Sep 2025 02:36:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 02:36:00 +0000
Received: from maxZ2mini.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Sep
 2025 19:35:57 -0700
From: Chuanyu Tseng <Chuanyu.Tseng@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <Mario.Limonciello@amd.com>,
 <xaver.hugl@gmail.com>, <mdaenzer@redhat.com>, <victoria@system76.com>,
 <seanpaul@google.com>, <Sunpeng.Li@amd.com>, Chuanyu Tseng
 <Chuanyu.Tseng@amd.com>
Subject: [RFC PATCH v2] drm/uapi: Indroduce a VRR Range Control Interface
Date: Tue, 16 Sep 2025 10:35:38 +0800
Message-ID: <20250916023538.90951-1-Chuanyu.Tseng@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|SN7PR12MB6887:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d238e05-9242-44be-9fbb-08ddf4c9c60b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e/ZSrJ6IUcppJah7KfJD7L/4zSp80wnvp4Q/iUnrRr1hmPW/DAFbTgVQ/H6P?=
 =?us-ascii?Q?YW5DJExV9AiJCDedS8C/ypi7kfRBSR5ryUvPa4oOeH6d8cIAMmCgDPVboJdL?=
 =?us-ascii?Q?Rr73ynWAgvAYzgQWUHh6ql4PqJnOrEZrAaDg4XwJITyUwgkFW/zJ3aLzn2xh?=
 =?us-ascii?Q?Lj1eubGFXbH9BjovAjoTVeq8NxYj28FNxecA41XE3p1Xum1HB4szIdgUCf38?=
 =?us-ascii?Q?L5Q3q5KKYaPIZ+5bmaw3qee6guErRwSm5+RUYnI31dYFPxrmG/iH2JRf8XU9?=
 =?us-ascii?Q?3bdOK5s+CQmDr+prNI4LhowtLXCMQLAFIuL7DqcyUSJ3meRTPlfJ10Hz+t6I?=
 =?us-ascii?Q?U4V5Pu95B0izXi1p0m07ujySuSq32b47wCtBlMZb6TFdPTmHF+wabeHR0aJc?=
 =?us-ascii?Q?DswYSZOy5zYAyaLAIY+/s3eBAl9WA0fCcQW5NDNbRORy8QetC/MjA9AxBFkg?=
 =?us-ascii?Q?nazpGtfzDrMB07t2ljwCATVGsrONQipxXXJid9XYuZ9DjlQ71Ho5h1+VFTe7?=
 =?us-ascii?Q?l8m1dLvsQBjHVFEiH2vvgugBZ0NJu8ANCj6W2WxDLV26xYK2/hnOV86CeW49?=
 =?us-ascii?Q?8VursdvD2XUrKui66CM7zwSPkw3IhQ4c6jcT8StN+1rYJ1j4vT//HNC3H0ip?=
 =?us-ascii?Q?Zb/EzJIiQEjsbjyXCVva1TYo6J7QgEUu5y9TfjKhrq1RIbBoVd/t4DYUGyAP?=
 =?us-ascii?Q?a6KVpOFwJg7lE/+sqz2suOV9/w+4nmc1UDHBhYPwn6y9idA+78J1+V6XdNKq?=
 =?us-ascii?Q?Iu1GMDVBaMtxdA2qSspe06aXvTEydFtjIk5PFcQlHqoCwj/b5Ezv6tHXwiNO?=
 =?us-ascii?Q?EohZOlNz4aOmmHxkTUfXcJsuENfPdSLH44EaAEMLqswiBolAG7anls5PBMrV?=
 =?us-ascii?Q?Q57pA2Y9jqhExoT1+e41EbNohkhNYL/V7taS6KRAAanXxHgv6bNLksN3Y6zN?=
 =?us-ascii?Q?5SKL63jy2U/Uy+wHgM7mYhlBmrtgk14sBPsc1t0jMoCEJizP5rvo4ROR8nw3?=
 =?us-ascii?Q?0NeV8vfPLlSXjKw2zusEQNw3mv4TB1CBX7VXylgQYyYJg3/VXQyTguebQrbx?=
 =?us-ascii?Q?uaUGQMvPasVj4E9DMdV8Ll2sFS4rHg3m+rXeTn5MN2jT/QIECRvaRk4zsJHg?=
 =?us-ascii?Q?eQGeTsk5rd8WVzTzCdcSgALFtx9AzkY47OJ9t2SsPDCndB6LoxwmvAVWzUgz?=
 =?us-ascii?Q?0Kl9zJd0BJod77ykqhyWE86klQi5aaYlxBkL1bsVgK18oSpAHX4+U8hBBl38?=
 =?us-ascii?Q?yyRb0iQXKUbqDq+fSkzKBi1EVjPtcVuKfKBE6fE728ikTGRTeDVu8RihZMjz?=
 =?us-ascii?Q?T8aOSzr61TXQXICdKzzXVgrr3/hHcDnvYV2s1EWY+BpNwD8odRvO+cojg8V4?=
 =?us-ascii?Q?ed43EZZVWN5WG7UJQpF6ydp6kHczGmPgB0mjuUXJSjKSn+qOIjJCSB39srUh?=
 =?us-ascii?Q?eQMIM5451RAUSrAruTEhxGUYUb8b38T4DFSzNjGY9rEAQO2m4Ho4K0NylZjz?=
 =?us-ascii?Q?WpH8qVZ61E6Byv2myhg9JuxCULu7ZKf+ANM3?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 02:36:00.3922 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d238e05-9242-44be-9fbb-08ddf4c9c60b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6887
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
Changelog:
v2:
    - Fixed property names with underscores instead of dashes.
    - Attach property function move to crtc instead of connector.

v1: Initial Submission
---
 drivers/gpu/drm/drm_atomic_uapi.c | 30 ++++++++++++++++++++---
 drivers/gpu/drm/drm_crtc.c        | 25 +++++++++++++++++++
 drivers/gpu/drm/drm_file.c        |  2 ++
 drivers/gpu/drm/drm_ioctl.c       |  7 ++++++
 drivers/gpu/drm/drm_mode_config.c | 14 +++++++++++
 include/drm/drm_crtc.h            | 40 +++++++++++++++++++++++++++++++
 include/drm/drm_file.h            | 10 ++++++++
 include/drm/drm_mode_config.h     | 18 ++++++++++++++
 include/uapi/drm/drm.h            | 17 +++++++++++++
 9 files changed, 160 insertions(+), 3 deletions(-)

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
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 46655339003d..f9ff6f0732c5 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -959,3 +959,28 @@ bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state)
 	return hweight32(crtc_state->encoder_mask) > 1;
 }
 EXPORT_SYMBOL(drm_crtc_in_clone_mode);
+
+/**
+ * drm_crtc_attach_vrr_range_control_property - attach "VRR_RANGE_CONTROL_MIN" and
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
+int drm_crtc_attach_vrr_range_control_property(struct drm_crtc *connector)
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
+EXPORT_SYMBOL(drm_crtc_attach_vrr_range_control_property);
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
index 25f376869b3a..e98487f52e2f 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -340,6 +340,20 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.prop_vrr_enabled = prop;
 
+	prop = drm_property_create_range(dev,
+			DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_RANGE,
+			"VRR_RANGE_CONTROL_MIN", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.prop_vrr_range_control_min = prop;
+
+	prop = drm_property_create_range(dev,
+			DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_RANGE,
+			"VRR_RANGE_CONTROL_MAX", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.prop_vrr_range_control_max = prop;
+
 	prop = drm_property_create(dev,
 			DRM_MODE_PROP_BLOB,
 			"DEGAMMA_LUT", 0);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index caa56e039da2..a9cf96b281e8 100644
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
@@ -1324,4 +1362,6 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
 int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 					    unsigned int supported_filters);
 bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state);
+
+int drm_crtc_attach_vrr_range_control_property(struct drm_crtc *connector);
 #endif /* __DRM_CRTC_H__ */
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

