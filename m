Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF74F9DF52E
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2024 11:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0AC10E116;
	Sun,  1 Dec 2024 10:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BPjcToaZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAB010E07B;
 Sun,  1 Dec 2024 10:37:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKF1gdLMV1FJLrNPYBaXMzijM8H1yc0wMW3to+znBSQIDFGKDmyWlLxXO7SfHPZJW0YVCnuewHvVr7eI25TCa4ExVr/LJAcf6vUNLaibuV0qHBiDEowmU6EfpsJh+bwFpUuQB7uUgSZ1bB2dNNwfOu1SevvPO62S5NVVoWB6ajnEklJhPClH8GxGxaOlmt6GR1AFa0BDG2/2KIqxo3A0SJCVDKx96NMQl/8rMibwSfJ5a2qOzPHgYSkxTNDVGFltro7WZCcQmuaUY2Yjvn3L8QPxNlVrbHivi28b7fO1N9Vv8sEwFAfFJpgDs/jhzgr5aLU8fUa3DHtmElE0sH760g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYisgyjLGYHAmzJ50Py8JaxV7XfThnXZRRhkkk0v/JI=;
 b=vzs5TkDVMrr/0tfts5e4d3durE/BAmksRMPHFmq9j0nvAhYgO8X/Lg9O3SX2qFi5D8IV4Rm0qby1Ub31BpCPyqJRlapySMXeSTVQDQX8dU+OjUV6EF3+AZFGkrUqCK85qapg7B5Zj5/nLAcAifS7tDngQ20Z9qVWbipJ4ZxqROcf7Sho8eAhd6Pkdxl8mYKw7WM/nQTVBLsjRmAk/dfC0eGLbjkHlT2W9XKjwmnBZ//c8q3FhuX6S+xnqxK7t8VprFsbnBnipOybfamDhaGrPsM0nR7IaM+GSJpxz6Hg6jjYnENAykMRUHDeOCd94fRomtBcJwuYobvxnbeQhSxE2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYisgyjLGYHAmzJ50Py8JaxV7XfThnXZRRhkkk0v/JI=;
 b=BPjcToaZVxmyKVf4lhdCUBw0v7bZyuvYuMcVKAFga4z8ysSCDI3kfbdZdhtV5mJZWRDWhvJNgURXNrNSiwhKbxcJx+oauzWmMKmXJk2pOG2dDmRfnb4zynjoc8aFBcbP3hBtWVhNWKztbT/WRGaJJfVknEBMcb0EnL0IJYEPCjpO0JBPHC48UQPeXbq4Fx4b4fQDRwFHOdZ4DsRqDlOZVhCRSPllzigZCZjP/S1cG4zvJ0kNMjnZ9RP3CPM5Ln1f1etsSlZ/tbErImgKnPQNmyTnm+cuIINtF+Y6mHMLQ452OaQH3QV23nYxJi27ln8GWQTHmWxPDwC52u8XEUK+Vw==
