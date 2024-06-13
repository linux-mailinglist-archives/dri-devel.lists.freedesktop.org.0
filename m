Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD387907916
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274F310EB1D;
	Thu, 13 Jun 2024 17:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sKpdFkhq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2045.outbound.protection.outlook.com [40.107.100.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7B110EB08;
 Thu, 13 Jun 2024 17:00:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h210SqNY2buKk1JSjzCjEK2+KX/NztfZNcXAmao2K6tp5n+7GXcBjlrEX23DxgDT/lg92fx/zYEJUGvpwBiQBNZhP8ZqUjp7j2D39Pohy9HDyxR2UWC7k+Wh6YAFVOND9k2QJ3E7LSi01YZDmjdXJCmvx1meF0g8qaPQSTjppI/8BD/LozL+1H0YwPPMX4HvHyrHFmN9xxp902zLQIoqrQmGsrs/IoPja/NdqhWN6mxUi8YAQEldBffLu2q/DnvMiqftekS9vajG0kcMQLvC/ZMrbVkPaMRPeoEnCHb1gB7iV5I8Iak0Dm7ynjc9APQgnq5U/SsD6QkKnbZYq5WHUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/zq3+bRdr5nagyyEDBAPewdx0AOfBPTk6Jeu0NlYCc=;
 b=FihGp6+DneFGPiJmsObtoYxrhKOzHwHKv/7U0fCils9TsqX8KexhM6vLzLHFpW17t5raig4jlXcDi2OWRkvMmgkveC/SSnVLP+ln3jFrA8+YhuPW8cLUdeOFv23ASAEcCZUMSRDJON8dKrQWQfEmQtsnaJf+MbXJMx5NYF+pajuQXQ7qiS+UPMtKsypTvZM5u+4JB0WPuvFDgU2TvEP8gZiQJVbI9/Y0beVIo5W86iQf/HIbpC8ko2ZkMDzPE6+JPev+4NJe5MJeYGFx/NrLqSQFfvdlwAWPeG5Suzri0hnvR5diZFOaagJdabTQJpf8J/iv0s3+l0Qoma9kqQZ64A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/zq3+bRdr5nagyyEDBAPewdx0AOfBPTk6Jeu0NlYCc=;
 b=sKpdFkhqUC2FKOhAPRSZNZfbhi6DKANcUiy6JDj9eHl0HNApY/Xf2oZ6fTyHJrHqBt7J0HU7xx745xvAtJUjDjab8sbj5x1uQKNKs7A+n1QG3XnYTOxh/yPU5Id0RmVN8+uWf1sEzXcH1QUHcuWrPruFCys71Si1FaQlk4TS122BFd3uhi5yQXtCFqzdPcuFML/ZJ59k0GCAXUt4ZMM4syfhg/fwhj4K5GMK4N1JAmynVJN6lwF0KLqliLmYh+uFhV3xJC05l/Qyoi03BkM8xvcdioi7XXcqGniyz1hWCJq3HpRcfP5gOnM5E84yiNwzCIYaRnEVZF/X2sjphKj0qA==
Received: from SA9PR10CA0024.namprd10.prod.outlook.com (2603:10b6:806:a7::29)
 by SN7PR12MB7347.namprd12.prod.outlook.com (2603:10b6:806:29a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 17:00:21 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:806:a7:cafe::ad) by SA9PR10CA0024.outlook.office365.com
 (2603:10b6:806:a7::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25 via Frontend
 Transport; Thu, 13 Jun 2024 17:00:21 +0000
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
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 17:00:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 10:00:03 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 10:00:02 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 18/21] drm/nouveau/nvkm: add device to auxiliary bus for each
 nvkm_device
Date: Fri, 14 Jun 2024 03:00:10 +1000
Message-ID: <20240613170046.88687-19-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|SN7PR12MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: c8464981-be2a-4b11-142e-08dc8bca4fd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HEQL4e1zOL8EKUt9q2qS9Th0UTveDpj0DGujXUrQ/Q8zj/2BiJRjKsoJbDwY?=
 =?us-ascii?Q?QX+PtxKmix7ThBc6H0TC67Ny+0WKjzHg5ujzbdjbmKv+EajIAaQbQuYVsfKE?=
 =?us-ascii?Q?w6c4MnEbny0o9I46or8qnmr1Qxs64SHTQXq8al1//v5REDeaYFC9VjYNN1YP?=
 =?us-ascii?Q?NiscNPQOCPVi5FaUIbYFHjX8l9Kt3i21H7EVRf9tGlyBntUXu40nBt+N5MO1?=
 =?us-ascii?Q?GAnMauS4GtZxoOdPkC7BalkUpRi7caRbzzOzGRY20XWCAvmUQrjbfXGBpB0z?=
 =?us-ascii?Q?0UGur8wZFD4cIU0g5uyEInoJL5ppkLecFkaO/uybAihCM+j0zrALHuKSCzl7?=
 =?us-ascii?Q?WVm4j+BqbmYT52r1AKMB8aqhiJfgU7Ffe8knmmvZHhJm5iQgQESCdyJkBu11?=
 =?us-ascii?Q?nV3zYcUldifPZyqa9kKiy3LaTSgxyBPf1N9X77offy+KrSIlN/E2qRMrnv3/?=
 =?us-ascii?Q?42cq/YP3Ji6jdw1G2iLiirH3Ujemp17tM6la3ByWd4FkZUVuq+XyBtQJ233+?=
 =?us-ascii?Q?CkSGNdddjfvZFHX07E8b28jouxjyVi3uMrbtrHckqBvEAdWxnVW0OzXY/jeP?=
 =?us-ascii?Q?WOBa17/R5cRxy8pI/u/Vyp6hch/6Fj+K3CDL4aTuRT0s/h6rBo+ij6SfdGU2?=
 =?us-ascii?Q?UZ92Wa3ERISxv1FnF8i6uM6HfzuSnWDrkO2QufYGWOkuh5IyaA3SMe5xTNVR?=
 =?us-ascii?Q?un7vktiJ/v3oXy/nbUXZJUa40alhTHcfSsyBoXHVZ4CV0/3x1QXMcg7S7Mz8?=
 =?us-ascii?Q?xsu4FRvi4q1c4/SrfOS2a/c10AxsG0XaWTp2bahz5gKDHbgJhbaQZWLuAzFe?=
 =?us-ascii?Q?4PmRcv8F7nQuNN/wrz4bIE9K4L56TC6BCR1k+oVE0M/mK4jioBxNXL1HWQsi?=
 =?us-ascii?Q?9/ztpzGIGPpDf1YkDawuwXkZdTcyyu4OtfYts0rgLu30pRmuGSB4ICV46aTq?=
 =?us-ascii?Q?47X2zP+VqYLIRCh35HZtesw9rGpMC8vd3taYiq2rrR6gOlCvzzQc/wUgjfa+?=
 =?us-ascii?Q?8u3vVZaCqufB5FslOBHRUSbuu6MhC7/jAkiL84LWh1GsODz/4e/HXXyZ2M22?=
 =?us-ascii?Q?CmIWjSkF/52nWQHmrAwArsNk/1Ak5hLgoxD/caFZx9mJI5pvDZg6nPHSkcFK?=
 =?us-ascii?Q?TA7yV3kBh68RUaJj+DSnDtXMJtPhSOra0Hwk6vWlwnwbhBO7fq9q8S1Akocy?=
 =?us-ascii?Q?RZ7SvSYPbn/JzDxDvKRv5pLyL0Gu4uczZnHAOFg+peW+QWdVL/LJ3LB1SQnA?=
 =?us-ascii?Q?S1tU9BjOL+EjJjZzDZHQ00geFGlsgbgx7tOzHTA2mNQuOp3H0LqTirzMM3+b?=
 =?us-ascii?Q?PF9tH43WBO1XZ/M40ESedCwBr8HU8xwhyI4C+tDt+X6MRhY23TRuuYrBrQSX?=
 =?us-ascii?Q?lhMqP6vK4zGfZlQtvMlkN4gbH80StefWLZgfG+2B/tAwxVM0cA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 17:00:21.7642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8464981-be2a-4b11-142e-08dc8bca4fd9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7347
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

This commit registers a device on the aux bus after core NVKM init
has finished, which will be used by a later commit to have the DRM
driver probe() against an aux device instead of a PCI or platform
device (in the case of Tegra).

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/Kconfig               |  1 +
 .../drm/nouveau/include/nvkm/core/device.h    |  3 ++
 drivers/gpu/drm/nouveau/nvkm/device/base.c    | 33 +++++++++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 4c10b400658c..6d0d46a0e66f 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -7,6 +7,7 @@ config DRM_NOUVEAU
 	depends on DRM_DISPLAY_HELPER
 	depends on PCI
 	depends on MMU
+	select AUXILIARY_BUS
 	select IOMMU_API
 	select FW_LOADER
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
index d8596fe0adea..855d1b20820d 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
@@ -5,6 +5,8 @@
 #include <core/intr.h>
 enum nvkm_subdev_type;
 
+#include <linux/auxiliary_bus.h>
+
 enum nvkm_device_type {
 	NVKM_DEVICE_PCI,
 	NVKM_DEVICE_AGP,
@@ -78,6 +80,7 @@ struct nvkm_device {
 		bool legacy_done;
 	} intr;
 
+	struct auxiliary_device auxdev;
 	const struct nvif_driver_func *driver;
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/base.c b/drivers/gpu/drm/nouveau/nvkm/device/base.c
index 4f8298bf71ee..fbb6e20bc1f2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/base.c
@@ -3029,6 +3029,9 @@ nvkm_device_del(struct nvkm_device **pdevice)
 	struct nvkm_device *device = *pdevice;
 	struct nvkm_subdev *subdev, *subtmp;
 	if (device) {
+		auxiliary_device_delete(&device->auxdev);
+		auxiliary_device_uninit(&device->auxdev);
+
 		nvkm_intr_dtor(device);
 
 		list_for_each_entry_safe_reverse(subdev, subtmp, &device->subdev, head)
@@ -3076,6 +3079,16 @@ nvkm_device_endianness(struct nvkm_device *device)
 	return true;
 }
 
+static DEFINE_IDA(nvkm_device_id);
+
+static void
+nvkm_device_release(struct device *dev)
+{
+	struct nvkm_device *device = container_of(dev, typeof(*device), auxdev.dev);
+
+	ida_free(&nvkm_device_id, device->auxdev.id);
+}
+
 int
 nvkm_device_ctor(const struct nvkm_device_func *func,
 		 const struct nvkm_device_quirk *quirk,
@@ -3335,5 +3348,25 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		iounmap(device->pri);
 		device->pri = NULL;
 	}
+
+	if (ret == 0) {
+		ret = ida_alloc(&nvkm_device_id, GFP_KERNEL);
+		if (ret < 0)
+			return ret;
+
+		device->auxdev.dev.parent = device->dev;
+		device->auxdev.dev.release = nvkm_device_release;
+		device->auxdev.name = "device";
+		device->auxdev.id = ret;
+
+		ret = auxiliary_device_init(&device->auxdev);
+		if (ret)
+			return ret;
+
+		ret = auxiliary_device_add(&device->auxdev);
+		if (ret)
+			auxiliary_device_uninit(&device->auxdev);
+	}
+
 	return ret;
 }
-- 
2.44.0

