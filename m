Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FF9907902
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1ACF10EB02;
	Thu, 13 Jun 2024 17:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GT0kTLkc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BD910EB01;
 Thu, 13 Jun 2024 16:59:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDY+wOfMk6JxhOlaDGFCbe31sgrDukQwVdmAOqPHC9mfjKgLO2U+1AvNy+bEZmVrd/WwH+TYmcvvTiOBHoqvN3LI47Ady+M/CYxphluSGVkdgELv6c2mbkZpaly6uPuNYm1KEtkfqqIHSpjKuwLPXRtZYr6NYmHlSpScZgj/E0ge15ptMUrzNwYKxIl2Id1Ep+DpqCd6lAG1IoXnYeabZLfFP4C7M1ivV20bOJBBVFSsP5riT8ssnBdbfH8Go4kEAdXGFhgjvfEONLMK96LBLTLSrL+yYOzzPtrfvQjkVBzy8tbIfO4whPavR5FDU1VikQlWQTIBGjCUdx7c4EYJjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTuLLUy31K65op6xGQ22GuSGw/42gslJTpRqQVTJhsE=;
 b=epWJcG+wNDDKJvDvhf/Jlc0c0mmNiRvB3mhYL6RZFOlIubBRSzzICJ6V/9b3SsEsRXY6qtbWMf6XFbpe0SNz9NEmdTaw8eI4hoewlMKFACFmMMS/EKel0BQifWxYVfKgXcRzSvTbiPLeahaZkHM1wwm0tiJftvBrvGwIbcmXr3aHsJKnw+4J1w+fRpjjXj508NO5LpwYcKek7wBQ/WgD9+LgtODGfhU1P4Z2NHsBA8YV4YYpAcpimzB0tNwdeJgBnSBTORg5HUo6LtcG93wGEPFP2YHDBKuwxqWXVs6JdDk/hTkZU1SCPuwQqZmQYph2fxQYGZfRet+7uOOck0SjuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTuLLUy31K65op6xGQ22GuSGw/42gslJTpRqQVTJhsE=;
 b=GT0kTLkcaFv649NdJjMq9kB/I209TUm+LWHaPPGq4H/2kuxzLcGsiI5U4FlRqWuvGuD1Vsg9okDGkqENARefSKnEblxZTNdUIxEFveecmhscY1ZrIDStC9K46wf8xtOMfdJ8as/GpLWjh4FskCIVD7WQrcvJs2A7hgCYbugFHVrlqpD8dju0UXOjst4tYzKyDyY/Q27Zfi0gvbJWCmiw5MqDn1kFNSd58VEHHUmgNL8WPSIQ3Y2f82WYpip4e9aSk2Tf4cEp8e3eJcEZsa1x7H4R88hBZwAZezpXawTzfrSd2oigjydqbvnDG/6OOqMjNUaQIftqFZKi+J/7TWlhHw==
Received: from SA9PR10CA0030.namprd10.prod.outlook.com (2603:10b6:806:a7::35)
 by IA0PR12MB8255.namprd12.prod.outlook.com (2603:10b6:208:404::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 16:59:53 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:806:a7:cafe::e6) by SA9PR10CA0030.outlook.office365.com
 (2603:10b6:806:a7::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24 via Frontend
 Transport; Thu, 13 Jun 2024 16:59:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 16:59:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:39 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:37 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 02/21] drm/nouveau/nvkm: delay calling subdev ctor()'s until
 device oneinit()
