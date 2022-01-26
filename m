Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B4149D4F4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 23:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FA910E986;
	Wed, 26 Jan 2022 22:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD99F10E97E;
 Wed, 26 Jan 2022 22:07:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vn1l8OVpLGAlxPQRlXop1boEIKha6ubZo6Gc51+tUBYVWhjeUq0c+EpvJSxBCO99abNiZQD8XjfN88pKeS9fWL2FbynGUBrVHvW/Nd0bQbKYMTn9qDh3s4W181GYk2CcG9HR44R5Zm3Ys6bs8eEjzPxdUhzubltdTOG+qpKpPzvX3A/IeGDQQZQuRSX/8gOGW15doqoE/2O6ybaCMmaFJK6lO7hAImLlwdmIgITbkgGqadhwbuaC/VjepcOCibUbF8+FSvrsySrg5sS4twYWleWMANGW+Tsl6IdWtG4BQ+9hp4XAjN5lnsKAA/hdtJEG4nin1dxptueh8nM32tpIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=lJ5kC1CLtOnsLOOeNnU2SNLRkzdv8mwy6SzYUqFdZSmBkCF+93l0sA56c8NADDzIqwBD+XTHKH7OHnnGjOuzQcLvfOnKnIYDSDpWChMF9jHJGtbqWelFbT3QMX22I6l/X4jHg2Ac/UmDQmRuZi/BFmSTJCqB1dZTRvV4D6Rq+XIKa72CmqGUgC9L6tp8LOa5hzHbOqmC0nIeZuNpdaGXmK+9ShOVZrsHrIj76B4IaA9vohj2QlllsbkZVwIkFawrlrDjv2COCoTCCoovqqhjZYO+SpwEozseT3tZbq12asL8EqRz9vV4xFpmojroW01sO80irGHGPCVr3Y5YuKWGBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kIgAxTsZOmMt/R5KguyZmOmobVdLpO5qp1KF1znmrk=;
 b=d84uxtIUWngPupg2VyTFxDj+syJ5paw3k7HzyxqVkiyizwm4lfSQQYonJpRxb5JuM131D9k9Gn9TgrWIs0BgrZ0CxtxWrIyS2jMHSvfcDwmDOsUCr7wPC0IOCOjGj0Vz0d7DJ/QZ4Tt5m12HGZHi5A1WbHHzPvcaNXNMvBMNgsY=
Received: from DM5PR07CA0145.namprd07.prod.outlook.com (2603:10b6:3:ee::11) by
 BYAPR12MB3319.namprd12.prod.outlook.com (2603:10b6:a03:dc::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.13; Wed, 26 Jan 2022 22:07:43 +0000
Received: from DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ee:cafe::2f) by DM5PR07CA0145.outlook.office365.com
 (2603:10b6:3:ee::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Wed, 26 Jan 2022 22:07:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT057.mail.protection.outlook.com (10.13.172.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Wed, 26 Jan 2022 22:07:43 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 26 Jan
 2022 16:07:39 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v10 4/5] drm/amdgpu: move vram inline functions into a header
Date: Thu, 27 Jan 2022 03:36:10 +0530
Message-ID: <20220126220611.3663-4-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126220611.3663-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220126220611.3663-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4c4b6ce-7877-49e2-fda5-08d9e11846d9
X-MS-TrafficTypeDiagnostic: BYAPR12MB3319:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3319D3AC1CD80DE309788051E4209@BYAPR12MB3319.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vj1NsD04DDnyp0C7LAojctG8b31x9OGfWv3ze7+BKMtyPdxMpLVGipEwAhZ9B1aJo8J4umjsQAQz8OyhtxHYJiCWjlXRfjDdx3f2nS8RZUPC6Vx94cchFDgxVkDUWLKj360W54Fczvqe+SKCfi33K/VWffsf39aTLVFzkoePPpT5aoN1sDHQ8crS0h//lUG170USc1Z8jWZ4F4J9joAU9Ed41v5Z0OalcvSunXSbyte9legKHWlvrDhPVOYGGnpD+wom2EuBl1oyqlBYYkP53bVDKTJVym9TqcHohyqOg1fcrp/m05uQ5LEJWrmDxq/TO0hZOnpTBB5r05MSPA3pMrbzkjCFBA41jpc9LgKmzw1GzRsf1MlByxfBED3bkVXJV3tk02WlbLvIfywHFEtkjVO/oTaCreb5NULAq6pHgCqoAubXtTxRcxqWWnLR7/BZm7tuB5YlQ0BhDcrlcsukcr7qKAsBmlCIRFC/T7BF/EuU4yKMuIUEyJZvtAcVxOs5yHN8bWxIxiFAV5d1wzZtKKzeHgTmyjfuP948VmZNbo9SSkX5KL7EYTwVduQMMjZaZ8rSnGWdRcefqopM+i1VK06xu+6dWAxrXKPfO8oGBHZsuaHCpKgBRg5OVwU0hU/86JL3xQmn0gOsIjhdXOJgCaX64narlQMYCH5vEKFOTRcjp9i4Ouf3m3186fHkaJm/aAtbkH2tUkGi5Kf/XWp2G4fNRObAiM+288FvKpfL8AjnLOrHzMbmrH6uTUCnzGv+8IKb/q3DGRK0oE4VFIDgNyToRQAgTLiWquBKHPRz0TM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700004)(26005)(1076003)(2906002)(36756003)(8936002)(356005)(54906003)(81166007)(110136005)(2616005)(5660300002)(86362001)(316002)(82310400004)(40460700003)(4326008)(426003)(336012)(6666004)(47076005)(70206006)(70586007)(7696005)(186003)(83380400001)(16526019)(36860700001)(508600001)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 22:07:43.2698 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c4b6ce-7877-49e2-fda5-08d9e11846d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3319
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

