Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B79364D4AD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 01:29:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE3610E4D5;
	Thu, 15 Dec 2022 00:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3581410E4D5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 00:29:33 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g7so13219243lfv.5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 16:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=B+38sfS9t514Rl7PsG77ovDyh44bJm6hQ/Gd7EYEdy4=;
 b=fd2EsDccm2rXlUqIolwjM5UgqzJIqI73gqkHE/9dJylKnXV87gefUcdBf9HRc9n8CI
 EwyuQ60o7BHXN4xMPhfxLQoyrGmi92Dersf9uAfT8Kx4VwRfZqeoKe/mzdlBTZ4dwXun
 0a8aUClNbuJPGRtqNePGOoy8Z4sZbqGpOdmV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+38sfS9t514Rl7PsG77ovDyh44bJm6hQ/Gd7EYEdy4=;
 b=vEQZm/T9GJLr6zRRoLBU53B2/Sm9W5phAaFDUf+ucwyxLaLptN1i2fhnawGMaVe/HR
 aGnJM9I6dCPmqqezJm7Rc5YApGSdNRztvjshuWWTopEFDqZ17JdTevUCuYh/OM+zRwqK
 Sw/CwQltl9QCGUzqIXcdBh+6Yz1X92A+NeCEwnUBMQ7jrtotOs63VCXV46S4XW1a7yG2
 cVuxc7rg5WFOhJkW3kTCiC+HlyVkNDQxKJNQdw5AkD4frFBXyZMpbdQhINF6ZYmnzEyf
 xTrBHwuPZiCszs9bngw3R5ZRH5BN+2x4FuCpFlWL26iRRHz+9/BD8q5UDOwfm2PDeTvh
 OcYQ==
X-Gm-Message-State: ANoB5pnmKDzvKD6eREjlPRDGD5C3vJzwz/hHWrUPDoCDiLezhN+3YQVX
 KhtAmYl/gjXxCYX2TIAM59V77/acwQT/svoHTxikng==
X-Google-Smtp-Source: AA0mqf5JDxhRUQdJL9juXfKCeQQP1dwTXv7EE2imOij5dP+YdnzSZ7o8YnvHNyFrdKq+AHQSTYUZx4+5Susw9ladtdU=
X-Received: by 2002:a05:6512:b98:b0:4b5:5f2d:1458 with SMTP id
 b24-20020a0565120b9800b004b55f2d1458mr7850915lfv.253.1671064167154; Wed, 14
 Dec 2022 16:29:27 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Dec 2022 19:29:26 -0500
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VvP8Xe+wrMrKymetQ8X9-771m7jM7o1kRQz+oxXdRptg@mail.gmail.com>
References: <1671052890-11627-1-git-send-email-quic_khsieh@quicinc.com>
 <CAD=FV=UTeCU7BcfPMXz8J-9uOp_7Fn9PFdtFMsu46x5wKa0RyQ@mail.gmail.com>
 <512f9f0d-a399-27fb-08d0-7311b73fd2a1@quicinc.com>
 <CAD=FV=VvP8Xe+wrMrKymetQ8X9-771m7jM7o1kRQz+oxXdRptg@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 14 Dec 2022 19:29:26 -0500
Message-ID: <CAE-0n5100eGC0c09oq4B3M=aHtKW5+wGLGsS1jM91SCyZ5wffQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: do not complete dp_aux_cmd_fifo_tx() if irq
 is not for aux transfer
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com, sean@poorly.run,
 andersson@kernel.org, vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Doug Anderson (2022-12-14 16:14:42)
