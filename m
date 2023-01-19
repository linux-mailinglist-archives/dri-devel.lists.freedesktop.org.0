Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 157B4673992
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 14:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5131410E924;
	Thu, 19 Jan 2023 13:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099D810E242
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 13:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3MUFW1CfWqbN3yWzOzLyDN6ndFRfS8BtwjxRAMF39DU=; b=LWDSh2RF65bmmQFQT5tr3uLhRb
 jNNBvSKwR3ffyKVZRdPfblu2B4UYAGNp2wPbJG30nHsw+MuqvmFaN2hDJ2PSd6Q42i0K6yHaMCxn1
 AwGYab4uV7+ZcitFO3MbyrIuSo1Gju+XY+9Yd7eQgC99p3HJFfQkumHtXGdTreawImq5wb8WB2kd+
 yIXSMRkvskllX4YTKvkyrX9SOdDELnTNgR6QSmcuucZZnFLPWFymc26UumavAH+5PcPJv8XeeXIhg
 eIuL5E8Qh8Oao9w2kSlD7E4XxfxOqmQzEzJXTGFcNTXgbUL7Qbzr4WO2o2eQK0SZJZQgovX/od/Iq
 FP7nJkpA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1pIUff-000zLh-NW; Thu, 19 Jan 2023 15:09:35 +0200
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 4/4] gpu: host1x: External timeout/cancellation for fences
Date: Thu, 19 Jan 2023 15:09:21 +0200
Message-Id: <20230119130921.1882602-4-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119130921.1882602-1-cyndis@kapsi.fi>
References: <20230119130921.1882602-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Currently all fences have a 30 second timeout to ensure they are
cleaned up if the fence never completes otherwise. However, this
one size fits all solution doesn't actually fit in every case,
such as syncpoint waiting where we want to be able to have timeouts
longer than 30 seconds. As such, we want to be able to give control
over fence cancellation to the caller (and maybe eventually get rid
of the internal timeout altogether).

Here we add this cancellation mechanism by essentially adding a
function for entering the timeout path by function call, and changing
the syncpoint wait function to use it.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/submit.c     |  2 +-
 drivers/gpu/host1x/fence.c         | 40 ++++++++++++++++++++----------
 drivers/gpu/host1x/fence.h         |  1 +
 drivers/gpu/host1x/hw/channel_hw.c |  2 +-
 drivers/gpu/host1x/syncpt.c        |  4 ++-
 include/linux/host1x.h             |  4 ++-
 6 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index 066f88564169..f4688fcafe93 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -654,7 +654,7 @@ int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
 	args->syncpt.value = job->syncpt_end;
 
 	if (syncobj) {
-		struct dma_fence *fence = host1x_fence_create(job->syncpt, job->syncpt_end);
+		struct dma_fence *fence = host1x_fence_create(job->syncpt, job->syncpt_end, true);
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
 			SUBMIT_ERR(context, "failed to create postfence: %d", err);
diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
index df5b56692d2c..139ad1afd935 100644
--- a/drivers/gpu/host1x/fence.c
+++ b/drivers/gpu/host1x/fence.c
@@ -37,8 +37,7 @@ static bool host1x_syncpt_fence_enable_signaling(struct dma_fence *f)
 	if (host1x_syncpt_is_expired(sf->sp, sf->threshold))
 		return false;
 
-	/* One reference for interrupt path, one for timeout path. */
-	dma_fence_get(f);
+	/* Reference for interrupt path. */
 	dma_fence_get(f);
 
 	/*
@@ -46,11 +45,15 @@ static bool host1x_syncpt_fence_enable_signaling(struct dma_fence *f)
 	 * reference to any fences for which 'enable_signaling' has been
 	 * called (and that have not been signalled).
 	 *
-	 * We cannot (for now) normally guarantee that all fences get signalled.
-	 * As such, setup a timeout, so that long-lasting fences will get
-	 * reaped eventually.
+	 * We cannot currently always guarantee that all fences get signalled
+	 * or cancelled. As such, for such situations, set up a timeout, so
+	 * that long-lasting fences will get reaped eventually.
 	 */
-	schedule_delayed_work(&sf->timeout_work, msecs_to_jiffies(30000));
+	if (sf->timeout) {
+		/* Reference for timeout path. */
+		dma_fence_get(f);
+		schedule_delayed_work(&sf->timeout_work, msecs_to_jiffies(30000));
+	}
 
 	host1x_intr_add_fence_locked(sf->sp->host, sf);
 
@@ -80,7 +83,7 @@ void host1x_fence_signal(struct host1x_syncpt_fence *f)
 		return;
 	}
 
