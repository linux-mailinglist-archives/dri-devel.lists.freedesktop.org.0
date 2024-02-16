Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4E7858044
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288FE10EB87;
	Fri, 16 Feb 2024 15:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zH9w+WbY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABF410EB87;
 Fri, 16 Feb 2024 15:11:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMqebRBLMbjclz9HvWd3zzu36m/NHSlIqDWfrSBUQca97wbpez1HDlMI8shiJZGqEZo7fbR23Q33dh8MrdOEwqOhnRWeeoxnyklvhAA7WWDG1qSCktEy1rKHr2GQP4vFK/ep6Nd+UzUMgKyROT6ayQF05h+fDyqYAzaweDLJQZB4BsO83L9USJCc1vyKJnw1Ciu88sIgW7F5hSa9aTmPINZ6zIdJh6fwJ7SyfpFTUi7ESgun2VYZXCTvXVgboRddb9UzNx1ry7lhiekttM7nTOA5vj2bKlSnBxwVM6X4A2oMJWL/U6cK7WQgJm2ihxzjulpCsvMzdHMQiYqBGNM92w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpTSVo2kk6slrMF45OEiNz5zy+SsirxruPo4DHrTL3k=;
 b=X5xDRrqq7q9dv06pGaJxOkCZ0Br8MqvwDdtkYSkUyjAxmfG6CUtvjJUT8v6/bQkjGuP+c/KX+5ZnAeNyDjZkLvFFGskJsN8Eb52kQKtdQkqZ+K2wGmK4iWwFivDl8NXgHg8QJCiKNNvcDWs+5keAcsEWHXtn6lJmQB8ypPCpvbPTPzEo6uolneFqIffMK7Jif2+NQvaXJ6JRuOMa7Z8ul9rNGY6NH92iqymnIe95ZFpDMMK7uwOy/d5t0CYSqNuC52iRvjG+LYqS3Ta5mLmiNr0frWl84u3os18FpuqwKau05np9DpqYMAN3CG0cINsG+7UofrogY2V1Oc46okff8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpTSVo2kk6slrMF45OEiNz5zy+SsirxruPo4DHrTL3k=;
 b=zH9w+WbYceoA6wC+IaiYczSJIQi0YGWaJytAsSkHGue3ZIF+aVegmmF0MzfDozxBWkvFENZimDr+BMVbYdSqHa2qaU+MFbG2TgLj4rGkXUiNSBZJXwvc1Y1vEJL3wnNNa6c53oIOD5/VNe0oEUY9lElhgT8yVwSzZwbmltHUXQ0=
Received: from MN2PR17CA0031.namprd17.prod.outlook.com (2603:10b6:208:15e::44)
 by CY5PR12MB6203.namprd12.prod.outlook.com (2603:10b6:930:24::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.14; Fri, 16 Feb
 2024 15:11:16 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:15e:cafe::1c) by MN2PR17CA0031.outlook.office365.com
 (2603:10b6:208:15e::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Fri, 16 Feb 2024 15:11:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 15:11:16 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 09:11:11 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>,
 <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 1/8] tracing, dma-buf: add a trace_dma_fence_sync_to event
Date: Fri, 16 Feb 2024 16:09:50 +0100
Message-ID: <20240216151006.475077-2-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|CY5PR12MB6203:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f509a2-d33b-444c-a998-08dc2f018599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gm9VSNEFJhIrgibaYgpDCwy9RyY4qYQ8SsPYKIooN/oG/eWqqGlkdi6J1KVh8mDX5Ph9vexPeYGf3mVmS/7QNGFNdY+H6DbjZBZV6+qJJfRDvESaRkhqt2nSDsnCCdww21+GAcxsturCuD54vkfaWyCdA3wE5tke+jZLp5WMRfOC5/a4D6L0PIQ+T7yXCDouXptadsf7gFfm2bG3DN5/Gs3QIVd9onuiMy6XkuHEbLXDYdZQHwwUrXUkTLXJU9bSXMnGQ3tQb/LWPM9/Uj7WRaBOjN2tuOIFarrb5fPtZF+oSakrR8Aavb7KhEZFgJsoV6jvDQGqdZfoPY4Jhk721Z/0ZAVEUjcHG6zBMsjh0f9BuhDVEjeuugsSFZyc8ytJ0M0X9sghyqGcrJB/fl3ehZmdKU1EF7og2s7RqgKd0VYncyaJzc1FuzgrBdwO7jpV3cdnSXcWvC981wqHU2hmb7wN1gQ6WlZZt/hF+5IUJsX5+skf2B68Q2uDryzfBycix8zSdoVKCo/uA0KNy6BCnl6vZ67YQ7WlbOdUx4Kja2lhp/djp1dYQVgQd02z7wQ1xDknUlpPoMoSBGmh7VuliIvZpGYIV70acVhw5q+SG7/AAOqenTeAlNZMK+6YOoRzuh9frKEd1uhztOu6uJlvwzbd3Dtn9zY7OjgaPHadwkw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(82310400011)(451199024)(36860700004)(40470700004)(46966006)(2906002)(6666004)(8936002)(8676002)(5660300002)(336012)(86362001)(921011)(426003)(1076003)(7696005)(26005)(36756003)(82740400003)(356005)(16526019)(83380400001)(2616005)(81166007)(70586007)(70206006)(110136005)(316002)(478600001)(41300700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 15:11:16.2368 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f509a2-d33b-444c-a998-08dc2f018599
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6203
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

This new event can be used to trace where a given dma_fence is added
as a dependency of some other work.

I plan to use it in amdgpu.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/dma-buf/dma-fence.c      |  1 +
 include/trace/events/dma_fence.h | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 0393a9bba3a8..e7276c043984 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -23,6 +23,7 @@
 EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
 EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
 EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
+EXPORT_TRACEPOINT_SYMBOL(dma_fence_used_as_dependency);
 
 static DEFINE_SPINLOCK(dma_fence_stub_lock);
 static struct dma_fence dma_fence_stub;
diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
index 3963e79ca7b4..5a5d272031ce 100644
--- a/include/trace/events/dma_fence.h
+++ b/include/trace/events/dma_fence.h
@@ -83,6 +83,33 @@ DEFINE_EVENT(dma_fence, dma_fence_wait_end,
 	TP_ARGS(fence)
 );
 
+TRACE_EVENT(dma_fence_used_as_dependency,
+
+	TP_PROTO(struct dma_fence *fence, const char *reason),
+
+	TP_ARGS(fence, reason),
+
+	TP_STRUCT__entry(
+		__string(driver, fence->ops->get_driver_name(fence))
+		__string(timeline, fence->ops->get_timeline_name(fence))
+		__field(unsigned int, context)
+		__field(unsigned int, seqno)
+		__string(reason, reason)
+	),
+
+	TP_fast_assign(
+		__assign_str(driver, fence->ops->get_driver_name(fence));
+		__assign_str(timeline, fence->ops->get_timeline_name(fence));
+		__entry->context = fence->context;
+		__entry->seqno = fence->seqno;
+		__assign_str(reason, reason);
+	),
+
+	TP_printk("driver=%s timeline=%s context=%u seqno=%u reason=%s",
+		  __get_str(driver), __get_str(timeline), __entry->context,
+		  __entry->seqno, __get_str(reason))
+);
+
 #endif /*  _TRACE_DMA_FENCE_H */
 
 /* This part must be outside protection */
-- 
2.40.1

