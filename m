Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD0A995070
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 15:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1BA10E549;
	Tue,  8 Oct 2024 13:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LYtk2ZPY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A7410E395;
 Mon,  7 Oct 2024 13:29:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=deWKK2Ujfbzuz0KDLgqHv5AakxOIHN3CPnNxCgY8oZwRljAVzz6M1FDPcFbfU9vs7duKIEIRHyRtRD97JUPSplnNbvFkQ2woTuIm0wQUc5xGexf5j+mmTYGEs6zo1JHoqHKq2+P/SZU2LOIDPzLJSwZZ51DiAxVv7CqlnkWAtzyRK2hFsisY1u0p+3mwz0z5ehnWszyWi3QUKwz4+rQlGFdFRhNVZYIZFqVKv5nYzvG5JjW9azH1KW2INFfUnXKoUWQj1nO9fetH8Yw4GbGARQm9N9zW0XbMsLs+qrDjRcTP6hLeqlZlPg0srFXk9go55NBL91n2bGdaE+NUuR0UJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNhu+LWavHJyL6S8rmBSGW7aBzhnouozjMYTvUIGc/o=;
 b=AxD7+SnRXbLorB0fo4KFi/J86op0U5afCR2tD2VY4wWEi3R6vbSOkfxuRNpGlVlar3wpidsPmk1VXgQgU+lbdoJGlOf0Efgk5v2HYIJQTgN6pnnzavQa6UMYy/6ieGkgRy0R8gb5CWfB1ooPVcAknXVmishJBtGYpA7cujO3O+MXmeJZNYPzWF1HgITEXYbr5ab6nJcdOi5UBac2iD+QW7G22g1tLnvZ2asRDy+2kUK1XPDvvESWwpLHkAZWsyhjYrbKfyvAj6NrctUmXO0W7VpWmrCxADWn/kCayl0d+s9MpOtWqrYiJCOIX9yw8l3BASXoiAaZmi5FKW2O4Yg+QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNhu+LWavHJyL6S8rmBSGW7aBzhnouozjMYTvUIGc/o=;
 b=LYtk2ZPYgzcwN3XKPPuxCNUZJvUj50Zi+jPel7lx9S/G5VF5m/h+6kulpdrpkkYmDYFlt2nUV7cvDGLXym4RDje4UCKSWNPCHn2Ow598BCD2flsifThHN/TbraK6LAiDdz9DUwAeb7qDWbbXs6Wxj62dSPMioRsj6gGM7JEmv8l6pIdpDxlEnONp/5j125IKYvEtbyFbqp6lZd0wx6YhZZiMrRqq4Pe1NvXPuX//N1gaijDeB0qBQO+qbSfPT5FhOSFXAkTI7JuxwnPQtlYOqf7awQYTCnlZbWMAo2iyncaq5WRCgVwfs+tuBBnt2qO/gPd0CS0+r0b/52Tze98JHQ==
Received: from PH0PR07CA0007.namprd07.prod.outlook.com (2603:10b6:510:5::12)
 by MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 13:29:07 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::4e) by PH0PR07CA0007.outlook.office365.com
 (2603:10b6:510:5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Mon, 7 Oct 2024 13:29:07 +0000
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
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 13:29:07 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 7 Oct 2024
 06:28:55 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 7 Oct 2024 06:28:54 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Mon, 7 Oct 2024 06:28:51 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <kherbst@redhat.com>, <lyude@redhat.com>, <dakr@redhat.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <bskeggs@nvidia.com>,
 <jglisse@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>
CC: Yonatan Maman <Ymaman@Nvidia.com>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH v2 2/2] nouveau/dmem: Fix memory leak in `migrate_to_ram` upon
 copy error
