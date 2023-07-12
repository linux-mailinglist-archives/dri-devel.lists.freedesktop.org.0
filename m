Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0CD7503C7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD7B10E4C1;
	Wed, 12 Jul 2023 09:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89F010E431
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:31 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRF-0001Nx-Oy; Wed, 12 Jul 2023 11:47:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRC-00Dr4w-PP; Wed, 12 Jul 2023 11:47:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRB-004GTQ-KV; Wed, 12 Jul 2023 11:47:09 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH RFC v1 24/52] drm/msm: Use struct drm_crtc::drm_dev instead of
 struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:34 +0200
Message-Id: <20230712094702.1770121-25-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=19657;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=VQG15DFowrVWE8JyLfc0TKgexFlTmbe28KFNFHyLyjA=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZyQO1+RjcXv2U/8kwsfICkIdvqQaN83Zacg
 A6AzKWDvJaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52cgAKCRCPgPtYfRL+
 Trj9CACo4TAecOkYVCGE/2kz3gNKcWDD9RAVpBN7CAm6rTqB75PweedEjzkCdL8C3HFUikORkRZ
 i10t4KFZli0DooZvTCoqnFa/+A6GmERgnuAvkSdd47avtbtrUZcKaPP/4v4hqvozlXIj9SXudCe
 6GeIq6gsPkgBfaNysUj12WnIMd2OwNuHZDqg5pmQ4x3ZAP0kpT2bLnTEtGRt0/LVkVHX6+2iNmW
 pI37prkiahQ481T85XduvF0/JUJhc7Kp5JbNYa1c/sZ+RjFD3ZK4K+5lUx4ZwnWZ2sKbqfKjkrG
 15Cjoxet4hbsOGrKi53JY0UzQzqrK1FbqBkhPSahC2rAF0ks
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
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 70 +++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     | 12 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     | 20 +++---
 drivers/gpu/drm/msm/msm_drv.c                 |  4 +-
 6 files changed, 62 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 1d9d83d7b99e..a71169776690 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -102,7 +102,7 @@ static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
 static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
 {
 	struct msm_drm_private *priv;
-	priv = crtc->dev->dev_private;
+	priv = crtc->drm_dev->dev_private;
 	return to_dpu_kms(priv->kms);
 }
 
@@ -171,7 +171,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	bw_sum_of_intfs = dpu_cstate->new_perf.bw_ctl;
 	curr_client_type = dpu_crtc_get_client_type(crtc);
 
