Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65970A26A3A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 03:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FE610E5A3;
	Tue,  4 Feb 2025 02:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PEWjs1SJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1BA10E036
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 02:46:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdGhXanY+1ZtFRA2TmS0bPRJ76q6K2jmpJgPTKUjvswA8+4502qGLXnKj3LNuQ2vMkE7YvMy0aXn7s2gdClOTfJKphJAtKvDl8aroGweAWik7SReXxLM12bUNIfaYhNI9j/Tjt/FcU/5oKCgtPWn8IODNY5xLuFx3Fj9/Uc5gGZoIL6+rbgAHhJBVxQ7A0p06ZKenkakDW+Q1cfUS651uK1TIO7kds3DKN5EqfFW51XABFJe+vT4QjVbvSc4g+Wd0QwGBPhQlfWkwb6PQrv0S77tF+zVRvikpOXeJPeO1rnpiAilLRF0R2ZcAEXEG3U9U+cGyU6Vkk0sWYYjsva6sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrApScMxKgJ9JYnFrLt6cV+3BNG1c8zGNYjFSQrmXpI=;
 b=VC7XYO5tuWr8yTank5q+gI/LLUH+graIwFvgSmg55KWwKa60ad2MlUr4lTXNgUigwafaJ9WfvOVlBlf0F+CYwYY9Ik2ttvirFQvwPcBuM1mYh1axkuHFRMkXOI6qxfLW413EKEDu7Z6zrynUQQ+ATYLMqob2X//S4BK2C4NPmY4UO0wrwLwsj8IEKFE2GGlv0W76abqYocl7b4g/1AqyZl6QpOBe77KOoOIfMautZk/M/xwVjw7ASfV+nKRpmi2vqyKiyfd7d21JSpYtwY+k2YFQfcFOaG8HNuWq/PFWRHt5RXDblbn425YFxARNg3iZB5HHCTpFKMC60P9TZWrdKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrApScMxKgJ9JYnFrLt6cV+3BNG1c8zGNYjFSQrmXpI=;
 b=PEWjs1SJtnGBz/GF+4bI9XcUi+XiW7hT3Cwj1fRep8Fy8DrpwQTVIzQ1dWpi+itUIwcIhfbBKbwnrYLQiYgvTBKHq1qoZovgrr1ZqDQVUbIVaiMdyThUK/oSpKiUS3aUo37XLln2yHO4MaLYItsXwcqsbgdpvZ2xAKQphq1HNQ2xZ4O7H2e+VCNH+5FZO81m6+FFe9QDTp+cJICmiTgpGju3pxIUeCWeIqR3LlqwouiCEnbr+yDUV2/KmOiw5+uQsSjULCj90kM1DehmW34+rzmGjHcSIGLilzOoMkSY82gOCUDME+Q8quHm/MA/QbhSGRFkft8nNEvJiwbuk6oJYg==
