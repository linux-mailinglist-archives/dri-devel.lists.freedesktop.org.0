Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 340B1858048
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3164210EBA1;
	Fri, 16 Feb 2024 15:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ja6E55G4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD9110EB99;
 Fri, 16 Feb 2024 15:11:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTmbTaNLwfsCx3ttE6ro/SIYmG1lOayKm/XD37HVLKtCuayHVgZ+a2zCEzgxAS9IW3Vj538/ZCifFWjTtzXfnW63OvhAzL+WyRzPGuEn4ENeGz/3A6AjXLkeWnzWhFuOClxY6Bh27mJzssjKS507tkvkgAbqSm8UfZ4fgnn85n1k/KW3jgJgkX+iJ1STrDiLpGg+3bHCuQ/OvHa1I6bbgDXbmTVwWh9TogdhQsyLOPn6lvx8jfsy37lhXu6SCmgL54cxIfmbMZUN5j9b2shsGLyKt4kPgZvS6oNvXMPUzfM09D94U7LZEs9pDU/cIyxeqjM4wonIJDaeMRQU4T0Dmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICCI0nm6dGnnrxMIjneXXjS64ZTygPY6q4C1ea+Vdts=;
 b=XIY92XMvvsWIL2iCtapZcQp7fo1b8FeZ3TYo+NMkQwQJcUC3NnZdigIRVtvQ6OxmJPNlD+vVHNGJ4fBmfTEpvzBOAfEN7lzWG+6vGme9A2V0quzpN/2QBHJ9MwU5rjNlzd6+mozB1kuJrU6yxt35aE3XunNUr1eWIXoWPDIZlSosPSyq+DRX31MYhiR6OBplsRa5kuRYEFXDeqJeqRIpHtIgxBvujsQoYHWZi2/aUWCYw5bOMsOfNXAQ0pIpHY9bl6sfuNY+2tNLTrayFpCK7nismx31tBOxfAOEKwVZyg0DPZ/27veERpMfakEqyFNhFxJC7BtE0YOBxvB5dH20ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICCI0nm6dGnnrxMIjneXXjS64ZTygPY6q4C1ea+Vdts=;
 b=Ja6E55G4D5yS+ThG5aK/lfEfVOitUrl4T1IHx5WQhBVIaB6INkChgQ400CPKSJAB9FvBTdRSWnDi7a/qVNGjKL2oSg2OdwIMVCUuMCLkeL+xEn/lpFXbO7A9lqtEea9InxLtkn8BwpM8Q4f5ujARUYocSXbSYa0r4MxZG7pyyow=
Received: from BLAPR05CA0014.namprd05.prod.outlook.com (2603:10b6:208:36e::18)
 by PH7PR12MB8153.namprd12.prod.outlook.com (2603:10b6:510:2b0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.11; Fri, 16 Feb
 2024 15:11:31 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:36e:cafe::4e) by BLAPR05CA0014.outlook.office365.com
 (2603:10b6:208:36e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.14 via Frontend
 Transport; Fri, 16 Feb 2024 15:11:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 15:11:31 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 09:11:28 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>,
 <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 2/8] dma-buf/fence-chain: use trace_dma_fence_sync_to
Date: Fri, 16 Feb 2024 16:09:51 +0100
Message-ID: <20240216151006.475077-3-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|PH7PR12MB8153:EE_
X-MS-Office365-Filtering-Correlation-Id: e783b0ca-66b7-4704-4d72-08dc2f018ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ztsynES0Xhbmgcbc9zRAwB1rBOgMt+wjoNdYDKR1utHMLgh96GyOB7yNTtVQawp97ocWeAJn7Y2DPke/0fYs26c6cqYV8tPRNVk54iKI7NujItiFpSMGljk8/IpYkGo9P9om15JnH4WuQ5EjyL/x/YSaUj3qhCLcS6UfAqoPv98gtwg9jgNF9cOeDaK4f9n6LPfrSN7uSeGvgDooRcb9W2AHdWAWG2n3O2MG8WLHNvfTqGNVBXwp0ATykI6LpMpv1w+Phjc+7DnUOc2HADBk4RT9uSv0vHKdnkN+QSv3RGyaF47udyinNOAjM0M5GJJCKxNKCkOmBo9QZPcJualc9sUGcix/IzKTZu3VXrN5Idc6bgPRmCN60OcL9DHc1kFxtfVyfez3ogG93EOw6Jhf2XgIblAvS/E1RaQ/EAcy4bsUT/lm2ifK4vTx9tujUXXQoUvHKfCI+GVgbFyCKNvY0pbxTmiRgpoY6jTpPDB87PM5zuItr+ILmihOqJzAnQxYoZbYwa88xx7H3CCcoCYTYvcmFJadfQ67ETSoaSRcquCvldtIUBwwz1ct1RbCo/usaZ43zLlcQDlnyiGHXW7Nv7ZZ8QfbIEN8oWL0Usdl7e8qqBcC5njYMicC/LLYNwbyeqyRgoCNZO7Z/Eo36ULXMCmLlrLWMH5pKJHSn4PHDXg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(186009)(64100799003)(1800799012)(82310400011)(36860700004)(451199024)(40470700004)(46966006)(478600001)(41300700001)(2906002)(5660300002)(70586007)(4744005)(8936002)(8676002)(26005)(426003)(7696005)(316002)(6666004)(2616005)(16526019)(110136005)(336012)(82740400003)(356005)(86362001)(70206006)(36756003)(921011)(81166007)(1076003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 15:11:31.3773 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e783b0ca-66b7-4704-4d72-08dc2f018ea2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8153
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
index 9663ba1bb6ac..3435078c45b7 100644
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
 
+	trace_dma_fence_used_as_dependency(fence, __func__);
+
 	/* Try to reuse the context of the previous chain node. */
 	if (prev_chain && __dma_fence_is_later(seqno, prev->seqno, prev->ops)) {
 		context = prev->context;
-- 
2.40.1

