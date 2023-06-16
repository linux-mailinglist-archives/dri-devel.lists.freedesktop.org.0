Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B843732F5C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 13:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B1110E5ED;
	Fri, 16 Jun 2023 11:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DA810E5D9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 11:03:04 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qA7EH-0000Ud-TT; Fri, 16 Jun 2023 13:02:57 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH v2] drm/etnaviv: slow down FE idle polling
Date: Fri, 16 Jun 2023 13:02:57 +0200
Message-Id: <20230616110257.2262744-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the FE is spinning way too fast when polling for new work in
the FE idleloop. As each poll fetches 16 bytes from memory, a GPU running
at 1GHz with the current setting of 200 wait cycle between fetches causes
80 MB/s of memory traffic just to check for new work when the GPU is
otherwise idle, which is more FE traffic than in some GPU loaded cases.

Significantly increase the number of wait cycles to slow down the poll
interval to ~30µs, limiting the FE idle memory traffic to 512 KB/s, while
providing a max latency which should not hurt most use-cases. The FE WAIT
command seems to have some unknown discrete steps in the wait cycles so
we may over/undershoot the target a bit, but that should be harmless.

If the GPU core base frequency is unknown keep the 200 wait cycles as
a sane default.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v2: Don't speed up when the GPU core frequency is unknown.
---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 11 ++++++-----
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c    |  8 ++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h    |  1 +
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
index cf741c5c82d2..384df1659be6 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
@@ -53,11 +53,12 @@ static inline void CMD_END(struct etnaviv_cmdbuf *buffer)
 	OUT(buffer, VIV_FE_END_HEADER_OP_END);
 }
 
-static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer)
+static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer,
+			    unsigned int waitcycles)
 {
 	buffer->user_size = ALIGN(buffer->user_size, 8);
 
-	OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | 200);
+	OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | waitcycles);
 }
 
 static inline void CMD_LINK(struct etnaviv_cmdbuf *buffer,
@@ -168,7 +169,7 @@ u16 etnaviv_buffer_init(struct etnaviv_gpu *gpu)
 	/* initialize buffer */
 	buffer->user_size = 0;
 
-	CMD_WAIT(buffer);
+	CMD_WAIT(buffer, gpu->fe_waitcycles);
 	CMD_LINK(buffer, 2,
 		 etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
 		 + buffer->user_size - 4);
@@ -320,7 +321,7 @@ void etnaviv_sync_point_queue(struct etnaviv_gpu *gpu, unsigned int event)
 	CMD_END(buffer);
 
 	/* Append waitlink */
-	CMD_WAIT(buffer);
+	CMD_WAIT(buffer, gpu->fe_waitcycles);
 	CMD_LINK(buffer, 2,
 		 etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
 		 + buffer->user_size - 4);
@@ -503,7 +504,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
 
 	CMD_LOAD_STATE(buffer, VIVS_GL_EVENT, VIVS_GL_EVENT_EVENT_ID(event) |
 		       VIVS_GL_EVENT_FROM_PE);
-	CMD_WAIT(buffer);
+	CMD_WAIT(buffer, gpu->fe_waitcycles);
 	CMD_LINK(buffer, 2,
 		 etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
 		 + buffer->user_size - 4);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index de8c9894967c..63b929b1e5d1 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -493,6 +493,14 @@ static void etnaviv_gpu_update_clock(struct etnaviv_gpu *gpu)
 		clock |= VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);
 		etnaviv_gpu_load_clock(gpu, clock);
 	}
+
+	/*
+	 * Choose number of wait cycles to target a ~30us (1/32768) max latency
+	 * until new work is picked up by the FE when it polls in the idle loop.
+	 * If the GPU base frequency is unknown use 200 wait cycles.
+	 */
+	gpu->fe_waitcycles = clamp(gpu->base_rate_core >> (15 - gpu->freq_scale),
+				   200UL, 0xffffUL);
 }
 
 static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 98c6f9c320fc..e1e1de59c38d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -150,6 +150,7 @@ struct etnaviv_gpu {
 	struct clk *clk_shader;
 
 	unsigned int freq_scale;
+	unsigned int fe_waitcycles;
 	unsigned long base_rate_core;
 	unsigned long base_rate_shader;
 };
-- 
2.39.2

