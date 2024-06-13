Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42978907936
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2242010EB41;
	Thu, 13 Jun 2024 17:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ik/JQ/KD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970CF10EB34;
 Thu, 13 Jun 2024 17:01:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m518ZZEGVXzo5qoaG4TN+Klr95uc5FPLZKLHR5N+xiv/BRXpbzkpiWwrLM0iM7aHKP0Dw8OVlQ34hYpIm1PEbcNbEv0yMl9pNJHPMvq6h8+8GLnq+/FVKdOGM4bRxgmGSGr6GM3MRPY1axYz5BHu4BEN+dCj7wfa12wipHVKb79XHPl8QTMBDL7Yqugqi3fHjiv2oc3Bpow8671/yItZW1KIsBm8imsZYqB/JkXirTahvJy/pCuOT6sbWqxlxoJyhbqFi7qPbR5aoMgqFNyuc4Yn5a9/M+Uzgl3fHTQ/gPnMaYNsDMg9acgpDqJBTw60UgZbbkP9bbcJIfkNLC5/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvVqjXhdVDF/VhpBDgneO3tVZp0jZCLlVU73cyweN5w=;
 b=DCVpiNgOJRVAgbHksUY7slAwHreDM0rrVRDuPoQIZ4P9GALu716LZ/zJd0z0bMLVY9GMiLnJxYnwRxV8GKKc03mmlRt0tOwFhZbrnZ+aieP5yByVhEuFKKdr59ifFKP4uQFK7l/aRSTjbYySib8UJUTxZyvT2YRQIAlbDOA7cbJvxc9sw2K5fX1EBaLN+xkuexpkbgvGLSnWx4OeU8nDsV6Ts+g5p6G1i3KklwwPBNRjLXgA01tmnPCV2u3R87o7appoMPoS5skNN1SVk60z6wibrQX8GWTgcYmfXJ1CrBIGqa7iKWqfZlJ44uLLQaydkDShs9hUnexQ4ViRdslb0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvVqjXhdVDF/VhpBDgneO3tVZp0jZCLlVU73cyweN5w=;
 b=ik/JQ/KDDvbjJtWeaHUMm9ZcuTWpsqeO3liUZN5XXf9bdj02LFlPxE5lZLCp2FojNA5e1wo3My3xxvJ86KRjpq4ZTuY3puF8DBdGfIgxtsV8ZjVZtSLRxcVti+Ht7g3/KgAeoAmtzp0JPVSRo6MJRusiKiwpgl4iGDwID8ZYbgaf5Jzrxe5zMQvzuXgQC+cgqo3Yh7wFiK9H20bxyHCVz07TCUjCz/YBCkgG//cL60RuuMndhrm3ZM8bKeBgx8azEG3WeRhHKPP6xV6SOTs8lHkPbH3boVwM6LUUFboUdxbumYUSusnXnU29SzSZ3teym8RV/Ju7/SlAQv4PS+YR+g==
Received: from MN2PR08CA0024.namprd08.prod.outlook.com (2603:10b6:208:239::29)
 by SN7PR12MB7810.namprd12.prod.outlook.com (2603:10b6:806:34c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 17:01:36 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::68) by MN2PR08CA0024.outlook.office365.com
 (2603:10b6:208:239::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24 via Frontend
 Transport; Thu, 13 Jun 2024 17:01:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 17:01:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 10:01:05 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 10:01:03 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 1/2] drm/nouveau/nvkm: export symbols needed by the drm driver
