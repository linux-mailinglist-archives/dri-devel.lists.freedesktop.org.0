Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EF82A3E8B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BA26EC43;
	Tue,  3 Nov 2020 08:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1496E51B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 19:01:03 +0000 (UTC)
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 02 Nov 2020 10:55:00 -0800
X-QCInternal: smtphost
Received: from veeras-linux.qualcomm.com ([10.134.68.137])
 by ironmsg01-sd.qualcomm.com with ESMTP; 02 Nov 2020 10:55:00 -0800
Received: by veeras-linux.qualcomm.com (Postfix, from userid 330320)
 id 676202192E; Mon,  2 Nov 2020 10:55:00 -0800 (PST)
From: Veera Sundaram Sankaran <veeras@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org, gustavo@padovan.org
Subject: [PATCH 2/2] drm/drm_vblank: set the dma-fence timestamp during
 send_vblank_event
Date: Mon,  2 Nov 2020 10:54:46 -0800
Message-Id: <1604343286-3262-2-git-send-email-veeras@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604343286-3262-1-git-send-email-veeras@codeaurora.org>
References: <1604343286-3262-1-git-send-email-veeras@codeaurora.org>
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
Cc: pdhaval@codeaurora.org, Veera Sundaram Sankaran <veeras@codeaurora.org>,
 abhinavk@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The explicit out-fences in crtc are signaled as part of vblank event,
indicating all framebuffers present on the Atomic Commit request are
scanned out on the screen. Though the fence signal and the vblank event
notification happens at the same time, triggered by the same hardware
vsync event, the timestamp set in both are different. With drivers
supporting precise vblank timestamp the difference between the two
timestamps would be even higher. This might have an impact on use-mode
frameworks using these fence timestamps for purposes other than simple
buffer usage. For instance, the Android framework uses the retire-fences
as an alternative to vblank when frame-updates are in progress Set the
fence timestamp during send vblank event to avoid discrepancies.

Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
---
 drivers/gpu/drm/drm_vblank.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index b18e1ef..b38e50c 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -24,6 +24,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/dma-fence.h>
 #include <linux/export.h>
 #include <linux/kthread.h>
 #include <linux/moduleparam.h>
@@ -999,6 +1000,14 @@ static void send_vblank_event(struct drm_device *dev,
 		e->event.seq.time_ns = ktime_to_ns(now);
 		break;
 	}
+
+	/*
+	 * update fence timestamp with the same vblank timestamp as both
+	 * are signaled by the same event
+	 */
+	if (e->base.fence)
+		e->base.fence->timestamp = now;
+
 	trace_drm_vblank_event_delivered(e->base.file_priv, e->pipe, seq);
 	drm_send_event_locked(dev, &e->base);
 }
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
