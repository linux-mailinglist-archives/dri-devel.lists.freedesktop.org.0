Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 414A348B80A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 21:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443B510E931;
	Tue, 11 Jan 2022 20:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998FD10E759;
 Tue, 11 Jan 2022 20:15:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/ijEINyh8Svijw52IxNKDzOgv0xprPl8WQyzykSSl7gdIKFLOggAj9zRdop2LUdEGP4Bqh6e6XqWMVjkBqNKKib8Hzl//dZRwVEJ8l9OTDAprhfFetVtAK7ip7p08/8JtSI/GzrJqNlXiTYyYpMhEij9mUcYjHt/RY63d5/dhbd8YnuMzyC0D6vN1Mk9WuWtf5GrNalnwjPO38M+VDnRnXzKtRrUSOmAZIW4L3lvh1D2Zpy8GYledIt43WanMvM57fJCqWaLsnCgS83IxkEL68WyOSZcEylOM9lk7X9T/JKvmollnHRgpVctcVXV/rNhcG6O+yAL3IgMWRfT/5gkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=QW7kcvjwRcPEb6QxZnOLeRl/MmXdzBHZ2rX43kl/imH+w2zWugJ7XSV7mrhVWBsafD/qkhiGJC2AqYn4Q/iOTlRNvptsR6jyPow41+zffC5GpXUuqHzx1qzVqS9qqdH814VloXFd+Lka88p9h80e6w5PxbJyhseeddZpkBYwwmc404LmvlCArutqijqWp/s4O4uXB58FNYSSudd96DVLzcEN/2h/IT+i4WIY7myn35Q1ZAsmXt0prSr1S0hL4IebqFaMKkK2UlV8C7eN05B5qR5Fs13BLDCT15XKM2+LwQoZhGgU1Ueb1htSkFJEOf8g7Xy3ZJr2FhLlmKGgbleJEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=GLfBu5jouoLTmLJhWStOB5CAaxRT64zf/aOt1aZwmta53xwSJJna23ITMgBDREuQf4f/Fvt0nBwsBsEZr9LOYC5ISCau1gSziwAaV0eyUmukGM5JxAho+o9z8Jkpn7xXd6prPWfrV7lWsLpjwn3TQsvXP7wVYAQCYS30banyesU=
Received: from BN9P221CA0029.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::27)
 by CH2PR12MB3895.namprd12.prod.outlook.com (2603:10b6:610:2a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Tue, 11 Jan
 2022 20:15:10 +0000
Received: from BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::9b) by BN9P221CA0029.outlook.office365.com
 (2603:10b6:408:10a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Tue, 11 Jan 2022 20:15:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT006.mail.protection.outlook.com (10.13.177.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.9 via Frontend Transport; Tue, 11 Jan 2022 20:15:10 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 11 Jan
 2022 14:15:05 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v8 5/6] drm/amdgpu: move vram inline functions into a header
Date: Wed, 12 Jan 2022 01:44:35 +0530
Message-ID: <20220111201436.2254399-5-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111201436.2254399-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220111201436.2254399-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c26e004-8b02-42a3-0885-08d9d53f115b
X-MS-TrafficTypeDiagnostic: CH2PR12MB3895:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB3895800DD9E274DF7E0A83DEE4519@CH2PR12MB3895.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XQNnOz63mH8lD19SaTGWLGqgUiPEbMRF5fg3JiDWKAGnxJGaVarIVidihJrfSBCrAQ93QiAWf49M9Umuv3ig+nV8wVF90vTbAyteDQ4D3tK1UPBP0yvOlMuDgGwPnakhs1wU7XqwfiJ4LL17lTxg3eqBJDrnHE2N8MYc0DduR/L/M39oeThAjSDKJf12aQyEqIe9w1Vt104IE44ygrKCCKW16zuAc9eyZlkj3etVG5orMl03SXTRYai9nL9tZk+xt8lVsCfXpB1fuBrz1fPo+yvnUrQyyb9LN5LTbH0bIzE+yaQi0tSS4skGr071rXk0dB+x4A/tCr8g0waUyu2tay/afC/QUpMXzUm8nG0FKiogRcFKXST+KVgRu1ZpAXRgMoqD2vgRXhfxT8pLIhlUxELNN0ZB5adRUTN7FsNUpfHzNgCrujP8t2CnlTejZF7dGnXjgcao5CzARyuMSyOPyzsp526c9+TXQzTR111rxEzl3DOEYCr6f48qxhV5BpzDawqrKmhAjkYA1iQFK7IerHv9XNUd63tP4FdsEhU5EUl5NzBsh8/EcMYQChT00QW53VJupvAYhTC/GrJ7ACeSJQ5dQcSw/STRqfRteQS8GlJfiBJQwU1dcH1B2Q6vhX0Hx8zSwjbDXL20S6PFf3MgkxjZUnjo7HLnz3A6aUJDARCLw3qox+95IhhRvTYkkXZd/YzP9wUiNe6dRu4mWBY7GqCOfcVm3INiULKbwOcyJROxy5JpmIh6IUiHNvw/ewHazJ2NTw7OReKJknrinACtVgXgJsOZ3Fm/4sLZdEfG1BU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(2616005)(508600001)(82310400004)(81166007)(4326008)(8936002)(336012)(356005)(6666004)(186003)(2906002)(8676002)(47076005)(5660300002)(16526019)(426003)(36860700001)(86362001)(1076003)(7696005)(54906003)(40460700001)(110136005)(83380400001)(26005)(36756003)(316002)(70586007)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 20:15:10.0001 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c26e004-8b02-42a3-0885-08d9d53f115b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3895
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

