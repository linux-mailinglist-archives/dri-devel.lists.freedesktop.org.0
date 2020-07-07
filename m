Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E96217A7D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 23:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48356E182;
	Tue,  7 Jul 2020 21:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429A16E15D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 21:31:45 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id o2so718040wmh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 14:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5OKgh3mvsF5ue+TTYOgE5XvqURkZAByfyiWBp7hUSak=;
 b=TWKOYBrzNWVhAsByi4gCqtr9Mir2CzDLbaogIsSa2DhjaJYFaeCwEghzJQaQmqmxWf
 WByZMOhk3fhW1ibvgBBQqIU24g/gvcliJf+Oxqs7DW4VNu0ptEXUxM68pROXQrx9SBTB
 eGi5fJKKS/o8OVN5Ks399+NdtDdvguSQw5sNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5OKgh3mvsF5ue+TTYOgE5XvqURkZAByfyiWBp7hUSak=;
 b=M3VstsMYRuK3RT6eWUksFSNA9CwKQU7AZW/ziaVGg0bSWM2cQpkNG3mASZJk0D7iD0
 VexhULitgCEhevq7hRCjt7SsrLZW9w21r5M/ggkpJ/Qm7ioLpVwZR9wiaTNIrE9G5ZAa
 qtbvu2cE9NT7hQmh/x0XtiLZmsJqQoU68K2EUjxMTjPhMCrVBpOaKiQIjNE9N82R3JyX
 dgcGKYgV1sOqMS8Sb8r5ToWeReTDdG1ozfBZtISm4RoOyuBx7Z+wTlmDS4IkiPLcql8u
 FzvmwBDDqMD1iofZHi/5jM6gUIez1puCAy54ddMt7jISiZPFExBRAsdBxBFJEVbKo/zM
 DkBw==
X-Gm-Message-State: AOAM5309l1+rpbBuIvbILxTb5XmqPmmyMXMSC/uffD/J8FktrHFzta3n
 pEuDAiDrLhIueZy7y33BGYfDZT5vPfM=
X-Google-Smtp-Source: ABdhPJy7yguPwGUWDg4Vv129pYTLOPESlkqmddmztp6ah9fLKrB1z/82msn2A+EyRr4qaI3AbiVpCw==
X-Received: by 2002:a1c:7413:: with SMTP id p19mr5919274wmc.60.1594157503528; 
 Tue, 07 Jul 2020 14:31:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s8sm2466311wru.38.2020.07.07.14.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 14:31:42 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/atmel: Use drm_atomic_helper_commit
Date: Tue,  7 Jul 2020 23:31:37 +0200
Message-Id: <20200707213137.482778-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707201229.472834-10-daniel.vetter@ffwll.ch>
References: <20200707201229.472834-10-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-rdma@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

One of these drivers that predates the nonblocking support in helpers,
and hand-rolled its own thing. Entirely not anything specific here, we
can just delete it all and replace it with the helper version.

Could also perhaps use the drm_mode_config_helper_suspend/resume
stuff, for another few lines deleted. But I'm not looking at that
stuff, I'm just going through all the atomic commit functions and make
sure they have properly annotated dma-fence critical sections
everywhere.

