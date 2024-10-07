Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E761995061
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 15:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9A410E53B;
	Tue,  8 Oct 2024 13:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NUNYKehg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6C910E39C;
 Mon,  7 Oct 2024 13:28:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uz8j6Cl50kq4a8+RUXpXKDLwxfqh3AmzhZfzkmEx5/OnAXyyJa2++krnSW7oXpROZodzTKYJhSEY+0+WDlM37DMS7MfJasfRoLrtGVJs1hVhnc/mW5QOeba8S6YzayVwGmvSMKCLTcZE0jtGIrdhs9M98rIpcQe50hb36WDVStZ1vovzX0HPRJ+ltMXYVCI4gzsizSlDYBCIuWyd/+GYAkU/YQ8vHEk23BMNLYZhKGKXVCwLkM911HMfF0gs88OPPugOKqae4IWsinUbbqm9I4c97cbIwuZT/ytkOT9r/ZXQ4+mwC7CHlLrqFDil2/jHyt6ZVgFdibz6Yys8VQRs9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yc0vr3Oaipy3DQgxxS17zmhM1umZ/mhtBXAgAxLaowI=;
 b=kLSf+o7e6bsczH7uybjRbTVWfSsHYZcTAGGVT9WXT8+ouq0XjHCrKso7x9YuySxU1UXgsPDQKVQsw4xITPsTlLcuB3i839CkJfnKw07zb0kKhjRqZEhPvVFmXrVcxDQcXD5zSrC8jOXDLJkqYB0yA9klwfh0huyYog+ns8QgWRKnVqTpaWb1ra+evRsGnLKTWWy26wJIMHBTpKUlV0vMClGKsAb17tdfJdGbMpU0mkroJzpG0lowU+8p37zK3YZUuXWkuSFN2XvNhur2C/F+sBu9XfBtQeg1WM+8oZEOAXVvm0Z095gGrLd9zT0rRxZ+Ti7vzPsuepLlfEH9FMKsKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yc0vr3Oaipy3DQgxxS17zmhM1umZ/mhtBXAgAxLaowI=;
 b=NUNYKehgCRLRHqzkywqDLhNNsg6D3z0ifFxo/oR8Wuv1k+iRNy+uAB/LIAILA27HMeADGCa9uO3SNbKAsBM7YrnFxj67cryrDEHb4CcgEQeJJtc2V1S8tUljUkTC82TPAeXu/PrER6Ce+iiWPQrL0O5iaDWtmlYSF7HOujfP/DpwPM8uGKVP4sO79AMB/aCwoLhBCXYNXo3DNhCtwFBdARBuTwZQ6Wj4v+U1nCzj1IlI11cICRQQsGmHeaUG9otRYlMBeUhl97EuolMbtNTlTa3W4hupChW5pTIA0kmzsU9k3PbsABK5L9I2ClAUf7Ku/fXU2EAkkRXKt9LDKzPAdg==
Received: from PH0PR07CA0012.namprd07.prod.outlook.com (2603:10b6:510:5::17)
 by LV8PR12MB9334.namprd12.prod.outlook.com (2603:10b6:408:20b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 13:28:52 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::c9) by PH0PR07CA0012.outlook.office365.com
 (2603:10b6:510:5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Mon, 7 Oct 2024 13:28:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 13:28:52 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 7 Oct 2024
 06:28:44 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 7 Oct 2024 06:28:44 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Mon, 7 Oct 2024 06:28:41 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <kherbst@redhat.com>, <lyude@redhat.com>, <dakr@redhat.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <bskeggs@nvidia.com>,
 <jglisse@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>
CC: Yonatan Maman <Ymaman@Nvidia.com>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH v2 1/2] nouveau/dmem: Fix privileged error in copy engine
 channel
