Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2B7847326
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 16:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FAB10E7DE;
	Fri,  2 Feb 2024 15:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="m1jE29Dx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAD010E7DE;
 Fri,  2 Feb 2024 15:29:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8nJvqO4b/nFYGYHcdynQ0g6IJXzs6t326AaJrHlGpEJkdS916jo5jQJsfbI1NPJC0VOdBllLxsUQSJm5U4XfgoFwAER6sse14oncISiheUlxTsNBictq6eEM8AJhNYmQBZ1ITkgQakEr/EYKwMqD7F4ny923NIxBb23TST1dzyDvyKjeayspFu4u/sTKtxUkUemFkrFCZxiX/FUCbbftVBHBKEq8uLlbk7/UULwB04LPJ5trK3gSe4F7zI6hGaDgbnscCzceY2SJ7X3pnimHeiZix/1+64vO2IOM+MuygyagyqpCE9Ehxj26HSrv7oXMy47fplDjAsplNJqsP2nOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYWODiTtYOch6HfYrBMmvBJk+iOEDVwPN5IDcHkhyZo=;
 b=cu9ijXFFTJHzbZ0CtYSd6EcQ08NnWB9LJ/fz/a1ke56GDQnf7FwCxMzUH0m8wbJzzQoulwjQfHbC4ARfLUxdKMq6eQPay1AnL4HGhiQpzCtMBdzq4/taWLmHPl30PqClWZ7vS7aeauqxXfK+puQbWs/MMRStCfleJGt9OYbauoSX/iD7A+snhpAiMGuno5LK99ufPksn+ZQjlj3dKgAGDvpmB0GvL/TvNA3sOyrkHKGhBW6ufJVa5h2nVtlwMcKu2H6p9tkVeOx7gpcJcZDj6UCQoxclkikCXzwb6Qom3ROf9VI75jlNNfM2uATqocEMRnRem12q5bMUMApIGRLGQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYWODiTtYOch6HfYrBMmvBJk+iOEDVwPN5IDcHkhyZo=;
 b=m1jE29DxtW0xcEeuR3zjvD4w1z687ix9epiC95sSgHkVwppknnK2EQfXRtjr1sCDLzq1afd1UUUsfFtgVPeR/UfbWzUjCiOHSl+YxFl20/piHYmH/hQJ078bzBRClwzNbGwXPvtNIWfjZS7kRUmQQbVYtUWJ6I6GloTSlOeiQSg=