v2:
- Also delete the workqueue (Sam)
- drop the @commit kerneldoc, I missed that one.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 107 +------------------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h |   7 --
 2 files changed, 2 insertions(+), 112 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index 871293d1aeeb..03984932d174 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -557,103 +557,10 @@ static irqreturn_t atmel_hlcdc_dc_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-struct atmel_hlcdc_dc_commit {
-	struct work_struct work;
-	struct drm_device *dev;
-	struct drm_atomic_state *state;
-};
-
-static void
-atmel_hlcdc_dc_atomic_complete(struct atmel_hlcdc_dc_commit *commit)
-{
-	struct drm_device *dev = commit->dev;
-	struct atmel_hlcdc_dc *dc = dev->dev_private;
-	struct drm_atomic_state *old_state = commit->state;
-
-	/* Apply the atomic update. */
-	drm_atomic_helper_commit_modeset_disables(dev, old_state);
-	drm_atomic_helper_commit_planes(dev, old_state, 0);
-	drm_atomic_helper_commit_modeset_enables(dev, old_state);
-
-	drm_atomic_helper_wait_for_vblanks(dev, old_state);
-
-	drm_atomic_helper_cleanup_planes(dev, old_state);
-
-	drm_atomic_state_put(old_state);
-
-	/* Complete the commit, wake up any waiter. */
-	spin_lock(&dc->commit.wait.lock);
-	dc->commit.pending = false;
-	wake_up_all_locked(&dc->commit.wait);
-	spin_unlock(&dc->commit.wait.lock);
-
-	kfree(commit);
-}
-
-static void atmel_hlcdc_dc_atomic_work(struct work_struct *work)
-{
-	struct atmel_hlcdc_dc_commit *commit =
-		container_of(work, struct atmel_hlcdc_dc_commit, work);
-
-	atmel_hlcdc_dc_atomic_complete(commit);
-}
-
-static int atmel_hlcdc_dc_atomic_commit(struct drm_device *dev,
-					struct drm_atomic_state *state,
-					bool async)
-{
-	struct atmel_hlcdc_dc *dc = dev->dev_private;
-	struct atmel_hlcdc_dc_commit *commit;
-	int ret;
-
-	ret = drm_atomic_helper_prepare_planes(dev, state);
-	if (ret)
-		return ret;
-
-	/* Allocate the commit object. */
-	commit = kzalloc(sizeof(*commit), GFP_KERNEL);
-	if (!commit) {
-		ret = -ENOMEM;
-		goto error;
-	}
-
-	INIT_WORK(&commit->work, atmel_hlcdc_dc_atomic_work);
-	commit->dev = dev;
-	commit->state = state;
-
-	spin_lock(&dc->commit.wait.lock);
-	ret = wait_event_interruptible_locked(dc->commit.wait,
-					      !dc->commit.pending);
-	if (ret == 0)
-		dc->commit.pending = true;
-	spin_unlock(&dc->commit.wait.lock);
-
-	if (ret)
-		goto err_free;
-
-	/* We have our own synchronization through the commit lock. */
-	BUG_ON(drm_atomic_helper_swap_state(state, false) < 0);
-
-	/* Swap state succeeded, this is the point of no return. */
-	drm_atomic_state_get(state);
-	if (async)
-		queue_work(dc->wq, &commit->work);
-	else
-		atmel_hlcdc_dc_atomic_complete(commit);
-
-	return 0;
-
-err_free:
-	kfree(commit);
-error:
-	drm_atomic_helper_cleanup_planes(dev, state);
-	return ret;
-}
-
 static const struct drm_mode_config_funcs mode_config_funcs = {
 	.fb_create = drm_gem_fb_create,
 	.atomic_check = drm_atomic_helper_check,
-	.atomic_commit = atmel_hlcdc_dc_atomic_commit,
+	.atomic_commit = drm_atomic_helper_commit,
 };
 
 static int atmel_hlcdc_dc_modeset_init(struct drm_device *dev)
@@ -712,11 +619,6 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
 	if (!dc)
 		return -ENOMEM;
 
-	dc->wq = alloc_ordered_workqueue("atmel-hlcdc-dc", 0);
-	if (!dc->wq)
-		return -ENOMEM;
-
-	init_waitqueue_head(&dc->commit.wait);
 	dc->desc = match->data;
 	dc->hlcdc = dev_get_drvdata(dev->dev->parent);
 	dev->dev_private = dc;
@@ -724,7 +626,7 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
 	ret = clk_prepare_enable(dc->hlcdc->periph_clk);
 	if (ret) {
 		dev_err(dev->dev, "failed to enable periph_clk\n");
-		goto err_destroy_wq;
+		return ret;
 	}
 
 	pm_runtime_enable(dev->dev);
@@ -761,9 +663,6 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
 	pm_runtime_disable(dev->dev);
 	clk_disable_unprepare(dc->hlcdc->periph_clk);
 
-err_destroy_wq:
-	destroy_workqueue(dc->wq);
-
 	return ret;
 }
 
@@ -771,7 +670,6 @@ static void atmel_hlcdc_dc_unload(struct drm_device *dev)
 {
 	struct atmel_hlcdc_dc *dc = dev->dev_private;
 
-	flush_workqueue(dc->wq);
 	drm_kms_helper_poll_fini(dev);
 	drm_atomic_helper_shutdown(dev);
 	drm_mode_config_cleanup(dev);
@@ -784,7 +682,6 @@ static void atmel_hlcdc_dc_unload(struct drm_device *dev)
 
 	pm_runtime_disable(dev->dev);
 	clk_disable_unprepare(dc->hlcdc->periph_clk);
-	destroy_workqueue(dc->wq);
 }
 
 static int atmel_hlcdc_dc_irq_postinstall(struct drm_device *dev)
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
index 469d4507e576..5b5c774e0edf 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
@@ -331,9 +331,7 @@ struct atmel_hlcdc_dc_desc {
  * @crtc: CRTC provided by the display controller
  * @planes: instantiated planes
  * @layers: active HLCDC layers
- * @wq: display controller workqueue
  * @suspend: used to store the HLCDC state when entering suspend
- * @commit: used for async commit handling
  */
 struct atmel_hlcdc_dc {
 	const struct atmel_hlcdc_dc_desc *desc;
@@ -341,15 +339,10 @@ struct atmel_hlcdc_dc {
 	struct atmel_hlcdc *hlcdc;
 	struct drm_crtc *crtc;
 	struct atmel_hlcdc_layer *layers[ATMEL_HLCDC_MAX_LAYERS];
-	struct workqueue_struct *wq;
 	struct {
 		u32 imr;
 		struct drm_atomic_state *state;
 	} suspend;
-	struct {
-		wait_queue_head_t wait;
-		bool pending;
-	} commit;
 };
 
 extern struct atmel_hlcdc_formats atmel_hlcdc_plane_rgb_formats;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
