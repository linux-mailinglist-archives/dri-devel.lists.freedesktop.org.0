Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1139A853535
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 16:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE08010E80F;
	Tue, 13 Feb 2024 15:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lo6qjdGs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9C310E80F;
 Tue, 13 Feb 2024 15:52:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lk6ROejYYmKyYhGRGXakh9j9JNxhgApTIsjA2yygFwOAV0G0TBJrl1/UCJHN9blX9siYvrAbPhMmuWj1+rXYEdJU71mEqOZ35QL4FtPc4bIU+qRI9sEhxH4udzyTmQviuKRLUCBm48td12/NztfhQlaSsxtd+lAh3ZCoPXMgPPo5IiM11u4gyi2IJkhQJ3NUT2JdgVRmQ+KPpVTCxSJ55WoIY42604eK/ttrAthmfXb5cbEhXNuKgmIWmJgQhtQiPo40oYMOQOEJDc4qBxrbKmGw+zbrAJHll3t/sP/muC4S3s77A0F6ehOXErD4y6qCW0H0QNfQ61l+pIR92sxq5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+mYUlwTc4LQ6XmpWOwDvyMPEPfSEwsozW4U5VTJwQc=;
 b=Nq9VfpxeM9YWIsYpwNYzZcsyqkn8lom/PD+U1ULjO4exOfDzlqx8ywoc0KjTcIkmFIRA6Ih/TnTcvcSHLh3ZkqCnBcS4YzDNNrFwBvRnW1/OLyoi79aVovMTZnbE0b9pQVevwossoBOO41VRqu7S3Hs1LJwuo+4AP5vjdtoLfF0PyBJec/0USYNsAXN/KEO41LxLspZz7kZ5IDKtE6glpFb/TwypXUI8zu/Z90kaFAcIaxvJNqQRfntBOrft/KL6UDiRq728SeC0eC2R7GbyGqJ+4kPgR+KCk0w7hDrOzzxa6Ck8uahyIAv8aJ0MlH8pK4zPrkJmgguiKN8t75X3jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+mYUlwTc4LQ6XmpWOwDvyMPEPfSEwsozW4U5VTJwQc=;
 b=lo6qjdGs488RZVmtEJ16HotYl96duv8CdfZpQSj2iJs+k7bMsrP5jx6H0l8X+rGbBv10hCveBh9+oIfKOH1BBGNf2ZY/5grjLh/1ADkCU9tflrB3DhhGOLUMWzRONTTOYzx+O+hAcAy7JtrEX8cBYVOi6ATgauWgDvXeNei+a90=
Received: from CH2PR07CA0040.namprd07.prod.outlook.com (2603:10b6:610:5b::14)
 by CH3PR12MB8582.namprd12.prod.outlook.com (2603:10b6:610:163::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.23; Tue, 13 Feb
 2024 15:52:43 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::59) by CH2PR07CA0040.outlook.office365.com
 (2603:10b6:610:5b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Tue, 13 Feb 2024 15:52:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 15:52:42 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 09:52:39 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Steven Rostedt <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v2 2/6] dma-buf/fence-chain: use trace_dma_fence_sync_to
Date: Tue, 13 Feb 2024 16:50:27 +0100
Message-ID: <20240213155112.156537-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|CH3PR12MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: 00715424-6bf9-47ec-3202-08dc2cabd093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IRYf1pXGWvuxUatWQ+wasov3s81/5FxRRSrDYhCQCMKRVWuFI0ErCvqc8aNVmXxkzPl/mApANmoP7cg97/UFlm6/BaAeRsRK4ILjTyiTM4MnjcK6rvlmuD2l7cGz+JFsiuMy9D6IPmuTj6CeVOhEeuMDSN2lRsK2Dq8IeskEWK4utTsxVFVkXy++ME+RzCzzgPyzaTBMvepMJL1puDHwrKQ6Gpqa5LMLkB2IgKVdweGa4hDddALwQsnx4waHznkhE6eg8oYsVBYVmFNlX4LzI0ShhPV7VfrBVaQdFTJkVVfuWcbbdQVhMe9thiySZmEhsZuxPCTkn+3vqiQI/3rLIGDbvllpUb94EEkPFYUTSgDNkbHYgAkYOPQKi/K6GJMp9G6hMnD6JamGoJXSc+5dexYOI5QjzGhEheBBO4pKkctrhqouKXJLYGF7hE6qkaLQyE9r53Fsxsp5oquGZgNuB10bM45L1MQ3PD1OA7nsSZgn5ICUKwH3xLSmOkUsuZk0Wd9UOvqJzePGwxdWejAw4BfPGsWLbiPPQ17nVdnfQ9Xjd6TU4OjCwH2+XwSh3ur27pr9A3sn9a/u5fzv63rm6w65rWbZP11+bi6HELforRjtQ6HTsIyxyhwygGtT8YQoETO4cHpsgEdENjcgBGg4TQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(82310400011)(186009)(46966006)(36840700001)(40470700004)(478600001)(41300700001)(2906002)(4326008)(8936002)(8676002)(5660300002)(4744005)(70586007)(356005)(7696005)(6666004)(110136005)(316002)(1076003)(426003)(26005)(2616005)(336012)(81166007)(86362001)(82740400003)(70206006)(16526019)(36756003)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 15:52:42.9167 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00715424-6bf9-47ec-3202-08dc2cabd093
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8582
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

To inform tools about the relationship between the fences.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/dma-buf/dma-fence-chain.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 9663ba1bb6ac..a211b3d4156a 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -9,6 +9,8 @@
 
 #include <linux/dma-fence-chain.h>
 
+#include "trace/events/dma_fence.h"
+
 static bool dma_fence_chain_enable_signaling(struct dma_fence *fence);
 
 /**
@@ -251,6 +253,8 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 	chain->fence = fence;
 	chain->prev_seqno = 0;
 
+	trace_dma_fence_sync_to(fence, __func__);
+
 	/* Try to reuse the context of the previous chain node. */
 	if (prev_chain && __dma_fence_is_later(seqno, prev->seqno, prev->ops)) {
 		context = prev->context;
-- 
2.40.1

