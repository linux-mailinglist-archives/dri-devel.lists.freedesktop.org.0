Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DF0907905
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7446510EB07;
	Thu, 13 Jun 2024 17:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kJD1BS8G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80A010EB08;
 Thu, 13 Jun 2024 17:00:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6fDPBRq9IyN/6U8Avypm00YdiQ4O/RpZMReICFHZ3TgktX3K3iJClrUdPdv2CidAC0mG4dcichEEbVMNcX1rTYQ4xRUZk77UiJz3F98iw+56cCZ2SZLoYT2D6gxlUiNjaF38C/k4Iutoj8CBjsuvVu0vfuJSLiWaPpDR9WFmyzs3o/7mgOnMeMpq8x4idHsx0hCNsnKZ5qOpBYO/HfDxBxlvMIbmWdL4RoSZRoN6S2k9dYAak17PQi3m8MPLR4WW/vo1v8FGE0ro/jT3C5tpefznZ9/wpJWBnRUsBmpW29DVQDC2CfTd2LxleVd3f8H5SAkRts76BykHMhVWfp3Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqjVwfXBjSBY4LKXfslRF2VbLR6thzhJT34hmkShqgQ=;
 b=ADdb+mwnKOyOPCX2DlbEsri3sA1ZOfQ59AVfR/EcGMkWg4lM8zDzd+RyIdMsF8ymfFCn36BoZwv58ebd8sTI6IquB8AzBPuKjO6LSVz2/KM+aVJVuB6PE5OIxgkAipOwrBYjDVA0naMTZhqo28aQYao7H4dmn72+yENfqaNe3vagU5Ym3t5f7O5HGr3dODKC3OjVLKp5qUnlYLdHz4MQH8NCfBw/AaRBr3zQgWDEE+ueQrHKbzgMbeIaUjpCJs76ehYRZ8T0f8YT0vzaP03WjG7lNZLQSygbGUpDTlqweVZDt3gqt4S7FVUYS8jN3s1vYzhZX9UcsVHgLDlNPb7dPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqjVwfXBjSBY4LKXfslRF2VbLR6thzhJT34hmkShqgQ=;
 b=kJD1BS8GlwqWSui3YX20NBQtkkn4noU4bMfSmD334ZtbKIA/xTcTbXJeSre4MtQClvCSWwS4hfMm6ILBuCfAXTcaUqCyQ51gAcPJWhfuUv/EPFktDeONmzM92pmsLbTmP2s/U9Q7Ujpu47lp2pVxHm4cb+ZcXxedHPUZclI226aTHa9XmHkL8kSA1B6JUnmYWsQHIK6mri/1pfoeqX8FllljEjxAxk9ztdym1pNFG+LVU4pi9fmwZiDlWCpJBIc62w+u0g7hKnjeOzi9aOJQFiO3qqM32sIP93canMdtdgU8vOYfT6ttMhSgDSCDQ57ohVT6hhpyPx9ch9FuaZrjyQ==
Received: from BYAPR05CA0059.namprd05.prod.outlook.com (2603:10b6:a03:74::36)
 by LV8PR12MB9452.namprd12.prod.outlook.com (2603:10b6:408:200::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Thu, 13 Jun
 2024 16:59:55 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:74:cafe::ae) by BYAPR05CA0059.outlook.office365.com
 (2603:10b6:a03:74::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.23 via Frontend
 Transport; Thu, 13 Jun 2024 16:59:54 +0000
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
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 16:59:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:41 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:39 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 03/21] drm/nouveau/nvkm: add nvkm_client_event()
Date: Fri, 14 Jun 2024 02:59:55 +1000
Message-ID: <20240613170046.88687-4-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|LV8PR12MB9452:EE_
X-MS-Office365-Filtering-Correlation-Id: 0492a8d3-84dc-4659-7ce6-08dc8bca3fb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i8y1kwm+LY6X1eZmFWeQrm2lu47hFMqvSN+iBRmxm2K4xp1KgjbctXY+dNBZ?=
 =?us-ascii?Q?pLhOEtSro89EwBQyV/k/z6/2EF+sDvTXeujcESanR+1MungeyKkPc3VK1XO/?=
 =?us-ascii?Q?by56vREgvgA4dLST7Z2qyzRD/mNwCt2TOpWxs6VIbYshYWV5WdZI8haewNOE?=
 =?us-ascii?Q?hXxXV+sPtiK/AOSsuxFxBzREBriVY/lURrVE919tNL7iUH7i6zleKF55AI1d?=
 =?us-ascii?Q?osMHPSP7a2NKspA+vYz1Nd95BIBvBCP7rkzT0OB/JDGLWxL27ALWEJ8PFEj6?=
 =?us-ascii?Q?a/0Yl+9hcMAf+woKqhccByWOVDyncTx3LARvryReM0oXGqEHk4p+Hj2Wgz2i?=
 =?us-ascii?Q?oaIuntYp8AZZ+jd7utljOdZVXmib4FJBdBI5WSooOlduWfudVO54j2bzMK+c?=
 =?us-ascii?Q?cZi2EKUAj+Xlww220HcOPl2UqCRVJe4Jklagf+L615V17fdBE+fXD9A8ucsL?=
 =?us-ascii?Q?H649a8vV1iJ2eD1SAKtpZL5SbOoOxUZqFepZiSqHXFQOI9slDTV6sE9m6x7j?=
 =?us-ascii?Q?XMGFPFX9DeRVV5AWJV+WMPkIBYXtZgJTvMSLosF05OMv396/r0wEayJQHkkN?=
 =?us-ascii?Q?Rf3NOdPF+SUxqb4jbnW8AesMCkxfweJc9TgiLDPVemo8FGm+HRi8Y8/9N2+3?=
 =?us-ascii?Q?xqu/YQ+l1vHi2kbjRJ9pH2TsgMv4MvWcPd4DK03/Zh1IWIMt/rN05W1hr9KZ?=
 =?us-ascii?Q?pwY6jN8nNzZcHmWX0EYagjFhqUnTjAUjlIIfTypY5E/bEZNTJmKQfp8dilp3?=
 =?us-ascii?Q?OCteUYpgOw8A2jmZFz2Tgq05ilA7zUE9iqrU7KrbACRVoKx4Iu7yWAxpAfqc?=
 =?us-ascii?Q?Br6KsHgDmmLWrznSnCN53K3Z21Qfw0I9TlARMu6eEsGEsDCVYPYS380JWNY/?=
 =?us-ascii?Q?JTXbWloLipj1y86/WWnseHHjA2Mu+kDlTYJaySb2REGUBuS4ZS86jpiEJZPG?=
 =?us-ascii?Q?Q/bbWCcJWrVmWbtEigLUeijVXicLxju2sqgXbgPePtXKtIz0agGMa7s2qVDB?=
 =?us-ascii?Q?KElYL/acguTtzz8FkCr65y6fk1h5XpWYNpexyqSeKgrDuRbNUdjWOQ8qDN3Z?=
 =?us-ascii?Q?+KhiQie+VMkgMI7xVCC/WaZ/HvNfvEjhM6pmE9bX9iG6oKx/ww39kolTE7dO?=
 =?us-ascii?Q?I7ui0q7OlNxtdzWmbs7snOSw9t6uhzkfIwtL4bN1KafXwbFSRwW47YyjcPXH?=
 =?us-ascii?Q?+B12DtTzwYWY2SBwJk4FmJEvm15PvyZNBCzeOOPdGbL9K6fCj6PqVTafgmHE?=
 =?us-ascii?Q?Oza+Kejg3Q7r2p5+AexZvQ7VPTgOx6OQ1knx+VONHjpNrfJNdZdARpRb4yb3?=
 =?us-ascii?Q?EgZngW11vSP9Bm1ni3pz1zS1BZqRQujNoifN8vMk8Idek/AYcUprCSQ8YXMF?=
 =?us-ascii?Q?wPmM8ItFtSvCB1xK7CjnnhYC4VLDNiWRkeZrHTDOfhRgGIYWbA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 16:59:54.7706 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0492a8d3-84dc-4659-7ce6-08dc8bca3fb1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9452
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

