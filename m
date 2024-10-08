Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CD1995064
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 15:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140B110E53E;
	Tue,  8 Oct 2024 13:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XXx+LcZ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2054.outbound.protection.outlook.com [40.107.212.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DF010E4CE;
 Tue,  8 Oct 2024 12:00:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLZWx2dQxYhbOtpRKsWDSCIQwwsWQakq0Nn1JGUj7HfsghwXuKaN8MvxQGnEmaTX/LtRnVbeAngVdk97anE2Ist1x35mHGShtmlqmQbKglp1RXwdxD6Sa4oc0vJKXHIKW7QLR6z5jSDqoOwBKki+6Bm6OU7uq1n6zy1exb4euVlbFwclui82RfCbJU0dRSzFmiiOmmM1clMvU7ZtWkwNvQ3lwPNETE+j8KcNQbuI6zPe0HA10xWHjvx0oxRPZNx4b52ia5X2+4wgbJQxAgXr3TOnOKaJzABHIvbb2AR07SPfrriJevNDajMYNfzmbgMiPTrvUrO4TAZfBhlATbyvNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsIvfBKQPgNURFKGFmRVwqe1gWO6syWD3Pl3oeHG24g=;
 b=FcotGp7vRUMRL7volI3FfQBlwsoZTp5fXR0yHgnoRBTm3SnuZIahr5agOnAcUmy2Gh6tih2m3hF2RrVZtBDt5Z0y1xhNH3eBkzzvO5Ayli004867tNGB2ispyC2YGP79NgB6+FUnG+NzGyh7AOg0F9f9nK1PCBlJJU/an3LcXQwwt8E1LuhyscXxFdhIEAQPbpB80hbZepD4bIEqODdAQP10Ug4O11gN9A92T4CYzFPhOho73WFY6h6Kd9sj0wthSbDRF1qFfXjAHlihqU5kfiZPGivA4mp4xEHEQZqA7LF7Outa3nnofZo+1EOEJXiSZW/7ErqcOCEW9wZY5RzYTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsIvfBKQPgNURFKGFmRVwqe1gWO6syWD3Pl3oeHG24g=;
 b=XXx+LcZ6qnWEXrOHJ4YYhwu+nFDsnVyxEOW8pg75MW/FEkb45cRiJ1AMvXV86K5uDi1oApTSetvxgKaSq5MDFqeMBCuiF1Qrts8aWtrOCpu2S6FuA9IuFwBkubvbDS7S12e/Dzo6Cx/6faWUCWcQ/cvva1zMbtHKEQ+apWvX7zZkvTu/2azLG7pC6vvep8KURPc30mRiOpSQx+ZZnkL01HM9gCbR9tMgJUfoMd6h0QGGKuN8rATrzqA8AzgMPZppHjJvnlz9iLbu9BxsQZARX1fAsDVCuL9lQjLzCp/q1KpoMfdse4XCH6kOl1FBJr9GQLfZJr/+q4ShDhl84nHz2w==
Received: from BY5PR17CA0004.namprd17.prod.outlook.com (2603:10b6:a03:1b8::17)
 by MW4PR12MB7168.namprd12.prod.outlook.com (2603:10b6:303:22d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Tue, 8 Oct
 2024 12:00:12 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::73) by BY5PR17CA0004.outlook.office365.com
 (2603:10b6:a03:1b8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Tue, 8 Oct 2024 12:00:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 12:00:11 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 8 Oct 2024
 05:00:02 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 8 Oct 2024 05:00:02 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Tue, 8 Oct 2024 04:59:59 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <kherbst@redhat.com>, <lyude@redhat.com>, <dakr@redhat.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <bskeggs@nvidia.com>,
 <jglisse@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>
CC: Yonatan Maman <Ymaman@Nvidia.com>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: [PATCH v4 0/2] drm/nouveau/dmem: Fix Vulnerability and Device
 Channels configuration
Date: Tue, 8 Oct 2024 14:59:41 +0300
Message-ID: <20241008115943.990286-1-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|MW4PR12MB7168:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f5d69eb-3674-4cae-7971-08dce790c345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nXQPfLFHMA54TVwvdwPcPW3zR+1hZTXlVebjL+mCWFPNR2geL+UekNMDJknU?=
 =?us-ascii?Q?Hh+tXlDII7fDdbmQOrVgrBpx3WPmBL566kRqOwzIqZMGnh6fsmWW/WbmeNfd?=
 =?us-ascii?Q?QpLIBTdzuRPTryh+EGhv4Oe2iUwmw615+B1CbnD3nLXx4AGoEB3k507JSW9G?=
 =?us-ascii?Q?LwKuHSD3cAp5NHVJ5RqDo61oblVgMVnehMe+XEQnjWjNsVKEozML3xVKDrpG?=
 =?us-ascii?Q?OZXGTr6CGHtGFRhWdw1uAMVrirebodpBGYz3SYDUBePgZVuZOhX8Y42dXe1l?=
 =?us-ascii?Q?SQ4DKmtu7tD3IpwjzGS8tQQfjwch7g+AL0NvgH9W2Qyp3yXX1+k0Es16OHO0?=
 =?us-ascii?Q?0z7SZ+80TvlbRhS7X9IswiQRpLJ2uih0T0iwO4LssPFi8igpm9omr8PNnJgw?=
 =?us-ascii?Q?VMot5s3eBeFG/F4lE0e5zV/Oc2h3qnG+0XD6GMKd4GCewaQp3GnVGZ8D4JCo?=
 =?us-ascii?Q?x1pp5gR+CHcb4bkBEDZwrql7y9PxCOf9dEwfRwqjh4M/u9E3Q3l9kwPlvf0g?=
 =?us-ascii?Q?ixR5dlXUA1Ccc3lgXd3XG34myN2D8B09STj+cO2sqEXFS1GSR5TngMYGl+DQ?=
 =?us-ascii?Q?l5PpzBR/9nxthILfdy+M16Sgzbax/p3kpEZKZJLRdP7tFISJ5gKdO0wAP1BX?=
 =?us-ascii?Q?pnp+PG6Ivhnw7k6ohm80UUCvwyHfi2Wk6QQ7QLf0XE4ZFajDTD3N/x1cnxKM?=
 =?us-ascii?Q?J3Hv6dva6+dWlQf+yaZIhNQY/Hci09d5h37Eq4ZJ/5Jo/fCm3f5OdZEHtkT2?=
 =?us-ascii?Q?8S86d5XK5llsjIDaC2PBESt/1ooSEBUQp7Ev4DgHaqJFmP0U7TRZolxDYKTP?=
 =?us-ascii?Q?OvgkWE2t0LC2A2zgzdUiG9C9k9oe0wQG45CiNUFzN08+gRVEgHgSGOxsJk3Z?=
 =?us-ascii?Q?1VHmnKaZLMOLnZod++/jUr+6uWjSHC0V/yyRulFZkiM24yfcPLVh19JFN5ze?=
 =?us-ascii?Q?sOQMeFID2RdISWO+HQLqFIqihjfbrZAe2qr27Y7JrVu7Tf8zMpsSlas4KJzv?=
 =?us-ascii?Q?Wt6egRciI6wK8d0AQajRAN1GWQ1oPo+7ns37cLMBs1tGqZPrm1LMQaPIJxe+?=
 =?us-ascii?Q?Jr0lrdplQxwjJ/qkxN1+14OLcUpMeD03AdzvjdhHETMhWtLYCGFm9+c6vywR?=
 =?us-ascii?Q?6Quh/j8TNPaBP4VzHqoxO6nsvjYszCgoZAgFD7RSsPE1YBdtgqMfe/1B81ge?=
 =?us-ascii?Q?UvhmWUMQnYffgXaBIjvJ+eF8PwWr5KqJ8C0aMHLVr+9l28B/GQSttNmxxbHe?=
 =?us-ascii?Q?EO5OSCgTp1q6tdkYeNPRLf6vpds9sKm4pOkGcODBKrL1AET24KCDTYwU2Xb4?=
 =?us-ascii?Q?yr0N1g/sJASIRtlVeLzlXG8JEbTht6z/RTjMnr/NWSzWZYrL/uFmarfqR88V?=
 =?us-ascii?Q?21d4Xa7JsUgnh3T94jj7+DlWnsXZ?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 12:00:11.6247 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5d69eb-3674-4cae-7971-08dce790c345
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7168
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

Changes since V3:
- Fixed version according to Danilo Krummrich's comments.

Yonatan Maman (2):
  nouveau/dmem: Fix privileged error in copy engine channel
  nouveau/dmem: Fix vulnerability in migrate_to_ram upon copy error

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

