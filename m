Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62526853532
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 16:52:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED80C10E817;
	Tue, 13 Feb 2024 15:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Pu6lod6S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A2F10E801;
 Tue, 13 Feb 2024 15:52:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBpyvLmCroPSNw1PU18Apg7fWORfmqbsh3Z4b79d42Z4/gBzCx9lEHUscIoxFBNhGmE7EPoPSLuZfJ0BmIgszFBKSTYsdVXJ5qLFoU4UW09gX9c2OdN4Pl7P3YV1LX7rFpiIn2KG7Dun8hBzb37zfezqD0Eszub3sqlMtdXuYMiXL7I2YowjW5kG81x2LDSG6q0mydaOJTV57DyyKrEv2V0FoBM7kEvvc+IQp6kRisfEBX+16RDdiSBOL5E5JSas4q8E6JvqK2LUqJMYgyTUfe4EjB80q3EER9wA2pHCrxw7Qg1hD4AR3NIEpK7BA9ivA9lnpcCtBdNWBNpAtu+rHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkHdrvI3DsMYDSedNs3o7WAG7SDc933OwvrnkgGc8CI=;
 b=kEysHbz/vWU1lbPP04W7/IFRQHRIFaqVkkdOijedSei+coqRaLM9D9n5j8LWJXvJsLz9Mt5ISNHgTonlyA39OCXhrbASF34tU9ps/jMAxir6ULE8yts4tVMfD+xpwey0cYc8G5OSN+O0+hHKeS92+DpvKplWUrYT98do2Blh+0jBWvI+tlPoDKqqjSuI4PNmLILHIycaTBXJP0nMAY83gRcNiGggmmlQPWAsYl4JEggIGTNKUf+E5TkdK9xqW8Z0gEKGYnv+10G5IubTnNnDvnNbGMHiitjmdig9hqfrqs3BAiJRSdCXOi1ej/CmuxbekmW2/B2U32D/GiJHRaO6zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkHdrvI3DsMYDSedNs3o7WAG7SDc933OwvrnkgGc8CI=;
 b=Pu6lod6SJoXtXXm+y1jKPgNS8pVvs0rwaEtTeK96AGvPAl8Z3T0j3JsogaimmQXE0oyJ/eV/gD1X6oXMqRlnbiLDUsIbR+GQPaUgBVvqdVumt6Y0WQhvVCQ2AF16leKWfHtLGrNPh0INOZ0EfCEBqVl/jWNhNDTvQDgOcInPy2E=
Received: from DM6PR05CA0053.namprd05.prod.outlook.com (2603:10b6:5:335::22)
 by LV3PR12MB9235.namprd12.prod.outlook.com (2603:10b6:408:1a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.24; Tue, 13 Feb
 2024 15:52:35 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:5:335:cafe::10) by DM6PR05CA0053.outlook.office365.com
 (2603:10b6:5:335::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25 via Frontend
 Transport; Tue, 13 Feb 2024 15:52:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 15:52:35 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 09:52:31 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Steven Rostedt <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v2 1/6] tracing, dma-buf: add a trace_dma_fence_sync_to event
Date: Tue, 13 Feb 2024 16:50:26 +0100
Message-ID: <20240213155112.156537-2-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|LV3PR12MB9235:EE_
X-MS-Office365-Filtering-Correlation-Id: fd020c71-8a06-487f-395f-08dc2cabcbdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vJkVWn9UmWhybI+G/6vO+6lIO/PC+wGedzsp78TfOKOWPAmm9LwL7GkYnKVeq0cnUQzaP45MEkd7qqJBpodONg1we/zgqoTuG1E8AtSW/SF6lcgYEvSrA8JAeblP4RE7ZYiG4r/dtubk43O8ViPv5iwvBR8h3tdwoTRH3Els1IlLZCgCybbUfNwwwqc8zf3ZfzPoYO7MezU3h5IYTD+exNCHZ+m2vH/IGsDVfEEv57rZ7uk5WCjs9S2rgjGjT4RQp1hhcuDIUOeiBfoKtJz/kJwZPXaaYyfLeddzc5BIWa3YPtv7D6hqiCk1ptUUt3bRvfkFfO7YDrrPsW1t9kYdEqzs1VZY74kn9olYao7jOqr01c9lr5wBxlgdJ/cUP8r7feyJQ0v3+gabmH1/4Dgia6Y9weLsA86BT9MD9M9CTkgIaG3ZKbATiT2RKTuYAHaO4cF3Rp2Hq7TZ3xDq7kVUX8bHNCq7Hmd8AfucHjfNkkT4ylsavgYnQtIXNlaEhe1NZ5Q16gj0roTkx5spdU05ivd9ii+OsZCMh9ZT+mexKOj0+m/4bnaCWcjkB1y2S019mtfKEHBsusV9Ec0iDGCrXSV3WXWU/NegATTihY8jEUWZcCRgn2swdka9azEwCQ1StGOfwwPEU1nBWc+OolqTDg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(82310400011)(451199024)(64100799003)(186009)(1800799012)(46966006)(36840700001)(40470700004)(86362001)(41300700001)(83380400001)(16526019)(921011)(316002)(1076003)(6666004)(26005)(2616005)(7696005)(110136005)(478600001)(36756003)(5660300002)(70206006)(4326008)(8676002)(8936002)(70586007)(426003)(2906002)(336012)(81166007)(82740400003)(356005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 15:52:35.0223 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd020c71-8a06-487f-395f-08dc2cabcbdc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9235
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