Date: Fri, 14 Jun 2024 03:02:10 +1000
Message-ID: <20240613170211.88779-2-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240613170211.88779-1-bskeggs@nvidia.com>
References: <20240613170211.88779-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|SN7PR12MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: 12df4ce9-ef44-41ee-6475-08dc8bca7c1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AZEHGhM6SNk/ZR4m5tpBPhbAxYfnzHQpjpQiUp1QuYp7Uv3Z4A3QwC3+Pgj1?=
 =?us-ascii?Q?bo1DnD95+2WeSyed4pqKySY3yrdXbP+BI9is3wL3+/xaNWTiBMkQReWBIAg7?=
 =?us-ascii?Q?sBRfyOXnneqHHRH6x28ulorDXqHGVFJY962sbfCfNYKtWUdQ1FbTsXcfu3qm?=
 =?us-ascii?Q?Hcu1HPezs7Q/RJbH8uN7UMEILwJ1bSyCfJTK1H97MBiylbOjuWFKmA+UcAP5?=
 =?us-ascii?Q?189s0yvF1v0b0eDhLzx4l88ztm5C2wFCHxhFQUb/b8DaK+egjbu6B3ljhBPH?=
 =?us-ascii?Q?Sqe7aqmdSJaIpLjzjU2zxZ3uzXZATSGW1uPIn0yEy3JBefcmqVdJfs9EP3FU?=
 =?us-ascii?Q?H5VLhAK1AkpkQeI5ZvpNxhRrprN5zs6+sdCRB5mK3QptJgQNkgWC23dE9eZe?=
 =?us-ascii?Q?QHtPz0zP/OGVLlYPCcTb1AXlRXZaMSDqpp1vk0x7GYc65BEatFXJTrB8eaAb?=
 =?us-ascii?Q?oxHvrB4Kxlko4hq3oBhZEIy/Cfdk3jCyx9QCPciHu8ObCjUquyPSnowSs0ZP?=
 =?us-ascii?Q?OPo/URb0yDQ870XHs1GQlp1hV9tTI/+ogxCfLB8cKW/E8bCxzfss3ml4sWbI?=
 =?us-ascii?Q?5xF/ICo6UAk4aZwQub3/nW4w1op7tW/KqZb8C/PU7nrNmZuVRN7UUXm7Okxn?=
 =?us-ascii?Q?fNLNJzEiU5tkLXSjW4ZIiMAzJSpLVJ/al6hSG+XwCrH2hdcRsvnqpfnR+dYH?=
 =?us-ascii?Q?wFVNHNlYVhh9MobdbpBMXATqlqpb50trH8uqsAcMUe/zj5vewEq1q+jRp3Pv?=
 =?us-ascii?Q?azx/8It20FaUZTxU1skU48RBI4UsRMpqwdhy0ZOuwAx++Bovk134qw6CQ8l0?=
 =?us-ascii?Q?ClA98d7mv+jzGJBqxdJq7dKEeNx/k12kyA7VbCJ3U+KqyyDL7keHcwEznUFM?=
 =?us-ascii?Q?YLVB9jDFX/dagmGrfTF2uMo9j4rXvhEEjuh8ZbG/r/Oh1awW5KN30xw030BW?=
 =?us-ascii?Q?GSyTvvS0J6Ks5BhlE+rCbcOfROOuh4ct6hKiHZSD3pJP0NFXqOYl07IHNomQ?=
 =?us-ascii?Q?/u3O4wsXcsInXZo4Po+yvxxLe4yTlpD0Vob2JyA8K9kg5ZbkvK044FFnns+o?=
 =?us-ascii?Q?z7mNbF8jo1vXB6oUeF1B2Ubl9lVdE0fzjzTTJX4ykqTrIfmZoLwWBisqW0t1?=
 =?us-ascii?Q?pWXhlulB063wNd4mtFWrE7jG9703xUIbiFho3heHaYqUUp/MCZnvTbOcf6YZ?=
 =?us-ascii?Q?DQvvFWiQn97G+5eV8hXZx2JQy5GmaHVFGH//ilp6FGF4fCUak5a6k52T0RnR?=
 =?us-ascii?Q?GmjTX6CiurlFWutnLCHKqBFD/3YFcK2qbsd0A5lHIzBcqWv1DsUCm6vz6N9/?=
 =?us-ascii?Q?QC8/KtALsm7AJNMOhQhE19Ayd1zNblswQRQoQRtPEVkyY2Kk7v8UYGyWQbGP?=
 =?us-ascii?Q?ed0/W3b+HlZuL22TxClJD+cPaK62ixxyXesOaU0eX/G6a2tUUw=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 17:01:35.9782 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12df4ce9-ef44-41ee-6475-08dc8bca7c1c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7810
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

The primary interfaces to NVKM are through NVIF, but there are a small
number of functions which are called directly.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/core/driver.c          | 1 +
 drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c          | 2 ++
 drivers/gpu/drm/nouveau/nvkm/core/mm.c              | 4 ++++
 drivers/gpu/drm/nouveau/nvkm/device/acpi.c          | 1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c       | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c     | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c      | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c       | 3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c     | 3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c      | 2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c       | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c    | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c     | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c     | 1 +
 15 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/driver.c b/drivers/gpu/drm/nouveau/nvkm/core/driver.c
index dcc5dc7f246e..d6e8117a2a74 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/driver.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/driver.c
@@ -78,3 +78,4 @@ nvkm_driver_ctor(struct nvkm_device *device, const struct nvif_driver **pdrv,
 	*pdrv = &nvkm_driver;
 	return 0;
 }
