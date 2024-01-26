Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFC383E551
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 23:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498D710FF6B;
	Fri, 26 Jan 2024 22:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1B910FF65;
 Fri, 26 Jan 2024 22:23:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6TE9IyJVsNS3DaL++GS6F63OLmvr2WpqvwSklW5qkmken27iXRzHy9Rciscpf4om0v+mEYN+w1goSvRNtU6QRmudidmZ2g4WBtWu10NDWnU6/cCO2fzAQ+CztxEnRkVY+HhwPw7JOctwaEmVr5pUJTUBD/jlQoJYtCEkFRMhbE7h/MHK9cKtPNue0a3Uk6QdzH4VOaG5x0/NE5d6VhLLaKlBDDXNQZG+MnwZPDSumg74PQF/2W7viMhxRoItpbFH/eIbWueLbSItoEQj8bsxdTnkkef6LIzdRuL7JF6BzOMDhagutnuElo93JUGa2yF1/Rt2R+yO7JvTq/JkL366w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XS+ME5l2Zm5TR02mkR9IVUrIF0kwVsGTzppFYJKVZ0s=;
 b=Zso0xBizZdITLhMTcDws/H+ly3Zp/STXqV6xG9d7Ue/86awwLvcA41/ifPHhwc1sW/d2zU4YHmniczm88QGaTanaHV+6OJQhpKLKyEC3naK+tKFXsvSoN9kHE+lc4OROgs5ArIKIaA15azKlawDJOoIYHIOs5bxTSrapA+n7pJGO/UuABO8l+eYY3jdTbuUMm35zG8TO0kfXs5XcHcrMEcDGaCyFJAjwdRAdVikUJEiRaaJs8mvrnJ4jY+YH7i9JtavzJQgfJLEJUy3IsnBkfvI+0Xoz+5BOIGNGtTw0Fmyu8voFU6wbhS0D4RSRoHh4ecWCX7aGjNpTms+zIKZZOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XS+ME5l2Zm5TR02mkR9IVUrIF0kwVsGTzppFYJKVZ0s=;
 b=h3Q7XqjIBimpinU+C2V1tPE6JR444pFrGCzraiWTGY3NwHIa+FvJdx2GJMzKbP3gJxVqY3xIKyPUgfgV6ViBNAmfGK43GG8M8aqT9FbIfObIbXXihkpioI7WGsyPUTXpMh9L/Rg8b+jy7BpGvArr4CXv12c/ZrwDyIlRKivnlo4=
