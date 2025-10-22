Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90564BFCF91
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 17:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B18310E7F1;
	Wed, 22 Oct 2025 15:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JsvqzHlx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011019.outbound.protection.outlook.com [40.107.208.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D49310E160;
 Wed, 22 Oct 2025 15:51:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MT40qbJuRcxfY3Xg5CY8LUIiXvJ4t07bw0qhSWsGSinoIL7H7TytfP1/RwUqz8f5EFsSARyh+mNpKHyYYamFuae0nB2AeZIxvzoudWnFOMPTsMefpX7nhG3qbH7V083I7AnPPYtJNJo75Kwmvru+PJwkNeoHYEc69pjgZpNQJrAiiMyb0+oymb7nOdxzFkV/ZGMs6P3lW6TPltsQ9UUOkoUYS6Tx+enmKeeOmO3Ah2FWU1qccGKEzHWS2R5VmevaIErwogFawcN5LvSeO522ri6/YEkLxN5StF0G3u9KaHVLaRLiGF9Dw67Vz5oPTJAJ7xYrQB4cnkoVIv1yDh/Cjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=folauus07E91+MCFYnaFpaMceNlnsHr4HGUJd+0cT44=;
 b=zCcoJxL0B/7LYR+HsOk/y8DCJKddlrbKV+N5VIzWXKL6DtllKAwSTcc5gMps2+kQwEFXe3AZ2+FdHj2JGZrSn++8JWnG8qK4TK0pczPARS2dKFALCtJ2vhcTNcY59tzugfISUpi6bXYFpUimkUZaMwTww7qzI2t+1RuAbvCHCR3/JvxB6sYkT2mH5LskJaZzXXq+AhkwFaG65mjQGKPZdhU++NV9M8S44u7rLmcur29MCM/W9Qe3wcLX6O4R0537jGRn/zUdoo30Bm6B8tfS0Bo1snpu/dg02jwZ3UCXeCORYlyv2h+kIiDaeHHTmaG0u7LsNiHOyZQkQH2IFPOlBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=folauus07E91+MCFYnaFpaMceNlnsHr4HGUJd+0cT44=;
 b=JsvqzHlxk4lSWm9y1v/bDzwMhybctZWJGWjPnhH9ypMyhqq2UtQP7LqqT34Cwe1RkyaCsVOK57EfnHUPw8PTis5WqJEfgsF6hP4j0Mb5ZsjxgDt/P+hfrOZW+JDm+QUnI9k1A9ZOhUh2VpGL/yMQnmXqk5O3no/yX26y2sWB3SU=
Received: from BN9PR03CA0903.namprd03.prod.outlook.com (2603:10b6:408:107::8)
 by MW5PR12MB5650.namprd12.prod.outlook.com (2603:10b6:303:19e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 15:51:46 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:107:cafe::65) by BN9PR03CA0903.outlook.office365.com
 (2603:10b6:408:107::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Wed,
 22 Oct 2025 15:51:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.0 via Frontend Transport; Wed, 22 Oct 2025 15:51:45 +0000
Received: from dogwood-dvt-marlim.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 22 Oct 2025 08:51:41 -0700
From: Mario Limonciello <mario.limonciello@amd.com>
To: <mario.limonciello@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <airlied@gmail.com>, 
 <simona@ffwll.ch>
CC: "Mario Limonciello (AMD)" <superm1@kernel.org>, Muhammad Usama Anjum
 <usama.anjum@collabora.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd: Manage frozen state internally
Date: Wed, 22 Oct 2025 10:50:29 -0500
Message-ID: <20251022155114.48418-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022155114.48418-1-mario.limonciello@amd.com>
References: <20251022155114.48418-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|MW5PR12MB5650:EE_
X-MS-Office365-Filtering-Correlation-Id: d5a39a7f-f34a-4144-aeb5-08de1182e777
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?38qE1Th59xHqImNd3H+4e80LPN2DLRnq7XAe4dUUK60wztVSL69GJyjsZzNQ?=
 =?us-ascii?Q?s/hDJ6Js90r7vvSxbvk9xHZuWzOKsWmU40NXUN+kGBbcIWAk1iN9AD+psGTG?=
 =?us-ascii?Q?tfhz8Mo8I1jtJpvCu8ruSAmGdmROWoAOgnXg5+vjPTTW3FTCd6cSYxDz6U23?=
 =?us-ascii?Q?DVGbv/a8UVFzXlOoUWkLClNLZOPTZVzXExlXCyCPMH887jnwj55A8B04k8Oz?=
 =?us-ascii?Q?xx0PbRea0EhYNvc0TACpzkLGVkro/+1SMkts/CSfgRGcHTOmLgF71lqMUYXR?=
 =?us-ascii?Q?eGLfrONGTQ4mHx362VIHDNtQDyIzW6cwdHgJGEgq3QIxxP7o3DCmKgP80tPw?=
 =?us-ascii?Q?wQhE6BTUCahZk/hVSePBUFHPp0wJdfH8Sbdsf80sIC3YnIZ9vnu9gCpIkm1v?=
 =?us-ascii?Q?rtz76FeX6J+kAmyKdQ6GI9PsIOyzuV2aeuvORxc/OUUCpvCClrG3lxOeCycZ?=
 =?us-ascii?Q?XdwQrgk4Dcr3iR29yDGLz97u5FI3s4V8kdL/E6GBlQeGf51QWuNFXbQwgPXj?=
 =?us-ascii?Q?oCqBy2bMEkcVa6PtfcPjKWzSULEcEuupClJCJ7ibMPhEMbifss/6bEB/OLZU?=
 =?us-ascii?Q?kXy5KBKhKHx1eQNXc6mPmXnn0kqAkwDI/ZR7oldawIIIMbybtU05wBX0qMjY?=
 =?us-ascii?Q?rcpcO14hB75pBrXIjxfArOuAxT/AOzGq2HT6JUDQlpi6nko6aTSaRzyvkXuo?=
 =?us-ascii?Q?0ONFv9PKUj0C6i8IegGQLkGQ5zmu2zEogYmSQqm86CBaWRsN+OraHLRiNVeZ?=
 =?us-ascii?Q?08onqd4qT0J6t3vrZCXmuPgvmyvWCioU2Gudrzg0m6BjjYo3a5Y25YBk5A2A?=
 =?us-ascii?Q?3pNwUDdskHZr7ToSOI/A8YsWCdM3z507pO3NGhsBUQIQGCDoD0xCuZK/zmel?=
 =?us-ascii?Q?VPppi7Hk3NHzHc22jgWFFeyIEGD7ueyw2G9tcxZvIerxvkv2QaTNFXaY1l5K?=
 =?us-ascii?Q?As2ChCEL5twn2QTHP7WfoSKWPi6MRY3dQdZy4PkNGiTQLUnUSBkXfaz1+t2+?=
 =?us-ascii?Q?D/QrvY4gAoKSZA3gKbv4nAqPAEUsUwJI2NmOBuvXCeAthf8gUu2+Wf2bE3YF?=
 =?us-ascii?Q?hD/j6GV1kjOVqucIk5ypJ8HEAz2zfZ6FrP+/swcMKPcY+dEUCQtyx5VSL7VV?=
 =?us-ascii?Q?NtapfzAK4cjJwTWbUqpPEucS9pG7mvzPPArlX5tbukVZ400N2hArfz5JFljn?=
 =?us-ascii?Q?0AGMj8xHAxMi+pU+L1B102Kmyl4fSPJI4Nsuzq9G7SqsOK7L3kkmm5MtvGl/?=
 =?us-ascii?Q?zfzgkpsRSy2I8Eh6HRHJPbF1FcCOHYqUPLowmT4VyiTn3+43RWmNTLadMXhL?=
 =?us-ascii?Q?lPIJiLAHJW07m8FMpfVDqn+AahFFM9m+M+yzYD7hGDVDfFgNpicG+yNHO8Js?=
 =?us-ascii?Q?mTgfTMQANH6WS2ngA5v74uOlCrhNQN4fYddommeWgTu4zKLxLUo+LtguieTY?=
 =?us-ascii?Q?bsd6r0NwJ0U/qmbdJTdxXpPrmL8Sabdb1LmXMhzpmz1NmSCKeNdDIUbIuI1n?=
 =?us-ascii?Q?7Po+Dx0Cs0K7cfc/Jd2d4L+He9CszhAIivn6?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 15:51:45.9568 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a39a7f-f34a-4144-aeb5-08de1182e777
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5650
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

From: "Mario Limonciello (AMD)" <superm1@kernel.org>

[Why]
On a normal hibernate sequence amdgpu will skip the thaw step due to
commit 530694f54dd5e ("drm/amdgpu: do not resume device in thaw for
normal hibernation").

If the hibernate sequence has been aborted however after this thawed
step runs the PM core will think the device is suspended and will skip
the restore() sequence for amdgpu.  This leads to accessing the device
while in a low power state and will freeze the system.

[How]
Set `dev->power.is_frozen` to indicate to the PM core that an error
code will be returned for thaw() callback because driver managed the
frozen state.  If the restore() callback is called by the PM core the
driver will resume the device.

Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 ++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 3d032c4e2dce..693347eb6861 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5247,6 +5247,11 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
 	if (r)
 		return r;
 
+#ifdef CONFIG_HIBERNATE_CALLBACKS
+	if (adev->in_s4)
+		dev->dev->power.is_frozen = 1;
+#endif
+
 	return 0;
 }
 
@@ -5385,6 +5390,11 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
 	if (amdgpu_acpi_smart_shift_update(adev, AMDGPU_SS_DEV_D0))
 		dev_warn(adev->dev, "smart shift update failed\n");
 
+#ifdef CONFIG_HIBERNATE_CALLBACKS
+	if (adev->in_s4)
+		dev->dev->power.is_frozen = 0;
+#endif
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 61268aa82df4..d40af069f24d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2681,7 +2681,7 @@ static int amdgpu_pmops_thaw(struct device *dev)
 
 	/* do not resume device if it's normal hibernation */
 	if (!pm_hibernate_is_recovering() && !pm_hibernation_mode_is_suspend())
-		return 0;
+		return -EBUSY;
 
 	return amdgpu_device_resume(drm_dev, true);
 }
-- 
2.51.0

