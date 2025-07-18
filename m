Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B67DFB0A37F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 13:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECC010E97B;
	Fri, 18 Jul 2025 11:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bdptE/iF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B1D10E978;
 Fri, 18 Jul 2025 11:51:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EFbv+ioVmcuP0zdqJazqnhWrqX+jelRL9iCf2ZZnA0yNYlyv3TL51ttX9krUYOortD4rM+Cn83ig2ECUGy4s0Vs0eaH6ZqpuqgeKS/JgdJwLCuidCh3DiAueU66UAmeHtP+XkKj1xermn+1NF+iCIkQQqwKqze3FwizJKblXWvT+tBL9vNGwU/Og2PFWOSlOAL5/saqA39Tv9erOBsmvKo4wweYgWerkHEH4wEbVjZjo9XPTDcGQIh4Vy4r712HLzUGh7Mj3xS7kdLgH/sxhb6v0rtsMWEFAHwKFWWhF9zmOJKqQGRim+/EHms7UjOhDvjT2jLip4pR5tD2ATjoYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpNyWn/Y9z++tqDbRoF9uJkiN0p+t/J0r5lqKcU8ZTE=;
 b=Wu3EnNuSdNGs5/DB4RbhnfYduntIppYKB00fFVJnV4oQmFJ4EOgXgUbfu1VMwB30tlU97iUXLn+VH8L9RRHAq0j3BFgQoBJnzZe2uroU+/Ufyo1uESkKV0hNASEfO8iHCAPPtpH8zDbkPUD3enc4+lCAoWL3pvFNpLu5Z44+2DPIAe7pbPPD6hpbw0DzPFTEePoDonPXQzFx+Yw8oK7PGMuiUTGoSrgzPcIkdCd/c4F2vM7LDIk/FZMkWbv1UJOXdRoJcBJqRDEqjJmvOpLxa0dmXikuiepp6rcY4QiQ/1OnEXz354rh8aBWl+co1pznzh29XGbYpS4l8/M+bYpUjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpNyWn/Y9z++tqDbRoF9uJkiN0p+t/J0r5lqKcU8ZTE=;
 b=bdptE/iF1C8yicGVzZr/RR5IQUSuEfrm1epwHIiDpJJlPUuDyxu+e7MtrxZr/tCXY9caXm9PkeftHUIhb3nScpVd/zfvLnKr0o8nYMZMVKMjoJv+xEWiP1tIzo+i0omHICo/C6fTPiCbmpYlz4jWSkE9AbR9G+LTJK8FB7lLvvv+0kOLlBzpLFNX1fAN6zEDbz0WNGgxWidw/GuH4a1iAklbunyHUZXhpX2GD6KjYC54rpoi9tejV64DTqRBZ/ujh0rbFuD1H32ORECEd+DU8yu+8rD8ht0EUUU3a1oLasz1R39ipc51lCbIuItsdDnyJJgDm2l7AO6Phf+yq9tqGw==
