Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 008E38C8E88
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 01:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B4A10E1D5;
	Fri, 17 May 2024 23:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="XNVySUsQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FEB10E1AE
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 23:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=LvtRfjS2hxOURJcIdMjVVgisf5I/X5Frx5qJPUGE7P8=; b=XNVySUsQ3TsJCAr8
 Msgt+rSgCOU4aa1KXWSWdzCvF2x1MgkC/4KzUkJcv0LP23aGSiRHQWScc7y6lEkmy2KAOt9mhutPv
 Eoccs3tc7WMDsF8nr3GfXR+RqxKTPvQ++bhEE4SvlX+awvcMJg2ayxp0utLOeIzoeBsd0M4I/Si0Z
 h7MFmHlJi87RHXlNafyZVY0wj8hYe0piWsLNVd2+6yymAIrHzU/KHc79d7cNIMszqCBxW3UXLVXnk
 OP8g/Xlyq0YYCtFMNQM1mfzkx0gIJDeKlhNJyUN0zHmc7fT+4AyvVvf9a3cOGgihi+XiD3fMQk/8Q
 ZgwBryAWK7RALhwEpQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1s877B-001TpV-10;
 Fri, 17 May 2024 23:35:53 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/3] drm/amdgpu: remove unused struct 'hqd_registers'
Date: Sat, 18 May 2024 00:35:46 +0100
Message-ID: <20240517233548.231120-2-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240517233548.231120-1-linux@treblig.org>
References: <20240517233548.231120-1-linux@treblig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'hqd_registers' used to be used in a member of the 'bonaire_mqd'
struct. 'bonaire_mqd' was removed by
commit 486d807cd9a9 ("drm/amdgpu: remove duplicate definition of
cik_mqd")
It's now unused.

Remove 'hqd_registers' as well.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 38 ---------------------------
 1 file changed, 38 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index 541dbd70d8c7..f3544f02ffb9 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -2757,44 +2757,6 @@ static int gfx_v7_0_mec_init(struct amdgpu_device *adev)
 	return 0;
 }
 
-struct hqd_registers {
-	u32 cp_mqd_base_addr;
-	u32 cp_mqd_base_addr_hi;
-	u32 cp_hqd_active;
-	u32 cp_hqd_vmid;
-	u32 cp_hqd_persistent_state;
-	u32 cp_hqd_pipe_priority;
-	u32 cp_hqd_queue_priority;
-	u32 cp_hqd_quantum;
-	u32 cp_hqd_pq_base;
-	u32 cp_hqd_pq_base_hi;
-	u32 cp_hqd_pq_rptr;
-	u32 cp_hqd_pq_rptr_report_addr;
-	u32 cp_hqd_pq_rptr_report_addr_hi;
-	u32 cp_hqd_pq_wptr_poll_addr;
-	u32 cp_hqd_pq_wptr_poll_addr_hi;
-	u32 cp_hqd_pq_doorbell_control;
-	u32 cp_hqd_pq_wptr;
-	u32 cp_hqd_pq_control;
-	u32 cp_hqd_ib_base_addr;
-	u32 cp_hqd_ib_base_addr_hi;
-	u32 cp_hqd_ib_rptr;
-	u32 cp_hqd_ib_control;
-	u32 cp_hqd_iq_timer;
-	u32 cp_hqd_iq_rptr;
-	u32 cp_hqd_dequeue_request;
-	u32 cp_hqd_dma_offload;
-	u32 cp_hqd_sema_cmd;
-	u32 cp_hqd_msg_type;
-	u32 cp_hqd_atomic0_preop_lo;
-	u32 cp_hqd_atomic0_preop_hi;
-	u32 cp_hqd_atomic1_preop_lo;
-	u32 cp_hqd_atomic1_preop_hi;
-	u32 cp_hqd_hq_scheduler0;
-	u32 cp_hqd_hq_scheduler1;
-	u32 cp_mqd_control;
-};
-
 static void gfx_v7_0_compute_pipe_init(struct amdgpu_device *adev,
 				       int mec, int pipe)
 {
-- 
2.45.1

