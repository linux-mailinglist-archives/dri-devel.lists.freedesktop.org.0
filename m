Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ED04889CC
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jan 2022 15:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D2110E784;
	Sun,  9 Jan 2022 14:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50B210E784;
 Sun,  9 Jan 2022 14:20:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUDksVbcjJYfsdmBI9jAowxNpnm2gXKYUwdRuOVIjQYoyCeJ5Dl+QrnEf7LUZ8igWNR2EjJWQRxNAtI6U5J/9mUdcate3QM33WCnDDQAVSXI6tCK6YMv2q9bT+4eiJNgC4dOYl0tnkhH3EeSlkWEJaQguOzRFSjXvohSkFLHCmIjcWpE/H5mvBnVzw4FhWOadr8mtZaok1B3Ej/7JG6K/QAmJpktNWFUh3jeDYNORDC8kCw6rsSZBmfDm6/Z0oGFeO7wBWEeUnZetbojttFwoaxGf0izeU2JcJoGOEBKE3akvwX6sXfxcZEKSnrHHzfMXuKyk90DCffmF3oxvn+XBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=c+f4iTk5ZjlyCguU87+3p0tnR9X7sNea6s4jviFg2qVEIE/sUQ7hs5bgMCWaE47MgcNYcq5dUb30fJPfkrLB9P98YVgoiudW4+A/l6N/wCqNNW/MBLC1LOPUxcZWfDVznAbIty6X4BS/mVSFcUJ5RAxGVIhoPhiyjM4MRQaE5Yu8FaJZCZqkuuxPZYiRD763/r7slJqudJVriHsUFYsyqhHjOWy0Keh3l3Vdm1JbMuOf/tLvvS9TXCGLAgnXi7AAU0NSM6TBw6lwKKokXNIWHCaylANI+vuaSof7cnEcY3zwn0TizI97O4M/MRhQvxAzAayhcBhNTmmIeTZenoJCyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=PeYFPcNb4SWGCzCZMsSgRb/3LNoX/SwXtUt+zs0FyN7xZWva1EAjNnBeoIEq7Qu2RWKQbo1078qTHnjQpqJqmP1XwOQY5tGoidKzf0KI+WkhRn0Hg4LJkOfn+cdcWa0XOqilClTpiAN86lcojxe1Q/p5NpGHpHPAYoknhrjCD84=
Received: from BN1PR10CA0021.namprd10.prod.outlook.com (2603:10b6:408:e0::26)
 by SN6PR12MB2623.namprd12.prod.outlook.com (2603:10b6:805:6f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Sun, 9 Jan
 2022 14:20:26 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e0:cafe::d2) by BN1PR10CA0021.outlook.office365.com
 (2603:10b6:408:e0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9 via Frontend
 Transport; Sun, 9 Jan 2022 14:20:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.9 via Frontend Transport; Sun, 9 Jan 2022 14:20:26 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Sun, 9 Jan
 2022 08:20:21 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v7 5/6] drm/amdgpu: move vram inline functions into a header
Date: Sun, 9 Jan 2022 19:49:50 +0530
Message-ID: <20220109141951.134432-5-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220109141951.134432-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220109141951.134432-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 793a5d82-d8c1-4693-6adf-08d9d37b2e64
X-MS-TrafficTypeDiagnostic: SN6PR12MB2623:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB262314BA87AE4FC1BDF6C79DE44F9@SN6PR12MB2623.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ahR4wcxrok9pdaIxNf2GAxL2elERvLmAQa8MlPDcdQyD6t54LN6gTfjvbpb9mCXhqpWRBJxv/zWA0bJZBkRakQ+LjOPxYfRnMbvNCkbssPUuNbak+DV7J9t/hEa89oP4r2Uov0v72hfbpaobbcev2WXlHcP219Ix6Htpd3N2JwUkcO6uduJqARPb6You+PCwF8sBZOat+aNk09YPFqbwSextUgYVT+2A3Z+0lvbhUL4gvnETKw6ZPDt2ppkVZe5v4wZSdGLNUAIL3Ovy4x0Q072AV6NjimANQ4ve3/mKcSP59TlVef6r63qL4CAE3zuo/Lq/wvGjl33aIssc4z0tfA/ZiNC/2C6vPLEWbUSLFoioFkN/2dsG7FyU1R/hsPqjlQb84uE3ARrljSLk62I2uHGxMmf/eJQZ/6QPk/m9EbkzvVKL/PyuG4QUIGvDnctBcFpaArVrzp20w5ngTjGxCANyJ45RCYpwo1qQlSljP06DxhOtUQtydvMjfVZ1/aqb6WnhdUHz6pqsguTwyuvDJRP49JynyyB9EmLwRfbZkt6Fw8I70w3o+trL0ZMqZT8Cr8WZ5aA8XEPp8v5kdw2R6RuFLllHn147wylX9VK8MSrgtaFCXh8L9Rfuewc6gzRr4Gleb3OU/Hm89jILK7mSsTugPTHdBTJGOfptdvTyMJnHFphMo14s3R7l0FEzXZdKkFPWZMSBz1E+mTjNi8oxKrZQImi2lhmYzExn8K9STjtkBt46rWS7Jg8LBOm9uErTyRJE0AeEFmooeIOr49GZ7BCewhmM0BitadleJ5ryrSI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(110136005)(54906003)(2906002)(70586007)(83380400001)(36860700001)(2616005)(508600001)(82310400004)(336012)(4326008)(8676002)(1076003)(70206006)(6666004)(5660300002)(356005)(16526019)(316002)(86362001)(40460700001)(36756003)(426003)(8936002)(81166007)(47076005)(186003)(7696005)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2022 14:20:26.1938 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 793a5d82-d8c1-4693-6adf-08d9d37b2e64
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2623
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

