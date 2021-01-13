Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E8C2F5D76
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27D46E14D;
	Thu, 14 Jan 2021 09:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F086EC28
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 19:52:29 +0000 (UTC)
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 13 Jan 2021 11:52:28 -0800
X-QCInternal: smtphost
Received: from veeras-linux.qualcomm.com ([10.134.68.137])
 by ironmsg02-sd.qualcomm.com with ESMTP; 13 Jan 2021 11:52:28 -0800
Received: by veeras-linux.qualcomm.com (Postfix, from userid 330320)
 id 3CCF121B9E; Wed, 13 Jan 2021 11:52:28 -0800 (PST)
From: Veera Sundaram Sankaran <veeras@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org, gustavo@padovan.org, airlied@linux.ie,
 daniel@ffwll.ch, john.stultz@linaro.org
Subject: [PATCH v3 2/2] drm/drm_vblank: set the dma-fence timestamp during
 send_vblank_event
Date: Wed, 13 Jan 2021 11:52:19 -0800
Message-Id: <1610567539-16750-2-git-send-email-veeras@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610567539-16750-1-git-send-email-veeras@codeaurora.org>
References: <1610567539-16750-1-git-send-email-veeras@codeaurora.org>
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:31 +0000
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
Cc: Veera Sundaram Sankaran <veeras@codeaurora.org>, abhinavk@codeaurora.org,
 pdhaval@codeaurora.org, sean@poorly.run
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
buffer usage. For instance, the Android framework [1] uses the
retire-fences as an alternative to vblank when frame-updates are in
progress. Set the fence timestamp during send vblank event using a new
drm_send_event_timestamp_locked variant to avoid discrepancies.

[1] https://android.googlesource.com/platform/frameworks/native/+/master/
services/surfaceflinger/Scheduler/Scheduler.cpp#397

Changes in v2:
- Use drm_send_event_timestamp_locked to update fence timestamp
- add more information to commit text

Changes in v3:
- use same backend helper function for variants of drm_send_event to
avoid code duplications

Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
---
 drivers/gpu/drm/drm_file.c   | 71 ++++++++++++++++++++++++++++++++++++--------
 drivers/gpu/drm/drm_vblank.c |  9 +++++-
 include/drm/drm_file.h       |  3 ++
 3 files changed, 70 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 0ac4566..b8348ca 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -775,20 +775,19 @@ void drm_event_cancel_free(struct drm_device *dev,
 EXPORT_SYMBOL(drm_event_cancel_free);
 
 /**
- * drm_send_event_locked - send DRM event to file descriptor
+ * drm_send_event_helper - send DRM event to file descriptor
  * @dev: DRM device
  * @e: DRM event to deliver
+ * @timestamp: timestamp to set for the fence event in kernel's CLOCK_MONOTONIC
+ * time domain
  *
- * This function sends the event @e, initialized with drm_event_reserve_init(),
- * to its associated userspace DRM file. Callers must already hold
- * &drm_device.event_lock, see drm_send_event() for the unlocked version.
- *
- * Note that the core will take care of unlinking and disarming events when the
- * corresponding DRM file is closed. Drivers need not worry about whether the
- * DRM file for this event still exists and can call this function upon
- * completion of the asynchronous work unconditionally.
+ * This helper function sends the event @e, initialized with
+ * drm_event_reserve_init(), to its associated userspace DRM file.
+ * The timestamp variant of dma_fence_signal is used when the caller
+ * sends a valid timestamp.
  */
-void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e)
+void drm_send_event_helper(struct drm_device *dev,
+			struct drm_pending_event *e, ktime_t timestamp)
 {
 	assert_spin_locked(&dev->event_lock);
 
@@ -799,7 +798,10 @@ void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e)
 	}
 
 	if (e->fence) {
-		dma_fence_signal(e->fence);
+		if (timestamp)
+			dma_fence_signal_timestamp(e->fence, timestamp);
+		else
+			dma_fence_signal(e->fence);
 		dma_fence_put(e->fence);
 	}
 
@@ -814,6 +816,51 @@ void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e)
 	wake_up_interruptible_poll(&e->file_priv->event_wait,
 		EPOLLIN | EPOLLRDNORM);
 }
+
+/**
+ * drm_send_event_timestamp_locked - send DRM event to file descriptor
+ * @dev: DRM device
+ * @e: DRM event to deliver
+ * @timestamp: timestamp to set for the fence event in kernel's CLOCK_MONOTONIC
+ * time domain
+ *
+ * This function sends the event @e, initialized with drm_event_reserve_init(),
+ * to its associated userspace DRM file. Callers must already hold
+ * &drm_device.event_lock.
+ *
+ * Note that the core will take care of unlinking and disarming events when the
+ * corresponding DRM file is closed. Drivers need not worry about whether the
+ * DRM file for this event still exists and can call this function upon
+ * completion of the asynchronous work unconditionally.
+ */
+void drm_send_event_timestamp_locked(struct drm_device *dev,
+			struct drm_pending_event *e, ktime_t timestamp)
+{
+	WARN_ON(!timestamp);
+
+	drm_send_event_helper(dev, e, timestamp);
+
+}
+EXPORT_SYMBOL(drm_send_event_timestamp_locked);
+
+/**
+ * drm_send_event_locked - send DRM event to file descriptor
+ * @dev: DRM device
+ * @e: DRM event to deliver
+ *
+ * This function sends the event @e, initialized with drm_event_reserve_init(),
+ * to its associated userspace DRM file. Callers must already hold
+ * &drm_device.event_lock, see drm_send_event() for the unlocked version.
+ *
+ * Note that the core will take care of unlinking and disarming events when the
+ * corresponding DRM file is closed. Drivers need not worry about whether the
+ * DRM file for this event still exists and can call this function upon
+ * completion of the asynchronous work unconditionally.
+ */
+void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e)
+{
+	drm_send_event_helper(dev, e, 0);
+}
 EXPORT_SYMBOL(drm_send_event_locked);
 
 /**
@@ -836,7 +883,7 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
 	unsigned long irqflags;
 
 	spin_lock_irqsave(&dev->event_lock, irqflags);
-	drm_send_event_locked(dev, e);
+	drm_send_event_helper(dev, e, 0);
 	spin_unlock_irqrestore(&dev->event_lock, irqflags);
 }
 EXPORT_SYMBOL(drm_send_event);
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index f135b79..286edbe 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1000,7 +1000,14 @@ static void send_vblank_event(struct drm_device *dev,
 		break;
 	}
 	trace_drm_vblank_event_delivered(e->base.file_priv, e->pipe, seq);
-	drm_send_event_locked(dev, &e->base);
+	/*
+	 * Use the same timestamp for any associated fence signal to avoid
+	 * mismatch in timestamps for vsync & fence events triggered by the
+	 * same HW event. Frameworks like SurfaceFlinger in Android expects the
+	 * retire-fence timestamp to match exactly with HW vsync as it uses it
+	 * for its software vsync modeling.
+	 */
+	drm_send_event_timestamp_locked(dev, &e->base, now);
 }
 
 /**
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 716990b..b81b3bf 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -399,6 +399,9 @@ void drm_event_cancel_free(struct drm_device *dev,
 			   struct drm_pending_event *p);
 void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e);
 void drm_send_event(struct drm_device *dev, struct drm_pending_event *e);
+void drm_send_event_timestamp_locked(struct drm_device *dev,
+				     struct drm_pending_event *e,
+				     ktime_t timestamp);
 
 struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