Received: from SJ0PR05CA0057.namprd05.prod.outlook.com (2603:10b6:a03:33f::32)
 by IA1PR12MB6530.namprd12.prod.outlook.com (2603:10b6:208:3a5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.11; Fri, 2 Feb
 2024 15:29:07 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::6c) by SJ0PR05CA0057.outlook.office365.com
 (2603:10b6:a03:33f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23 via Frontend
 Transport; Fri, 2 Feb 2024 15:29:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Fri, 2 Feb 2024 15:29:06 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 09:29:04 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Hamza Mahfooz <hamza.mahfooz@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Alex Hung
 <alex.hung@amd.com>, Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/amd/display: add panel_power_savings sysfs entry to
 eDP connectors
Date: Fri, 2 Feb 2024 10:28:35 -0500
Message-ID: <20240202152837.7388-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|IA1PR12MB6530:EE_
X-MS-Office365-Filtering-Correlation-Id: cd3d2c66-c5b6-4125-34da-08dc2403b1a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: giEeK6WV7aoaVlQdTY8uRCoqqFDWAb4ofjBxPbqKYh1PU8i4HDbp4PU8YlGzjLhsPH4Iy8UeGOZwn9wW4q2D1FIoIdMo37EdHqaCdEMF03HEKE2kxYj33imcQb7yCJx480bGXE/IFALPnjeYVNvVyodJLCLX1VL6IoudQ6nsTLeZWewqlJa0DcnN5At1loDBDebjV9e8UAU/iW0i03M+bDCrlk6EIATCbykfONTVdv2zXChKqlgFOfBIl4qWR1VIe+83efo4Ko12DkORsMcEwogJH54NWppqD1wHkqm7dwoO/uW52MPk5etlRUbpqBchWs2McRzAwR27sbCGZQAFq9iU5NKHEDAM+hpYJqEhHzXuix4kbTXog6dnsMyD3A7nojyHIXXQXrt8yC7s7d28SQMi5oO4U4Du43ujEhgKSZfU+NaQqJNQYolWt+U6MyzwgZF3PHuVIPOD8HHQdtB/9l4KRxtfnSUo+Wx58+RbYpo/NbHnjAJ4gOH7Oh603aPDsfAEu4XlnIda+uCtbYX99PS3GHVc1cB5UpL8R4MK3T//iti6zEWJ+75pjRvoCLZmelstBPCMxbwUN9T7l89/9SLHKD2wPH4gillAzUNhjzz15l0+eKR5tB0d3pbUU+F0471bCLK1wRQJ/FdQL0DPHfjQwVOxo419GMTtmzjVM994Ovs5jGV3KAFcLlSxiaLhL+L432wOyPLX8f/Ec0/k10S/P05VpdzBuX9rWfozycDrxGSNYwF0q2LEBY97an6mKldMzsZr9bf4taIgAr6F9Csus+T7b2/qsLJg+v0EkjknagUcbiRN/LJpmrUFqOdK
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(1800799012)(82310400011)(186009)(64100799003)(451199024)(46966006)(40470700004)(36840700001)(5660300002)(4326008)(8936002)(8676002)(40480700001)(40460700003)(54906003)(6916009)(316002)(70206006)(2906002)(70586007)(44832011)(36756003)(26005)(47076005)(478600001)(1076003)(2616005)(6666004)(83380400001)(82740400003)(426003)(356005)(336012)(81166007)(16526019)(36860700001)(86362001)(41300700001)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 15:29:06.2610 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3d2c66-c5b6-4125-34da-08dc2403b1a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6530
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

We want programs besides the compositor to be able to enable or disable
panel power saving features. However, since they are currently only
configurable through DRM properties, that isn't possible. So, to remedy
that issue introduce a new "panel_power_savings" sysfs attribute.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
v2: hide ABM_LEVEL_IMMEDIATE_DISABLE in the read case, force an atomic
    commit when setting the value, call sysfs_remove_group() in
    amdgpu_dm_connector_unregister() and add some documentation.
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 8590c9f1dda6..3c62489d03dc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6436,10 +6436,79 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
 	return ret;
 }
 
+/**
+ * DOC: panel power savings
+ *
+ * The display manager allows you to set your desired **panel power savings**
+ * level (between 0-4, with 0 representing off), e.g. using the following::
+ *
+ *   # echo 3 > /sys/class/drm/card0-eDP-1/amdgpu/panel_power_savings
+ *
+ * Modifying this value can have implications on color accuracy, so tread
+ * carefully.
+ */
+
+static ssize_t panel_power_savings_show(struct device *device,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct drm_connector *connector = dev_get_drvdata(device);
+	struct drm_device *dev = connector->dev;
+	u8 val;
+
+	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
+	val = to_dm_connector_state(connector->state)->abm_level ==
+		ABM_LEVEL_IMMEDIATE_DISABLE ? 0 :
+		to_dm_connector_state(connector->state)->abm_level;
+	drm_modeset_unlock(&dev->mode_config.connection_mutex);
+
+	return sysfs_emit(buf, "%u\n", val);
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
+	drm_kms_helper_hotplug_event(dev);
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
 static void amdgpu_dm_connector_unregister(struct drm_connector *connector)
 {
 	struct amdgpu_dm_connector *amdgpu_dm_connector = to_amdgpu_dm_connector(connector);
 
+	sysfs_remove_group(&connector->kdev->kobj, &amdgpu_group);
 	drm_dp_aux_unregister(&amdgpu_dm_connector->dm_dp_aux.aux);
 }
 
@@ -6541,6 +6610,13 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
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

