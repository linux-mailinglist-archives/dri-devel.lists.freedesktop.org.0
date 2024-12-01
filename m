Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C2C9DF540
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2024 11:38:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C76A10E3DE;
	Sun,  1 Dec 2024 10:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IDwFBfwO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F65C10E3F7;
 Sun,  1 Dec 2024 10:38:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpK0LmS8UTBk7qNjxrWU92rXyT8/etkQJ0thpXKnTBfE93o8GUwWSVjDOIwzh1Aogu7KhlzOHmjtqvc5RyS1j6NiWWAdqasY9rJa2HIP2hNlbQvMpreinGcWq4/a7KJwhL7Vab4gWCms0KnQ0z8hjiONw8OtQGpbTVIrsAXmV3kbsmRZYsUN0mvxwF8QQE3B78l7sW0BcV7L8sN4apQmwkd6ni2SAcMqLuGXuy+QEjRf+qxluhv2UC99WKnDUjLLIrTwiJBTlbogEnM/j0YfF9/Ujt3qzO51ccOMAJQZNOW/FvM9ZjuA4HI8ZtpGQtmlwvPchZDgHaRFF2kqwVbQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Om5/P0VucjwtVSyPAahMihMrFKhMEGTpXlaDQvTox2M=;
 b=u2Jm+zm6RVSCNbKPPGpGFeLjdWDPsif5wfY88usujP89st8yort8Ienfxi2SIUCP7q9/De1YeNc8UYcZfKswJRMhyzpO6z8vJ/nj5ZANjo6sxus3K3eBbEVxK4JvKDi3qSeWR7e7pkp2ukCy5zCSg5K+CRKYNC6v7LWXuJvLNrGGtMeKG5VML5665ACuxKweDSkCl7YPWGKvJ/IC9Pi5KBdE4acm6ml+TgEMs7nAA/9qSFJiPubyBjY2JtNeNKZ0Im1FcS6C/EsuwS3OH0Hb3J6Rb5ggRcIstx2O6c7ZMA4mdLh1nnYBo25tOvs4bTfjkj5OaCpixOzpzT9QLbyxxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Om5/P0VucjwtVSyPAahMihMrFKhMEGTpXlaDQvTox2M=;
 b=IDwFBfwO5qS9Tg6KYGwJCywwX5rEM15VOTszLcScVSysxrWyuhMYcpE33plE/Hj8y1CQ/AEY+e3GIYhPzTX6XvmzQoLySHveKcPRxeZOn8UAfmEf/zcIRYyTvlpedvTaCi/Glk1XnA5E3TFH6J+h6NLvCwLqKDvY8kP12u0bgNAYHUuvZTj0V1BhpaDjMOihzD1iy9LlpWVdc2oMcYDZUbH8MrYnMvYHmwWao7RE3e5OmwSXZS9JmdKR2XtlbE4uvA3LxmG0SmWyU9/I62MPoO0SB4GHsh3jEPd+lz7e0BKNN4837TpyP7fiNx19fKXU79jP6mDYL2V9U0tw8l89vg==
