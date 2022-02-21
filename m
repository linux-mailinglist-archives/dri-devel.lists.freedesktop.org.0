Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04444BDAF5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 17:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDD510E746;
	Mon, 21 Feb 2022 16:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A53A10E776;
 Mon, 21 Feb 2022 16:46:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YqHOAO66T1WHLPR7CaRdma8Vddq1fP14yBpZKOQ/96XKuFxr6vH85dBe72YAtB99eq8DoxgdIJ3YWVDq71SMdkftHG6niKA7K4SMeux8YjS/wYDisHrEgiqeqCiQ7UrxXZVuVq/GEAVv4EDfW1RFoHqAAtaW9o0t3YGUZSYcS4NMx0Os3JkSViBwOu2m6cL6++iijGNIQ6fCXfiiiSoSpq9Y4omTQ8hMjX3Fa3eEK4xUvQl1UUlWr2tsHR8w7xiajzICfuRVwQUP8rF173rFJTLBfbnNfwwiF2j6nviYqUEJ0ADWqq38zi7VwzoT/VCdWxYCoPUlGltEfLEpMn97YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=mbrFXDfKqvpzcmHcjyhhlfxCYHSq8U5Y5YIV4h7czyh9Ulf01kHhTSkQ22xaytBM4Qk+nKcYYivzwfvy8lZkNgCujVZsKLYKkU4cV9u1oHuJOjhJ2NUlpQqgodAMJJba4h663w9Zlv9acyTLxJJKl2VNFlOEyCsTVlTHfq+iEEn5t5OsivwCLihg7Tl5V5HMSt4PDI/jyjWN2RrrMfqWIFX86SATJO29Gt0m/ZcAgQElU3A50Njz3TDPw7RKBrNx5ySqGBDGoPb/RH/eYdxqcLj+ssqOaUCO389ulsfCWEp8XTxM7mYXnIgAxbaOyPu5MXf1pcCBrgBA/+0nudf+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=pRv3V5BBIta2gIjlJICBhdk01t870hE0EGPGq+ao3zxoNo+BaFnlwfK0ZMFmPvLypG5CLiH4shzgCmtGFw0rCYrkWimfzb8ysKrLjNO06vvT97499dsSsnBBjYYnWGd+pvp1NwTOs2LFuWbR4WiCySZFkJebh8SCoi/4JJoRsTk=
Received: from BN9PR03CA0318.namprd03.prod.outlook.com (2603:10b6:408:112::23)
 by CH2PR12MB3701.namprd12.prod.outlook.com (2603:10b6:610:23::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Mon, 21 Feb
 2022 16:46:23 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::ad) by BN9PR03CA0318.outlook.office365.com
 (2603:10b6:408:112::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Mon, 21 Feb 2022 16:46:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Mon, 21 Feb 2022 16:46:22 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 21 Feb
 2022 10:46:19 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v13 4/5] drm/amdgpu: move vram inline functions into a header
Date: Mon, 21 Feb 2022 22:15:51 +0530
Message-ID: <20220221164552.2434-4-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221164552.2434-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220221164552.2434-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d936272-e045-4e20-b179-08d9f559b19e
X-MS-TrafficTypeDiagnostic: CH2PR12MB3701:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB37018FFF6DB503E79273DF8BE43A9@CH2PR12MB3701.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A1mHFjr6c2n0oEBLsDdf6qezRNsa3p8C948WbtHqxWETWCzi0MHuxEx2vdWoGnDMalw3VkRAw28ifXZOIrdfB0EeaTbYvGAEdJ4Kk8sGOx5oRyCODYuhyy7h6ZhsnKFTsFo5lgsL6I+PzmGK70718bOnlO5Tk4gvxK/GKuHbYPJYvev6VeelLsTSHz7iUy0g7goVa67Xo48/YoZXUaEvcHni1fKLzjClNDtx6jU886X4ozkWgegy/X2FVyhQ43/Rdf/154h4X/xs0bGHEdxH3Dxymq5hPaM1T1vy/vi7nN5eSCK/gp94glLGE7K+yoDIoi7x0cHIned6azZuE5X6c0lXUfu1+yRZeBkK6Viman19Ejy/AL+VX9S/a7yRW5DwXFl+PogGd50nvqbauvC0zxx4MPw33It5lKwVOCdtY5DfD2MENMCkUz4S8nOUT/xHgX4VIJPt3hD51YvePGo1UpnjhR72nFgbC65yGJBRhdVItAq1vraQ6PoZpg5pIowPjaj3h/wXa19LmPhxV7gSrWns8rF9LTcbS/HnScti219G43j00eWQRS03ao6DZXLN5xK1UD3XmuvZb3QLQDjryFL0YKoVosrGE/r+GE3K2C+qehm88goEDLwiB/vb+bES0W58yoVxs0e0YCgTjzJjyRrxkekm0hBH4pxLc5EV2wolZ9e9tURh1Xn6e/1vrEX0FvjIs8/ZwOOtMkphQlmbWQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(40460700003)(2906002)(36860700001)(81166007)(356005)(86362001)(2616005)(7696005)(36756003)(47076005)(508600001)(70586007)(110136005)(6666004)(4326008)(16526019)(8676002)(1076003)(5660300002)(8936002)(26005)(83380400001)(316002)(426003)(54906003)(70206006)(336012)(186003)(82310400004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 16:46:22.9872 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d936272-e045-4e20-b179-08d9f559b19e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3701
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

