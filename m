Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4637503C6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D693110E4C0;
	Wed, 12 Jul 2023 09:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D6C10E431
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:48:38 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRJ-0001GB-8m; Wed, 12 Jul 2023 11:47:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR8-00Dr3H-Ny; Wed, 12 Jul 2023 11:47:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR7-004GS6-Io; Wed, 12 Jul 2023 11:47:05 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Guchun Chen <guchun.chen@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Evan Quan <evan.quan@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 =?utf-8?b?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 David Francis <David.Francis@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Graham Sider <Graham.Sider@amd.com>,
 Lang Yu <Lang.Yu@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>, Tim Huang <Tim.Huang@amd.com>,
 Zack Rusin <zackr@vmware.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jani Nikula <jani.nikula@intel.com>, xurui <xurui@kylinos.cn>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>,
 Stylon Wang <stylon.wang@amd.com>, Alan Liu <haoping.liu@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Aaron Liu <aaron.liu@amd.com>,
 Melissa Wen <mwen@igalia.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 David Tadokoro <davidbtadokoro@usp.br>, Wenjing Liu <wenjing.liu@amd.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>, Roman Li <roman.li@amd.com>,
 =?utf-8?q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
 Dave Airlie <airlied@redhat.com>
Subject: [PATCH RFC v1 03/52] drm/amd: Use struct drm_crtc::drm_dev instead of
 struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:13 +0200
Message-Id: <20230712094702.1770121-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=49428;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=AgXrC8HZMHNCwk279ieRH2XbWbVSSGC7Hqvw0FA6Lx8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZZUrwT3suBU8Te/9pzCwag5aAj6itkbTuoV
 65+xYATZtmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52WQAKCRCPgPtYfRL+
 TgJVCACGO1ejvxd0fVQRSn+USohu8x/1Q1yW4h/seS0cP6TmZZRItrr/NNs1Q5lbTNHl2yRofTH
 mAdfE2D9U/xzyPgxaDc1d0/X+nsqMBsjhKXyoq4/0pZniZIX1t7gX+WDEbfacZzM62mQz6gwfS1
 Y+fe8Atn6NUxEa23mBVcUxJS2BV3KQ9wKkwUzf+gLSAe+k5q3TwA26cnnhnvIyylGlcuGOLkf59
 pensZPkwqfWWAS6JpN9DrSFCM9XodHSpjFlWmXsTS0iA6Hva/IdL3zGxG01KgyBFRQZ8t1w5B+g
 FLH/Mup0fj47Rk2beK30yvewLnomCekZDN76O9iNdrY3vjh4
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 18 ++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |  6 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c       |  6 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |  8 ++---
 drivers/gpu/drm/amd/amdgpu/atombios_crtc.c    | 22 +++++++-------
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        | 26 ++++++++---------
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        | 28 +++++++++---------
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         | 26 ++++++++---------
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         | 26 ++++++++---------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 29 ++++++++++---------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c | 20 ++++++-------
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  8 ++---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 22 +++++++-------
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  2 +-
 14 files changed, 125 insertions(+), 122 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index b702f499f5fb..cc796e56c3d7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -147,14 +147,14 @@ static void amdgpu_display_flip_work_func(struct work_struct *__work)
 	}
 
 	/* We borrow the event spin lock for protecting flip_status */
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	spin_lock_irqsave(&crtc->drm_dev->event_lock, flags);
 
 	/* Do the flip (mmio) */
 	adev->mode_info.funcs->page_flip(adev, work->crtc_id, work->base, work->async);
 
 	/* Set the flip status */
 	amdgpu_crtc->pflip_status = AMDGPU_FLIP_SUBMITTED;
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	spin_unlock_irqrestore(&crtc->drm_dev->event_lock, flags);
 
 
 	drm_dbg_vbl(adev_to_drm(adev),
@@ -191,7 +191,7 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
 				uint32_t page_flip_flags, uint32_t target,
 				struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct drm_gem_object *obj;
@@ -262,10 +262,10 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
 		amdgpu_get_vblank_counter_kms(crtc);
 
 	/* we borrow the event spin lock for protecting flip_wrok */
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	spin_lock_irqsave(&crtc->drm_dev->event_lock, flags);
 	if (amdgpu_crtc->pflip_status != AMDGPU_FLIP_NONE) {
 		DRM_DEBUG_DRIVER("flip queue: crtc already busy\n");
-		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+		spin_unlock_irqrestore(&crtc->drm_dev->event_lock, flags);
 		r = -EBUSY;
 		goto pflip_cleanup;
 	}
@@ -278,7 +278,7 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
 					 amdgpu_crtc->crtc_id, amdgpu_crtc, work);
 	/* update crtc fb */
 	crtc->primary->fb = fb;
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	spin_unlock_irqrestore(&crtc->drm_dev->event_lock, flags);
 	amdgpu_display_flip_work_func(&work->flip_work.work);
 	return 0;
 