Received: from BL1PR13CA0233.namprd13.prod.outlook.com (2603:10b6:208:2bf::28)
 by PH7PR12MB6785.namprd12.prod.outlook.com (2603:10b6:510:1ab::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 22:23:36 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:2bf:cafe::ef) by BL1PR13CA0233.outlook.office365.com
 (2603:10b6:208:2bf::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22 via Frontend
 Transport; Fri, 26 Jan 2024 22:23:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 26 Jan 2024 22:23:35 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 26 Jan
 2024 16:23:34 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: add panel_power_savings sysfs entry to eDP
 connectors
Date: Fri, 26 Jan 2024 17:22:58 -0500
Message-ID: <20240126222300.119292-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|PH7PR12MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: b224326f-b454-4cb5-ac72-08dc1ebd703b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qwOlCMXqusNZkiLa0ijWPvUGdjCLhBG5TSFjaqgj1aQw/VuLxQTaTpYrHWuS7pOxzvo2F46So/sUql5eQv5KKvEIcgtE1gbRbm6dHkIEnEJj/WTADTWjBKoxduMgb0kTb0vTZX+cIsqcvwchq2jslZGbPV3bYjr4vOa554uj7j566q99Tl8Nkpo/KOebQ+B2WAnQuio8H1kHfOHea4cMib95bY804xIlOWdDX8AUNZV1LreXVaD3oBJnF124S/QRRHhi0RKU7Xdx6iAnxR2QYNfsxvantmfEjhRzv/70vaKT0I88he0+UVO5Wa5SB1AfTcD23qJR47bDlXdDs0y7kbID40lTJAWBiCkeXIDiEQiSYqNYUVQ7vVoN/4eYOL+03iqeWK6dApjIf/eHDz98GNZh8jvbNs4rI/I9qpfhVZv2lDH1V75GrKCbGU+922YUF3YP6Pj6m3OJvy7cietT4oqoFhFgnvRs/xeZUhJuDOM08SBIWqhDbi1uYaoGB3KkMZuisynKHAzEvyvWiKumQTTYNUuGgfkZ1TGEn0KOWmbEIp7+4I3zK4MSX806V/VnBJZrgxbMLmBXhkL1xMA9RAPIDJ/ITvD5WeiW2pNHZ8GSArp9xnKE/6RTIZC1c4mpbBQMcVKrCuXoZ3o4mGn5++G/5yyxcTDGObtv7V1XDmSiT/SWbMiT/f6wY+HUHj2T4r/au1OMkLEBgc11zQnyPTITL6fQD0RA9gl8lG7Gt+BOF50QdsvP6crInZ6o2uUCrVIRdTgs2COaMyKZR8l7+jQW4lAtx5Kqt4PZ5V84oSLmnJ+QHaJwT8g/gGDy+I4Q
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(186009)(82310400011)(64100799003)(1800799012)(451199024)(40470700004)(46966006)(36840700001)(40460700003)(40480700001)(83380400001)(47076005)(36756003)(81166007)(356005)(86362001)(44832011)(36860700001)(4326008)(426003)(8676002)(8936002)(5660300002)(16526019)(336012)(26005)(2616005)(1076003)(82740400003)(316002)(6916009)(70586007)(70206006)(54906003)(2906002)(41300700001)(478600001)(6666004)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 22:23:35.9910 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b224326f-b454-4cb5-ac72-08dc1ebd703b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6785
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
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Leo Li <sunpeng.li@amd.com>, David Airlie <airlied@gmail.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Wayne Lin <wayne.lin@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want programs besides the compositor to be able to enable or disable
panel power saving features. However, since they are currently only
configurable through DRM properties, that isn't possible. So, to remedy
that issue introduce a new "panel_power_savings" sysfs attribute.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index cd98b3565178..b3fcd833015d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6534,6 +6534,58 @@ amdgpu_dm_connector_atomic_duplicate_state(struct drm_connector *connector)
 	return &new_state->base;
 }
 
+static ssize_t panel_power_savings_show(struct device *device,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct drm_connector *connector = dev_get_drvdata(device);
+	struct drm_device *dev = connector->dev;
+	ssize_t val;
+
+	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
+	val = to_dm_connector_state(connector->state)->abm_level;
+	drm_modeset_unlock(&dev->mode_config.connection_mutex);
+
+	return sysfs_emit(buf, "%lu\n", val);
+}
+
+static ssize_t panel_power_savings_store(struct device *device,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count)
+{
+	struct drm_connector *connector = dev_get_drvdata(device);
+	struct drm_device *dev = connector->dev;
+	long val;
+	int ret;
+
+	ret = kstrtol(buf, 0, &val);
+
+	if (ret)
+		return ret;
+
+	if (val < 0 || val > 4)
+		return -EINVAL;
+
+	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
+	to_dm_connector_state(connector->state)->abm_level = val ?:
+		ABM_LEVEL_IMMEDIATE_DISABLE;
+	drm_modeset_unlock(&dev->mode_config.connection_mutex);
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(panel_power_savings);
+
+static struct attribute *amdgpu_attrs[] = {
+	&dev_attr_panel_power_savings.attr,
+	NULL
+};
+
+static const struct attribute_group amdgpu_group = {
+	.name = "amdgpu",
+	.attrs = amdgpu_attrs
+};
+
 static int
 amdgpu_dm_connector_late_register(struct drm_connector *connector)
 {
@@ -6541,6 +6593,13 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
 		to_amdgpu_dm_connector(connector);
 	int r;
 
+	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
+		r = sysfs_create_group(&connector->kdev->kobj,
+				       &amdgpu_group);
+		if (r)
+			return r;
+	}
+
 	amdgpu_dm_register_backlight_device(amdgpu_dm_connector);
 
 	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) ||
-- 
2.43.0

