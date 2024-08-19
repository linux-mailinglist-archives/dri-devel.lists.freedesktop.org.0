Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D2D9575F1
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3652610E381;
	Mon, 19 Aug 2024 20:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a2qMJciQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD8D10E376;
 Mon, 19 Aug 2024 20:57:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajYp9aZFAhwhrefXSXor9LZFubXForaLXPRn3yGOu2V0SdQ8pZX62gZ/SiZ3qFpF3AC0aGj36YfNIsvjrXTnzbRm9vgADNnJPF9RBdGCK+eSAhHXxtRwowy3Q5tfWNv+70d8bqf+HqMEznXbhB8yV+RfT7LuNYmqMV/D+XQkUDePNADx96ZChYdDMNDHbGSYjxCx1EarU0oXKYL0RvjIirhKRPCL+awpEmtDLZjScK0m4EQqI0ftSitrR7vkRAYbjZ0b1iEUaW/tmVqMDQqKVj0HLdjYneNyzrs2Xhd4Vq1kr6LYJBVpN95f0qx6NfW0haHBjF6NSICJ4q8CELaUzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAUtF+kv0gHf8MZXsDyua0YqvpF509d2f6+DRqvrA54=;
 b=O5y1pcPjFmQDjTZVzbAcJpma7EEBDWQJELbQAI5+idCdUzdmokhlLJOOW3vsEO300o1eW9T1/lZokurl41CT7DUoKP9E4r5Jn8tSi3iIWq7NSaaAl+drcPGSJF3TO2PXgpi8g3KU3bDfl6rV5OL0BR4H11RP49FJtGk62fENmmZRQ4SX6rRyAeFFt/ESh0p4FcdRyPcbaUzxwOCap+0Etfc8cN5FxdYQDLvLeDRcom1SC1adn7D8uqlMC017tXRg/8yptUTLuF3aPUipIKInXikhlI9rt+0Jyj5UsH5BRedknC1ar/YCzcAsljJz4Qe36fK+DzkHJCPp9Msszn647A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAUtF+kv0gHf8MZXsDyua0YqvpF509d2f6+DRqvrA54=;
 b=a2qMJciQtpYQS3lng/+r90XpQ5E2/p/J35x2TR2wU6yTBv+pieRVSHvNkITgdh2rud3XSkGPPmZnj+fgbwhGGXqiro36ininfbfSE+hbFV2vAsg/8/8s8dV8v587hasKM19net8CGZoYsAnu6Kat9mkTmPA33ooNTBx0TlOknfY=
Received: from MN2PR17CA0018.namprd17.prod.outlook.com (2603:10b6:208:15e::31)
 by IA0PR12MB7773.namprd12.prod.outlook.com (2603:10b6:208:431::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:21 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::32) by MN2PR17CA0018.outlook.office365.com
 (2603:10b6:208:15e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 19 Aug 2024 20:57:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:19 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:19 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 02/44] drm/vkms: Round fixp2int conversion in lerp_u16
