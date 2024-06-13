Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D3090792B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1512B10EB3E;
	Thu, 13 Jun 2024 17:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="c3YWNBmd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A0E10EB0E;
 Thu, 13 Jun 2024 17:00:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7r1ZGMWBaXHuW4ShWDU7+QqcO1hjl1KU/TyuyH+9XKN3fM1Sp9kWU4noqw97jj/uRmOsVE8kXasd1c7ovvQOdt6tTPjCSbygm3uD8GJBBlQRqsA1CQKz6RNZuJZ6J7tPneuGDL61Rj0E2b9Lu5XtK/dPoAynq90cBSdEOj+2Apvr+Ws1+5/sX2XaLsAApXz3YzzuKJxxfajz/FzDAY3LHLgCpnUcQHBa8yOGA0bcTdDVFfqwmqSDLIeu/Cx+07p85F/Hrnbq+c5pPJ55sTyqccuTFfXFLY8UkHwSCkJWFiYtvY7QN4pbL+yOaMM8KCjHjxTcSPV9YWU8I6fYui2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DzgEROFQ3oyDqWVe1dvAPduxS6pFPwHavV5m2Oya5Q=;
 b=MaAUXTf0WZhM8eaohB2dVt1zzj7VmmRCqeoFTH+EZ7p8fvHoAIoTDYvwPMlsjEYYtqsCDjeR/zkQJGQwrkaNERIwp8BCuCkl6KJcAOcgvG1YHXzCNBiJRbqTg31asEGsIPeg4457qCFM6S5awNGNxmY6tNbaw435V5Nau5Bxxb4yJDtO7dU/o5bPfVIEIc19O+eXjEwg+vKIHWmfMDNMNHaI8hWrWshXze39Tbj5ALsS2wRrENrtjPuD3uxePVNhXVLD3bFj0espeMwsNz4uhyxZB9bZ4ZyBhDJ6VYBn7hG/jiaCFOBXLBq8wpfrplTJDcT3iYq6fai9C9Cf4YLsqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DzgEROFQ3oyDqWVe1dvAPduxS6pFPwHavV5m2Oya5Q=;
 b=c3YWNBmd3sjvWuqwYRnD8N5a/RKnkAxmOtGMeRw/7K87tLV98ZbuM1Bey5gg2pp+A2dXE5WPcymJumrS3IK+vkbojK+/YPhIS4YPfkbi7PBXmGbmEjo9gOsmR/QSlR0VzDq/Ge1wsfdh+8KaRA4+tm/s15u9L2692wMC/aArK7J495r119o5SKRF+6wDytOSNHWuRjsZV9u5bofwu/jmUSMcNvXVTtlqMXoH6Fju0/k7VWAV0AlIlrV1fHvC/JIkOmf9VzPiT0e7SP5E47gDrDOuazhF+OH3JWgaNry6KBqboo7jMONslYTr9xctsQ/+LOYPvudA2S9eNYrbXX+Lpg==
Received: from SJ0PR05CA0018.namprd05.prod.outlook.com (2603:10b6:a03:33b::23)
 by SA1PR12MB6726.namprd12.prod.outlook.com (2603:10b6:806:255::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 16:59:58 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::c3) by SJ0PR05CA0018.outlook.office365.com
 (2603:10b6:a03:33b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24 via Frontend
 Transport; Thu, 13 Jun 2024 16:59:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 16:59:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:44 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:42 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 05/21] drm/nouveau/nvif: add nvif_driver_func for nvkm->drm
 callbacks
