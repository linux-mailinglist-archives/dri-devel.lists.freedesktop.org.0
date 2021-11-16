Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2076D453ACD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 21:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF316E17E;
	Tue, 16 Nov 2021 20:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3806E17D;
 Tue, 16 Nov 2021 20:18:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQM4j8RHktuaVaWUyjzc+b/RHQUjjCps6gZmg7TkBZVfrOPHmoHGEcI+VqU3lKk4frXbaJRaAdX9KmRJucyK2RLjhrH23YKTWo5/mIMm6HKg/sx8BtBLoah5VX/AVsU/cepsv3mYQbbKfQa3d2Cf5jOT+q5mxDOdXn7Mvwysx+AHol752Eh2ptIuPxNiQKjkqbPsi8jRbi78wtJaSrw4wWq0Ir8/PfxWq3R9H93oamXMUX58e0qXivTr8USgtW+BGYGrYI+/9dy7sRJfq+TzkSUs/T3tPGeapKpn3bYxXQmiXmr6xKqQbwSWZ5YIZRjn6HYWWYIyuGBCo296Ak6AVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=STdR12enNUEEAG8CkW/qVJwV7+k2RNOvTvfQk8/bLr+MIi5407BiKY41YJASl9r7gh40i6xifds45jxIldFi0ebd3QTg9myrj95UW27tfAGhSATQ2Z2nBaIXN4Yxu5KdTv4/+NwXqglwr+I3Aufq8NR4t4x20g//8d/gR3Rk0Qgya/HT0ifGBV5TJckVVtRAW6SaO4KbzR8wlPnQvpbE6LW978Gr6Xus9UEFQeOijZWL/MQP12usFiGlhpnRyEqvFr6aZYWu8O2z3x/uaW9WeYIFNP65ZgZZppf747ZRy+emWcd88ZFlnKXdFuGddeP+NKuG5IyUJ4ZXxEkQAa5LDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=5Y9rqUekbExn5YwG98zGYsg3nRHhfL0FA1Z8YUmKuT0wKbhd0k9m983/V7gTRUpKGjUFKSdhbQQKw9F0rjGA/NermL2mwkr1fq+ANB3cG39hGHwoHT0fwpWWeg0UiiQiHjVxWndIfS46m2J3Aiu3L2EnrvE9+rFPyifDvI57IcY=
Received: from MW4PR03CA0107.namprd03.prod.outlook.com (2603:10b6:303:b7::22)
 by DM5PR1201MB0170.namprd12.prod.outlook.com (2603:10b6:4:59::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 20:18:43 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::8c) by MW4PR03CA0107.outlook.office365.com
 (2603:10b6:303:b7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Tue, 16 Nov 2021 20:18:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Tue, 16 Nov 2021 20:18:42 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 16 Nov
 2021 14:18:38 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 5/6] drm/amdgpu: move vram inline functions into a header
Date: Wed, 17 Nov 2021 01:48:06 +0530
Message-ID: <20211116201807.147486-5-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116201807.147486-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211116201807.147486-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 270608ab-42ee-43a3-c31f-08d9a93e48f9
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0170:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0170813FA807409114E08A00E4999@DM5PR1201MB0170.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CIdca4dUR8NC4C7WIj+6zIKVIncMg3wmuR93C0nWFVhjqigR5j5299CgYdVajjgqMC/bCf0Xi7hPk1q5U8aT/gp0tAVC9wijBsP7srT9eKjXF+Rcbtc+yOcSa4EPVFSf5kCrkNwCu/jUgW5kIjNcvAkFR0VSsO6PvEXhVxNpe9OvcWQWCAhGHrK1i5+XJ5BMIVWh/9QrL2FAvkqpbTCKi4scLX77hNfHrIXRcwNvQdMWUWtTZvu/NYq8k2a1b0oMUaAYsSWkwsaQCk9SqeQYLqrf7fZDyivnlpNGa/sOM9/sp0NP2bUmhH6UbIlobHZui8mpNnDQguEqCBkMlC0y4a02dPNcVcFIFDtjjEUY+ioJhEiEaVSFZDD6X9PDWP0f0zbsA+Bcx/EYkJLEFsMOMzv0oTjb2nWCjJbacyc7VuGohmKMQlJbhE1oPVToiAhVX7SB+kouc7YFBfVqQgT7wD1kCwiO3M/i6jnFYXc7k8dRrPh0j6hOKTtO3We1OfEY6QJdwTc/vQSr6eR80i27i4muzQIVHC++rM5TRMYdN9avLsydh2WmcRPntnZUcgWuAz+87HJ3kR7Fvhns7H+nrLhdKgBQZWxUBMKoP5wQZYvbK609G9DEhY9EFQGQZwRcJKETxe2mXbsAluJdu/Nz0WqWx7375hQDNHSVfOSDf3qFVHqXjfU04MPJ8aMwkozlhYswKefcjFFLHeGAnEniuHqJtzWI60X/iJ2hZrUpHMU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(336012)(36860700001)(83380400001)(36756003)(2906002)(7696005)(5660300002)(16526019)(4326008)(186003)(8676002)(426003)(6666004)(47076005)(26005)(1076003)(8936002)(70586007)(2616005)(508600001)(356005)(54906003)(81166007)(110136005)(86362001)(70206006)(316002)(82310400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 20:18:42.5451 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 270608ab-42ee-43a3-c31f-08d9a93e48f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0170
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

