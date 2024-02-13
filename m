Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78040853546
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 16:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A7C10E837;
	Tue, 13 Feb 2024 15:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oRRCEYFA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201E710E837;
 Tue, 13 Feb 2024 15:53:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6lgsLUJ+K0KzZgQDEWEQG3qnuSkB0OPM2Y54Z294SmylyFnyK/d0NsmJWXsDWbnYEwW30rsRBuro3fczUdUxfN22dm0FSAFUbRlgt/YmcufAbDW/26NiLBJGdhOMjDTdSWXuCvl2y0YGhaia0fn097hP8do1l+HvR+tWiO68o77yFyqqA71BRFgX1e7G0bXKUN3sUJE9bp+Zw5b+86yH6BAxWd48Ze9z6mM4tBjZjgYa9r3dCK5nnVLzs1QIUdrD6DMq8pG0rAetzBGF+rERbB8/Il0x4jNUqMOqZ8lFoMHpu5GaNnmQsqEgkJt84REv/hvy+plwOu+tGZpmofwDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5CLAmhZZ4kC1eRhs1ZqqqMPtuS3yf/pWWaOlISVwKI=;
 b=OJyeAwne2PqB/bJ0ngHWZb6N16MPvl69Fr9ebKPRl8zDxAUnbeaUaoDps0vpLG1+QSllTSPDGj63/bWRnytFKL4lBXHIlXNyGEd7pR6pdk8py0go0oPvMy4d8xFolEWU9su3pyyHNh79Pxt6h9cHFr/pP3WX745DeMIRT5QvWye4u9m4Muh7DFQug4EkY4xU5TjJnqak8R9y0pBIqiZBtemnvjoX1+endRv3xGuVvRpZFobIAe8xccf5OVXIs2coFcjJbQftHSN6ZiQKuzv4LipTNEIamI/VnOH/UC2Vfd+YqDHIEXPluNvTPDy4Aq7vb+zhD5Io5pzcx13EbwBqow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5CLAmhZZ4kC1eRhs1ZqqqMPtuS3yf/pWWaOlISVwKI=;
 b=oRRCEYFAGRwZCk6yO8o9+Sfx/r+e3FdSEIKV9VnJ0udjV3pHkf18nbLtHokrKZXokiTgEsRDvhaLcAc58pjwTxxKknXvAMpoMXPccit8re2JEtoM7wdp6RgMGzoKbFT1E7ZUPwM4u8J/hEKUNRGV+7foaGEJnmeFWSM959L7ku4=
Received: from DM6PR05CA0051.namprd05.prod.outlook.com (2603:10b6:5:335::20)
 by IA1PR12MB6387.namprd12.prod.outlook.com (2603:10b6:208:389::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Tue, 13 Feb
 2024 15:53:30 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:5:335:cafe::1d) by DM6PR05CA0051.outlook.office365.com
 (2603:10b6:5:335::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25 via Frontend
 Transport; Tue, 13 Feb 2024 15:53:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 15:53:30 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 09:53:26 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Steven Rostedt <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v2 6/6] drm: add drm_mode_atomic_commit event
