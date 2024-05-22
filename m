Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C358CC8C7
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 00:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAD510E028;
	Wed, 22 May 2024 22:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mBI8KYVU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB71110E028;
 Wed, 22 May 2024 22:09:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oU8CU227bX4gbZsyf0nHS9xtBtE0qsZjum6yygFRB/uZY8QdaUgP/dW9eSdLTNiP42bd23PstgsX0fvh/VFOrosI0hCbZK/0gvz8Z39cF5gxOC4A5o/t1Erh5i9zOJrswSptzaW0e0r7sOdxnRgccapLxcnwbVZyyo9hsAHS5aKVNXhNwJplAdRRulH90xZuoZ+2lX0/bipvwkIV2xxVUtrBK6TXWgatLU9zU3fmt6r/6W5umoB8zu23AX4kXiP7VUb+eS748kr2hJfaMn+SBF2GN3PXP6ZwtOfDcTC6pzs0Ddoh44D/1Qkv0WX1+rf/nassGU5/ur9jiGjglE6bXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKqjNh/CVDpsUn2t2w5AiD6HRJJbNhBonMQ88lItVws=;
 b=nYmAxhB56jV1kqJ4w4Hfske2L3eO64HgTNgkh2Y/lBIC71hznbrr7KREabdWlZiSEmWyW9ayX+JXtSBZsYyNwek8Tj0TpoMUFU3uuQMk/pL0AXhEUH8JpWr9OlZd5aK/83uirs116Og/SPjtFicFysnCRfQxTHVv6TS2tdlR/iS9H+ton30VUINXLgwlZAwbEH+1ul1+uXq0WU4xEEK+qDFsEH8Ipzc+bE6PY9xbQTvMTFfsvLGLeRO8eDeU0c8GhZVkgev4py34+SGas4Myd46oO2/rPar6T+Lc0BNWfG1RNR24LeJx87rc+bw4xpFlEJFmzqiN67eox20vRZRFsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKqjNh/CVDpsUn2t2w5AiD6HRJJbNhBonMQ88lItVws=;
 b=mBI8KYVU4d8RKstHDQvXI5m6zhVXqw9GMr4hbVd/sqidVSvD1Y1g+/CwYl63i5b/5boBAlvP6wtBPQaJ6+JnBHBtvRsIPxyHsbYpb03xGaj3Uyxh08Mvs/r1FWmpZL8t9/Vw7bMrymaZF+JMds3rvelUVNGg8PnjIcWeGUcIuHs=
Received: from MN2PR11CA0030.namprd11.prod.outlook.com (2603:10b6:208:23b::35)
 by DS7PR12MB5934.namprd12.prod.outlook.com (2603:10b6:8:7d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 22:09:09 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:208:23b:cafe::16) by MN2PR11CA0030.outlook.office365.com
 (2603:10b6:208:23b::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20 via Frontend
 Transport; Wed, 22 May 2024 22:09:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 22:09:08 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 17:09:07 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
CC: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, <dri-devel@lists.freedesktop.org>, Leo Li
 <sunpeng.li@amd.com>, Sean Paul <seanpaul@google.com>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH v2 1/4] Add support for API for drivers to set power saving
 policy
