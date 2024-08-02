Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FAC945FC4
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 17:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0449D10E140;
	Fri,  2 Aug 2024 15:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LRBJl0U+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9734610E140;
 Fri,  2 Aug 2024 15:00:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewK+BwR+IODLSk9JtP5sH7HtLWI6ipt0ykhAwjBlcNGAA9Rln9rYvNrDeyhdY5xSpQzGq97LXHAC1KsIw2JSAnUP+uRLyoJdUMibp+0CObpahRdJbGpduiG2PNIXC225ZkeCR0q74TY4asBmu93YIVaDD8mzuVJTUrAMy8V9BJZPLyeJXYbCgSR8ACvFGJbJwAz8USeghkecbmc72ip89mTRGfCBg4U6tVGIeTd6+7VqG7dIBeGMBJLQn0BT6b4b5c4Bp/A90IHqubJu4YhugDzOQBcmpm5tWXnxxOOZ3N80M0V7IxXMmrqLANfEOfp0Tse9T4LY8qKFIt0CNaV96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OyiYyGA6o/1SZfI+qbzO61aHrb96zX/xwy6/iprPK3Y=;
 b=TowBkoweN+vtyH+AUVKhDxGAWl+fTgWBWBBOj2BxNh2Y6fthj8qdAPjt+B/zweCgUwZZ6tOUJuLUBU7WAjkyXE3bnUqe+2EMMwbk08k+vC8zHIKJ5a7QLIFECCKFicc/etMgwkhrI8gpAeGmOusZ2j7lxTdFICtSUgUTlNaF7O0vnTkzABb6fGqPDwuFx/5D0cTtWMUCq+gn96mLMXELABWBrQDk7o+MuRZ31oX/NmT96ATxbguZZXWJ5XARCFaZ2j63luwpHgYZVdqLqDuo9geItD4RJrjK1tDlrblDstvkjO4SsgfbmdHvKUxV2vmfz6rJf8Fh9tvkBI3IoSBrpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyiYyGA6o/1SZfI+qbzO61aHrb96zX/xwy6/iprPK3Y=;
 b=LRBJl0U+xnMWklpUvTWOzwWkztx71IB7WLods60+TtHrSRWRnaX0ihTBV6BIVszAIWvOFD7tjgRnrWgjRy6lkDgNAjIKe5/V6cNrjs2Kxoz68Ig1oyk7ANBsvLyyiksNAvB+VwSTFjUL9dmR6sKjckdC9vNH4CLi92m/08y1IdQ=
