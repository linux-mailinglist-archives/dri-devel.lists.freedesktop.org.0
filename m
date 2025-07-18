Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEACB0A388
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 13:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A601910E984;
	Fri, 18 Jul 2025 11:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UM5qg9va";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5FD10E97D;
 Fri, 18 Jul 2025 11:52:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4pnDrsG5Q4lUV2HM8iXSpnJetWXpClBuvVN7FA8vABIlrHgxLwX1SEu+IjxDaeUjnq6Tgx1lIFe9r1D0WhZ64OZM/8JyWd0LBXKg0T4uFILVzUbM5BtGFHrf3o/e21rPbg2JJrstsHmzKxgoXAn2CSx0bD6ZQy5bfIQrBuG6WqIf0HG7gsFNV4NM0ZZ8xdJoqPj/9UZMgPVfXONhVboBac/k4sXfXHSss6y2AcIos+RJdF+pn9qNME5bJ/SeJ6oR7xnD+zVqFFBXTuZ23Oj4DKQXWGdKE1U7vf9sJOeJpVVKFDaFJxCEr6JIWt9QHivapebq/pcSpEF6I2THT/SMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsDleLjsrgnMNq05PgeYkPRlihAsvAvvZPmQ1QUT0I4=;
 b=w8rQuiVOZoYqJ0KRHwQ/umiLbdt65Hbd8d6e/M1+hlsviIbIPFdUDtm5ym75AqxYvzKSiMZO5V9dmNJsnRz4m5WVMaZqkIYCF5jOjNvKROhJM3E4NrIOTPYqM6PLHwbzn/wPkNrP6VKM5qcdhXUR1ESGhrrzguk46wVmh1b4SKACoMYpkkB8TLK2CPbSgiFwiHflIbgSs4syNXjUArw027BhT4r0yU74h9sq+QwgpQpj0kkuMCwrXNcd17v8GHMyqV5iGEv386pCvsDdJPY5cSw0aI6wNSsRDhs8PRcisF/EJNXyY/C1T/s/ix1VSwkQkMp5rt9TQZVd0MIux4otJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsDleLjsrgnMNq05PgeYkPRlihAsvAvvZPmQ1QUT0I4=;
 b=UM5qg9vaFDcUSBbmaC1rCt7F9KUsEuh2g6m4zy2ySndS27B8+YeOt1cGLe0hImJGK4ZrOtambVdndnCAmpS/H19CsVJBx2Mr7qwUxjEl/Bh9s5ih59Eui6avNfmO3btV2sDSTb6QH5kIUHHJb4pPO/qJGWSYZ+3eJh5f73jZQUw2nCWbEeRYXjjxE1v/ksnM2GqdA/IkLoRWQWAMROu5nyUKjV6IFHWZnzR5ZvTK70IrTK7He5rST8KOMlXhvMkO97g0TeWWVEIoVm08PEU1f5QpO/dOYmVwO1idJf8du88lc7D3zTOk8zY2uJErbHTkYDISCyw1MHnRD3A39s3/IA==