Date: Mon, 19 Aug 2024 16:56:29 -0400
Message-ID: <20240819205714.316380-3-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|IA0PR12MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: e39e04af-e284-4aaa-2c2c-08dcc09184bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?urr8FWvxMieQwXWnalwk1PkdfA5oOgQjz+Rs6WeDtpr/Wx2fePoTptgNj5yi?=
 =?us-ascii?Q?R9Ze8Nt8M10GcUuQFg+Tnzi45Q5oz5dE1tm4KBdWfZ4McUehd2q9X0Bxvf9X?=
 =?us-ascii?Q?z4JrZCqQ0U+sObsWi1OJari8ViDO23ewslYHJz+BpJyfUBmvffVHcPzHrWSb?=
 =?us-ascii?Q?sW6XYRX89POtmWSfqGl324HDP/RJHORTPFt3PBtHYSJnD2+OJqWCJqN11R0b?=
 =?us-ascii?Q?zM7q1lN8+qodBocjLduNaaPxwkaJNw6Hy/CTK2fnZoBLxO9kHukcwNoAdxKo?=
 =?us-ascii?Q?noYBEdwDDxGvLtLB4WhIMalIyXR+TuVMbfIWszxihfEPEcdF6B0GUTcFKni7?=
 =?us-ascii?Q?cXKW5OO5XJlx3I6DsvLHMZX+HBZsUJbICwhkoe5We3E4vNMzlNKeF2CV4wrn?=
 =?us-ascii?Q?YCcGK0KC3VoLN3trLvzlx1L6m3/gNKJAfb+b8C9C6RArDK0I/XRnCc0HL7Ct?=
 =?us-ascii?Q?r9JYzvDdGpzqyQDnGzO0HjLVlde8JUMEs85Jg5UQjMhhJ9Sru452p6x+iWCu?=
 =?us-ascii?Q?kCOhGBXn3xgJzQfi5pVjpgBNqK4XGNg8EqI4/b6ID87+FWtPn6ilK1ulvxZm?=
 =?us-ascii?Q?q+0p8wUII7nnW6+HZedUyl5wdoGS+uVWxZLIBeLVaPQDh3bEGdcun1xME2Xc?=
 =?us-ascii?Q?/B5xMYErsxo4kRJW5ZPjR+Gs86YaOL6LgqsE7xYITErMqtLSnHTQFD20JXci?=
 =?us-ascii?Q?5pt5VlDrrm5PTxewBhGbNhlYG6dFWOJAgPqIPdBG6HLwJIK4tQODmYASUxfk?=
 =?us-ascii?Q?QGrqT84iswPZFcv1aMxLqd0VaAuHEuCp5QlJbTZ7fjLV51GSYYJ5PHu8P8I+?=
 =?us-ascii?Q?7G17ymg21raFVzSDB16CwR3BS4BdV4cP8iWh9lV/pMrnC3QK0AXon9ztAbZC?=
 =?us-ascii?Q?ZpOR+r1UNZZqvIXuXEgtHeTLlVBaNrfynQd1waFhETQFGQI0l50QrbHO6vaJ?=
 =?us-ascii?Q?NyMa8P5STQhrGaHDKYNT+3YfCNy5VrkZUbHU9E0qvOzRi1uYyNdDIlcKSPPM?=
 =?us-ascii?Q?1lBdKmciJvipDLl7/uQfVtbumlw4Zqpa4wPdYy6tFIeazBopryBgSHXr0JPr?=
 =?us-ascii?Q?8WVFvL7YgoWm/VIn2xhQLlv08LygdU3Q3FBjyEu2KQ2g23LeK+U8Yv8XzuA2?=
 =?us-ascii?Q?JM1XEtYGryvKiUQ8w/1/VB86x90QQW7e7OcImffAtfVbxvbfxhmyM6PzzioX?=
 =?us-ascii?Q?gz7kZfRSN8Qhud7GkCS5XCEXen/WlDPWJk2OZO8t+AodVqJCmBDEk50iviR1?=
 =?us-ascii?Q?pMT0dgA6tsgUhgmyzDU61frVLmilWA5ikpyp6FBxqpjsr/xDCRPswNP4qpug?=
 =?us-ascii?Q?CBu0TYVL5Ndo02sC6e7QO5fAJf1TgbqMKpYq/uAZgz4s58mRauBgiqHwKHKN?=
 =?us-ascii?Q?ot+QalFMQl5hAj7VmkjXxXO1L+3FUIK+lO1CGjyjV2P+1gFNrJgZBHirVex/?=
 =?us-ascii?Q?ODm/4irq13LKUbqcl3MoidPKGqR5qFpa?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:20.8858 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e39e04af-e284-4aaa-2c2c-08dcc09184bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7773
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

fixp2int always rounds down, fixp2int_ceil rounds up. We need
the new fixp2int_round.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
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
2.46.0

