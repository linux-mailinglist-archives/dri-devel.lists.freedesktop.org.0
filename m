Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC37907918
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0F210EB22;
	Thu, 13 Jun 2024 17:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="amdXAAgV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23A510EB06;
 Thu, 13 Jun 2024 17:00:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=foPjeOhiPvTcic8Jw1IX8FJk1Bca2S0VJg/xdZAUMGXb81aBhOEEgV0sjXlF6kmieI3WymUo9dSnbwpx6bFkxHariSUq5alX9k0ir35InrEXaCoIFgyWcYYEMSdH6NGX9Y61AG/k1jBuFBnEKx7l0YqU38GgHODYKqXZ0+8Q0by99B39gB9TlbA944JqHSk8dSsly0ok1U723uKXCoQj6V4pxBwrKSMIbEG2NsHzJNNISAsAM3tWaHWCbCStvDlEfCGLdHop8ACuwOgJL1oC1BrQnQe1nuZfZLiPZ/Kng3XDrgZRmuZnFr/lhC5gK52whkGNRJNiTsT6LMW7gEsBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZR4dcqhN9w5AabxzoD29gQeV+VNaORpylxFAAmPQno=;
 b=k4B+LbM2L19pUyklrcSvWozV8/+0L9rEExWCts7VhBzpIvdweBYbaHjogvsgOLOEcGil8IfDLhbZLoISXsjMnNBzdhpV9gaSGMxDKCCeaBl1Cy5NGS54IjtiUG5SYygPFR/QvU8GTmCn3Z78nc6vEEsDC2FLBLasMVGTUDb4Ab7QnyJD0rl3R/cnGPiUf6gxiaWb1TbaiIxYo3MpGyKXwS3f1iurMg41oQ/H9MIMr9jNoqaH2MeHzyGGqHWvDDebpWLKr/MOOp/zKYA8TC2MMqgSeu60pi8m3j2EJJjGI+TwcYNcyXnX3ukB5PSqrT1Dn6VbD8ngN8KAVtgPMdTvEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZR4dcqhN9w5AabxzoD29gQeV+VNaORpylxFAAmPQno=;
 b=amdXAAgVcEYgrQnkk0yL/TU5mZNKTn/68A8h7qwZa6qaNPJgEhMzRL1cA2PI03CLQvltBVEOQyvn8IpoJw8FmJV0vLPG7BlmyOTdAI6f/oxRk5ro7cOEstf0bsqrfdjck+ZCUV42vmBTJvnMPCXpryDjaIvA1IhkI3lDNeUULTk4qxktAzFwKSEpZmkGIfsdDPR2dmmgsgWgr+MhdsydveaMAQm6AKzIabh4L5ISfPSjb/bdoBfZoVWlj+J3JUawK97LaxAdWPNUgODQIqxNc7Oy4iAePai1XzAKn5Bc6wthRMGBBvCDsie+7ngRBtX7iq7RMX5/Y6VTv9qsYVcC+w==
Received: from SN4PR0501CA0059.namprd05.prod.outlook.com
 (2603:10b6:803:41::36) by LV8PR12MB9333.namprd12.prod.outlook.com
 (2603:10b6:408:1fa::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 17:00:10 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:803:41:cafe::6f) by SN4PR0501CA0059.outlook.office365.com
 (2603:10b6:803:41::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21 via Frontend
 Transport; Thu, 13 Jun 2024 17:00:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 17:00:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:56 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:54 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 13/21] drm/nouveau/nvkm: move pci probe() defer from drm
