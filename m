Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A5D9F8B46
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFAD10EE52;
	Fri, 20 Dec 2024 04:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="31xVGESb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BB310EE52;
 Fri, 20 Dec 2024 04:36:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4g+7u/U7rBf5U11gWgfKxtsUE93HnGLxVKqXBigxIiPjydoGSAEFrVbQCpMhrLU+/wPSwssRNswJ9pXhFKepNKuB8I4Cop/R3Y8YSPvUa9i9pZDI2S7dlt+08NzIkjozd4U8dcrkSZ27sFRUPzAoZw5rbxIslQjkGTAhOsMnAFlmNnYwf5q4nG2C4pcWtYgLIg9FE/dPlw2uWUi7fdYVEuO133uTt+qnpj+yF0IN9PgjgxdYeMR1DZleT5O+BxnA4qpURbkTTQKJtV3BFUqeLW2kPbsDJkgmbq5HeTBz8WLzqkuQAxq3qK2Rn+F3DVqFmAFg/AutqbGqomqZzH0NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJmsKdITpoHQX7Uf5WJlZaTbbEt2gR7WQlEOlkheISQ=;
 b=iQPhWVMtnTe1KYXlRLJEJgHRNI9F+ym62GzfB9Ki/xpZdUUhoFmc/hkIXa1t+ANal6kuMTXyskM300X0OLpZRqP5HsqGIjuZNYGe/LGayUNtcH+NO8WuQcW8SKmb/aqiwg5dsO4WVlnLl4NzaF/kj/wZ2WvnQ93GJr9H/yIC8T1Mm5DgrlI7XiSH1ddyfL7k5nGF672XRRRNkTChNlTbBZ942UwdOAzKx7IPe1Eqyk+7JB5xBlQkT+nfqDOEZaGkLQZLiO2MSE8bVtpuKGpRxph+PqsZHNfSqMxKIM1xWDfz92DLzQd28C5UjeRrbsaDPi5SoR8vPBWITQY20N1onA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJmsKdITpoHQX7Uf5WJlZaTbbEt2gR7WQlEOlkheISQ=;
 b=31xVGESbcf5joA486CN9feD2i5YMHyd3fkBfQw3ap24/gL0gyvzDwEJARPn3IVqtqlh3YbNnZQed5eZ8coQwd7NDJNvGfZg8GsLfALu2VzPqy9tRV0ozgLd8WhvVHBhP/AW8qTf6GF/H1cO9fQx4SP5YMTkTRIc8cppiQifTK00=