> Hi,
>
> On Wed, Dec 14, 2022 at 3:46 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> > Hi Doug
> >
> > On 12/14/2022 2:29 PM, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Wed, Dec 14, 2022 at 1:21 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> > >>
> > >> There are 3 possible interrupt sources are handled by DP controller,
> > >> HPDstatus, Controller state changes and Aux read/write transaction.
> > >> At every irq, DP controller have to check isr status of every interrupt
> > >> sources and service the interrupt if its isr status bits shows interrupts
> > >> are pending. There is potential race condition may happen at current aux
> > >> isr handler implementation since it is always complete dp_aux_cmd_fifo_tx()
> > >> even irq is not for aux read or write transaction. This may cause aux read
> > >> transaction return premature if host aux data read is in the middle of
> > >> waiting for sink to complete transferring data to host while irq happen.
> > >> This will cause host's receiving buffer contains unexpected data. This
> > >> patch fixes this problem by checking aux isr and return immediately at
> > >> aux isr handler if there are no any isr status bits set.
> > >>
> > >> Follows are the signature at kernel logs when problem happen,
> > >> EDID has corrupt header
> > >> panel-simple-dp-aux aux-aea0000.edp: Couldn't identify panel via EDID
> > >> panel-simple-dp-aux aux-aea0000.edp: error -EIO: Couldn't detect panel nor find a fallback
> > >>
> > >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > >> ---
> > >>   drivers/gpu/drm/msm/dp/dp_aux.c | 7 +++++++
> > >>   1 file changed, 7 insertions(+)
> > >>
> > >> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> > >> index d030a93..8f8b12a 100644
> > >> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> > >> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> > >> @@ -423,6 +423,13 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
> > >>
> > >>          isr = dp_catalog_aux_get_irq(aux->catalog);
> > >>
> > >> +       /*
> > >> +        * if this irq is not for aux transfer,
> > >> +        * then return immediately
> > >> +        */
> > >
> > > Why do you need 4 lines for a comment that fits on one line?
> > Yes, we can fit this to one line.
> > >
> > >> +       if (!isr)
> > >> +               return;
> > >
> > > I can confirm that this works for me. I could reproduce the EDID
> > > problems in the past and I can't after this patch. ...so I could give
> > > a:
> > >
> > > Tested-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > I'm not an expert on this part of the code, so feel free to ignore my
> > > other comments if everyone else thinks this patch is fine as-is, but
> > > to me something here feels a little fragile. It feels a little weird
> > > that we'll "complete" for _any_ interrupt that comes through now
> > > rather than relying on dp_aux_native_handler() / dp_aux_i2c_handler()
> > > to specifically identify interrupts that caused the end of the
> > > transfer. I guess that idea is that every possible interrupt we get
> > > causes the end of the transfer?
> > >
> > > -Doug
> >
> > So this turned out to be more tricky and was a good finding from kuogee.
> >
> > In the bad EDID case, it was technically not bad EDID.
> >
> > What was happening was, the VIDEO_READY interrupt was continuously
> > firing. Ideally, this should fire only once but due to some error
> > condition it kept firing. We dont exactly know why yet what was the
> > error condition making it continuously fire.

This is a great detail that is missing from the commit text.

