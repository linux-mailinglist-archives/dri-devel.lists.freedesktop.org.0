Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AE499F7B6
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 22:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD26710E608;
	Tue, 15 Oct 2024 20:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Lh6jSU5c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADB710E5AA;
 Tue, 15 Oct 2024 15:24:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9YJsP9XsJbz7uAP2K0dp6xNI/hDiO6qGTeK5Uw1Q0rOgi+uNQvSh3vIIFfk0a6cmqCMirB3A+OmDiUorbUGTZXxQBkkQR9Jy/U+JA/ESqvu4DTUk0f6oDqldadlTT2pKUB6v9gpH6W/94pp4PNOrPZ/FtuRxIPNyt3TriwomJcO9vAIKI60ojWMCF072FwSdkZVW2hG09NslJSr4AOOEBKnKaOCExtv+MfCPYYGmemjO+8vz6fj2Xs0mYkV8he/3rtxuZ474TzLi9c//rpZAN+waW8Jxdw3oHEWC2vT4R8TvO3HmBGg6H9a+Xhlff9Ntmp3PODNl9OpF0WQYUn84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/lrVl1VFYPdVp8Dnfq0tyenbmZBRBm95p50EAMlqC8=;
 b=H1+AM++YtgfGPwve3GXUHlwYEq71HTAIbZRXhwuoSmmhO01BhmDNcFzXcFg2jzi1Bq5AJlY8iVVatCDZ3e/cbZtXMWBv7ByijLKuJaJ1aI18cqz31C0staQxjr9wbScJ3YckPF14WWNqBfK1KnejStmq7VR2j33enI0ZUhNMxafVdIUshIAhM89E7BwZN2i/gwttJh1+iqTVzSnfcytCb+Yo6zkj8fFZWI4ldaZkxoY7R6okgNrDQF8hvBoFFHyS2f+5BoFm6oNMnrXa7q044t7JeF5d/Gijk3/2oIpqOKSRn/CP5p+XBexANTq9+Dc+JQEoRtve11HScZ2Ya/+s5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/lrVl1VFYPdVp8Dnfq0tyenbmZBRBm95p50EAMlqC8=;
 b=Lh6jSU5cq+AJm3eSwpR5vM3WKFGMiiI0ArrgHRcGy+G26xrIxj5Qm2jXmHwzrHFsLyUg+qfbp4/Ft9Nvp+xWOochIVPJW9EmpinCVjW+oW+d/uCloP9K0zYyFVl9TedC2EFBHJqwztMPmzpbWuWzjYnvtnXcGgbXvhDI0EwWH1Xro72YaVvhY0xuHNiiXilJxBfNnuncUzQ7swa0a4WgtwC2FRTRsmx69EdaBOwYejBhvTiPHKMbsR9hpWp0BQ7stxBAjRH4SlxmIycccI2fCxN1s959plO7279ZwxlXd2xlRVYmCnqrpkemIC+TgRjbuhoHB+kdXF1zXBk/LVmMGg==
