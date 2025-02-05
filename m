Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7DBA2841A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 07:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD9A10E0AD;
	Wed,  5 Feb 2025 06:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mgxHGQGL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE9E10E0AD
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 06:11:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qrykIHq4LRD3jKlVLV9qmSxQWCRFm65UGFLHoy4NrL6fEjb0YiuAGyn+h7M+9ojIdLLRKGIkJvB1mrzzIuH0KyhoK2KB69IqazyFOptFjCWadPoaJNDLxsYVGzvmRThgol1gp3wRAf8aJ5+4pb40To06U+KLCq/yuiV70IYie3rUBpvQj3y9nsEbod+oz2wLtuS3JsOzWdcgobHINNqBThEmMUzcKiIDROFYKAZWRd7SOjnn0l7Z8k4ibgN0DO9VWL5qUx4PV+y1WGl9Cg+6R3cs63xUILjkK2SCu+NWpDCvta2yFI7W/7p3aNTCACTq/3D+vL0MtEccyPN3HJBvgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ARqqPFxZzAuGJkJ8ImLRBb98Il2tj4HUMobywlts6E=;
 b=OG9G16PcOl88qTNeJiZtkTKu0p+EPIsKf9P1TfppvTmUQb+FmQsdki/CfKRoCYTtu0m5uMpJ9/SyWJL+KgoUoh23GIaKAgEF4fwRwIAqljY+i73stwEBBrTXLbtp2I2RzD5fmMD7oEUqSeg/FfA/gVgr7yFENMATb3c6+lr6UQrnU4l4vu9oh7eNqBJuFHWs02OWBaZYPW27KNYvkcZh7zyFr9tBjbgZm5x3+sjS31oMkZekTX7eQ4zgKv/YECmQW6cWX6ls1vB4BIR4+aQVuHvHhKSpcEq0AkzjfP7tlZdmMJ9F/0ALYv7/A6PvvVcS+7IBO2PlwcYkaW6V8e7/ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ARqqPFxZzAuGJkJ8ImLRBb98Il2tj4HUMobywlts6E=;
 b=mgxHGQGLuHGLyTwqg+5L9S4SXA2ZXMGfbRSVni79JIwc93gR44NxO5zGjnB3XNLDQbgsT8VmrDxD2Iu8PQ3qwWMKpcKfctziDyueOiCEF/4mPLRTRlrrYo7J3bFk7mX8Uvayrfo/7diJd+ErY8WO7Ir0xDVza9e5zVphfbsPkUTz2j9yXqMjWQ3vmqwwpwyha/xo7+3bxmt+yz+LfA+e4CxmkXsg5QQgfepa+p7hKCLa0CY/KU0HvEf6a9pjj9roBXuSiVD+P9fHAgF/dlqnuEgaWuYOt1RvSHm5ZJy3VhRsO9EYkCM4ZC0wIbq/a/M0HDPW6N8plDtW0FqtR+twwA==