> >
> > In the DP ISR, the dp_aux_isr() gets called even if it was not an aux
> > interrupt which fired (so the call flow in this case was
> > dp_display_irq_handler (triggered for VIDEO_READY) ---> dp_aux_isr()
> > So we should certainly have some protection to return early from this
> > routine if there was no aux interrupt which fired.

I'm not sure that's a race condition though, more like a problem where
the completion is called unconditionally?

> >
> > Which is what this fix is doing.
> >
> > Its not completing any interrupt, its just returning early if no aux
> > interrupt fired.
>
> ...but the whole problem was that it was doing the complete() at the
> end, right? Kuogee even mentioned that in the commit message.
> Specifically, I checked dp_aux_native_handler() and
> dp_aux_i2c_handler(), both of which are passed the "isr". Unless I
> messed up, both functions already were no-ops if the ISR was 0, even
> before Kuogee's patch. That means that the only thing Kuogee's patch
> does is to prevent the call to "complete(&aux->comp)" at the end of
> "dp_aux_isr()".
>
> ...and it makes sense not to call the complete() if no "isr" is 0.
> ...but what I'm saying is that _any_ non-zero value of ISR will still
> cause the complete() to be called after Kuogee's patch. That means
> that if any of the 32-bits in the "isr" variable are set, that we will
> call complete(). I'm asking if you're sure that every single bit of
> the "isr" means that we're ready to call complete(). It feels like it
> would be less fragile if dp_aux_native_handler() and
> dp_aux_i2c_handler() (which both already look at the ISR) returned
> some value saying whether the "isr" contained a bit that meant that
> complete() should be called.
>

I'm almost certain I've asked for this before, but I can't find it
anymore. Can we also simplify the aux handlers to be a big pile of
if-else-if conditions that don't overwrite the 'aux_error_num'? That
would simplify the patch below.

---8<---
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index d030a93a08c3..ff79cad90d21 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -162,45 +162,73 @@ static ssize_t dp_aux_cmd_fifo_rx(struct
dp_aux_private *aux,
 	return i;
 }

-static void dp_aux_native_handler(struct dp_aux_private *aux, u32 isr)
+static irqreturn_t dp_aux_native_handler(struct dp_aux_private *aux, u32 isr)
 {
-	if (isr & DP_INTR_AUX_I2C_DONE)
+	irqreturn_t ret = IRQ_NONE;
+
+	if (isr & DP_INTR_AUX_I2C_DONE) {
 		aux->aux_error_num = DP_AUX_ERR_NONE;
-	else if (isr & DP_INTR_WRONG_ADDR)
+		ret = IRQ_HANDLED;
+	} else if (isr & DP_INTR_WRONG_ADDR) {
 		aux->aux_error_num = DP_AUX_ERR_ADDR;
-	else if (isr & DP_INTR_TIMEOUT)
+		ret = IRQ_HANDLED;
+	} else if (isr & DP_INTR_TIMEOUT) {
 		aux->aux_error_num = DP_AUX_ERR_TOUT;
-	if (isr & DP_INTR_NACK_DEFER)
+		ret = IRQ_HANDLED;
+	}
+
+	if (isr & DP_INTR_NACK_DEFER) {
 		aux->aux_error_num = DP_AUX_ERR_NACK;
+		ret = IRQ_HANDLED;
+	}
 	if (isr & DP_INTR_AUX_ERROR) {
 		aux->aux_error_num = DP_AUX_ERR_PHY;
 		dp_catalog_aux_clear_hw_interrupts(aux->catalog);
+		ret = IRQ_HANDLED;
 	}
+
+	return ret;
 }

-static void dp_aux_i2c_handler(struct dp_aux_private *aux, u32 isr)
+static irqreturn_t dp_aux_i2c_handler(struct dp_aux_private *aux, u32 isr)
 {
+	irqreturn_t ret = IRQ_NONE;
+
 	if (isr & DP_INTR_AUX_I2C_DONE) {
 		if (isr & (DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER))
 			aux->aux_error_num = DP_AUX_ERR_NACK;
 		else
 			aux->aux_error_num = DP_AUX_ERR_NONE;
-	} else {
-		if (isr & DP_INTR_WRONG_ADDR)
-			aux->aux_error_num = DP_AUX_ERR_ADDR;
-		else if (isr & DP_INTR_TIMEOUT)
-			aux->aux_error_num = DP_AUX_ERR_TOUT;
-		if (isr & DP_INTR_NACK_DEFER)
-			aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
-		if (isr & DP_INTR_I2C_NACK)
-			aux->aux_error_num = DP_AUX_ERR_NACK;
-		if (isr & DP_INTR_I2C_DEFER)
-			aux->aux_error_num = DP_AUX_ERR_DEFER;
-		if (isr & DP_INTR_AUX_ERROR) {
-			aux->aux_error_num = DP_AUX_ERR_PHY;
-			dp_catalog_aux_clear_hw_interrupts(aux->catalog);
-		}
+		return IRQ_HANDLED;
+	}
+
+	if (isr & DP_INTR_WRONG_ADDR) {
+		aux->aux_error_num = DP_AUX_ERR_ADDR;
+		ret = IRQ_HANDLED;
+	} else if (isr & DP_INTR_TIMEOUT) {
+		aux->aux_error_num = DP_AUX_ERR_TOUT;
+		ret = IRQ_HANDLED;
+	}
+
+	if (isr & DP_INTR_NACK_DEFER) {
+		aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
+		ret = IRQ_HANDLED;
+	}
+	if (isr & DP_INTR_I2C_NACK) {
+		aux->aux_error_num = DP_AUX_ERR_NACK;
+		ret = IRQ_HANDLED;
+	}
+	if (isr & DP_INTR_I2C_DEFER) {
+		aux->aux_error_num = DP_AUX_ERR_DEFER;
+		ret = IRQ_HANDLED;
+	}
+	if (isr & DP_INTR_AUX_ERROR) {
+		aux->aux_error_num = DP_AUX_ERR_PHY;
+		dp_catalog_aux_clear_hw_interrupts(aux->catalog);
+		ret = IRQ_HANDLED;
 	}
+
+	return ret;
 }

 static void dp_aux_update_offset_and_segment(struct dp_aux_private *aux,
@@ -409,14 +437,15 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	return ret;
 }

-void dp_aux_isr(struct drm_dp_aux *dp_aux)
+irqreturn_t dp_aux_isr(struct drm_dp_aux *dp_aux)
 {
 	u32 isr;
 	struct dp_aux_private *aux;
+	irqreturn_t ret = IRQ_NONE;

 	if (!dp_aux) {
 		DRM_ERROR("invalid input\n");
-		return;
+		return ret;
 	}

 	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
@@ -424,14 +453,17 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
 	isr = dp_catalog_aux_get_irq(aux->catalog);

 	if (!aux->cmd_busy)
-		return;
+		return ret;

 	if (aux->native)
-		dp_aux_native_handler(aux, isr);
+		ret |= dp_aux_native_handler(aux, isr);
 	else
-		dp_aux_i2c_handler(aux, isr);
+		ret |= dp_aux_i2c_handler(aux, isr);

-	complete(&aux->comp);
+	if (ret == IRQ_HANDLED)
+		complete(&aux->comp);
+
+	return ret;
 }

 void dp_aux_reconfig(struct drm_dp_aux *dp_aux)
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index e930974bcb5b..511305da4f66 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -11,7 +11,7 @@

 int dp_aux_register(struct drm_dp_aux *dp_aux);
 void dp_aux_unregister(struct drm_dp_aux *dp_aux);
-void dp_aux_isr(struct drm_dp_aux *dp_aux);
+irqreturn_t dp_aux_isr(struct drm_dp_aux *dp_aux);
 void dp_aux_init(struct drm_dp_aux *dp_aux);
 void dp_aux_deinit(struct drm_dp_aux *dp_aux);
 void dp_aux_reconfig(struct drm_dp_aux *dp_aux);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index dd26ca651a05..10c6d6847163 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1979,13 +1979,11 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 	return ret;
 }