Date: Mon, 7 Oct 2024 16:26:59 +0300
Message-ID: <20241007132700.982800-2-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007132700.982800-1-ymaman@nvidia.com>
References: <20241007132700.982800-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|LV8PR12MB9334:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd071c2-0124-4f2a-5899-08dce6d3fc23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|7416014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fN5I8CrU5/mqEOZ+Z7NTngHmLKmbZEXpKFmBDo19pQTEZaEJMVzPGZvsDURp?=
 =?us-ascii?Q?isSjIJPjmzSH/c17WkfRoa8azvLNpPg5fPrx5v1HbIMRDRJzeO5qq6yt/JOi?=
 =?us-ascii?Q?r4ZQkdg/ICbguPaCNv5Wn1rhzMSE7sZSJ1xujPgRVyCed05EkqfmEq2B2l74?=
 =?us-ascii?Q?uwIC4exAixvGMVcGF46WZ0bEdREvcHyYXBjDm0SZotkFOUfmH8c0jIsU0GUo?=
 =?us-ascii?Q?hisS+p1bpYA1P+gxfusbzB0ZmJHopB/T8ui9/bobB+Q5gRgR37/17JrPS5Jc?=
 =?us-ascii?Q?HZSnQMDpb4jTERJ1fc5M2e27W8YdgSRjura+rPC1T7xcGZTd3LrNOndjEEyn?=
 =?us-ascii?Q?veEDAnW2VjMep4t6krxsbFcUtTkL1VU2lJvJTD8F+fBAQG5ry0zgSZ1/QGAh?=
 =?us-ascii?Q?6IHL0gH3EmO7WhcbgOlAiaepteQaZxQBXaDA00c51LNAuwFJ648ja9+AZJHZ?=
 =?us-ascii?Q?dOuKojhdaH36Qk5bBxQ/bNDOLqfmzunf1uRk6OkhkapWvaSGY+6Wsq932qIw?=
 =?us-ascii?Q?aLtBPzQ60hK0saxpz9gjT349PZfTJaDJLkugDUjtlH5fSWmnkAFn5RononCz?=
 =?us-ascii?Q?1Fpunr2lKxEqRuQF/PmfZy7z41578+sxgfDX3AcfSdMswiGtTAnOrcfisV0q?=
 =?us-ascii?Q?ssgwknS0sHE+NUAnxGe9N7gi3yTIbNjxY+rz8T5XACmq+1BhM2XVUT0A5SSE?=
 =?us-ascii?Q?jdln3hGxQNs0RWGojsH1c4qpkou03FJauN75dTIUtd2xr44liAZSfRu6xfgM?=
 =?us-ascii?Q?2AeeTlMCietqJKLeW3IsdMVHKRYuSITQLKyBenXz4DNqs/prXihFvT37XIJ2?=
 =?us-ascii?Q?wNY/H1KFuPuuP4Ae8PSSw7/Vs8DMfP8XfnwQyAmOu3xGkTCtFmIhkJV8q5aH?=
 =?us-ascii?Q?BZOBdbatHEFIoadRuMwx4UTmJAOJ2uC/lylcg5i32H4F54p+xMqH45Xhzlfr?=
 =?us-ascii?Q?QrTbMkADcNZcf6oemWoZ/0PtyCjl/CtqX/IaZ4S5Bf7GW0yetAWTpORkIAZS?=
 =?us-ascii?Q?C+CKnRZ5oER43SMPz4y33IgS4zjZG03na/DeuWLqMZdROpSvB5WuKcNMhVaY?=
 =?us-ascii?Q?emTD10EyBkYSMUOQ2VBOqoB6a2A4jVHflKP2vNVcp9T6qI0hDOL7rCGbkW6T?=
 =?us-ascii?Q?MfuBpfHl9lQAq+FPwL69bJAAE+japp4jGb7L60iX9CPiY2wI3/wv48ixzv12?=
 =?us-ascii?Q?9TkdLGyPdSymF6d9oEmT/uFEEQVICD7gt0dnisjgmGQ/yH35EjgMa9yZe/uW?=
 =?us-ascii?Q?ZPBqXSMU7BTcVbk3eL14A7wbSJYFyHdmjaVT6PcD1G1UjANn62S6X9ApzjeG?=
 =?us-ascii?Q?HfPOBv3udeIzpfDTA2Tx27j+DBSOBiNKfiNmgSvZ4BacPeV70kHjPSJA/tTQ?=
 =?us-ascii?Q?9iHpnOmIuQBJoW5GENJsHYwxu1VI?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 13:28:52.1180 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd071c2-0124-4f2a-5899-08dce6d3fc23
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9334
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