Received: from PH7PR10CA0005.namprd10.prod.outlook.com (2603:10b6:510:23d::11)
 by DS7PR12MB6021.namprd12.prod.outlook.com (2603:10b6:8:87::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.23; Wed, 5 Feb 2025 06:11:04 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::14) by PH7PR10CA0005.outlook.office365.com
 (2603:10b6:510:23d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.27 via Frontend Transport; Wed,
 5 Feb 2025 06:11:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Wed, 5 Feb 2025 06:11:03 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 4 Feb 2025
 22:10:42 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 4 Feb
 2025 22:10:42 -0800
Received: from build-mperttunen-jammy-20250115.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 4 Feb 2025 22:10:42 -0800
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>, "Mikko
 Perttunen" <mperttunen@nvidia.com>, Ivan Raul Guadarrama
 <iguadarrama@nvidia.com>
Subject: [PATCH] drm/tegra: falcon: Pipeline firmware copy
Date: Wed, 5 Feb 2025 06:10:27 +0000
Message-ID: <20250205061027.1205748-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|DS7PR12MB6021:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e628b58-c990-4d76-a836-08dd45abdec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aAp0b6i+1Ia1b7fDLOppFzVxxbIjNJci07vHejHuxBRCU2taJcokN6qFvH5+?=
 =?us-ascii?Q?BY07e1if63rF96nwyF+C6MafMd7XhX/1zYFvKX+T6Ski4MtHd/uEu1T2jg/4?=
 =?us-ascii?Q?H+6TRQOudhN3eT5gyjsYgWDVg60b2Wo6g9D8GI8orrbOBfDKCggmVotXfyyT?=
 =?us-ascii?Q?O8ESD0u9b74gqPN6TgIegiQNR3dsC1UW25HsyWvPxQPvM/1Qg98GqAbRFsFe?=
 =?us-ascii?Q?uYBvTBEJPthxmeIXSi3kQsG8cxLBYgpANNn/Kzv9DPZkX1YBBN+r83m5EgQU?=
 =?us-ascii?Q?mZ8aoCb1N0QP6CUjqddkLQROJBkm+KT28eVCUCXm/CZT4D3ms0B+hmnhJh9g?=
 =?us-ascii?Q?TBLGcluGCzTM6YJsVcX3m0x3QMkc31mN6BB6CH3GRCJjqe17fE+9qGasK8al?=
 =?us-ascii?Q?fGzTVxoCsQcYX0Z79/WmqKgPjRydyS6Na3HuGU9uPk/OdeYJsaJwFqbqGwLF?=
 =?us-ascii?Q?poOBiIcYq3HC8M2AyYhQ9jN5TO+1C7h0qaH93FBHvzaNI0bIao+6c0FamFj/?=
 =?us-ascii?Q?DkOAWpXvOc2l9MrmHljTK7OarM5B+Vh8n+TlE6GO1yRfm/3/LCP8xlhFDVZr?=
 =?us-ascii?Q?EdhDyJvhTLKI07D9AGy1xZTBIDizIARLMrqa3+p7r+rLU5ab5MG3Y+Z/l1FF?=
 =?us-ascii?Q?56jnVP2nUSlu2DslZ4/j5T7yw9KHU/bY2vmGcI/G3Je72N4Lz+iXwNqf5ULk?=
 =?us-ascii?Q?lW5ZqIIsGN1XvuoYeRkR7oI9uaE6coVorbMJPlHpYZKZwjbwfT8ny8YI98kf?=
 =?us-ascii?Q?CcKxQB/SoYkh9LzF+N3sIZXqo9/tJoU0ZzvBSwVvuL+LYPNe9OotyTEwfMwh?=
 =?us-ascii?Q?TPIyMN5ad7sx5jmInu8vrEUCGi/tEOuBzIvJWr+nHBjPxLFTWAmaH4z4MgeT?=
 =?us-ascii?Q?ErC0zlgP2yuzsVKjfClgilCkCpHtqwKsimzuQAvQ5oww/ikoQM6oB3YSFX8s?=
 =?us-ascii?Q?L1eAH6nkzLp1fQgMH9rIC5VNdCSKe4fWhGCXEFRtJd7pqPPxwK0oe3A+HdeY?=
 =?us-ascii?Q?bhhMgl6BE0z2lGe3uaH2MwahZjokA6QmQseOuN0PeFjgatpc2jm65UhiKHP9?=
 =?us-ascii?Q?c6DqRb13di1PVDlM/E4blB3bap9u7jn+j1zCDX3CxQ5ExGL+eHDRomepBKnK?=
 =?us-ascii?Q?FTbYX3nEw6KP9nE0wqD8e/Vei3VckZpkk7+W8EmvRKq/971hbms/UBKOS8Lt?=
 =?us-ascii?Q?VTvVKFNhRLJmu+UeChUmLYZMA9FGAyfC1ve7IBMVHT26JonPp8fkkPUm3hta?=
 =?us-ascii?Q?SIccuqqeQY37YCdV0drfJK6v+NQvfutLAj1BfWeYL3v405cgRYWdVJ6da8b+?=
 =?us-ascii?Q?NsP3kBD0tTqfSOnCdurNtydHIAL5HPK8sHlWOl1V3nIWU1D3rcHLACMWZoHL?=
 =?us-ascii?Q?n8MEDoBxuP+Yo2lXt/Mifw5Nk5LkrcvlUz8dyVGMCOZiVQSOmW0tHRr7ixd5?=
 =?us-ascii?Q?PBDlaPmEq7D6mIlWuDL0usL9kHkLuhxFMrVzXiHQGTN4EXV6zFuDlS6cuusS?=
 =?us-ascii?Q?wMzckRi01gyiz2Q=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 06:11:03.3939 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e628b58-c990-4d76-a836-08dd45abdec2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6021
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

The Falcon DMA engine allows queueing multiple operations for
improved performance. Do this to optimize firmware loading.
A performance improvement of 4x to 6x is observed.

Co-developed-by: Ivan Raul Guadarrama <iguadarrama@nvidia.com>
Signed-off-by: Ivan Raul Guadarrama <iguadarrama@nvidia.com>
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/falcon.c | 20 +++++++++++++++++++-
 drivers/gpu/drm/tegra/falcon.h |  1 +
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/falcon.c b/drivers/gpu/drm/tegra/falcon.c
index c0d85463eb1a..17f616bbcb45 100644
--- a/drivers/gpu/drm/tegra/falcon.c
+++ b/drivers/gpu/drm/tegra/falcon.c
@@ -30,6 +30,14 @@ int falcon_wait_idle(struct falcon *falcon)
 				  (value == 0), 10, 100000);
 }
 