Date: Fri, 14 Jun 2024 02:59:54 +1000
Message-ID: <20240613170046.88687-3-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|IA0PR12MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d0148a0-a659-4b5f-d642-08dc8bca3ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bWqoigDr9ccWpDZkFZ5IvlaOT7rqnHVl1QDYFlvxJmHRfzy6VYLzOQBkPYj9?=
 =?us-ascii?Q?cSQwZl14hoICGzhkKdps/XP6Km7kpaP/ZOIDq6apTS2MDBLXY4bNRr4xcVPK?=
 =?us-ascii?Q?jj+BPzOXOYaCjmdS8+OBZIi1DUa0URj4lOvwcbUUuM87AUy9e2WsepzU5DMq?=
 =?us-ascii?Q?w8fb/EWZTw1lcnQKInBNentCh1bgFyDEpWou/87QiQUj9llN/XUK/Nu2bTrr?=
 =?us-ascii?Q?6QfWjBO4BwsuAJEm3nFyH8Y7F2subgH2+3Q1FPgpADSGcpLTjCUuFKDx2MXv?=
 =?us-ascii?Q?9IbQy1l/f3n+OGFocpVvMbNXqAjuSrK7DN8Q9g0PIoyx7yUq+xdtX7OowRCt?=
 =?us-ascii?Q?5MjpbPW88JxMMB1gJ+Cj2esfV7Lgu8FS1J2O6Vs8hlSWZH3P/qZxkn0ZpP5Q?=
 =?us-ascii?Q?E5nSQX7pNuPEZhyhs2KEPGiFYPwGMphyIboSrE2KeXDMN5/dGIeYVLa/yf6F?=
 =?us-ascii?Q?pFE4tZC9C5a4eVCaU4gk7bzQlIbLN+bLw+MUnzvAo5p+YHa1jAOeU2J5dfly?=
 =?us-ascii?Q?3X2+CVG/qDmgMcnyLQJrm5/SUMpYuYNMw4S26VsuVhcnOumdhplDHpQ/2aBh?=
 =?us-ascii?Q?KgA+ituHwMLbT5aH4O7N1dVNfmdmyJICNMBnDYtl1YZ1EuwepHQn0LfTEUOX?=
 =?us-ascii?Q?zWaeRibzkmLX4hTrPpLZxPRUZQ1jDioIz9ro6IAA+Kya0JMgycLYxY64SwAq?=
 =?us-ascii?Q?BmN0aShiOZUlKRH9iM0aSY/4NqNlL97JnuMDt9uosfuTbrvaKHUh7lLTOV8v?=
 =?us-ascii?Q?TdF7RekRwep+2fxB6OzInDYSCvjvDWrefU+tNfCdok5IxJaRecfbO9QjNY40?=
 =?us-ascii?Q?VxYQxyS+4aoBPceZauHtoXXp3lWz+Jxz908wndyc+IqCRInG8Vsgzy5BtnrW?=
 =?us-ascii?Q?vUTHtNTIeGti+HuNA5Wxd0HO9ONM5FYjUHMJB7BbPax57mYtMh6tM7YIcGn7?=
 =?us-ascii?Q?NQyMK5wO//ATZM7E17rwjamO2iKHxwJ0z+18rPzoiX2LglfiMviik92PH7Mv?=
 =?us-ascii?Q?LfbKfBi1HHiU3yVuhCmE2e8XKVBzA0dch3aaColEdc3RJAJbyVWg/lL+ShSb?=
 =?us-ascii?Q?Imau16Ds5sku8rdr3hW4pGtxYeW8Xm5lhvCnIUKGfxwQ5+i+GB3YhWwQz1hn?=
 =?us-ascii?Q?uwU2FFnfbDrHLgCqRahuWc6Bp2Rxwqhx/HHnNJR+sqICll2SKHQa8eR4EWjn?=
 =?us-ascii?Q?CS/KS+V6u32R09TF6zwV8FttUsg+D5Ew/HilL7w8nbE30/SYA92EA5riFk6K?=
 =?us-ascii?Q?+Kqb/rrLt1YgwQWzbV/YQB+9aVc/NiKxXP84+ZLnsISsYHwRdzQX+YRHHDpn?=
 =?us-ascii?Q?O0nF+BVr8dEFfhI+HTrADVflfUnwg+WNtggUbfz/oORe3PIAxhGXV4mMNixQ?=
 =?us-ascii?Q?81g1sT1jwOIe2Keic3pkyEdMW6qjR/+7McqbRSB1tXxwyHYvBg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 16:59:53.3266 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0148a0-a659-4b5f-d642-08dc8bca3ee5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8255
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

A later patch in the series converts nvkm_device_{pci_tegra}_new into
PCI/platform device probe functions, as a step towards moving all the
PCI/Tegra-specific handling into NVKM.

nouveau.ko has two module options (nouveau.config/nouveau.debug) that
affect the behaviour of NVKM, however, and the probe() functions will
not have access to these, which would break a user's configuration if
they depend on any of the options to workaround a problem, etc.

To avoid this, we delay calling constructors for each subdev (which
could depend on module parameters) until allocation of the first
nvif_device, which will allow the DRM driver a chance to override
device.{cfg,dbg}opt before they're needed.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c       |   3 +
 drivers/gpu/drm/nouveau/nvkm/device/base.c  | 112 ++++++++++++--------
 drivers/gpu/drm/nouveau/nvkm/device/pci.c   |   2 +-
 drivers/gpu/drm/nouveau/nvkm/device/priv.h  |   3 +-
 drivers/gpu/drm/nouveau/nvkm/device/tegra.c |   2 +-
 5 files changed, 71 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 965331e65fda..18990d21dc48 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -644,6 +644,9 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 
 	drm->nvkm = device;
 
