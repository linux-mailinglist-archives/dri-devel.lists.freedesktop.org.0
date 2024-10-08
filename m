Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FBA995071
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 15:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA7910E546;
	Tue,  8 Oct 2024 13:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VJkQTTUL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A935110E47F;
 Tue,  8 Oct 2024 07:32:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDwxYpfIlH9Wgyn8clcA8G44owWjfKvlexvu2sowDPHv54MIWrQG1kKFQKNfmW+BwDIolXZLEySwYCR6DMddo0Xblh4N2/tKZOlkaUxkGK+cGnkMFeyz4DBlciOrdhF8UCLeE6zu1ZeAH2wevdovIhPCtcQmFmoocKB60Q3FPdQoOiuNdLDzt4Ci+w/Y9kRQQE9x+8z60dQnQhNVy3W+yBlbCflVvgVE6HIA1q3zLukRMcM8uHnHIUiqUtXIA96nftNIFOdOflXVhxOBZsGHdAfjQ1zJhL6Vn5T+PBX2iSz1jlOKYJd3YWqWcFkN5IDZedoEkqDosLk0A7d2lwmI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIrTafYvUs/SQVSBu1JFq2xnjjOVF1j2qPafoBaktKY=;
 b=gC5hLYCs9F2+s3NTxSUiUro0ktSKsg7L6Dl0ak4xEfVt/oHtyZd+C90kvzgxrm+UCfx5S78/zoPfTWSkw2psU/qanfaRoAZoEs0DIbE42IW1BoRJw5LYuOzQn82KDI8m2XO2+EJBbluIXunTWW1ufvAeSPdO2GYVvScSiUd/zYSIDEcALsNhV3nPl//xZneh8c5+d5/8Z8iKmhk8tII1MwbJxX2j4UVm1/WbshvKE9FJzhwoTno+Rm7TGw3bjE/+pbkxEsC7ovrzeXW47b+1VQ1FdIjlmU46hiNvDEaTmZrBJSmCrF9GceJWMzj0f6SfUNCTjQkTbwdCoypOJayLjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIrTafYvUs/SQVSBu1JFq2xnjjOVF1j2qPafoBaktKY=;
 b=VJkQTTULy1qJ2bUEzDM4scrZ/roAHCigaVNFicL2kJkIGtKPWdP9zdu7xnJ6IuEXTT5Gyc1YkgwoYlGxW+wijrcwkvnKLmJ7Ihwkwr+OS46Aor+tGCELraUh9HFSKr3f9PXGtOcgxI/b0krX/klizYwBmhpnTKdXGrU3BQVLLzZdrDhQ5JprrEaABY4Ea/HiHnjl4DBKil5Rvi5dwIxLwPo5KplUB3MFLeQ3rvQ4ZDWcLSP7h4Uge0GPJ+v9gqWMS29Id7yoERaINOn0OvY68HJaJfTaw3x5CNUbYNYYY8PIXV+eq9ZHxVTHa7yQel0lzyc90r2xQWKmf06tz7d5vg==