+EXPORT_SYMBOL(nvkm_driver_ctor);
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c b/drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c
index d6de2b3ed2c3..a06ced74fb10 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c
@@ -224,6 +224,7 @@ nvkm_gpuobj_del(struct nvkm_gpuobj **pgpuobj)
 		*pgpuobj = NULL;
 	}
 }
+EXPORT_SYMBOL(nvkm_gpuobj_del);
 
 int
 nvkm_gpuobj_new(struct nvkm_device *device, u32 size, int align, bool zero,
@@ -240,6 +241,7 @@ nvkm_gpuobj_new(struct nvkm_device *device, u32 size, int align, bool zero,
 		nvkm_gpuobj_del(pgpuobj);
 	return ret;
 }
+EXPORT_SYMBOL(nvkm_gpuobj_new);
 
 /* the below is basically only here to support sharing the paged dma object
  * for PCI(E)GART on <=nv4x chipsets, and should *not* be expected to work
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/mm.c b/drivers/gpu/drm/nouveau/nvkm/core/mm.c
index f78a06a6b2f1..c2a66cfe2a1e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/mm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/mm.c
@@ -81,6 +81,7 @@ nvkm_mm_free(struct nvkm_mm *mm, struct nvkm_mm_node **pthis)
 
 	*pthis = NULL;
 }
+EXPORT_SYMBOL(nvkm_mm_free);
 
 static struct nvkm_mm_node *
 region_head(struct nvkm_mm *mm, struct nvkm_mm_node *a, u32 size)
@@ -156,6 +157,7 @@ nvkm_mm_head(struct nvkm_mm *mm, u8 heap, u8 type, u32 size_max, u32 size_min,
 
 	return -ENOSPC;
 }
+EXPORT_SYMBOL(nvkm_mm_head);
 
 static struct nvkm_mm_node *
 region_tail(struct nvkm_mm *mm, struct nvkm_mm_node *a, u32 size)
@@ -278,6 +280,7 @@ nvkm_mm_init(struct nvkm_mm *mm, u8 heap, u32 offset, u32 length, u32 block)
 	mm->heap_nodes++;
 	return 0;
 }
+EXPORT_SYMBOL(nvkm_mm_init);
 
 int
 nvkm_mm_fini(struct nvkm_mm *mm)
@@ -305,3 +308,4 @@ nvkm_mm_fini(struct nvkm_mm *mm)
 	mm->heap_nodes = 0;
 	return 0;
 }
+EXPORT_SYMBOL(nvkm_mm_fini);
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/acpi.c b/drivers/gpu/drm/nouveau/nvkm/device/acpi.c
index ff8a3027c1bc..941e7d2a29a8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/acpi.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/acpi.c
@@ -109,6 +109,7 @@ void nvkm_acpi_switcheroo_set_powerdown(void)
 			 NOUVEAU_DSM_OPTIMUS_SET_POWERDOWN, &result);
 
 }
+EXPORT_SYMBOL(nvkm_acpi_switcheroo_set_powerdown);
 
 /*
  * On some platforms, _DSM(nvkm_op_dsm_muid, func0) has special
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c
index f5e68f09df76..151c10558c82 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c
@@ -76,6 +76,7 @@ nvkm_gr_units(struct nvkm_gr *gr)
 		return gr->func->units(gr);
 	return 0;
 }
+EXPORT_SYMBOL(nvkm_gr_units);
 
 int
 nvkm_gr_tlb_flush(struct nvkm_gr *gr)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
index b54f044c4483..3ac3dbc0c03a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
@@ -2317,6 +2317,7 @@ nvbios_exec(struct nvbios_init *init)
 	init->nested--;
 	return 0;
 }
+EXPORT_SYMBOL(nvbios_exec);
 
 int
 nvbios_post(struct nvkm_subdev *subdev, bool execute)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c
index 2ec84b8a3b3a..1cd5b1996489 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c
@@ -438,3 +438,4 @@ nvbios_pll_parse(struct nvkm_bios *bios, u32 type, struct nvbios_pll *info)
 
 	return 0;
 }
+EXPORT_SYMBOL(nvbios_pll_parse);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c
index 8a286a9349ac..b1fab6332ed1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c
@@ -36,6 +36,7 @@ nvkm_fb_tile_fini(struct nvkm_fb *fb, int region, struct nvkm_fb_tile *tile)
 {
 	fb->func->tile.fini(fb, region, tile);
 }
+EXPORT_SYMBOL(nvkm_fb_tile_fini);
 
 void
 nvkm_fb_tile_init(struct nvkm_fb *fb, int region, u32 addr, u32 size,
@@ -43,6 +44,7 @@ nvkm_fb_tile_init(struct nvkm_fb *fb, int region, u32 addr, u32 size,
 {
 	fb->func->tile.init(fb, region, addr, size, pitch, flags, tile);
 }
+EXPORT_SYMBOL(nvkm_fb_tile_init);
 
 void
 nvkm_fb_tile_prog(struct nvkm_fb *fb, int region, struct nvkm_fb_tile *tile)
@@ -56,6 +58,7 @@ nvkm_fb_tile_prog(struct nvkm_fb *fb, int region, struct nvkm_fb_tile *tile)
 			nvkm_engine_tile(device->mpeg, region);
 	}
 }
+EXPORT_SYMBOL(nvkm_fb_tile_prog);
 
 static void
 nvkm_fb_sysmem_flush_page_init(struct nvkm_device *device)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c
index b196baa376dc..f93ce38afd16 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c
@@ -75,6 +75,7 @@ nvkm_gpio_find(struct nvkm_gpio *gpio, int idx, u8 tag, u8 line,
 
 	return -ENOENT;
 }
+EXPORT_SYMBOL(nvkm_gpio_find);
 
 int
 nvkm_gpio_set(struct nvkm_gpio *gpio, int idx, u8 tag, u8 line, int state)
@@ -91,6 +92,7 @@ nvkm_gpio_set(struct nvkm_gpio *gpio, int idx, u8 tag, u8 line, int state)
 
 	return ret;
 }
+EXPORT_SYMBOL(nvkm_gpio_set);
 
 int
 nvkm_gpio_get(struct nvkm_gpio *gpio, int idx, u8 tag, u8 line)
@@ -107,6 +109,7 @@ nvkm_gpio_get(struct nvkm_gpio *gpio, int idx, u8 tag, u8 line)
 
 	return ret;
 }
+EXPORT_SYMBOL(nvkm_gpio_get);
 
 static void
 nvkm_gpio_intr_fini(struct nvkm_event *event, int type, int index)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
index 731b2f68d3db..845e7f41076e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
@@ -71,6 +71,7 @@ nvkm_i2c_bus_find(struct nvkm_i2c *i2c, int id)
 
 	return NULL;
 }
+EXPORT_SYMBOL(nvkm_i2c_bus_find);
 
 struct nvkm_i2c_aux *
 nvkm_i2c_aux_find(struct nvkm_i2c *i2c, int id)
@@ -84,6 +85,7 @@ nvkm_i2c_aux_find(struct nvkm_i2c *i2c, int id)
 
 	return NULL;
 }
+EXPORT_SYMBOL(nvkm_i2c_aux_find);
 
 static void
 nvkm_i2c_intr_fini(struct nvkm_event *event, int type, int id)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c
index ed50cc3736b9..47fade442d14 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c
@@ -189,6 +189,7 @@ nvkm_i2c_bus_probe(struct nvkm_i2c_bus *bus, const char *what,
 	BUS_DBG(bus, "no devices found.");
 	return -ENODEV;
 }
+EXPORT_SYMBOL(nvkm_i2c_bus_probe);
 
 void
 nvkm_i2c_bus_del(struct nvkm_i2c_bus **pbus)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
index 8f0ccd3664eb..6e6d7bc0ea1f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
@@ -126,6 +126,7 @@ nvkm_iccsense_read_all(struct nvkm_iccsense *iccsense)
 	}
 	return result;
 }
+EXPORT_SYMBOL(nvkm_iccsense_read_all);
 
 static void *
 nvkm_iccsense_dtor(struct nvkm_subdev *subdev)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
index fc5ee118e910..2a32559b38f4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
@@ -33,6 +33,7 @@ nvkm_therm_temp_get(struct nvkm_therm *therm)
 		return therm->func->temp_get(therm);
 	return -ENODEV;
 }
+EXPORT_SYMBOL(nvkm_therm_temp_get);
 
 static int
 nvkm_therm_update_trip(struct nvkm_therm *therm)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c
index f8fa43c8a7d2..418f441897f1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c
@@ -164,6 +164,7 @@ nvkm_therm_fan_sense(struct nvkm_therm *therm)
 	} else
 		return 0;
 }
+EXPORT_SYMBOL(nvkm_therm_fan_sense);
 
 int
 nvkm_therm_fan_user_get(struct nvkm_therm *therm)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c
index a17a6dd8d3de..07d861440232 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c
@@ -46,6 +46,7 @@ nvkm_volt_get(struct nvkm_volt *volt)
 	}
 	return ret;
 }
+EXPORT_SYMBOL(nvkm_volt_get);
 
 static int
 nvkm_volt_set(struct nvkm_volt *volt, u32 uv)
-- 
2.44.0

