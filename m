Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3140590791A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DE010EB26;
	Thu, 13 Jun 2024 17:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="braEiYXR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2054.outbound.protection.outlook.com [40.107.212.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF32710EB0B;
 Thu, 13 Jun 2024 17:00:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=By+YBX5qZTd12MBi/N7ExT5nXGUOpommq59THyK9VyUoe1RFGqAG/3wLQo23/Q4v1hjRBg2wSIjykjKkYEu2P3LAfCCR93WdpKG/di//b2xe/xI5SlXUOHvJ+ddqNTKrZzAAouNBrO1d0+O1ryDo9DH1M1UPhU26r4OInoW4HCX/n4bTB1nW6jDi4ieBW8tZeWEPtb9dCoXgwvvroVjlMDmMRbpraW/q6VzjRmjL8q15dAmW++qqSxZQUAU56R6SjI0B+GXr0Z5sEkXrz9n+Mcdf+JR/ofDVDLVp/lDs9a5R9C6UnFu4xuwJOJSwyDleQjDeocB1LybZGsnD8K4Zag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwfaihetMxi76tFfC1a8EM4K9ZoRYl3H/iGE0RxHhsI=;
 b=dL/zRgMt4W/R309FFfEpWcrMQ9i5EZ/torjLYqdNikNek1/xtZ51it0Tw3wbhmK0SXQ5ammv9HFNC2ImjBbH1D6v5WEbpbt4seoWuhpb+3jE7rTeNDLHTqYhGdVrs0W5XdodgIPfG4NnRDP4NBEO+VVy6ySmeCgXsXze58wT7tOjAPc/juPm83gLeZ5uWC3UPraTQ6zST6a4bhPUgxBbx3FhyeT+45lCQ5l72Tlhl6/o65bDAxtVJIdI1GMoKu661vCBM3VXL2CY2cL8gM84FEOQUpij9Nl7L6zjV/i7VJH1lw32upp5Pww2/Iugxd+hJg9EHmyrS0I6y66znbyhtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwfaihetMxi76tFfC1a8EM4K9ZoRYl3H/iGE0RxHhsI=;
 b=braEiYXRpeClON8jlLXssZuBeJawvTVNNpBXihgPVqhJjRH4XGCT4Vo7oxr1c1BdQXAbuetFUuskI6meBx1MqPC7MKLdMMbEDWeGttPFgqqEFq4r7poYe5GBFOTk16EuEqrJLl501RTE2yJf42/Scrn+2ONwMpnWjC9JCWaFU11iLR/9qy5ySzYlqEfBlYXGz9StT0K4I+Y/+0n8ZfYEpMrFpyeF0B4tKbPrDlsYYgk+t5XBd5migwA61goiAYn7ceVyK1Kc01uszya5z6Nmpiw7yuRkAhTINjez/uApHuIYgVzyldgAAoDVI8CGhCPaFnG5XiF90nN8M6VoGd9V/w==
Received: from BYAPR05CA0051.namprd05.prod.outlook.com (2603:10b6:a03:74::28)
 by CH3PR12MB8660.namprd12.prod.outlook.com (2603:10b6:610:177::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Thu, 13 Jun
 2024 16:59:56 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:74:cafe::5d) by BYAPR05CA0051.outlook.office365.com
 (2603:10b6:a03:74::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24 via Frontend
 Transport; Thu, 13 Jun 2024 16:59:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 16:59:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:42 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:41 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 04/21] drm/nouveau/nvif: add nvif_event_stat
