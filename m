Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C961085E68F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 19:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB8410E7B2;
	Wed, 21 Feb 2024 18:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nRRkAuMG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BD510E7B2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 18:46:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbI0l1LsGhOQ87pSfHbgZ2DkZSF2yaZbeBy7bYh2MNWr6HjKS6Kg72cn9RXxo1/kwk8wn7S+vEbZuUAh+Se204UPdrrIxPPleKEm0ovjVKtI8pxagasy5iKXh6a2soRXGXVFwgoaZdne2FG1hd8XNSNcAXLiiMYi6WyBaUuXYRIUjo6CeoXZc8pVb4NZyWzZr8XSInvs39hyS5EF9FxfD3/GtSH4jeve2smSzIli7fwX9RMh5lN5zcW//rv5MV542VS3jaBQ9kSVq0KvfbVgpkuQdvaZo5n3bkCGcsXxawuuPPNZ+VFjG4hABtxWNXG4HdkFgGMMyVfOAvXIi2zDhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDboSD4OQyVw+UI8K/9BnWIB+wjSAhiV6mfOP99n3H0=;
 b=FxfcWoz3nhB/3vlUx/cgDj5S6nQdjnDluOhM1MJu2hZzjhPuL+qIn+mgEp3GAgxQc89cC+EUjtHI3VBPiaanMDU/s5DFru26S1ZXf0Gqg8Q6bRLGaftNi/1+t07kz63wF39uOaCJwLgRVg8AMmnsUTBKOxlO4hgP7V4iOrW2S0Rrb76ctFBzbiV1nwsLLFiJzm3pt6Dp/INsHe/4do0zNvHV6kkrKYZcpISCfQVC+rU5qV9Il63cqk+bqSeUlY6npjg58+9AQPhOGzmEh0DsTGkVe6do+uIa1LFPXZJlgp4i01vA8F9ixmPmnJUmY0uN+NxqHV1tjgNajEvzbNQDfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDboSD4OQyVw+UI8K/9BnWIB+wjSAhiV6mfOP99n3H0=;
 b=nRRkAuMGhKi2JIgx2tfucx89aWR0vnbuBpgmTFEL4evKCQz5RQu1TKfwvghb0//yABfrQ2scMDsoXFYrvYOZcos7whQ6t65kUWzUDRqbCb/qxOyKrfd8WHUq7CPYE7DRmErI1xatf+CJVLh58d3LtVofKaIjuV7dst2RX9TkYGd52L6BI1ZhN1mzNnIDQBHisgpIX7g9e1NUScKIVOhYZbpb19uVdDnhvMKMNaMH/MUnmpyPqYjvbHxoybgaXtZrEiZUgrhOxnv/D8VusaRaRqykPl0ruAyybPUFeP2Y4MBu6nWn1HqcEWeIGPWi5s4ZFdRUfkGNxmwcSQIw6RDU8g==
