Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E65906362
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 07:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912F210E128;
	Thu, 13 Jun 2024 05:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ucDcYjpx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAA310E0BA;
 Thu, 13 Jun 2024 05:17:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9p8Dw+13AuTz9yHzSVMSR9SLFCouOg611j8iDv77tjwqmTS4Lza1avzbBY5LLtbKcv2uM0c1Iv4qujbjwYf2AxlNJ0LPSqgZ5WqYNxbWLUrIL0S6WFRQd506iqm7lF8mkpgiEi7qcLcoi8MC3tr/58t1pAJWw1eEs16b2fjkRKMB3HXIbhhSCxdcRA7ueiAG8fF3Grka9TV+qi2eLO/VOho8KZmpySdL2EKsXlff1VfsJuk1Gr4aZ6POss22UY6CW+Xrkx7dXot9lAWaiUrzOcmFkYDGAphQ8+oinWqBz3+KATI9/fL+8iSt6iH5AITJ7TGPGfsqnlGez3JRTZsEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMvm6nbDjNmwPXbvJXXXrdZ7TbNzOzfrmPbL6J4eS50=;
 b=gHXcErgxQ6XXlefEYeZceLmDR8PegNWTOUUJPmUhRwVxsqxB4OGm9UOaWABMU7z7AkKx+DAC9MBj5Y+jVaBwsp1o52duzvf3o2J877bRwOyhLhg4AG657WfLEwjFp9mE6On0KkGlGzRNHyx03Fw/w+a1xCnQEMI1VUJRtAMY24CRk28S3oBfNqk88/NcfKGs9vmaUUKFF3uRdkSfta+F5N7EmX5DtPwnDdLDVP0kg/bDn6cTt97MHz8ObasjabprON1Vdz5q8lFGMn3o9zo2OF6wG6aenibuYpyDxK293KjPNeR7uB2pGXRBxW97JKgJEritZH6s1ZdICxh93zh5VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMvm6nbDjNmwPXbvJXXXrdZ7TbNzOzfrmPbL6J4eS50=;
 b=ucDcYjpxBfyVZVzqLTPdy0xEisUDNFy15QYPjZ7xdz+BTx0/maVBqXdYcbGzX/xF1awSDkgJcEbuKHxVH31or12wi14B5XYWb40YkosHJPBPvMadT5QbLbLaS8v3+ZavfTD2fmuJC851mHIiC5qAD9SPOEM+JLM5HrkQSqSyozM=
