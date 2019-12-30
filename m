Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2863712D780
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 10:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72C66E0F7;
	Tue, 31 Dec 2019 09:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F2B8987A;
 Mon, 30 Dec 2019 02:01:07 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id E0EE13F262;
 Mon, 30 Dec 2019 02:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
 s=default; t=1577671267;
 bh=t0PObDLzsPhcqnRoun2t4cn7CK8IaaEUsOLL32hsp+A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kZENiB83tEIEqiyvYfxpIm/AUe9rYXindPV5Wc6UPLe9ALgOWZg6dxrxcj10b/Mak
 eUtBxlHssLnK5FzNqOCzVypYY11Ut1p0uiiTWL1rxxle/dCfv0tHipu1/ikpdbaqMz
 NZJxJji08Tv2ZcOLQEp33HWAX9RDYlF5m3OousJA=
From: Brian Masney <masneyb@onstation.org>
To: jeffrey.l.hugo@gmail.com,
	robdclark@gmail.com
Subject: [PATCH RFC v2] drm/msm/mdp5: enable autorefresh
Date: Sun, 29 Dec 2019 21:00:53 -0500
Message-Id: <20191230020053.26016-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191230020053.26016-1-masneyb@onstation.org>
References: <20191230020053.26016-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 31 Dec 2019 09:37:01 +0000
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
Cc: sean@poorly.run, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the introduction of commit 2d99ced787e3 ("drm/msm: async commit
support"), command-mode panels began throwing the following errors:

    msm fd900000.mdss: pp done time out, lm=0

Let's fix this by enabling the autorefresh feature that's available in
the MDP starting at version 1.0. This will cause the MDP to
automatically send a frame to the panel every time the panel invokes the
TE signal, which will trigger the PP_DONE IRQ. This requires only
sending a single START signal for command-mode panels.

This gives us a counter for command-mode panels that we can use to
implement async commit support for the MDP5 in a follow up patch.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Suggested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Fixes: 2d99ced787e3 ("drm/msm: async commit support")
---
Changes since v1:
- Send a single start command to kick off the pipeline.

The reason I marked this patch as a RFC is that the display during some
small percentage of boots will stop updating after a minute or so, and
the ping pong IRQs stop. Most of the time it works with no issues and I
haven't been able to find a way to reproduce the issue. I tried
suspending the phone by toggling /sys/power/state since I thought that
the issue could potentially be related to power management.

 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 17 ++++++++++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c  | 31 ++++++++++++++++++++---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h  |  3 +--
 3 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 05cc04f729d6..39dd144295b3 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -436,6 +436,8 @@ static void mdp5_crtc_atomic_disable(struct drm_crtc *crtc,
 		spin_unlock_irqrestore(&mdp5_kms->dev->event_lock, flags);
 	}
 
+	mdp5_ctl_disable(mdp5_cstate->ctl, &mdp5_cstate->pipeline);
+
 	mdp5_crtc->enabled = false;
 }
 
@@ -456,6 +458,7 @@ static void mdp5_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
 	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
+	struct mdp5_pipeline *pipeline = &mdp5_cstate->pipeline;
 	struct mdp5_kms *mdp5_kms = get_kms(crtc);
 	struct device *dev = &mdp5_kms->pdev->dev;
 
@@ -493,9 +496,21 @@ static void mdp5_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	mdp_irq_register(&mdp5_kms->base, &mdp5_crtc->err);
 
-	if (mdp5_cstate->cmd_mode)
+	if (mdp5_cstate->cmd_mode) {
 		mdp_irq_register(&mdp5_kms->base, &mdp5_crtc->pp_done);
 
+		/*
+		 * Enable autorefresh so we get regular ping/pong IRQs.
+		 * - Bit 31 is the enable bit
+		 * - Bits 0-15 represent the frame count, specifically how many
+		 *   TE events before the MDP sends a frame.
+		 */
+		mdp5_write(mdp5_kms,
+			   REG_MDP5_PP_AUTOREFRESH_CONFIG(pipeline->mixer->pp),
+			   BIT(31) | BIT(0));
+		crtc_flush_all(crtc);
+	}
+
 	mdp5_crtc->enabled = true;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
