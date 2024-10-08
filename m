Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC2299506C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 15:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA07A10E552;
	Tue,  8 Oct 2024 13:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iBKuC9AU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3265110E4D3;
 Tue,  8 Oct 2024 12:00:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSPgX1/Y/RkMjNmSLmiuRpXJPrS4BfmNeZBGj3IaDnnS0PQi2fxTjCPbL1TdLozurAI8Q3xRHtPL5KwcfE4qbrhXuWlTWdrjFDSotIoJ7vK+p4RKiMa0gI7mbeE5vQW/awvHF+Km6gc+mE9YNfh6BFryVar+aQ9rYK7GfjHdRytFwkW4xJc0I72aU0Ha8v+vDc4raB19jys1S+chMnO1wZImTEohRR+gUhOq5ilW/owOlWz45oQKJm/73YpaYtPkmPCBRngsnPuSUJDn1vBc/1/r7jU30e9eBClnh5lmh//+6gdsyYXKJfaQ8n/5XEJaTu2w6k5jvi9pDFsBY5A9NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OT83ftsqdFRALQreXEEhqpHyxC2jbwsiei72NNxMDA=;
 b=BzF1ggDp4y4mg3NPQoWQGpTt4lvlfBllKvdqj8AXdaqdBxDHoDCeXT4KuSZFncQiaofJcy8T1cLMyM/GEu4JQdD+eT/jBahdp8Ey4Tgl2K7RsLnRn8BbU+IDHeGCvVYGeFrB1h/RQab7sBCav/lfEmTufu5ZkJJiNQOM4Iyt+tbnXmhnTeeVysQbvVlSHP9TbWCHCyc9u9fLvnwQjaI5f3vZcTJ4KO0jKJwaqFKtPf2ThGk2/K+CjRWT+4hI31QoDdA4PXFsvYJoIiGkOjKub6t6stp13o0JtK5ViLLNFlsoKOUjo++PuWCuRR7LebSV1Dm/OWqKwN77QdaSf1rUkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OT83ftsqdFRALQreXEEhqpHyxC2jbwsiei72NNxMDA=;
 b=iBKuC9AUJ+PXkvgeXD3R4NeYklMALnv5X+6jMvJEt/o0qOKpfzfZnR7DnwOulLkL071DEICcc14fW9XdbFVNowEA5cZYobGufiVzfW3Yba+P/yF3BJVvdKhJJofafVQLWpeHpyY9mSWPpozPaZTftXmykobSSRNuo/pV1RqwHXK8KhkkkB02aSp44CzeaH2VCV4+qN1qRaJCSrWMcPpOGC/2/MIHQTcQxmThpHHeCOfYfvwh9vtidbMz8kr14XXAmL/bRdeLmEGnmUGWKndm9GCDdkaLE7rObTDaUSLaX0OedJnL01jX8481BzNut/6YrRMFWVbkS0eOHXSrqoPqjA==
Received: from SA9PR13CA0107.namprd13.prod.outlook.com (2603:10b6:806:24::22)
 by DM6PR12MB4217.namprd12.prod.outlook.com (2603:10b6:5:219::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 12:00:50 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:24:cafe::a3) by SA9PR13CA0107.outlook.office365.com
 (2603:10b6:806:24::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16 via Frontend
 Transport; Tue, 8 Oct 2024 12:00:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 12:00:50 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 8 Oct 2024
 05:00:38 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 8 Oct 2024 05:00:38 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Tue, 8 Oct 2024 05:00:35 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <kherbst@redhat.com>, <lyude@redhat.com>, <dakr@redhat.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <bskeggs@nvidia.com>,
 <jglisse@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>
CC: Yonatan Maman <Ymaman@Nvidia.com>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH v4 2/2] nouveau/dmem: Fix vulnerability in migrate_to_ram upon
 copy error