@@ -316,7 +316,7 @@ int amdgpu_display_crtc_set_config(struct drm_mode_set *set,
 	if (!set || !set->crtc)
 		return -EINVAL;
 
-	dev = set->crtc->dev;
+	dev = set->crtc->drm_dev;
 
 	ret = pm_runtime_get_sync(dev->dev);
 	if (ret < 0)
@@ -1353,7 +1353,7 @@ bool amdgpu_display_crtc_scaling_mode_fixup(struct drm_crtc *crtc,
 					const struct drm_display_mode *mode,
 					struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_encoder *encoder;
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	struct amdgpu_encoder *amdgpu_encoder;
@@ -1587,7 +1587,7 @@ bool amdgpu_crtc_get_scanout_position(struct drm_crtc *crtc,
 			int *hpos, ktime_t *stime, ktime_t *etime,
 			const struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = crtc->index;
 
 	return amdgpu_display_get_crtc_scanoutpos(dev, pipe, 0, vpos, hpos,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index cca5a495611f..4428876461f8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1368,7 +1368,7 @@ void amdgpu_driver_release_kms(struct drm_device *dev)
  */
 u32 amdgpu_get_vblank_counter_kms(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = crtc->index;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	int vpos, hpos, stat;
@@ -1436,7 +1436,7 @@ u32 amdgpu_get_vblank_counter_kms(struct drm_crtc *crtc)
  */
 int amdgpu_enable_vblank_kms(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = crtc->index;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	int idx = amdgpu_display_crtc_idx_to_irq_type(adev, pipe);
@@ -1453,7 +1453,7 @@ int amdgpu_enable_vblank_kms(struct drm_crtc *crtc)
  */
 void amdgpu_disable_vblank_kms(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = crtc->index;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	int idx = amdgpu_display_crtc_idx_to_irq_type(adev, pipe);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
index 0bb2466d539a..fb06bc8d1a93 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
@@ -268,7 +268,7 @@ void amdgpu_pll_compute(struct amdgpu_device *adev,
  */
 u32 amdgpu_pll_get_use_mask(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_crtc *test_crtc;
 	struct amdgpu_crtc *test_amdgpu_crtc;
 	u32 pll_in_use = 0;
@@ -295,7 +295,7 @@ u32 amdgpu_pll_get_use_mask(struct drm_crtc *crtc)
  */
 int amdgpu_pll_get_shared_dp_ppll(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_crtc *test_crtc;
 	struct amdgpu_crtc *test_amdgpu_crtc;
 
@@ -324,7 +324,7 @@ int amdgpu_pll_get_shared_dp_ppll(struct drm_crtc *crtc)
 int amdgpu_pll_get_shared_nondp_ppll(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_crtc *test_crtc;
 	struct amdgpu_crtc *test_amdgpu_crtc;
 	u32 adjusted_clock, test_adjusted_clock;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index 53ff91fc6cf6..bd962b17b186 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -63,7 +63,7 @@ static enum hrtimer_restart amdgpu_vkms_vblank_simulate(struct hrtimer *timer)
 
 static int amdgpu_vkms_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 	struct amdgpu_vkms_output *out = drm_crtc_to_amdgpu_vkms_output(crtc);
@@ -89,7 +89,7 @@ static bool amdgpu_vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 					     ktime_t *vblank_time,
 					     bool in_vblank_irq)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = crtc->index;
 	struct amdgpu_vkms_output *output = drm_crtc_to_amdgpu_vkms_output(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
@@ -146,14 +146,14 @@ static void amdgpu_vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 {
 	unsigned long flags;
 	if (crtc->state->event) {
-		spin_lock_irqsave(&crtc->dev->event_lock, flags);
+		spin_lock_irqsave(&crtc->drm_dev->event_lock, flags);
 
 		if (drm_crtc_vblank_get(crtc) != 0)
 			drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		else
 			drm_crtc_arm_vblank_event(crtc, crtc->state->event);
 
-		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+		spin_unlock_irqrestore(&crtc->drm_dev->event_lock, flags);
 
 		crtc->state->event = NULL;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_crtc.c b/drivers/gpu/drm/amd/amdgpu/atombios_crtc.c
index 10098fdd33fc..89d90c0d1b5f 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_crtc.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_crtc.c
@@ -39,7 +39,7 @@ void amdgpu_atombios_crtc_overscan_setup(struct drm_crtc *crtc,
 				  struct drm_display_mode *mode,
 				  struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	SET_CRTC_OVERSCAN_PS_ALLOCATION args;
@@ -82,7 +82,7 @@ void amdgpu_atombios_crtc_overscan_setup(struct drm_crtc *crtc,
 
 void amdgpu_atombios_crtc_scaler_setup(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	ENABLE_SCALER_PS_ALLOCATION args;
@@ -112,7 +112,7 @@ void amdgpu_atombios_crtc_scaler_setup(struct drm_crtc *crtc)
 void amdgpu_atombios_crtc_lock(struct drm_crtc *crtc, int lock)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	int index =
 	    GetIndexIntoMasterTable(COMMAND, UpdateCRTC_DoubleBufferRegisters);
@@ -129,7 +129,7 @@ void amdgpu_atombios_crtc_lock(struct drm_crtc *crtc, int lock)
 void amdgpu_atombios_crtc_enable(struct drm_crtc *crtc, int state)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	int index = GetIndexIntoMasterTable(COMMAND, EnableCRTC);
 	ENABLE_CRTC_PS_ALLOCATION args;
@@ -145,7 +145,7 @@ void amdgpu_atombios_crtc_enable(struct drm_crtc *crtc, int state)
 void amdgpu_atombios_crtc_blank(struct drm_crtc *crtc, int state)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	int index = GetIndexIntoMasterTable(COMMAND, BlankCRTC);
 	BLANK_CRTC_PS_ALLOCATION args;
@@ -161,7 +161,7 @@ void amdgpu_atombios_crtc_blank(struct drm_crtc *crtc, int state)
 void amdgpu_atombios_crtc_powergate(struct drm_crtc *crtc, int state)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	int index = GetIndexIntoMasterTable(COMMAND, EnableDispPowerGating);
 	ENABLE_DISP_POWER_GATING_PS_ALLOCATION args;
@@ -190,7 +190,7 @@ void amdgpu_atombios_crtc_set_dtd_timing(struct drm_crtc *crtc,
 				  struct drm_display_mode *mode)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	SET_CRTC_USING_DTD_TIMING_PARAMETERS args;
 	int index = GetIndexIntoMasterTable(COMMAND, SetCRTC_UsingDTDTiming);
@@ -305,7 +305,7 @@ static u32 amdgpu_atombios_crtc_adjust_pll(struct drm_crtc *crtc,
 				    struct drm_display_mode *mode)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_encoder *encoder = amdgpu_crtc->encoder;
 	struct amdgpu_encoder *amdgpu_encoder = to_amdgpu_encoder(encoder);
@@ -586,7 +586,7 @@ void amdgpu_atombios_crtc_program_pll(struct drm_crtc *crtc,
 				      bool ss_enabled,
 				      struct amdgpu_atom_ss *ss)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u8 frev, crev;
 	int index = GetIndexIntoMasterTable(COMMAND, SetPixelClock);
@@ -747,7 +747,7 @@ int amdgpu_atombios_crtc_prepare_pll(struct drm_crtc *crtc,
 			      struct drm_display_mode *mode)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder =
 		to_amdgpu_encoder(amdgpu_crtc->encoder);
@@ -816,7 +816,7 @@ int amdgpu_atombios_crtc_prepare_pll(struct drm_crtc *crtc,
 void amdgpu_atombios_crtc_set_pll(struct drm_crtc *crtc, struct drm_display_mode *mode)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_encoder *amdgpu_encoder =
 		to_amdgpu_encoder(amdgpu_crtc->encoder);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 9a24ed463abd..9f232aebb3f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -1824,7 +1824,7 @@ static const u32 vga_control_regs[6] =
 static void dce_v10_0_vga_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 vga_control;
 
@@ -1838,7 +1838,7 @@ static void dce_v10_0_vga_enable(struct drm_crtc *crtc, bool enable)
 static void dce_v10_0_grph_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	if (enable)
@@ -1852,7 +1852,7 @@ static int dce_v10_0_crtc_do_set_base(struct drm_crtc *crtc,
 				     int x, int y, int atomic)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_framebuffer *target_fb;
 	struct drm_gem_object *obj;
@@ -2096,7 +2096,7 @@ static int dce_v10_0_crtc_do_set_base(struct drm_crtc *crtc,
 static void dce_v10_0_set_interleave(struct drm_crtc *crtc,
 				     struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	u32 tmp;
@@ -2112,7 +2112,7 @@ static void dce_v10_0_set_interleave(struct drm_crtc *crtc,
 static void dce_v10_0_crtc_load_lut(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u16 *r, *g, *b;
 	int i;
@@ -2247,7 +2247,7 @@ static int dce_v10_0_pick_dig_encoder(struct drm_encoder *encoder)
 static u32 dce_v10_0_pick_pll(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 pll_in_use;
 	int pll;
@@ -2283,7 +2283,7 @@ static u32 dce_v10_0_pick_pll(struct drm_crtc *crtc)
 
 static void dce_v10_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 {
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	uint32_t cur_lock;
 
@@ -2298,7 +2298,7 @@ static void dce_v10_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 static void dce_v10_0_hide_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 	u32 tmp;
 
 	tmp = RREG32(mmCUR_CONTROL + amdgpu_crtc->crtc_offset);
@@ -2309,7 +2309,7 @@ static void dce_v10_0_hide_cursor(struct drm_crtc *crtc)
 static void dce_v10_0_show_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 	u32 tmp;
 
 	WREG32(mmCUR_SURFACE_ADDRESS_HIGH + amdgpu_crtc->crtc_offset,
@@ -2327,7 +2327,7 @@ static int dce_v10_0_cursor_move_locked(struct drm_crtc *crtc,
 					int x, int y)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 	int xorigin = 0, yorigin = 0;
 
 	amdgpu_crtc->cursor_x = x;
@@ -2500,7 +2500,7 @@ static const struct drm_crtc_funcs dce_v10_0_crtc_funcs = {
 
 static void dce_v10_0_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	unsigned type;
@@ -2554,7 +2554,7 @@ static void dce_v10_0_crtc_commit(struct drm_crtc *crtc)
 static void dce_v10_0_crtc_disable(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_atom_ss ss;
 	int i;
@@ -2635,7 +2635,7 @@ static bool dce_v10_0_crtc_mode_fixup(struct drm_crtc *crtc,
 				     struct drm_display_mode *adjusted_mode)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_encoder *encoder;
 
 	/* assign the encoder to the amdgpu crtc to avoid repeated lookups later */
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index c14b70350a51..a9b5549614b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -1866,7 +1866,7 @@ static const u32 vga_control_regs[6] =
 static void dce_v11_0_vga_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 vga_control;
 
@@ -1880,7 +1880,7 @@ static void dce_v11_0_vga_enable(struct drm_crtc *crtc, bool enable)
 static void dce_v11_0_grph_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	if (enable)
@@ -1894,7 +1894,7 @@ static int dce_v11_0_crtc_do_set_base(struct drm_crtc *crtc,
 				     int x, int y, int atomic)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_framebuffer *target_fb;
 	struct drm_gem_object *obj;
@@ -2138,7 +2138,7 @@ static int dce_v11_0_crtc_do_set_base(struct drm_crtc *crtc,
 static void dce_v11_0_set_interleave(struct drm_crtc *crtc,
 				     struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	u32 tmp;
@@ -2154,7 +2154,7 @@ static void dce_v11_0_set_interleave(struct drm_crtc *crtc,
 static void dce_v11_0_crtc_load_lut(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u16 *r, *g, *b;
 	int i;
@@ -2280,7 +2280,7 @@ static int dce_v11_0_pick_dig_encoder(struct drm_encoder *encoder)
 static u32 dce_v11_0_pick_pll(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 pll_in_use;
 	int pll;
@@ -2359,7 +2359,7 @@ static u32 dce_v11_0_pick_pll(struct drm_crtc *crtc)
 
 static void dce_v11_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 {
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	uint32_t cur_lock;
 
@@ -2374,7 +2374,7 @@ static void dce_v11_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 static void dce_v11_0_hide_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 	u32 tmp;
 
 	tmp = RREG32(mmCUR_CONTROL + amdgpu_crtc->crtc_offset);
@@ -2385,7 +2385,7 @@ static void dce_v11_0_hide_cursor(struct drm_crtc *crtc)
 static void dce_v11_0_show_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 	u32 tmp;
 
 	WREG32(mmCUR_SURFACE_ADDRESS_HIGH + amdgpu_crtc->crtc_offset,
@@ -2403,7 +2403,7 @@ static int dce_v11_0_cursor_move_locked(struct drm_crtc *crtc,
 					int x, int y)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 	int xorigin = 0, yorigin = 0;
 
 	amdgpu_crtc->cursor_x = x;
@@ -2576,7 +2576,7 @@ static const struct drm_crtc_funcs dce_v11_0_crtc_funcs = {
 
 static void dce_v11_0_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	unsigned type;
@@ -2630,7 +2630,7 @@ static void dce_v11_0_crtc_commit(struct drm_crtc *crtc)
 static void dce_v11_0_crtc_disable(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_atom_ss ss;
 	int i;
@@ -2700,7 +2700,7 @@ static int dce_v11_0_crtc_mode_set(struct drm_crtc *crtc,
 				  int x, int y, struct drm_framebuffer *old_fb)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	if (!amdgpu_crtc->adjusted_clock)
@@ -2740,7 +2740,7 @@ static bool dce_v11_0_crtc_mode_fixup(struct drm_crtc *crtc,
 				     struct drm_display_mode *adjusted_mode)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_encoder *encoder;
 
 	/* assign the encoder to the amdgpu crtc to avoid repeated lookups later */
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index 7f85ba5b726f..4c6a4d6cae02 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -1789,7 +1789,7 @@ static const u32 vga_control_regs[6] =
 static void dce_v6_0_vga_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 vga_control;
 
@@ -1800,7 +1800,7 @@ static void dce_v6_0_vga_enable(struct drm_crtc *crtc, bool enable)
 static void dce_v6_0_grph_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	WREG32(mmGRPH_ENABLE + amdgpu_crtc->crtc_offset, enable ? 1 : 0);
@@ -1811,7 +1811,7 @@ static int dce_v6_0_crtc_do_set_base(struct drm_crtc *crtc,
 				     int x, int y, int atomic)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_framebuffer *target_fb;
 	struct drm_gem_object *obj;
@@ -2033,7 +2033,7 @@ static int dce_v6_0_crtc_do_set_base(struct drm_crtc *crtc,
 static void dce_v6_0_set_interleave(struct drm_crtc *crtc,
 				    struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 
@@ -2048,7 +2048,7 @@ static void dce_v6_0_crtc_load_lut(struct drm_crtc *crtc)
 {
 
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u16 *r, *g, *b;
 	int i;
@@ -2148,7 +2148,7 @@ static int dce_v6_0_pick_dig_encoder(struct drm_encoder *encoder)
 static u32 dce_v6_0_pick_pll(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 pll_in_use;
 	int pll;
@@ -2178,7 +2178,7 @@ static u32 dce_v6_0_pick_pll(struct drm_crtc *crtc)
 
 static void dce_v6_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 {
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	uint32_t cur_lock;
 
@@ -2193,7 +2193,7 @@ static void dce_v6_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 static void dce_v6_0_hide_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 
 	WREG32(mmCUR_CONTROL + amdgpu_crtc->crtc_offset,
 	       (CURSOR_24_8_PRE_MULT << CUR_CONTROL__CURSOR_MODE__SHIFT) |
@@ -2205,7 +2205,7 @@ static void dce_v6_0_hide_cursor(struct drm_crtc *crtc)
 static void dce_v6_0_show_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 
 	WREG32(mmCUR_SURFACE_ADDRESS_HIGH + amdgpu_crtc->crtc_offset,
 	       upper_32_bits(amdgpu_crtc->cursor_addr));
@@ -2223,7 +2223,7 @@ static int dce_v6_0_cursor_move_locked(struct drm_crtc *crtc,
 				       int x, int y)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 	int xorigin = 0, yorigin = 0;
 
 	int w = amdgpu_crtc->cursor_width;
@@ -2397,7 +2397,7 @@ static const struct drm_crtc_funcs dce_v6_0_crtc_funcs = {
 
 static void dce_v6_0_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	unsigned type;
@@ -2447,7 +2447,7 @@ static void dce_v6_0_crtc_disable(struct drm_crtc *crtc)
 {
 
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_atom_ss ss;
 	int i;
@@ -2528,7 +2528,7 @@ static bool dce_v6_0_crtc_mode_fixup(struct drm_crtc *crtc,
 {
 
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_encoder *encoder;
 
 	/* assign the encoder to the amdgpu crtc to avoid repeated lookups later */
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index d421a268c9ff..b15152265909 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -1753,7 +1753,7 @@ static const u32 vga_control_regs[6] =
 static void dce_v8_0_vga_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 vga_control;
 
@@ -1767,7 +1767,7 @@ static void dce_v8_0_vga_enable(struct drm_crtc *crtc, bool enable)
 static void dce_v8_0_grph_enable(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
 	if (enable)
@@ -1781,7 +1781,7 @@ static int dce_v8_0_crtc_do_set_base(struct drm_crtc *crtc,
 				     int x, int y, int atomic)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct drm_framebuffer *target_fb;
 	struct drm_gem_object *obj;
@@ -2005,7 +2005,7 @@ static int dce_v8_0_crtc_do_set_base(struct drm_crtc *crtc,
 static void dce_v8_0_set_interleave(struct drm_crtc *crtc,
 				    struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 
@@ -2019,7 +2019,7 @@ static void dce_v8_0_set_interleave(struct drm_crtc *crtc,
 static void dce_v8_0_crtc_load_lut(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u16 *r, *g, *b;
 	int i;
@@ -2137,7 +2137,7 @@ static int dce_v8_0_pick_dig_encoder(struct drm_encoder *encoder)
 static u32 dce_v8_0_pick_pll(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	u32 pll_in_use;
 	int pll;
@@ -2186,7 +2186,7 @@ static u32 dce_v8_0_pick_pll(struct drm_crtc *crtc)
 
 static void dce_v8_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 {
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	uint32_t cur_lock;
 
@@ -2201,7 +2201,7 @@ static void dce_v8_0_lock_cursor(struct drm_crtc *crtc, bool lock)
 static void dce_v8_0_hide_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 
 	WREG32(mmCUR_CONTROL + amdgpu_crtc->crtc_offset,
 	       (CURSOR_24_8_PRE_MULT << CUR_CONTROL__CURSOR_MODE__SHIFT) |
@@ -2211,7 +2211,7 @@ static void dce_v8_0_hide_cursor(struct drm_crtc *crtc)
 static void dce_v8_0_show_cursor(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 
 	WREG32(mmCUR_SURFACE_ADDRESS_HIGH + amdgpu_crtc->crtc_offset,
 	       upper_32_bits(amdgpu_crtc->cursor_addr));
@@ -2228,7 +2228,7 @@ static int dce_v8_0_cursor_move_locked(struct drm_crtc *crtc,
 				       int x, int y)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 	int xorigin = 0, yorigin = 0;
 
 	amdgpu_crtc->cursor_x = x;
@@ -2401,7 +2401,7 @@ static const struct drm_crtc_funcs dce_v8_0_crtc_funcs = {
 
 static void dce_v8_0_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 	unsigned type;
@@ -2455,7 +2455,7 @@ static void dce_v8_0_crtc_commit(struct drm_crtc *crtc)
 static void dce_v8_0_crtc_disable(struct drm_crtc *crtc)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_atom_ss ss;
 	int i;
@@ -2543,7 +2543,7 @@ static bool dce_v8_0_crtc_mode_fixup(struct drm_crtc *crtc,
 				     struct drm_display_mode *adjusted_mode)
 {
 	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_encoder *encoder;
 
 	/* assign the encoder to the amdgpu crtc to avoid repeated lookups later */
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ff0a217b9d56..d4a4971b8f69 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -515,7 +515,7 @@ static void dm_vupdate_high_irq(void *interrupt_params)
 
 	if (acrtc) {
 		vrr_active = amdgpu_dm_crtc_vrr_active_irq(acrtc);
-		drm_dev = acrtc->base.dev;
+		drm_dev = acrtc->base.drm_dev;
 		vblank = &drm_dev->vblank[acrtc->base.index];
 		previous_timestamp = atomic64_read(&irq_params->previous_timestamp);
 		frame_duration_ns = vblank->time - previous_timestamp;
@@ -7760,7 +7760,7 @@ static void remove_stream(struct amdgpu_device *adev,
 static void prepare_flip_isr(struct amdgpu_crtc *acrtc)
 {
 
-	assert_spin_locked(&acrtc->base.dev->event_lock);
+	assert_spin_locked(&acrtc->base.drm_dev->event_lock);
 	WARN_ON(acrtc->event);
 
 	acrtc->event = acrtc->base.state->event;
@@ -8178,9 +8178,10 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			 * timing control and more opportunity to avoid stutter
 			 * on late submission of flips.
 			 */
-			spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
+			spin_lock_irqsave(&pcrtc->drm_dev->event_lock, flags);
 			last_flip_vblank = acrtc_attach->dm_irq_params.last_flip_vblank;
-			spin_unlock_irqrestore(&pcrtc->dev->event_lock, flags);
+			spin_unlock_irqrestore(&pcrtc->drm_dev->event_lock,
+					       flags);
 		}
 
 		target_vblank = last_flip_vblank + wait_for_vblank;
@@ -8212,12 +8213,13 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		    acrtc_state->active_planes > 0) {
 			drm_crtc_vblank_get(pcrtc);
 
-			spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
+			spin_lock_irqsave(&pcrtc->drm_dev->event_lock, flags);
 
 			WARN_ON(acrtc_attach->pflip_status != AMDGPU_FLIP_NONE);
 			prepare_flip_isr(acrtc_attach);
 
-			spin_unlock_irqrestore(&pcrtc->dev->event_lock, flags);
+			spin_unlock_irqrestore(&pcrtc->drm_dev->event_lock,
+					       flags);
 		}
 
 		if (acrtc_state->stream) {
@@ -8229,12 +8231,12 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		   acrtc_attach->base.state->event) {
 		drm_crtc_vblank_get(pcrtc);
 
-		spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
+		spin_lock_irqsave(&pcrtc->drm_dev->event_lock, flags);
 
 		acrtc_attach->event = acrtc_attach->base.state->event;
 		acrtc_attach->base.state->event = NULL;
 
-		spin_unlock_irqrestore(&pcrtc->dev->event_lock, flags);
+		spin_unlock_irqrestore(&pcrtc->drm_dev->event_lock, flags);
 	}
 
 	/* Update the planes if changed or disable if we don't have any. */
@@ -8282,11 +8284,12 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		 * as part of commit.
 		 */
 		if (is_dc_timing_adjust_needed(dm_old_crtc_state, acrtc_state)) {
-			spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
+			spin_lock_irqsave(&pcrtc->drm_dev->event_lock, flags);
 			dc_stream_adjust_vmin_vmax(
 				dm->dc, acrtc_state->stream,
 				&acrtc_attach->dm_irq_params.vrr_params.adjust);
-			spin_unlock_irqrestore(&pcrtc->dev->event_lock, flags);
+			spin_unlock_irqrestore(&pcrtc->drm_dev->event_lock,
+					       flags);
 		}
 		mutex_lock(&dm->dc_lock);
 		update_planes_and_stream_adapter(dm->dc,
@@ -9585,7 +9588,7 @@ static int dm_check_cursor_fb(struct amdgpu_crtc *new_acrtc,
 			      struct drm_plane_state *new_plane_state,
 			      struct drm_framebuffer *fb)
 {
-	struct amdgpu_device *adev = drm_to_adev(new_acrtc->base.dev);
+	struct amdgpu_device *adev = drm_to_adev(new_acrtc->base.drm_dev);
 	struct amdgpu_framebuffer *afb = to_amdgpu_framebuffer(fb);
 	unsigned int pitch;
 	bool linear;
@@ -9770,7 +9773,7 @@ static int dm_update_plane_state(struct dc *dc,
 				 plane->base.id, new_plane_crtc->base.id);
 
 		ret = fill_dc_plane_attributes(
-			drm_to_adev(new_plane_crtc->dev),
+			drm_to_adev(new_plane_crtc->drm_dev),
 			dc_new_plane_state,
 			new_plane_state,
 			new_crtc_state);
@@ -9877,7 +9880,7 @@ static int dm_check_crtc_cursor(struct drm_atomic_state *state,
 
 		if (cursor_scale_w != underlying_scale_w ||
 		    cursor_scale_h != underlying_scale_h) {
-			drm_dbg_atomic(crtc->dev,
+			drm_dbg_atomic(crtc->drm_dev,
 				       "Cursor [PLANE:%d:%s] scaling doesn't match underlying [PLANE:%d:%s]\n",
 				       cursor->base.id, cursor->name, underlying->base.id, underlying->name);
 			return -EINVAL;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
index 0802f8e8fac5..502ace480b99 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
@@ -85,7 +85,7 @@ const char *const *amdgpu_dm_crtc_get_crc_sources(struct drm_crtc *crtc,
 #ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
 static void amdgpu_dm_set_crc_window_default(struct drm_crtc *crtc, struct dc_stream_state *stream)
 {
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm_dev;
 	struct amdgpu_display_manager *dm = &drm_to_adev(drm_dev)->dm;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 	bool was_activated;
@@ -127,7 +127,7 @@ static void amdgpu_dm_crtc_notify_ta_to_read(struct work_struct *work)
 		return;
 	}
 
-	psp = &drm_to_adev(crtc->dev)->psp;
+	psp = &drm_to_adev(crtc->drm_dev)->psp;
 
 	if (!psp->securedisplay_context.context.initialized) {
 		DRM_DEBUG_DRIVER("Secure Display fails to notify PSP TA\n");
@@ -173,7 +173,7 @@ amdgpu_dm_forward_crc_window(struct work_struct *work)
 	if (!crtc)
 		return;
 
-	dm = &drm_to_adev(crtc->dev)->dm;
+	dm = &drm_to_adev(crtc->drm_dev)->dm;
 	stream = to_amdgpu_crtc(crtc)->dm_irq_params.stream;
 
 	mutex_lock(&dm->dc_lock);
@@ -183,7 +183,7 @@ amdgpu_dm_forward_crc_window(struct work_struct *work)
 
 bool amdgpu_dm_crc_window_is_activated(struct drm_crtc *crtc)
 {
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm_dev;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 	bool ret = false;
 
@@ -215,7 +215,7 @@ int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
 					struct dm_crtc_state *dm_crtc_state,
 					enum amdgpu_dm_pipe_crc_source source)
 {
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 	struct dc_stream_state *stream_state = dm_crtc_state->stream;
 	bool enable = amdgpu_dm_is_valid_crc_source(source);
 	int ret = 0;
@@ -259,7 +259,7 @@ int amdgpu_dm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 	enum amdgpu_dm_pipe_crc_source cur_crc_src;
 	struct drm_crtc_commit *commit;
 	struct dm_crtc_state *crtc_state;
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm_dev;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 	struct drm_dp_aux *aux = NULL;
 	bool enable = false;
@@ -323,7 +323,7 @@ int amdgpu_dm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 		struct drm_connector *connector;
 		struct drm_connector_list_iter conn_iter;
 
-		drm_connector_list_iter_begin(crtc->dev, &conn_iter);
+		drm_connector_list_iter_begin(crtc->drm_dev, &conn_iter);
 		drm_for_each_connector_iter(connector, &conn_iter) {
 			if (!connector->state || connector->state->crtc != crtc)
 				continue;
@@ -433,7 +433,7 @@ void amdgpu_dm_crtc_handle_crc_irq(struct drm_crtc *crtc)
 	crtc_state = to_dm_crtc_state(crtc->state);
 	stream_state = crtc_state->stream;
 	acrtc = to_amdgpu_crtc(crtc);
-	drm_dev = crtc->dev;
+	drm_dev = crtc->drm_dev;
 
 	spin_lock_irqsave(&drm_dev->event_lock, flags);
 	cur_crc_src = acrtc->dm_irq_params.crc_src;
@@ -478,8 +478,8 @@ void amdgpu_dm_crtc_handle_crc_window_irq(struct drm_crtc *crtc)
 		return;
 
 	acrtc = to_amdgpu_crtc(crtc);
-	adev = drm_to_adev(crtc->dev);
-	drm_dev = crtc->dev;
+	adev = drm_to_adev(crtc->drm_dev);
+	drm_dev = crtc->drm_dev;
 
 	spin_lock_irqsave(&drm_dev->event_lock, flags1);
 	cur_crc_src = acrtc->dm_irq_params.crc_src;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 440fc0869a34..791749d8bf7e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -37,7 +37,7 @@
 void amdgpu_dm_crtc_handle_vblank(struct amdgpu_crtc *acrtc)
 {
 	struct drm_crtc *crtc = &acrtc->base;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned long flags;
 
 	drm_crtc_handle_vblank(crtc);
@@ -74,7 +74,7 @@ int amdgpu_dm_crtc_set_vupdate_irq(struct drm_crtc *crtc, bool enable)
 {
 	enum dc_irq_source irq_source;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 	int rc;
 
 	if (acrtc->otg_inst == -1)
@@ -147,7 +147,7 @@ static void vblank_control_worker(struct work_struct *work)
 static inline int dm_set_vblank(struct drm_crtc *crtc, bool enable)
 {
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 	struct dm_crtc_state *acrtc_state = to_dm_crtc_state(crtc->state);
 	struct amdgpu_display_manager *dm = &adev->dm;
 	struct vblank_control_work *work;
@@ -372,7 +372,7 @@ static int dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 										crtc);
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 	struct dc *dc = adev->dm.dc;
 	struct dm_crtc_state *dm_crtc_state = to_dm_crtc_state(crtc_state);
 	int ret = -EINVAL;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index d63ee636483b..37f619eabb59 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -1008,7 +1008,7 @@ static int psr_capability_show(struct seq_file *m, void *data)
 static int amdgpu_current_bpc_show(struct seq_file *m, void *data)
 {
 	struct drm_crtc *crtc = m->private;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct dm_crtc_state *dm_crtc_state = NULL;
 	int res = -ENODEV;
 	unsigned int bpc;
@@ -1060,7 +1060,7 @@ DEFINE_SHOW_ATTRIBUTE(amdgpu_current_bpc);
 static int amdgpu_current_colorspace_show(struct seq_file *m, void *data)
 {
 	struct drm_crtc *crtc = m->private;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct dm_crtc_state *dm_crtc_state = NULL;
 	int res = -ENODEV;
 
@@ -3178,7 +3178,7 @@ void connector_debugfs_init(struct amdgpu_dm_connector *connector)
 static int crc_win_x_start_set(void *data, u64 val)
 {
 	struct drm_crtc *crtc = data;
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm_dev;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
@@ -3195,7 +3195,7 @@ static int crc_win_x_start_set(void *data, u64 val)
 static int crc_win_x_start_get(void *data, u64 *val)
 {
 	struct drm_crtc *crtc = data;
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm_dev;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
@@ -3215,7 +3215,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(crc_win_x_start_fops, crc_win_x_start_get,
 static int crc_win_y_start_set(void *data, u64 val)
 {
 	struct drm_crtc *crtc = data;
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm_dev;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
@@ -3232,7 +3232,7 @@ static int crc_win_y_start_set(void *data, u64 val)
 static int crc_win_y_start_get(void *data, u64 *val)
 {
 	struct drm_crtc *crtc = data;
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm_dev;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
@@ -3251,7 +3251,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(crc_win_y_start_fops, crc_win_y_start_get,
 static int crc_win_x_end_set(void *data, u64 val)
 {
 	struct drm_crtc *crtc = data;
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm_dev;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
@@ -3268,7 +3268,7 @@ static int crc_win_x_end_set(void *data, u64 val)
 static int crc_win_x_end_get(void *data, u64 *val)
 {
 	struct drm_crtc *crtc = data;
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm_dev;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
@@ -3287,7 +3287,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(crc_win_x_end_fops, crc_win_x_end_get,
 static int crc_win_y_end_set(void *data, u64 val)
 {
 	struct drm_crtc *crtc = data;
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm_dev;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
@@ -3304,7 +3304,7 @@ static int crc_win_y_end_set(void *data, u64 val)
 static int crc_win_y_end_get(void *data, u64 *val)
 {
 	struct drm_crtc *crtc = data;
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm_dev;
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
@@ -3323,7 +3323,7 @@ static int crc_win_update_set(void *data, u64 val)
 {
 	struct drm_crtc *crtc = data;
 	struct amdgpu_crtc *acrtc;
-	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_device *adev = drm_to_adev(crtc->drm_dev);
 
 	if (val) {
 		acrtc = to_amdgpu_crtc(crtc);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 322668973747..aa286a71b6c7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1020,7 +1020,7 @@ int amdgpu_dm_plane_helper_check_state(struct drm_plane_state *state,
 		}
 
 		/* Get min/max allowed scaling factors from plane caps. */
-		get_min_max_dc_plane_scaling(state->crtc->dev, fb,
+		get_min_max_dc_plane_scaling(state->crtc->drm_dev, fb,
 					     &min_downscale, &max_upscale);
 		/*
 		 * Convert to drm convention: 16.16 fixed point, instead of dc's
-- 
2.39.2