Date: Fri, 14 Jun 2024 02:59:57 +1000
Message-ID: <20240613170046.88687-6-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240613170046.88687-1-bskeggs@nvidia.com>
References: <20240613170046.88687-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|SA1PR12MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: f2007161-f220-4566-1ffc-08dc8bca420c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mE5eIUHJpaAEEBUvMZyP1aVGq+YCEEPcZK+dB0FQ6A/R29ju+tWWY8tskq/r?=
 =?us-ascii?Q?S+9uKJnQAuZ/VP2GmcMo2AyngADXDXMtCQ7U6if5RRcPVq6iMxeViLae2hk3?=
 =?us-ascii?Q?6dqCwPZ1DNnxnolQOZ+YBADN3Ero4XKSSvmVooacNUzNYYqCgbpJjGMd+4mZ?=
 =?us-ascii?Q?3l15bFC4KlbJSCivmW6e4pF11ecHAfeAxP4WMu8+BVh3+4G3DGyIoS/EGFpZ?=
 =?us-ascii?Q?IxkklzPyTQsooJuqXawkG7u3QHjqNn4+BYlRJ7sY/mmg9E4be/YTmXXFi5ru?=
 =?us-ascii?Q?0MxTuyo0qjBSAwOftq214mgI8oaq27Zz1+1dHKGRMY//xE3g3zjKhAg6V883?=
 =?us-ascii?Q?kP5Dys/HUr7Pf+jZBsX6bVub74bBVHS1wM18w/QjQ5XYhM6lgcjPT4uWHS/y?=
 =?us-ascii?Q?vqCWWCpO7K9zsrXaaEB1Df1Wlow0b43qMZDdAGBKZS/J48DZDjed3GN35tFq?=
 =?us-ascii?Q?B8v7827zscT4muum4760tdZTuzMd0HHJCaQi71eraTeONUvigqqKGaqKoJRI?=
 =?us-ascii?Q?9tpDjAEngWz9myVejeq7ASE2663TxU2j9Ock46YH78n6j9xhmvmEgcXGL87t?=
 =?us-ascii?Q?dzctqRcsqknm6gLT0l/vRkbVZCsaJ7PdGuZuNNrPnOhuDKCZ4aJj9SAoXiNO?=
 =?us-ascii?Q?e1u9UkycDTia0/DTOX1xf1+SzMefE8nBFsE4Mn8dubJoLASgCAPHLu80bQQ8?=
 =?us-ascii?Q?48ZhA7Q0GUfhcRhkEBEG4zGbf4Ot6M2U96b2AlyKriNBcrqDBTvquPJ44JlM?=
 =?us-ascii?Q?1THILGi0AZHuF8VhOgkF3dKqyafwazif1dUBrtLypJMG42ALncpAykEloo12?=
 =?us-ascii?Q?JuUn0MMJkrxit8MCvUKjbM11CS+6Loa3hZedWnyqQO4p18kne+gswRU/W5DX?=
 =?us-ascii?Q?VpwChFMTegdknZCme/ydoA/jSLGY81j1q4xDYq9fymU07GLnWM2QVk3X3fSL?=
 =?us-ascii?Q?Jb3JBmVZxU7BNTfJEZIW+w38smAYdVHVtWt5JtuVwPIpjUvPGOswYPYe596w?=
 =?us-ascii?Q?vaVFmnOEsY99zfDyKgFDk+Ry6vz1/7pbWHWB0FRpp1d+LZhTFvoLrOg9S+bf?=
 =?us-ascii?Q?qQxCy8psmeWH06+3bKE9ZYtW4mm8Bdox1AUShxvNLHt/q5FJBeAlJO92ch48?=
 =?us-ascii?Q?TpBE7bPtHARbUHrajbMeL2/9J0hfW2Iakxujj7CXej6DIN4xQOoXtbpCST1S?=
 =?us-ascii?Q?gVMbX5RrgoJPYkkxoS2sj1hP+84r1nBg30e+EoeEbB4OUNDHLUf5naimgvWZ?=
 =?us-ascii?Q?QA2oiDJPE+rdKs1J4qNbpMIwNIFuBV/VUYt1jixHJW6qIVLr5r8MV+sZ9VI8?=
 =?us-ascii?Q?5fA5j464t5qeliMZvg+jmiIe/eOiENGnzIEsEloENSgCcsN5LuwQwSf/Igg6?=
 =?us-ascii?Q?GR8/JoXC4/oC+gAxIYADcWuPwg186HvzBc/f34OV5dtScpXXzw=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 16:59:58.7200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2007161-f220-4566-1ffc-08dc8bca420c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6726
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