Date: Tue, 13 Feb 2024 16:50:31 +0100
Message-ID: <20240213155112.156537-7-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|IA1PR12MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: 343361ec-ffcf-4ef1-07cf-08dc2cabecae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +75ziyafi8j8DgVNKkCk04+olWJF2yc3K1QcHiUh09HFQmYL8dU/jJhP/5BoJC9uYzbOkFkZ0PCmYw8D7jDqtbvpTwzAj4bR2MeToO+GlNJqqUkbiXsBor37FFV+UiBOL0bvynpyULSieqIhhhFutT71w4d034QvIovB2pKikIKADqD3u38k9Su3sPh60Uffp4HxgOoHLfhAGwgGanaHTXzlIUPyqMoBCbpOUinLwRzV675ME1hLFOqjXOr6iTMz0o4rvV+Wft6auQTbr8c0JjxIpZKHelhONuxLIfmbM069rd3Y4KNs/rXgPRi3YN8bE41kTbupBRXDpwkn+UnwCwo7cR8ydCwihjnkzzrlcO9gV86zF4BG1vvHuwKFmbEK9E/Mynb/b09aauRcn5eEunL+N9rS2kyjLomiF+2O0XlAMRYiffIg7ImFAQal5XdqAS1Ha7QtKCL1quwvS7cuBROjNBm+5l/wpFlimRFZFp9ZvNlLb21BMF1SRUGi409VfJI+Y6sgs+TG5Ja6TfF24dP7Y4WRRqt/pjyQKeIqKR2iKo/7OqNU3WKDB/UptYyr/BL48VThpA5YrpGTk5Wc06a1Zb8/bF5EfGmzIoxpiuOUFpiSCe+HcdyPrCLGnSb27bREnCagc4ps70Nh/48pNg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(1800799012)(82310400011)(186009)(64100799003)(451199024)(40470700004)(36840700001)(46966006)(8936002)(921011)(4326008)(16526019)(26005)(336012)(1076003)(426003)(41300700001)(2616005)(83380400001)(70206006)(70586007)(8676002)(478600001)(6666004)(110136005)(316002)(82740400003)(81166007)(36756003)(86362001)(356005)(7696005)(2906002)(5660300002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 15:53:30.0844 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 343361ec-ffcf-4ef1-07cf-08dc2cabecae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6387
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

With this and the dma_fence_sync_to event, a tool can draw the
relationship between the compositing draw, the atomic commit, and vblank.

An example on a 2 monitors system look like this:

gnome-shell-1638    [018] .....  2571.905124: drm_mode_atomic_commit: file=00000000245c3f0c, pid=    1165, flags=00000201, crtcs={0x1}
gnome-shell-1638    [018] .....  2571.905147: dma_fence_sync_to: driver=drm_sched timeline=gfx_0.0.0 context=270 seqno=73240 reason=dma_fence_chain_init
gnome-shell-1638    [018] .....  2571.913226: drm_mode_atomic_commit: file=00000000245c3f0c, pid=    1165, flags=00000201, crtcs={0x0}
gnome-shell-1638    [018] .....  2571.913250: dma_fence_sync_to: driver=drm_sched timeline=gfx_0.0.0 context=270 seqno=73241 reason=dma_fence_chain_init
     <idle>-0       [018] d.h3.  2571.915687: drm_vblank_event: crtc=1, seq=155747, time=2571916093743, high-prec=true
     <idle>-0       [018] d.h3.  2571.915968: drm_vblank_event: crtc=0, seq=153862, time=2571916377180, high-prec=true

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 19 +++++++++++++++++++
 drivers/gpu/drm/drm_trace.h       | 28 ++++++++++++++++++++++++++--
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 29d4940188d4..0d3767cd155a 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -41,6 +41,7 @@
 #include <linux/file.h>
 
 #include "drm_crtc_internal.h"
+#include "drm_trace.h"
 
 /**
  * DOC: overview
@@ -1503,6 +1504,24 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
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
+		num_crtcs = 0;
+		for_each_new_crtc_in_state(state, crtc, crtc_state, i)
+			crtcs[num_crtcs++] = drm_crtc_index(crtc);
+
+		trace_drm_mode_atomic_commit(file_priv, crtcs, num_crtcs, arg->flags);
+
+		kfree(crtcs);
+	}
+
 	ret = prepare_signaling(dev, state, arg, file_priv, &fence_state,
 				&num_fences);
 	if (ret)
diff --git a/drivers/gpu/drm/drm_trace.h b/drivers/gpu/drm/drm_trace.h
index 11c6dd577e8e..b62a44cb1270 100644
--- a/drivers/gpu/drm/drm_trace.h
+++ b/drivers/gpu/drm/drm_trace.h
@@ -62,8 +62,32 @@ TRACE_EVENT(drm_vblank_event_delivered,
 		    __entry->crtc = crtc;
 		    __entry->seq = seq;
 		    ),
-	    TP_printk("file=%p, crtc=%d, seq=%u", __entry->file, __entry->crtc, \
-		      __entry->seq)
+	    TP_printk("file=%p, crtc=%d, seq=%u, pid=%8d", \
+		      __entry->file, __entry->crtc, __entry->seq, \
+		      pid_nr(__entry->file->pid))
+);
+
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
+	    TP_printk("file=%p, pid=%8d, flags=%08x, crtcs=%s", __entry->file, \
+		      pid_nr(__entry->file->pid), __entry->flags, \
+		      __print_array(__get_dynamic_array(crtcs), __entry->ncrtcs, 4))
 );
 
 #endif /* _DRM_TRACE_H_ */
-- 
2.40.1