-	drm_for_each_crtc(tmp_crtc, crtc->dev) {
+	drm_for_each_crtc(tmp_crtc, crtc->drm_dev) {
 		if (tmp_crtc->enabled &&
 		    (dpu_crtc_get_client_type(tmp_crtc) ==
 				curr_client_type) && (tmp_crtc != crtc)) {
@@ -217,7 +217,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	int i, ret = 0;
 	u64 avg_bw;
 
-	drm_for_each_crtc(tmp_crtc, crtc->dev) {
+	drm_for_each_crtc(tmp_crtc, crtc->drm_dev) {
 		if (tmp_crtc->enabled &&
 			curr_client_type ==
 				dpu_crtc_get_client_type(tmp_crtc)) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 1edf2b6b0a26..ca9a95a0b028 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -46,7 +46,7 @@
 
 static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
 {
-	struct msm_drm_private *priv = crtc->dev->dev_private;
+	struct msm_drm_private *priv = crtc->drm_dev->dev_private;
 
 	return to_dpu_kms(priv->kms);
 }
@@ -64,7 +64,7 @@ static void dpu_crtc_destroy(struct drm_crtc *crtc)
 
 static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_encoder *encoder;
 
 	drm_for_each_encoder(encoder, dev)
@@ -106,7 +106,7 @@ static int dpu_crtc_verify_crc_source(struct drm_crtc *crtc,
 
 		*values_cnt = 0;
 
-		drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask)
+		drm_for_each_encoder_mask(drm_enc, crtc->drm_dev, crtc->state->encoder_mask)
 			*values_cnt += dpu_encoder_get_crc_values_cnt(drm_enc);
 	}
 
@@ -133,7 +133,8 @@ static void dpu_crtc_setup_encoder_misr(struct drm_crtc *crtc)
 {
 	struct drm_encoder *drm_enc;
 
-	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask)
+	drm_for_each_encoder_mask(drm_enc, crtc->drm_dev,
+				  crtc->state->encoder_mask)
 		dpu_encoder_setup_misr(drm_enc);
 }
 
@@ -142,7 +143,7 @@ static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 	enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
 	enum dpu_crtc_crc_source current_source;
 	struct dpu_crtc_state *crtc_state;
-	struct drm_device *drm_dev = crtc->dev;
+	struct drm_device *drm_dev = crtc->drm_dev;
 
 	bool was_enabled;
 	bool enable = false;
@@ -244,7 +245,8 @@ static int dpu_crtc_get_encoder_crc(struct drm_crtc *crtc)
 	int rc, pos = 0;
 	u32 crcs[INTF_MAX];
 
-	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc->state->encoder_mask) {
+	drm_for_each_encoder_mask(drm_enc, crtc->drm_dev,
+				  crtc->state->encoder_mask) {
 		rc = dpu_encoder_get_crc(drm_enc, crcs, pos);
 		if (rc < 0) {
 			if (rc != -ENODATA)
@@ -569,7 +571,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 static void _dpu_crtc_complete_flip(struct drm_crtc *crtc)
 {
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->event_lock, flags);
@@ -599,7 +601,8 @@ enum dpu_intf_mode dpu_crtc_get_intf_mode(struct drm_crtc *crtc)
 	WARN_ON(!drm_modeset_is_locked(&crtc->mutex));
 
 	/* TODO: Returns the first INTF_MODE, could there be multiple values? */
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
+	drm_for_each_encoder_mask(encoder, crtc->drm_dev,
+				  crtc->state->encoder_mask)
 		return dpu_encoder_get_intf_mode(encoder);
 
 	return INTF_MODE_NONE;
@@ -692,7 +695,7 @@ static void dpu_crtc_frame_event_cb(void *data, u32 event)
 		return;
 
 	dpu_crtc = to_dpu_crtc(crtc);
-	priv = crtc->dev->dev_private;
+	priv = crtc->drm_dev->dev_private;
 	crtc_id = drm_crtc_index(crtc);
 
 	trace_dpu_crtc_frame_event_cb(DRMID(crtc), event);
@@ -817,7 +820,8 @@ static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
 	_dpu_crtc_setup_lm_bounds(crtc, crtc->state);
 
 	/* encoder will trigger pending mask now */
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
+	drm_for_each_encoder_mask(encoder, crtc->drm_dev,
+				  crtc->state->encoder_mask)
 		dpu_encoder_trigger_kickoff_pending(encoder);
 
 	/*
@@ -861,7 +865,7 @@ static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
 
 	dpu_crtc = to_dpu_crtc(crtc);
 	cstate = to_dpu_crtc_state(crtc->state);
-	dev = crtc->dev;
+	dev = crtc->drm_dev;
 	priv = dev->dev_private;
 
 	if (crtc->index >= ARRAY_SIZE(priv->event_thread)) {
@@ -956,8 +960,8 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
 
 	DPU_ATRACE_BEGIN("crtc_commit");
 
-	drm_for_each_encoder_mask(encoder, crtc->dev,
-			crtc->state->encoder_mask) {
+	drm_for_each_encoder_mask(encoder, crtc->drm_dev,
+				  crtc->state->encoder_mask) {
 		if (!dpu_encoder_is_valid_for_commit(encoder)) {
 			DRM_DEBUG_ATOMIC("invalid FB not kicking off crtc\n");
 			goto end;
@@ -967,7 +971,7 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
 	 * Encoder will flush/start now, unless it has a tx pending. If so, it
 	 * may delay and flush at an irq event (e.g. ppdone)
 	 */
-	drm_for_each_encoder_mask(encoder, crtc->dev,
+	drm_for_each_encoder_mask(encoder, crtc->drm_dev,
 				  crtc->state->encoder_mask)
 		dpu_encoder_prepare_for_kickoff(encoder);
 
@@ -981,7 +985,8 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
 
 	dpu_vbif_clear_errors(dpu_kms);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
+	drm_for_each_encoder_mask(encoder, crtc->drm_dev,
+				  crtc->state->encoder_mask)
 		dpu_encoder_kickoff(encoder);
 
 	reinit_completion(&dpu_crtc->frame_done_comp);
@@ -1055,8 +1060,8 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 	 * it won't trigger a warn while assigning crtc.
 	 */
 	if (old_crtc_state->self_refresh_active) {
-		drm_for_each_encoder_mask(encoder, crtc->dev,
-					old_crtc_state->encoder_mask) {
+		drm_for_each_encoder_mask(encoder, crtc->drm_dev,
+					  old_crtc_state->encoder_mask) {
 			dpu_encoder_assign_crtc(encoder, NULL);
 		}
 		return;
@@ -1065,7 +1070,7 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 	/* Disable/save vblank irq handling */
 	drm_crtc_vblank_off(crtc);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev,
+	drm_for_each_encoder_mask(encoder, crtc->drm_dev,
 				  old_crtc_state->encoder_mask) {
 		/* in video mode, we hold an extra bandwidth reference
 		 * as we cannot drop bandwidth at frame-done if any
@@ -1102,7 +1107,8 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 
 	dpu_core_perf_crtc_update(crtc, 0, true);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
+	drm_for_each_encoder_mask(encoder, crtc->drm_dev,
+				  crtc->state->encoder_mask)
 		dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
 
 	memset(cstate->mixers, 0, sizeof(cstate->mixers));
@@ -1113,13 +1119,13 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 	cstate->bw_split_vote = false;
 
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irqsave(&crtc->dev->event_lock, flags);
+		spin_lock_irqsave(&crtc->drm_dev->event_lock, flags);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
 		crtc->state->event = NULL;
-		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+		spin_unlock_irqrestore(&crtc->drm_dev->event_lock, flags);
 	}
 
-	pm_runtime_put_sync(crtc->dev->dev);
+	pm_runtime_put_sync(crtc->drm_dev->dev);
 }
 
 static void dpu_crtc_enable(struct drm_crtc *crtc,
@@ -1132,11 +1138,12 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 
 	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
 
-	pm_runtime_get_sync(crtc->dev->dev);
+	pm_runtime_get_sync(crtc->drm_dev->dev);
 
 	DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask) {
+	drm_for_each_encoder_mask(encoder, crtc->drm_dev,
+				  crtc->state->encoder_mask) {
 		/* in video mode, we hold an extra bandwidth reference
 		 * as we cannot drop bandwidth at frame-done if any
 		 * crtc is being used in video mode.
@@ -1154,7 +1161,8 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 	dpu_crtc->enabled = true;
 
 	if (!old_crtc_state->self_refresh_active) {
-		drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
+		drm_for_each_encoder_mask(encoder, crtc->drm_dev,
+					  crtc->state->encoder_mask)
 			dpu_encoder_assign_crtc(encoder, crtc);
 	}
 
@@ -1170,7 +1178,8 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
 	if (cstate->self_refresh_active)
 		return true;
 
-	drm_for_each_encoder_mask (encoder, crtc->dev, cstate->encoder_mask) {
+	drm_for_each_encoder_mask (encoder, crtc->drm_dev,
+				   cstate->encoder_mask) {
 		if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_CMD) {
 			return true;
 		}
@@ -1262,7 +1271,8 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 	 * about the assigned crtcs being inconsistent with the current state
 	 * (which means no need to worry about modeset locks).
 	 */
-	list_for_each_entry(enc, &crtc->dev->mode_config.encoder_list, head) {
+	list_for_each_entry(enc, &crtc->drm_dev->mode_config.encoder_list,
+			    head) {
 		trace_dpu_crtc_vblank_enable(DRMID(crtc), DRMID(enc), en,
 					     dpu_crtc);
 
@@ -1291,7 +1301,7 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 	dpu_crtc = s->private;
 	crtc = &dpu_crtc->base;
 
-	drm_modeset_lock_all(crtc->dev);
+	drm_modeset_lock_all(crtc->drm_dev);
 	cstate = to_dpu_crtc_state(crtc->state);
 
 	mode = &crtc->state->adjusted_mode;
@@ -1383,7 +1393,7 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 		dpu_crtc->vblank_cb_time = ktime_set(0, 0);
 	}
 
-	drm_modeset_unlock_all(crtc->dev);
+	drm_modeset_unlock_all(crtc->drm_dev);
 
 	return 0;
 }
@@ -1474,7 +1484,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 		return ERR_PTR(-ENOMEM);
 
 	crtc = &dpu_crtc->base;
-	crtc->dev = dev;
+	crtc->drm_dev = dev;
 
 	spin_lock_init(&dpu_crtc->spin_lock);
 	atomic_set(&dpu_crtc->frame_pending, 0);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index aa8499de1b9f..eb2442dba92f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -468,7 +468,7 @@ static void dpu_kms_wait_for_commit_done(struct msm_kms *kms,
 		return;
 	}
 
-	dev = crtc->dev;
+	dev = crtc->drm_dev;
 
 	if (!crtc->state->enable) {
 		DPU_DEBUG("[crtc:%d] not enable\n", crtc->base.id);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 169f9de4a12a..dcfe20fe78cc 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -61,7 +61,7 @@ struct mdp4_crtc {
 
 static struct mdp4_kms *get_kms(struct drm_crtc *crtc)
 {
-	struct msm_drm_private *priv = crtc->dev->dev_private;
+	struct msm_drm_private *priv = crtc->drm_dev->dev_private;
 	return to_mdp4_kms(to_mdp_kms(priv->kms));
 }
 
@@ -98,7 +98,7 @@ static void crtc_flush(struct drm_crtc *crtc)
 static void complete_flip(struct drm_crtc *crtc, struct drm_file *file)
 {
 	struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_pending_vblank_event *event;
 	unsigned long flags;
 
@@ -327,7 +327,7 @@ static void mdp4_crtc_atomic_flush(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
 	struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned long flags;
 
 	DBG("%s: event: %p", mdp4_crtc->name, crtc->state->event);
@@ -407,7 +407,7 @@ static int mdp4_crtc_cursor_set(struct drm_crtc *crtc,
 	struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
 	struct mdp4_kms *mdp4_kms = get_kms(crtc);
 	struct msm_kms *kms = &mdp4_kms->base.base;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_gem_object *cursor_bo, *old_bo;
 	unsigned long flags;
 	uint64_t iova;
@@ -499,7 +499,7 @@ static void mdp4_crtc_vblank_irq(struct mdp_irq *irq, uint32_t irqstatus)
 {
 	struct mdp4_crtc *mdp4_crtc = container_of(irq, struct mdp4_crtc, vblank);
 	struct drm_crtc *crtc = &mdp4_crtc->base;
-	struct msm_drm_private *priv = crtc->dev->dev_private;
+	struct msm_drm_private *priv = crtc->drm_dev->dev_private;
 	unsigned pending;
 
 	mdp_irq_unregister(&get_kms(crtc)->base, &mdp4_crtc->vblank);
@@ -526,7 +526,7 @@ static void mdp4_crtc_err_irq(struct mdp_irq *irq, uint32_t irqstatus)
 
 static void mdp4_crtc_wait_for_flush_done(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
 	struct mdp4_kms *mdp4_kms = get_kms(crtc);
 	int ret;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 86036dd4e1e8..0718eea32ecc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -69,7 +69,7 @@ static void mdp5_crtc_restore_cursor(struct drm_crtc *crtc);
 
 static struct mdp5_kms *get_kms(struct drm_crtc *crtc)
 {
-	struct msm_drm_private *priv = crtc->dev->dev_private;
+	struct msm_drm_private *priv = crtc->drm_dev->dev_private;
 	return to_mdp5_kms(to_mdp_kms(priv->kms));
 }
 
@@ -140,7 +140,7 @@ static void complete_flip(struct drm_crtc *crtc, struct drm_file *file)
 	struct mdp5_pipeline *pipeline = &mdp5_cstate->pipeline;
 	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
 	struct mdp5_ctl *ctl = mdp5_cstate->ctl;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_pending_vblank_event *event;
 	unsigned long flags;
 
@@ -412,7 +412,7 @@ static void mdp5_crtc_mode_set_nofb(struct drm_crtc *crtc)
 
 static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_encoder *encoder;
 
 	drm_for_each_encoder(encoder, dev)
@@ -701,7 +701,7 @@ static int mdp5_crtc_atomic_check(struct drm_crtc *crtc,
 	struct mdp5_interface *intf = mdp5_cstate->pipeline.intf;
 	struct mdp5_kms *mdp5_kms = get_kms(crtc);
 	struct drm_plane *plane;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct plane_state pstates[STAGE_MAX + 1];
 	const struct mdp5_cfg_hw *hw_cfg;
 	const struct drm_plane_state *pstate;
@@ -800,7 +800,7 @@ static void mdp5_crtc_atomic_flush(struct drm_crtc *crtc,
 {
 	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
 	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned long flags;
 
 	DBG("%s: event: %p", crtc->name, crtc->state->event);
@@ -954,7 +954,7 @@ static int mdp5_crtc_cursor_set(struct drm_crtc *crtc,
 	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
 	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
 	struct mdp5_pipeline *pipeline = &mdp5_cstate->pipeline;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct mdp5_kms *mdp5_kms = get_kms(crtc);
 	struct platform_device *pdev = mdp5_kms->pdev;
 	struct msm_kms *kms = &mdp5_kms->base.base;
@@ -1042,7 +1042,7 @@ static int mdp5_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
 	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
 	uint32_t flush_mask = mdp_ctl_flush_mask_cursor(0);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	uint32_t roi_w;
 	uint32_t roi_h;
 	unsigned long flags;
@@ -1189,7 +1189,7 @@ static void mdp5_crtc_vblank_irq(struct mdp_irq *irq, uint32_t irqstatus)
 {
 	struct mdp5_crtc *mdp5_crtc = container_of(irq, struct mdp5_crtc, vblank);
 	struct drm_crtc *crtc = &mdp5_crtc->base;
-	struct msm_drm_private *priv = crtc->dev->dev_private;
+	struct msm_drm_private *priv = crtc->drm_dev->dev_private;
 	unsigned pending;
 
 	mdp_irq_unregister(&get_kms(crtc)->base, &mdp5_crtc->vblank);
@@ -1221,7 +1221,7 @@ static void mdp5_crtc_pp_done_irq(struct mdp_irq *irq, uint32_t irqstatus)
 
 static void mdp5_crtc_wait_for_pp_done(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
 	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
 	int ret;
@@ -1235,7 +1235,7 @@ static void mdp5_crtc_wait_for_pp_done(struct drm_crtc *crtc)
 
 static void mdp5_crtc_wait_for_flush_done(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
 	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
 	struct mdp5_ctl *ctl = mdp5_cstate->ctl;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 891eff8433a9..92d3a803b814 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -638,7 +638,7 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 
 int msm_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = crtc->index;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
@@ -650,7 +650,7 @@ int msm_crtc_enable_vblank(struct drm_crtc *crtc)
 
 void msm_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = crtc->index;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
-- 
2.39.2

