Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D84F6858059
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB6810EB8F;
	Fri, 16 Feb 2024 15:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZOZZX9xc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C840010EB8F;
 Fri, 16 Feb 2024 15:13:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTPz8CrHfM+FIJRFYKXsxbBVMrGXBOAuCGJ8/eIA+Mdlr3n2UPgzV5qD0lC45PBwLrD66tkcusRr2Aigsvv+Rb4SQ9q/J1RF6x2BEI9CplFkSinzwlZwN8AX/DTWT6L0qDw0at8ub/izSAjcx6amsBhdsAH2nwM5tlDvq9awrHAELxT9SyYl89rb8ci0wKewDbGfn/XPGHED7ikj2gsRNA7X/v7SZn5xu2eBS0oi5NMHi+0WPceHhoagY5VbPZepWju9J4QB01YogSBZpNN4T2ydQDOKM7ldIU1CPBVT9DeTfmiFKessIdxSBUGOZTgKDQwkbs2VE5fYxlJ+GxUorw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdkNUzs3n8SktVyT8ddjNXfd+jBe9xhPGSbbxW9DBSs=;
 b=mcl8Etn1Eth3NH2UMFX2AYf4lqhs2gZDhIBuvj6JM8lsVQpcTrjbAzZnBBbD+W7CWosVUenGfhX/rGvgFt90NsyTxp3MQOC2WTFBoWovNFCNhNc8l5xkr7STkRh0RpzqNfUC1CpyJux6zSb5FVGHrs8HaKYOk2pacr6iJ4scvZ+3BriObf0tWsNh8NAL6eBEQsz6iVhDiF/yCYaeseUb+NDodjujIAlZJFvkdRvBCdzB7GuQu/rEODt0eljNAhTPtfLk9ybqkGxV2C4G7L/GOC54S6Bf/QTDOHC90j+onb7FBeKFJgNOAQPpwKAxYlNZh/P9n/aWkcUdfiEPmOlakw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdkNUzs3n8SktVyT8ddjNXfd+jBe9xhPGSbbxW9DBSs=;
 b=ZOZZX9xcynaYRUFCjuQ22UvMzb4MqJfsnvEGDv8t+Hxv6oOV7jGx1+bWo6FrDtKScFm+tWXrkkv6BEL/IW8kmR4Ks3a7EVBZVKONPnqWuQUTMOYUmUJbT47Q3RyJAZXzMmIH02EQvkGNYyO8GO3z8Jo0nzUXfxg7nkbSu8eqo84=
Received: from BL1PR13CA0336.namprd13.prod.outlook.com (2603:10b6:208:2c6::11)
 by DS0PR12MB7702.namprd12.prod.outlook.com (2603:10b6:8:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.28; Fri, 16 Feb
 2024 15:13:14 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:2c6:cafe::56) by BL1PR13CA0336.outlook.office365.com
 (2603:10b6:208:2c6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.12 via Frontend
 Transport; Fri, 16 Feb 2024 15:13:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 15:13:14 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 09:13:11 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>,
 <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 7/8] drm/sched: use trace_dma_fence_used_as_dependency
Date: Fri, 16 Feb 2024 16:09:56 +0100
Message-ID: <20240216151006.475077-8-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216151006.475077-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240216151006.475077-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|DS0PR12MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a1f602-ef32-4fd8-760c-08dc2f01cbfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Q9Hkb2NKr1S2LlfX+AfHzukQEbY4kgqMdEPxGbNHLA4oW5gabcBSqznAkC3IqYOsNvSS89WP6ImLHiCuBHqLAY1R5wWi4xPcVxrqqdm3xsHSwc4b4f2EqSSW8UJV4mvwVQGFgmb0oaTMsrV2bqDhZyvQvYRADhFdfiEQM5fBS3Py3t9AVtDwo/D+QdmgRYJytAXVQiXFLSvNPQ7igljlth1uB3wEiC+oZWpX0oX+msMA76+WTb3/5tc1ztV6S2mR+VWxEkhWmA8F2R/M8iBHI3vbXV59GmYa/B599iRUlmXJ4epdJ/W56SLLRGxU9/AXxKzbrOQsR7COrNGVrz/7tpfgFDNchh0cjTy+s4mLOg6GDFAzlFlD1V1D41dBqbZnLJZUU8Wm7W3LBrWQNFAV87F9xSNk326tf7DDRgQ4GiR6gKZ5ltcE0iSUqULr0Se+5/fm4PZIrGsUiYpUI0oVz7FWBxbz1gF83875paokNFc+svbfPjxSDe+G7V929vXX2vVxFlTqyBaGlmlDFVf9/+wLpAmJmpP3I5ReGGmd/93OBLPs0fRNYt0v4ZXESeRpVsi4lqSWeoyM2XctrN2pWnJnlUvMkmlHN/oSSbYA3RwzhVpwqhGSQO73K4u7x6+MI8S6M4eJMLWoRVn0lZDeutzaBEfy/iJu9FMxXuX0LQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(1800799012)(82310400011)(186009)(451199024)(36860700004)(64100799003)(40470700004)(46966006)(6666004)(478600001)(41300700001)(70206006)(7696005)(4744005)(8936002)(2906002)(5660300002)(8676002)(110136005)(86362001)(316002)(70586007)(81166007)(356005)(426003)(336012)(2616005)(26005)(16526019)(921011)(82740400003)(1076003)(36756003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 15:13:14.3026 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a1f602-ef32-4fd8-760c-08dc2f01cbfb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7702
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

drm_sched_job_add_dependency adds dependencies so use the new
trace event.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7e90c9f95611..6ee49f70d319 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -84,6 +84,8 @@
 #include <drm/gpu_scheduler.h>
 #include <drm/spsc_queue.h>
 
+#include <trace/events/dma_fence.h>
+
 #define CREATE_TRACE_POINTS
 #include "gpu_scheduler_trace.h"
 
@@ -879,6 +881,8 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
 		if (entry->context != fence->context)
 			continue;
 
+		trace_dma_fence_used_as_dependency(fence, __func__);
+
 		if (dma_fence_is_later(fence, entry)) {
 			dma_fence_put(entry);
 			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
-- 
2.40.1