Date: Tue, 8 Oct 2024 14:59:43 +0300
Message-ID: <20241008115943.990286-3-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008115943.990286-1-ymaman@nvidia.com>
References: <20241008115943.990286-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|DM6PR12MB4217:EE_
X-MS-Office365-Filtering-Correlation-Id: 6711f8cb-bb5b-49a1-712f-08dce790da3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JAQxeswq5rQiT0dFXfw2eCu7QI1Ilw+Tfp8jOoPusJr/qtZvYUSlNvYs6piK?=
 =?us-ascii?Q?av9gEk4FLzfq/BQXF18giQ7VnGWONcxs4WX2cvP+8VrBFIvG2/ambk7i468j?=
 =?us-ascii?Q?B9dlwtjaz0WAFgEoKeBfgGHVf0j0O8GGl9v32jS4gLfCKE8qmw01pZhogfol?=
 =?us-ascii?Q?HXoSwGzOxMCf3hlvrl1z0S0Q+S2JfYHWZrXXg83UlBhz8eJQCUvRx4RzMZCu?=
 =?us-ascii?Q?JyIUA4JXQaYm4K6J9nCWZpy1eTDCoTlfpDWY1oi841gqR1gtcuBtKXzuK3w/?=
 =?us-ascii?Q?u1zVU6YtaQYRJGW2kkeKnlXNoDUsOxk50y2q9uFpwxfWzIMPJKHXdWAObA+f?=
 =?us-ascii?Q?tVqU3sxmX9imRSvmHyHB7VUv3e46YOQWOKyqeO7ndcOHjB1biCrmNOQnyv2a?=
 =?us-ascii?Q?eHdbNyJN15+X2fid7S+G8h64ZdOqq46x3DSs7sUwMy/IckGzQWnnkpKo29I8?=
 =?us-ascii?Q?lSGpkwKg47m5uYGZ4sLuDbXFAjsuaV4Z2rLmV1WlnGzG4le7b0H637gMz6n/?=
 =?us-ascii?Q?SxuIQ8QsnIS5TLBlyxpj27cUHZ9MkFdy3m/E0tiX/KezG5+/01OREUiXRK3O?=
 =?us-ascii?Q?jVseFC/FnZ1olqOIYXA0qPhFGjQ6zkhRijM1vH3pn5IBqPByckQZICnG6/kc?=
 =?us-ascii?Q?Cz1cmNDt/5ZuxARTfNOjIjA3h+6rQXHfATlEacJ+doPWGMVQTPkUf1m6H0Dl?=
 =?us-ascii?Q?EVLvw1XiLcl5JB0/oRS7iocPRs4yqWHxmobw3UMU8ICnQblIBIfg+T3k4yLs?=
 =?us-ascii?Q?RP6kFFrF5Tbrn5qeSob5lH17NqBqcTKP/JvHxb9QFA23KnfVV9udDD8OmMpZ?=
 =?us-ascii?Q?6q8dJixTb+ZBH9VCmL2gfCgNtPhPSJGqoyWkYmS9VeHKTrUQdbCqy/rQ1zp3?=
 =?us-ascii?Q?+w6VHrPoEZNvmnByx2DTFLU9Jzx2pYPqiPybjKre45y/yAlV6RH8idDA+z4A?=
 =?us-ascii?Q?ExvvTSxk2Tw1b0sTT8Mwz3S94qLeh70F3Pbn7/Bcc3bIKiLb1DinZNWKLDSj?=
 =?us-ascii?Q?G5dmzEAbMTPyE7ULcA3DvrEFy8LsDUETqK6M2MfuBmYhvGC6qKDNcfQoCTMF?=
 =?us-ascii?Q?U01kcX1LcO3JC65BCKlv72yjXNHf9ybq7OFGGsYxx4zsenmLDGJktR+mpdqR?=
 =?us-ascii?Q?l4qU/xhiY8t53RAmmZ8OK2CdJ/qww3U50x2r+8uSvANOHeuiAx0ufw4eryqX?=
 =?us-ascii?Q?vnzpmOYE2mLa9/+KUvbbBRpnM0N46ePb9Sp5EcKdf7cDLtUSH/Ath1xDtDgr?=
 =?us-ascii?Q?lsvUTLsGEAtp2WVLxxnr/d299dbJXw7UnL8wRsIE9BAOczfD3Q2Ahj7Xv0QD?=
 =?us-ascii?Q?lmqrK5g2lmOpTpxy1cOw/AnfCVZQTG9Ygf0ba2diMvzYuSVhFK4z0vmXvpVd?=
 =?us-ascii?Q?wTM+z68QYBFyzAQ8Up6cqAOvwvqm?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 12:00:50.1153 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6711f8cb-bb5b-49a1-712f-08dce790da3b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4217
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

The `nouveau_dmem_copy_one` function ensures that the copy push command is
sent to the device firmware but does not track whether it was executed
successfully.

In the case of a copy error (e.g., firmware or hardware failure), the
copy push command will be sent via the firmware channel, and
`nouveau_dmem_copy_one` will likely report success, leading to the
`migrate_to_ram` function returning a dirty HIGH_USER page to the user.

This can result in a security vulnerability, as a HIGH_USER page that may
contain sensitive or corrupted data could be returned to the user.

To prevent this vulnerability, we allocate a zero page. Thus, in case of
an error, a non-dirty (zero) page will be returned to the user.

Fixes: 5be73b690875 ("drm/nouveau/dmem: device memory helpers for SVM")
Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Co-developed-by: Gal Shalom <GalShalom@Nvidia.com>
Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 1f2d649f4b96..1a072568cef6 100644
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