Date: Mon, 7 Oct 2024 16:27:00 +0300
Message-ID: <20241007132700.982800-3-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007132700.982800-1-ymaman@nvidia.com>
References: <20241007132700.982800-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|MN2PR12MB4110:EE_
X-MS-Office365-Filtering-Correlation-Id: 1966feee-151b-4241-6129-08dce6d4050f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|7416014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z7dU+j5Lazqn3oeLMbSqGwTZmqHHTCpGvixycbS7hEdz/CPbxDN/3/sZsTyy?=
 =?us-ascii?Q?DjL86WACdMljC60A9BP026xZxJr9rdNHlzGw/Fa5uaVe2THU8LrUEhvKzkF9?=
 =?us-ascii?Q?ktpPsp+VpWWRH2j+mQQAjFWtH2lyqdAZyFkCZ3fSRJq2oFiJ4r2jR/g6i1a3?=
 =?us-ascii?Q?E5up5Th+0WYYdnauJiWx0wSBJ45ATkbvuDvCArDhYQPsXgvuftK6Ev00cbb8?=
 =?us-ascii?Q?nDKha/RNV7X7TNqbrgUhj1QKSQyWukHgAVSq5Va5DPOcemvk7ZqJD5Btk3pi?=
 =?us-ascii?Q?yteJOSD5SX6K2592sIGc350lW7x/1M1rUAKCsTpOezW+wWar2UXgE7708amL?=
 =?us-ascii?Q?6FDWrUn82wAaUE+7Xss/HM1IziHlXncvlz06jUi0wdgM6eSxBrd6NEClr5VK?=
 =?us-ascii?Q?nZzgS0UJU+v0hhHQhE8bCA76eFe4moqD+dUm6K2BQxMEac87IxdBpDDXokOp?=
 =?us-ascii?Q?8sqjPnzAcRF2ZMMP8dBjtBqbzrWawYwLtLrLka86iVILGgfugSiO2nPHgIFI?=
 =?us-ascii?Q?WHlOdwghwjnyR6yGM0bo8XPfn3D0J0BXtKw71aGJujIgn0RLFFAbfS0Ps5tb?=
 =?us-ascii?Q?ZdCZsgzWvs3YhvrAIgQOG0dVj45z9Ye9yaraKXXTccUa1i2lcdwWiRKvewT/?=
 =?us-ascii?Q?8aVK4XYBTzQiZs6SQZZ3KHRz5Wg9uDAt5khHP5CG8OONLjgM7n1+NnxDzmlX?=
 =?us-ascii?Q?B7PtkmW/D1FuhpMBJAmFiyqqvAtImUmlbLGPSUsBWVtjtGEhSvC+IZ9N/ygQ?=
 =?us-ascii?Q?xK5IW8e0gGf4ECDl1xy7fFrI533C4z2G2Ml35TkOIAPkN35Xs2ETZBG/t2AP?=
 =?us-ascii?Q?aEmboDkWzXq14SqEYih6DFW0qsHY33Xowg5bvK5vDqVILPxv+BzBgSq8doSe?=
 =?us-ascii?Q?3CLPqnZOuZZLQJYrSehjw/8LU+ELwaS4rdPAvcDFLX9qHEutIzY7zieer+eD?=
 =?us-ascii?Q?e3Zhsi5wpYAX5cB1rRP3F8Q7iyhmO5yaGj6DdUpioMhGW69UPm2ZvzUhsr0Q?=
 =?us-ascii?Q?pIvye1f8XE7k3+m04j98DBX4p/y0Npbi0YB8gKA7Ol8ZR89qD/qg7OUIKiVo?=
 =?us-ascii?Q?kvFQHzlWfVuasNzLrhf9JfbOWv1E6mnY6Q9+dXWbUhIiX50Ik7QVjY8oDnMz?=
 =?us-ascii?Q?DvqGdJWzri+0xagOUX1g7MgnTX6RmrJihrYlfMxh5U1XbHE1iqkrAmb7F+9n?=
 =?us-ascii?Q?XIQkabBKyc9Yncr6NvlW3dVbGXv4xTusbezLWTZILFcCBZ3vHC7bOz81Zl+4?=
 =?us-ascii?Q?u7gWjBjyp+vqIJskFX5XKB02eb96ziyvE+XxY59OKrT5W4ggUilOmpOgECP7?=
 =?us-ascii?Q?A3tUH6B+VFfsjSZC18W3HYkLerrDMfnaEksFU7Lw4RC4Dknn3lXF17QcqUAF?=
 =?us-ascii?Q?/AjX+V1XiNYL2PQhrCLLfFxBlWNm?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 13:29:07.0710 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1966feee-151b-4241-6129-08dce6d4050f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110
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

A copy push command might fail, causing `migrate_to_ram` to return a
dirty HIGH_USER page to the user.

This exposes a security vulnerability in the nouveau driver. To prevent
memory leaks in `migrate_to_ram` upon a copy error, allocate a zero
page for the destination page.

Fixes: 5be73b690875 ("drm/nouveau/dmem: device memory helpers for SVM")
Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 6fb65b01d778..097bd3af0719 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -193,7 +193,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	if (!spage || !(src & MIGRATE_PFN_MIGRATE))
 		goto done;
 
-	dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
+	dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma, vmf->address);
 	if (!dpage)
 		goto done;
 
-- 
2.34.1

