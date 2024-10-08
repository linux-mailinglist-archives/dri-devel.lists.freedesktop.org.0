Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4044899506A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 15:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A400010E543;
	Tue,  8 Oct 2024 13:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IrpHnoFc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4F310E483;
 Tue,  8 Oct 2024 07:32:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldiNHi3GUbKXDthmSO0wmIsjsvd+NCrJ1PYpb2sWz0IcR0PcWGWSxeStKX/J5S1bA9cuufwz3smNQkFL7CfGO5/7C3pI9wPY0BmvNdlrh4pzeMVIBwxxZMec78H9X5YWRzPPIZonchiT/c9Z1qnOCkEOmA1SOepgrwGZ7y+GIByG4Q6HTuTNcMvb6fwjNiHsrVVsSsUYhjyUGQrksa6wurMb7drjaV6yFvbK5HvIXTc49zziAK3czEGD9mXAvQFMzmUVLRn/0kAK2XnRTLBscCOtCk56NbM8Xz+hegGlcFmAFccCt76zxzQocwd9N47rZ3XMKblw9eCouvPdTinbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zsi3hdTDSIIOdzaBiLD5Ls2B3gc889Mis68yruBpz8Q=;
 b=eOYT6lN6rvwwv5czu99zMcx3Zher2IqXLka2R8WiYCbeuWWIWXRpwrocruld7fjUEFAo7O0ivH4LcLeW2bGc78wZh+aJ/BqBSWf3yvUr1OtFuR393LRddov3UdStSUTO5tApytFTM+P8YCEXNO4DDDx9EcLwC0fgocqhfvVFVos+faEsG1F7VMbwLe4IDwzCNhisxrzucWwTewUwPnPd6UH3TC9r0Tsw6V6C/WJAiW5VD6AW2iFrbPCL1qddM92WB++0Nhe70VetZJsf/7o1m/RQZcLwbPVycSVWsoZmA71RWjypk6x2AYged/Gl1jDqyRl5nY7c0LmLMbJM3OrBhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zsi3hdTDSIIOdzaBiLD5Ls2B3gc889Mis68yruBpz8Q=;
 b=IrpHnoFcr/fiqrS10z8NDHoPlAWyM2L8mYFyr9eGepWoNtyZ/vvG2ZRQmy2/Peq1X7eyYsNdV3modc1gfGWu0s2GANjqARPBgubUJyHqHRelxM0A2/HC62sUmtQ3O5pts+pv5imkVKx8s5xcOfsrgX6JwdIJXWD5GSEt4rTWlpZo9LeUYBaBfI6v2kFA9T8AUVUA2t+365rl9eA3CesMvHpKLCYZtyVVqq7LrdbRIutkUaWQJf0QDO6kAd8pEzJ4TkLLyMacTtzqWTpxXk9FfCnfp34d97TPHw6nN8/L2QJW7FBpRRjVQfoulbWOUF2OITfcqBCDzOUIFQbOvFPEpw==
Received: from DS7PR05CA0029.namprd05.prod.outlook.com (2603:10b6:5:3b9::34)
 by CH3PR12MB8404.namprd12.prod.outlook.com (2603:10b6:610:12d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 07:32:27 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:3b9:cafe::4a) by DS7PR05CA0029.outlook.office365.com
 (2603:10b6:5:3b9::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16 via Frontend
 Transport; Tue, 8 Oct 2024 07:32:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 07:32:26 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 8 Oct 2024
 00:32:17 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 8 Oct 2024 00:32:16 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Tue, 8 Oct 2024 00:32:13 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <kherbst@redhat.com>, <lyude@redhat.com>, <dakr@redhat.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <bskeggs@nvidia.com>,
 <jglisse@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>
CC: Yonatan Maman <Ymaman@Nvidia.com>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH v3 1/2] nouveau/dmem: Fix privileged error in copy engine
 channel