+	device->cfgopt = nouveau_config;
+	device->dbgopt = nouveau_debug;
+
 	nvif_parent_ctor(&nouveau_parent, &drm->parent);
 
 	ret = nvkm_driver_ctor(device, &driver, &impl, &priv);
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/base.c b/drivers/gpu/drm/nouveau/nvkm/device/base.c
index 20609571793e..1b76c2a60799 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/base.c
@@ -2908,6 +2908,62 @@ nvkm_device_preinit(struct nvkm_device *device)
 	return ret;
 }
 
+static int
+nvkm_device_oneinit(struct nvkm_device *device)
+{
+	struct nvkm_subdev *subdev, *subtmp;
+	int ret, j;
+
+#define NVKM_LAYOUT_ONCE(type,data,ptr)                                                      \
+	if (device->chip->ptr.inst) {                                                        \
+		WARN_ON(device->chip->ptr.inst != 0x00000001);                               \
+		ret = device->chip->ptr.ctor(device, (type), -1, &device->ptr);              \
+		subdev = nvkm_device_subdev(device, (type), 0);                              \
+		if (ret) {                                                                   \
+			nvkm_subdev_del(&subdev);                                            \
+			device->ptr = NULL;                                                  \
+			if (ret != -ENODEV) {                                                \
+				nvdev_error(device, "%s ctor failed: %d\n",                  \
+					    nvkm_subdev_type[(type)], ret);                  \
+				goto done;                                                   \
+			}                                                                    \
+		} else {                                                                     \
+			subdev->pself = (void **)&device->ptr;                               \
+		}                                                                            \
+	}
+#define NVKM_LAYOUT_INST(type,data,ptr,cnt)                                                  \
+	WARN_ON(device->chip->ptr.inst & ~((1 << ARRAY_SIZE(device->ptr)) - 1));             \
+	for (j = 0; device->chip->ptr.inst && j < ARRAY_SIZE(device->ptr); j++) {            \
+		if (device->chip->ptr.inst & BIT(j)) {                                       \
+			ret = device->chip->ptr.ctor(device, (type), (j), &device->ptr[j]);  \
+			subdev = nvkm_device_subdev(device, (type), (j));                    \
+			if (ret) {                                                           \
+				nvkm_subdev_del(&subdev);                                    \
+				device->ptr[j] = NULL;                                       \
+				if (ret != -ENODEV) {                                        \
+					nvdev_error(device, "%s%d ctor failed: %d\n",        \
+						    nvkm_subdev_type[(type)], (j), ret);     \
+					goto done;                                           \
+				}                                                            \
+			} else {                                                             \
+				subdev->pself = (void **)&device->ptr[j];                    \
+			}                                                                    \
+		}                                                                            \
+	}
+#include <core/layout.h>
+#undef NVKM_LAYOUT_INST
+#undef NVKM_LAYOUT_ONCE
+
+	ret = nvkm_intr_install(device);
+done:
+	if (ret) {
+		list_for_each_entry_safe_reverse(subdev, subtmp, &device->subdev, head)
+			nvkm_subdev_del(&subdev);
+	}
+
+	return ret;
+}
+
 int
 nvkm_device_init(struct nvkm_device *device)
 {
@@ -2915,6 +2971,12 @@ nvkm_device_init(struct nvkm_device *device)
 	int ret;
 	s64 time;
 
+	if (list_empty(&device->subdev)) {
+		ret = nvkm_device_oneinit(device);
+		if (ret)
+			return ret;
+	}
+
 	ret = nvkm_device_preinit(device);
 	if (ret)
 		return ret;
@@ -3012,13 +3074,11 @@ int
 nvkm_device_ctor(const struct nvkm_device_func *func,
 		 const struct nvkm_device_quirk *quirk,
 		 struct device *dev, enum nvkm_device_type type, u64 handle,
-		 const char *name, const char *cfg, const char *dbg,
-		 struct nvkm_device *device)
+		 const char *name, struct nvkm_device *device)
 {
-	struct nvkm_subdev *subdev;
 	u64 mmio_base, mmio_size;
 	u32 boot0, boot1, strap;
-	int ret = -EEXIST, j;
+	int ret = -EEXIST;
 	unsigned chipset;
 
 	device->func = func;
@@ -3026,8 +3086,6 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	device->dev = dev;
 	device->type = type;
 	device->handle = handle;
-	device->cfgopt = cfg;
-	device->dbgopt = dbg;
 	device->name = name;
 	device->debug = nvkm_dbgopt(device->dbgopt, "device");
 	INIT_LIST_HEAD(&device->subdev);
@@ -3265,47 +3323,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	mutex_init(&device->mutex);
 	nvkm_intr_ctor(device);
 
-#define NVKM_LAYOUT_ONCE(type,data,ptr)                                                      \
-	if (device->chip->ptr.inst) {                                                        \
-		WARN_ON(device->chip->ptr.inst != 0x00000001);                               \
-		ret = device->chip->ptr.ctor(device, (type), -1, &device->ptr);              \
-		subdev = nvkm_device_subdev(device, (type), 0);                              \
-		if (ret) {                                                                   \
-			nvkm_subdev_del(&subdev);                                            \
-			device->ptr = NULL;                                                  \
-			if (ret != -ENODEV) {                                                \
-				nvdev_error(device, "%s ctor failed: %d\n",                  \
-					    nvkm_subdev_type[(type)], ret);                  \
-				goto done;                                                   \
-			}                                                                    \
-		} else {                                                                     \
-			subdev->pself = (void **)&device->ptr;                               \
-		}                                                                            \
-	}
-#define NVKM_LAYOUT_INST(type,data,ptr,cnt)                                                  \
-	WARN_ON(device->chip->ptr.inst & ~((1 << ARRAY_SIZE(device->ptr)) - 1));             \
-	for (j = 0; device->chip->ptr.inst && j < ARRAY_SIZE(device->ptr); j++) {            \
-		if (device->chip->ptr.inst & BIT(j)) {                                       \
-			ret = device->chip->ptr.ctor(device, (type), (j), &device->ptr[j]);  \
-			subdev = nvkm_device_subdev(device, (type), (j));                    \
-			if (ret) {                                                           \
-				nvkm_subdev_del(&subdev);                                    \
-				device->ptr[j] = NULL;                                       \
-				if (ret != -ENODEV) {                                        \
-					nvdev_error(device, "%s%d ctor failed: %d\n",        \
-						    nvkm_subdev_type[(type)], (j), ret);     \
-					goto done;                                           \
-				}                                                            \
-			} else {                                                             \
-				subdev->pself = (void **)&device->ptr[j];                    \
-			}                                                                    \
-		}                                                                            \
-	}
-#include <core/layout.h>
-#undef NVKM_LAYOUT_INST
-#undef NVKM_LAYOUT_ONCE
-
-	ret = nvkm_intr_install(device);
+	ret = 0;
 done:
 	if (ret && device->pri) {
 		iounmap(device->pri);
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/pci.c b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
index 3ff6436007fa..8bfedd79d7a5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/pci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
@@ -1679,7 +1679,7 @@ nvkm_device_pci_new(struct pci_dev *pci_dev, const char *cfg, const char *dbg,
 				    pci_dev->bus->number << 16 |
 				    PCI_SLOT(pci_dev->devfn) << 8 |
 				    PCI_FUNC(pci_dev->devfn), name,
-			       cfg, dbg, &pdev->device);
+			       &pdev->device);
 
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/priv.h b/drivers/gpu/drm/nouveau/nvkm/device/priv.h
index e42b18820a95..176cb1dfb2fe 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/device/priv.h
@@ -54,8 +54,7 @@
 int  nvkm_device_ctor(const struct nvkm_device_func *,
 		      const struct nvkm_device_quirk *,
 		      struct device *, enum nvkm_device_type, u64 handle,
-		      const char *name, const char *cfg, const char *dbg,
-		      struct nvkm_device *);
+		      const char *name, struct nvkm_device *);
 int  nvkm_device_init(struct nvkm_device *);
 int  nvkm_device_fini(struct nvkm_device *, bool suspend);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/device/tegra.c
index d1c294f00665..bb514ccdfff4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/tegra.c
@@ -310,7 +310,7 @@ nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 	tdev->gpu_speedo_id = tegra_sku_info.gpu_speedo_id;
 	ret = nvkm_device_ctor(&nvkm_device_tegra_func, NULL, &pdev->dev,
 			       NVKM_DEVICE_TEGRA, pdev->id, NULL,
-			       cfg, dbg, &tdev->device);
+			       &tdev->device);
 	if (ret)
 		goto powerdown;
 
-- 
2.44.0

