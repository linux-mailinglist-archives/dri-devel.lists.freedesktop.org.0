Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4B1AD9458
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 20:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C1410E4B4;
	Fri, 13 Jun 2025 18:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Yf0UOZn2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1D210E43D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 18:23:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ooRkCsmcG7xJIJyuEebIWyJ6TmFjhWCquXAJF8MwX+4uxmbpgOIa1B2iuLVVCXlQ2ZPTb5oveQrsANE7BDblTm4Qlo+ltIrkE+YXsNX024d2aLbkDkZoE7iKdbOth/umOt6ryshC3Dy1YKftQFDgltsHhKULX+Rbo8Dr1YEwQo5iJLel1mkz1ybe/5Qj4EZMvxyK6wv6VWYLpr0GkDz1pDaiUi7s41Ng0Gmm0+MziESc5OdnE+vO5irqgl3RCid1gV8XmLgga8pQMzra+YDBUq1a9eFQTqB9KGo/Hdco9pyqw9jJzpAPjCuSSZhzYj9ebvoi6VpMNAXQ2VyRthYJfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjnYbDAwYyeL1uQPaS5CjilGwQ9JhngKKXbvsMharx4=;
 b=rag5Lhgc7+vdVWom/YaS/wOXH84gBdB483G6AR+4aFe28FxsMzU2W602sK4lj0X9LuzFM2b98m20cDsykaOq6s00tRv+EBaobJ9axf6cw7iDAAhwJP2HHOAykH48MgBlViedlwASfAQZSE4hZcRUetD/DWBh2iVUKS02vCJ1WPttnR4rADByCITqSk8CZTlOUtD3612N6NjucNUVQ3EY13bYzJ//wIaJMW4xDn29MSQvh/GJDQOzVcmF1LinhnzwlE8Ux9iJ6413eK5412hk/QyrqX4ZQluCFWioZJAplHwJ7o/uS+HAPWYVq2psFmpdWSYtmXBulLU+KtAlBP6cIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjnYbDAwYyeL1uQPaS5CjilGwQ9JhngKKXbvsMharx4=;
 b=Yf0UOZn2HNx0meQAeZed1sQ822W9JdtqOze+lG2g4Z8P+n7Awt4dvKVvd0JHBzjJ3gC2J2p1rw3Ckf/rK5npoBUoL+R/Gcg+9UVlWG98rBSA6k7Y8k8sZkPVhX4t27+1HoAL/lXiGefvXGNKy3yXNOrUG/t2/I/IfJRiCO6CzP4=
