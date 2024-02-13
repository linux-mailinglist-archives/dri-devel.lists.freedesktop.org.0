Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A36D85353B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 16:53:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A7510E833;
	Tue, 13 Feb 2024 15:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YL3w7a4+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE1610E833;
 Tue, 13 Feb 2024 15:52:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGUqls3gWWX2Ko7hAjqV8kuIMPVWnXI9exuhlbT+HItTxDM75TIho6oszQ8lNiFjXx1RCXvgwPUxdHMvp9MfykozuCvHquc7vC3ijdzSo7CN2XgOZGwglmLleiTnrYZFXrd+i9OpEH/d6Fv52C2iigq6zO0v4HlfdhbrMeAlIsCwcv+JD2R6np0KPaDTDHVJVx/9bNK536qV5ZM2h3coHGynAZdoJwOqPisVpvxvLSWTFz+QEc9iWx4fXsjMmZhKo/KfR73nY6EoKfCE252+fnNbKInCsYxecanDgoLpdzXx/fSUqB+4P/8UZMp0oALNjcdDMUIE01BEKJbssfXO4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEEFCReCDBgqHrLx317RvjPACbCy+vsGW7UPa1jC/dc=;
 b=lthswKtDCj3HrC2mghUEbrFL2enrskbSg3RyciJc7Ra4MyKhv0bIRFpW//YOKyIyedQSq1xCG4N7mBy7sR7DegolbzjoCunBpd8n7bfNtVmK822Nx2lVQfZ1+B036z+JLL2UtjXcVJdgMWDYYytqosOcmtWI/yAduEvElyhK9fPHwSVuniPfGim/Dofb6pHUop5LuD59Ce4KmsKysgyl9/9VaDZdIeRZdfDkh/6160nzpQ63Q9L2UxmmDXCj3RrlZ5juEQACLnkgmjwDLNiqWfnq/jvSPnYyILLI0LOaQXwW+I29QyCVWFJu7qBLrh9Q6Pg0gyCK+1ZCV2Odz4Cz4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEEFCReCDBgqHrLx317RvjPACbCy+vsGW7UPa1jC/dc=;
 b=YL3w7a4+0Y3RYdzK+DGycOzrpxKqxx3UorvLTz/FfLbwSgCD5xafTNy8Kzjiz0My4q74pX2mv/rDDOMDwoI9urdcjVRSAmxH2oIFU42SRlXLZIb2PYYo0cFLvD0IQ4VWupfdM9YCxNVmulgeGDtDj+zaptNohzTs6a+gqXNKsDo=
Received: from CH2PR07CA0058.namprd07.prod.outlook.com (2603:10b6:610:5b::32)
 by BL3PR12MB6404.namprd12.prod.outlook.com (2603:10b6:208:3b4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.10; Tue, 13 Feb
 2024 15:52:55 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::50) by CH2PR07CA0058.outlook.office365.com
 (2603:10b6:610:5b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.37 via Frontend
 Transport; Tue, 13 Feb 2024 15:52:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 15:52:55 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 09:52:52 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Steven Rostedt <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v2 4/6] drm/amdgpu: add BO clear event
Date: Tue, 13 Feb 2024 16:50:29 +0100
Message-ID: <20240213155112.156537-5-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|BL3PR12MB6404:EE_
X-MS-Office365-Filtering-Correlation-Id: aac209f4-3634-4c3a-34ef-08dc2cabd817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wU8edDcM2sno8Ltn1hCILIocYo7QlZw9cq0RYVYgyJz5EjBVM1+lr6iX65vcZJcjoxlArq9/nFlS9edIXRWy2yGfwxHZ4ReOgI53agKqz8k+BlxvMo8d+KMfCSTK6gx7Mg2Co2tWuV/fVQNH2D9+OD4QANE3BLtimmo9O42CZm0S9zMy6k4pxQhIyxVLQH7wdgjQN1NOLMGL5bdo9wAcFJStOPq44/XCiPdIgnnjbILlfADJI7ijUhahcXmVjCzienOA4uvEUBxGbChFXN2mZErb3hLprGsgQpgB2Rn+wZtD+nYQvuYhXJ4iXzR9eKsBlcUvK9OLZwbvz9pVsLcK2E60DtMnKqTLOMkxjKyTEBhQXvqpOvXOldFZZkgLaK1RVvsGv8sGa/ZTrLIMKsY476lc55WNrXmK6ydAmrd+GAE8x7TugYdCU3Mlif1iaU5aT3OALc+PHYa4rRSJ/4aKvOG/ynLBq2lDMetY4dOt+1TTtJPccHU6v/mplyCgr8FwDdr5cXXDNLPEC2/kPovZyOZsf+SOMWmCt1Vdm/eHvnXq6uwSz88YI2rHL65Iwe135gYCdEzkm2t4ggTfK+tP4E2MCmXc4aLYsyduw7sJArD6M2QIkNlvYuwJGyhWqrjNsBNFOYIeW8wXUOaroqa4Wg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(451199024)(1800799012)(82310400011)(64100799003)(186009)(46966006)(36840700001)(40470700004)(316002)(5660300002)(110136005)(70586007)(41300700001)(2906002)(36756003)(2616005)(16526019)(1076003)(82740400003)(26005)(81166007)(356005)(336012)(70206006)(426003)(8936002)(4326008)(8676002)(86362001)(478600001)(921011)(7696005)(6666004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 15:52:55.5259 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aac209f4-3634-4c3a-34ef-08dc2cabd817
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6404
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

Useful to identify why sdma jobs are submitted.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h  | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 425cebcc5cbf..7219f329d6f0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -631,6 +631,8 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
 		struct dma_fence *fence;
 
+		trace_amdgpu_bo_clear(bo);
+
 		r = amdgpu_fill_buffer(bo, 0, bo->tbo.base.resv, &fence, true);
 		if (unlikely(r))
 			goto fail_unreserve;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index f539b1d00234..e8ea1cfe7027 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -514,6 +514,22 @@ TRACE_EVENT(amdgpu_bo_move,
 			__entry->new_placement, __entry->bo_size)
 );
 
+TRACE_EVENT(amdgpu_bo_clear,
+	    TP_PROTO(struct amdgpu_bo *bo),
+	    TP_ARGS(bo),
+	    TP_STRUCT__entry(
+			__field(struct amdgpu_bo *, bo)
+			__field(u64, bo_size)
+			),
+
+	    TP_fast_assign(
+			__entry->bo      = bo;
+			__entry->bo_size = amdgpu_bo_size(bo);
+			),
+	    TP_printk("bo=%p, size=%lld",
+			__entry->bo, __entry->bo_size)
+);
+
 TRACE_EVENT(amdgpu_ib_pipe_sync,
 	    TP_PROTO(struct amdgpu_job *sched_job, struct dma_fence *fence),
 	    TP_ARGS(sched_job, fence),
-- 
2.40.1

