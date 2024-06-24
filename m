Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CAC9159F2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 00:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C85410E0D9;
	Mon, 24 Jun 2024 22:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MI6ZGX+T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D90C10E0D9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 22:38:29 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52ce6c8db7bso1791870e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 15:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719268707; x=1719873507; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6E14l5/Oog/WEZeui3ScZrnHJQJut/dOq/zsnkk94VA=;
 b=MI6ZGX+TzQ+Y5iSwDWOY/5TffonnCFC7WUe8jhVjlPzdb1ERBNJ6IqMwjAWyvjREuN
 4DrHiv+Lm1MV5dtog5xMReSEo8PG9/ClkaS2pZUdDcrRgGld/PIxgZYw8DuLiL9E46GK
 eZfoD0XluwCwsC1Pp+vvcEx6b90r8K6dEKr8Vt5e1YZC0+3XsA+3qKkUNgSiD5qKNxmn
 ojiIDK1XkFhK88XkksMF5Zv8kcFMpp7bRTnTgrKPjnaqgvdgkBiSrs0zBZJNORQWzRms
 3+yspRKXwz1HvK4RQK7zofBUj+K6wkEeWDHEP0UwN1ZOpE2Dzl9Bpm5LYBEQlcJkEVxW
 ZX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719268707; x=1719873507;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6E14l5/Oog/WEZeui3ScZrnHJQJut/dOq/zsnkk94VA=;
 b=i7/Ypl1Bq9f1f0NZwrQfXrE6p5OMTMX+R2KGlwhCECpp7QJNiyfrugEvpwO1Kuozi+
 CFwqgDq1H6xghlAxXbLyOsFwAmBAdLACHHkDfZNfXtAP1oQssFW1K8pyZG98FjnoAA3E
 FzAAsTeCj1/1c46FwA2Y9r/wuYdEMh5NyE0i2D55VnFD0sJj21/CnbYvnUF+9IJm3ydm
 nof0Tfn6F14telrwEpIXjBxTBmFPZaIZSqdub9PyBwIKfTc5GH9h9x3Q5tvH7md69eMO
 XSLUJJ+ciKtaeCOFfr1qKUqP2eBqLdXpNcQ5oPbEi5HUcIpgWZGKSaf86tY/JDI1KNQL
 gRFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgWjAptfWR/wOVl4lHQR+G55jIMVQgT0ezR5PZlLyoUek0hIrZP3As6q7q4XrbBsxcJoeVDppP4UQb0HU2kNL9rYF/eSUBnKvd+oM8c792
X-Gm-Message-State: AOJu0YwhtVdvJ5aoeJUIoDKcmzfHMQqgLSnSblOtupG9zKskIRNf9vQx
 TB2uwsUyl7Kuyg4niDOwMSzlhUR8eg68KSjFIbO7m1GiN6+IaUyFxGUFCpv14EU=
X-Google-Smtp-Source: AGHT+IE3JG2UAt8YxTInmDjLisSApSvSW7QhSIyrfGTIQgjS1Wgi8nCN+LpelYVb+7vx9iegu54PYA==
X-Received: by 2002:ac2:4c41:0:b0:52c:db28:4d92 with SMTP id
 2adb3069b0e04-52ce1832653mr4008349e87.11.1719268707060; 
 Mon, 24 Jun 2024 15:38:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce407a2e3sm472243e87.76.2024.06.24.15.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 15:38:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 01:38:25 +0300