Received: from DS7PR03CA0170.namprd03.prod.outlook.com (2603:10b6:5:3b2::25)
 by MW4PR12MB5628.namprd12.prod.outlook.com (2603:10b6:303:185::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Fri, 13 Jun
 2025 18:23:51 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:5:3b2:cafe::f1) by DS7PR03CA0170.outlook.office365.com
 (2603:10b6:5:3b2::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.33 via Frontend Transport; Fri,
 13 Jun 2025 18:23:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 18:23:50 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 13:23:49 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, <Felix.Kuehling@amd.com>,
 <David.YatSin@amd.com>, <Chris.Freehill@amd.com>, <Christian.Koenig@amd.com>, 
 <dcostantino@meta.com>, <sruffell@meta.com>, <simona@ffwll.ch>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
Subject: [PATCH v6] Add CRIU support for amdgpu dmabuf
Date: Fri, 13 Jun 2025 14:23:34 -0400
Message-ID: <20250613182337.3767389-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|MW4PR12MB5628:EE_
X-MS-Office365-Filtering-Correlation-Id: b045effc-becc-4811-10cf-08ddaaa77234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MGPZ8UzpnyYDRteTX9YMH3gcqnifVUQlKARLxYUGZ2Wxhz02WjJBhen3N10e?=
 =?us-ascii?Q?+pQ1xKip8YW8yhPTV0QuDT9G4VyXTy1Mz+8fRAym8yZ/LY6h1kOdPTM+UKig?=
 =?us-ascii?Q?u70/Vh4gdQUFRWIw+UNytPD3mqYaSj7zXHAvDHz/bT4FORNHdrtSMTqFr2rn?=
 =?us-ascii?Q?ToWRTzg0DglhWI5XKaU7l7vkhNR2z6FJIbD4tR3sjbA+kLk9LMv9m9Hs403x?=
 =?us-ascii?Q?+2hBmNXjaMygyz3NnH3nauovX0RTWMuDRRgEi7+2zf/TRGShhm10xMScIxix?=
 =?us-ascii?Q?VAkk0mHRhBY1xU3zp523xqrx5BntBReKHWFVRhfXxl9v7N8Oe3Do9Dgw5983?=
 =?us-ascii?Q?F2+32lQD+yR9XuL7+QkgrJpVAQiEF39+jXvgwaKWqnuhs7yYBNFzIIKSNC6Z?=
 =?us-ascii?Q?2H2Sd7U6fSTPHhyy1dOBEsSror0dALc7JjjwX+dce/nk2Mjl3jZ0eDEF5aW/?=
 =?us-ascii?Q?KeWgP2PA+h9bem2dhLxMOc+022GwfzFHUofDzcN+G+RgHC+CwvYYqxRsvvVn?=
 =?us-ascii?Q?F5wphnmN3VheLDJPV9X10Mbqo1Wnynj1XrM5Xk69gf3sOYASnsb19FtnlEB0?=
 =?us-ascii?Q?pbhHKOroQKGX7WFTH6xFGe7juRWxYe099hmlf6henOF9Q5qKaLru+uLZVpW+?=
 =?us-ascii?Q?NkEe8va6A9dKXtAaR6vGu+B9XGW5pNy1cH7YHZ80+kV8X4lxja+8mp3aI6/H?=
 =?us-ascii?Q?TudDpFPKctRHACvHVFaXLx2qPk6d7R2sLvom88+le05deZ6Lafl2VDS6urfB?=
 =?us-ascii?Q?hsdUcwv5DpP5i+mb7EM0Ax0q0jQof0OUTYB48l8NQSYhY2KUU/7lW2OFIdDN?=
 =?us-ascii?Q?RNrwthIXXtyOGdm+yofOBkzK4vSFgMrLdhF8bItZsSde0ZyMNHs7h2669i8Y?=
 =?us-ascii?Q?GiIYvDPKvDv5wsQ2jBjY/nyG6eJ9VE2UZzX4eDLIZAd0mLWkbwAueUNOllGy?=
 =?us-ascii?Q?eG69Ry00vtvfjgt469PA8KzH0ZHqVeUTDdO07e3bxcLOxbZxFu4O5WNXStBo?=
 =?us-ascii?Q?KUGQdaYfZAJhp0vtuFS+Ji7pJQUcV3O1QKEUmmpv3bPNPaaEvS6CHljf1BX6?=
 =?us-ascii?Q?7Pop899hN0qIchsE11az87vdknulDPpbDECiaXo2YCfbkz2sGvWa0eg04/2x?=
 =?us-ascii?Q?8+pbjqHNjjNO4azDBukf6kI+FcJxWX8IG/9/ZLDU6n/gPKsRrgYfWEkZvRu3?=
 =?us-ascii?Q?WpcN46gWmC4ZKphumcpT+3gBiXZ9tLOh0MzFGZAFg0+mNlO0zfa0MFZQZKjR?=
 =?us-ascii?Q?QJmm5qfBbtUfyXCGPpW3MLvBLSTsIdsXMbGi+IdKbP0lIr2FfLJz8S6Sh0v0?=
 =?us-ascii?Q?N/ZGQ3UbKL6aKsxhIB7WtHKDKr9GefF6OlbDmf7NinlxEftdstYY2xGqnQo9?=
 =?us-ascii?Q?vkmskoJhX7uZxs4hGpQy/iVE9EErttM/o8P9zf1p6ZjL2NqFEuhxgVhdQstU?=
 =?us-ascii?Q?pobIKcR8gh7RKqc6WpIeRUhwMPp0eruiZL2rlAHe4M4AdSA6j7GkpP2xRZeZ?=
 =?us-ascii?Q?LTv2db+Y0uf8uSmcv/AcC6myAGW3/LZvWHh3?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 18:23:50.7138 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b045effc-becc-4811-10cf-08ddaaa77234
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5628
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

This patch series adds support for CRIU checkpointing of processes that
share memory with the amdgpu dmabuf interface.

This v6 cleans up the locking and moves some of the mapping info code
into amdgpu_vm.c.

The mapping flags code is a placeholder awaiting the mapping flags
rework.


