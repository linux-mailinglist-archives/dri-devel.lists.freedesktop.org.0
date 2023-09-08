Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06705798F8D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 21:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFA910E1FC;
	Fri,  8 Sep 2023 19:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A0A10E211
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 19:33:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3897261558;
 Fri,  8 Sep 2023 19:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF341C433C7;
 Fri,  8 Sep 2023 19:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694201582;
 bh=/fl972o/lq1Tfwhci3r1oCRLmRL2sWl6fS4A2/i7fwY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SQpcxl8XoO+6ES68kI8jCpejayXeFddYehquMlDMQZfZpysXaGvUgcot0jcXqpj39
 IJog18ueQ4e2hpsZBbyaEh1Vprn+nbDxGZ9e5yt8lKwk92Hrgst7yaacDIDvlMBydR
 MCXfHi00W95cLZl4JruJFMl3lYUBTPd3LP884lGAtREOtBBNzqD3LgmrMCPE7ER6aR
 robdkVAdwE4WDKezFY0x7zXSdxxx7kEKVRSWv4o+hUwQT3QZrvN0lTk9WA2plrwN9/
 dDpAdgDej/UU+8JVcemC+RewVoadWaBZDLVbo8XNQymqdfHEPBucNeVRiwiLpuib+A
 HHPEB7VD6n/QA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 14/31] drm/vkms: Fix race-condition between the
 hrtimer and the atomic commit
Date: Fri,  8 Sep 2023 15:31:43 -0400
Message-Id: <20230908193201.3462957-14-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908193201.3462957-1-sashal@kernel.org>
References: <20230908193201.3462957-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.15
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
Cc: Sasha Levin <sashal@kernel.org>, rodrigosiqueiramelo@gmail.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maíra Canal <mcanal@igalia.com>

[ Upstream commit a0e6a017ab56936c0405fe914a793b241ed25ee0 ]

Currently, it is possible for the composer to be set as enabled and then
as disabled without a proper call for the vkms_vblank_simulate(). This
is problematic, because the driver would skip one CRC output, causing CRC
tests to fail. Therefore, we need to make sure that, for each time the
composer is set as enabled, a composer job is added to the queue.

In order to provide this guarantee, add a mutex that will lock before
the composer is set as enabled and will unlock only after the composer
job is added to the queue. This way, we can have a guarantee that the
driver won't skip a CRC entry.

This race-condition is affecting the IGT test "writeback-check-output",
making the test fail and also, leaking writeback framebuffers, as the
writeback job is queued, but it is not signaled. This patch avoids both
problems.

[v2]:
    * Create a new mutex and keep the spinlock across the atomic commit in
      order to avoid interrupts that could result in deadlocks.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>
Signed-off-by: Maíra Canal <mairacanal@riseup.net>
Link: https://patchwork.freedesktop.org/patch/msgid/20230523123207.173976-1-mcanal@igalia.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 9 +++++++--
 drivers/gpu/drm/vkms/vkms_crtc.c     | 9 +++++----
 drivers/gpu/drm/vkms/vkms_drv.h      | 4 +++-
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 80164e79af006..7f56d1f7eda11 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -296,10 +296,15 @@ void vkms_set_composer(struct vkms_output *out, bool enabled)
 	if (enabled)
 		drm_crtc_vblank_get(&out->crtc);
 
-	spin_lock_irq(&out->lock);
+	mutex_lock(&out->enabled_lock);
 	old_enabled = out->composer_enabled;
 	out->composer_enabled = enabled;
-	spin_unlock_irq(&out->lock);
+
+	/* the composition wasn't enabled, so unlock the lock to make sure the lock
+	 * will be balanced even if we have a failed commit
+	 */
+	if (!out->composer_enabled)
+		mutex_unlock(&out->enabled_lock);
 
 	if (old_enabled)
 		drm_crtc_vblank_put(&out->crtc);
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 57bbd32e9bebb..1b02dee8587ac 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -16,7 +16,7 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 	struct drm_crtc *crtc = &output->crtc;
 	struct vkms_crtc_state *state;
 	u64 ret_overrun;
-	bool ret, fence_cookie;
+	bool ret, fence_cookie, composer_enabled;
 
 	fence_cookie = dma_fence_begin_signalling();
 
@@ -25,15 +25,15 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 	if (ret_overrun != 1)
 		pr_warn("%s: vblank timer overrun\n", __func__);
 
-	spin_lock(&output->lock);
 	ret = drm_crtc_handle_vblank(crtc);
 	if (!ret)
 		DRM_ERROR("vkms failure on handling vblank");
 
 	state = output->composer_state;
-	spin_unlock(&output->lock);
+	composer_enabled = output->composer_enabled;
+	mutex_unlock(&output->enabled_lock);
 
-	if (state && output->composer_enabled) {
+	if (state && composer_enabled) {
 		u64 frame = drm_crtc_accurate_vblank_count(crtc);
 
 		/* update frame_start only if a queued vkms_composer_worker()
@@ -293,6 +293,7 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 
 	spin_lock_init(&vkms_out->lock);
 	spin_lock_init(&vkms_out->composer_lock);
+	mutex_init(&vkms_out->enabled_lock);
 
 	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
 	if (!vkms_out->composer_workq)
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index f152d54baf769..b8948c8729ee4 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -98,8 +98,10 @@ struct vkms_output {
 	struct workqueue_struct *composer_workq;
 	/* protects concurrent access to composer */
 	spinlock_t lock;
+	/* guarantees that if the composer is enabled, a job will be queued */
+	struct mutex enabled_lock;
 
-	/* protected by @lock */
+	/* protected by @enabled_lock */
 	bool composer_enabled;
 	struct vkms_crtc_state *composer_state;
 
-- 
2.40.1