-void dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
+irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
 	u32 isr;
-
-	if (!dp_ctrl)
-		return;
+	irqreturn_t ret = IRQ_NONE;

 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);

@@ -1994,12 +1992,16 @@ void dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
 	if (isr & DP_CTRL_INTR_READY_FOR_VIDEO) {
 		drm_dbg_dp(ctrl->drm_dev, "dp_video_ready\n");
 		complete(&ctrl->video_comp);
+		ret = IRQ_HANDLED;
 	}

 	if (isr & DP_CTRL_INTR_IDLE_PATTERN_SENT) {
 		drm_dbg_dp(ctrl->drm_dev, "idle_patterns_sent\n");
 		complete(&ctrl->idle_comp);
+		ret = IRQ_HANDLED;
 	}
+
+	return ret;
 }

 struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 9f29734af81c..c3af06dc87b1 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -25,7 +25,7 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
-void dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
+irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl);
 struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_panel *panel,	struct drm_dp_aux *aux,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
b/drivers/gpu/drm/msm/dp/dp_display.c
index a49f6dbbe888..559d9ab7954d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1192,7 +1192,7 @@ static int dp_hpd_event_thread_start(struct
dp_display_private *dp_priv)
 static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
 {
 	struct dp_display_private *dp = dev_id;
-	irqreturn_t ret = IRQ_HANDLED;
+	irqreturn_t ret = IRQ_NONE;
 	u32 hpd_isr_status;

 	if (!dp) {
@@ -1206,27 +1206,33 @@ static irqreturn_t dp_display_irq_handler(int
irq, void *dev_id)
 		drm_dbg_dp(dp->drm_dev, "type=%d isr=0x%x\n",
 			dp->dp_display.connector_type, hpd_isr_status);
 		/* hpd related interrupts */
-		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
+		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK) {
 			dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+			ret = IRQ_HANDLED;
+		}

 		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
 			dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
+			ret = IRQ_HANDLED;
 		}

 		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
 			dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
 			dp_add_event(dp, EV_HPD_PLUG_INT, 0, 3);
+			ret = IRQ_HANDLED;
 		}

-		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
+		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK) {
 			dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+			ret = IRQ_HANDLED;
+		}
 	}

 	/* DP controller isr */
-	dp_ctrl_isr(dp->ctrl);
+	ret |= dp_ctrl_isr(dp->ctrl);

 	/* DP aux isr */
-	dp_aux_isr(dp->aux);
+	ret |= dp_aux_isr(dp->aux);

 	return ret;
 }
