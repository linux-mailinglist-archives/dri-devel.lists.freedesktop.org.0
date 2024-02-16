Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08355858053
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F3010EBB4;
	Fri, 16 Feb 2024 15:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rcaDrJB1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D8110EBB4;
 Fri, 16 Feb 2024 15:13:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jaSWrR3h/YUPwlC4stR/Qdvjg74ZtJYoAuFhEzjg2Y63IiMWoFroX3ykRx3fF8AvwJS6CzJXcORNCsWbJQRARADt//leT+DUD93gr/QQbvt52+OtDmJAauBFvtl9W0bafL1bFIqqpraIDRHtb4xlNjpluIKm0iJtuSmAyJYLMeNch8EuwW2NdqFNeNrg4P1I6oDZ0ssGRFOTSW5z7eNdnE+DJxcHSNarDOHvggm4tx0+QaMktD040bjGKbSaB5nNQnD/tYQtwwM0ThLdPrRMDZrW+QxdezBtg2Tb24j8qxfUXt+AHtT7wx+ZU07/WNhvePqgg2Q+g/5XOtpspeDXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ljojgy8rwY5qa00A4ybe260/3tI9/pfNwX8PxXXmDvQ=;
 b=YNidFxa/pGTQmH4xz90Pdrx8KXt4ihk2HMAsWunk3gUYrQH/luD5BM+ARQquv5nz97qsx6FxT/H7uohJUS4yOesQB8vy5Ko2QHFLofZ4UtsVDJCEbdlD8tE8XaGhChZ6XVfKFxKAR/VbuGTQJKMOQSoExjd2TAnHjDqu9eIW/aXqzVx9hhhrfKxKAuPPNOsv6VhBjzw5yaMZrgfSMLvcchR0ZUEjoRNSoIA2RqEwfryPytsAJHHqo2eshHvmyy6QRgdxgbypBMqy8xn93chlCeclDE5lg/uth113tq+ljdF6l5miYbVi+CcR4Qi3GGZcIzwCZ7TPGc7hfknTuge8PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ljojgy8rwY5qa00A4ybe260/3tI9/pfNwX8PxXXmDvQ=;
 b=rcaDrJB1P/IiWmg4yAU2Egvu0mpq38J1SJkMv0ThaM7tOGCO3j3q4cpaZdAWKdDVjCY4V/BfpcH6BL+lYwaxPtrX9zuA37NrPsyxD+lwjqjQuEueKRWJVBuh/rTOY1GzZRyKMUwYdUPiM3U6v5kofsAxHqNTmqCza+2OoYNg6jw=
Received: from BL0PR02CA0137.namprd02.prod.outlook.com (2603:10b6:208:35::42)
 by DM4PR12MB5151.namprd12.prod.outlook.com (2603:10b6:5:392::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.15; Fri, 16 Feb
 2024 15:13:00 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:35:cafe::d0) by BL0PR02CA0137.outlook.office365.com
 (2603:10b6:208:35::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Fri, 16 Feb 2024 15:12:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 15:12:59 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 09:12:56 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>,
 <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 6/8] drm: add drm_mode_atomic_commit event
