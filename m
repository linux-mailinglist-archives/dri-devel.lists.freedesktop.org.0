Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448FA85804B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CAB10EBA7;
	Fri, 16 Feb 2024 15:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fhtMK77M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCC710EBA3;
 Fri, 16 Feb 2024 15:11:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fg9WggaLPJSaYWpOftfetvWrLnHNsZesAyvMbZc6gkUU68pxHUGduUKztkrc2EnDBv2EZFhTgdbD5d9Ty9JSiLCBraVs9LmjwV8wYDVu+EsDPVp5kwMvlPx6FdU5tPXeLhbNmmTFq2VD0wUmu55nmj9uSlu9HDRNBHjjwM1nAXK8sRX8nKxsjGNGiBSq2ldKEWmDBtVL26fXGS3NXr8gW2djFxA0zgEKpFM9OqpQE4HNxdju/JAWYUeOH4oB+0n0rP52yX9pipHIUaNnbZ13L1KxuUSUhIsKOS5/rLbwQcGDH8TYfmUF7/LnIoeBuzrxj/IZIPLejDOLowUJd2jmTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmLc2QsBOukZimiLaKvgyuRt6KRywEvVVlG7RyziCAk=;
 b=oXSzY6rvVOoPHHYDTHUknab4Lt1Y9bgpXEAYygFpuEDxgEkQ8UDcs7iGl0jr2WWOGH/4gvfd/+1H9yS7VhEnXuFRyyzPkI2DOBdz2rCaLdNNvLNrOScvAoIe0YZ3scnL6Bwr7dUEiebR8ifOi+Sk+Yt3Ah2gY7MN1nC13noCtpzoZfbc+1q7xy/7oKn039V3yRsYT/atv1u8gn5LvnoR9Bnn9V2wFNQ4gDiIJG4eq/sNfcDaDvm4P/pMrer9JOyQi8f4ZNFT9dPHrrZSL3kYP0Zs2gyR1YjnzXL6GS8Ea1LTmI4IslvD8b27E9G53aWmAwZAJ5eFPwytEUHS+sDgiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmLc2QsBOukZimiLaKvgyuRt6KRywEvVVlG7RyziCAk=;
 b=fhtMK77MGPoM+d/PwdaLIPpvhe6taV7FsMO8jJMIoJK4pdfJODPbim/WAOnTAuP1xE+T2JdDRKXs+nCyqojkpx69OQNSqbfmbqRkoX8sMZW80Kjwqq5U1hwxpHbXuXgTA7jCPhi/OMmE6zQutfQQIKRGV0KbQkoVbKhAxnw34/4=
Received: from MN2PR15CA0019.namprd15.prod.outlook.com (2603:10b6:208:1b4::32)
 by PH7PR12MB7916.namprd12.prod.outlook.com (2603:10b6:510:26a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Fri, 16 Feb
 2024 15:11:55 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:1b4:cafe::f8) by MN2PR15CA0019.outlook.office365.com
 (2603:10b6:208:1b4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29 via Frontend
 Transport; Fri, 16 Feb 2024 15:11:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 15:11:55 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 09:11:52 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>,
 <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 3/8] amdgpu: use trace_dma_fence_sync_to in
 amdgpu_fence_sync
Date: Fri, 16 Feb 2024 16:09:52 +0100
Message-ID: <20240216151006.475077-4-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|PH7PR12MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a3869e-c4f2-49a8-8825-08dc2f019d02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9HvU23uQH88ECE/AE2+nGzk7pu13W5Uu1fcVD8eD49Z4fTywdmdpIPZ+mWrh69jQUHsbqUw8x0uGuQZZEKRKESTTqmpVjXzHg7uVpFfUyKMwuqJhnzrzU19NfUZb0GuIAFxWvk6pa/zIHughU4ub5S2+QPSRtcRZtX7shXOsuCqetgUAMlj+DWgrdTWcftSfXpWtnwvH7s2c2S9FkrprewIWF+lUZwzO714cVBvRxYZAjaXOcgB4tMfozZZujsPnkzy5LILeM+bnAM4I3OlNE9tSABIBLFuPxv0dYXGbrhQX9xJobGf5aZuc32oM3id2R+jrqRqq/uy+yuHApvIIRX/BbUwUxWmBsS1V3dbKyNOr3+g+SXYms8BScdi/5cGHsA3BvHtBngTI62vfB80+iS/tcV8O8lXvFVBWAtr2G6HQpvYy0nwFTAftLvw8H4TRT3BpC1mdXSzVEnJInf1pMOKr1OjDzoBpXvmuchoxlBvMX2V44S0NAwS5YCSQb69+VepjTpZn5pwXDBPbzvFjYmfB+14xHPzX8zT8DeUs0nYGuxy3pY1aBEC3sIbokMCeZ4s1GJ0IWMkKFrkqt/cC2yGzYEPygalx9mnP4zYpS4bbto+5Id8jPhe1tJeMH+xPcKYN15S+cSpvVqpUC7N6YQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(376002)(39860400002)(136003)(346002)(230922051799003)(64100799003)(186009)(82310400011)(1800799012)(451199024)(36860700004)(46966006)(40470700004)(2906002)(8676002)(5660300002)(86362001)(16526019)(2616005)(356005)(36756003)(26005)(7696005)(478600001)(966005)(81166007)(82740400003)(1076003)(83380400001)(426003)(336012)(8936002)(921011)(70206006)(70586007)(316002)(110136005)(41300700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 15:11:55.5116 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a3869e-c4f2-49a8-8825-08dc2f019d02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7916
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

This makes it possible to understand the dependencies between jobs.
Possible usage of this trace:
* stuttering issues like Mesa !9189
* incorrect synchronization: I don't have a link for this one, but having
  these events was very useful to debug a virtio-gpu / native-context /
  radeonsi sync issue

I have prototype code using this in UMR, as can be see here:
   https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37

v2: add a macro since every caller passes __func__ as the reason parameter

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 9 +++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h | 4 +++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 1b013a44ca99..9a3fdc4be51e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -30,6 +30,7 @@
  */
 
 #include <linux/dma-fence-chain.h>
+#include <trace/events/dma_fence.h>
 
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
@@ -145,14 +146,16 @@ static bool amdgpu_sync_add_later(struct amdgpu_sync *sync, struct dma_fence *f)
 }
 
 /**
- * amdgpu_sync_fence - remember to sync to this fence
+ * amdgpu_sync_fence_with_reason - remember to sync to this fence
  *
  * @sync: sync object to add fence to
  * @f: fence to sync to
+ * @reason: why do we sync to this fence
  *
  * Add the fence to the sync object.
  */
-int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f)
+int amdgpu_sync_fence_with_reason(struct amdgpu_sync *sync, struct dma_fence *f,
+				  const char *reason)
 {
 	struct amdgpu_sync_entry *e;
 
@@ -166,6 +169,8 @@ int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f)
 	if (!e)
 		return -ENOMEM;
 
+	trace_dma_fence_used_as_dependency(f, reason);
+
 	hash_add(sync->fences, &e->node, f->context);
 	e->fence = dma_fence_get(f);
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
index cf1e9e858efd..52e7306801de 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
@@ -47,7 +47,9 @@ struct amdgpu_sync {
 };
 
 void amdgpu_sync_create(struct amdgpu_sync *sync);
-int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f);
+int amdgpu_sync_fence_with_reason(struct amdgpu_sync *sync, struct dma_fence *f,
+				  const char *reason);
+#define amdgpu_sync_fence(s, f) amdgpu_sync_fence_with_reason(s, f, __func__)
 int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
 		     void *owner);
-- 
2.40.1

