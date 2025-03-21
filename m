Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038D1A6C023
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 17:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB02010E057;
	Fri, 21 Mar 2025 16:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1b9AZ2oi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEA110E186
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 16:39:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhujWXdr4CcvHmsYu6BowaMAGzc0Dg46pxxmmAhV+zDcRg62dofP5Xw6OZyqfY+Sr5pgJn82+hujfLUThHxwWRwszmJGhEeS2YOOskhHftUhAErODg92LzjPGExK/D4bAcP1OdsLUSJtDMz73TPiaKLTfrUkRUzC1+RrxASX8oEq3QptH7K9n0YrrRQJnyJ3sJo0/plW9kid16epsHH0eH0zKr+H4dTbbJJYeysvRcJ0fgY2ISs8+k1tHlC5PaeDWmiUr21O5+W3zEuezjzn/gxjNEsPhN6trr35UYo9J8xo37ObPemwy1lq5gGaAgrbZ67uWj6zNfC64kTeI+vW1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=offHz67MTSkED9HE4jYtGtARkeNJuWIsljF6KlQ/hX4=;
 b=ntt/qWXfhsd1kMiX0lFJUPMGxS18I1fBp4EHNKU2duqGXvFx+eGv2pFe8IWf+eXPSYwP8FPYiEowRXjTEt0/nYwBF3aBd6tWy3eDHPPycST4hN4/ULZtnyQv4lDxXCbDKJ8A2M55TjvAdzvR/Rdjay67xx6IltaUzAuBcvAYDeR4xsJih9ADKgYxyjDNlZs+rZmYXCyoPkTAkyG1Z9EjW6iwYJA+zAVWgvyymCt0ZmBwuckcCDtiuTy0T3RTHarO/FBqmb1zNljXuvxIh4n7aFzKmaF+U9EiBeUAjFDWP/OjnKx8npelZgcY1KgRPUgY4eRalz8ukDoiokWXiVRFUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=offHz67MTSkED9HE4jYtGtARkeNJuWIsljF6KlQ/hX4=;
 b=1b9AZ2oiM54Z6ppXVjXZlOKgud7M5/3aNWvb4L8OpHhQPlbn/knlMSqbTFpntTy2kX/DMRMeXNjXZs0TQxAhNmYAKs/FgUsnDgZVgjQFuqbxTfEZCiN49rhnGIIzy0ip5/tzT1gcTRDOze1LQtYDOpBp9F8l5NgA892Coj7sdno=
