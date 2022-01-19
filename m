Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDB64939AE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 12:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8064A10EAF3;
	Wed, 19 Jan 2022 11:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CF110EAC8;
 Wed, 19 Jan 2022 11:38:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/8eb8kFZBKyYjv3dUNt0CfOsc2Yethyd+Viy1jscCgtT20dC+R98Rl7FZ9x3tcapFUZTe2zV5N/0/6FZ7gTBC8pcuiGvRKVx9I3Aq388P1bUrYWxVioWbTolPJZZzJ359zvnop6pdHr7KPK7s+BrwLp++MiKgRNSu6qe7PEbqFF4jtkc7oVsiuE8mi6pviV7xRilc+DXhFlUL4icKaADU7zQZym6Y2G11WkiqfnOl8ReSSxRxL19eCF6uWVJIVgzsb/K5xaygGFJmd2zFo63q62MvgxC6akJrF9+TEHJ7m43z2z3AXF5zQBnfBaEI28N9vKVRupeCqYDz5wdUw09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=Q7baBBgYiSquv/agrD0BIXS3u9qY8LMSOylj3EZP2JmxCzZCm85/pr7YAn1V5PnqIY3667TV2B/PUBj0+1DUnPv6YjJXK0p6pNGWHWknJf2yzjNWCCNIpQu839xwjcI+Y0I6vfE0eTUXnvGToulDi1VQo6jQlKVH7vvr05t3UJ0LJUNJxmF/RFS/0V8xdAtVgFG2jRIjIdXZaBzRmJBKNq5FQbzN/VXYQYAblYPfHvLB9yYScL7OASxGhVP1kBUNtnMYGRvvmSa0kG5+eGkrngdSAFRG0a5Z8tpLk2oea4VHi/78Lkv+X4ovOplFB/6fuf3GMKR1Xs3HpkEHQLd07w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=ZswgJVfnDsQwRgDMYedKRr2E+/HLOZBFwfzFVxTZNFgO2gbzztMs8lQwsxKIdov6XVMf2jRUw4BXTFyaXJrTa310HQ09flfSgLQd+ZnQH+tCKvydcMMsYeI6swQIBoTfiDq+COl2beGp2SnnvSRTuZ6hwa7WB6LGeJ87DGZqFpI=
Received: from BN0PR04CA0166.namprd04.prod.outlook.com (2603:10b6:408:eb::21)
 by SA0PR12MB4366.namprd12.prod.outlook.com (2603:10b6:806:72::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Wed, 19 Jan
 2022 11:38:04 +0000
Received: from BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::dd) by BN0PR04CA0166.outlook.office365.com
 (2603:10b6:408:eb::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Wed, 19 Jan 2022 11:38:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT062.mail.protection.outlook.com (10.13.177.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Wed, 19 Jan 2022 11:38:03 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 05:37:58 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 5/6] drm/amdgpu: move vram inline functions into a header
Date: Wed, 19 Jan 2022 17:07:17 +0530
Message-ID: <20220119113718.3311-4-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119113718.3311-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220119113718.3311-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd05d390-8d9b-400a-3ad6-08d9db4027a2
X-MS-TrafficTypeDiagnostic: SA0PR12MB4366:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB4366A4901491DE1A7E9A2E15E4599@SA0PR12MB4366.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ple3GKyT1r8fHM8ehvfQ4LqNR9xE+lFtuIv3b0B9shtQROwC+kxEtX2YH3rNezeoyJ8ycHmsXt9KMnCCkATT3MD5MqUrZElLDAcpxQMQwWTGP+MP+CIoIDNTX4dHDS9HULiWIc7zEHpKRzC7m6qUDNUpaNDl+Hdxt9MIJjyve74cWap5/Jle+Dntaff6UA3flmISdWH+JxUw2wy2V33VXlBmiLGdKc05R/vCaQ+sHYc/rU7/LVEUiEGRQ7xkQA4uqvf87klbfsiNH/F/owYUR0dY+mmMoX89yp8fdUokKlDBmVsghRyueNWa5n/nVL7jsUbmBmdHdNTlIlkY7CbN7lCNK7OO4+7ZULXomB/pxEgTF0UyJ9gG5j0/lr5QMHgY8T1MgDT0fj31SP0iBvtJMG7ebbmIzM7huZ+t4LFyWgp7p5b0lj3W7uEzA9T2j+ba/lxoEBoFyjTvapdgEBArCo9oTSNEZNIW2qiU+NehGLPYyr3hJYsbtG2sb+5KcP0tfFi5/8ffsjrRQgdOHWOWUOEjezn0N4aG2W8e7VJI/zuPbRGChxPm5FdiDoSQ1LDHGUbMAtfX5fPXz9kGrl3ftyr4GmaNUIGZ5HXnpZFJKSj6+QFrDDlecJkYBtyaD+QrDZCKG+X2VyWwyaukVpR2fok2zQnlrLtgpRZaEBxO0pRkPFkwTDhZ2r+cc2UL9XxIBCHpuS1SN7igvtrzwU6mdPt/Gp+S6so67zIajxr/G2eRnXJdirzpY9c6QGW1SiOo7Jf5QNZQx5c26vDMxK+xV5LPcetBFIYJ8LhewUX4kBI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(70586007)(8936002)(70206006)(86362001)(36756003)(7696005)(336012)(6666004)(40460700001)(426003)(2906002)(8676002)(1076003)(82310400004)(186003)(16526019)(2616005)(508600001)(26005)(81166007)(356005)(54906003)(110136005)(47076005)(36860700001)(83380400001)(316002)(5660300002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 11:38:03.8500 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd05d390-8d9b-400a-3ad6-08d9db4027a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4366
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