Received: from BN8PR12CA0020.namprd12.prod.outlook.com (2603:10b6:408:60::33)
 by SN7PR12MB8790.namprd12.prod.outlook.com (2603:10b6:806:34b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Sun, 1 Dec
 2024 10:38:28 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:408:60:cafe::dc) by BN8PR12CA0020.outlook.office365.com
 (2603:10b6:408:60::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.17 via Frontend Transport; Sun,
 1 Dec 2024 10:38:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Sun, 1 Dec 2024 10:38:27 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 1 Dec 2024
 02:38:17 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 1 Dec 2024 02:38:16 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Sun, 1 Dec 2024 02:38:13 -0800
From: Yonatan Maman <ymaman@nvidia.com>
To: <kherbst@redhat.com>, <lyude@redhat.com>, <dakr@redhat.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <jgg@ziepe.ca>, <leon@kernel.org>,
 <jglisse@redhat.com>, <akpm@linux-foundation.org>, <Ymaman@Nvidia.com>,
 <GalShalom@Nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-tegra@vger.kernel.org>
Subject: [RFC 5/5] RDMA/mlx5: Enabling ATS for ODP memory
Date: Sun, 1 Dec 2024 12:36:59 +0200
Message-ID: <20241201103659.420677-6-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241201103659.420677-1-ymaman@nvidia.com>
References: <20241201103659.420677-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|SN7PR12MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: c96b6a3c-d68c-458e-1b18-08dd11f44ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NqxX3b2JY16FbXvl8cD9+y1neSRMNNSXfyxI9S1O5WiQaeHcoeWxxhjiEcY5?=
 =?us-ascii?Q?yjJYfY/6GsaaA0UTui1909CmrGNFQ6FOu5DAegxKJUgCKgJ82EH5XpjKoQhm?=
 =?us-ascii?Q?fadMoxwrRHsDDRf1elq4Eur1I4MD5vMl5v3moVeM7l+VYUyxCFh0oX6Gyiwe?=
 =?us-ascii?Q?SXdkB/K0KoSZv4qlKBEMMKchiiQCFCMYgTJSBfhx1NzKA3ZLYuCpUCOKDhz0?=
 =?us-ascii?Q?7+bgRkMg37DVR1Ve1ekLAW7GnnHTfmkKezXCqjbv7DLtIsJGrU6vHtQOx2vp?=
 =?us-ascii?Q?vJ9Rx2tHmaahZp58b/SG7SeCzxP18jebJWoiYHEHYDd4X8HeI2sZmrbceSsW?=
 =?us-ascii?Q?Vg1F2HeF2YpaJTQXhp64O+RW9U88JvGalV2ykBt1kmyb4trMyVgfJZSSxMGA?=
 =?us-ascii?Q?2bckimRnEJeTVAro873CyZT5SJoHPl6Q4oKhWl+4BrRIRchAzsCxu2GhvjUM?=
 =?us-ascii?Q?Dk+59eSdG9JUMKTtTRZHRYTas7MygxLL4awByg8KwTf3Lm5F4Ud7aL878PkA?=
 =?us-ascii?Q?boaORVCwMXZHrKRvgJWkGsuv19AZC01TygPXvoSs3g6Xnb+rWByWYiBUqcck?=
 =?us-ascii?Q?FzLODrspZbLZcQccO4NZANJ3gfdnHNAGm6aDDSn7Z+H7FDWcLhorr4Ienjgs?=
 =?us-ascii?Q?xOO+uCIrvOGk1ItH/GrNCIvoqg1WGTjQUAXAouhuL6P+wJEI+P7RAAMRrXaW?=
 =?us-ascii?Q?zyvnih3DiaVgSvQ4XhSgzh1Y2mkaHzOH6JhT+ZbbfaFF39DkIK++ubmGmUl5?=
 =?us-ascii?Q?NYxwvGn8lEh5Nl7/bWX348FDIRlE6tmb71sbTzPPzvBRZ7frt6WRjdCTFNKA?=
 =?us-ascii?Q?87V4tH+1hdkAcK4JmemOYMW46RMMV9zNVmBHL4gjzlBJ+rBIKLFWleyE44/o?=
 =?us-ascii?Q?RW3xvUsbFx0dLk8Xals33J1IbgAy71xTUSm7cCeED5TLIYMFCrgYHdKc3YLY?=
 =?us-ascii?Q?3ZWF3b0XASg5JioPQK4fnx3Pm+ihQEB08Su4e6CNtqOba0NK8W2RW8hXKYSy?=
 =?us-ascii?Q?nr30LQM7cwYgp35E+MXnxRRenih4Ee/KcWQR5Tb3XwALiOR9jxuu3ALwDch+?=
 =?us-ascii?Q?tpbMpO4GNodAXy6Lf58I6+kYZ+LHMlCbJg5mjb2I+G3miVGMU6jsh52nujR3?=
 =?us-ascii?Q?qbLpC/C5qRuA1l7z+beSbEf0787Jn4kqfBrxjb6bw3cuHEPkzYFTypeiCFEg?=
 =?us-ascii?Q?ueJGUhtIxavHB8FNPw/npEAuTODFQ4EHNwAlrfDguTGFItpCB03yVGZaYYZa?=
 =?us-ascii?Q?jayqXLZ+BVatD9C/9y399bpCBiP6D6L9VSYttqEzBC0YXIkJYyC0V+gvBHPN?=
 =?us-ascii?Q?Ra73uSrHoCz72KPf0gBU111AkQuoX3p/q0LfTtOKvAwBtgNEXes84bK1cL5N?=
 =?us-ascii?Q?iL+xDoJemmZb21ruycgPF/sLbTH9a8Bed7P36tNRFGSLxuenOqwwTmQII0sc?=
 =?us-ascii?Q?ny5Wjl+wI0S9pqSPlYU0Qv3D4k1UQuSHFjdsl8OU1GiScPpk04FilA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2024 10:38:27.7809 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c96b6a3c-d68c-458e-1b18-08dd11f44ab7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8790
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
Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
---
 drivers/infiniband/hw/mlx5/mlx5_ib.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/infiniband/hw/mlx5/mlx5_ib.h b/drivers/infiniband/hw/mlx5/mlx5_ib.h
index 1bae5595c729..702d155f5048 100644
--- a/drivers/infiniband/hw/mlx5/mlx5_ib.h
+++ b/drivers/infiniband/hw/mlx5/mlx5_ib.h
@@ -1705,9 +1705,9 @@ static inline bool rt_supported(int ts_cap)
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

