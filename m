Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D76170254
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 16:27:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50256EA6B;
	Wed, 26 Feb 2020 15:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43586EA6B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 15:27:12 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1j6yab-0006Mb-Mo; Wed, 26 Feb 2020 16:27:09 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH] drm/etnaviv: fix TS cache flushing on GPUs with BLT engine
Date: Wed, 26 Feb 2020 16:27:08 +0100
Message-Id: <20200226152708.15700-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
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
Cc: Jonathan Marek <jonathan@marek.ca>, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As seen in the Vivante kernel driver, most GPUs with the BLT engine have
a broken TS cache flush. The workaround is to temporarily set the BLT
command to CLEAR_IMAGE, without actually executing the clear. Apparently
this state change is enough to trigger the required TS cache flush. As
the BLT engine is completely asychronous, we also need a few more stall
states to synchronize the flush with the frontend.

Root-caused-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 60 ++++++++++++++++++++++--
 drivers/gpu/drm/etnaviv/state_blt.xml.h  |  2 +
 2 files changed, 57 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
index 32d9fac587f9..76d38561c910 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
@@ -12,6 +12,7 @@
 
 #include "common.xml.h"
 #include "state.xml.h"
+#include "state_blt.xml.h"
 #include "state_hi.xml.h"
 #include "state_3d.xml.h"
 #include "cmdstream.xml.h"
@@ -233,6 +234,8 @@ void etnaviv_buffer_end(struct etnaviv_gpu *gpu)
 	struct etnaviv_cmdbuf *buffer = &gpu->buffer;
 	unsigned int waitlink_offset = buffer->user_size - 16;
 	u32 link_target, flush = 0;
+	bool has_blt = !!(gpu->identity.minor_features5 &
+			  chipMinorFeatures5_BLT_ENGINE);
 
 	lockdep_assert_held(&gpu->lock);
 
@@ -248,16 +251,38 @@ void etnaviv_buffer_end(struct etnaviv_gpu *gpu)
 	if (flush) {
 		unsigned int dwords = 7;
 
+		if (has_blt)
+			dwords += 10;
+
 		link_target = etnaviv_buffer_reserve(gpu, buffer, dwords);
 
 		CMD_SEM(buffer, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
 		CMD_STALL(buffer, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
+		if (has_blt) {
+			CMD_LOAD_STATE(buffer, VIVS_BLT_ENABLE, 0x1);
+			CMD_SEM(buffer, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_BLT);
+			CMD_STALL(buffer, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_BLT);
+			CMD_LOAD_STATE(buffer, VIVS_BLT_ENABLE, 0x0);
+		}
 		CMD_LOAD_STATE(buffer, VIVS_GL_FLUSH_CACHE, flush);
-		if (gpu->exec_state == ETNA_PIPE_3D)
-			CMD_LOAD_STATE(buffer, VIVS_TS_FLUSH_CACHE,
-				       VIVS_TS_FLUSH_CACHE_FLUSH);
+		if (gpu->exec_state == ETNA_PIPE_3D) {
+			if (has_blt) {
+				CMD_LOAD_STATE(buffer, VIVS_BLT_ENABLE, 0x1);
+				CMD_LOAD_STATE(buffer, VIVS_BLT_SET_COMMAND, 0x1);
+				CMD_LOAD_STATE(buffer, VIVS_BLT_ENABLE, 0x0);
+			} else {
+				CMD_LOAD_STATE(buffer, VIVS_TS_FLUSH_CACHE,
+					       VIVS_TS_FLUSH_CACHE_FLUSH);
+			}
+		}
 		CMD_SEM(buffer, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
 		CMD_STALL(buffer, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
+		if (has_blt) {
+			CMD_LOAD_STATE(buffer, VIVS_BLT_ENABLE, 0x1);
+			CMD_SEM(buffer, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_BLT);
+			CMD_STALL(buffer, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_BLT);
+			CMD_LOAD_STATE(buffer, VIVS_BLT_ENABLE, 0x0);
+		}
 		CMD_END(buffer);
 
 		etnaviv_buffer_replace_wait(buffer, waitlink_offset,
@@ -323,6 +348,8 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
 	bool switch_mmu_context = gpu->mmu_context != mmu_context;
 	unsigned int new_flush_seq = READ_ONCE(gpu->mmu_context->flush_seq);
 	bool need_flush = switch_mmu_context || gpu->flush_seq != new_flush_seq;
+	bool has_blt = !!(gpu->identity.minor_features5 &
+			  chipMinorFeatures5_BLT_ENGINE);
 
 	lockdep_assert_held(&gpu->lock);
 
@@ -433,6 +460,15 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
 	 * 2 semaphore stall + 1 event + 1 wait + 1 link.
 	 */
 	return_dwords = 7;
+
+	/*
+	 * When the BLT engine is present we need 6 more dwords in the return
+	 * target: 3 enable/flush/disable + 4 enable/semaphore stall/disable,
+	 * but we don't need the normal TS flush state.
+	 */
+	if (has_blt)
+		return_dwords += 6;
+
 	return_target = etnaviv_buffer_reserve(gpu, buffer, return_dwords);
 	CMD_LINK(cmdbuf, return_dwords, return_target);
 
@@ -447,11 +483,25 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
 		CMD_LOAD_STATE(buffer, VIVS_GL_FLUSH_CACHE,
 				       VIVS_GL_FLUSH_CACHE_DEPTH |
 				       VIVS_GL_FLUSH_CACHE_COLOR);
-		CMD_LOAD_STATE(buffer, VIVS_TS_FLUSH_CACHE,
-				       VIVS_TS_FLUSH_CACHE_FLUSH);
+		if (has_blt) {
+			CMD_LOAD_STATE(buffer, VIVS_BLT_ENABLE, 0x1);
+			CMD_LOAD_STATE(buffer, VIVS_BLT_SET_COMMAND, 0x1);
+			CMD_LOAD_STATE(buffer, VIVS_BLT_ENABLE, 0x0);
+		} else {
+			CMD_LOAD_STATE(buffer, VIVS_TS_FLUSH_CACHE,
+					       VIVS_TS_FLUSH_CACHE_FLUSH);
+		}
 	}
 	CMD_SEM(buffer, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
 	CMD_STALL(buffer, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
+
+	if (has_blt) {
+		CMD_LOAD_STATE(buffer, VIVS_BLT_ENABLE, 0x1);
+		CMD_SEM(buffer, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_BLT);
+		CMD_STALL(buffer, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_BLT);
+		CMD_LOAD_STATE(buffer, VIVS_BLT_ENABLE, 0x0);
+	}
+
 	CMD_LOAD_STATE(buffer, VIVS_GL_EVENT, VIVS_GL_EVENT_EVENT_ID(event) |
 		       VIVS_GL_EVENT_FROM_PE);
 	CMD_WAIT(buffer);
diff --git a/drivers/gpu/drm/etnaviv/state_blt.xml.h b/drivers/gpu/drm/etnaviv/state_blt.xml.h
index daae55995def..0e8bcf9dcc93 100644
--- a/drivers/gpu/drm/etnaviv/state_blt.xml.h
+++ b/drivers/gpu/drm/etnaviv/state_blt.xml.h
@@ -46,6 +46,8 @@ DEALINGS IN THE SOFTWARE.
 
 /* This is a cut-down version of the state_blt.xml.h file */
 
+#define VIVS_BLT_SET_COMMAND					0x000140ac
+
 #define VIVS_BLT_ENABLE						0x000140b8
 #define VIVS_BLT_ENABLE_ENABLE					0x00000001
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