-	if (cancel_delayed_work(&f->timeout_work)) {
+	if (f->timeout && cancel_delayed_work(&f->timeout_work)) {
 		/*
 		 * We know that the timeout path will not be entered.
 		 * Safe to drop the timeout path's reference now.
@@ -99,8 +102,9 @@ static void do_fence_timeout(struct work_struct *work)
 		container_of(dwork, struct host1x_syncpt_fence, timeout_work);
 
 	if (atomic_xchg(&f->signaling, 1)) {
-		/* Already on interrupt path, drop timeout path reference. */
-		dma_fence_put(&f->base);
+		/* Already on interrupt path, drop timeout path reference if any. */
+		if (f->timeout)
+			dma_fence_put(&f->base);
 		return;
 	}
 
@@ -114,12 +118,12 @@ static void do_fence_timeout(struct work_struct *work)
 
 	dma_fence_set_error(&f->base, -ETIMEDOUT);
 	dma_fence_signal(&f->base);
-
-	/* Drop timeout path reference. */
-	dma_fence_put(&f->base);
+	if (f->timeout)
+		dma_fence_put(&f->base);
 }
 
-struct dma_fence *host1x_fence_create(struct host1x_syncpt *sp, u32 threshold)
+struct dma_fence *host1x_fence_create(struct host1x_syncpt *sp, u32 threshold,
+				      bool timeout)
 {
 	struct host1x_syncpt_fence *fence;
 
@@ -129,6 +133,7 @@ struct dma_fence *host1x_fence_create(struct host1x_syncpt *sp, u32 threshold)
 
 	fence->sp = sp;
 	fence->threshold = threshold;
+	fence->timeout = timeout;
 
 	dma_fence_init(&fence->base, &host1x_syncpt_fence_ops, &sp->fences.lock,
 		       dma_fence_context_alloc(1), 0);
@@ -138,3 +143,12 @@ struct dma_fence *host1x_fence_create(struct host1x_syncpt *sp, u32 threshold)
 	return &fence->base;
 }
 EXPORT_SYMBOL(host1x_fence_create);
+
+void host1x_fence_cancel(struct dma_fence *f)
+{
+	struct host1x_syncpt_fence *sf = to_host1x_fence(f);
+
+	schedule_delayed_work(&sf->timeout_work, 0);
+	flush_delayed_work(&sf->timeout_work);
+}
+EXPORT_SYMBOL(host1x_fence_cancel);
diff --git a/drivers/gpu/host1x/fence.h b/drivers/gpu/host1x/fence.h
index 4352d046f92c..f3c644c73cad 100644
--- a/drivers/gpu/host1x/fence.h
+++ b/drivers/gpu/host1x/fence.h
@@ -13,6 +13,7 @@ struct host1x_syncpt_fence {
 
 	struct host1x_syncpt *sp;
 	u32 threshold;
+	bool timeout;
 
 	struct delayed_work timeout_work;
 
diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index 8a3119fc5a77..0a528573a792 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -325,7 +325,7 @@ static int channel_submit(struct host1x_job *job)
 	 * Create fence before submitting job to HW to avoid job completing
 	 * before the fence is set up.
 	 */
-	job->fence = host1x_fence_create(sp, syncval);
+	job->fence = host1x_fence_create(sp, syncval, true);
 	if (WARN(IS_ERR(job->fence), "Failed to create submit complete fence")) {
 		job->fence = NULL;
 	} else {
diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index 75f58ec2ae23..2d2007760eac 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -236,11 +236,13 @@ int host1x_syncpt_wait(struct host1x_syncpt *sp, u32 thresh, long timeout,
 	else if (timeout == 0)
 		return -EAGAIN;
 
-	fence = host1x_fence_create(sp, thresh);
+	fence = host1x_fence_create(sp, thresh, false);
 	if (IS_ERR(fence))
 		return PTR_ERR(fence);
 
 	wait_err = dma_fence_wait_timeout(fence, true, timeout);
+	if (wait_err == 0)
+		host1x_fence_cancel(fence);
 	dma_fence_put(fence);
 
 	if (value)
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index db6cf6f34361..9a9de4b97a25 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -222,7 +222,9 @@ u32 host1x_syncpt_base_id(struct host1x_syncpt_base *base);
 void host1x_syncpt_release_vblank_reservation(struct host1x_client *client,
 					      u32 syncpt_id);
 
-struct dma_fence *host1x_fence_create(struct host1x_syncpt *sp, u32 threshold);
+struct dma_fence *host1x_fence_create(struct host1x_syncpt *sp, u32 threshold,
+				      bool timeout);
+void host1x_fence_cancel(struct dma_fence *fence);
 
 /*
  * host1x channel
-- 
2.39.0