Date: Fri, 14 Jun 2024 02:59:56 +1000
Message-ID: <20240613170046.88687-5-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|CH3PR12MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: e06c9584-2faf-4370-fbc2-08dc8bca40b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?++hS2NEkOkV7/NFn4lEUtn0k8AGMddyRgQwB2fQvDIoFarjWhyJPFRqIgu8x?=
 =?us-ascii?Q?oaW3uu8TZxp4oC2dIl3LFjxWjM+donUfMCznIKWVIyb2yrFV56OTKXlyhpsi?=
 =?us-ascii?Q?+naBFEbTavZWNE8aLKDm5L5xQzH7RppD2XHfM+fL4C1WAbV+xTPiCqOxFxet?=
 =?us-ascii?Q?D2BN+NMJycmz3STg7Y3rmSjvFVfygLLtSZuWDWsgqu/XCKhf0tPs2qBVQxpI?=
 =?us-ascii?Q?qptWxPxXFWBoZYhZuPXtkgmdQ6nmV7gw+X3t0r3reVrKkeEjEMmZHcItkdl2?=
 =?us-ascii?Q?LR25iSbiRLmLijWL+AsA+nFZ+NxtvtTzDjf3z6JpuGCXxitak5GTKadvD8ps?=
 =?us-ascii?Q?RP2rf9hBfMsucaVsv/S5SjsNWTjfyRJUWPr8AE7199tZy2QXulmyVG4ScNFk?=
 =?us-ascii?Q?GCEBgtwCx7r73gWdcGZ5i9U0RuWETCYV4hlyNX8KHtc0+OMZ0t4P9w7VsAXW?=
 =?us-ascii?Q?fSec1fvUCm1qREyVJGSg9mXfDArh3umBN6XKbhkVZ2rYiQv3sK22hZPxvKJz?=
 =?us-ascii?Q?8JBgG4yl6VkVgoDKOvv8BryCk0jSA8s0u53Z1b3xZl6SAjOEJYmqFzhp/fUT?=
 =?us-ascii?Q?nSakiprvTbIUYbVP5YZ0H2wQUn435dMINGgmnLITrxcHAqvVQiR1u9VtZpH9?=
 =?us-ascii?Q?eSgjOx1VkmbfMVd7yxe5lbxby0epgn174UAVu9dtwWWScUw4+0zQ4TMNxjG4?=
 =?us-ascii?Q?IOSL38P91DgiKsVUK/9PeP++WcFhJgbeakyjdy33iqOzqkA0T0x1K1MAMdlQ?=
 =?us-ascii?Q?soIU5MD4/Pas3wmHUIgG/Xpshs7ebj+CPeI8ot0Hbt8sTwoTBelvLQPR0KVp?=
 =?us-ascii?Q?IC+RcL3oL6EC1n+N3/nRAvwzO17CXWitKr0jLL3EbBlP6eG0yyzfdSYx+aGC?=
 =?us-ascii?Q?tnK62oIaj6yxBq4nkg05THpRHG0EEqNW30PAIcET+9wIXmMv2KkiWQqNpLU8?=
 =?us-ascii?Q?3Iqcs2xm1w1iLyETpnQSrKaGzd97LXLgG0EVNF4P2dUAzvoEXe0VfmqBOYG3?=
 =?us-ascii?Q?BJCYILkWSDfbr56ToX9nGZQKp1K2HLqwJpg94CfdhuIbHaxuVo+mzc8YEV/I?=
 =?us-ascii?Q?YV5a1dIe/hgumuz+9LHhqU45eQIo2qniQ9ofN2ixtCYIXSBKK8c/5haqIpkm?=
 =?us-ascii?Q?6swzL29CTMNzi0eKnfz54vUzSMCZVtNzedyz+PCMk0hSBBNvuBsvz/BpcLOP?=
 =?us-ascii?Q?gko35+B49yFNFSrTf/tO0T2V8CRDM/D4mlJTSeWSoFddr8XyyXG1/g/DLoCl?=
 =?us-ascii?Q?qf+vqFGAo5b1ALOf1Ql5+sCT/BpCBjdrLVE7iyCP8UGPbT/masopfnXVFK3f?=
 =?us-ascii?Q?q5Lpb4FFOEcZ+G1pb/QslKwRaOoCpxRcACPNlwHX8NzEvRyjvw3JO7KiDAoL?=
 =?us-ascii?Q?SnnRxMQO755+TDk9gOEsEUGnFJ1/CkwKiv2TXMTYXIva51ok9Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 16:59:56.4425 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e06c9584-2faf-4370-fbc2-08dc8bca40b2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8660
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

Return an enum rather than an int from nvif_event callbacks.

Also moves the NVIF_EVENT_* definitions to driverif.h, with the
rest of the DRM<->NVKM interfaces.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c         | 4 ++--
 drivers/gpu/drm/nouveau/dispnv04/disp.h         | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/head.c         | 2 +-
 drivers/gpu/drm/nouveau/include/nvif/driverif.h | 5 +++++
 drivers/gpu/drm/nouveau/include/nvif/event.h    | 5 ++---
 drivers/gpu/drm/nouveau/nouveau_chan.c          | 2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c     | 4 ++--
 drivers/gpu/drm/nouveau/nouveau_fence.c         | 2 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c           | 2 +-
 9 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 225716d47c56..d7575ece9214 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1072,7 +1072,7 @@ nv04_finish_page_flip(struct nouveau_channel *chan,
 	return 0;
 }
 
