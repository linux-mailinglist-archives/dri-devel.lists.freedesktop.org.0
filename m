Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DC79DF539
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2024 11:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548D410E3E9;
	Sun,  1 Dec 2024 10:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NclyeTDx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06AA10E3F7;
 Sun,  1 Dec 2024 10:38:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=coZf6enY2JBnvm4OLwRB7JgceBNOiI7U4xaMYBAHGjNDFlnLZlSCmoy+2dcG3QU6FudTnxDYKuWKufl75C9YfUFYgyS2flpFJVQXjNmadWff0d4ULmQcu+5uawAlMDL9WXLEkuD94UeMoDqmPwvPvbUyUR1WK7dv/tHePIKVL3x+bsjBNyfbqCQ0mXFgOcN39aA8TPydA7rCY7rb/h24Hg0+S5lohqqYrXby4rOUescTlkOeXXMC5ynkECPE86nrZAA96vQcmwjDCZyMVAUi+MEMiTq4pOwGQdDt4dWByBYSbIz/1mCRTwVtt+g31KpskCLuIJBCCJde8sSb4aWX/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbyg+LGFlJ8ejF7f5+c17QNDW/EF3rYADtqdJApzx3s=;
 b=e4gOfd70LeeZyPKSvZN9NvGgdfezc6iG51jm+X/e6bq3wz29elY0UaFJbJ4HXzn2UCkLjPKlRXfd61zV4V1OUrBTvp3rMVHi8hcG0Coxc7xjh0i7VXzjChYhyyycmWO2Ypg0d4yQ+FNnpqm9jmBhh6bQnp+Pw18T1dCS5bNA2KWEHK8bvMHS3omTCLLTYmQc8pQwkLLnZ4YAZVNPdPjVEadfFKO17c7xjCc1mvDMFwaOejxysxEwYoHtu3THPA3+O25nLJ00rNaQ7oS/b6BcIkOp4tm7g/4nlhd6QPW9bTflaLHfczUJWiSKYfgsHHR7iPLVwc0dAnjAvXsmjJMtcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbyg+LGFlJ8ejF7f5+c17QNDW/EF3rYADtqdJApzx3s=;
 b=NclyeTDxNisNJmR9xwDac4qKn+fI9eC2DdkCOQpcty40fxUri1vd3LV1olE8n4QvKQanJVU/LDZ5CRH+sjbDc7uy1SvGSQPpQRf3dbTTTC2ZncgmTS6sF63Qptc0YPTQmjlR52aEcm+CguSZCVSUM9xJVEB3KX+7ltsgQWzWgB7ndk7C/cQVW091kw/qAO/CwABlFd2T9lW3c+KaxLOZdV4Nzh0wFt+gDLGuJZ4p8FAEV9HhBBDYBE1j6mxQU+53bjNw58htgjVBue/JgncyTi1JVhhYUjHOiIMuilcTSh39Lbazpl71/CMQEDVwFzLKB0kylRDgDcKRmKwNSgu+rg==