A later patch in this series will move the code that binds to a PCI/
Tegra device into NVKM, and requires a couple of callbacks to handle
switcheroo, etc.

nvif_event is generally used for NVKM->DRM callbacks, but these will
need to be registered before nvif_event is ready.

This patch replaces the event() function pointer that was passed to
nvkm_driver_ctor() during init with a nvif_driver_func struct, that
contains the existing event() callback.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/driverif.h    |  4 ++++
 drivers/gpu/drm/nouveau/include/nvif/event.h       |  2 ++
 drivers/gpu/drm/nouveau/include/nvkm/core/client.h |  3 +--
 drivers/gpu/drm/nouveau/include/nvkm/core/device.h |  2 ++
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  7 +++++++
 drivers/gpu/drm/nouveau/nouveau_drv.h              |  1 +
 drivers/gpu/drm/nouveau/nvif/event.c               |  9 +++++++++
 drivers/gpu/drm/nouveau/nvkm/core/client.c         | 13 +++++++++----
 drivers/gpu/drm/nouveau/nvkm/core/driver.c         | 14 +-------------
 9 files changed, 36 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 0476dd6621b5..638c72c1b580 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -34,6 +34,10 @@ struct nvif_event_impl {
 	int (*block)(struct nvif_event_priv *);
 };
 