Received: from DM6PR18CA0022.namprd18.prod.outlook.com (2603:10b6:5:15b::35)
 by IA1PR12MB6649.namprd12.prod.outlook.com (2603:10b6:208:3a2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Sun, 1 Dec
 2024 10:37:51 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:5:15b:cafe::ce) by DM6PR18CA0022.outlook.office365.com
 (2603:10b6:5:15b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.15 via Frontend Transport; Sun,
 1 Dec 2024 10:37:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Sun, 1 Dec 2024 10:37:51 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 1 Dec 2024
 02:37:43 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 1 Dec 2024 02:37:43 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Sun, 1 Dec 2024 02:37:39 -0800
From: Yonatan Maman <ymaman@nvidia.com>
To: <kherbst@redhat.com>, <lyude@redhat.com>, <dakr@redhat.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <jgg@ziepe.ca>, <leon@kernel.org>,
 <jglisse@redhat.com>, <akpm@linux-foundation.org>, <Ymaman@Nvidia.com>,
 <GalShalom@Nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-tegra@vger.kernel.org>
Subject: [RFC 0/5] GPU Direct RDMA (P2P DMA) for Device Private Pages
Date: Sun, 1 Dec 2024 12:36:54 +0200
Message-ID: <20241201103659.420677-1-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|IA1PR12MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: 619bd23f-0a3c-468f-906a-08dd11f434df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ggUuCUOL5/Mv6MplhgM2wtqKpTIYPxzz3ALsWxH3AmS8dMfFyaPpFbu6pmez?=
 =?us-ascii?Q?WV2+LVBvFEEaZAvoHxSn6KR3JpQCBJ4OlWvSVBH/xrV8H2tsFvDKeiZoLJic?=
 =?us-ascii?Q?rDUpE6n7OvIPEWRMx7OOhnsL4/koMllwP6Y2gpSKIDRMnaoDnD+Tqa+lcxJi?=
 =?us-ascii?Q?xPAG49FGS/qNdYK3/6KozqavrdT8uCkdmZH2yy2hasHaTVJ8TT9SAu3ziMlx?=
 =?us-ascii?Q?5+yOuommidhzbOOYxsHuqncpC9xVJZctnEbmXVwG0CYxaNC2keFX3nl0MOci?=
 =?us-ascii?Q?1oSrDdBnTnSdL6ZsMe141UFkVcYxPkz1h+12/Bsy9ed8HItq0WqbFrD96NSm?=
 =?us-ascii?Q?iR+GxvB1af9ZvkTxxpFJGkyfk1uBRJ9wTNGSJ4feEza1c2iJ7oIf0GuT1bV4?=
 =?us-ascii?Q?sfQEpVzVh33AzE3Ugpcswa2MYxD7A+4/pnt0gqvl7swoENQ+E0a6XpcG8jh9?=
 =?us-ascii?Q?j7psdruvfFQzBzYAL4BSQ3ikMmfO5ph2MToANr8GlJ8EzYEAeJViaTWWT5oX?=
 =?us-ascii?Q?X9Qa/VRWYDe7DQ5b6mU80U7Xyb2CrMRDG5veNLy/WeM00k5MHGnHTSNAEB2w?=
 =?us-ascii?Q?bp64F/a8ncJV7afRm1t2iFNP7Pi4YNTm4Gk5hxAcijQIIXjDoxPx52R2XnaV?=
 =?us-ascii?Q?VrYnBy21aHxs3ZydpXKlmYbnFRGf5oJ9Nv7wONY9TXqoJ6FujcveLT35cVOx?=
 =?us-ascii?Q?wCJO5hiUdvaH8o4B8lVG1Z452Hb22Gx8TPaV/R5Npr1xg3VWA+SMtcFKZ+r7?=
 =?us-ascii?Q?lqVHaV1o6btBgYOrNkItiDoC5GnrEE5QqN3OE5rdYFhIvn6z4LTN48rIZ7Ij?=
 =?us-ascii?Q?w8JEOW4DnplhV8plNsQDFXIxP1yz4N6jgOSQlfULxxdRHa+SJcH3z6kBMjan?=
 =?us-ascii?Q?2xu8aQGjIfhSrbLdHoYG0hx7zE5Q+qXPXRLmzwRoqKyj9RhuUhPhJqf1SG/n?=
 =?us-ascii?Q?5cbipsp8yLj9rBVL7fn9RDBnjtC6IBGKkYITCT8RP0fpB+9QPUoPEpTltKvW?=
 =?us-ascii?Q?2ByytzvUS2+pmktWv4rI4yu5RbHIpcuA6OQaAUkNi56vO5BzYEu1cULplBFe?=
 =?us-ascii?Q?N/+V7C+0yUeRj8bR5Ul1uBiQVe+eboWCPEYcXLsVLHxWdQ9UKyBB4+MuZbh1?=
 =?us-ascii?Q?gZAOcg26kgRxaUWgemte8bFPexr3WMEcTv1FSSPjxwu1PsWlrQWx94znm0wY?=
 =?us-ascii?Q?4rI6eek8KvKsp2JAkAwg6JTkCSw6jvXzi2WxQF59rmOfWzDY/n29vUD7AJxu?=
 =?us-ascii?Q?vGyTlkmzbU7K4hDVNpZcE6kk8hmSoTjv8XO4TvxDzqYcLMY0lRWNuhGRH6Zt?=
 =?us-ascii?Q?plaBgvZPwlix3yCFjlm/5G4OYDCvAb5TTf2A6s5ykwXEPB3PMVVhVx0c8iA4?=
 =?us-ascii?Q?mPoWzsUYm0aayILfNy+VQZ2qL/XNIvMt9a5WvzvHiYj9jAtFHcWf5lCxYLWN?=
 =?us-ascii?Q?q+HEASHZH9WyzcAFcHcA4tE32T5qM5FCR0gsO5ljqHAUX3VARSqRSg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2024 10:37:51.2143 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 619bd23f-0a3c-468f-906a-08dd11f434df
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6649
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

Based on: Provide a new two step DMA mapping API patchset
https://lore.kernel.org/kvm/20241114170247.GA5813@lst.de/T/#t

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

Yonatan Maman (5):
  mm/hmm: HMM API to enable P2P DMA for device private pages
  nouveau/dmem: HMM P2P DMA for private dev pages
  IB/core: P2P DMA for device private pages
  RDMA/mlx5: Add fallback for P2P DMA errors
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