Received: from CH0PR03CA0422.namprd03.prod.outlook.com (2603:10b6:610:10e::19)
 by SN7PR12MB7978.namprd12.prod.outlook.com (2603:10b6:806:34b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Fri, 2 Aug
 2024 15:00:08 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::b4) by CH0PR03CA0422.outlook.office365.com
 (2603:10b6:610:10e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Fri, 2 Aug 2024 15:00:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Fri, 2 Aug 2024 15:00:07 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 Aug
 2024 10:00:05 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Sebastian Wick
 <sebastian.wick@redhat.com>, Xaver Hugl <xaver.hugl@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Mario Limonciello <mario.limonciello@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, <amd-gfx@lists.freedesktop.org>, Simon Ser
 <contact@emersion.fr>, Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: [PATCH 1/2] Revert "drm: Introduce 'power saving policy' drm property"
Date: Fri, 2 Aug 2024 10:59:45 -0400
Message-ID: <20240802145946.48073-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|SN7PR12MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: ac596cf8-84ba-4b39-ee74-08dcb303ccb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?//I0Fd07gGVTR0G4K98qgFEnWF8IIK3UPo80cEgxf2RiuMbJFfqeLpW5xueV?=
 =?us-ascii?Q?CckpRLTD68JXOxPtnfX60PMSajfZQwB7ITZjI97ApIYBNJAD5BIVXUO9pCsf?=
 =?us-ascii?Q?ryHC8ZchCAYczmQsbJdATeXZMd032JmAJAHULjl9lCpifQoalYGT+PjNCAQe?=
 =?us-ascii?Q?eRI4Lx3wKTzDYcFnnN0iyj7y52NzNRp/URhcbuIqmtrOA6t6CyN//hDLtoGJ?=
 =?us-ascii?Q?bdFuTK0DtFPkBzDO9fogPI4vo9o4I8hfCv30rG0U/d/n31OD/2txnfF8VtUB?=
 =?us-ascii?Q?VXttGjlImUkoTooayaY5ja1VxDoeth6/Jm7fuOSo4+EuMhlqx5qtAcS++Rsp?=
 =?us-ascii?Q?gpd63iYk7T+s0LvaL27SS3g575Ter6hfU5YaeksZgMsJzojkHP7lrBUjRBbS?=
 =?us-ascii?Q?ve569P8tFc6LgVZJrFCdTVUSP1C7Ul+iTkvBqLJ9W+NME58hXJKVOkJ1MxHW?=
 =?us-ascii?Q?txJ+HHgQADaVha+wt4Z58tTEl+CD96/zPyiTIxb5V5z2dnE3573a0nX9k4DM?=
 =?us-ascii?Q?M0YK5CI0tSJQN+GWaLWH52nqrLEIX3tXNjKJqFjYCU4IRBbxF7DC09yQcUVP?=
 =?us-ascii?Q?ztlvbryjtOZXCh+8mOI+R5GVNfCZfji0C2x6l2lbSOsF0Lh/WlgaTsjxSZEh?=
 =?us-ascii?Q?UK1fsS3vckPa7um9LG22pAvKX1njMt7BTCCbL7GDm+wrSbeU7ssCNz35uohf?=
 =?us-ascii?Q?LEceAi/GMFlczXtMFFIE3sihoWqNcihbG0/JN4TfNFWkvxUrxrNrCMAZ9pMt?=
 =?us-ascii?Q?tc919z6UWnRHzK2DDlYcd9D0QxxXzNILRkZn//o+mArfYDDQC8Gkeh+NtppB?=
 =?us-ascii?Q?ZZkHk6LmNzc6oUbTYM8unxnpwrNaTTOnCCvtb/K2sKjynzuw3IcU5aMZGI6d?=
 =?us-ascii?Q?GFTiMpnCVf/fHQ4lh8IjCaW4/MFjcnp1b3PJPrYOW9BkMn/QoOGkArSQtjcI?=
 =?us-ascii?Q?Qn26FNxqemJR0v+KbrF4IYPBGEYKrKwNj7Hf5492W82qi4eJlVdKV6ZIsfnp?=
 =?us-ascii?Q?tMXhg93OEMg74ksdoB1/2D/rrsoKTXijGSKXjejRQogqj+1QXte8NZNMJd83?=
 =?us-ascii?Q?ie3o8WYdmyK3mQ4Oo2M5HSBi5CA0vplGeIjjkq/tGAgvS/3tRixnpD5LEB3p?=
 =?us-ascii?Q?MXi11TJPY56Q0V2zVhE7AN7ndaXBsSTqaQZPqAsjomp4EGWvZSA0pY3UFOpV?=
 =?us-ascii?Q?FkmDjaEiGXGal5iutXejONkikKr39qqHlvQypleC+u6dsY/7YkBaHUav7jMg?=
 =?us-ascii?Q?EDDS0PO9FTCMNimTZ7YTi5uvJaWCLWMuOirTyegF8sOZQCVCL7LxI7r4fexb?=
 =?us-ascii?Q?jHVJh8Kqp2tldGKNuar4syxco6Mj7w6yX9qYWvfw3z5Hj2fxjSn1USKQn0Ki?=
 =?us-ascii?Q?8ucs3sB6g6ZBd+485B7kCeK157Mpt+Huq/MKNaIM2jgmxWMzau1P+m6lY8Qd?=
 =?us-ascii?Q?owRmLFpdzK0E/u0VugVLiYOqofacP3gy?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 15:00:07.9841 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac596cf8-84ba-4b39-ee74-08dcb303ccb9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7978
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

This reverts commit 76299a557f36d624ca32500173ad7856e1ad93c0.

It was merged without meeting userspace requirements.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/drm_connector.c | 48 ---------------------------------
 include/drm/drm_connector.h     |  2 --
 include/drm/drm_mode_config.h   |  5 ----
 include/uapi/drm/drm_mode.h     |  7 -----
 4 files changed, 62 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 7c44e3a1d8e0..b4f4d2f908d1 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1043,11 +1043,6 @@ static const struct drm_prop_enum_list drm_scaling_mode_enum_list[] = {
 	{ DRM_MODE_SCALE_ASPECT, "Full aspect" },
 };
 
-static const struct drm_prop_enum_list drm_power_saving_policy_enum_list[] = {
-	{ __builtin_ffs(DRM_MODE_REQUIRE_COLOR_ACCURACY) - 1, "Require color accuracy" },
-	{ __builtin_ffs(DRM_MODE_REQUIRE_LOW_LATENCY) - 1, "Require low latency" },
-};
-
 static const struct drm_prop_enum_list drm_aspect_ratio_enum_list[] = {
 	{ DRM_MODE_PICTURE_ASPECT_NONE, "Automatic" },
 	{ DRM_MODE_PICTURE_ASPECT_4_3, "4:3" },
@@ -1634,16 +1629,6 @@ EXPORT_SYMBOL(drm_hdmi_connector_get_output_format_name);
  *
  *	Drivers can set up these properties by calling
  *	drm_mode_create_tv_margin_properties().
- * power saving policy:
- *	This property is used to set the power saving policy for the connector.
- *	This property is populated with a bitmask of optional requirements set
- *	by the drm master for the drm driver to respect:
- *	- "Require color accuracy": Disable power saving features that will
- *	  affect color fidelity.
- *	  For example: Hardware assisted backlight modulation.
- *	- "Require low latency": Disable power saving features that will
- *	  affect latency.
- *	  For example: Panel self refresh (PSR)
  */
 
 int drm_connector_create_standard_properties(struct drm_device *dev)
@@ -2146,39 +2131,6 @@ int drm_mode_create_scaling_mode_property(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_mode_create_scaling_mode_property);
 
-/**
- * drm_mode_create_power_saving_policy_property - create power saving policy property
- * @dev: DRM device
- * @supported_policies: bitmask of supported power saving policies
- *
- * Called by a driver the first time it's needed, must be attached to desired
- * connectors.
- *
- * Returns: %0
- */
-int drm_mode_create_power_saving_policy_property(struct drm_device *dev,
-						 uint64_t supported_policies)
-{
-	struct drm_property *power_saving;
-
-	if (dev->mode_config.power_saving_policy)
-		return 0;
-	WARN_ON((supported_policies & DRM_MODE_POWER_SAVING_POLICY_ALL) == 0);
-
-	power_saving =
-		drm_property_create_bitmask(dev, 0, "power saving policy",
-					    drm_power_saving_policy_enum_list,
-					    ARRAY_SIZE(drm_power_saving_policy_enum_list),
-					    supported_policies);
-	if (!power_saving)
-		return -ENOMEM;
-
-	dev->mode_config.power_saving_policy = power_saving;
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_mode_create_power_saving_policy_property);
-
 /**
  * DOC: Variable refresh properties
  *
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 5ad735253413..e3fa43291f44 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2267,8 +2267,6 @@ int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
 					   u32 supported_colorspaces);
 int drm_mode_create_content_type_property(struct drm_device *dev);
 int drm_mode_create_suggested_offset_properties(struct drm_device *dev);
-int drm_mode_create_power_saving_policy_property(struct drm_device *dev,
-						 uint64_t supported_policies);
 
 int drm_connector_set_path_property(struct drm_connector *connector,
 				    const char *path);
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 150f9a3b649f..ab0f167474b1 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -969,11 +969,6 @@ struct drm_mode_config {
 	 */
 	struct drm_atomic_state *suspend_state;
 
-	/**
-	 * @power_saving_policy: bitmask for power saving policy requests.
-	 */
-	struct drm_property *power_saving_policy;
-
 	const struct drm_mode_config_helper_funcs *helper_private;
 };
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 880303c2ad97..d390011b89b4 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -152,13 +152,6 @@ extern "C" {
 #define DRM_MODE_SCALE_CENTER		2 /* Centered, no scaling */
 #define DRM_MODE_SCALE_ASPECT		3 /* Full screen, preserve aspect */
 
-/* power saving policy options */
-#define DRM_MODE_REQUIRE_COLOR_ACCURACY	BIT(0)	/* Compositor requires color accuracy */
-#define DRM_MODE_REQUIRE_LOW_LATENCY	BIT(1)	/* Compositor requires low latency */
-
-#define DRM_MODE_POWER_SAVING_POLICY_ALL	(DRM_MODE_REQUIRE_COLOR_ACCURACY |\
-						 DRM_MODE_REQUIRE_LOW_LATENCY)
-
 /* Dithering mode options */
 #define DRM_MODE_DITHERING_OFF	0
 #define DRM_MODE_DITHERING_ON	1
-- 
2.45.2

