Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4995585804E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EE910EBAD;
	Fri, 16 Feb 2024 15:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WYyowgSJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0503C10EBAC;
 Fri, 16 Feb 2024 15:12:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gR2zxfLdJ/uUx+g5Shv3yJVKA4yS6GytYo/SnTk/nxpuEd0C2xUnqn+MbT6f/SCO6mBvOt+uLoOSu9VrW5MwGRxfFRIwm/Ct8YWzFjIzFrUhqpdzTHGBtxnwTF53Expvg5jp099n2I4JFuJQVLq/1aQvC4cHbQ+X0CFno5KbDtCdWtlkjzB2j9X1eUGCLM4tB4nu+NVThmEG5ZxCwSHX4/I7JUEQCLYRaWopv58InIPhIydkBk5xr/Sq6ZCUgCKVK2vCJLkkPDlzWLGhIoeZIpD4XleZsdmlRuAKCYWRhMAa3xp1YEhJA6xs6I8mkdjN8edA1cw01lSZysUeByZftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeQdUqaUytJOABNwn7pGpwrkwYuLAr/PHtE7tGKM95A=;
 b=fhP75xg9YPa33xsG9tRHT7/hEp2ydg2SDvs4If7Tn+pUlZvjL3PBwI1BiFC09ea7QdQbfmyTM86DD4SKfcgxAVpGFy7tMHAhpoab62ied2wkFkclw/YwHgIpIVm22KBxp/I5p+UQ8mERAmpDIKG7Mo95jr6L1mJOZ7r2ysW31COY75/P5VFlAAulmv3SqE5eLPlfmFjKB/tZD0KYXpIIWGhPVld9ye1GLWAxQfT9izraJf/kE7lnddSLhfZ7N3iJ1QyssIYFvmXbuP7j70Zjy9C6ldCP49g3fCZB3V2ezrvM2iKGIsx3sWlrMI+07PgcYpXjzZQqjZe8I6SCT+O5vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeQdUqaUytJOABNwn7pGpwrkwYuLAr/PHtE7tGKM95A=;
 b=WYyowgSJvV6H5pQ2Bdn0YrUKhMY8QrIAfp4uuyGGn7hoXBR11i/sEyUj/kNPYgdHkFLa1ontuskfbcl87Ocm7p7BiCNb+TA3VS4+EF5dFEOD6tntUHyV/4DQP5ac/IoDPt1LKGgbe2jZHfGUigq3P8Nn2GLK9NexAKdId5QzJbw=
Received: from BL1P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::26)
 by IA1PR12MB8078.namprd12.prod.outlook.com (2603:10b6:208:3f1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.15; Fri, 16 Feb
 2024 15:12:13 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::c0) by BL1P222CA0021.outlook.office365.com
 (2603:10b6:208:2c7::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.40 via Frontend
 Transport; Fri, 16 Feb 2024 15:12:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 15:12:13 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 09:12:10 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>,
 <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 4/8] drm/amdgpu: add a amdgpu_bo_fill trace event
Date: Fri, 16 Feb 2024 16:09:53 +0100
Message-ID: <20240216151006.475077-5-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|IA1PR12MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: e37ade10-9ef0-4e11-92a1-08dc2f01a7e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6bXUVrJLZNkWTKsjpi4I5MeRuOH+YysyS+6zVa8MO/zJTRGIJFlZd0gu0GP6+L7pzAZGIWaJ0X1CJFm7/Ho1Y7HL/X1pa4Q8MGki/f5FNzUpNu4R5YRwtc4dDIJfMwyHVmygkLKQDVFwJHnbMLcG6+hQjUsV6KXNyskCY4qxtMfMyJ5Y50LY5FC3aajKytRaTMKfRYEy1huJzBonA0lsJzU3McV5kzvUH1vJ8MeYglrwR1NIAjvDjw01at1NUE1bgyi7h/pJkcJRv07Kpg/cDsd0JRg8Eb0tvStkhnp0ungtTXxdLqa+20d4D2S6c5eiXF4F4wIt2UhGboTAkxOS4H29Q5KSWVqs/wG/1aCBUqrfDXq1/MbRlQZTZVEk9R1ROcG9xc67xI1wZFRggtrVb7cBksT8eDKMAyh3rFiCi+VIwRs4Mu3m0oHNtjfYE9qjz9YmsEwk9ThjBbTDcSZUMWqGB0naNQ99aSL+2OJ0SiacKw2LcFGXarLhO2IQSrGiLM725Yrjft3ULgyeNwCzImTgZRELE9fTmuE60r6lkfWcjbbe8pdybh5zM9syh32uWym7R1yjbg3uct4tM+6HDKq6dphtEogpGKezS1o8jAYDCVrgZfO5nWsvLSeeNJGTortLPBGSuBWSNoyAFS9oCqR2pK+eIzCQBp+Vl/vAzT0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(64100799003)(1800799012)(82310400011)(36860700004)(186009)(451199024)(46966006)(40470700004)(921011)(316002)(336012)(26005)(16526019)(83380400001)(426003)(8676002)(41300700001)(110136005)(6666004)(8936002)(70586007)(70206006)(2616005)(1076003)(7696005)(478600001)(82740400003)(36756003)(81166007)(356005)(86362001)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 15:12:13.7874 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e37ade10-9ef0-4e11-92a1-08dc2f01a7e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8078
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

v2: moved from amdgpu_bo_create to amdgpu_bo_fill

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 18 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c   |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index f539b1d00234..0e47cbe7e0a9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -514,6 +514,24 @@ TRACE_EVENT(amdgpu_bo_move,
 			__entry->new_placement, __entry->bo_size)
 );
 
+TRACE_EVENT(amdgpu_bo_fill,
+	    TP_PROTO(struct amdgpu_bo *bo, uint32_t value),
+	    TP_ARGS(bo, value),
+	    TP_STRUCT__entry(
+			__field(struct amdgpu_bo *, bo)
+			__field(u64, bo_size)
+			__field(u32, value)
+			),
+
+	    TP_fast_assign(
+			__entry->bo      = bo;
+			__entry->bo_size = amdgpu_bo_size(bo);
+			__entry->value   = value;
+			),
+	    TP_printk("bo=%p, size=%lld, value=0x%08x",
+			__entry->bo, __entry->bo_size, __entry->value)
+);
+
 TRACE_EVENT(amdgpu_ib_pipe_sync,
 	    TP_PROTO(struct amdgpu_job *sched_job, struct dma_fence *fence),
 	    TP_ARGS(sched_job, fence),
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 8722beba494e..7d0b2c1191f8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2231,6 +2231,8 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 		return -EINVAL;
 	}
 
+	trace_amdgpu_bo_fill(bo, src_data);
+
 	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
 
 	mutex_lock(&adev->mman.gtt_window_lock);
-- 
2.40.1