+struct nvif_driver_func {
+	enum nvif_event_stat (*event)(u64 token, void *repv, u32 repc);
+};
+
 struct nvif_driver {
 	const char *name;
 	int (*suspend)(struct nvif_client_priv *);
diff --git a/drivers/gpu/drm/nouveau/include/nvif/event.h b/drivers/gpu/drm/nouveau/include/nvif/event.h
index 6c52de0e17d0..ce14e478b1fe 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/event.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/event.h
@@ -5,6 +5,8 @@
 #include <nvif/driverif.h>
 struct nvif_event;
 
+enum nvif_event_stat nvif_event(u64 token, void *repv, u32 repc);
+
 typedef enum nvif_event_stat (*nvif_event_func)(struct nvif_event *, void *repv, u32 repc);
 
 struct nvif_event {
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h b/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
index 5c9a54d4bd64..4e5d56056b81 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
@@ -14,10 +14,9 @@ struct nvkm_client {
 	spinlock_t obj_lock;
 
 	void *data;
-	int (*event)(u64 token, void *argv, u32 argc);
 };
 
-int nvkm_client_new(const char *name, struct nvkm_device *, int (*event)(u64, void *, u32),
+int nvkm_client_new(const char *name, struct nvkm_device *,
 		    const struct nvif_client_impl **, struct nvif_client_priv **);
 int nvkm_client_event(struct nvkm_client *client, u64 token, void *repv, u32 repc);
 
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
index fff0d7dd0e1b..c9965934b0d5 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
@@ -71,6 +71,8 @@ struct nvkm_device {
 		bool armed;
 		bool legacy_done;
 	} intr;
+
+	const struct nvif_driver_func *driver;
 };
 
 struct nvkm_subdev *nvkm_device_subdev(struct nvkm_device *, int type, int inst);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 18990d21dc48..09947790f677 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -614,6 +614,11 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
 	return ret;
 }
 
+static const struct nvif_driver_func
+nouveau_driver = {
+	.event = nvif_event,
+};
+
 static void
 nouveau_drm_device_del(struct nouveau_drm *drm)
 {
@@ -643,9 +648,11 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 		return ERR_PTR(-ENOMEM);
 
 	drm->nvkm = device;
+	drm->driver = nouveau_driver;
 
 	device->cfgopt = nouveau_config;
 	device->dbgopt = nouveau_debug;
+	device->driver = &drm->driver;
 
 	nvif_parent_ctor(&nouveau_parent, &drm->parent);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 832651fe9f42..52589d5eab63 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -202,6 +202,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
 
 struct nouveau_drm {
 	struct nvkm_device *nvkm;
+	struct nvif_driver_func driver;
 	struct nvif_parent parent;
 	struct nvif_client client;
 	struct nvif_device device;
diff --git a/drivers/gpu/drm/nouveau/nvif/event.c b/drivers/gpu/drm/nouveau/nvif/event.c
index 2974ec8e13af..816e3d1bedb4 100644
--- a/drivers/gpu/drm/nouveau/nvif/event.c
+++ b/drivers/gpu/drm/nouveau/nvif/event.c
@@ -23,6 +23,15 @@
 #include <nvif/driverif.h>
 #include <nvif/printf.h>
 
+enum nvif_event_stat
+nvif_event(u64 token, void *repv, u32 repc)
+{
+	struct nvif_object *object = (void *)(unsigned long)token;
+	struct nvif_event *event = container_of(object, typeof(*event), object);
+
+	return event->func(event, repv, repc);
+}
+
 int
 nvif_event_block(struct nvif_event *event)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
index beb966d65daf..b767d77ad205 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -23,6 +23,7 @@
  */
 #include <core/client.h>
 #include <core/device.h>
+#include <core/event.h>
 #include <core/option.h>
 #include <device/user.h>
 
@@ -34,7 +35,12 @@
 int
 nvkm_client_event(struct nvkm_client *client, u64 token, void *repv, u32 repc)
 {
-	return client->event(token, repv, repc);
+	enum nvif_event_stat stat = client->device->driver->event(token, repv, repc);
+
+	if (stat == NVIF_EVENT_KEEP)
+		return NVKM_EVENT_KEEP;
+
+	return NVKM_EVENT_DROP;
 }
 
 static int
@@ -59,7 +65,7 @@ nvkm_client_new_client(struct nvif_client_priv *parent,
 	struct nvkm_client *client;
 	int ret;
 
-	ret = nvkm_client_new("client", parent->device, parent->event, pimpl, &client);
+	ret = nvkm_client_new("client", parent->device, pimpl, &client);
 	if (ret)
 		return ret;
 
@@ -96,7 +102,7 @@ nvkm_client = {
 };
 
 int
-nvkm_client_new(const char *name, struct nvkm_device *device, int (*event)(u64, void *, u32),
+nvkm_client_new(const char *name, struct nvkm_device *device,
 		const struct nvif_client_impl **pimpl, struct nvif_client_priv **ppriv)
 {
 	struct nvkm_oclass oclass = {};
@@ -112,7 +118,6 @@ nvkm_client_new(const char *name, struct nvkm_device *device, int (*event)(u64,
 	client->device = device;
 	client->debug = NV_DBG_ERROR;
 	spin_lock_init(&client->obj_lock);
-	client->event = event;
 
 	*pimpl = &nvkm_client_impl;
 	*ppriv = client;
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/driver.c b/drivers/gpu/drm/nouveau/nvkm/core/driver.c
index 86ada3c888ec..dcc5dc7f246e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/driver.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/driver.c
@@ -56,18 +56,6 @@ nvkm_driver_suspend(struct nvif_client_priv *client)
 	return nvkm_object_fini(&client->object, true);
 }
 
-static int
-nvkm_driver_event(u64 token, void *repv, u32 repc)
-{
-	struct nvif_object *object = (void *)(unsigned long)token;
-	struct nvif_event *event = container_of(object, typeof(*event), object);
-
-	if (event->func(event, repv, repc) == NVIF_EVENT_KEEP)
-		return NVKM_EVENT_KEEP;
-
-	return NVKM_EVENT_DROP;
-}
-
 static const struct nvif_driver
 nvkm_driver = {
 	.name = "nvkm",
@@ -83,7 +71,7 @@ nvkm_driver_ctor(struct nvkm_device *device, const struct nvif_driver **pdrv,
 {
 	int ret;
 
-	ret = nvkm_client_new("driver", device, nvkm_driver_event, pimpl, ppriv);
+	ret = nvkm_client_new("driver", device, pimpl, ppriv);
 	if (ret)
 		return ret;
 
-- 
2.44.0