-int
+enum nvif_event_stat
 nv04_flip_complete(struct nvif_event *event, void *argv, u32 argc)
 {
 	struct nv04_display *disp = container_of(event, typeof(*disp), flip);
@@ -1272,7 +1272,7 @@ static const struct drm_plane_funcs nv04_primary_plane_funcs = {
 	DRM_PLANE_NON_ATOMIC_FUNCS,
 };
 
-static int
+static enum nvif_event_stat
 nv04_crtc_vblank_handler(struct nvif_event *event, void *repv, u32 repc)
 {
 	struct nouveau_crtc *nv_crtc = container_of(event, struct nouveau_crtc, vblank);
diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.h b/drivers/gpu/drm/nouveau/dispnv04/disp.h
index 8eba76ab880e..88df31b6ac6b 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.h
@@ -182,5 +182,5 @@ nouveau_bios_run_init_table(struct drm_device *dev, u16 table,
 	);
 }
 
-int nv04_flip_complete(struct nvif_event *, void *, u32);
+enum nvif_event_stat nv04_flip_complete(struct nvif_event *, void *, u32);
 #endif
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index 4ad117b01d69..fd7791540f6f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -549,7 +549,7 @@ nvd9_head_func = {
 	.late_register = nv50_head_late_register,
 };
 
-static int
+static enum nvif_event_stat
 nv50_head_vblank_handler(struct nvif_event *event, void *repv, u32 repc)
 {
 	struct nouveau_crtc *nv_crtc = container_of(event, struct nouveau_crtc, vblank);
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 40f58a94c09a..0476dd6621b5 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -23,6 +23,11 @@ struct nvif_cgrp_priv;
 struct nvif_chan_priv;
 struct nvif_engobj_priv;
 
+enum nvif_event_stat {
+	NVIF_EVENT_KEEP,
+	NVIF_EVENT_DROP,
+};
+
 struct nvif_event_impl {
 	void (*del)(struct nvif_event_priv *);
 	int (*allow)(struct nvif_event_priv *);
diff --git a/drivers/gpu/drm/nouveau/include/nvif/event.h b/drivers/gpu/drm/nouveau/include/nvif/event.h
index 42c2d0b5f66b..6c52de0e17d0 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/event.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/event.h
@@ -2,11 +2,10 @@
 #ifndef __NVIF_EVENT_H__
 #define __NVIF_EVENT_H__
 #include <nvif/object.h>
+#include <nvif/driverif.h>
 struct nvif_event;
 
-#define NVIF_EVENT_KEEP 0
-#define NVIF_EVENT_DROP 1
-typedef int (*nvif_event_func)(struct nvif_event *, void *repv, u32 repc);
+typedef enum nvif_event_stat (*nvif_event_func)(struct nvif_event *, void *repv, u32 repc);
 
 struct nvif_event {
 	const struct nvif_event_impl *impl;
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 3a17e30d6c49..6a2b7e21afbf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -47,7 +47,7 @@ nouveau_channel_kill(struct nouveau_channel *chan)
 		nouveau_fence_context_kill(chan->fence, -ENODEV);
 }
 
-static int
+static enum nvif_event_stat
 nouveau_channel_killed(struct nvif_event *event, void *repv, u32 repc)
 {
 	struct nouveau_channel *chan = container_of(event, typeof(*chan), kill);
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 7d9cba7bcb8f..e3071ea845e6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1199,7 +1199,7 @@ nouveau_connector_hpd(struct nouveau_connector *nv_connector, u64 bits)
 	spin_unlock_irqrestore(&drm->hpd_lock, flags);
 }
 
-static int
+static enum nvif_event_stat
 nouveau_connector_irq(struct nvif_event *event, void *repv, u32 repc)
 {
 	struct nouveau_connector *nv_connector = container_of(event, typeof(*nv_connector), irq);
@@ -1208,7 +1208,7 @@ nouveau_connector_irq(struct nvif_event *event, void *repv, u32 repc)
 	return NVIF_EVENT_KEEP;
 }
 
-static int
+static enum nvif_event_stat
 nouveau_connector_hotplug(struct nvif_event *event, void *repv, u32 repc)
 {
 	struct nouveau_connector *nv_connector = container_of(event, typeof(*nv_connector), hpd);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 9443cbaa8cff..2b6b60ec10fa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -168,7 +168,7 @@ nouveau_fence_uevent_work(struct work_struct *work)
 	spin_unlock_irqrestore(&fctx->lock, flags);
 }
 
-static int
+static enum nvif_event_stat
 nouveau_fence_wait_uevent_handler(struct nvif_event *event, void *repv, u32 repc)
 {
 	struct nouveau_fence_chan *fctx = container_of(event, typeof(*fctx), event);
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 5b94f6e3a39d..b8a3c3d2d3aa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -870,7 +870,7 @@ nouveau_svm_fault(struct work_struct *work)
 		nouveau_svm_fault_replay(svm);
 }
 
-static int
+static enum nvif_event_stat
 nouveau_svm_event(struct nvif_event *event, void *argv, u32 argc)
 {
 	struct nouveau_svm_fault_buffer *buffer = container_of(event, typeof(*buffer), notify);
-- 
2.44.0