Date: Fri, 14 Jun 2024 03:00:05 +1000
Message-ID: <20240613170046.88687-14-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|LV8PR12MB9333:EE_
X-MS-Office365-Filtering-Correlation-Id: df40ad2f-4da9-47e8-65b8-08dc8bca48a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hfeWz2oquwkdPXApF5tbrDkmj5U+UuzMWRkz2bpmhBfiAyxQu/T0N1DRLeL7?=
 =?us-ascii?Q?yhPXiUxrxhW+7LkpD9HgcHfbje9V+7GXnlwMP1+4rT7/8LkFlxOpeZprRvGj?=
 =?us-ascii?Q?grcFAzPjcUprxZsXXOFc25atxR6OWnpapmtAEnz3UqmK5PPgM083cvC9t8vL?=
 =?us-ascii?Q?ovj9e48DAKGFLgMb+orDM9fXbJuoe+6NBYtLXlVWA+2R8o/p7KnUV45HgxLR?=
 =?us-ascii?Q?U3qYBARDD4NnED8pGe2cNvY9gU0IMNejg5ea92kD6hkDGsiDpfh5PrI39s7a?=
 =?us-ascii?Q?0aD1/512yH5ty2nF+z+VQQPjL8iyI5cmOnItOQRM3tPPaMRKQJd9k3ekmWx1?=
 =?us-ascii?Q?ZtDtgC+pTaIfP8c6FD3l9JoFrF0hXxj35k0VRzYDglrqpQWJOnTyX0jaPb7J?=
 =?us-ascii?Q?S67xKyUvbiVfe/eE7TjYLTM0MJBEpk5+nUsqpTWtp1vnWt43NSTCegTqJFQH?=
 =?us-ascii?Q?1KFLPNK8xotwqtAKqODaaKLKnRcEyivxXmQhym0z4lzO/7qOgfqPkTd5cIXR?=
 =?us-ascii?Q?bT4sBbE9cA1Ue4XX1Q6L6T5fmIWwjClww7LLVSpyCLIXrF/d9Zbx0Nrtshgl?=
 =?us-ascii?Q?78JtchsFOpfV8sx6ujLvwAUj6jN/t7OtVihZhnktmiNYGq9Eq+gE9aNJEeim?=
 =?us-ascii?Q?vlgY094que/dq9UXQD+ceqJQTSwER3W0CJKIs1OJMgXeUmpdZPQwAAJWoSxQ?=
 =?us-ascii?Q?b5RaBbffs2c8M65297RB148ZRp5q6Zpo0OssyL3D8e9bS4HkP+hZ8A3nHKnV?=
 =?us-ascii?Q?LefnyZy+Gc8a1efH9gnCR+kfBe+7db+Yjn3S2FSUVmyWGTPvK7KJ2Gwh6p48?=
 =?us-ascii?Q?B4/WxFoo7OZz+ktUY6PbTxxfKaqKcZPzuf9bHo1wxNHAR3wulUWgGNueyHfz?=
 =?us-ascii?Q?Hz6T4vjXTr2nNIMuSHY4G62nv1bRxLAYfzJsp4eE5fdD98n4ZKqOqzH6wJAC?=
 =?us-ascii?Q?Vfy7B/oONzoBFlJi5rhyvPuMAi7+2zE3JsQOfm8XurQ5izxIEe+YJz8LtHMW?=
 =?us-ascii?Q?UQxjOvI30hgGMVIMtNul/l5SyZtomHt8blRChtfP6Ph1u1dcrje09JkveNZZ?=
 =?us-ascii?Q?ymXwdmSIAQpkSJUF1WQ5U6Sa0wV7dXC7M8EZDt+B6ff0+d6bqgUmedk1mUzr?=
 =?us-ascii?Q?4eIwKyaNi2nqCl+vRHPsqaAkl49AvntyI4z1hpSwr0YRUI0orvkPTkTMxJlm?=
 =?us-ascii?Q?PSrbyuHJ7coRBAY736t+N/F7rwXAN4hyV6X8SE7eq5+5B6R1kmj92d/K3Dny?=
 =?us-ascii?Q?byHYiM8D9+rI71ANg8ADsKvSADAZgp1+cXgDCWCCYBRh9FuSfduQtrt6GS6F?=
 =?us-ascii?Q?Tomq9d+T6TYu12fUCUJ6pmPJlDZoxNJB+XVpCOCei0TAglFRCsfRGVNwmRA+?=
 =?us-ascii?Q?cK4gA1nx98y/js/D8fSLkzSMQGTrg7F6+1CJn3Fv2HbyVZRLxA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 17:00:09.7077 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df40ad2f-4da9-47e8-65b8-08dc8bca48a9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9333
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

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c     | 3 ---
 drivers/gpu/drm/nouveau/nvkm/device/pci.c | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 632635c16b88..3f1f93fa7029 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -795,9 +795,6 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	struct nouveau_drm *drm;
 	int ret;
 
-	if (vga_switcheroo_client_probe_defer(pdev))
-		return -EPROBE_DEFER;
-
 	/* We need to check that the chipset is supported before booting
 	 * fbdev off the hardware, as there's no way to put it back.
 	 */
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/pci.c b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
index be6433eab814..21ca094df54f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/pci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
@@ -26,6 +26,8 @@
 #include "acpi.h"
 #include "priv.h"
 
+#include <linux/vga_switcheroo.h>
+
 struct nvkm_device_pci_device {
 	u16 device;
 	const char *name;
@@ -1648,6 +1650,9 @@ nvkm_device_pci_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 	struct nvkm_device *device;
 	int ret, bits;
 
+	if (vga_switcheroo_client_probe_defer(pci_dev))
+		return -EPROBE_DEFER;
+
 	switch (pci_dev->vendor) {
 	case 0x10de: pcid = nvkm_device_pci_10de; break;
 	default:
-- 
2.44.0