Received: from SA1P222CA0098.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::8)
 by DM4PR12MB6328.namprd12.prod.outlook.com (2603:10b6:8:a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Fri, 18 Jul
 2025 11:51:56 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:35e:cafe::5b) by SA1P222CA0098.outlook.office365.com
 (2603:10b6:806:35e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Fri,
 18 Jul 2025 11:51:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 11:51:56 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 18 Jul
 2025 04:51:38 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 18 Jul
 2025 04:51:37 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Fri, 18
 Jul 2025 04:51:32 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>
CC: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple
 <apopple@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, Michael Guralnik
 <michaelgur@nvidia.com>, Or Har-Toov <ohartoov@nvidia.com>, Daisuke Matsuda
 <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>, <linux-mm@kvack.org>,
 <linux-rdma@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Yonatan
 Maman" <Ymaman@Nvidia.com>
Subject: [PATCH v2 0/5] *** GPU Direct RDMA (P2P DMA) for Device Private Pages
 ***
Date: Fri, 18 Jul 2025 14:51:07 +0300
Message-ID: <20250718115112.3881129-1-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|DM4PR12MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a6f0fb2-4aa0-4115-0f00-08ddc5f17edb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|7416014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x73bhzORsKHwN8kXXZZM5SgBabPz2TDJrZF6ZGXWWv46AyglE5s+CYWQoUhd?=
 =?us-ascii?Q?qFK7CWi8GbjF6AtL00dcYhsb5no5vfRPNXZwnfNflHfSpunDVmvPw0aOgcYF?=
 =?us-ascii?Q?3pWCSoM36DW5sChqhx/WYYb9YhFSCQSCV8YcjY2SLfeW/KSAx5Cfb/AmUayG?=
 =?us-ascii?Q?SZfQDZaNs9DDT+EJMUKo/aNATJqTlr5rRRvS03NI2zC/sBXUF7almE+W/ueO?=
 =?us-ascii?Q?ou7f6avrJhW+oyAuta6is+yxjLZ0koFgsUQQvzr04PQbE0vT1Y9VfSash71V?=
 =?us-ascii?Q?9CprB877w54S3ez0zcV4Vn0+Rs50wDuYhyevx3I5b5aBkgWtpJ6gp29VJN+8?=
 =?us-ascii?Q?G9/07Ywq2xI8V1KF8MYpQ3PUlIq6WKraA3aC/d8Oj4d73wDGhu3LoPoJvMu1?=
 =?us-ascii?Q?Abyz2ct1EDkkpY0VAtftg8orWIGOYAXAmXHpwzsVSAw5LqkTSXuRydIrjnru?=
 =?us-ascii?Q?CvRopdsPEISuGW8F/BgOSA+3TrsKQAGctRLnZDbme3Gu+YPVJYWsJXuosw1l?=
 =?us-ascii?Q?/rn0nyN6GjSxlVoXpXoUfi/wg/dG9pccuuooAIZ6vXGhjGeeQswg02YkCKJK?=
 =?us-ascii?Q?RPPo/ctq0AgQ6gVpYN1+ZwRpktqJLpg4mdmKXkbD08/S/Eqjgf7IG6/QJmV+?=
 =?us-ascii?Q?XxPFPxJ4PovyJwi+I0kHlqU85WNblSLNYPHxEsXm3qEWkqtU5Ld+b+5nabd8?=
 =?us-ascii?Q?u91x5g4ViUXeG5nOBYpWgFlyfcEhkrY5QYU/Bf/dVqjxgkWp++sc9m7P9grE?=
 =?us-ascii?Q?Z4LhrPWdw97jZpfLjG1J/X9bo9kdqzZspgkAwlUBV7FjABu4ppYTv/zXlR/8?=
 =?us-ascii?Q?BzuChUWSx0VOrmdPrmiYqGO+r43WsWyClCSGSu8Rtb220aEsrRbg5OfV2CyA?=
 =?us-ascii?Q?njoK8FVdE0bJiwIrcw1ci56vGfTqjbNy/5vPYPACHd6KT6O9hXHPdpE0craM?=
 =?us-ascii?Q?qk2uX0KCdkn9x54wYzXt7QEbSKSINderq23+k4nH30NHqk+X/qiTYxpWiGib?=
 =?us-ascii?Q?cV4AVZcf5aZBW+D3PvGpAdYypK1i5PoRKimaGqH6q/EQSep9oaVX6v8j4QQ3?=
 =?us-ascii?Q?eO9EEwaeMi4qZ4XDa+sLl4Qn5S0bWnTdJ1wA2nZGGH0kibmJkItvLWzWX/C1?=
 =?us-ascii?Q?TfICbBNeLd+8otrAAUrq/3BoGiLf3CeWRjmZgVkXrpokwj7OPEOBvXSkYlYv?=
 =?us-ascii?Q?GTTFcoLyScltgBOX4AxnRljKNZ1bKNPpYTsxOlNSBkVBgpqNOKNOKK7CDdN2?=
 =?us-ascii?Q?MCCn4v1tZhighcaGv0CJf8Pxxvt3aTvNItXSiBjIIAOhepffmF8JDYXJUIHw?=
 =?us-ascii?Q?dA0J0vy4YpwggIUg8Xa+3+IeA3etCeVjbb9Glg0ILz6S20OLE0Q5bem6o49P?=
 =?us-ascii?Q?60BIot6nSroDONTOmVo5NrVBmWsReM4KPDk4PbjU2nTWsxqIb+uS81joKClQ?=
 =?us-ascii?Q?OffQnU0oxcc54Nr/AFwfrR5tu8qh7MiRXkmM5o7oz7n60QCTmvHATmFjhQcg?=
 =?us-ascii?Q?X8kbVwTbd4CRUS+PMRDfbWl3yEazpB16Tjm0qiAqY7M4ecS0kJt8nZ+x/w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 11:51:56.1149 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6f0fb2-4aa0-4115-0f00-08ddc5f17edb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6328
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

This patch series aims to enable Peer-to-Peer (P2P) DMA access in
GPU-centric applications that utilize RDMA and private device pages. This
enhancement reduces data transfer overhead by allowing the GPU to directly
expose device private page data to devices such as NICs, eliminating the
need to traverse system RAM, which is the native method for exposing
device private page data.

To fully support Peer-to-Peer for device private pages, the following
changes are proposed:

`Memory Management (MM)`
 * Leverage struct pagemap_ops to support P2P page operations: This
modification ensures that the GPU can directly map device private pages
for P2P DMA.
 * Utilize hmm_range_fault to support P2P connections for device private
pages (instead of Page fault)

`IB Drivers`
Add TRY_P2P_REQ flag for the hmm_range_fault call: This flag indicates the
need for P2P mapping, enabling IB drivers to efficiently handle P2P DMA
requests.

`Nouveau driver`
Add support for the Nouveau p2p_page callback function: This update
integrates P2P DMA support into the Nouveau driver, allowing it to handle
P2P page operations seamlessly.

`MLX5 Driver`
Utilize NIC Address Translation Service (ATS) for ODP memory, to optimize
DMA P2P for private device pages. Also, when P2P DMA mapping fails due to
inaccessible bridges, the system falls back to standard DMA, which uses host
memory, for the affected PFNs

Previous version:
https://lore.kernel.org/linux-mm/20241201103659.420677-1-ymaman@nvidia.com/
https://lore.kernel.org/linux-mm/20241015152348.3055360-1-ymaman@nvidia.com/

Yonatan Maman (5):
  mm/hmm: HMM API to enable P2P DMA for device private pages
  nouveau/dmem: HMM P2P DMA for private dev pages
  IB/core: P2P DMA for device private pages
  RDMA/mlx5: Enable P2P DMA with fallback mechanism
  RDMA/mlx5: Enabling ATS for ODP memory

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 110 +++++++++++++++++++++++++
 drivers/infiniband/core/umem_odp.c     |   4 +
 drivers/infiniband/hw/mlx5/mlx5_ib.h   |   6 +-
 drivers/infiniband/hw/mlx5/odp.c       |  24 +++++-
 include/linux/hmm.h                    |   3 +-
 include/linux/memremap.h               |   8 ++
 mm/hmm.c                               |  57 ++++++++++---
 7 files changed, 195 insertions(+), 17 deletions(-)

-- 
2.34.1