+static int falcon_dma_wait_not_full(struct falcon *falcon)
+{
+	u32 value;
+
+	return readl_poll_timeout(falcon->regs + FALCON_DMATRFCMD, value,
+				  !(value & FALCON_DMATRFCMD_FULL), 10, 100000);
+}
+
 static int falcon_dma_wait_idle(struct falcon *falcon)
 {
 	u32 value;
@@ -44,6 +52,7 @@ static int falcon_copy_chunk(struct falcon *falcon,
 			     enum falcon_memory target)
 {
 	u32 cmd = FALCON_DMATRFCMD_SIZE_256B;
+	int err;
 
 	if (target == FALCON_MEMORY_IMEM)
 		cmd |= FALCON_DMATRFCMD_IMEM;
@@ -56,11 +65,15 @@ static int falcon_copy_chunk(struct falcon *falcon,
 	 */
 	cmd |= FALCON_DMATRFCMD_DMACTX(1);
 
+	err = falcon_dma_wait_not_full(falcon);
+	if (err < 0)
+		return err;
+
 	falcon_writel(falcon, offset, FALCON_DMATRFMOFFS);
 	falcon_writel(falcon, base, FALCON_DMATRFFBOFFS);
 	falcon_writel(falcon, cmd, FALCON_DMATRFCMD);
 
-	return falcon_dma_wait_idle(falcon);
+	return 0;
 }
 
 static void falcon_copy_firmware_image(struct falcon *falcon,
@@ -191,6 +204,11 @@ int falcon_boot(struct falcon *falcon)
 		falcon_copy_chunk(falcon, falcon->firmware.code.offset + offset,
 				  offset, FALCON_MEMORY_IMEM);
 
+	/* wait for DMA to complete */
+	err = falcon_dma_wait_idle(falcon);
+	if (err < 0)
+		return err;
+
 	/* setup falcon interrupts */
 	falcon_writel(falcon, FALCON_IRQMSET_EXT(0xff) |
 			      FALCON_IRQMSET_SWGEN1 |
diff --git a/drivers/gpu/drm/tegra/falcon.h b/drivers/gpu/drm/tegra/falcon.h
index 1955cf11a8a6..902bb7e4fd0f 100644
--- a/drivers/gpu/drm/tegra/falcon.h
+++ b/drivers/gpu/drm/tegra/falcon.h
@@ -47,6 +47,7 @@
 #define FALCON_DMATRFMOFFS			0x00001114
 
 #define FALCON_DMATRFCMD			0x00001118
+#define FALCON_DMATRFCMD_FULL			(1 << 0)
 #define FALCON_DMATRFCMD_IDLE			(1 << 1)
 #define FALCON_DMATRFCMD_IMEM			(1 << 4)
 #define FALCON_DMATRFCMD_SIZE_256B		(6 << 8)
-- 
2.34.1