A later patch in this series moves the nvif_event callback function,
but all the callers directly dereference object->client->event().

Add a helper function so this only has to be changed in one place.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/client.h | 1 +
 drivers/gpu/drm/nouveau/nvkm/core/client.c         | 6 ++++++
 drivers/gpu/drm/nouveau/nvkm/core/uevent.c         | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c   | 6 +++---
 4 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h b/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
index 2da9dfbf0d56..5c9a54d4bd64 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
@@ -19,6 +19,7 @@ struct nvkm_client {
 
 int nvkm_client_new(const char *name, struct nvkm_device *, int (*event)(u64, void *, u32),
 		    const struct nvif_client_impl **, struct nvif_client_priv **);
+int nvkm_client_event(struct nvkm_client *client, u64 token, void *repv, u32 repc);
 
 /* logging for client-facing objects */
 #define nvif_printk(o,l,p,f,a...) do {                                         \
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
index 6471edda8a96..beb966d65daf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -31,6 +31,12 @@
 #include <nvif/event.h>
 #include <nvif/unpack.h>
 
+int
+nvkm_client_event(struct nvkm_client *client, u64 token, void *repv, u32 repc)
+{
+	return client->event(token, repv, repc);
+}
+
 static int
 nvkm_client_new_device(struct nvif_client_priv *client,
 		       const struct nvif_device_impl **pimpl, struct nvif_device_priv **ppriv)
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/uevent.c b/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
index 365e41134f3d..fccf6477d3d1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
@@ -111,7 +111,7 @@ nvkm_uevent_ntfy(struct nvkm_event_ntfy *ntfy, u32 bits)
 	if (uevent->func)
 		return uevent->func(uevent->parent, uevent->object.object, bits);
 
-	return client->event(uevent->object.object, NULL, 0);
+	return nvkm_client_event(client, uevent->object.object, NULL, 0);
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
index 9c7b83c99b80..4284e7b924fc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -50,7 +50,7 @@ nvkm_uconn_uevent_gsp(struct nvkm_object *object, u64 token, u32 bits)
 	if (bits & NVKM_DPYID_IRQ)
 		args.v0.types |= NVIF_CONN_EVENT_V0_IRQ;
 
-	return object->client->event(token, &args, sizeof(args.v0));
+	return nvkm_client_event(object->client, token, &args, sizeof(args.v0));
 }
 
 static int
@@ -67,7 +67,7 @@ nvkm_uconn_uevent_aux(struct nvkm_object *object, u64 token, u32 bits)
 	if (bits & NVKM_I2C_IRQ)
 		args.v0.types |= NVIF_CONN_EVENT_V0_IRQ;
 
-	return object->client->event(token, &args, sizeof(args.v0));
+	return nvkm_client_event(object->client, token, &args, sizeof(args.v0));
 }
 
 static int
@@ -82,7 +82,7 @@ nvkm_uconn_uevent_gpio(struct nvkm_object *object, u64 token, u32 bits)
 	if (bits & NVKM_GPIO_LO)
 		args.v0.types |= NVIF_CONN_EVENT_V0_UNPLUG;
 
-	return object->client->event(token, &args, sizeof(args.v0));
+	return nvkm_client_event(object->client, token, &args, sizeof(args.v0));
 }
 
 static bool
-- 
2.44.0