Received: from BN0PR04CA0178.namprd04.prod.outlook.com (2603:10b6:408:eb::33)
 by CH3PR12MB7572.namprd12.prod.outlook.com (2603:10b6:610:144::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.37; Fri, 21 Mar
 2025 16:39:35 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:408:eb:cafe::34) by BN0PR04CA0178.outlook.office365.com
 (2603:10b6:408:eb::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.36 via Frontend Transport; Fri,
 21 Mar 2025 16:39:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 21 Mar 2025 16:39:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Mar
 2025 11:39:34 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Mar
 2025 11:39:34 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 21 Mar 2025 11:39:28 -0500
From: Xiaogang.Chen <xiaogang.chen@amd.com>
To: <kraxel@redhat.com>, <vivek.kasireddy@intel.com>,
 <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
CC: Xiaogang Chen <xiaogang.chen@amd.com>, Xiaogang Chen
 <Xiaogang.Chen@amd.com>
Subject: [PATCH] udmabuf: fix a buf size overflow issue during udmabuf creation
Date: Fri, 21 Mar 2025 11:41:26 -0500
Message-ID: <20250321164126.329638-1-xiaogang.chen@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xiaogang.chen@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|CH3PR12MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: f688cb2f-7a00-48fa-6d0d-08dd6896f6c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d0Yc1PW9+jCBpKXFBQTLF+iJ1P8wQduU6vgGVq6C71Ykv4BKZh/+mPLwyQeD?=
 =?us-ascii?Q?5a91ZCrIF86L3B66MMk4im+CICgXJM7okG0y49ugUkdhV7GUtpQaTrlzevvN?=
 =?us-ascii?Q?m8eYANrfHZQSLtSx3ya9Hp3kzy72Zu2bU7hLMPrFyhsLMufU8rG16WwxfDtJ?=
 =?us-ascii?Q?zeSVKoCQHW9j+CfVd+6x/FdgKQEyXqtIARp5SpEUV0K3AUYQkRL4mxA4zrYw?=
 =?us-ascii?Q?L+101LZVABC+0Es4cxwjCswCsU0VFzXHxa3XWU2ilaM2ejktxIe513Sr3N5K?=
 =?us-ascii?Q?147zLURvwz9ZKlkAdEqVMT8pLFrhGlPcpKUeRHE8ihNs5F3/7DEfS1IzLqkK?=
 =?us-ascii?Q?bfjqN9wBMAJQMNvgrQRkpyptSLCR1WunnIYRBjO1f6FZ3voKKxpNBWaMfSsC?=
 =?us-ascii?Q?ST3Mr1w5c1FmI01PUZSbuGBIWk1cRJCszbClK3BWys3vvtU7kzI3zmlDQDzC?=
 =?us-ascii?Q?KI5NgRUdWz9NmKT5H+cVpwtzsMbr120IjEgSNnRidEzUk662mLopODqvv/Zw?=
 =?us-ascii?Q?IvygABotHIqh1HUngXC3YLFlAeVCWvqVIx1N5ODkl6YBaRHuAdOZ6WQP4O7P?=
 =?us-ascii?Q?sIPsvlw0eW1To3n1HcZqYkjZsuhQsQmK19jElTOFjXQp0uBPDEUfqPQZWQnl?=
 =?us-ascii?Q?dOXJ5dPYhgRdb6r6j8/9RdckZeBfZ5+KsUhpBRYH4OZVqGVau5QOW/y8M87S?=
 =?us-ascii?Q?qJBUSxtAnnJ1mvwQcft4ZA4DKxDzOGfOG9M/Z74t1e8E9oxIqnOqh2e7eEQ6?=
 =?us-ascii?Q?X6ab3Xs98VkjcJHI5jnjoDTj1gasvuVWANnufK0kKK9N8rOoiIi4uqqCm0j0?=
 =?us-ascii?Q?UP6fETC84/c3Tr1lriecwOLB0QiPjemQ0UVoQKT0kA2w7B175sWrR/khIJ6R?=
 =?us-ascii?Q?qjuuFW1S9pHNt+jeGMYYaHkm6y6EyzJI8lOY5BZo4EpGMqT7uOhX89bntUbV?=
 =?us-ascii?Q?oI1+KHOrYk9r/KU2LUTw9WbO7ONPfYoYs03wIlsKvPuBzIWK+wZ8I8uuZiPE?=
 =?us-ascii?Q?FlAzW4T8VhW0/qrhUCwITsgYhbUIjc52lKc+zCwWqlK9DbsN0hEmWyAjYvlq?=
 =?us-ascii?Q?rM0I3ALEIqGzTMvZP44MIs1P0I6G+oEpQlW8lM71LJYl1xl4npI17damwZ9O?=
 =?us-ascii?Q?mSKyLPfWzkGQVuQuxR7u4LokbxMinn7tcv6D8VcDJ2f9TB4sF6VyAe6m43sH?=
 =?us-ascii?Q?JYXXvXIXzk4tHMO2p5lSHQnA6nWsFv36LtzPif30V8ZnJaot1nUgUR6xmcqw?=
 =?us-ascii?Q?SJtiCKbUdYIpDqe/pSHwzwp976PI6/ALSLO9PU1oFI+qn46Ext7gcXHujAMw?=
 =?us-ascii?Q?aPaXuRCx0BwDB11hXeflKtjyjQ46FtljIIkFWhdHtv8qVJOcqPYdfV7b5jII?=
 =?us-ascii?Q?N8MLYIscGjANJQg86cceWVmR5BmoPvmwNIfCh950Wdos6HIspzP8lCvbA/d8?=
 =?us-ascii?Q?9ZBRzPmCAl7Ry97NIlamEbYCCurvkv6zy4P0kUQ2cdiiJiADto6QxQT0IGH2?=
 =?us-ascii?Q?Hwxl6FoudVNjD1Y=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 16:39:35.0657 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f688cb2f-7a00-48fa-6d0d-08dd6896f6c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7572
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

From: Xiaogang Chen <xiaogang.chen@amd.com>

by casting size_limit_mb to u64  when calculate pglimit.

Signed-off-by: Xiaogang Chen<Xiaogang.Chen@amd.com>
---
 drivers/dma-buf/udmabuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 8ce1f074c2d3..e99e3a65a470 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -398,7 +398,7 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf)
 		return -ENOMEM;
 
-	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
+	pglimit = ((u64)size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
 		pgoff_t subpgcnt;
 
-- 
2.25.1