Received: from DS7PR03CA0132.namprd03.prod.outlook.com (2603:10b6:5:3b4::17)
 by DS0PR12MB6392.namprd12.prod.outlook.com (2603:10b6:8:cc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Tue, 4 Feb
 2025 02:46:18 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:5:3b4:cafe::c3) by DS7PR03CA0132.outlook.office365.com
 (2603:10b6:5:3b4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.21 via Frontend Transport; Tue,
 4 Feb 2025 02:46:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Tue, 4 Feb 2025 02:46:18 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 3 Feb 2025
 18:46:06 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 3 Feb
 2025 18:46:06 -0800
Received: from build-mperttunen-jammy-20250115.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Mon, 3 Feb 2025 18:46:06 -0800
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>, "Mikko
 Perttunen" <mperttunen@nvidia.com>
Subject: [PATCH] gpu: host1x: Remove mid-job CDMA flushes
Date: Tue, 4 Feb 2025 02:45:46 +0000
Message-ID: <20250204024546.1168126-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|DS0PR12MB6392:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c79bb5-a7e2-4c72-4856-08dd44c61a06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YxNzx0256TkG5OLV4LB0LdH9fqXaMwO/qSsso9xQLOIddfS9uHAlZS/e7zWn?=
 =?us-ascii?Q?P/YSbWK4q4c1xr4VFKHlw+4G/AZ7E9HsMhQvzgEdg6erfOh+MRjzKADeNJaq?=
 =?us-ascii?Q?TvP/joJdDO1h3LNpA80ejdLyX2b4/VsQRKWzIp/ZVq0mRMbjKTmiroK2+FPX?=
 =?us-ascii?Q?tuaU4bErUT3rNbe3mo71u/tfy96N3RMe2TolviuUJVDs1UZsBgZoKTam8x1w?=
 =?us-ascii?Q?si5LZMJRUXfpBRRVuaJSuBvKi2J7vAemvTExq60KdGcMHE0KXRn/np0/ZV9G?=
 =?us-ascii?Q?tJ2FihQFYteI+6MQ0LU2iUFOe/z/Jk6kMARI3NdeW4e3MyK3aBf+n2uEKmU+?=
 =?us-ascii?Q?0xyer+NSvnkFHVRjk2r3bQCZ+IwFzkrFWu6+Z8uOQ/65TjtEdz/zZF0UfloG?=
 =?us-ascii?Q?BfmzispbK7zEPu8lrd4d9IdPZ6e6QrGwCllS9GYRFMSwJh8pNmfZ0BWiAsk1?=
 =?us-ascii?Q?XRZyAGQcxlyg1Op//Tud1dkOeN6YkPpt2P/shniwSBLpG02HZn6dVZIF59iF?=
 =?us-ascii?Q?F3AIyPwEZ8yBM8LAnGrtkUeZhXngp5IgOZWQnJWH/I2qzGeudXecipyj/Fly?=
 =?us-ascii?Q?hQj2WVpGiYeTY6qsaPftTsoPXz0N5/COg7zo3mQXBFe9VGqoFwL67c+09BOr?=
 =?us-ascii?Q?VVHI5kHH82qrFLqzyUim7XMcnHTV4EkjKx5umIe2SEmLiC0tVR3dKh/TfwxP?=
 =?us-ascii?Q?WAIW2sWWGCgcnbjAxMgrmYgU0wBMie2Orobne7nNJX0exG/c95CrXgY1Afhr?=
 =?us-ascii?Q?/7+mr5VkmPmZnoNXc2w30z6H2f996BEES7IzHDIBL+/m+ZhYPj4sbiTW5nYn?=
 =?us-ascii?Q?1egA3bpB9j19CXefa6W3ydnkZEh2jzfiuJEPQ+BvPociPfVNwl8qjCZrJHqo?=
 =?us-ascii?Q?aYcm9CAEhfibEkxfiA45xRxd0Eww/Res9wlBWZxf213zxRGxzLhky9NL6cry?=
 =?us-ascii?Q?gH6p2P8hLOZ2i2d4OGKQo3OzsfW7GDATjkJiWaDKfRnaDo9FTIER4C1Q112T?=
 =?us-ascii?Q?BrKAaOm2lW4hhuBW0Pi/KSqbCcXqzhLHDZOgow9wc46W5pjhvO/4lC6oeAIU?=
 =?us-ascii?Q?u/borO3FM3NweRfZtihWOMmMMZcfHbWlE2KruDU+GOKY9fQdJpL6Myspg92O?=
 =?us-ascii?Q?OOKRxY7fk7HX7d4U0rylk9QzlZJzTn05DwM84pIXDDgvymP7+uEsxQBWcmD/?=
 =?us-ascii?Q?SEhDKFXG+B1P++07dMrgzqDXATGMolnZQn/IfplQ6MOOX7XHtdwnlF+RyLcq?=
 =?us-ascii?Q?L2xY5uo9RvDYghSoJcnA2IiSricdsrPd59T/UMRUG/S4vXlvwZGM9cqlxiMo?=
 =?us-ascii?Q?Z1rgGtDSfmsXPL6Wf2TotcSlOMoBGj+KivWSX+ozJd+6oRrAlbGsqXWP7JB4?=
 =?us-ascii?Q?ANxrtATlEMzwjDy5KI6+acIw4/yM5oBOy3SmBQlAHxpSAMwkISnH4NCFG6kU?=
 =?us-ascii?Q?6drxBf2pBc/EzIlM0gcl8bG8snLP0xRqgMzZJTOprDZNL4Cgy17U+FtYXhhi?=
 =?us-ascii?Q?5QFZijbs5wBAi/I=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 02:46:18.5592 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c79bb5-a7e2-4c72-4856-08dd44c61a06
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6392
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

The current code can issue CDMA flushes (DMAPUT bumps) in the middle
of a job, before all opcodes have been written into the pushbuffer.
This can happen when pushbuffer fills up. Presumably this made sense
at some point in the past, but it doesn't anymore, as it cannot lead
to more space appearing in the pushbuffer as it is only cleaned full
jobs at a time.

Mid-job flushes can also cause problems, as in an extreme situation
(seen in practice), the hardware can run through the entire pushbuffer
including the prefix of a partially written job without the driver
being able to process any CDMA updates. This can cause the engine
MLOCK to be taken and held for extended periods as the tail of the
job is not yet available to hardware.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/cdma.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
index 407ed9b9cf64..ba2e572567c0 100644
--- a/drivers/gpu/host1x/cdma.c
+++ b/drivers/gpu/host1x/cdma.c
@@ -247,8 +247,6 @@ static int host1x_cdma_wait_pushbuffer_space(struct host1x *host1x,
 		trace_host1x_wait_cdma(dev_name(cdma_to_channel(cdma)->dev),
 				       CDMA_EVENT_PUSH_BUFFER_SPACE);
 
-		host1x_hw_cdma_flush(host1x, cdma);
-
 		/* If somebody has managed to already start waiting, yield */
 		if (cdma->event != CDMA_EVENT_NONE) {
 			mutex_unlock(&cdma->lock);
@@ -591,7 +589,6 @@ int host1x_cdma_begin(struct host1x_cdma *cdma, struct host1x_job *job)
  */
 void host1x_cdma_push(struct host1x_cdma *cdma, u32 op1, u32 op2)
 {
-	struct host1x *host1x = cdma_to_host1x(cdma);
 	struct push_buffer *pb = &cdma->push_buffer;
 	u32 slots_free = cdma->slots_free;
 
@@ -599,11 +596,9 @@ void host1x_cdma_push(struct host1x_cdma *cdma, u32 op1, u32 op2)
 		trace_host1x_cdma_push(dev_name(cdma_to_channel(cdma)->dev),
 				       op1, op2);
 
-	if (slots_free == 0) {
-		host1x_hw_cdma_flush(host1x, cdma);
+	if (slots_free == 0)
 		slots_free = host1x_cdma_wait_locked(cdma,
 						CDMA_EVENT_PUSH_BUFFER_SPACE);
-	}
 
 	cdma->slots_free = slots_free - 1;
 	cdma->slots_used++;
-- 
2.34.1