Received: from BLAPR03CA0051.namprd03.prod.outlook.com (2603:10b6:208:32d::26)
 by IA1PR12MB7688.namprd12.prod.outlook.com (2603:10b6:208:420::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Sun, 1 Dec
 2024 10:38:16 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:32d:cafe::57) by BLAPR03CA0051.outlook.office365.com
 (2603:10b6:208:32d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.16 via Frontend Transport; Sun,
 1 Dec 2024 10:38:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Sun, 1 Dec 2024 10:38:16 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 1 Dec 2024
 02:38:06 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 1 Dec 2024 02:38:06 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Sun, 1 Dec 2024 02:38:02 -0800
From: Yonatan Maman <ymaman@nvidia.com>
To: <kherbst@redhat.com>, <lyude@redhat.com>, <dakr@redhat.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <jgg@ziepe.ca>, <leon@kernel.org>,
 <jglisse@redhat.com>, <akpm@linux-foundation.org>, <Ymaman@Nvidia.com>,
 <GalShalom@Nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-tegra@vger.kernel.org>
Subject: [RFC 3/5] IB/core: P2P DMA for device private pages
Date: Sun, 1 Dec 2024 12:36:57 +0200
Message-ID: <20241201103659.420677-4-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241201103659.420677-1-ymaman@nvidia.com>
References: <20241201103659.420677-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|IA1PR12MB7688:EE_
X-MS-Office365-Filtering-Correlation-Id: ad54d123-a9c9-4cc4-275a-08dd11f443c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KZmezP+Wq3JGWwEB6N2WfTCFWHXrLwv6y4ywRh7UDxP1riQyHowo0PqAEKLN?=
 =?us-ascii?Q?gkvKmbu7GXRKLQOLbYdmny38oYZjVTmGWWfICCTb7xFQmtziftdTch5u9//d?=
 =?us-ascii?Q?HUqYpFlG3Wmj2SKp2fabhu5Rf47KRSWos9iYi+QHlsPNSYrE/m2HtMhcjZVF?=
 =?us-ascii?Q?lTkvbcEcZ49KhFZyC5u3blC3tQhHarQdfbArMDq2DN+XqUUyq8Ph6Jcr470V?=
 =?us-ascii?Q?sxuiD3FB4J4TtFPNhCI56HyzBF52Ks+FpEREKeto+ItnWsA2Oa884y0d/zsN?=
 =?us-ascii?Q?iejgvcgE8CAnVPIBEHRy2NICJ3EC1Z8aXHwktsHbYn2iMIg32NmYUR/xPjY9?=
 =?us-ascii?Q?mbAePwr/WoHkZnU8y+odqIUsy/epypEPqh123pLnw4GmPZEbLIa+3jUe9GaJ?=
 =?us-ascii?Q?bUgfRBWxWCW9k8xmd660o+jt8yQJLAQmb/fxG7nEp7QQLpPCbmclIFEkIFXp?=
 =?us-ascii?Q?Jp/jMMFmmv63aHkjAACwtIrbGSDUpJFHCPWBe8eSr9qk7N2U6TB4MAGwqq4Z?=
 =?us-ascii?Q?3BRCwQzZRdsVku+yvQ/ooqEa1ukT96ontW0U6ONKkkt41v8KbnEX5a9VsPHJ?=
 =?us-ascii?Q?TuNn2F4/T3sKRbbGimdGDHQAMmkvwtIDZGSBRSdgzbvNnlHMSVhteiQwcLYY?=
 =?us-ascii?Q?BvWD9eNyI+a6IBf3jzl4DJNookWHeOOQQWWMgxeBZskaJjgqrd1IB+QB6P2X?=
 =?us-ascii?Q?BWo1POzLuJ67VQMKp7pAwL/QLJ3GUB+5W4YWBytOMamvWPjamGL68mVzw0eB?=
 =?us-ascii?Q?B8K6/G1GKhWQuOc0UXf47SfDN1XhWms3wGASdVzSXgqsWMYQ0mtHaL5XqY9x?=
 =?us-ascii?Q?BXyyQI58le43hx+8XfWDSGJvAX47B6+DItbrjugC8KTKDpz7R4DdFnddtVBq?=
 =?us-ascii?Q?HfgDLV2oG7WzCPDc1zuFvBdxJ7dk8IOX3rxKYdOHlbkOOS1cZXCr+AAuLnke?=
 =?us-ascii?Q?LToXDOwLuVASYPxmq6/5LYtpFirYtaHsXnx6nFEcobnel2JXnRv4zUyMDWFC?=
 =?us-ascii?Q?En2684DiFv40aSZ1ns71shiHfxQDWjvaLnrst1SobrkjUOeLRfnzW4wn5K8I?=
 =?us-ascii?Q?jGtovmhS839NstxI0/gxlXjCHODaqblTBVKtXLJPSJB7oX19XUR+ebj9t4yc?=
 =?us-ascii?Q?xqYBotFhKQ3LBifRuE71Cw2PVC7Bs4YF8jiIfIqqkb/WafICTe0HIco8D71B?=
 =?us-ascii?Q?Xms9vLPeC9qIwC0lUaAJ8TC1UQxAeQIFRvE//JcJUY8QBAdmF9LVMySen1fV?=
 =?us-ascii?Q?cTWdLdzZAndu60Irp8XKfC841fsIKFjh5y3eyGVv9VKm2+PHRlQkWQmJyvkM?=
 =?us-ascii?Q?rA8q3LzO9RSAj9wQqfO2Ptv339a4A1jJ0CNOuqDbQEoAgWaSoDdlsX9RhHb3?=
 =?us-ascii?Q?tkhmvCTJOk9mIVQAePaID/mbywlkVM2ssdWRrmjeUroF+m9DZKRTxEw2uDhi?=
 =?us-ascii?Q?IzdU9EUyJBFKIFt9YtQ1J7yquiKICbIwpyaO987Y7hwwoNWdaU6P4A=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2024 10:38:16.1486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad54d123-a9c9-4cc4-275a-08dd11f443c8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7688
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
index 51d518989914..4c2465b9bdda 100644
--- a/drivers/infiniband/core/umem_odp.c
+++ b/drivers/infiniband/core/umem_odp.c
@@ -332,6 +332,10 @@ int ib_umem_odp_map_dma_and_lock(struct ib_umem_odp *umem_odp, u64 user_virt,
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