index 030279d7b64b..965757d4f356 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
@@ -50,6 +50,13 @@ struct mdp5_ctl {
 	bool flush_pending;
 
 	struct mdp5_ctl *pair; /* Paired CTL to be flushed together */
+
+	/*
+	 * The command mode panels are ran with autorefresh enabled. Only a
+	 * single START command can be sent so keep track on a per ping pong
+	 * basis.
+	 */
+	bool start_sent_by_pp[4];
 };
 
 struct mdp5_ctl_manager {
@@ -191,7 +198,8 @@ static bool start_signal_needed(struct mdp5_ctl *ctl,
 	case INTF_WB:
 		return true;
 	case INTF_DSI:
-		return intf->mode == MDP5_INTF_DSI_MODE_COMMAND;
+		return intf->mode == MDP5_INTF_DSI_MODE_COMMAND &&
+			!ctl->start_sent_by_pp[pipeline->mixer->pp];
 	default:
 		return false;
 	}
@@ -204,13 +212,17 @@ static bool start_signal_needed(struct mdp5_ctl *ctl,
  * executed in order to kick off operation and activate all layers.
  * e.g.: DSI command mode, Writeback
  */
-static void send_start_signal(struct mdp5_ctl *ctl)
+static void send_start_signal(struct mdp5_ctl *ctl,
+			      struct mdp5_pipeline *pipeline)
 {
 	unsigned long flags;
 
 	spin_lock_irqsave(&ctl->hw_lock, flags);
 	ctl_write(ctl, REG_MDP5_CTL_START(ctl->id), 1);
 	spin_unlock_irqrestore(&ctl->hw_lock, flags);
+
+	if (pipeline->intf->mode == MDP5_INTF_DSI_MODE_COMMAND)
+		ctl->start_sent_by_pp[pipeline->mixer->pp] = true;
 }
 
 /**
@@ -234,7 +246,7 @@ int mdp5_ctl_set_encoder_state(struct mdp5_ctl *ctl,
 	DBG("intf_%d: %s", intf->num, enabled ? "on" : "off");
 
 	if (start_signal_needed(ctl, pipeline)) {
-		send_start_signal(ctl);
+		send_start_signal(ctl, pipeline);
 	}
 
 	return 0;
@@ -562,7 +574,7 @@ u32 mdp5_ctl_commit(struct mdp5_ctl *ctl,
 	}
 
 	if (start_signal_needed(ctl, pipeline)) {
-		send_start_signal(ctl);
+		send_start_signal(ctl, pipeline);
 	}
 
 	return curr_ctl_flush_mask;
@@ -753,3 +765,14 @@ struct mdp5_ctl_manager *mdp5_ctlm_init(struct drm_device *dev,
 
 	return ERR_PTR(ret);
 }
+
+void mdp5_ctl_disable(struct mdp5_ctl *ctl, struct mdp5_pipeline *pipeline)
+{
+	int i;
+
+	if (pipeline->intf->mode != MDP5_INTF_DSI_MODE_COMMAND)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(ctl->start_sent_by_pp); i++)
+		ctl->start_sent_by_pp[i] = false;
+}
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h
index c2af68aa77ae..f9bbf1295669 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.h
@@ -72,7 +72,6 @@ u32 mdp_ctl_flush_mask_encoder(struct mdp5_interface *intf);
 u32 mdp5_ctl_commit(struct mdp5_ctl *ctl, struct mdp5_pipeline *pipeline,
 		    u32 flush_mask, bool start);
 u32 mdp5_ctl_get_commit_status(struct mdp5_ctl *ctl);
-
-
+void mdp5_ctl_disable(struct mdp5_ctl *ctl, struct mdp5_pipeline *pipeline);
 
 #endif /* __MDP5_CTL_H__ */
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