Received: from BN8PR03CA0028.namprd03.prod.outlook.com (2603:10b6:408:94::41)
 by CH3PR12MB8581.namprd12.prod.outlook.com (2603:10b6:610:15d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 05:17:23 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:94:cafe::d0) by BN8PR03CA0028.outlook.office365.com
 (2603:10b6:408:94::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24 via Frontend
 Transport; Thu, 13 Jun 2024 05:17:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.0 via Frontend Transport; Thu, 13 Jun 2024 05:17:22 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Jun
 2024 00:17:20 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "open
 list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, open list
 <linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>, "Mario
 Limonciello" <mario.limonciello@amd.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Chris Bainbridge <chris.bainbridge@gmail.com>
Subject: [PATCH v3] drm/fb-helper: Detect when lid is closed during
 initialization
Date: Thu, 13 Jun 2024 00:17:00 -0500
Message-ID: <20240613051700.1112-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|CH3PR12MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: bd670ecc-8785-4625-64c7-08dc8b681b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230034|36860700007|7416008|376008|82310400020|1800799018; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kX/GgTHEUmWiWviSBysSUsnUQofdP3jtity8BXqmJ5X4vszLWYS0F7+UGuw4?=
 =?us-ascii?Q?oENZnsbNajgau2HL29fedZ7LyawAox0H4jlVW3LjYHrAM8FFtNCUOcFqd8Ei?=
 =?us-ascii?Q?mWA0mmGCc2slJqtnYUe2OJSt/ykj4Ux8+lAoCG6WNsWGe9IK60FxZ5eOfc5T?=
 =?us-ascii?Q?sKwZ01c5N6g0gLTCOlDuzD27XOU0zMPb+YX9HxQKqFm21FICWdhRH/ZMEELl?=
 =?us-ascii?Q?t2ubz5A5c9OCiKv5RiofQTvkEAh+cCsVL61jCxCNIp4RMJPpvL9EMErkqxfV?=
 =?us-ascii?Q?cxbMWhMqt5gYsEnE6iHbb5TMiFx74yq1ylHUGZ9zEK7tGylfssr+off6fMFC?=
 =?us-ascii?Q?Z4mKv3Dz8D7HH0vM5RErtEcrt1waABUiWkZAp7jou2Bc/c81PMAPmkjxkNiF?=
 =?us-ascii?Q?WmUvo6ur6YPBoMgCgQfop91JUH8lpOfStbYny5PxPWRyXZpCfOLmxI9GKnAY?=
 =?us-ascii?Q?qhS9rzyRJisff63ucM0aDfGeOmY+kGyk+CVzhNfXGbxf+C6uV/51k18qACRf?=
 =?us-ascii?Q?8+oNkQmCFuJTNR4itFTSYx94jnnQPw5SniDEys7uiAUFHFJeCFP0fnvr3t+J?=
 =?us-ascii?Q?rVMJEV+0tdsKPWEQoe0hWM+szHwYjmcA+dDgnXPvLMK+cYZCIfWn2d463q6m?=
 =?us-ascii?Q?5PI97tfzPMcGqau6se+Y2bjJJwx49dE2N6rhcaCV8Czctaj5mc+PrFjuMcg4?=
 =?us-ascii?Q?etj8cMhRkDLs/g4zla46l2iJPQlmNjZwWBw4YLxt2PSomKbsEZmxFf8XzWw7?=
 =?us-ascii?Q?lFF4nRj/SPaYEWEMXFKPhcYjTZcHpRSAmPeVTHWbPvMfKgWLg3TCzurMW44p?=
 =?us-ascii?Q?BDaWZOVwbe9ybUmSErBEYboba6NVffxuTBEuE21i4mSMt0NphOQgUc5d5+CA?=
 =?us-ascii?Q?W7ypj/SyjdcJSjg4Ox+bus16Bj9XhBxyja4Kb+TpzXVDSaNlm6Dwh1NjOJoI?=
 =?us-ascii?Q?Eh94Mg2eKlnNz11wg+P5jcXtbbIkZ8CeTAoCB/OJMmgHqrBXux7jFuqJam/2?=
 =?us-ascii?Q?SIIrrTr7sVvpGLioCJmwtih81jHycDN1Kcb5xKExwMbQO9X6hbRMPjEzAFbk?=
 =?us-ascii?Q?KWhJyRQI158WlZhtgxVtVkINVns924C6Pw5tD906EbTESRNHlOVj/w/RDwt2?=
 =?us-ascii?Q?04iFC+nYSmuwBudJUl+W0+ZLFg0aST8xKFbeZJL3YMjCFQmeg9VSQoGdCMEC?=
 =?us-ascii?Q?aTV+w0NZAJF1PBzRbF51TZxi7u5374+mZ6ND1K6Vk9n0p15I3eq+o8Y4CFAC?=
 =?us-ascii?Q?/uysY/f4BGIyrePkDJro08YQZ9/QO46tcWJyPJl5AL21Q5Gr7rQGlf8HuTy4?=
 =?us-ascii?Q?DHCPdJtKidQ3rukW0PxNpZxPVmtfs+pUtOkZ+94c8cLutXiCBulOtoIjEabD?=
 =?us-ascii?Q?z7lYa7Q=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230034)(36860700007)(7416008)(376008)(82310400020)(1800799018); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 05:17:22.4816 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd670ecc-8785-4625-64c7-08dc8b681b1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8581
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

If the lid on a laptop is closed when eDP connectors are populated
then it remains enabled when the initial framebuffer configuration
is built.

When creating the initial framebuffer configuration detect the
lid status and if it's closed disable any eDP connectors.

Also set up a workqueue to monitor for any future lid events.

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3349
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2->v3:
 * Use input device instead of ACPI device
 * Detect lid open/close events