Date: Tue, 8 Oct 2024 10:31:02 +0300
Message-ID: <20241008073103.987926-2-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008073103.987926-1-ymaman@nvidia.com>
References: <20241008073103.987926-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|CH3PR12MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ceb2b4c-db22-45f6-7f90-08dce76b5bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9zGXX0Zp7kglVZWMH6Bc/I+ja1KHhYAzOnAEpTgG3KXNqLLNe7YQmp/l7KbK?=
 =?us-ascii?Q?sgenGTHZXrDVPIdANBC/QbrYvtAPx5BIw0ns9d86uYqwsL3Fy3oAZjio0hsx?=
 =?us-ascii?Q?RjXMaPCAvYsM0EON90Rqv5LfeSpMStOnFgXQH3+4PggaDhj6v1PvZThbTsNK?=
 =?us-ascii?Q?kPIXVCKXFAGSrOG9eJqUYqCy4EUQzpJMkM/QjaCQXUKFqy6n2J7ro6eAu5K4?=
 =?us-ascii?Q?/ed8/q1MhaPm4cAcA/GN2lGTo+AuFatlgSeBl4sLIn7RPfPidOdc/i1+f5AS?=
 =?us-ascii?Q?Zc1m5GixWDSXl8SObMHY3QGFKxh8ZRlwiDxmrM5ftIdqVpSsk2cH3sEbMF+y?=
 =?us-ascii?Q?m1fcSj/NnfvbHp6cBuyIb1YsSy0p393zUB4B+UkRSzZnVg1ITE9qCSsAn/+o?=
 =?us-ascii?Q?YkC2DMgkgol/f+EMn3lnx8jkfUvcYBiALTkOGqgm8BPE2ZH7y3iu8WjmC5I7?=
 =?us-ascii?Q?wHwKUZPQEtpfMzT+AKDzDYDPmzabsc7gpuNRjjnTOYqqGHvl0Y8uSy0xU5K6?=
 =?us-ascii?Q?VyeQ5FEiCyIWcwyM27BNVBulI1FBLCfClhoANqyi7EdlOM1IWWbXQz64MDg3?=
 =?us-ascii?Q?BlH238Nsp8eFtJ8FrHaq+hosjKCtY+tlmFrJILCbjtniuCzqZ4m7q1UTOCtV?=
 =?us-ascii?Q?sJUH/GU1MiiYZR03eP1mQlTbc58EU8xKq4uY+bx+5hv61solTzC0gzyrjaZa?=
 =?us-ascii?Q?jMN8HADXxJ3Xx5AGyLHm9H5PWec67EFkAae7SxUGbtvtwhD153B09tCnyzt+?=
 =?us-ascii?Q?p0JlCGgAgTxFDhcJb7OSMJ9JWZUplnM8oHSUzh6d6X6FsozCYm3YwUrS+OE2?=
 =?us-ascii?Q?b+GrVnFtJqNzyRr8SqwtD7iZRK/pj7cVexyHzbb0zSLvD86K6uvwyuOuGe2x?=
 =?us-ascii?Q?g+JbQEFQvBJeEEhUUZURhfZbH3Ay1aJV0N4Vkzd28LJ1EbSXefz9njqi3ut+?=
 =?us-ascii?Q?dNB0W20xTugtqf51J+yQARqMl+jMnpv6rctgYuYFescPk+Vea9ruG+n7/AaM?=
 =?us-ascii?Q?ZwwK6USfvgZoFU3VFkj7mCnRqxti2bZBeyIOD8vRBj4gShZxcb43J6dIRHp5?=
 =?us-ascii?Q?OMvKsK2btFJThrXqXJgfsrjsulllWzIEK/nPuFLxaAftiiR6bVpbY6lXS53J?=
 =?us-ascii?Q?pm5392FQsoH9/nA6KmhejPPQb/H7NwRUiu5jjfSTvC40nr+RdFa2e4cbmAvo?=
 =?us-ascii?Q?ESm3g/kXKIGRd5ZKMtalyEaD8nMZ/3Zrr9kiWB9BfNFtMcSPpHafoSOJvfXa?=
 =?us-ascii?Q?1fgp0TDu+QYjB5Gc7oQwuBOeTZcL4rMdQHScVdPpe6T7hm8H8LMFQk5ROr4U?=
 =?us-ascii?Q?WK3n8mudxFRw1X+CroVQSyE/PfQ4YWXwMmS+2qI5yTxDivvonjMuTrtFSXzu?=
 =?us-ascii?Q?HhvmpmJPGzJpuQow60U9KSroqr9V?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 07:32:26.6521 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ceb2b4c-db22-45f6-7f90-08dce76b5bdb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8404
X-Mailman-Approved-At: Tue, 08 Oct 2024 13:41:08 +0000
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

From: Yonatan Maman <Ymaman@Nvidia.com>

When `nouveau_dmem_copy_one` is called, the following error occurs:

[272146.675156] nouveau 0000:06:00.0: fifo: PBDMA9: 00000004 [HCE_PRIV]
ch 1 00000300 00003386

This indicates that a copy push command triggered a Host Copy Engine
Privileged error on channel 1 (Copy Engine channel). To address this
issue, modify the Copy Engine channel to allow privileged push commands

Fixes: 6de125383a5c ("drm/nouveau/fifo: expose runlist topology info on all chipsets")
Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
Co-developed-by: Gal Shalom <GalShalom@Nvidia.com>
Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a58c31089613..0a75ce4c5021 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -356,7 +356,7 @@ nouveau_accel_ce_init(struct nouveau_drm *drm)
 		return;
 	}
 
-	ret = nouveau_channel_new(drm, device, false, runm, NvDmaFB, NvDmaTT, &drm->cechan);
+	ret = nouveau_channel_new(drm, device, true, runm, NvDmaFB, NvDmaTT, &drm->cechan);
 	if (ret)
 		NV_ERROR(drm, "failed to create ce channel, %d\n", ret);
 }
-- 
2.34.1