Received: from SJ2PR07CA0013.namprd07.prod.outlook.com (2603:10b6:a03:505::15)
 by DM4PR12MB5914.namprd12.prod.outlook.com (2603:10b6:8:67::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 11:52:14 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::a1) by SJ2PR07CA0013.outlook.office365.com
 (2603:10b6:a03:505::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Fri,
 18 Jul 2025 11:52:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 11:52:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 18 Jul
 2025 04:52:01 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 18 Jul
 2025 04:52:01 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Fri, 18
 Jul 2025 04:51:55 -0700
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
 Maman" <Ymaman@Nvidia.com>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH v2 3/5] IB/core: P2P DMA for device private pages
Date: Fri, 18 Jul 2025 14:51:10 +0300
Message-ID: <20250718115112.3881129-4-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718115112.3881129-1-ymaman@nvidia.com>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|DM4PR12MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: 62247cfc-b5b6-4b2e-712c-08ddc5f189e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZGgFRrqpQCQ0IL7eel9ubXvzFf0V7jmQFzrxfg1QNdlylcneueCFr1craaF8?=
 =?us-ascii?Q?6rgiNMxBoqX3eonZRxO7f6spIUMT+9MvLt32fMMZh2y6sFY6+dKJg0I9cCDF?=
 =?us-ascii?Q?JCUge+/m6vUp3nzsPP+icap7omEUlIqxEI7QSTfp55mqwzC6c1WXYME2CGa5?=
 =?us-ascii?Q?VumXI3YUiXbtKzzK8zSKbgm/p5R4Hr1AvmZ7UIoO6u7U5p+DN4WqJcUVcpry?=
 =?us-ascii?Q?2UM+3SUQvdfk2pS5PeSs8DzR4eWLbET864RZN7syTH/vQngAYum02QXFJ2Qu?=
 =?us-ascii?Q?SCMbDbBPgUVfV9Hwoct0SO7AFYut9vwscuFVDpzpJ8MDhAoHvqGZUqZ0VFim?=
 =?us-ascii?Q?KusSZyKAPQti0L2amo4/PFjU1o+qkhHnwLnJHtVT5YGISTcVzVVSsi4qPuaD?=
 =?us-ascii?Q?TYE3p86q7kDSE+EToleRsLQ6ENBynqDyPcyayBx4z/LEcO3uezQN63QaDkFe?=
 =?us-ascii?Q?8r9SnutwlrCg9yVQr2LKh/Z65/NdQwWSng7yflNY7qgPWHNl/q22RC7vVOTa?=
 =?us-ascii?Q?pOGjl0e96N7FHIWCXsYAcDExbTDTsLIvldZlyZ0DH46l4FNg5W9HANfianGn?=
 =?us-ascii?Q?+eZVigQF+mk7wmRccc5AHFvrYkh1J6NyQVQzSnjTsKrVl9vRqRVZGMHDcMlO?=
 =?us-ascii?Q?Lz34P3JQMGcXTmSxYTfH2gIqHfOarW+W6owXGMQzYeBKF3NlC6/3adkjeuxl?=
 =?us-ascii?Q?Rms/FPn/nuE/nLWCyCwTrKejPhKBXCB0DQWJ+mc9OWE9PIex99Q3cIAuDPql?=
 =?us-ascii?Q?TacaMqwmAR2OAIH6qTB2qtYgDmtOz5HYBAoR2g3plUDM4Tm8QDkf425O9szY?=
 =?us-ascii?Q?tM/sl3vOUetX5ELGCOWfHpqsoroIVF6qEmgfjSQCAdeLuikjtr3stfZCWtyK?=
 =?us-ascii?Q?uGteRZjOCXwo5s7tQv1oLNot8yHA6yxMwG/7l/JorOEshH+AQ0GrQz0FU1kU?=
 =?us-ascii?Q?gQExsDObW1+iqif1fk8CIxJNYAU0nbLwlGf9gHLVjcYI5gyAnTkPA3qTSqV/?=
 =?us-ascii?Q?5Y7L9DXPALzSKQvSlPgMYBSw6Hs43bRePirevqoWI9kGAXdf5t2Yb6y1czxM?=
 =?us-ascii?Q?d7JBRJvtDeT5bWbOWrVlZV+d8cTVXirn+GrMYXCU/NtNMsQRPMbJR2oqVP93?=
 =?us-ascii?Q?yCaKmiq5byWfN3hVn2hyuonknRzImTIYieq/eJOylklHUPB2t+fajr7sB80v?=
 =?us-ascii?Q?3cRPmk6/GZM8yvFncQhAnOpwKOi44njOZOtMd90WSh2ZXPunpd8tAZwQQYBL?=
 =?us-ascii?Q?FOar0LrDFQ1tlOZfvYV4U7n/fYCN8Te/r0wJbBeWyB2nHPZ8oFmnl9oMGQjM?=
 =?us-ascii?Q?ioF6AE0wINpcuZLd1MU+FXlpAkJI/fDR/FOPGafzv2YguDLEH6LFpRrbgRlL?=
 =?us-ascii?Q?j8icVS88pv5jAHyTuXV1Rv5sqclOejbSPrSwrOxaajr+RBbYDLEF9u9ni42i?=
 =?us-ascii?Q?Hf00yhF9t3/XcBCCntRPXFriVTkrZzn4Fkp+e9B+9F+o15y5a88ndIKeTBcA?=
 =?us-ascii?Q?7JcY3jtm7+PdTWlLAWOFgWTEuTflPRSRYfFF?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 11:52:14.7180 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62247cfc-b5b6-4b2e-712c-08ddc5f189e2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5914
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

Add Peer-to-Peer (P2P) DMA request for hmm_range_fault calling,
utilizing capabilities introduced in mm/hmm. By setting
range.default_flags to HMM_PFN_REQ_FAULT | HMM_PFN_REQ_TRY_P2P, HMM
attempts to initiate P2P DMA connections for device private pages
(instead of page fault handling).

This enhancement utilizes P2P DMA to reduce performance overhead
during data migration between devices (e.g., GPU) and system memory,
providing performance benefits for GPU-centric applications that
utilize RDMA and device private pages.

Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
---
 drivers/infiniband/core/umem_odp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/infiniband/core/umem_odp.c b/drivers/infiniband/core/umem_odp.c
index b1c44ec1a3f3..7ba80ed4977c 100644
--- a/drivers/infiniband/core/umem_odp.c
+++ b/drivers/infiniband/core/umem_odp.c
@@ -362,6 +362,10 @@ int ib_umem_odp_map_dma_and_lock(struct ib_umem_odp *umem_odp, u64 user_virt,
 			range.default_flags |= HMM_PFN_REQ_WRITE;
 	}
 
+	if (access_mask & HMM_PFN_ALLOW_P2P)
+		range.default_flags |= HMM_PFN_ALLOW_P2P;
+
+	range.pfn_flags_mask = HMM_PFN_ALLOW_P2P;
 	range.hmm_pfns = &(umem_odp->map.pfn_list[pfn_start_idx]);
 	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 
-- 
2.34.1