Received: from BL1PR13CA0112.namprd13.prod.outlook.com (2603:10b6:208:2b9::27)
 by BL1PR12MB5754.namprd12.prod.outlook.com (2603:10b6:208:391::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 07:32:14 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:2b9:cafe::2e) by BL1PR13CA0112.outlook.office365.com
 (2603:10b6:208:2b9::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Tue, 8 Oct 2024 07:32:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 07:32:14 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 8 Oct 2024
 00:32:02 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 8 Oct 2024 00:32:01 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Tue, 8 Oct 2024 00:31:58 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <kherbst@redhat.com>, <lyude@redhat.com>, <dakr@redhat.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <bskeggs@nvidia.com>,
 <jglisse@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>
CC: Yonatan Maman <Ymaman@Nvidia.com>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: [PATCH v3 0/2] drm/nouveau/dmem: Fix Vulnerability and Device
 Channels configuration
Date: Tue, 8 Oct 2024 10:31:01 +0300
Message-ID: <20241008073103.987926-1-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|BL1PR12MB5754:EE_
X-MS-Office365-Filtering-Correlation-Id: fc0d09a8-58cf-499c-4a7b-08dce76b5472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W8Az60HKZA8LGJyYLC9WlEX1xICB5nrpsiqkvqQ4ktoV30ONZ9bnSiBqhP4E?=
 =?us-ascii?Q?jTg6SIofNWgp5mUVnPEjMWSMTgw7ya53SVhJBkXNEfhzYwnR2p1GX9xuxxeH?=
 =?us-ascii?Q?JDfC8HWGidx4jXozX9ZvQ9Ot/B/uQWUF3HZ9BtvMFAo46RBZEbsCUPOsHpBF?=
 =?us-ascii?Q?wsER3sJzuFXfFlbhPFmWJPWjD7FaObC0TezAGodroNvk1kg8yc3WAMtaVJrl?=
 =?us-ascii?Q?HsBaG/5TLmuHwZnEvKGp1YvrMsz/Zm503mRnzmmPymNi8eSNBSb+uYMh0AEI?=
 =?us-ascii?Q?HYfmPukHaZVMAG3vP3rSm4ibvWcnrWsTMv6bT587NjGgTVF4qvaKELYjsfEY?=
 =?us-ascii?Q?98bU2IHUdrdtYwZ/AkrowLSpnPJs/pmN1zOHzg0w13IAKQRmf+odN5Wrkq9Z?=
 =?us-ascii?Q?H8AdKu0HoCksJ0nr1iv43nc56U9D/QbAQal4GkYxpsd1ZhD4RaHBv2dXfwZ6?=
 =?us-ascii?Q?0CDdUqHqvKSomB2Yz86CZyjqrggbFcXCixk7mOKvb7svN6ZRmFl1jALyQdY/?=
 =?us-ascii?Q?IyVRVJZAGQHNxk+fZq3O4JB4GymJov0PuEu1otp8uiaIamHitaA5+YH15+3I?=
 =?us-ascii?Q?zV13+N3uESsbys8YhW4NeU4NHE8LvTwudUM3uKCQWl3rm1fizNkSs7i+KIUc?=
 =?us-ascii?Q?FXUjZk0rmph4zSXZLJv7epW7gk1pljqPJzw2rK+9QYMLDaGJM49LbeAtsyq5?=
 =?us-ascii?Q?9b7SjMUmmiT+W9N0kcKWQntpaeBecHBmMNKo85CtBAK44b492mu7RRV94W5r?=
 =?us-ascii?Q?qwFgvDL6AfSt8IPU9dok7NhSE6M2Bw1BXR47FHElILrjyMbwSg56Roj40aA8?=
 =?us-ascii?Q?bSH8b1DduZgMh/OMYOqXW/qMv6FC8+OgT6VV8sFiyI34HY4fAs/MQi2aQfKb?=
 =?us-ascii?Q?j1rxjvbJ4yjrx9cyiiP44pTFVBY1tBUn7o0Q1juACaRq+KykfJvcuSd0367m?=
 =?us-ascii?Q?cyVV8eIfYmxwfH/fmuALjDcBD9jJh7kE/eA4nqz9rFFDSpbnDNv7s8w1z2AF?=
 =?us-ascii?Q?ar10FqZr5hTjyCHHpx0WwYP/h9IfgVWtmku8VMeSrAiv/p7McmaQb9qO5bo9?=
 =?us-ascii?Q?//VpCrQS1J7yJLJ+k8IePjLfQ61c0kL7QDvHubypm4Y4mHB2KwqvwwFmnZ0y?=
 =?us-ascii?Q?0vlC4+ANvodsB7vMnC+GcHwY39nopJshRP2ZnUy/AL4hhsz0b0oVsZxm4ZZZ?=
 =?us-ascii?Q?EZdnZHPvqjcOQ78YzDE6e3vo4ZMKKtKjs/+ZR+B6UK9L1NN/5hqryhs5ODrk?=
 =?us-ascii?Q?EyAigbAZ3smdyj7Je6ra9etghAtofo/o+gOH8zBLJos0MymwlrwkBOmpsf19?=
 =?us-ascii?Q?S2MkJ40IKimDevU4Ipv7xdmsvfZ88esnGKdO0wCAMfOXlEZqQq/JeN3/LkA6?=
 =?us-ascii?Q?3TcdqL44SbjMmE0C1ecCvVhYqnz0?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 07:32:14.2186 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0d09a8-58cf-499c-4a7b-08dce76b5472
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5754
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

This patch series addresses two critical issues in the Nouveau driver
related to device channels, error handling, and sensitive data leaks.

- Vulnerability in migrate_to_ram: The migrate_to_ram function might
  return a dirty HIGH_USER page when a copy push command (FW channel)
  fails, potentially exposing sensitive data and posing a security
  risk. To mitigate this, the patch ensures the allocation of a non-dirty
  (zero) page for the destination, preventing the return of a dirty page
  and enhancing driver security in case of failure.

- Privileged Error in Copy Engine Channel: An error was observed when
  the nouveau_dmem_copy_one function is executed, leading to a Host Copy
  Engine Privileged error on channel 1. The patch resolves this by
  adjusting the Copy Engine channel configuration to permit privileged
  push commands, resolving the error.

Changes since V2:
- Fixed version according to Danilo Krummrich's comments.


Yonatan Maman (2):
  nouveau/dmem: Fix privileged error in copy engine channel
  nouveau/dmem: Fix vulnerability in migrate_to_ram upon copy error

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