Subject: [PATCH v3] drm/msm/dpu: remove CRTC frame event callback registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-no-crtc-register-v3-1-1b161df13776@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGD1eWYC/zXMQQ6CMBBA0auQrh1SCiXWlfcwLko7wERtybQSC
 eHuNiYu3+L/XSRkwiQu1S4YV0oUQ0F7qoSbbZgQyBcLJVUne6XBL28IERxnB4wTpYwMvbZnlNo
 ZOXhR0oVxpM9ve7sXjxxfkGdG+5+1jZRaKdlrU5dz1xgDDfgXZd7qwfKW5kdcr08KlmMdeRLH8
 QUR80iWrQAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9017;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TWZEx3suLsxpdgGc3UYSLahjYdAYFMqvVrackbiut0w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmefViYvVjRvfxggyy9ZbQYEkEp2AbQceUiiy9w
 JaBqap1Zz2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnn1YgAKCRCLPIo+Aiko
 1T4BB/wLhhJG7VhStUuFNOaOt8P8fRsh/6kaap90zlNXsMWdy3X85wUNsW1SOTNXch77gD6Jezk
 zo24oc1QCuZF1bzezHwnh2QOrvYJ3MCMAKNIf/seo+XXBvjEsmJXmA4jZfe2SICYlPARanp30zb
 BClOIEMsiJcJfD5flVLB3HqheIb8d/YoXvZhfRHcc6wWubqmOV8EpSexBY8PeG1VWzCgdPf31wW
 3AiAOArrHG99hSALYt4QVMauYmJz9WwU8vZR4thP3tADZDvT+dGccRT41wZcB/dYMpkE41Az6ep
 4w/k5H8/YxTqUtS2jq06kdjKwHojsD1uYiqCt4p3KK1gWJjj
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The frame event callback is always set to dpu_crtc_frame_event_cb() (or
to NULL) and the data is always either the CRTC itself or NULL
(correpondingly). Thus drop the event callback registration, call the
dpu_crtc_frame_event_cb() directly and gate on the dpu_enc->crtc
assigned using dpu_encoder_assign_crtc().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Fixed documentation for dpu_crtc_frame_event_cb() to stop mentioning
  registration. (Abhinav)
- Link to v2: https://lore.kernel.org/dri-devel/20231005220659.2404199-1-dmitry.baryshkov@linaro.org/

Changes in v2:
- Rebased on top of linux-next
- Link to v1: https://lore.kernel.org/dri-devel/20230102154748.951328-1-dmitry.baryshkov@linaro.org/
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 25 +++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 41 +++++------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 10 -------
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  4 ---
 5 files changed, 18 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9f2164782844..4c1be2f0555f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -658,18 +658,18 @@ static void dpu_crtc_frame_event_work(struct kthread_work *work)
 	DPU_ATRACE_END("crtc_frame_event");
 }
 
-/*
- * dpu_crtc_frame_event_cb - crtc frame event callback API. CRTC module
- * registers this API to encoder for all frame event callbacks like
- * frame_error, frame_done, idle_timeout, etc. Encoder may call different events
- * from different context - IRQ, user thread, commit_thread, etc. Each event
- * should be carefully reviewed and should be processed in proper task context
- * to avoid schedulin delay or properly manage the irq context's bottom half
- * processing.
+/**
+ * dpu_crtc_frame_event_cb - crtc frame event callback API
+ * @crtc: Pointer to crtc
+ * @event: Event to process
+ *
+ * Encoder may call this for different events from different context - IRQ,
+ * user thread, commit_thread, etc. Each event should be carefully reviewed and
+ * should be processed in proper task context to avoid schedulin delay or
+ * properly manage the irq context's bottom half processing.
  */
-static void dpu_crtc_frame_event_cb(void *data, u32 event)
+void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event)
 {
-	struct drm_crtc *crtc = (struct drm_crtc *)data;
 	struct dpu_crtc *dpu_crtc;
 	struct msm_drm_private *priv;
 	struct dpu_crtc_frame_event *fevent;
@@ -1091,9 +1091,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 
 	dpu_core_perf_crtc_update(crtc, 0);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
-		dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
-
 	memset(cstate->mixers, 0, sizeof(cstate->mixers));
 	cstate->num_mixers = 0;
 
@@ -1132,8 +1129,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 		 */
 		if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
 			request_bandwidth = true;
-		dpu_encoder_register_frame_event_callback(encoder,
-				dpu_crtc_frame_event_cb, (void *)crtc);
 	}
 
 	if (request_bandwidth)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 539b68b1626a..b26d5fe40c72 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -300,4 +300,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
 	return crtc && crtc->state ? RT_CLIENT : NRT_CLIENT;
 }
 
+void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
+
 #endif /* _DPU_CRTC_H_ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 708657598cce..4099e72820f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -151,8 +151,6 @@ enum dpu_enc_rc_states {
  * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
  *				busy processing current command.
  *				Bit0 = phys_encs[0] etc.
- * @crtc_frame_event_cb:	callback handler for frame event
- * @crtc_frame_event_cb_data:	callback handler private data
  * @frame_done_timeout_ms:	frame done timeout in ms
  * @frame_done_timeout_cnt:	atomic counter tracking the number of frame
  * 				done timeouts
