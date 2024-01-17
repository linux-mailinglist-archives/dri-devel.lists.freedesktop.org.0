Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AC3830CE4
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 19:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E1110E7C4;
	Wed, 17 Jan 2024 18:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2077.outbound.protection.outlook.com [40.107.212.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E30C10E7C4;
 Wed, 17 Jan 2024 18:44:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpDWUdroYDvM6qZRe3ztQdmU2kY5B87xKjSqFhWIflMJW9MitCMhYLMDhvkQWOwGN0expOkAtEUrgpRJ4W1AcwHqIBUwBHOkafFf8nay3Js6QTwcPKZAHII+kMZD151oMXLhZDzqKRlgm4T5qVmTPsh1DGHzBlHoutdfLYq9HxQnMZEmdRCdVyVpErqb3TW+V2HZlCMg9c1tYLnJv6uTlZkeHIe1jMeKw2Tcff7FCruXm8nBAL350+Jh8L1n0Fn71eTjBPNQoZQ1q4RiOCyJ7VMQX+UQ1b6VLfgZg2kqOaS7VHtqN0Me/xwA5rxuV5IwX4ITXjpv9XvChB5WYuQ2/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkHdrvI3DsMYDSedNs3o7WAG7SDc933OwvrnkgGc8CI=;
 b=l6AslYK8i8zkZCx4K2QSBNGAi/uKdTNVHag1IKMzi+cc+jApn0b9tJFGIYFKK00ybAbDjIo2CfStQBgUqsrqjXlPwRLbtQSNXg0B90lvZgG4YuVmk7lX5lV/QfBJFktVSCivHhgzRukuOVAp5wcIJWwWx9NiqH2zLjfaMTKbOOR3AtwIbZnm4hZxgvT3j7DGbzn3yJTqzpDqDHfF2RmzV1LRIdnN6KoGYdzM2zpOfWYB+qdsQ/Bwxaq1FPTt4+E7Krmvea4trBbZ+wgWGvvffrWucwHAinSsYIszY+zKygk1HDX/0WpTYUTBH4wX2OrqUxxB1OBEoPkngs2okF4eew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkHdrvI3DsMYDSedNs3o7WAG7SDc933OwvrnkgGc8CI=;
 b=qQ56stlyN4ei8CB1JY3AV5zQ4TQWsfwPj4OkyK+m5gPlt3KhNFjIBbTeGohXXCOhVxcrYvqLuG7EmYDmxl479EC1lN7dcXx80ABXdkPo3Xuhl+zsh2ECW1D7cOMNf7azrkkORlKGg5PD5FvMNafIdWwAG9kUJYWg38eoopLh14o=
Received: from BL1PR13CA0422.namprd13.prod.outlook.com (2603:10b6:208:2c3::7)
 by CH3PR12MB8460.namprd12.prod.outlook.com (2603:10b6:610:156::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Wed, 17 Jan
 2024 18:44:19 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::af) by BL1PR13CA0422.outlook.office365.com
 (2603:10b6:208:2c3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23 via Frontend
 Transport; Wed, 17 Jan 2024 18:44:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Wed, 17 Jan 2024 18:44:19 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 17 Jan
 2024 12:44:16 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Steven Rostedt <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] tracing, dma-buf: add a trace_dma_fence_sync_to event
Date: Wed, 17 Jan 2024 19:41:40 +0100
Message-ID: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|CH3PR12MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ebcd6cd-fb6b-491a-632a-08dc178c50a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xALERsWlm0aE4tSdG5ISOatK2cz5gmrdrG4l3czhRnv+uFElawgTb6L9XLWOLJYEKZxWaQg1FqXdZaERruB9hdsoa5OG78FGrjnmbeDGGsKsEEWX2NsQ0ZiFL8ev3w4UNLRIftdYJY2a+Ct6XTCIkl8HIV5UzkAkjp/Zb79q+zgm/JkMwMF6+FlY3o3EZn8VYZvZF3x5lpnd5coCvFR7goJir/h6mQQBMG76I9tXeFGlGaoHBqCZqBwMEjItfH2vNGMfLTnPAChDUq9lbmn4keyKWdEvbBoKzmrrv2UuvcmMEjBEgr8zJDNbUafoNeNdih52oentBT9W/QfzVRgm8OSvN/VeK4GfZNIi1BSvC93pVeDvDjfZyNG8rZ1AiF4lz8QlLIR0gOan8TGRuzvZW8BXzcZGUz1nvqupxkPpp+8YiF5yAkHQLe8z8a24+jUO1EmCqRK47Eqzt2nKyfyPS584QBPscocdeB/VRtn7p4T+n+5SOnJBr64SO95EUrk32LMam+BJiMaIOSuldi2LF0Uo9RpCrSTb4uNkQuybVu/B8MeNOasV4Z+gYEfxaGmSfJLcXTgyMtU9cyHklnDlzWsTHF/HeCDP2tGhJUt0ex4avAZCElwvO5fseYgC9XbJdTVnPcEtRbPK0hSswij3saj6nCmwchet+65408l/mQHvdAU1q4iUvqi/k/xIgDExZbDwNMe8Gw6OnyTjsgVzOg3Keb0RJRT/LIXhUuzdj3FYCCqC5J2ov9649b/4KkfWmwoap5A5XC5I0JNOwHZmJsonAFujKCJ+53UIoQW/3BiCMag0oZaLYDdzuMq0oD6YhoXp/wTny99/Ex2Qt2FQuA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(82310400011)(36840700001)(46966006)(40470700004)(16526019)(356005)(36756003)(26005)(86362001)(81166007)(478600001)(40460700003)(40480700001)(2616005)(316002)(41300700001)(2906002)(336012)(426003)(1076003)(6666004)(7696005)(70206006)(5660300002)(70586007)(83380400001)(110136005)(82740400003)(921011)(47076005)(8676002)(4326008)(8936002)(36860700001)(83996005)(2101003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 18:44:19.5004 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebcd6cd-fb6b-491a-632a-08dc178c50a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8460
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This new event can be used to trace where a given dma_fence is added
as a dependency of some other work.

I plan to use it in amdgpu.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/dma-buf/dma-fence.c      |  1 +
 include/trace/events/dma_fence.h | 34 ++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index e0fd99e61a2d..671a499a5ccd 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -23,6 +23,7 @@
 EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
 EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
 EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
+EXPORT_TRACEPOINT_SYMBOL(dma_fence_sync_to);
 
 static DEFINE_SPINLOCK(dma_fence_stub_lock);
 static struct dma_fence dma_fence_stub;
diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
index 3963e79ca7b4..9b3875f7aa79 100644
--- a/include/trace/events/dma_fence.h
+++ b/include/trace/events/dma_fence.h
@@ -83,6 +83,40 @@ DEFINE_EVENT(dma_fence, dma_fence_wait_end,
 	TP_ARGS(fence)
 );
 
+DECLARE_EVENT_CLASS(dma_fence_from,
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
+DEFINE_EVENT(dma_fence_from, dma_fence_sync_to,
+
+	TP_PROTO(struct dma_fence *fence, const char *reason),
+
+	TP_ARGS(fence, reason)
+);
+
 #endif /*  _TRACE_DMA_FENCE_H */
 
 /* This part must be outside protection */
-- 
2.40.1