Received: from BN9PR03CA0263.namprd03.prod.outlook.com (2603:10b6:408:ff::28)
 by IA0PR12MB8864.namprd12.prod.outlook.com (2603:10b6:208:485::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Tue, 15 Oct
 2024 15:24:35 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:ff:cafe::1c) by BN9PR03CA0263.outlook.office365.com
 (2603:10b6:408:ff::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18 via Frontend
 Transport; Tue, 15 Oct 2024 15:24:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.1 via Frontend Transport; Tue, 15 Oct 2024 15:24:34 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 15 Oct
 2024 08:24:21 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 15 Oct 2024 08:24:20 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Tue, 15 Oct 2024 08:24:17 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>, <herbst@redhat.com>,
 <lyude@redhat.com>, <dakr@redhat.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <jgg@ziepe.ca>, <leon@kernel.org>, <jglisse@redhat.com>,
 <akpm@linux-foundation.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <bskeggs@nvidia.com>
CC: Yonatan Maman <Ymaman@Nvidia.com>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH v1 4/4] RDMA/mlx5: Enabling ATS for ODP memory
Date: Tue, 15 Oct 2024 18:23:48 +0300
Message-ID: <20241015152348.3055360-5-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015152348.3055360-1-ymaman@nvidia.com>
References: <20241015152348.3055360-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|IA0PR12MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 831e4da0-c848-4740-6d30-08dced2d799a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4V6EdxkGyMmUbDNSLHuCOf4a7m//JN836m3OuI9qYscOVWt+U1KV+VogYCWs?=
 =?us-ascii?Q?5hF6D44MvDWdOQ0C7eYTaZCOy8NbHzvaIrv0AssPtniQBp/a2EmvngZRJVVk?=
 =?us-ascii?Q?ErCMv42+1DZfO9m9GbLVNurLr7XL3vNp7FbzDuegoZZA0dtZGMnLCIIlc8QH?=
 =?us-ascii?Q?FjvjcAjObQgwmGfD+kqpUlkAMXuM+Qbt0KUJQ2QDp6s4UUfQdRPb5YbtEOYb?=
 =?us-ascii?Q?+BTjBzL7mHrPnmLxclt2sAkn5CSW8HwV/VzOOcf7GQ77hqWBrFuGvBS1NCFQ?=
 =?us-ascii?Q?FtL4Ld9+Wtv9ieBydDY59W9biykBJABEWo2iz7D0Ot2Wc0NtE2BJpOYxkZf9?=
 =?us-ascii?Q?SVjH7KviVTnncewtNe0zatpdI9zTj5yq9Cs5QjymV7l/ev4AzLWjtsH6Uj3h?=
 =?us-ascii?Q?Nap8Fp7X0bPHseR+oqsS7b98JvRHZqaFk8zaSr4nqkGB12v5YzITQR1P8LhM?=
 =?us-ascii?Q?Qpax5+PIp3gKBbK5mTlbbL3JWl1S8rRaVHAgD4vAfO0fzEJS7EKZe5ZeGJpn?=
 =?us-ascii?Q?g8GOh6E2gS0Dl31nsQb5bVWOEFG7mJCUtlw0IOqbpffRECcanPk1zfVQ3x2C?=
 =?us-ascii?Q?4s0ORa6CMT4mQ1DODPzLUPa8tqiUCiqVAIigjj0e8mSuP9JOWA1ym02pJkel?=
 =?us-ascii?Q?DoCavGeYOtc3oOhjl/Z8fam6tAG+chcIxdRlfYSfsU4jTUax8anRN6QLr9qk?=
 =?us-ascii?Q?B5J8hVHki1SUVwhigcQylrGIGC60E3OAPGC3sdyKYrU2/iugyiy1rpbuhzd8?=
 =?us-ascii?Q?vMCvJoBh6x9Lzz0zxvxPLzBPFVhkujhPVTr/nfYRulw2jSchtWciOsDEVNwl?=
 =?us-ascii?Q?sH+jLSWWnFELrn3gapfNepkjcn2y3mimX5UK/HfKn+AT1V5MXx3BeYq5hrrb?=
 =?us-ascii?Q?MSbdFKmSDGNcgrT0HobxwO/avBZyed6hbPPin+LvVlaJK7rwSzk6lKkI2ON0?=
 =?us-ascii?Q?jaEwbByphS/wZzQjz7eEZne7KCjv+FEU71nxJpSPJ+mdHYfoG4xJDnEEOy57?=
 =?us-ascii?Q?HC9xYGblU8qKM1XVrDTMYdZL+HkZKuzkdKCVNz4whOhf8GaeH+RAeI6eEIYZ?=
 =?us-ascii?Q?m2Z/SiBAcn3BBxpfqslJLQsPTMLbZ1ZBTwliDBtBI0TA91CJ17TUCPx3yWec?=
 =?us-ascii?Q?idpw3bFKgrobR8qNDK7Laz0uYv91rZENBXNikOv9/Cx8quSo1cyuGDlfisgX?=
 =?us-ascii?Q?hs7X8Hoa6nkiPAQaHEc72YjH2X4ZM50ywA0t/NFBgke8porAC9bTCRY8YCZI?=
 =?us-ascii?Q?Rbs4JPttKHLk+RQnyQiUHlaxsCfK+bW2pJza7xAPOzv7Yg24cDFfjYUethjg?=
 =?us-ascii?Q?IEMPi+uMxm3O30NKAcshzQAkL1bQY3TGAFmoRXC4Ndgs8Fi4oxmb3g0QVvz1?=
 =?us-ascii?Q?FuHnOHHrD2G0M4UXMmNS255FALDz?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(36860700013)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 15:24:34.7211 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 831e4da0-c848-4740-6d30-08dced2d799a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8864
X-Mailman-Approved-At: Tue, 15 Oct 2024 20:00:36 +0000
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

ATS (Address Translation Services) mainly utilized to optimize PCI
Peer-to-Peer transfers and prevent bus failures. This change employed
ATS usage for ODP memory, to optimize DMA P2P for ODP memory. (e.g DMA
P2P for private device pages - ODP memory).

Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Reviewed-by: Gal Shalom <GalShalom@Nvidia.com>
---
 drivers/infiniband/hw/mlx5/mlx5_ib.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/infiniband/hw/mlx5/mlx5_ib.h b/drivers/infiniband/hw/mlx5/mlx5_ib.h
index 23fd72f7f63d..55ccbc7d9aa3 100644
--- a/drivers/infiniband/hw/mlx5/mlx5_ib.h
+++ b/drivers/infiniband/hw/mlx5/mlx5_ib.h
@@ -1701,9 +1701,9 @@ static inline bool rt_supported(int ts_cap)
 static inline bool mlx5_umem_needs_ats(struct mlx5_ib_dev *dev,
 				       struct ib_umem *umem, int access_flags)
 {
-	if (!MLX5_CAP_GEN(dev->mdev, ats) || !umem->is_dmabuf)
-		return false;
-	return access_flags & IB_ACCESS_RELAXED_ORDERING;
+	if (MLX5_CAP_GEN(dev->mdev, ats) && (umem->is_dmabuf || umem->is_odp))
+		return access_flags & IB_ACCESS_RELAXED_ORDERING;
+	return false;
 }
 
 int set_roce_addr(struct mlx5_ib_dev *dev, u32 port_num,
-- 
2.34.1

