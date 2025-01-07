Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8881EA04857
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 18:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F1810E753;
	Tue,  7 Jan 2025 17:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="QOWuX3gA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062.outbound.protection.outlook.com [40.107.20.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E195610E753
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 17:33:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FY9QCpmdPNbEdAO9VjnncIKnpsdj1aVjWu4Ep6Nq3JnXzf03iqOLwRw+/vY/iBEm1nUw98mTxyQX5i2e1A51RsPs162u1AGl70bEkFxR9yQDsU4mItD4UaFhJ/mpisR2XuvJHuwv2H1KZsp66OTmLY8qF/9UJBCEru66ohg074dHRMY+k+9jnDt3iQpL6eCKLaMudTx6Vw10LuMbmUq8+I6MrxfkYCcVVx6QwYVwpd88Dz2tYoHO7CRWQykG3Sohdtd7Dp/Wm+w/x5Y//O/xc3I5UwlzTEJGDBvIH/uay+/PO8MYAubmXw9gSkEwuJ4aGO7A1QJ+Z1hPGo5K9aSN0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zir0nBqpNi8GoaoYhGiyUOMb5uG4blR4OUC0qzEfqx4=;
 b=u3x6Yv3J3EHbua5rfckBxSr7W6NA8XTOS4TwNPi8Uq1CaddjA1fY812Srg14RzEA/OZvLsvxM2KdDpOWnxTn6d7zxJdzuqYVR/OF+U79FlwS49M/LaC1R+k5GqNj7/56T84AZt8rfdg1FXFUjAnoOUaztoav/uxOiVYl0FiKZq5gxUcY2JckqdXKfZ9H+oExvk/kmTLMb+AMx1y4vPnUYELyjygECgvNzqk+ykPWE+2hD1A9IxuQqkgmAx74te1pjxXDBJR85Xd/bGUoKINvjdG9tITfbNuC7qSQtxjLHqYv74QnXZlR5A34YeSzRLTl9EwlvqO5kuQd8IyewPfbow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 172.205.89.229) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zir0nBqpNi8GoaoYhGiyUOMb5uG4blR4OUC0qzEfqx4=;
 b=QOWuX3gAZwOD8smJ7PRj6cc9fNyevMZ8tn9HpLqrxhf7yILZwDpzQWgeksbN343EykGn0mCgyTgj0QvWv26zjgtDNRQjD8H1SOtDbBbKelxJ1eDCIbgPzSTb34LBx0bKPkRplSdh94INp6MhujiEgDj9lxrgZCBS14M1023K3FM=
Received: from DUZPR01CA0071.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::16) by DBBPR08MB10386.eurprd08.prod.outlook.com
 (2603:10a6:10:534::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Tue, 7 Jan
 2025 17:33:17 +0000
Received: from DU2PEPF00028CFD.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::6b) by DUZPR01CA0071.outlook.office365.com
 (2603:10a6:10:3c2::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.10 via Frontend Transport; Tue,
 7 Jan 2025 17:33:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 172.205.89.229 as permitted sender)
 receiver=protection.outlook.com; client-ip=172.205.89.229;
 helo=nebula.arm.com;