Received: from SN1PR12CA0050.namprd12.prod.outlook.com (2603:10b6:802:20::21)
 by CH3PR12MB7499.namprd12.prod.outlook.com (2603:10b6:610:142::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 04:36:05 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:802:20:cafe::11) by SN1PR12CA0050.outlook.office365.com
 (2603:10b6:802:20::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Fri,
 20 Dec 2024 04:36:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:36:05 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:36:03 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [V7 02/45] drm/vkms: Round fixp2int conversion in lerp_u16
Date: Thu, 19 Dec 2024 21:33:08 -0700
Message-ID: <20241220043410.416867-3-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|CH3PR12MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c47f5ed-c27d-44e6-fe20-08dd20afd0cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o1HrAfBz2DQHxv12crIa6SKJDujkbUN8n6CDTNT3L1hyEI/2qKJJMdPtxOSa?=
 =?us-ascii?Q?wD0pbu+J8oN3hOvp/VwnVSFK+K8bTBVf+2Np4Tn8KH2pTJM1zlmYxkKF8qvN?=
 =?us-ascii?Q?o1850OkalBqH//8ACAm1ncQL7cVbdibtkiTx4tIT9Xy58AkIUVyTer043mNw?=
 =?us-ascii?Q?FcH7NL0shOrJtEKvd/HA36mu9/0CpMwNLROvm2T2UXKbj5ynWCSf6Hx4BFtS?=
 =?us-ascii?Q?0Pgb0DGOSGJVdZJP+ZgnI5Bt437uPAeKV2s8unTzAEDhwc3U72kzxXD2GU0q?=
 =?us-ascii?Q?4ei1ZuRm467HCklrjhiCntiqTYczOKJdDVIw6Ojehy7DLSEp9C59ERA666Tb?=
 =?us-ascii?Q?hw0N7TC9x05BMrC9d6/nIIv7dQqMPSqsswrTit+2Kt7+mHbC9TzreP4y7ol0?=
 =?us-ascii?Q?bKI0Od2qSYP5KfzECncMepM8Fkmo/eZ4Wt2vjPrukaD5weGiCBWxfRiufyOk?=
 =?us-ascii?Q?eLRi+aSj3gPpY0OXK48R9xBO7qUH1f1Rx/dNEN1EeshmTQdFYOovoWmfb2OG?=
 =?us-ascii?Q?vu5yBNiOwOjEtE3m5jAPTx+EREqhBJ4N7W54bUgvg2tibM23ESIUSZJJdqPi?=
 =?us-ascii?Q?Jfsf9UYw2PGx9dZ6qnQbIoYmy1ym9QyW5KkZMurKjG3N6GH8u9cN9QPl/YOH?=
 =?us-ascii?Q?ldNSLE7KtN7lZUBDLwhdhtFWpU4xAb3IVIqgvRcwMZ+NSNqqdBqB+tqKfjMf?=
 =?us-ascii?Q?4Kt9uzz5fJk1IdQdYiDJ748HWruWngH/MgdoK73/O+NEkt+yEEJUUVHS9L/k?=
 =?us-ascii?Q?uqZXwkbEvLFfVy4A6OqkPDE8PHl/j7xy7kCsK/h8edKhb1Td4exzlj8oni9d?=
 =?us-ascii?Q?zs0+pPRXNwMVcRZS/+/c1HVY3QVN5E1DUroSC0TeFp5BnQk5zsjMuoa4Q2mG?=
 =?us-ascii?Q?6M1q5SnqyzWQpWNrhvUG1gIZEC9aD5WWzNowpZji4sztjBW1FqZ6nEJ4dsIM?=
 =?us-ascii?Q?OOz79CDKMd32VpcRYcQiFPhQJwZrN40qsMxSl1HIr7YHwwWBWLDyaoELLP6V?=
 =?us-ascii?Q?S4KseVgT8ygKb49ND24wXhay1nPrFphbO9TmltLjfesxkTClQfZNk33NE6gA?=
 =?us-ascii?Q?DoyN4Cp0aWoruhhwx9Kkeatuzt3+HZRk0MV6eDV3vS+b3uvy3hNxwIXyKwbX?=
 =?us-ascii?Q?Vop9nMwlKWaoYiARUsyync2f7/f8ZvSgsKEVH5ghbq9Ze/JAEMU1spm/+LVN?=
 =?us-ascii?Q?q2rAJgWSL8WTne5JwKd1hS5fdS8ZMfWOA+l7L0qtkHMt8QLRJrensrV5iXP2?=
 =?us-ascii?Q?3tb6kIf6U64956hELF6CS7pjO1efy64IxrNQcUQtqNcQQX8wldHCA6EXwdV9?=
 =?us-ascii?Q?n9FxHD0ATjlNstBsYjaJ1GdoNcV1MmFBqJfUs9gHVwLY1gdae4yqXSbernyM?=
 =?us-ascii?Q?563Qy+YyAqyEAAJVz/3tjK6fA0IfqH0OLWsbNIWSjXu+LuYTK03mYTDRBGWN?=
 =?us-ascii?Q?tN9G03XAgLXmqD+eLEOQQ/j+zmjM3Cf6QeUKaSiBnpCe7SVZv9sT5WjLv98L?=
 =?us-ascii?Q?7vMz4JoZo35RtVw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:36:05.0198 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c47f5ed-c27d-44e6-fe20-08dd20afd0cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7499
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

From: Harry Wentland <harry.wentland@amd.com>

fixp2int always rounds down, fixp2int_ceil rounds up. We need
the new fixp2int_round.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index e7441b227b3c..3d6785d081f2 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -98,7 +98,7 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
 
 	s64 delta = drm_fixp_mul(b_fp - a_fp,  t);
 
-	return drm_fixp2int(a_fp + delta);
+	return drm_fixp2int_round(a_fp + delta);
 }
 
 static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
-- 
2.43.0

