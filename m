Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 566DF97A2FA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 15:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFB210E36A;
	Mon, 16 Sep 2024 13:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iWs9Fc3h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062.outbound.protection.outlook.com [40.107.95.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6E610E36A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 13:32:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Chj2x4enfY4kdJLzppV29vZjjXsmOy6YvJou5mjCyTDHxmqbUehzzdjMc0BNDDtYtAZfmfxIGWhBcUtzEgR0UJ9usU0WQ/Ql5TvJ067xKGt2oZnZTpikM+PLh0qtTNkYd9Eype/eyReJzV0rKdd6nDlWdWTNERPDuoevhs2ltHBoTgq2u8mg69JkaHZPRWgbNo6wNvAohDBOZU0NJhzlxIXYgSR9AIOuIm5qSg6z5wCWvm9ipjGYxHrEMianbcozUZUsAZE7ymIG7KOUNqEf+LKVXcZifBkSi7wrNZ4o3LU2gv24od8iY64XiXioCaU8FZzGyyZmCucZ2HilVpbtLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMO43FFRdWMXeU1mrRzowYjSmO8hoiIQrOvxuMHVUJ4=;
 b=HgUzL7ANwzzIZmXKfGwKQRuH4rHaqplyt2LGK3G8h9JQlI+fXf0ExGzP5eZyuHbIGUtuKsiptSdJt6aV+7Ybw/x9Dgt5rhMn/HAB0jfkxtogyyg25MAlGsxLOsHXDyztnX1o/9UhDPV72ilmUkvt1ySr1lX7enBveMmeo0f4Nk12lyw0AuimzKEM0JA5GteSI9De78qkTCpnLrwMzCOAPaDyS4EzUrXXJCkAnUdlEPHZfoM8+JbPJFTb+4hjB4Q2GVaLJaxoFF9QY8WmTGr7bKxEapWAETzyzWMfGYg3xuU1+oIvuQ1TaG+Ulb86cUEidlDGizaI4WditpLB60rQ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMO43FFRdWMXeU1mrRzowYjSmO8hoiIQrOvxuMHVUJ4=;
 b=iWs9Fc3haDUsEefu7qVp9yi7PJdsqDK1cXCk098MGO024xJ5U/EgpoLQr/VUfmZGGvEmHJNl6nF5xTi9RAwHICuVU0J53RL0nWoZl8hLGuglkH0s58kgoTdY4oelO0cYKcR/m4oK/f4ThuoqcFIOCBST1GM5N/O3/S/t+kxldzI=
Received: from BN0PR03CA0050.namprd03.prod.outlook.com (2603:10b6:408:e7::25)
 by IA1PR12MB7615.namprd12.prod.outlook.com (2603:10b6:208:428::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Mon, 16 Sep
 2024 13:32:44 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:408:e7:cafe::71) by BN0PR03CA0050.outlook.office365.com
 (2603:10b6:408:e7::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Mon, 16 Sep 2024 13:32:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 16 Sep 2024 13:32:44 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Sep
 2024 08:32:42 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tursulin@igalia.com>, <simona.vetter@ffwll.ch>, <robdclark@gmail.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v2 2/3] drm: use drm_file name in fdinfo
Date: Mon, 16 Sep 2024 15:32:19 +0200
Message-ID: <20240916133223.1023773-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240916133223.1023773-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240916133223.1023773-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|IA1PR12MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: 60daa1a7-95a6-4804-9c67-08dcd6540bf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vOBIYTBO4Q5VEM/z65nyGYKg/jWt88u2MhDoKFhdEy8G4KwSpsLkTPBqAshx?=
 =?us-ascii?Q?mV4IOQtR0zqNQT8e3SGQKaBaTlB3Ee252ZXuNje6kaYdTQi6HEYI2xtLDTzu?=
 =?us-ascii?Q?djaJjqtfXz1fAkQaoPE6bX5YAWcLdT3MNR/IQXlyqMLDKUvteFMNjmZSfx3d?=
 =?us-ascii?Q?xQOEmQG0eLwvkfpN2Q+7ugBgw6wMZwEvjCaHpFhVqf9BFvatYNg70IKFoP8G?=
 =?us-ascii?Q?2TWekNu9qkCFVt+P3mcyL1KWm5ddeQKrKM3cmwXmufSFGWx+uk21xq/wpKgg?=
 =?us-ascii?Q?yfoOWmRPutbmwRYJ2scyMVaDkDMhX5sy/G82mJw4CQ2XNK4pcWxftqIRXpVU?=
 =?us-ascii?Q?vdsximv41GfNZSX5ZJVdje2XfFOEpm1Ki6CK989aGHN0xZCv4OewTLPfaXrO?=
 =?us-ascii?Q?T24mM4+4X1gNP3C/Q8pUgiR4ddceNrjgbBzdYkU2Uw1WCC+Lgl4axHXFHqqS?=
 =?us-ascii?Q?9MUPTWstdl757dLQMCWrX1Nmma2emCMl7gc7BFZxUXahwJ5WGXPTRi4aPomL?=
 =?us-ascii?Q?fKdpr0DxFbLxazvB+1d4+lFAMCpMjl7YLVg+j54UiYXK24rmRWDX16JTsrX6?=
 =?us-ascii?Q?igUID8ugxxeC+jbobUmISnkkxda7nSHLlWLXwQ5kN5R4mvxhck/INUoGR4+Q?=
 =?us-ascii?Q?R8yEALAwdZjDMURTcre4rO60BbAkdnd1/weIvanmb5X0Mkdy+ywwa814fa15?=
 =?us-ascii?Q?hvONzIC/fwuNT1Iv/n3bwIL66Z22VVrSEfyO701rmHq9SnzI6V4swvOXdR4B?=
 =?us-ascii?Q?qlFNqSANVzpGLJV8r+tkx9feX+4HQZnDcDEiKmQoG5FH2CPH/2VAuld0INNs?=
 =?us-ascii?Q?8rs/3ph/dT0VijTcpMnYNTlP4zx1Z0ZxQnB6e29P2KEdPCAbpCoWGacArOcA?=
 =?us-ascii?Q?/YqdDIHDZNxuDAF//Hk4z1EJxcglXRmB+RcOWakQ1rg2+BxRimsQ2FL/qdkt?=
 =?us-ascii?Q?9vs9xocaZU4Kxg+j1tSUvfqqjCi1Bd73iuj7R/2VIcwq6rLFCZ8T2rGMLvnG?=
 =?us-ascii?Q?k3Fb3Qd9eJGIO9ty9QNHseGoke65IAEMzRXzwLNwd/EjR3CKgRBAakecHY16?=
 =?us-ascii?Q?IEcFo5Qqgj02rjmxRzTin1Cf5FbT1vs9Lx9fbSPw0tlon3XHOiQDwiSY8Jkj?=
 =?us-ascii?Q?zEWi00SpwBdiGwtv48h+FTqheCSFdj6GRrRFNYkY8GyDU2gNq54+gI548wZf?=
 =?us-ascii?Q?Mb3r2ka+SRQimEBacIByUZ/j6VQPdqD48yNm418jIiPqWX4NaVzJ39JdkDqg?=
 =?us-ascii?Q?JhDb6VSNUgGTBT9cB7GDucbRThX4UPqcDswPgHBa9utRqr8fuIRnXLw3WoUs?=
 =?us-ascii?Q?yeVlYoWXaq9wH+BFNguzi+EhrDOqy5IA6/An9g0ovUgPgwHHut6Zh4HUwgsu?=
 =?us-ascii?Q?2+kYelBIOgGSCTTJEjFGSVswssuAkvM60wG2ADCqUZGSGDYRarPt6rA7XMgo?=
 =?us-ascii?Q?k7EBps3opaYeZhk0EkDqzIC8kjOePcvS?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 13:32:44.5188 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60daa1a7-95a6-4804-9c67-08dcd6540bf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7615
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

Add an optional drm-client-name field to drm fdinfo's output.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 Documentation/gpu/drm-usage-stats.rst | 5 +++++
 drivers/gpu/drm/drm_file.c            | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index a80f95ca1b2f..ed1d7edbbc5f 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -73,6 +73,11 @@ scope of each device, in which case `drm-pdev` shall be present as well.
 Userspace should make sure to not double account any usage statistics by using
 the above described criteria in order to associate data to individual clients.
 
+- drm-client-name: <valstr>
+
+String optionally set by userspace using DRM_IOCTL_SET_NAME.
+
+
 Utilization
 ^^^^^^^^^^^
 
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index e9dd0e90a1f9..6a3621f50784 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -955,6 +955,11 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
 			   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
 	}
 
+	mutex_lock(&file->name_lock);
+	if (file->name)
+		drm_printf(&p, "drm-client-name:\t%s\n", file->name);
+	mutex_unlock(&file->name_lock);
+
 	if (dev->driver->show_fdinfo)
 		dev->driver->show_fdinfo(&p, file);
 }
-- 
2.40.1