Received: from nebula.arm.com (172.205.89.229) by
 DU2PEPF00028CFD.mail.protection.outlook.com (10.167.242.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 17:33:16 +0000
Received: from AZ-NEU-EX06.Arm.com (10.240.25.134) by AZ-NEU-EX05.Arm.com
 (10.240.25.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Jan
 2025 17:33:16 +0000
Received: from e121164.cambridge.arm.com (10.2.10.32) by mail.arm.com
 (10.240.25.134) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 7 Jan 2025 17:33:15 +0000
From: Florent Tomasin <florent.tomasin@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: Florent Tomasin <florent.tomasin@arm.com>, <nd@arm.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/panthor: Remove dead code
Date: Tue, 7 Jan 2025 17:33:09 +0000
Message-ID: <20250107173310.88329-1-florent.tomasin@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFD:EE_|DBBPR08MB10386:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d8d9a0c-3400-49aa-ba62-08dd2f415f01
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xof6qezbCJe1ELGvEQX77x+3/IUZE6eAL3Y46q01/ykuSg0CF7si+GdaMuRw?=
 =?us-ascii?Q?79v4M/OPP0vGNoghwN4cXL/WgH+4EKkeFdeQvcKaSrgt1TKWSQ88CITs5O60?=
 =?us-ascii?Q?O2Tzy7jTsnen/1nabC/LKaoPS0EewqB6+iIUJ7Me3kBeA36DajDiUf3GWWoJ?=
 =?us-ascii?Q?/YsUc8ZbLMyG6uPooiFbzJgqGg50VkATKsHtJKAYpG5DejCYKv8KQC4ZTuG7?=
 =?us-ascii?Q?qGJIs0bU1fT5CN2p+K0vHjmEKa7w+d9MQEZNFWcovfYAmRjVJ9G0M0SMziwN?=
 =?us-ascii?Q?Efl+HjvTpuIkM1UbZI9f81pOV2CwuvZTbTnsjpOO4cqcA188LA77WaRo2AXw?=
 =?us-ascii?Q?jAzNd0RLKXGJADb4Leb89yEgDNCzD01BKB1QTUBwIVFUwVWD3Vn5UVKUYV8V?=
 =?us-ascii?Q?nrTXGX6e3linL5RtRXz9VW6Pl6VOzyg7RGOSbVnEVGy2FJViWfYCTWNWJ+0E?=
 =?us-ascii?Q?WHFZaB2tepYAst/dvp9hUSyCT2aYa6sFN21FvQVM1zVyhQYit/0gAT63NTqm?=
 =?us-ascii?Q?72AWQhcLgKpvTZEXI2UQZxadVdrIm0wcvmMZWwVCJ4wXE/o5AcfpYPsG4i6T?=
 =?us-ascii?Q?MBCDrlIpeGcdOea+kikmGtnL9EeZeLmrHaEhmGiw9kf8/tcu/jO+JK2iHVtl?=
 =?us-ascii?Q?QLh1DIMnfwLEcHZMT7RLVeGRfbbJSZPyA3NjFuRPt+l+oMeiitMU+FR7fi08?=
 =?us-ascii?Q?lfWfiKnUPTSFAJ7rCyt9FZQBON29ZyNsg3EX9NDNln4/MTbv4P2i0fn0gtsW?=
 =?us-ascii?Q?2QWbtZQE0s/z+zvdvMoBnRuTSR8F+Rgoe9tFUmQSGC6JByDRa/rI8d8s2PrO?=
 =?us-ascii?Q?FdSHDJZXWJnoTYy6CQ4suFbFUTw754ngKZqoWFx+oCWL5eyiya+O57Wea86E?=
 =?us-ascii?Q?EAbe8fEb98ISMMo/2WF1C0azeHV89qvm3CF4bQkBjzGZnn3hFNUV8yVv4tu2?=
 =?us-ascii?Q?qRZDQVFv2AZ7D651loIvAIu4BshKu+nrEbLhryyZfB2Wco0jUBihAt08Dj3/?=
 =?us-ascii?Q?yKr0CUradEOIIABLQvHEIBYLNwaIYNmWGf1UaYBj6SZwVlV/WbqJaQW5Etee?=
 =?us-ascii?Q?AWlK5YyZphZKQAYiNBomoRWt08nID6NlIy1WhpHcmhwgYAdxvRTHJ43T0Z/T?=
 =?us-ascii?Q?6lB+fQbp1b4sMH/gYXsJl+79uNUN5g4rLziFBlySCqclq68LY6JePGm65W+/?=
 =?us-ascii?Q?md5vtNpNSm1efcEbsm9l2FnKzQzmlhC3Ea07xuVkERNokr3i7MjR9TRWmVgu?=
 =?us-ascii?Q?Ll7ZP6zrV3GZta39fc6+PMZFChOoT+p9ezYWUbS0BPSovKd9MyvuIKjX1+Qu?=
 =?us-ascii?Q?74h9loLXR/i/XM+ot+5Ltl3C7JD6qc1KV/simCAKs/W3tvzeMh/+2UQ2+TqO?=
 =?us-ascii?Q?3rCv0b1eSB8im9MutW5oyfz3R6wqnDkVjaGqrvnHW56vVC7Z7A2ylgamIV5E?=
 =?us-ascii?Q?IXizd6IHi+0fnAbhlAJTV6oUVWIFUv8eUhDj0Xri1QplamqKSkcpt4lI233b?=
 =?us-ascii?Q?+Ol0TtqtBq53QnI=3D?=
X-Forefront-Antispam-Report: CIP:172.205.89.229; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 17:33:16.9650 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8d9a0c-3400-49aa-ba62-08dd2f415f01
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[172.205.89.229];
 Helo=[nebula.arm.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10386
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

Remove unused function declaration in panthor_gem.h:
- `panthor_gem_prime_import_sg_table()`

Remove duplicate macro definitions:
- `MAX_CSG_PRIO`
- `MIN_CS_PER_CSG`
- `MIN_CSGS`

Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c    | 1 -
 drivers/gpu/drm/panthor/panthor_gem.h   | 5 -----
 drivers/gpu/drm/panthor/panthor_sched.c | 3 ---
 3 files changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 68eb4fb4d3a8..4a9c4afa9ad7 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -201,7 +201,6 @@ struct panthor_fw_section {
 
 #define MIN_CS_PER_CSG				8
 #define MIN_CSGS				3
-#define MAX_CSG_PRIO				0xf
 
 #define CSF_IFACE_VERSION(major, minor, patch)	\
 	(((major) << 24) | ((minor) << 16) | (patch))
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index e43021cf6d45..5749ef2ebe03 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -85,11 +85,6 @@ struct panthor_gem_object *to_panthor_bo(struct drm_gem_object *obj)
 
 struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t size);
 
-struct drm_gem_object *
-panthor_gem_prime_import_sg_table(struct drm_device *ddev,
-				  struct dma_buf_attachment *attach,
-				  struct sg_table *sgt);
-
 int
 panthor_gem_create_with_handle(struct drm_file *file,
 			       struct drm_device *ddev,
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 77b184c3fb0c..5844a7f639e0 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -88,9 +88,6 @@
 
 #define JOB_TIMEOUT_MS				5000
 
-#define MIN_CS_PER_CSG				8
-
-#define MIN_CSGS				3
 #define MAX_CSG_PRIO				0xf
 
 #define NUM_INSTRS_PER_CACHE_LINE		(64 / sizeof(u64))
-- 
2.34.1

