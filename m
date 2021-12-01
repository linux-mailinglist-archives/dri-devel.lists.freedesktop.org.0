Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39112465306
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 17:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFA56E827;
	Wed,  1 Dec 2021 16:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2069.outbound.protection.outlook.com [40.107.102.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301556E523;
 Wed,  1 Dec 2021 16:41:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYXrVZmV7i5Qm9QeO4Sl93uw7NSN1JiQV055kdjU4KEcV4pqlFWrhSvfv06BZt6FsVpJQLsE6Lqk1xpIv9+Fb1KU9ApAfbyCkqn2JT9omTAPFmO9e4LF6JfjXTYjjuycnCgNIy1tuN+9M8QDC5IcNYO0XUxzg1AyzQrZWo0QtWoQwkfZhh1J50uR9WBCSknfdmVhfaxVrXyaiHV1qu40M1RNeA4bwlpetIzeIYTKNkwYaxC9yyYEuGbtD9/a1ZBaMBTZ489ucz22dhqfOrlxvYGc54D4ai7XVzYUfeh/wDMcuXIWBnl0biB+QTGN3UkLw9pF6ip7GmKyZ5scT7/H8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=fhNxzxJ5izS4T4E12/HS1etEhzdhE6D5ERab4bfYBy9m8UC0A/2I+Wfg9TrLfscftfp+4rbbytcovkbc+hlyD4sNV2lWPY2pOXD3hm9yyXtnUbJp7AG+tRoGGxntvCqzAypIBsntk3dvR08YtyRWSuny9cBvjfvGg9qNMYDdbCDPirIAAM+6TCvS277yMcsy4IBgixjcGUS6TtrJANObHlFmWjAsMkJyQhIxjtGzq8hbTNkIY8Vdu2Y552JsRm5MptHmT51IIpRSHfGdraF6g01tG9dw9T9oCX+GTyvri0m5IDIMOWPXXmj/hux9sCs587dPPb0WDhODYl6JfbDBTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=v/cVXoDicS4jEMqFgXO1caFx1Qsq21qBD+10b4tZlmRqd1yvD21Dfw4hNT+zb4cK/SvlmXK7rhJyI2W+ByJP9AusgdTE3q6RQu8ky2QYBqqo3nGI3TqbRC/VIiRSRqr43RxdkX3Q1WD2VOI9BpNWWBCU6K2xNq2xUjl+5sw8MQA=
Received: from BN9PR03CA0373.namprd03.prod.outlook.com (2603:10b6:408:f7::18)
 by BN8PR12MB3571.namprd12.prod.outlook.com (2603:10b6:408:62::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 16:40:58 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7::4) by BN9PR03CA0373.outlook.office365.com
 (2603:10b6:408:f7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Wed, 1 Dec 2021 16:40:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Wed, 1 Dec 2021 16:40:58 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 1 Dec
 2021 10:40:39 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 5/6] drm/amdgpu: move vram inline functions into a header
Date: Wed, 1 Dec 2021 22:09:37 +0530
Message-ID: <20211201163938.133226-5-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201163938.133226-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211201163938.133226-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 672a7457-9c48-4f38-5166-08d9b4e95a23
X-MS-TrafficTypeDiagnostic: BN8PR12MB3571:
X-Microsoft-Antispam-PRVS: <BN8PR12MB357144FED471AA0B3DD63542E4689@BN8PR12MB3571.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NqVBPiKVfR5yowwEUT3VuBW45AdTweu6Dt2IFTHdj7CNa61yebjAZi28sItg2nDOqi9b9Zp7DWxeeuukB+CJU2CS8EXC7x6d+j/cUX6Tzh6Q2lsUrHokUG4Fk2zdvbUQIS/xk7ZgQAyNCkuJzuAobJ+drEd6nV1U5zuw1ksuqCKBN3AXqKwHFNIgYEZU3UvI9lpwkm8t457i09cqbrw5JB+baV4PDq2edyaEJOm01fMPjtBqJmK4lSYstFPUiobn86TpdLTewgFD55b70L4x8OZtk9JI+IdEXy+zKt7cUf5Y0fLO7ZxcGrFqbklzEqo3O1q6ddFC0H1eDskTQ9rynTLsGJCwUlczzXRFrnH/pvy1DjmLBbyWbJs/OTurIBwpoc/nlSl72UyK4U8g0DRfQ+jlb526pIc+GLIOzUPlG7c0zY/72Kudr1ZzdHUJu8kU6vRrNaLnpm4kz4dm0qkLiKU5p8In1XkfNdLNiCBcv8E5jRrqh4oihPZjB7XxmdJn29kvU2W//7LJ+lxqWCHNZo8pk2CLALrschFa9TKZ3srFKgk7ZXnUoyyL45NWcCMDrbcxiCf+uaK6jpzcsdqDiLrverLHMvje9ayxQlxkPli++pSF3+K3jMGc+vu/kxtUC2jJHg/alSpNVhRBfed1dW+21zGyI+/F1oJyjjJRIL8qnKU3RqczFgaTlfEQBOJLE7nzu4FNYkyjd6sAOrJpkwgRyv+p2PliQ25FmaN2UJRWrowoj5QUhrXEX6qUy91vWxQhSJksHPsEX+4t8y0Cotd925llC5KDbFDSpJkWUJQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(26005)(186003)(8676002)(16526019)(83380400001)(316002)(356005)(5660300002)(1076003)(2616005)(70206006)(7696005)(8936002)(36860700001)(4326008)(86362001)(2906002)(36756003)(54906003)(508600001)(70586007)(110136005)(47076005)(82310400004)(81166007)(336012)(40460700001)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 16:40:58.1967 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 672a7457-9c48-4f38-5166-08d9b4e95a23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3571
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
Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>, matthew.auld@intel.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move shared vram inline functions and structs
into a header file

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h | 51 ++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
new file mode 100644
index 000000000000..59983464cce5
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef __AMDGPU_VRAM_MGR_H__
+#define __AMDGPU_VRAM_MGR_H__
+
+#include <drm/drm_buddy.h>
+
+struct amdgpu_vram_mgr_node {
+	struct ttm_resource base;
+	struct list_head blocks;
+	unsigned long flags;
+};
+
+static inline u64 amdgpu_node_start(struct drm_buddy_block *block)
+{
+	return drm_buddy_block_offset(block);
+}
+
+static inline u64 amdgpu_node_size(struct drm_buddy_block *block)
+{
+	return PAGE_SIZE << drm_buddy_block_order(block);
+}
+
+static inline struct amdgpu_vram_mgr_node *
+to_amdgpu_vram_mgr_node(struct ttm_resource *res)
+{
+	return container_of(res, struct amdgpu_vram_mgr_node, base);
+}
+
+#endif
-- 
2.25.1