Received: from CY5PR17CA0035.namprd17.prod.outlook.com (2603:10b6:930:12::12)
 by DM4PR12MB6064.namprd12.prod.outlook.com (2603:10b6:8:af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.14; Wed, 21 Feb
 2024 18:46:00 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:930:12:cafe::49) by CY5PR17CA0035.outlook.office365.com
 (2603:10b6:930:12::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.41 via Frontend
 Transport; Wed, 21 Feb 2024 18:46:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Wed, 21 Feb 2024 18:46:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 21 Feb
 2024 10:45:41 -0800
Received: from precision-5760.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12; Wed, 21 Feb 2024 10:45:41 -0800
From: Erik Kurzinger <ekurzinger@nvidia.com>
To: <dri-devel@lists.freedesktop.org>
CC: <bas@basnieuwenhuizen.nl>, <contact@emersion.fr>, <ashafer@nvidia.com>,
 <jajones@nvidia.com>, <kbrenneman@nvidia.com>, Erik Kurzinger
 <ekurzinger@nvidia.com>
Subject: [PATCH RESEND v2] drm/syncobj: handle NULL fence in
 syncobj_eventfd_entry_func
Date: Wed, 21 Feb 2024 10:44:28 -0800
Message-ID: <20240221184527.37667-1-ekurzinger@nvidia.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|DM4PR12MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d8bad83-92b3-441d-667e-08dc330d597f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IrDMVPVviJq5PP/G571QWLsq7G+fjq32VzE+ko9V6gA/5FfsLho1CIqBgi0cvGCUgBEw0m/7UkVZVTMIhupVacRjawssZwri2gREPyljlq34v4Dc89zb+yEUR0pDLbV4Eb97+TK/gxT9dKZzoqE52nX1SvC8nNt7dW85JJO2jJ7emd/fSqrhch7gBWP1iilDuqXzjKwytZYdjwfCf0b8N5jSwbPIL+qvYqH/tFxOn0/fi+tfvqvkRDcVrjo0oWfmc4g7Asu0UY5ADclhgO+eSx4wqLoHQLDjsMp1Ta0v+o0yHv2ivNnpifbTkFQuIlFuE2DAoogTdqMVfbIWRLt12dilFyHqUUttnfdW1qO3iVmAStd8mN2HgoezuCxzBJcGdZs7wSdFNbtkuPUFHlii6ZcR9sCJiyyPWfYaYTEwA8MD4dU6NbJt/nihlzU/CYnwo7Of5hPBDofAC6kSeVfU6bpreYtlcCni0LOOQ07dsEsFC0ll2am/EWviObtXBFhdYuh5YqAp8l+jHm7lmYPcwgjN0Mjlj9W4NdZ9k83u5Q7FgHe1KXujmgJCFcAr8+RWzU180lLq4t+YDF/dLFWF6+wCGGmrYSfl6L2ZtQEprGVUNu6hC9bCMhiy2gAN/avryFsx45ECMrOp+e7C2v2ogqvp+rvLFmaX98CuA625W0g=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(40470700004)(46966006); DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 18:46:00.7005 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8bad83-92b3-441d-667e-08dc330d597f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6064
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

During syncobj_eventfd_entry_func, dma_fence_chain_find_seqno may set
the fence to NULL if the given seqno is signaled and a later seqno has
already been submitted. In that case, the eventfd should be signaled
immediately which currently does not happen.

This is a similar issue to the one addressed by b19926d4f3a6
("drm/syncobj: Deal with signalled fences in drm_syncobj_find_fence")

As a fix, if the return value of dma_fence_chain_find_seqno indicates
success but it sets the fence to NULL, we will assign a stub fence to
ensure the following code still signals the eventfd.

v1 -> v2: assign a stub fence instead of signaling the eventfd

Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
Fixes: c7a472297169 ("drm/syncobj: add IOCTL to register an eventfd")
---
 drivers/gpu/drm/drm_syncobj.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 6c82138b2c70..cb5b5838ccf3 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1441,10 +1441,20 @@ syncobj_eventfd_entry_func(struct drm_syncobj *syncobj,
 
 	/* This happens inside the syncobj lock */
 	fence = dma_fence_get(rcu_dereference_protected(syncobj->fence, 1));
+	if (!fence)
+		return;
+
 	ret = dma_fence_chain_find_seqno(&fence, entry->point);
-	if (ret != 0 || !fence) {
+	if (ret != 0) {
+		/* The given seqno has not been submitted yet. */
 		dma_fence_put(fence);
 		return;
+	} else if (!fence) {
+		/* If dma_fence_chain_find_seqno returns 0 but sets the fence
+		 * to NULL, it implies that the given seqno is signaled and a
+		 * later seqno has already been submitted. Assign a stub fence
+		 * so that the eventfd still gets signaled below. */
+		fence = dma_fence_get_stub();
 	}
 
 	list_del_init(&entry->node);
-- 
2.43.2