@@ -192,8 +190,6 @@ struct dpu_encoder_virt {
 
 	struct mutex enc_lock;
 	DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
-	void (*crtc_frame_event_cb)(void *, u32 event);
-	void *crtc_frame_event_cb_data;
 
 	atomic_t frame_done_timeout_ms;
 	atomic_t frame_done_timeout_cnt;
@@ -1456,28 +1452,6 @@ void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *drm_enc,
 	}
 }
 
-void dpu_encoder_register_frame_event_callback(struct drm_encoder *drm_enc,
-		void (*frame_event_cb)(void *, u32 event),
-		void *frame_event_cb_data)
-{
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-	unsigned long lock_flags;
-	bool enable;
-
-	enable = frame_event_cb ? true : false;
-
-	if (!drm_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
-	trace_dpu_enc_frame_event_cb(DRMID(drm_enc), enable);
-
-	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
-	dpu_enc->crtc_frame_event_cb = frame_event_cb;
-	dpu_enc->crtc_frame_event_cb_data = frame_event_cb_data;
-	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
-}
-
 void dpu_encoder_frame_done_callback(
 		struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *ready_phys, u32 event)
@@ -1517,15 +1491,12 @@ void dpu_encoder_frame_done_callback(
 			dpu_encoder_resource_control(drm_enc,
 					DPU_ENC_RC_EVENT_FRAME_DONE);
 
-			if (dpu_enc->crtc_frame_event_cb)
-				dpu_enc->crtc_frame_event_cb(
-					dpu_enc->crtc_frame_event_cb_data,
-					event);
+			if (dpu_enc->crtc)
+				dpu_crtc_frame_event_cb(dpu_enc->crtc, event);
 		}
 	} else {
-		if (dpu_enc->crtc_frame_event_cb)
-			dpu_enc->crtc_frame_event_cb(
-				dpu_enc->crtc_frame_event_cb_data, event);
+		if (dpu_enc->crtc)
+			dpu_crtc_frame_event_cb(dpu_enc->crtc, event);
 	}
 }
 
@@ -2459,7 +2430,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 		return;
 	}
 
-	if (!dpu_enc->frame_busy_mask[0] || !dpu_enc->crtc_frame_event_cb) {
+	if (!dpu_enc->frame_busy_mask[0] || !dpu_enc->crtc) {
 		DRM_DEBUG_KMS("id:%u invalid timeout frame_busy_mask=%lu\n",
 			      DRMID(drm_enc), dpu_enc->frame_busy_mask[0]);
 		return;
@@ -2475,7 +2446,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 
 	event = DPU_ENCODER_FRAME_EVENT_ERROR;
 	trace_dpu_enc_frame_done_timeout(DRMID(drm_enc), event);
-	dpu_enc->crtc_frame_event_cb(dpu_enc->crtc_frame_event_cb_data, event);
+	dpu_crtc_frame_event_cb(dpu_enc->crtc, event);
 }
 
 static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 76be77e30954..fab08e68b41b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -55,16 +55,6 @@ void dpu_encoder_assign_crtc(struct drm_encoder *encoder,
 void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *encoder,
 					struct drm_crtc *crtc, bool enable);
 
-/**
- * dpu_encoder_register_frame_event_callback - provide callback to encoder that
- *	will be called after the request is complete, or other events.
- * @encoder:	encoder pointer
- * @cb:		callback pointer, provide NULL to deregister
- * @data:	user data provided to callback
- */
-void dpu_encoder_register_frame_event_callback(struct drm_encoder *encoder,
-		void (*cb)(void *, u32), void *data);
-
 /**
  * dpu_encoder_prepare_for_kickoff - schedule double buffer flip of the ctl
  *	path (i.e. ctl flush and start) at next appropriate time.
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 0fdd41162e4b..5307cbc2007c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -354,10 +354,6 @@ DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_vblank_cb,
 	TP_PROTO(uint32_t drm_id, bool enable),
 	TP_ARGS(drm_id, enable)
 );
-DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_frame_event_cb,
-	TP_PROTO(uint32_t drm_id, bool enable),
-	TP_ARGS(drm_id, enable)
-);
 DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_phys_cmd_connect_te,
 	TP_PROTO(uint32_t drm_id, bool enable),
 	TP_ARGS(drm_id, enable)

---
base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
change-id: 20240625-dpu-no-crtc-register-65a8e05c90bd

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