---
 drivers/gpu/drm/drm_client_modeset.c |  29 ++++++
 drivers/gpu/drm/drm_fb_helper.c      | 132 +++++++++++++++++++++++++++
 include/drm/drm_device.h             |   6 ++
 include/drm/drm_fb_helper.h          |   2 +
 4 files changed, 169 insertions(+)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 31af5cf37a09..b8adfe87334b 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -257,6 +257,34 @@ static void drm_client_connectors_enabled(struct drm_connector **connectors,
 		enabled[i] = drm_connector_enabled(connectors[i], false);
 }
 
+static void drm_client_match_edp_lid(struct drm_device *dev,
+				     struct drm_connector **connectors,
+				     unsigned int connector_count,
+				     bool *enabled)
+{
+	int i;
+
+	for (i = 0; i < connector_count; i++) {
+		struct drm_connector *connector = connectors[i];
+
+		switch (connector->connector_type) {
+		case DRM_MODE_CONNECTOR_LVDS:
+		case DRM_MODE_CONNECTOR_eDP:
+			if (!enabled[i])
+				continue;
+			break;
+		default:
+			continue;
+		}
+
+		if (dev->lid_closed) {
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is closed, disabling\n",
+				    connector->base.id, connector->name);
+			enabled[i] = false;
+		}
+	}
+}
+
 static bool drm_client_target_cloned(struct drm_device *dev,
 				     struct drm_connector **connectors,
 				     unsigned int connector_count,
@@ -844,6 +872,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 		memset(crtcs, 0, connector_count * sizeof(*crtcs));
 		memset(offsets, 0, connector_count * sizeof(*offsets));
 
+		drm_client_match_edp_lid(dev, connectors, connector_count, enabled);
 		if (!drm_client_target_cloned(dev, connectors, connector_count, modes,
 					      offsets, enabled, width, height) &&
 		    !drm_client_target_preferred(dev, connectors, connector_count, modes,
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d612133e2cf7..41dd5887599a 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -30,6 +30,8 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/console.h>
+#include <linux/input.h>
+#include <linux/mod_devicetable.h>
 #include <linux/pci.h>
 #include <linux/sysrq.h>
 #include <linux/vga_switcheroo.h>
@@ -413,6 +415,128 @@ static void drm_fb_helper_damage_work(struct work_struct *work)
 	drm_fb_helper_fb_dirty(helper);
 }
 
+static void drm_fb_helper_lid_event(struct input_handle *handle, unsigned int type,
+				    unsigned int code, int value)
+{
+	if (type == EV_SW && code == SW_LID) {
+		struct drm_fb_helper *fb_helper = handle->handler->private;
+
+		if (value != fb_helper->dev->lid_closed) {
+			fb_helper->dev->lid_closed = value;
+			queue_work(fb_helper->input_wq, &fb_helper->lid_work);
+		}
+	}
+}
+
+struct drm_fb_lid {
+	struct input_handle handle;
+};
+
+static int drm_fb_helper_lid_connect(struct input_handler *handler,
+				     struct input_dev *dev,
+				     const struct input_device_id *id)
+{
+	struct drm_fb_helper *fb_helper = handler->private;
+	struct drm_fb_lid *lid;
+	char *name;
+	int error;
+
+	lid = kzalloc(sizeof(*lid), GFP_KERNEL);
+	if (!lid)
+		return -ENOMEM;
+
+	name = kasprintf(GFP_KERNEL, "drm-fb-helper-lid-%s", dev_name(&dev->dev));
+	if (!name) {
+		error = -ENOMEM;
+		goto err_free_lid;
+	}
+
+	lid->handle.dev = dev;
+	lid->handle.handler = handler;
+	lid->handle.name = name;
+	lid->handle.private = lid;
+
+	error = input_register_handle(&lid->handle);
+	if (error)
+		goto err_free_name;
+
+	error = input_open_device(&lid->handle);
+	if (error)
+		goto err_unregister_handle;
+
+	fb_helper->dev->lid_closed = dev->sw[SW_LID];
+	drm_dbg_kms(fb_helper->dev, "initial lid state is set to %d\n", fb_helper->dev->lid_closed);
+
+	return 0;
+
+err_unregister_handle:
+	input_unregister_handle(&lid->handle);
+err_free_name:
+	kfree(name);
+err_free_lid:
+	kfree(lid);
+	return error;
+}
+
+static void drm_fb_helper_lid_disconnect(struct input_handle *handle)
+{
+	struct drm_fb_lid *lid = handle->private;
+
+	input_close_device(handle);
+	input_unregister_handle(handle);
+
+	kfree(handle->name);
+	kfree(lid);
+}
+
+static const struct input_device_id drm_fb_helper_lid_ids[] = {
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT | INPUT_DEVICE_ID_MATCH_SWBIT,
+		.evbit = { BIT_MASK(EV_SW) },
+		.swbit = { [BIT_WORD(SW_LID)] = BIT_MASK(SW_LID) },
+	},
+	{ },
+};
+
+static struct input_handler drm_fb_helper_lid_handler = {
+	.event =	drm_fb_helper_lid_event,
+	.connect =	drm_fb_helper_lid_connect,
+	.disconnect =	drm_fb_helper_lid_disconnect,
+	.name =		"drm-fb-helper-lid",
+	.id_table =	drm_fb_helper_lid_ids,
+};
+
+static void drm_fb_helper_lid_work(struct work_struct *work)
+{
+	struct drm_fb_helper *fb_helper = container_of(work, struct drm_fb_helper,
+						       lid_work);
+	drm_fb_helper_hotplug_event(fb_helper);
+}
+
+static int drm_fb_helper_create_lid_handler(struct drm_fb_helper *fb_helper)
+{
+	int ret = 0;
+
+	if (fb_helper->deferred_setup)
+		return 0;
+
+	fb_helper->input_wq = create_singlethread_workqueue("drm-fb-lid");
+	if (fb_helper->input_wq == NULL)
+		return -ENOMEM;
+
+	drm_fb_helper_lid_handler.private = fb_helper;
+	ret = input_register_handler(&drm_fb_helper_lid_handler);
+	if (ret)
+		goto remove_wq;
+
+	return 0;
+
+remove_wq:
+	destroy_workqueue(fb_helper->input_wq);
+	fb_helper->input_wq = NULL;
+	return ret;
+}
+
 /**
  * drm_fb_helper_prepare - setup a drm_fb_helper structure
  * @dev: DRM device
@@ -445,6 +569,7 @@ void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
 	spin_lock_init(&helper->damage_lock);
 	INIT_WORK(&helper->resume_work, drm_fb_helper_resume_worker);
 	INIT_WORK(&helper->damage_work, drm_fb_helper_damage_work);
+	INIT_WORK(&helper->lid_work, drm_fb_helper_lid_work);
 	helper->damage_clip.x1 = helper->damage_clip.y1 = ~0;
 	mutex_init(&helper->lock);
 	helper->funcs = funcs;
@@ -593,6 +718,9 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 	if (!drm_fbdev_emulation)
 		return;
 
+	input_unregister_handler(&drm_fb_helper_lid_handler);
+	destroy_workqueue(fb_helper->input_wq);
+
 	cancel_work_sync(&fb_helper->resume_work);
 	cancel_work_sync(&fb_helper->damage_work);
 
@@ -1842,6 +1970,10 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
 	width = dev->mode_config.max_width;
 	height = dev->mode_config.max_height;
 
+	ret = drm_fb_helper_create_lid_handler(fb_helper);
+	if (ret)
+		return ret;
+
 	drm_client_modeset_probe(&fb_helper->client, width, height);
 	ret = drm_fb_helper_single_fb_probe(fb_helper);
 	if (ret < 0) {
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 63767cf24371..619af597784c 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -316,6 +316,12 @@ struct drm_device {
 	 * Root directory for debugfs files.
 	 */
 	struct dentry *debugfs_root;
+
+	/**
+	 * @lid_closed: Flag to tell the lid switch state
+	 */
+	bool lid_closed;
+
 };
 
 #endif
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 375737fd6c36..7fb36c10299d 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -143,6 +143,8 @@ struct drm_fb_helper {
 	spinlock_t damage_lock;
 	struct work_struct damage_work;
 	struct work_struct resume_work;
+	struct work_struct lid_work;
+	struct workqueue_struct *input_wq;
 
 	/**
 	 * @lock:
-- 
2.43.0