Date: Fri, 16 Feb 2024 16:09:55 +0100
Message-ID: <20240216151006.475077-7-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|DM4PR12MB5151:EE_
X-MS-Office365-Filtering-Correlation-Id: ff27c672-5678-491e-7dd7-08dc2f01c355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6/rWuyC38DI0OIusBk4W7Be6pdd+VrcFmRLwnFECXuEsJqZ40p8npDiV1o3TrWyOTYMZzaVC6MPkHp3LKPH2lPj7DBBqa45YrU1Ctt94p4GnJRTlgMeiFfTQHCd87qkrONAFw7HPFwPoC1PXhjk5CYVYfuZCP2p1V8l2rNrxQKZ6kPlUYtNS8zX7VfL+sBfs2Hh2wKZUGOu8CQmhSUvjxwfeISd2/v9fi8LYPLt8nIwwxK04yf47r9ewRptTqbSFii8NU8V5KUi1YbbMC9Kaqi49b32iOpZ0ScGOlbHDvmJ0RTLn5jVYJ7CaqIE+GtxwVvAeqNwm7aaqW0H19m82fLHKlgBmmCKYHKoYDEPH44k3m7RyFccF1ITEKutTcDgbprk5wwJF7MIOFYEAVCNfnmN6T8BrN/PVMKKdnNMH4w++lR5Io8JoeM8VxX0R4ehQFydYyQhSUfru/ZqcnYwDDWwteYi9jPBK9f448GXTpp2QLUwh3FHjEw00O3XdgE6To2vlohM5IXGGCF6vLhOjGMMMMtmlCZufTw/URg0QM6pecSoNJB++oVqFSGHEMRdo7GYlSah6VP4byyr6hlJQ3+Y/CFzyuf3YPR2vOGs3RZtiJmArd0AfSjX3OYor3mYLwyd8ZFDaq+HxhpcMKIJnAK+P018lbuiq2A8omSVzWqg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(1800799012)(36860700004)(186009)(82310400011)(451199024)(64100799003)(46966006)(40470700004)(478600001)(41300700001)(2906002)(8676002)(8936002)(5660300002)(316002)(7696005)(70206006)(110136005)(70586007)(2616005)(1076003)(26005)(356005)(86362001)(81166007)(16526019)(426003)(921011)(336012)(36756003)(82740400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 15:12:59.8087 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff27c672-5678-491e-7dd7-08dc2f01c355
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5151
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

With this and the dma_fence_used_as_dependency event, a tool can draw the
relationship between the compositing draw, the atomic commit, and vblank.

An example on a 2 monitors system look like this:

gnome-shell-1638    [018] .....  2571.905124: drm_mode_atomic_commit: file=00000000245c3f0c, pid=    1165, flags=00000201, crtcs={0x1}
gnome-shell-1638    [018] .....  2571.905147: dma_fence_used_as_dependency: driver=drm_sched timeline=gfx_0.0.0 context=270 seqno=73240 reason=dma_fence_chain_init
gnome-shell-1638    [018] .....  2571.913226: drm_mode_atomic_commit: file=00000000245c3f0c, pid=    1165, flags=00000201, crtcs={0x0}
gnome-shell-1638    [018] .....  2571.913250: dma_fence_used_as_dependency: driver=drm_sched timeline=gfx_0.0.0 context=270 seqno=73241 reason=dma_fence_chain_init
    <idle>-0       [018] d.h3.  2571.915687: drm_vblank_event: crtc=1, seq=155747, time=2571916093743, high-prec=true
    <idle>-0       [018] d.h3.  2571.915968: drm_vblank_event: crtc=0, seq=153862, time=2571916377180, high-prec=true

v2: fix unchecked memory allocation

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/drm_trace.h       | 23 +++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 29d4940188d4..f31b5c6f870b 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -41,6 +41,7 @@
 #include <linux/file.h>
 
 #include "drm_crtc_internal.h"
+#include "drm_trace.h"
 
 /**
  * DOC: overview
@@ -1503,6 +1504,26 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 		drm_mode_object_put(obj);
 	}
 
+	if (trace_drm_mode_atomic_commit_enabled()) {
+		struct drm_crtc_state *crtc_state;
+		struct drm_crtc *crtc;
+		int *crtcs;
+		int i, num_crtcs;
+
+		crtcs = kcalloc(dev->mode_config.num_crtc, sizeof(int),
+				GFP_KERNEL);
+
+		if (crtcs) {
+			num_crtcs = 0;
+			for_each_new_crtc_in_state(state, crtc, crtc_state, i)
+				crtcs[num_crtcs++] = drm_crtc_index(crtc);
+
+			trace_drm_mode_atomic_commit(file_priv, crtcs, num_crtcs, arg->flags);
+
+			kfree(crtcs);
+		}
+	}
+
 	ret = prepare_signaling(dev, state, arg, file_priv, &fence_state,
 				&num_fences);
 	if (ret)
diff --git a/drivers/gpu/drm/drm_trace.h b/drivers/gpu/drm/drm_trace.h
index 11c6dd577e8e..63489923c289 100644
--- a/drivers/gpu/drm/drm_trace.h
+++ b/drivers/gpu/drm/drm_trace.h
@@ -66,6 +66,29 @@ TRACE_EVENT(drm_vblank_event_delivered,
 		      __entry->seq)
 );
 
+TRACE_EVENT(drm_mode_atomic_commit,
+	    TP_PROTO(struct drm_file *file, int *crtcs, int ncrtcs, uint32_t flags),
+	    TP_ARGS(file, crtcs, ncrtcs, flags),
+	    TP_STRUCT__entry(
+		    __field(struct drm_file *, file)
+		    __dynamic_array(u32, crtcs, ncrtcs)
+		    __field(uint32_t, ncrtcs)
+		    __field(uint32_t, flags)
+		    ),
+	    TP_fast_assign(
+		    unsigned int i;
+
+		    __entry->file = file;
+		    for (i = 0; i < ncrtcs; i++)
+			((u32 *)__get_dynamic_array(crtcs))[i] = crtcs[i];
+		    __entry->ncrtcs = ncrtcs;
+		    __entry->flags = flags;
+		    ),
+	    TP_printk("file=%p, pid=%8d, flags=%08x, crtcs=%s", __entry->file,
+		      pid_nr(__entry->file->pid), __entry->flags,
+		      __print_array(__get_dynamic_array(crtcs), __entry->ncrtcs, 4))
+);
+
 #endif /* _DRM_TRACE_H_ */
 
 /* This part must be outside protection */
-- 
2.40.1