Date: Wed, 22 May 2024 17:08:46 -0500
Message-ID: <20240522220849.33343-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522220849.33343-1-mario.limonciello@amd.com>
References: <20240522220849.33343-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|DS7PR12MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: 21800a5b-fc57-4be1-d822-08dc7aabcd94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|376005|36860700004|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?taJS0mZUO6Ekd0AhhzebbWLnpbDPXfkYIk9drMaminV16cgB6uVyIl35ruq9?=
 =?us-ascii?Q?yt508MXAz7EAF8fa7vmQ61ZA6wX5I7XaezNOSFfGDMW5MbBAZ4SLoJBUm3+f?=
 =?us-ascii?Q?vQrBESqDs5NR/GZX2qKmXkch9vkjhDg7pkjvHuMmdLQqemTkz2Rfwhw/RFeR?=
 =?us-ascii?Q?yuW4fkPObmrRKU/LwcaIDLoKy1zSlccv/yUq+E3+KyyYL63BlcXwliUvzfma?=
 =?us-ascii?Q?aSbJ7MrY4lsoSlQY0aGlXSAy6FU+dW4zVadX+sV55iV6dCVc4PlxGiAH2sCA?=
 =?us-ascii?Q?V+AZ6B1Ix+9OkIfEqPRq4cI5kMHNZl6qKGY5H9UYJ5yDOyK4szSJDd1lJZ3V?=
 =?us-ascii?Q?3tMoppwGEibZaEUqwpdxyB0S8kHL2WN+jqsY1Hc/w7DQBUaATuL2OFB/fkwz?=
 =?us-ascii?Q?DsWN8MndRZ5/uqs7RCrnRBchC9vss8ATT4EEQsf7XhC0qXZEvLqoP9hJtGnn?=
 =?us-ascii?Q?wR6wL63urzpn1XPRZQpGHOM8W35o8VFjLB1svjoKa5pfyV1NDQpzN3h9GftB?=
 =?us-ascii?Q?3eJr0+a5zilrjnWOhxQ25S/YdEkIZ/D3onk5SjVBo3oUt51ZYdrfEmIGLjid?=
 =?us-ascii?Q?8bNdtiAHbcEA7ZAfNBGfNxAW4wnoGF66ZtyHb4cTUx2MiEJlgFPFbOcoImfo?=
 =?us-ascii?Q?ZVWyB4lVwOLQfB2H2X8LXPGwVkLBdKxDKW6lPKBnl0drTB9vt11GQ1eTTwy0?=
 =?us-ascii?Q?nuw0zDqWsi+Q/WyBOK3eSplTkAfDk7908a1WDBH3ImDWd8ompahuiaXWafoL?=
 =?us-ascii?Q?iJ0b+wvbKJfdlYyKb4XGFnqfE15sXOUWtp00RPOMAcOR/L8nKriwMVwteUDR?=
 =?us-ascii?Q?iPCipJkVnIMZ57EJsfreifwcDHHEqUOFx0xaHIdJRP0ReB8+bOpR+ZG1kZvA?=
 =?us-ascii?Q?CmWOeE5VCSCY3vY5y8Hq1pgPiOKR9IUN408Ij6QnQGokqBp5l0dzbhXT0z6s?=
 =?us-ascii?Q?Ep0dboGsfoTpiHg8MFqXKv54gQ6lXcnJiTYUMC0ebEvuQPo6zpxiCc/I2USu?=
 =?us-ascii?Q?ujzGxSKRS6vYqTmxNQaTSd0N7dxlgCrw3kheDnfi/0TfzDIsdhy8XfgK8m1P?=
 =?us-ascii?Q?EGcfSCaQ6rRRz5D8862BrZraUxLh4aDNFfgO5uHXKyN/P1xvgWD9AvFmwcmF?=
 =?us-ascii?Q?OMFtRu5209FkDPHkeJrqXJ5mmrclyDPqjEysU8ztsWYd4by6x6nT1RMd1edn?=
 =?us-ascii?Q?WxlOT+LusDT5tjX7yvyJuV3XwB2vKblXFTsIPWMi07UYi5GF1O8f5B18hmdW?=
 =?us-ascii?Q?Fz6XzyZtpI7cFwFLq2wIi1qd8I+w1vcWfOQrhHv/LN8Y+mnSz3ZKJvct3vNZ?=
 =?us-ascii?Q?RtwtIgDogZesljg6j5fvd7uyKavQ6oEidx1I112vQdalnkDVLZ2r7R7lIICj?=
 =?us-ascii?Q?7kYxtkfSc1S4fmhLHHQH9H8PTHfa?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 22:09:08.6379 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21800a5b-fc57-4be1-d822-08dc7aabcd94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5934
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

---
 lib/igt_kms.c | 26 ++++++++++++++++++++++++++
 lib/igt_kms.h |  6 ++++++
 2 files changed, 32 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index af63d13b1..4ce5e4a95 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6581,3 +6581,29 @@ int get_num_scalers(int drm_fd, enum pipe pipe)
 
 	return num_scalers;
 }
+
+static int toggle_power_saving_policy_prop(int drm_fd, igt_output_t *output, uint64_t policy)
+{
+	uint32_t type = DRM_MODE_OBJECT_CONNECTOR;
+	bool prop_exists;
+	uint32_t prop_id;
+
+	prop_exists = kmstest_get_property(
+		drm_fd, output->id, type, "power saving policy",
+		&prop_id, NULL, NULL);
+
+	if (!prop_exists)
+		return -ENODEV;
+
+	return drmModeObjectSetProperty(drm_fd, output->id, type, prop_id, policy);
+}
+
+int clear_power_saving_policy(int drm_fd, igt_output_t *output)
+{
+	return toggle_power_saving_policy_prop(drm_fd, output, 0);
+}
+
+int set_panel_power_saving_policy(int drm_fd, igt_output_t *output, uint64_t policy)
+{
+	return toggle_power_saving_policy_prop(drm_fd, output, policy);
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 01604dac9..129b88576 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1223,4 +1223,10 @@ bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 int get_num_scalers(int drm_fd, enum pipe pipe);
 
+#define DRM_MODE_REQUIRE_COLOR_ACCURACY	BIT(0)	/* Compositor requires color accuracy */
+#define DRM_MODE_REQUIRE_LOW_LATENCY	BIT(1)	/* Compositor requires low latency */
+
+int clear_power_saving_policy(int drm_fd, igt_output_t *output);
+int set_panel_power_saving_policy(int drm_fd, igt_output_t *output, uint64_t policy);
+
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

