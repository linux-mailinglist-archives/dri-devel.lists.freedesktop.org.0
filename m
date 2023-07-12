Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A647503C8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3D710E431;
	Wed, 12 Jul 2023 09:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0657E10E431
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:48:24 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRC-0001KP-T5; Wed, 12 Jul 2023 11:47:11 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRB-00Dr4E-Aw; Wed, 12 Jul 2023 11:47:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR9-004GSo-Tx; Wed, 12 Jul 2023 11:47:08 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Matt Roper <matthew.d.roper@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Luca Coelho <luciano.coelho@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 =?utf-8?q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, Imre Deak <imre.deak@intel.com>,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 Mika Kahola <mika.kahola@intel.com>,
 =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Fei Yang <fei.yang@intel.com>, Animesh Manna <animesh.manna@intel.com>,
 Deepak R Varma <drv@mailo.com>, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Drew Davenport <ddavenport@chromium.org>
Subject: [PATCH RFC v1 15/52] drm/i915: Use struct drm_crtc::drm_dev instead
 of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:25 +0200
Message-Id: <20230712094702.1770121-16-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=181103;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Cz1eBrSPjBOKC7ulBbbthpNls1YvWiY9kjXC6N8NTQs=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZndIPzGk3NeSrg1yljVi2telB1RAoEmVU82
 JEsI1/Z/LaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52ZwAKCRCPgPtYfRL+
 ThCjB/97HIrrqlK8TxWyPdpPfwPzgRLwC4+Z1Ab0BZcUZl4+gxis66sjJOw8lshrhx6cj5qpu8h
 uvf6vC3V5uJQjc2Ucl1Taz135uIZ41eLno6QM1VzeniJ/x6FdqL3tBK/a5uz/LWJN6JrIGFwZ4O
 M33wJlHoHamF1GGzfEuQj/wLAL44u2rlUdPRjG6oWvbON65SX7rNLFLzDoK9aY0/NtRnZiZXWSZ
 AUUvH47l6DmYY1BWEdqG5YY9cZVKQlqdhaSyTvL4bA4YXVRARFT7ePv1Ud72rKqbG6Q756UW5O+
 WQBOVDxOkI6iN7WV+hd43IW7/6CIvrnqyxFCp1/O8T9vkkxi
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
Cc: intel-gfx@lists.freedesktop.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/i915/display/g4x_dp.c         |   4 +-
 drivers/gpu/drm/i915/display/hsw_ips.c        |  16 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c     |   4 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c        |  40 ++---
 drivers/gpu/drm/i915/display/icl_dsi.c        |   2 +-
 drivers/gpu/drm/i915/display/intel_atomic.c   |   2 +-
 .../gpu/drm/i915/display/intel_atomic_plane.c |   4 +-
 drivers/gpu/drm/i915/display/intel_audio.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_bw.c       |  10 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |   6 +-
 drivers/gpu/drm/i915/display/intel_color.c    | 124 +++++++-------
 drivers/gpu/drm/i915/display/intel_crtc.c     |  20 +--
 .../drm/i915/display/intel_crtc_state_dump.c  |   4 +-
 drivers/gpu/drm/i915/display/intel_cursor.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |  28 ++--
 drivers/gpu/drm/i915/display/intel_display.c  | 154 +++++++++---------
 .../gpu/drm/i915/display/intel_display_irq.c  |  22 +--
 .../gpu/drm/i915/display/intel_display_rps.c  |   2 +-
 .../drm/i915/display/intel_display_trace.h    |  12 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_dpll.c     |  38 ++---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  44 ++---
 drivers/gpu/drm/i915/display/intel_dpt.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_drrs.c     |  10 +-
 drivers/gpu/drm/i915/display/intel_dsb.c      |   8 +-
 drivers/gpu/drm/i915/display/intel_fbc.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_fdi.c      |  22 +--
 .../drm/i915/display/intel_fifo_underrun.c    |   6 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |   2 +-
 .../drm/i915/display/intel_modeset_setup.c    |  22 +--
 .../drm/i915/display/intel_modeset_verify.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_panel.c    |   4 +-
 .../gpu/drm/i915/display/intel_pch_display.c  |  32 ++--
 .../gpu/drm/i915/display/intel_pch_refclk.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c |  10 +-
 .../drm/i915/display/intel_plane_initial.c    |   6 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  14 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_vblank.c   |  24 +--
 drivers/gpu/drm/i915/display/intel_vdsc.c     |  18 +-
 drivers/gpu/drm/i915/display/intel_vrr.c      |  18 +-
 drivers/gpu/drm/i915/display/skl_scaler.c     |  10 +-
 .../drm/i915/display/skl_universal_plane.c    |   6 +-
 drivers/gpu/drm/i915/display/skl_watermark.c  |  42 ++---
 drivers/gpu/drm/i915/display/vlv_dsi.c        |   2 +-
 45 files changed, 407 insertions(+), 401 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/g4x_dp.c b/drivers/gpu/drm/i915/display/g4x_dp.c
index 112d91d81fdc..93567074e02f 100644
--- a/drivers/gpu/drm/i915/display/g4x_dp.c
+++ b/drivers/gpu/drm/i915/display/g4x_dp.c
@@ -191,7 +191,7 @@ static void ilk_edp_pll_on(struct intel_dp *intel_dp,
 			   const struct intel_crtc_state *pipe_config)
 {
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	assert_transcoder_disabled(dev_priv, pipe_config->cpu_transcoder);
 	assert_dp_port_disabled(intel_dp);
@@ -231,7 +231,7 @@ static void ilk_edp_pll_off(struct intel_dp *intel_dp,
 			    const struct intel_crtc_state *old_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	assert_transcoder_disabled(dev_priv, old_crtc_state->cpu_transcoder);
 	assert_dp_port_disabled(intel_dp);
diff --git a/drivers/gpu/drm/i915/display/hsw_ips.c b/drivers/gpu/drm/i915/display/hsw_ips.c
index 8eca0de065b6..f838f3920377 100644
--- a/drivers/gpu/drm/i915/display/hsw_ips.c
+++ b/drivers/gpu/drm/i915/display/hsw_ips.c
@@ -13,7 +13,7 @@
 static void hsw_ips_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	u32 val;
 
 	if (!crtc_state->ips_enabled)
@@ -60,7 +60,7 @@ static void hsw_ips_enable(const struct intel_crtc_state *crtc_state)
 bool hsw_ips_disable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	bool need_vblank_wait = false;
 
 	if (!crtc_state->ips_enabled)
@@ -180,13 +180,13 @@ void hsw_ips_post_update(struct intel_atomic_state *state,
 /* IPS only exists on ULT machines and is tied to pipe A. */
 bool hsw_crtc_supports_ips(struct intel_crtc *crtc)
 {
-	return HAS_IPS(to_i915(crtc->base.dev)) && crtc->pipe == PIPE_A;
+	return HAS_IPS(to_i915(crtc->base.drm_dev)) && crtc->pipe == PIPE_A;
 }
 
 bool hsw_crtc_state_ips_capable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	/* IPS only exists on ULT machines and is tied to pipe A. */
 	if (!hsw_crtc_supports_ips(crtc))
@@ -257,7 +257,7 @@ int hsw_ips_compute_config(struct intel_atomic_state *state,
 void hsw_ips_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	if (!hsw_crtc_supports_ips(crtc))
 		return;
@@ -277,7 +277,7 @@ void hsw_ips_get_config(struct intel_crtc_state *crtc_state)
 static int hsw_ips_debugfs_false_color_get(void *data, u64 *val)
 {
 	struct intel_crtc *crtc = data;
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	*val = i915->display.ips.false_color;
 
@@ -287,7 +287,7 @@ static int hsw_ips_debugfs_false_color_get(void *data, u64 *val)
 static int hsw_ips_debugfs_false_color_set(void *data, u64 val)
 {
 	struct intel_crtc *crtc = data;
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct intel_crtc_state *crtc_state;
 	int ret;
 
@@ -322,7 +322,7 @@ DEFINE_DEBUGFS_ATTRIBUTE(hsw_ips_debugfs_false_color_fops,
 static int hsw_ips_debugfs_status_show(struct seq_file *m, void *unused)
 {
 	struct intel_crtc *crtc = m->private;
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	intel_wakeref_t wakeref;
 
 	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index b10488324457..dd5764e2e411 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -352,7 +352,7 @@ i9xx_plane_check(struct intel_crtc_state *crtc_state,
 static u32 i9xx_plane_ctl_crtc(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	u32 dspcntr = 0;
 
 	if (crtc_state->gamma_enable)
@@ -975,7 +975,7 @@ void
 i9xx_get_initial_plane_config(struct intel_crtc *crtc,
 			      struct intel_initial_plane_config *plane_config)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_plane *plane = to_intel_plane(crtc->base.primary);
 	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i915/display/i9xx_wm.c
index af0c79a4c9a4..b89dcb9f0b3a 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.c
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
@@ -262,7 +262,7 @@ static const int pessimal_latency_ns = 5000;
 static void vlv_get_fifo_size(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct vlv_fifo_state *fifo_state = &crtc_state->wm.vlv.fifo_state;
 	enum pipe pipe = crtc->pipe;
 	int sprite0_start, sprite1_start;
@@ -929,7 +929,7 @@ static u16 g4x_compute_wm(const struct intel_crtc_state *crtc_state,
 static bool g4x_raw_plane_wm_set(struct intel_crtc_state *crtc_state,
 				 int level, enum plane_id plane_id, u16 value)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	bool dirty = false;
 
 	for (; level < dev_priv->display.wm.num_levels; level++) {
@@ -945,7 +945,7 @@ static bool g4x_raw_plane_wm_set(struct intel_crtc_state *crtc_state,
 static bool g4x_raw_fbc_wm_set(struct intel_crtc_state *crtc_state,
 			       int level, u16 value)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	bool dirty = false;
 
 	/* NORMAL level doesn't have an FBC watermark */
@@ -969,7 +969,7 @@ static bool g4x_raw_plane_wm_compute(struct intel_crtc_state *crtc_state,
 				     const struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	enum plane_id plane_id = plane->id;
 	bool dirty = false;
 	int level;
@@ -1049,7 +1049,7 @@ static bool g4x_raw_plane_wm_is_valid(const struct intel_crtc_state *crtc_state,
 static bool g4x_raw_crtc_wm_is_valid(const struct intel_crtc_state *crtc_state,
 				     int level)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	if (level >= dev_priv->display.wm.num_levels)
 		return false;
@@ -1193,7 +1193,7 @@ static int g4x_compute_pipe_wm(struct intel_atomic_state *state,
 static int g4x_compute_intermediate_wm(struct intel_atomic_state *state,
 				       struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_crtc_state *old_crtc_state =
@@ -1340,7 +1340,7 @@ static void g4x_program_watermarks(struct drm_i915_private *dev_priv)
 static void g4x_initial_watermarks(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
@@ -1353,7 +1353,7 @@ static void g4x_initial_watermarks(struct intel_atomic_state *state,
 static void g4x_optimize_watermarks(struct intel_atomic_state *state,
 				    struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
@@ -1443,7 +1443,7 @@ static bool vlv_need_sprite0_fifo_workaround(unsigned int active_planes)
 static int vlv_compute_fifo(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	const struct g4x_pipe_wm *raw =
 		&crtc_state->wm.vlv.raw[VLV_WM_LEVEL_PM2];
 	struct vlv_fifo_state *fifo_state = &crtc_state->wm.vlv.fifo_state;
@@ -1527,7 +1527,7 @@ static int vlv_compute_fifo(struct intel_crtc_state *crtc_state)
 static void vlv_invalidate_wms(struct intel_crtc *crtc,
 			       struct vlv_wm_state *wm_state, int level)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	for (; level < dev_priv->display.wm.num_levels; level++) {
 		enum plane_id plane_id;
@@ -1555,7 +1555,7 @@ static u16 vlv_invert_wm_value(u16 wm, u16 fifo_size)
 static bool vlv_raw_plane_wm_set(struct intel_crtc_state *crtc_state,
 				 int level, enum plane_id plane_id, u16 value)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	bool dirty = false;
 
 	for (; level < dev_priv->display.wm.num_levels; level++) {
@@ -1572,7 +1572,7 @@ static bool vlv_raw_plane_wm_compute(struct intel_crtc_state *crtc_state,
 				     const struct intel_plane_state *plane_state)
 {
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	enum plane_id plane_id = plane->id;
 	int level;
 	bool dirty = false;
@@ -1631,7 +1631,7 @@ static bool vlv_raw_crtc_wm_is_valid(const struct intel_crtc_state *crtc_state,
 static int _vlv_compute_pipe_wm(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct vlv_wm_state *wm_state = &crtc_state->wm.vlv.optimal;
 	const struct vlv_fifo_state *fifo_state =
 		&crtc_state->wm.vlv.fifo_state;
@@ -1751,7 +1751,7 @@ static int vlv_compute_pipe_wm(struct intel_atomic_state *state,
 static void vlv_atomic_update_fifo(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_uncore *uncore = &dev_priv->uncore;
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
@@ -1977,7 +1977,7 @@ static void vlv_program_watermarks(struct drm_i915_private *dev_priv)
 static void vlv_initial_watermarks(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
@@ -1990,7 +1990,7 @@ static void vlv_initial_watermarks(struct intel_atomic_state *state,
 static void vlv_optimize_watermarks(struct intel_atomic_state *state,
 				    struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
@@ -2862,7 +2862,7 @@ static int ilk_compute_pipe_wm(struct intel_atomic_state *state,
 static int ilk_compute_intermediate_wm(struct intel_atomic_state *state,
 				       struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_crtc_state *old_crtc_state =
@@ -3312,7 +3312,7 @@ static void ilk_program_watermarks(struct drm_i915_private *dev_priv)
 static void ilk_initial_watermarks(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
@@ -3325,7 +3325,7 @@ static void ilk_initial_watermarks(struct intel_atomic_state *state,
 static void ilk_optimize_watermarks(struct intel_atomic_state *state,
 				    struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
@@ -3340,7 +3340,7 @@ static void ilk_optimize_watermarks(struct intel_atomic_state *state,
 
 static void ilk_pipe_wm_get_hw_state(struct intel_crtc *crtc)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct ilk_wm_values *hw = &dev_priv->display.wm.hw;
 	struct intel_crtc_state *crtc_state = to_intel_crtc_state(crtc->base.state);
diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index c133928a0655..e7c78aacaa94 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -207,7 +207,7 @@ static int dsi_send_pkt_hdr(struct intel_dsi_host *host,
 void icl_dsi_frame_update(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	u32 mode_flags;
 	enum port port;
 
diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 7cf51dd8c056..7ce594b8e3df 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -303,7 +303,7 @@ intel_crtc_destroy_state(struct drm_crtc *crtc,
 {
 	struct intel_crtc_state *crtc_state = to_intel_crtc_state(state);
 
-	drm_WARN_ON(crtc->dev, crtc_state->dsb);
+	drm_WARN_ON(crtc->drm_dev, crtc_state->dsb);
 
 	__drm_atomic_helper_crtc_destroy_state(&crtc_state->uapi);
 	intel_crtc_free_hw_state(crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 7d9578ebae55..1a6a7113ff95 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -475,7 +475,7 @@ static int intel_plane_atomic_calc_changes(const struct intel_crtc_state *old_cr
 {
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
 	struct intel_plane *plane = to_intel_plane(new_plane_state->uapi.plane);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	bool mode_changed = intel_crtc_needs_modeset(new_crtc_state);
 	bool was_crtc_enabled = old_crtc_state->hw.active;
 	bool is_crtc_enabled = new_crtc_state->hw.active;
@@ -661,7 +661,7 @@ int intel_plane_atomic_check_with_state(const struct intel_crtc_state *old_crtc_
 static struct intel_plane *
 intel_crtc_get_plane(struct intel_crtc *crtc, enum plane_id plane_id)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct intel_plane *plane;
 
 	for_each_intel_plane_on_crtc(&i915->drm, crtc, plane) {
diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 3d9c9b4f27f8..4ee938ad678a 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -252,7 +252,7 @@ static const struct hdmi_aud_ncts hdmi_aud_ncts_36bpp[] = {
 /* get AUD_CONFIG_PIXEL_CLOCK_HDMI_* value for mode */
 static u32 audio_config_hdmi_pixel_clock(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 	int i;
diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index bef96db62c80..176873117f0c 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -691,7 +691,7 @@ static unsigned int intel_bw_crtc_num_active_planes(const struct intel_crtc_stat
 static unsigned int intel_bw_crtc_data_rate(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	unsigned int data_rate = 0;
 	enum plane_id plane_id;
 
@@ -716,7 +716,7 @@ static unsigned int intel_bw_crtc_data_rate(const struct intel_crtc_state *crtc_
 static int intel_bw_crtc_min_cdclk(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	if (DISPLAY_VER(i915) < 12)
 		return 0;
@@ -728,7 +728,7 @@ void intel_bw_crtc_update(struct intel_bw_state *bw_state,
 			  const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	bw_state->data_rate[crtc->pipe] =
 		intel_bw_crtc_data_rate(crtc_state);
@@ -1039,7 +1039,7 @@ static void skl_plane_calc_dbuf_bw(struct intel_bw_state *bw_state,
 				   const struct skl_ddb_entry *ddb,
 				   unsigned int data_rate)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct intel_dbuf_bw *crtc_bw = &bw_state->dbuf_bw[crtc->pipe];
 	unsigned int dbuf_mask = skl_ddb_dbuf_slice_mask(i915, ddb);
 	enum dbuf_slice slice;
@@ -1058,7 +1058,7 @@ static void skl_crtc_calc_dbuf_bw(struct intel_bw_state *bw_state,
 				  const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct intel_dbuf_bw *crtc_bw = &bw_state->dbuf_bw[crtc->pipe];
 	enum plane_id plane_id;
 
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 4207863b7b2a..5ced43397298 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2503,7 +2503,7 @@ intel_set_cdclk_post_plane_update(struct intel_atomic_state *state)
 
 static int intel_pixel_rate_to_cdclk(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	int pixel_rate = crtc_state->pixel_rate;
 
 	if (DISPLAY_VER(dev_priv) >= 10)
@@ -2522,7 +2522,7 @@ static int intel_pixel_rate_to_cdclk(const struct intel_crtc_state *crtc_state)
 static int intel_planes_min_cdclk(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_plane *plane;
 	int min_cdclk = 0;
 
@@ -2535,7 +2535,7 @@ static int intel_planes_min_cdclk(const struct intel_crtc_state *crtc_state)
 int intel_crtc_compute_min_cdclk(const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *dev_priv =
-		to_i915(crtc_state->uapi.crtc->dev);
+		to_i915(crtc_state->uapi.crtc->drm_dev);
 	int min_cdclk;
 
 	if (!crtc_state->hw.enable)
diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 8966e6560516..20cad2d28dce 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -202,7 +202,7 @@ static u64 *ctm_mult_by_limited(u64 *result, const u64 *input)
 static void ilk_update_pipe_csc(struct intel_crtc *crtc,
 				const struct intel_csc_matrix *csc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	intel_de_write_fw(i915, PIPE_CSC_PREOFF_HI(pipe), csc->preoff[0]);
@@ -235,7 +235,7 @@ static void ilk_update_pipe_csc(struct intel_crtc *crtc,
 static void ilk_read_pipe_csc(struct intel_crtc *crtc,
 			      struct intel_csc_matrix *csc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	u32 tmp;
 
@@ -301,7 +301,7 @@ static void skl_read_csc(struct intel_crtc_state *crtc_state)
 static void icl_update_output_csc(struct intel_crtc *crtc,
 				  const struct intel_csc_matrix *csc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	intel_de_write_fw(i915, PIPE_CSC_OUTPUT_PREOFF_HI(pipe), csc->preoff[0]);
@@ -331,7 +331,7 @@ static void icl_update_output_csc(struct intel_crtc *crtc,
 static void icl_read_output_csc(struct intel_crtc *crtc,
 				struct intel_csc_matrix *csc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	u32 tmp;
 
@@ -380,7 +380,7 @@ static void icl_read_csc(struct intel_crtc_state *crtc_state)
 
 static bool ilk_limited_range(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	/* icl+ have dedicated output CSC */
 	if (DISPLAY_VER(i915) >= 11)
@@ -395,7 +395,7 @@ static bool ilk_limited_range(const struct intel_crtc_state *crtc_state)
 
 static bool ilk_lut_limited_range(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	if (!ilk_limited_range(crtc_state))
 		return false;
@@ -432,7 +432,7 @@ static void ilk_csc_convert_ctm(const struct intel_crtc_state *crtc_state,
 				struct intel_csc_matrix *csc,
 				bool limited_color_range)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	const struct drm_color_ctm *ctm = crtc_state->hw.ctm->data;
 	const u64 *input;
 	u64 temp[9];
@@ -490,7 +490,7 @@ static void ilk_csc_convert_ctm(const struct intel_crtc_state *crtc_state,
 
 static void ilk_assign_csc(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	bool limited_color_range = ilk_csc_limited_range(crtc_state);
 
 	if (crtc_state->hw.ctm) {
@@ -530,7 +530,7 @@ static void ilk_load_csc_matrix(const struct intel_crtc_state *crtc_state)
 
 static void icl_assign_csc(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	if (crtc_state->hw.ctm) {
 		drm_WARN_ON(&i915->drm, (crtc_state->csc_mode & ICL_CSC_ENABLE) == 0);
@@ -608,7 +608,7 @@ static void vlv_wgc_csc_convert_ctm(const struct intel_crtc_state *crtc_state,
 static void vlv_load_wgc_csc(struct intel_crtc *crtc,
 			     const struct intel_csc_matrix *csc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	intel_de_write_fw(dev_priv, PIPE_WGC_C01_C00(pipe),
@@ -630,7 +630,7 @@ static void vlv_load_wgc_csc(struct intel_crtc *crtc,
 static void vlv_read_wgc_csc(struct intel_crtc *crtc,
 			     struct intel_csc_matrix *csc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	u32 tmp;
 
@@ -666,7 +666,7 @@ static void vlv_read_csc(struct intel_crtc_state *crtc_state)
 
 static void vlv_assign_csc(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	if (crtc_state->hw.ctm) {
 		drm_WARN_ON(&i915->drm, !crtc_state->wgc_enable);
@@ -710,7 +710,7 @@ static const struct intel_csc_matrix chv_cgm_csc_matrix_identity = {
 static void chv_load_cgm_csc(struct intel_crtc *crtc,
 			     const struct intel_csc_matrix *csc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	intel_de_write_fw(i915, CGM_PIPE_CSC_COEFF01(pipe),
@@ -728,7 +728,7 @@ static void chv_load_cgm_csc(struct intel_crtc *crtc,
 static void chv_read_cgm_csc(struct intel_crtc *crtc,
 			     struct intel_csc_matrix *csc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	u32 tmp;
 
@@ -762,7 +762,7 @@ static void chv_read_csc(struct intel_crtc_state *crtc_state)
 
 static void chv_assign_csc(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	drm_WARN_ON(&i915->drm, crtc_state->wgc_enable);
 
@@ -992,7 +992,7 @@ static void i9xx_color_commit_arm(const struct intel_crtc_state *crtc_state)
 static void ilk_color_commit_arm(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	/* update TRANSCONF GAMMA_MODE */
 	ilk_set_pipeconf(crtc_state);
@@ -1004,7 +1004,7 @@ static void ilk_color_commit_arm(const struct intel_crtc_state *crtc_state)
 static void hsw_color_commit_arm(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	intel_de_write(i915, GAMMA_MODE(crtc->pipe),
 		       crtc_state->gamma_mode);
@@ -1016,7 +1016,7 @@ static void hsw_color_commit_arm(const struct intel_crtc_state *crtc_state)
 static void skl_color_commit_arm(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	u32 val = 0;
 
@@ -1044,7 +1044,7 @@ static void skl_color_commit_arm(const struct intel_crtc_state *crtc_state)
 static void icl_color_commit_arm(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	/*
@@ -1063,7 +1063,7 @@ static void icl_color_commit_arm(const struct intel_crtc_state *crtc_state)
 static void icl_color_post_update(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	/*
 	 * Despite Wa_1406463849, ICL CSC is no longer disarmed by
@@ -1154,7 +1154,7 @@ create_resized_lut(struct drm_i915_private *i915,
 static void i9xx_load_lut_8(struct intel_crtc *crtc,
 			    const struct drm_property_blob *blob)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	const struct drm_color_lut *lut;
 	enum pipe pipe = crtc->pipe;
 	int i;
@@ -1172,7 +1172,7 @@ static void i9xx_load_lut_8(struct intel_crtc *crtc,
 static void i9xx_load_lut_10(struct intel_crtc *crtc,
 			     const struct drm_property_blob *blob)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	const struct drm_color_lut *lut = blob->data;
 	int i, lut_size = drm_color_lut_size(blob);
 	enum pipe pipe = crtc->pipe;
@@ -1206,7 +1206,7 @@ static void i9xx_load_luts(const struct intel_crtc_state *crtc_state)
 static void i965_load_lut_10p6(struct intel_crtc *crtc,
 			       const struct drm_property_blob *blob)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	const struct drm_color_lut *lut = blob->data;
 	int i, lut_size = drm_color_lut_size(blob);
 	enum pipe pipe = crtc->pipe;
@@ -1244,7 +1244,7 @@ static void i965_load_luts(const struct intel_crtc_state *crtc_state)
 static void ilk_lut_write(const struct intel_crtc_state *crtc_state,
 			  i915_reg_t reg, u32 val)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	if (crtc_state->dsb)
 		intel_dsb_reg_write(crtc_state->dsb, reg, val);
@@ -1457,7 +1457,7 @@ static void glk_load_degamma_lut(const struct intel_crtc_state *crtc_state,
 				 const struct drm_property_blob *blob)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	const struct drm_color_lut *lut = blob->data;
 	int i, lut_size = drm_color_lut_size(blob);
 	enum pipe pipe = crtc->pipe;
@@ -1699,7 +1699,7 @@ static void chv_cgm_degamma_pack(struct drm_color_lut *entry, u32 ldw, u32 udw)
 static void chv_load_cgm_degamma(struct intel_crtc *crtc,
 				 const struct drm_property_blob *blob)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	const struct drm_color_lut *lut = blob->data;
 	int i, lut_size = drm_color_lut_size(blob);
 	enum pipe pipe = crtc->pipe;
@@ -1733,7 +1733,7 @@ static void chv_cgm_gamma_pack(struct drm_color_lut *entry, u32 ldw, u32 udw)
 static void chv_load_cgm_gamma(struct intel_crtc *crtc,
 			       const struct drm_property_blob *blob)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	const struct drm_color_lut *lut = blob->data;
 	int i, lut_size = drm_color_lut_size(blob);
 	enum pipe pipe = crtc->pipe;
@@ -1749,7 +1749,7 @@ static void chv_load_cgm_gamma(struct intel_crtc *crtc,
 static void chv_load_luts(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	const struct drm_property_blob *pre_csc_lut = crtc_state->pre_csc_lut;
 	const struct drm_property_blob *post_csc_lut = crtc_state->post_csc_lut;
 
@@ -1770,14 +1770,14 @@ static void chv_load_luts(const struct intel_crtc_state *crtc_state)
 
 void intel_color_load_luts(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	i915->display.funcs.color->load_luts(crtc_state);
 }
 
 void intel_color_commit_noarm(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	if (i915->display.funcs.color->color_commit_noarm)
 		i915->display.funcs.color->color_commit_noarm(crtc_state);
@@ -1785,14 +1785,14 @@ void intel_color_commit_noarm(const struct intel_crtc_state *crtc_state)
 
 void intel_color_commit_arm(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	i915->display.funcs.color->color_commit_arm(crtc_state);
 }
 
 void intel_color_post_update(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	if (i915->display.funcs.color->color_post_update)
 		i915->display.funcs.color->color_post_update(crtc_state);
@@ -1865,14 +1865,14 @@ static bool chv_can_preload_luts(const struct intel_crtc_state *new_crtc_state)
 
 int intel_color_check(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	return i915->display.funcs.color->color_check(crtc_state);
 }
 
 void intel_color_get_config(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	i915->display.funcs.color->read_luts(crtc_state);
 
@@ -1885,7 +1885,7 @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
 			   const struct drm_property_blob *blob2,
 			   bool is_pre_csc_lut)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	/*
 	 * FIXME c8_planes readout missing thus
@@ -1917,7 +1917,7 @@ static int
 intel_color_add_affected_planes(struct intel_crtc_state *new_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct intel_atomic_state *state =
 		to_intel_atomic_state(new_crtc_state->uapi.state);
 	const struct intel_crtc_state *old_crtc_state =
@@ -1956,7 +1956,7 @@ intel_color_add_affected_planes(struct intel_crtc_state *new_crtc_state)
 
 static u32 intel_gamma_lut_tests(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	const struct drm_property_blob *gamma_lut = crtc_state->hw.gamma_lut;
 
 	if (lut_is_legacy(gamma_lut))
@@ -1967,14 +1967,14 @@ static u32 intel_gamma_lut_tests(const struct intel_crtc_state *crtc_state)
 
 static u32 intel_degamma_lut_tests(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	return DISPLAY_INFO(i915)->color.degamma_lut_tests;
 }
 
 static int intel_gamma_lut_size(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	const struct drm_property_blob *gamma_lut = crtc_state->hw.gamma_lut;
 
 	if (lut_is_legacy(gamma_lut))
@@ -1985,7 +1985,7 @@ static int intel_gamma_lut_size(const struct intel_crtc_state *crtc_state)
 
 static u32 intel_degamma_lut_size(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	return DISPLAY_INFO(i915)->color.degamma_lut_size;
 }
@@ -2010,7 +2010,7 @@ static int check_lut_size(const struct drm_property_blob *lut, int expected)
 static int _check_luts(const struct intel_crtc_state *crtc_state,
 		       u32 degamma_tests, u32 gamma_tests)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	const struct drm_property_blob *gamma_lut = crtc_state->hw.gamma_lut;
 	const struct drm_property_blob *degamma_lut = crtc_state->hw.degamma_lut;
 	int gamma_length, degamma_length;
@@ -2078,7 +2078,7 @@ static int i9xx_check_lut_10(struct drm_i915_private *dev_priv,
 
 void intel_color_assert_luts(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	/* make sure {pre,post}_csc_lut were correctly assigned */
 	if (DISPLAY_VER(i915) >= 11 || HAS_GMCH(i915)) {
@@ -2116,7 +2116,7 @@ static void intel_assign_luts(struct intel_crtc_state *crtc_state)
 
 static int i9xx_color_check(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	int ret;
 
 	ret = check_luts(crtc_state);
@@ -2292,7 +2292,7 @@ static u32 ilk_csc_mode(const struct intel_crtc_state *crtc_state)
 
 static int ilk_assign_luts(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	if (ilk_lut_limited_range(crtc_state)) {
 		struct drm_property_blob *gamma_lut;
@@ -2330,7 +2330,7 @@ static int ilk_assign_luts(struct intel_crtc_state *crtc_state)
 
 static int ilk_color_check(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	int ret;
 
 	ret = check_luts(crtc_state);
@@ -2399,7 +2399,7 @@ static u32 ivb_csc_mode(const struct intel_crtc_state *crtc_state)
 
 static int ivb_assign_luts(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	struct drm_property_blob *degamma_lut, *gamma_lut;
 
 	if (crtc_state->gamma_mode != GAMMA_MODE_MODE_SPLIT)
@@ -2431,7 +2431,7 @@ static int ivb_assign_luts(struct intel_crtc_state *crtc_state)
 
 static int ivb_color_check(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	int ret;
 
 	ret = check_luts(crtc_state);
@@ -2499,7 +2499,7 @@ static bool glk_use_pre_csc_lut_for_gamma(const struct intel_crtc_state *crtc_st
 
 static int glk_assign_luts(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	if (glk_use_pre_csc_lut_for_gamma(crtc_state)) {
 		struct drm_property_blob *gamma_lut;
@@ -2562,7 +2562,7 @@ static int glk_check_luts(const struct intel_crtc_state *crtc_state)
 
 static int glk_color_check(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	int ret;
 
 	ret = glk_check_luts(crtc_state);
@@ -2617,7 +2617,7 @@ static int glk_color_check(struct intel_crtc_state *crtc_state)
 static u32 icl_gamma_mode(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	u32 gamma_mode = 0;
 
 	if (crtc_state->hw.degamma_lut)
@@ -3013,7 +3013,7 @@ static bool icl_lut_equal(const struct intel_crtc_state *crtc_state,
 
 static struct drm_property_blob *i9xx_read_lut_8(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
 	struct drm_color_lut *lut;
@@ -3038,7 +3038,7 @@ static struct drm_property_blob *i9xx_read_lut_8(struct intel_crtc *crtc)
 
 static struct drm_property_blob *i9xx_read_lut_10(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	u32 lut_size = DISPLAY_INFO(dev_priv)->color.gamma_lut_size;
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
@@ -3087,7 +3087,7 @@ static void i9xx_read_luts(struct intel_crtc_state *crtc_state)
 
 static struct drm_property_blob *i965_read_lut_10p6(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	int i, lut_size = DISPLAY_INFO(dev_priv)->color.gamma_lut_size;
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
@@ -3137,7 +3137,7 @@ static void i965_read_luts(struct intel_crtc_state *crtc_state)
 
 static struct drm_property_blob *chv_read_cgm_degamma(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	int i, lut_size = DISPLAY_INFO(dev_priv)->color.degamma_lut_size;
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
@@ -3163,7 +3163,7 @@ static struct drm_property_blob *chv_read_cgm_degamma(struct intel_crtc *crtc)
 
 static struct drm_property_blob *chv_read_cgm_gamma(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	int i, lut_size = DISPLAY_INFO(i915)->color.gamma_lut_size;
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
@@ -3202,7 +3202,7 @@ static void chv_read_luts(struct intel_crtc_state *crtc_state)
 
 static struct drm_property_blob *ilk_read_lut_8(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
 	struct drm_color_lut *lut;
@@ -3227,7 +3227,7 @@ static struct drm_property_blob *ilk_read_lut_8(struct intel_crtc *crtc)
 
 static struct drm_property_blob *ilk_read_lut_10(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	int i, lut_size = DISPLAY_INFO(i915)->color.gamma_lut_size;
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
@@ -3281,7 +3281,7 @@ static void ilk_read_luts(struct intel_crtc_state *crtc_state)
 static struct drm_property_blob *ivb_read_lut_10(struct intel_crtc *crtc,
 						 u32 prec_index)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	int i, lut_size = ivb_lut_10_size(prec_index);
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
@@ -3346,7 +3346,7 @@ static void ivb_read_luts(struct intel_crtc_state *crtc_state)
 static struct drm_property_blob *bdw_read_lut_10(struct intel_crtc *crtc,
 						 u32 prec_index)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	int i, lut_size = ivb_lut_10_size(prec_index);
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
@@ -3411,7 +3411,7 @@ static void bdw_read_luts(struct intel_crtc_state *crtc_state)
 
 static struct drm_property_blob *glk_read_degamma_lut(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	int i, lut_size = DISPLAY_INFO(dev_priv)->color.degamma_lut_size;
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
@@ -3476,7 +3476,7 @@ static void glk_read_luts(struct intel_crtc_state *crtc_state)
 static struct drm_property_blob *
 icl_read_lut_multi_segment(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	int i, lut_size = DISPLAY_INFO(i915)->color.gamma_lut_size;
 	enum pipe pipe = crtc->pipe;
 	struct drm_property_blob *blob;
@@ -3658,7 +3658,7 @@ static const struct intel_color_funcs ilk_color_funcs = {
 
 void intel_color_crtc_init(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	int degamma_lut_size, gamma_lut_size;
 	bool has_ctm;
 
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 182c6dd64f47..8e0f10cbe212 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -35,7 +35,7 @@
 
 static void assert_vblank_disabled(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc->drm_dev);
 
 	if (I915_STATE_WARN(i915, drm_crtc_vblank_get(crtc) == 0,
 			    "[CRTC:%d:%s] vblank assertion failure (expected off, current on)\n",
@@ -77,7 +77,7 @@ void intel_wait_for_vblank_if_active(struct drm_i915_private *i915,
 
 u32 intel_crtc_get_vblank_counter(struct intel_crtc *crtc)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_vblank_crtc *vblank = &dev->vblank[drm_crtc_index(&crtc->base)];
 
 	if (!crtc->active)
@@ -91,7 +91,7 @@ u32 intel_crtc_get_vblank_counter(struct intel_crtc *crtc)
 
 u32 intel_crtc_max_vblank_count(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	/*
 	 * From Gen 11, In case of dsi cmd mode, frame counter wouldnt
@@ -409,10 +409,10 @@ static void intel_crtc_vblank_work(struct kthread_work *base)
 	intel_color_load_luts(crtc_state);
 
 	if (crtc_state->uapi.event) {
-		spin_lock_irq(&crtc->base.dev->event_lock);
+		spin_lock_irq(&crtc->base.drm_dev->event_lock);
 		drm_crtc_send_vblank_event(&crtc->base, crtc_state->uapi.event);
 		crtc_state->uapi.event = NULL;
-		spin_unlock_irq(&crtc->base.dev->event_lock);
+		spin_unlock_irq(&crtc->base.drm_dev->event_lock);
 	}
 
 	trace_intel_crtc_vblank_work_end(crtc);
@@ -483,7 +483,7 @@ static int intel_mode_vblank_start(const struct drm_display_mode *mode)
 void intel_pipe_update_start(struct intel_crtc_state *new_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	const struct drm_display_mode *adjusted_mode = &new_crtc_state->hw.adjusted_mode;
 	long timeout = msecs_to_jiffies_timeout(1);
 	int scanline, min, max, vblank_start;
@@ -617,7 +617,7 @@ static void dbg_vblank_evade(struct intel_crtc *crtc, ktime_t end)
 		crtc->debug.vbl.max = delta;
 
 	if (delta > 1000 * VBLANK_EVASION_TIME_US) {
-		drm_dbg_kms(crtc->base.dev,
+		drm_dbg_kms(crtc->base.drm_dev,
 			    "Atomic update on pipe (%c) took %lld us, max time under evasion is %u us\n",
 			    pipe_name(crtc->pipe),
 			    div_u64(delta, 1000),
@@ -644,7 +644,7 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
 	int scanline_end = intel_get_crtc_scanline(crtc);
 	u32 end_vbl_count = intel_crtc_get_vblank_counter(crtc);
 	ktime_t end_vbl_time = ktime_get();
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	intel_psr_unlock(new_crtc_state);
 
@@ -673,10 +673,10 @@ void intel_pipe_update_end(struct intel_crtc_state *new_crtc_state)
 		drm_WARN_ON(&dev_priv->drm,
 			    drm_crtc_vblank_get(&crtc->base) != 0);
 
-		spin_lock(&crtc->base.dev->event_lock);
+		spin_lock(&crtc->base.drm_dev->event_lock);
 		drm_crtc_arm_vblank_event(&crtc->base,
 					  new_crtc_state->uapi.event);
-		spin_unlock(&crtc->base.dev->event_lock);
+		spin_unlock(&crtc->base.drm_dev->event_lock);
 
 		new_crtc_state->uapi.event = NULL;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 8d4640d0fd34..4d15fc1103ef 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -31,7 +31,7 @@ intel_dump_m_n_config(const struct intel_crtc_state *pipe_config,
 		      const char *id, unsigned int lane_count,
 		      const struct intel_link_m_n *m_n)
 {
-	struct drm_i915_private *i915 = to_i915(pipe_config->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(pipe_config->uapi.crtc->drm_dev);
 
 	drm_dbg_kms(&i915->drm,
 		    "%s: lanes: %i; data_m: %u, data_n: %u, link_m: %u, link_n: %u, tu: %u\n",
@@ -202,7 +202,7 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 			   const char *context)
 {
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	const struct intel_plane_state *plane_state;
 	struct intel_plane *plane;
 	char buf[64];
diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index b342fad180ca..f6d73ce4e1e2 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -333,7 +333,7 @@ i9xx_cursor_max_stride(struct intel_plane *plane,
 static u32 i9xx_cursor_ctl_crtc(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	u32 cntl = 0;
 
 	if (DISPLAY_VER(dev_priv) >= 11)
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 090f242e610c..5886f06c6cbf 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -383,7 +383,7 @@ void intel_ddi_set_dp_msa(const struct intel_crtc_state *crtc_state,
 			  const struct drm_connector_state *conn_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 temp;
 
@@ -472,7 +472,7 @@ intel_ddi_transcoder_func_reg_val_get(struct intel_encoder *encoder,
 				      const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	enum port port = encoder->port;
@@ -583,7 +583,7 @@ void intel_ddi_enable_transcoder_func(struct intel_encoder *encoder,
 				      const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	if (DISPLAY_VER(dev_priv) >= 11) {
@@ -616,7 +616,7 @@ intel_ddi_config_transcoder_func(struct intel_encoder *encoder,
 				 const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 ctl;
 
@@ -628,7 +628,7 @@ intel_ddi_config_transcoder_func(struct intel_encoder *encoder,
 void intel_ddi_disable_transcoder_func(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 ctl;
 
@@ -638,7 +638,7 @@ void intel_ddi_disable_transcoder_func(const struct intel_crtc_state *crtc_state
 
 	ctl = intel_de_read(dev_priv, TRANS_DDI_FUNC_CTL(cpu_transcoder));
 
-	drm_WARN_ON(crtc->base.dev, ctl & TRANS_DDI_HDCP_SIGNALLING);
+	drm_WARN_ON(crtc->base.drm_dev, ctl & TRANS_DDI_HDCP_SIGNALLING);
 
 	ctl &= ~TRANS_DDI_FUNC_ENABLE;
 
@@ -977,7 +977,7 @@ void intel_ddi_enable_transcoder_clock(struct intel_encoder *encoder,
 				       const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	enum phy phy = intel_port_to_phy(dev_priv, encoder->port);
 	u32 val;
@@ -997,7 +997,7 @@ void intel_ddi_enable_transcoder_clock(struct intel_encoder *encoder,
 
 void intel_ddi_disable_transcoder_clock(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 val;
 
@@ -2276,7 +2276,7 @@ static void intel_ddi_mso_get_config(struct intel_encoder *encoder,
 				     struct intel_crtc_state *pipe_config)
 {
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	u32 dss1;
 
@@ -2313,7 +2313,7 @@ static void intel_ddi_mso_get_config(struct intel_encoder *encoder,
 static void intel_ddi_mso_configure(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	u32 dss1 = 0;
 
@@ -2766,7 +2766,7 @@ static void intel_ddi_pre_enable(struct intel_atomic_state *state,
 				 const struct drm_connector_state *conn_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	/*
@@ -3617,7 +3617,7 @@ static enum transcoder bdw_transcoder_master_readout(struct drm_i915_private *de
 
 static void bdw_get_trans_port_sync_config(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	u32 transcoders = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_D);
 	enum transcoder cpu_transcoder;
@@ -4125,7 +4125,7 @@ intel_ddi_port_sync_transcoders(const struct intel_crtc_state *ref_crtc_state,
 {
 	struct drm_connector *connector;
 	const struct drm_connector_state *conn_state;
-	struct drm_i915_private *dev_priv = to_i915(ref_crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(ref_crtc_state->uapi.crtc->drm_dev);
 	struct intel_atomic_state *state =
 		to_intel_atomic_state(ref_crtc_state->uapi.state);
 	u8 transcoders = 0;
@@ -4293,7 +4293,7 @@ static int modeset_pipe(struct drm_crtc *crtc,
 	struct drm_crtc_state *crtc_state;
 	int ret;
 
-	state = drm_atomic_state_alloc(crtc->dev);
+	state = drm_atomic_state_alloc(crtc->drm_dev);
 	if (!state)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index d8533603ad05..9c99a354da69 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -275,7 +275,7 @@ static int intel_bigjoiner_num_pipes(const struct intel_crtc_state *crtc_state)
 
 struct intel_crtc *intel_master_crtc(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	if (intel_crtc_is_bigjoiner_slave(crtc_state))
 		return intel_crtc_for_pipe(i915, bigjoiner_master_pipe(crtc_state));
@@ -287,7 +287,7 @@ static void
 intel_wait_for_pipe_off(const struct intel_crtc_state *old_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	if (DISPLAY_VER(dev_priv) >= 4) {
 		enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
@@ -348,7 +348,7 @@ static void assert_plane(struct intel_plane *plane, bool state)
 
 static void assert_planes_disabled(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_plane *plane;
 
 	for_each_intel_plane_on_crtc(&dev_priv->drm, crtc, plane)
@@ -393,7 +393,7 @@ void vlv_wait_port_ready(struct drm_i915_private *dev_priv,
 void intel_enable_transcoder(const struct intel_crtc_state *new_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum transcoder cpu_transcoder = new_crtc_state->cpu_transcoder;
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
@@ -454,7 +454,7 @@ void intel_enable_transcoder(const struct intel_crtc_state *new_crtc_state)
 void intel_disable_transcoder(const struct intel_crtc_state *old_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
@@ -613,7 +613,7 @@ void intel_set_plane_visible(struct intel_crtc_state *crtc_state,
 
 void intel_plane_fixup_bitmasks(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	struct drm_plane *plane;
 
 	/*
@@ -634,7 +634,7 @@ void intel_plane_fixup_bitmasks(struct intel_crtc_state *crtc_state)
 void intel_plane_disable_noatomic(struct intel_crtc *crtc,
 				  struct intel_plane *plane)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_crtc_state *crtc_state =
 		to_intel_crtc_state(crtc->base.state);
 	struct intel_plane_state *plane_state =
@@ -697,7 +697,7 @@ intel_plane_fence_y_offset(const struct intel_plane_state *plane_state)
 static void icl_set_pipe_chicken(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	u32 tmp;
 
@@ -793,7 +793,7 @@ intel_get_crtc_new_encoder(const struct intel_atomic_state *state,
 static void ilk_pfit_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	const struct drm_rect *dst = &crtc_state->pch_pfit.dst;
 	enum pipe pipe = crtc->pipe;
 	int width = drm_rect_width(dst);
@@ -832,7 +832,7 @@ static void intel_crtc_dpms_overlay_disable(struct intel_crtc *crtc)
 
 static bool needs_nv12_wa(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	if (!crtc_state->nv12_planes)
 		return false;
@@ -846,7 +846,7 @@ static bool needs_nv12_wa(const struct intel_crtc_state *crtc_state)
 
 static bool needs_scalerclk_wa(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	/* Wa_2006604312:icl,ehl */
 	if (crtc_state->scaler_state.scaler_users > 0 && DISPLAY_VER(dev_priv) == 11)
@@ -857,7 +857,7 @@ static bool needs_scalerclk_wa(const struct intel_crtc_state *crtc_state)
 
 static bool needs_cursorclk_wa(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	/* Wa_1604331009:icl,jsl,ehl */
 	if (is_hdr_mode(crtc_state) &&
@@ -889,7 +889,7 @@ static void intel_async_flip_vtd_wa(struct drm_i915_private *i915,
 
 static bool needs_async_flip_vtd_wa(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	return crtc_state->uapi.async_flip && i915_vtd_active(i915) &&
 		(DISPLAY_VER(i915) == 9 || IS_BROADWELL(i915) || IS_HASWELL(i915));
@@ -1146,7 +1146,7 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
 static void intel_crtc_disable_planes(struct intel_atomic_state *state,
 				      struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	unsigned int update_mask = new_crtc_state->update_planes;
@@ -1382,7 +1382,7 @@ static void ilk_crtc_enable(struct intel_atomic_state *state,
 {
 	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	if (drm_WARN_ON(&dev_priv->drm, crtc->active))
@@ -1472,7 +1472,7 @@ static void glk_pipe_scaler_clock_gating_wa(struct drm_i915_private *dev_priv,
 static void hsw_set_linetime_wm(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	intel_de_write(dev_priv, WM_LINETIME(crtc->pipe),
 		       HSW_LINETIME(crtc_state->linetime) |
@@ -1482,7 +1482,7 @@ static void hsw_set_linetime_wm(const struct intel_crtc_state *crtc_state)
 static void hsw_set_frame_start_delay(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum transcoder transcoder = crtc_state->cpu_transcoder;
 	i915_reg_t reg = DISPLAY_VER(dev_priv) >= 14 ? MTL_CHICKEN_TRANS(transcoder) :
 			 CHICKEN_TRANS(transcoder);
@@ -1513,7 +1513,7 @@ static void icl_ddi_bigjoiner_pre_enable(struct intel_atomic_state *state,
 static void hsw_configure_cpu_transcoder(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	if (crtc_state->has_pch_encoder) {
@@ -1544,7 +1544,7 @@ static void hsw_crtc_enable(struct intel_atomic_state *state,
 {
 	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe, hsw_workaround_pipe;
 	enum transcoder cpu_transcoder = new_crtc_state->cpu_transcoder;
 	bool psl_clkgate_wa;
@@ -1635,7 +1635,7 @@ static void hsw_crtc_enable(struct intel_atomic_state *state,
 void ilk_pfit_disable(const struct intel_crtc_state *old_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	/* To avoid upsetting the power well on haswell only disable the pfit if
@@ -1653,7 +1653,7 @@ static void ilk_crtc_disable(struct intel_atomic_state *state,
 {
 	const struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	/*
@@ -1691,7 +1691,7 @@ static void hsw_crtc_disable(struct intel_atomic_state *state,
 {
 	const struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	/*
 	 * FIXME collapse everything to one hook.
@@ -1720,7 +1720,7 @@ static void hsw_crtc_disable(struct intel_atomic_state *state,
 static void i9xx_pfit_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	if (!crtc_state->gmch_pfit.control)
 		return;
@@ -1834,7 +1834,7 @@ static void get_crtc_power_domains(struct intel_crtc_state *crtc_state,
 				   struct intel_power_domain_mask *mask)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	struct drm_encoder *encoder;
 	enum pipe pipe = crtc->pipe;
@@ -1871,7 +1871,7 @@ void intel_modeset_get_crtc_power_domains(struct intel_crtc_state *crtc_state,
 					  struct intel_power_domain_mask *old_domains)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum intel_display_power_domain domain;
 	struct intel_power_domain_mask domains, new_domains;
 
@@ -1895,7 +1895,7 @@ void intel_modeset_get_crtc_power_domains(struct intel_crtc_state *crtc_state,
 void intel_modeset_put_crtc_power_domains(struct intel_crtc *crtc,
 					  struct intel_power_domain_mask *domains)
 {
-	intel_display_power_put_mask_in_set(to_i915(crtc->base.dev),
+	intel_display_power_put_mask_in_set(to_i915(crtc->base.drm_dev),
 					    &crtc->enabled_power_domains,
 					    domains);
 }
@@ -1922,7 +1922,7 @@ static void valleyview_crtc_enable(struct intel_atomic_state *state,
 {
 	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	if (drm_WARN_ON(&dev_priv->drm, crtc->active))
@@ -1973,7 +1973,7 @@ static void i9xx_crtc_enable(struct intel_atomic_state *state,
 {
 	const struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	if (drm_WARN_ON(&dev_priv->drm, crtc->active))
@@ -2016,7 +2016,7 @@ static void i9xx_crtc_enable(struct intel_atomic_state *state,
 static void i9xx_pfit_disable(const struct intel_crtc_state *old_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	if (!old_crtc_state->gmch_pfit.control)
 		return;
@@ -2033,7 +2033,7 @@ static void i9xx_crtc_disable(struct intel_atomic_state *state,
 {
 	struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	/*
@@ -2085,7 +2085,7 @@ void intel_encoder_destroy(struct drm_encoder *encoder)
 
 static bool intel_crtc_supports_double_wide(const struct intel_crtc *crtc)
 {
-	const struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	const struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	/* GDG double wide on either pipe, otherwise pipe A only */
 	return DISPLAY_VER(dev_priv) < 4 &&
@@ -2136,7 +2136,7 @@ static void intel_mode_from_crtc_timings(struct drm_display_mode *mode,
 
 static void intel_crtc_compute_pixel_rate(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	if (HAS_GMCH(dev_priv))
 		/* FIXME calculate proper pipe pixel rate for GMCH pfit */
@@ -2250,7 +2250,7 @@ static void intel_bigjoiner_compute_pipe_src(struct intel_crtc_state *crtc_state
 static int intel_crtc_compute_pipe_src(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	intel_bigjoiner_compute_pipe_src(crtc_state);
 
@@ -2283,7 +2283,7 @@ static int intel_crtc_compute_pipe_src(struct intel_crtc_state *crtc_state)
 static int intel_crtc_compute_pipe_mode(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	struct drm_display_mode *pipe_mode = &crtc_state->hw.pipe_mode;
 	int clock_limit = i915->max_dotclk_freq;
@@ -2462,7 +2462,7 @@ void intel_cpu_transcoder_set_m1_n1(struct intel_crtc *crtc,
 				    enum transcoder transcoder,
 				    const struct intel_link_m_n *m_n)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	if (DISPLAY_VER(dev_priv) >= 5)
@@ -2479,7 +2479,7 @@ void intel_cpu_transcoder_set_m2_n2(struct intel_crtc *crtc,
 				    enum transcoder transcoder,
 				    const struct intel_link_m_n *m_n)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	if (!intel_cpu_transcoder_has_m2_n2(dev_priv, transcoder))
 		return;
@@ -2492,7 +2492,7 @@ void intel_cpu_transcoder_set_m2_n2(struct intel_crtc *crtc,
 static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
@@ -2573,7 +2573,7 @@ static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_sta
 static void intel_set_pipe_src_size(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	int width = drm_rect_width(&crtc_state->pipe_src);
 	int height = drm_rect_height(&crtc_state->pipe_src);
 	enum pipe pipe = crtc->pipe;
@@ -2587,7 +2587,7 @@ static void intel_set_pipe_src_size(const struct intel_crtc_state *crtc_state)
 
 static bool intel_pipe_is_interlaced(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	if (DISPLAY_VER(dev_priv) == 2)
@@ -2603,7 +2603,7 @@ static bool intel_pipe_is_interlaced(const struct intel_crtc_state *crtc_state)
 static void intel_get_transcoder_timings(struct intel_crtc *crtc,
 					 struct intel_crtc_state *pipe_config)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum transcoder cpu_transcoder = pipe_config->cpu_transcoder;
 	struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
@@ -2669,7 +2669,7 @@ static void intel_bigjoiner_adjust_pipe_src(struct intel_crtc_state *crtc_state)
 static void intel_get_pipe_src_size(struct intel_crtc *crtc,
 				    struct intel_crtc_state *pipe_config)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	u32 tmp;
 
@@ -2685,7 +2685,7 @@ static void intel_get_pipe_src_size(struct intel_crtc *crtc,
 void i9xx_set_pipeconf(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 val = 0;
 
@@ -2762,7 +2762,7 @@ static bool i9xx_has_pfit(struct drm_i915_private *dev_priv)
 static void i9xx_get_pfit_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe;
 	u32 tmp;
 
@@ -2790,7 +2790,7 @@ static void i9xx_get_pfit_config(struct intel_crtc_state *crtc_state)
 static void vlv_crtc_clock_get(struct intel_crtc *crtc,
 			       struct intel_crtc_state *pipe_config)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum pipe pipe = crtc->pipe;
 	struct dpll clock;
@@ -2817,7 +2817,7 @@ static void vlv_crtc_clock_get(struct intel_crtc *crtc,
 static void chv_crtc_clock_get(struct intel_crtc *crtc,
 			       struct intel_crtc_state *pipe_config)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum pipe pipe = crtc->pipe;
 	enum dpio_channel port = vlv_pipe_to_channel(pipe);
@@ -2851,7 +2851,7 @@ static void chv_crtc_clock_get(struct intel_crtc *crtc,
 static enum intel_output_format
 bdw_get_pipe_misc_output_format(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	u32 tmp;
 
 	tmp = intel_de_read(dev_priv, PIPE_MISC(crtc->pipe));
@@ -2873,7 +2873,7 @@ static void i9xx_get_pipe_color_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct intel_plane *plane = to_intel_plane(crtc->base.primary);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
 	u32 tmp;
 
@@ -2890,7 +2890,7 @@ static void i9xx_get_pipe_color_config(struct intel_crtc_state *crtc_state)
 static bool i9xx_get_pipe_config(struct intel_crtc *crtc,
 				 struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum intel_display_power_domain power_domain;
 	intel_wakeref_t wakeref;
 	u32 tmp;
@@ -3019,7 +3019,7 @@ static bool i9xx_get_pipe_config(struct intel_crtc *crtc,
 void ilk_set_pipeconf(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 val = 0;
 
@@ -3083,7 +3083,7 @@ void ilk_set_pipeconf(const struct intel_crtc_state *crtc_state)
 static void hsw_set_transconf(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 val = 0;
 
@@ -3113,7 +3113,7 @@ static void hsw_set_transconf(const struct intel_crtc_state *crtc_state)
 static void bdw_set_pipe_misc(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	u32 val = 0;
 
 	switch (crtc_state->pipe_bpp) {
@@ -3158,7 +3158,7 @@ static void bdw_set_pipe_misc(const struct intel_crtc_state *crtc_state)
 
 int bdw_get_pipe_misc_bpp(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	u32 tmp;
 
 	tmp = intel_de_read(dev_priv, PIPE_MISC(crtc->pipe));
@@ -3217,7 +3217,7 @@ void intel_cpu_transcoder_get_m1_n1(struct intel_crtc *crtc,
 				    enum transcoder transcoder,
 				    struct intel_link_m_n *m_n)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	if (DISPLAY_VER(dev_priv) >= 5)
@@ -3234,7 +3234,7 @@ void intel_cpu_transcoder_get_m2_n2(struct intel_crtc *crtc,
 				    enum transcoder transcoder,
 				    struct intel_link_m_n *m_n)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	if (!intel_cpu_transcoder_has_m2_n2(dev_priv, transcoder))
 		return;
@@ -3247,7 +3247,7 @@ void intel_cpu_transcoder_get_m2_n2(struct intel_crtc *crtc,
 static void ilk_get_pfit_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	u32 ctl, pos, size;
 	enum pipe pipe;
 
@@ -3282,7 +3282,7 @@ static void ilk_get_pfit_config(struct intel_crtc_state *crtc_state)
 static bool ilk_get_pipe_config(struct intel_crtc *crtc,
 				struct intel_crtc_state *pipe_config)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum intel_display_power_domain power_domain;
 	intel_wakeref_t wakeref;
@@ -3482,7 +3482,7 @@ static u8 hsw_panel_transcoders(struct drm_i915_private *i915)
 
 static u8 hsw_enabled_transcoders(struct intel_crtc *crtc)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	u8 panel_transcoder_mask = hsw_panel_transcoders(dev_priv);
 	enum transcoder cpu_transcoder;
@@ -3586,7 +3586,7 @@ static bool hsw_get_transcoder_state(struct intel_crtc *crtc,
 				     struct intel_crtc_state *pipe_config,
 				     struct intel_display_power_domain_set *power_domain_set)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	unsigned long enabled_transcoders;
 	u32 tmp;
@@ -3624,7 +3624,7 @@ static bool bxt_get_dsi_transcoder_state(struct intel_crtc *crtc,
 					 struct intel_crtc_state *pipe_config,
 					 struct intel_display_power_domain_set *power_domain_set)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum transcoder cpu_transcoder;
 	enum port port;
@@ -3669,7 +3669,7 @@ static bool bxt_get_dsi_transcoder_state(struct intel_crtc *crtc,
 static void intel_bigjoiner_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	u8 master_pipes, slave_pipes;
 	enum pipe pipe = crtc->pipe;
 
@@ -3686,7 +3686,7 @@ static void intel_bigjoiner_get_config(struct intel_crtc_state *crtc_state)
 static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 				struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	bool active;
 	u32 tmp;
 
@@ -3799,7 +3799,7 @@ static bool hsw_get_pipe_config(struct intel_crtc *crtc,
 bool intel_crtc_get_pipe_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	if (!i915->display.funcs.display->get_pipe_config(crtc, crtc_state))
 		return false;
@@ -3831,7 +3831,7 @@ static int i9xx_pll_refclk(struct drm_device *dev,
 void i9xx_crtc_clock_get(struct intel_crtc *crtc,
 			 struct intel_crtc_state *pipe_config)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	u32 dpll = pipe_config->dpll_hw_state.dpll;
 	u32 fp;
@@ -4061,7 +4061,7 @@ static int icl_add_linked_planes(struct intel_atomic_state *state)
 static int icl_check_nv12_planes(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_atomic_state *state = to_intel_atomic_state(crtc_state->uapi.state);
 	struct intel_plane *plane, *linked;
 	struct intel_plane_state *plane_state;
@@ -4208,7 +4208,7 @@ static u16 hsw_ips_linetime_wm(const struct intel_crtc_state *crtc_state,
 static u16 skl_linetime_wm(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	const struct drm_display_mode *pipe_mode =
 		&crtc_state->hw.pipe_mode;
 	int linetime_wm;
@@ -4230,7 +4230,7 @@ static u16 skl_linetime_wm(const struct intel_crtc_state *crtc_state)
 static int hsw_compute_linetime_wm(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_cdclk_state *cdclk_state;
@@ -4256,7 +4256,7 @@ static int hsw_compute_linetime_wm(struct intel_atomic_state *state,
 static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	int ret;
@@ -4343,7 +4343,7 @@ compute_sink_pipe_bpp(const struct drm_connector_state *conn_state,
 		      struct intel_crtc_state *crtc_state)
 {
 	struct drm_connector *connector = conn_state->connector;
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	const struct drm_display_info *info = &connector->display_info;
 	int bpp;
 
@@ -4384,7 +4384,7 @@ static int
 compute_baseline_pipe_bpp(struct intel_atomic_state *state,
 			  struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct drm_connector *connector;
@@ -4601,7 +4601,7 @@ intel_crtc_prepare_cleared_state(struct intel_atomic_state *state,
 {
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_crtc_state *saved_state;
 
 	saved_state = intel_crtc_state_alloc(crtc);
@@ -4640,7 +4640,7 @@ static int
 intel_modeset_pipe_config(struct intel_atomic_state *state,
 			  struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct drm_connector *connector;
@@ -4960,7 +4960,7 @@ static void __printf(4, 5)
 pipe_config_mismatch(bool fastset, const struct intel_crtc *crtc,
 		     const char *name, const char *format, ...)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct va_format vaf;
 	va_list args;
 
@@ -5001,7 +5001,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 			  const struct intel_crtc_state *pipe_config,
 			  bool fastset)
 {
-	struct drm_i915_private *dev_priv = to_i915(current_config->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(current_config->uapi.crtc->drm_dev);
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
 	bool ret = true;
 	bool fixup_inherited = fastset &&
@@ -5559,7 +5559,7 @@ static int intel_modeset_checks(struct intel_atomic_state *state)
 static void intel_crtc_check_fastset(const struct intel_crtc_state *old_crtc_state,
 				     struct intel_crtc_state *new_crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(old_crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(old_crtc_state->uapi.crtc->drm_dev);
 
 	if (!intel_pipe_config_compare(old_crtc_state, new_crtc_state, true)) {
 		drm_dbg_kms(&i915->drm, "fastset requirement not met, forcing full modeset\n");
@@ -5721,7 +5721,7 @@ static int intel_atomic_check_crtcs(struct intel_atomic_state *state)
 	int i;
 
 	for_each_new_intel_crtc_in_state(state, crtc, crtc_state, i) {
-		struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+		struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 		int ret;
 
 		ret = intel_crtc_atomic_check(state, crtc);
@@ -6427,7 +6427,7 @@ static int intel_atomic_prepare_commit(struct intel_atomic_state *state)
 void intel_crtc_arm_fifo_underrun(struct intel_crtc *crtc,
 				  struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	if (DISPLAY_VER(dev_priv) != 2 || crtc_state->active_planes)
 		intel_set_cpu_fifo_underrun_reporting(dev_priv, crtc->pipe, true);
@@ -6444,7 +6444,7 @@ static void intel_pipe_fastset(const struct intel_crtc_state *old_crtc_state,
 			       const struct intel_crtc_state *new_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	/*
 	 * Update pipe size and adjust fitter if needed: the reason for this is
diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index ae2578741dfe..8cc298d80ed7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -1177,7 +1177,7 @@ void gen11_display_irq_handler(struct drm_i915_private *i915)
  */
 int i8xx_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm_dev);
 	enum pipe pipe = to_intel_crtc(crtc)->pipe;
 	unsigned long irqflags;
 
@@ -1190,7 +1190,7 @@ int i8xx_enable_vblank(struct drm_crtc *crtc)
 
 int i915gm_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm_dev);
 
 	/*
 	 * Vblank interrupts fail to wake the device up from C2+.
@@ -1206,7 +1206,7 @@ int i915gm_enable_vblank(struct drm_crtc *crtc)
 
 int i965_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm_dev);
 	enum pipe pipe = to_intel_crtc(crtc)->pipe;
 	unsigned long irqflags;
 
@@ -1220,7 +1220,7 @@ int i965_enable_vblank(struct drm_crtc *crtc)
 
 int ilk_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm_dev);
 	enum pipe pipe = to_intel_crtc(crtc)->pipe;
 	unsigned long irqflags;
 	u32 bit = DISPLAY_VER(dev_priv) >= 7 ?
@@ -1242,7 +1242,7 @@ int ilk_enable_vblank(struct drm_crtc *crtc)
 static bool gen11_dsi_configure_te(struct intel_crtc *intel_crtc,
 				   bool enable)
 {
-	struct drm_i915_private *dev_priv = to_i915(intel_crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(intel_crtc->base.drm_dev);
 	enum port port;
 
 	if (!(intel_crtc->mode_flags &
@@ -1266,7 +1266,7 @@ static bool gen11_dsi_configure_te(struct intel_crtc *intel_crtc,
 int bdw_enable_vblank(struct drm_crtc *_crtc)
 {
 	struct intel_crtc *crtc = to_intel_crtc(_crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	unsigned long irqflags;
 
@@ -1291,7 +1291,7 @@ int bdw_enable_vblank(struct drm_crtc *_crtc)
  */
 void i8xx_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm_dev);
 	enum pipe pipe = to_intel_crtc(crtc)->pipe;
 	unsigned long irqflags;
 
@@ -1302,7 +1302,7 @@ void i8xx_disable_vblank(struct drm_crtc *crtc)
 
 void i915gm_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm_dev);
 
 	i8xx_disable_vblank(crtc);
 
@@ -1312,7 +1312,7 @@ void i915gm_disable_vblank(struct drm_crtc *crtc)
 
 void i965_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm_dev);
 	enum pipe pipe = to_intel_crtc(crtc)->pipe;
 	unsigned long irqflags;
 
@@ -1324,7 +1324,7 @@ void i965_disable_vblank(struct drm_crtc *crtc)
 
 void ilk_disable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm_dev);
 	enum pipe pipe = to_intel_crtc(crtc)->pipe;
 	unsigned long irqflags;
 	u32 bit = DISPLAY_VER(dev_priv) >= 7 ?
@@ -1338,7 +1338,7 @@ void ilk_disable_vblank(struct drm_crtc *crtc)
 void bdw_disable_vblank(struct drm_crtc *_crtc)
 {
 	struct intel_crtc *crtc = to_intel_crtc(_crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	unsigned long irqflags;
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_rps.c b/drivers/gpu/drm/i915/display/intel_display_rps.c
index 918d0327169a..0367eae34d46 100644
--- a/drivers/gpu/drm/i915/display/intel_display_rps.c
+++ b/drivers/gpu/drm/i915/display/intel_display_rps.c
@@ -48,7 +48,7 @@ void intel_display_rps_boost_after_vblank(struct drm_crtc *crtc,
 	if (!dma_fence_is_i915(fence))
 		return;
 
-	if (DISPLAY_VER(to_i915(crtc->dev)) < 6)
+	if (DISPLAY_VER(to_i915(crtc->drm_dev)) < 6)
 		return;
 
 	if (drm_crtc_vblank_get(crtc))
diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/gpu/drm/i915/display/intel_display_trace.h
index 99bdb833591c..64694dbb2376 100644
--- a/drivers/gpu/drm/i915/display/intel_display_trace.h
+++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
@@ -19,7 +19,7 @@
 #include "intel_vblank.h"
 
 #define __dev_name_i915(i915) dev_name((i915)->drm.dev)
-#define __dev_name_kms(obj) dev_name((obj)->base.dev->dev)
+#define __dev_name_kms(obj) dev_name((obj)->base.drm_dev->dev)
 
 TRACE_EVENT(intel_pipe_enable,
 	    TP_PROTO(struct intel_crtc *crtc),
@@ -32,7 +32,7 @@ TRACE_EVENT(intel_pipe_enable,
 			     __field(enum pipe, pipe)
 			     ),
 	    TP_fast_assign(
-			   struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+			   struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 			   struct intel_crtc *it__;
 			   __assign_str(dev, __dev_name_kms(crtc));
 			   for_each_intel_crtc(&dev_priv->drm, it__) {
@@ -61,7 +61,7 @@ TRACE_EVENT(intel_pipe_disable,
 			     ),
 
 	    TP_fast_assign(
-			   struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+			   struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 			   struct intel_crtc *it__;
 			   __assign_str(dev, __dev_name_kms(crtc));
 			   for_each_intel_crtc(&dev_priv->drm, it__) {
@@ -308,6 +308,9 @@ TRACE_EVENT(vlv_fifo_size,
 		      __entry->sprite0_start, __entry->sprite1_start, __entry->fifo_size)
 );
 
+#undef __dev_name_kms
+#define __dev_name_kms(obj) dev_name((obj)->base.dev->dev)
+
 TRACE_EVENT(intel_plane_update_noarm,
 	    TP_PROTO(struct intel_plane *plane, struct intel_crtc *crtc),
 	    TP_ARGS(plane, crtc),
@@ -476,6 +479,9 @@ TRACE_EVENT(intel_fbc_nuke,
 		      __entry->frame, __entry->scanline)
 );
 
+#undef __dev_name_kms
+#define __dev_name_kms(obj) dev_name((obj)->base.drm_dev->dev)
+
 TRACE_EVENT(intel_crtc_vblank_work_start,
 	    TP_PROTO(struct intel_crtc *crtc),
 	    TP_ARGS(crtc),
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9f40da20e88d..6fdd14979c42 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1935,7 +1935,7 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
 					     struct drm_dp_vsc_sdp *vsc)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	/*
 	 * Prepare VSC Header for SU as per DP 1.4 spec, Table 2-118
diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
index 999badfe2906..bb9f1ce75cd3 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll.c
@@ -408,7 +408,7 @@ i9xx_select_p2_div(const struct intel_limit *limit,
 		   const struct intel_crtc_state *crtc_state,
 		   int target)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_LVDS)) {
 		/*
@@ -444,7 +444,7 @@ i9xx_find_best_dpll(const struct intel_limit *limit,
 		    const struct dpll *match_clock,
 		    struct dpll *best_clock)
 {
-	struct drm_device *dev = crtc_state->uapi.crtc->dev;
+	struct drm_device *dev = crtc_state->uapi.crtc->drm_dev;
 	struct dpll clock;
 	int err = target;
 
@@ -502,7 +502,7 @@ pnv_find_best_dpll(const struct intel_limit *limit,
 		   const struct dpll *match_clock,
 		   struct dpll *best_clock)
 {
-	struct drm_device *dev = crtc_state->uapi.crtc->dev;
+	struct drm_device *dev = crtc_state->uapi.crtc->drm_dev;
 	struct dpll clock;
 	int err = target;
 
@@ -558,7 +558,7 @@ g4x_find_best_dpll(const struct intel_limit *limit,
 		   const struct dpll *match_clock,
 		   struct dpll *best_clock)
 {
-	struct drm_device *dev = crtc_state->uapi.crtc->dev;
+	struct drm_device *dev = crtc_state->uapi.crtc->drm_dev;
 	struct dpll clock;
 	int max_n;
 	bool found = false;
@@ -653,7 +653,7 @@ vlv_find_best_dpll(const struct intel_limit *limit,
 		   struct dpll *best_clock)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct dpll clock;
 	unsigned int bestppm = 1000000;
 	/* min update 19.2 MHz */
@@ -711,7 +711,7 @@ chv_find_best_dpll(const struct intel_limit *limit,
 		   struct dpll *best_clock)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	unsigned int best_error_ppm;
 	struct dpll clock;
 	u64 m2;
@@ -788,7 +788,7 @@ static void i9xx_update_pll_dividers(struct intel_crtc_state *crtc_state,
 				     const struct dpll *reduced_clock)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	u32 fp, fp2;
 
 	if (IS_PINEVIEW(dev_priv)) {
@@ -808,7 +808,7 @@ static void i9xx_compute_dpll(struct intel_crtc_state *crtc_state,
 			      const struct dpll *reduced_clock)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	u32 dpll;
 
 	i9xx_update_pll_dividers(crtc_state, clock, reduced_clock);
@@ -887,7 +887,7 @@ static void i8xx_compute_dpll(struct intel_crtc_state *crtc_state,
 			      const struct dpll *reduced_clock)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	u32 dpll;
 
 	i9xx_update_pll_dividers(crtc_state, clock, reduced_clock);
@@ -1032,7 +1032,7 @@ static void ilk_update_pll_dividers(struct intel_crtc_state *crtc_state,
 				    const struct dpll *reduced_clock)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	u32 fp, fp2;
 	int factor;
 
@@ -1065,7 +1065,7 @@ static void ilk_compute_dpll(struct intel_crtc_state *crtc_state,
 			     const struct dpll *reduced_clock)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	u32 dpll;
 
 	ilk_update_pll_dividers(crtc_state, clock, reduced_clock);
@@ -1581,7 +1581,7 @@ static bool i9xx_has_pps(struct drm_i915_private *dev_priv)
 void i9xx_enable_pll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	u32 dpll = crtc_state->dpll_hw_state.dpll;
 	enum pipe pipe = crtc->pipe;
 	int i;
@@ -1659,7 +1659,7 @@ static void vlv_pllb_recal_opamp(struct drm_i915_private *dev_priv,
 static void vlv_prepare_pll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	u32 mdiv;
 	u32 bestn, bestm1, bestm2, bestp1, bestp2;
@@ -1749,7 +1749,7 @@ static void vlv_prepare_pll(const struct intel_crtc_state *crtc_state)
 static void _vlv_enable_pll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	intel_de_write(dev_priv, DPLL(pipe), crtc_state->dpll_hw_state.dpll);
@@ -1763,7 +1763,7 @@ static void _vlv_enable_pll(const struct intel_crtc_state *crtc_state)
 void vlv_enable_pll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	assert_transcoder_disabled(dev_priv, crtc_state->cpu_transcoder);
@@ -1789,7 +1789,7 @@ void vlv_enable_pll(const struct intel_crtc_state *crtc_state)
 static void chv_prepare_pll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	enum dpio_channel port = vlv_pipe_to_channel(pipe);
 	u32 loopfilter, tribuf_calcntr;
@@ -1883,7 +1883,7 @@ static void chv_prepare_pll(const struct intel_crtc_state *crtc_state)
 static void _chv_enable_pll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	enum dpio_channel port = vlv_pipe_to_channel(pipe);
 	u32 tmp;
@@ -1913,7 +1913,7 @@ static void _chv_enable_pll(const struct intel_crtc_state *crtc_state)
 void chv_enable_pll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	assert_transcoder_disabled(dev_priv, crtc_state->cpu_transcoder);
@@ -2040,7 +2040,7 @@ void chv_disable_pll(struct drm_i915_private *dev_priv, enum pipe pipe)
 void i9xx_disable_pll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	/* Don't disable pipe or pipe PLLs if needed */
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 6b2d8a1e2aa9..165b5b6c4cd2 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -219,7 +219,7 @@ intel_tc_pll_enable_reg(struct drm_i915_private *i915,
 void intel_enable_shared_dpll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 	unsigned int pipe_mask = BIT(crtc->pipe);
 	unsigned int old_mask;
@@ -265,7 +265,7 @@ void intel_enable_shared_dpll(const struct intel_crtc_state *crtc_state)
 void intel_disable_shared_dpll(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_shared_dpll *pll = crtc_state->shared_dpll;
 	unsigned int pipe_mask = BIT(crtc->pipe);
 
@@ -308,7 +308,7 @@ intel_find_shared_dpll(struct intel_atomic_state *state,
 		       const struct intel_dpll_hw_state *pll_state,
 		       unsigned long dpll_mask)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_shared_dpll *pll, *unused_pll = NULL;
 	struct intel_shared_dpll_state *shared_dpll;
 	enum intel_dpll_id i;
@@ -364,7 +364,7 @@ intel_reference_shared_dpll_crtc(const struct intel_crtc *crtc,
 				 const struct intel_shared_dpll *pll,
 				 struct intel_shared_dpll_state *shared_dpll_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	drm_WARN_ON(&i915->drm, (shared_dpll_state->pipe_mask & BIT(crtc->pipe)) != 0);
 
@@ -404,7 +404,7 @@ intel_unreference_shared_dpll_crtc(const struct intel_crtc *crtc,
 				   const struct intel_shared_dpll *pll,
 				   struct intel_shared_dpll_state *shared_dpll_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	drm_WARN_ON(&i915->drm, (shared_dpll_state->pipe_mask & BIT(crtc->pipe)) == 0);
 
@@ -555,7 +555,7 @@ static int ibx_get_dpll(struct intel_atomic_state *state,
 {
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_shared_dpll *pll;
 	enum intel_dpll_id i;
 
@@ -994,7 +994,7 @@ hsw_ddi_wrpll_get_dpll(struct intel_atomic_state *state,
 static int
 hsw_ddi_lcpll_compute_dpll(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	int clock = crtc_state->port_clock;
 
 	switch (clock / 2) {
@@ -1012,7 +1012,7 @@ hsw_ddi_lcpll_compute_dpll(struct intel_crtc_state *crtc_state)
 static struct intel_shared_dpll *
 hsw_ddi_lcpll_get_dpll(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	struct intel_shared_dpll *pll;
 	enum intel_dpll_id pll_id;
 	int clock = crtc_state->port_clock;
@@ -1071,7 +1071,7 @@ hsw_ddi_spll_compute_dpll(struct intel_atomic_state *state,
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
-	if (drm_WARN_ON(crtc->base.dev, crtc_state->port_clock / 2 != 135000))
+	if (drm_WARN_ON(crtc->base.drm_dev, crtc_state->port_clock / 2 != 135000))
 		return -EINVAL;
 
 	crtc_state->dpll_hw_state.spll =
@@ -1698,7 +1698,7 @@ static int skl_ddi_wrpll_get_freq(struct drm_i915_private *i915,
 
 static int skl_ddi_hdmi_pll_dividers(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	struct skl_wrpll_params wrpll_params = {};
 	u32 ctrl1, cfgcr1, cfgcr2;
 	int ret;
@@ -2128,7 +2128,7 @@ static int
 bxt_ddi_hdmi_pll_dividers(struct intel_crtc_state *crtc_state,
 			  struct dpll *clk_div)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	/* Calculate HDMI div */
 	/*
@@ -2146,7 +2146,7 @@ bxt_ddi_hdmi_pll_dividers(struct intel_crtc_state *crtc_state,
 static void bxt_ddi_dp_pll_dividers(struct intel_crtc_state *crtc_state,
 				    struct dpll *clk_div)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	int i;
 
 	*clk_div = bxt_dp_clk_val[0];
@@ -2166,7 +2166,7 @@ static void bxt_ddi_dp_pll_dividers(struct intel_crtc_state *crtc_state,
 static int bxt_ddi_set_dpll_hw_state(struct intel_crtc_state *crtc_state,
 				     const struct dpll *clk_div)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	struct intel_dpll_hw_state *dpll_hw_state = &crtc_state->dpll_hw_state;
 	int clock = crtc_state->port_clock;
 	int vco = clk_div->vco;
@@ -2261,7 +2261,7 @@ bxt_ddi_dp_set_dpll_hw_state(struct intel_crtc_state *crtc_state)
 static int
 bxt_ddi_hdmi_set_dpll_hw_state(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	struct dpll clk_div = {};
 	int ret;
 
@@ -2298,7 +2298,7 @@ static int bxt_get_dpll(struct intel_atomic_state *state,
 {
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_shared_dpll *pll;
 	enum intel_dpll_id id;
 
@@ -2555,7 +2555,7 @@ static const struct skl_wrpll_params tgl_tbt_pll_24MHz_values = {
 static int icl_calc_dp_combo_pll(struct intel_crtc_state *crtc_state,
 				 struct skl_wrpll_params *pll_params)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	const struct icl_combo_pll_params *params =
 		dev_priv->display.dpll.ref_clks.nssc == 24000 ?
 		icl_dp_combo_pll_24MHz_values :
@@ -2577,7 +2577,7 @@ static int icl_calc_dp_combo_pll(struct intel_crtc_state *crtc_state,
 static int icl_calc_tbt_pll(struct intel_crtc_state *crtc_state,
 			    struct skl_wrpll_params *pll_params)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	if (DISPLAY_VER(dev_priv) >= 12) {
 		switch (dev_priv->display.dpll.ref_clks.nssc) {
@@ -2641,7 +2641,7 @@ static int
 icl_calc_wrpll(struct intel_crtc_state *crtc_state,
 	       struct skl_wrpll_params *wrpll_params)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	int ref_clock = icl_wrpll_ref_clock(i915);
 	u32 afe_clock = crtc_state->port_clock * 5;
 	u32 dco_min = 7998000;
@@ -2851,7 +2851,7 @@ static int icl_mg_pll_find_divisors(int clock_khz, bool is_dp, bool use_ssc,
 static int icl_calc_mg_pll_state(struct intel_crtc_state *crtc_state,
 				 struct intel_dpll_hw_state *pll_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	int refclk_khz = dev_priv->display.dpll.ref_clks.nssc;
 	int clock = crtc_state->port_clock;
 	u32 dco_khz, m1div, m2div_int, m2div_rem, m2div_frac;
@@ -3165,7 +3165,7 @@ static void icl_update_active_dpll(struct intel_atomic_state *state,
 static int icl_compute_combo_phy_dpll(struct intel_atomic_state *state,
 				      struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct icl_port_dpll *port_dpll =
@@ -3197,7 +3197,7 @@ static int icl_get_combo_phy_dpll(struct intel_atomic_state *state,
 				  struct intel_crtc *crtc,
 				  struct intel_encoder *encoder)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	struct icl_port_dpll *port_dpll =
@@ -4483,7 +4483,7 @@ void intel_shared_dpll_state_verify(struct intel_crtc *crtc,
 				    struct intel_crtc_state *old_crtc_state,
 				    struct intel_crtc_state *new_crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	if (new_crtc_state->shared_dpll)
 		verify_single_dpll_state(dev_priv, new_crtc_state->shared_dpll,
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index 7c5fddb203ba..36ef1d2a4e57 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -318,7 +318,7 @@ void intel_dpt_destroy(struct i915_address_space *vm)
 
 void intel_dpt_configure(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	if (DISPLAY_VER(i915) == 14) {
 		enum pipe pipe = crtc->pipe;
diff --git a/drivers/gpu/drm/i915/display/intel_drrs.c b/drivers/gpu/drm/i915/display/intel_drrs.c
index 0d35b6be5b6a..342dea75097c 100644
--- a/drivers/gpu/drm/i915/display/intel_drrs.c
+++ b/drivers/gpu/drm/i915/display/intel_drrs.c
@@ -66,7 +66,7 @@ static void
 intel_drrs_set_refresh_rate_pipeconf(struct intel_crtc *crtc,
 				     enum drrs_refresh_rate refresh_rate)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum transcoder cpu_transcoder = crtc->drrs.cpu_transcoder;
 	u32 bit;
 
@@ -96,7 +96,7 @@ bool intel_drrs_is_active(struct intel_crtc *crtc)
 static void intel_drrs_set_state(struct intel_crtc *crtc,
 				 enum drrs_refresh_rate refresh_rate)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	if (refresh_rate == crtc->drrs.refresh_rate)
 		return;
@@ -111,7 +111,7 @@ static void intel_drrs_set_state(struct intel_crtc *crtc,
 
 static void intel_drrs_schedule_work(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	mod_delayed_work(i915->unordered_wq, &crtc->drrs.work, msecs_to_jiffies(1000));
 }
@@ -119,7 +119,7 @@ static void intel_drrs_schedule_work(struct intel_crtc *crtc)
 static unsigned int intel_drrs_frontbuffer_bits(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	unsigned int frontbuffer_bits;
 
 	frontbuffer_bits = INTEL_FRONTBUFFER_ALL_MASK(crtc->pipe);
@@ -334,7 +334,7 @@ DEFINE_SHOW_ATTRIBUTE(intel_drrs_debugfs_status);
 static int intel_drrs_debugfs_ctl_set(void *data, u64 val)
 {
 	struct intel_crtc *crtc = data;
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct intel_crtc_state *crtc_state;
 	struct drm_crtc_commit *commit;
 	int ret;
diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index bed058d2c3ac..5e9f7d05e9d8 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -85,7 +85,7 @@ struct intel_dsb {
 static bool assert_dsb_has_room(struct intel_dsb *dsb)
 {
 	struct intel_crtc *crtc = dsb->crtc;
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	/* each instruction is 2 dwords */
 	return !drm_WARN(&i915->drm, dsb->free_pos > dsb->size - 2,
@@ -229,7 +229,7 @@ void intel_dsb_finish(struct intel_dsb *dsb)
 void intel_dsb_commit(struct intel_dsb *dsb, bool wait_for_vblank)
 {
 	struct intel_crtc *crtc = dsb->crtc;
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	u32 tail;
 
@@ -255,7 +255,7 @@ void intel_dsb_commit(struct intel_dsb *dsb, bool wait_for_vblank)
 void intel_dsb_wait(struct intel_dsb *dsb)
 {
 	struct intel_crtc *crtc = dsb->crtc;
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	if (wait_for(!is_dsb_busy(dev_priv, pipe, dsb->id), 1))
@@ -283,7 +283,7 @@ void intel_dsb_wait(struct intel_dsb *dsb)
 struct intel_dsb *intel_dsb_prepare(struct intel_crtc *crtc,
 				    unsigned int max_cmds)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct drm_i915_gem_object *obj;
 	intel_wakeref_t wakeref;
 	struct intel_dsb *dsb;
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 7f8b2d7713c7..e07eca21a883 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1486,7 +1486,7 @@ static void __intel_fbc_enable(struct intel_atomic_state *state,
  */
 void intel_fbc_disable(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct intel_plane *plane;
 
 	for_each_intel_plane(&i915->drm, plane) {
diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i915/display/intel_fdi.c
index e12b46a84fa1..9c9b59bb449a 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.c
+++ b/drivers/gpu/drm/i915/display/intel_fdi.c
@@ -114,7 +114,7 @@ void assert_fdi_rx_pll_disabled(struct drm_i915_private *i915, enum pipe pipe)
 void intel_fdi_link_train(struct intel_crtc *crtc,
 			  const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	dev_priv->display.funcs.fdi->fdi_link_train(crtc, crtc_state);
 }
@@ -235,7 +235,7 @@ int intel_fdi_link_freq(struct drm_i915_private *i915,
 int ilk_fdi_compute_config(struct intel_crtc *crtc,
 			   struct intel_crtc_state *pipe_config)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *i915 = to_i915(dev);
 	const struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
 	int lane, link_bw, fdi_dotclock, ret;
@@ -310,7 +310,7 @@ static void cpt_set_fdi_bc_bifurcation(struct drm_i915_private *dev_priv, bool e
 static void ivb_update_fdi_bc_bifurcation(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	switch (crtc->pipe) {
 	case PIPE_A:
@@ -333,7 +333,7 @@ static void ivb_update_fdi_bc_bifurcation(const struct intel_crtc_state *crtc_st
 
 void intel_fdi_normal_train(struct intel_crtc *crtc)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
@@ -375,7 +375,7 @@ void intel_fdi_normal_train(struct intel_crtc *crtc)
 static void ilk_fdi_link_train(struct intel_crtc *crtc,
 			       const struct intel_crtc_state *crtc_state)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
@@ -477,7 +477,7 @@ static const int snb_b_fdi_train_param[] = {
 static void gen6_fdi_link_train(struct intel_crtc *crtc,
 				const struct intel_crtc_state *crtc_state)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
@@ -613,7 +613,7 @@ static void gen6_fdi_link_train(struct intel_crtc *crtc,
 static void ivb_manual_fdi_link_train(struct intel_crtc *crtc,
 				      const struct intel_crtc_state *crtc_state)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
@@ -750,7 +750,7 @@ void hsw_fdi_link_train(struct intel_encoder *encoder,
 			const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	u32 temp, i, rx_ctl_val;
 	int n_entries;
 
@@ -891,7 +891,7 @@ void hsw_fdi_disable(struct intel_encoder *encoder)
 void ilk_fdi_pll_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
 	u32 temp;
@@ -925,7 +925,7 @@ void ilk_fdi_pll_enable(const struct intel_crtc_state *crtc_state)
 
 void ilk_fdi_pll_disable(struct intel_crtc *crtc)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum pipe pipe = crtc->pipe;
 
@@ -945,7 +945,7 @@ void ilk_fdi_pll_disable(struct intel_crtc *crtc)
 
 void ilk_fdi_disable(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
 	u32 temp;
diff --git a/drivers/gpu/drm/i915/display/intel_fifo_underrun.c b/drivers/gpu/drm/i915/display/intel_fifo_underrun.c
index 09a7fa6c0c37..9a72a1d687fd 100644
--- a/drivers/gpu/drm/i915/display/intel_fifo_underrun.c
+++ b/drivers/gpu/drm/i915/display/intel_fifo_underrun.c
@@ -93,7 +93,7 @@ static bool cpt_can_enable_serr_int(struct drm_device *dev)
 
 static void i9xx_check_fifo_underruns(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	i915_reg_t reg = PIPESTAT(crtc->pipe);
 	u32 enable_mask;
 
@@ -147,7 +147,7 @@ static void ilk_set_fifo_underrun_reporting(struct drm_device *dev,
 
 static void ivb_check_fifo_underruns(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	u32 err_int = intel_de_read(dev_priv, GEN7_ERR_INT);
 
@@ -234,7 +234,7 @@ static void ibx_set_fifo_underrun_reporting(struct drm_device *dev,
 
 static void cpt_check_pch_fifo_underruns(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pch_transcoder = crtc->pipe;
 	u32 serr_int = intel_de_read(dev_priv, SERR_INT);
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 7ac5e6c5e00d..4776c3fae97d 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2053,7 +2053,7 @@ bool intel_hdmi_bpc_possible(const struct intel_crtc_state *crtc_state,
 static bool hdmi_bpc_possible(const struct intel_crtc_state *crtc_state, int bpc)
 {
 	struct drm_i915_private *dev_priv =
-		to_i915(crtc_state->uapi.crtc->dev);
+		to_i915(crtc_state->uapi.crtc->drm_dev);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 
diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
index b8f43efb0ab5..acd42e0bb700 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
@@ -35,7 +35,7 @@
 static void intel_crtc_disable_noatomic_begin(struct intel_crtc *crtc,
 					      struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct intel_crtc_state *crtc_state =
 		to_intel_crtc_state(crtc->base.state);
 	struct intel_plane *plane;
@@ -140,7 +140,7 @@ static void reset_encoder_connector_state(struct intel_encoder *encoder)
 
 static void reset_crtc_encoder_state(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct intel_encoder *encoder;
 
 	for_each_encoder_on_crtc(&i915->drm, &crtc->base, encoder) {
@@ -151,7 +151,7 @@ static void reset_crtc_encoder_state(struct intel_crtc *crtc)
 
 static void intel_crtc_disable_noatomic_complete(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct intel_bw_state *bw_state =
 		to_intel_bw_state(i915->display.bw.obj.state);
 	struct intel_cdclk_state *cdclk_state =
@@ -221,7 +221,7 @@ static u8 get_transcoder_pipes(struct drm_i915_private *i915,
 static void get_portsync_pipes(struct intel_crtc *crtc,
 			       u8 *master_pipe_mask, u8 *slave_pipes_mask)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct intel_crtc_state *crtc_state =
 		to_intel_crtc_state(crtc->base.state);
 	struct intel_crtc *master_crtc;
@@ -266,7 +266,7 @@ static u8 get_bigjoiner_slave_pipes(struct drm_i915_private *i915, u8 master_pip
 static void intel_crtc_disable_noatomic(struct intel_crtc *crtc,
 					struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	u8 portsync_master_mask;
 	u8 portsync_slaves_mask;
 	u8 bigjoiner_slaves_mask;
@@ -331,7 +331,7 @@ static void intel_crtc_copy_hw_to_uapi_state(struct intel_crtc_state *crtc_state
 
 	crtc_state->uapi.enable = crtc_state->hw.enable;
 	crtc_state->uapi.active = crtc_state->hw.active;
-	drm_WARN_ON(crtc_state->uapi.crtc->dev,
+	drm_WARN_ON(crtc_state->uapi.crtc->drm_dev,
 		    drm_atomic_set_mode_for_crtc(&crtc_state->uapi, &crtc_state->hw.mode) < 0);
 
 	crtc_state->uapi.adjusted_mode = crtc_state->hw.adjusted_mode;
@@ -382,7 +382,7 @@ intel_sanitize_plane_mapping(struct drm_i915_private *i915)
 
 static bool intel_crtc_has_encoders(struct intel_crtc *crtc)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct intel_encoder *encoder;
 
 	for_each_encoder_on_crtc(dev, &crtc->base, encoder)
@@ -393,7 +393,7 @@ static bool intel_crtc_has_encoders(struct intel_crtc *crtc)
 
 static bool intel_crtc_needs_link_reset(struct intel_crtc *crtc)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct intel_encoder *encoder;
 
 	for_each_encoder_on_crtc(dev, &crtc->base, encoder) {
@@ -428,7 +428,7 @@ static struct intel_connector *intel_encoder_find_connector(struct intel_encoder
 static void intel_sanitize_fifo_underrun_reporting(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	/*
 	 * We start out with underrun reporting disabled on active
@@ -451,7 +451,7 @@ static void intel_sanitize_fifo_underrun_reporting(const struct intel_crtc_state
 static bool intel_sanitize_crtc(struct intel_crtc *crtc,
 				struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct intel_crtc_state *crtc_state = to_intel_crtc_state(crtc->base.state);
 	bool needs_link_reset;
 
@@ -538,7 +538,7 @@ static void intel_sanitize_all_crtcs(struct drm_i915_private *i915,
 
 static bool has_bogus_dpll_config(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	/*
 	 * Some SNB BIOSen (eg. ASUS K53SV) are known to misprogram
diff --git a/drivers/gpu/drm/i915/display/intel_modeset_verify.c b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
index 138144a65a45..953a42fc94ab 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_verify.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
@@ -160,7 +160,7 @@ verify_crtc_state(struct intel_crtc *crtc,
 		  struct intel_crtc_state *old_crtc_state,
 		  struct intel_crtc_state *new_crtc_state)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_encoder *encoder;
 	struct intel_crtc_state *pipe_config = old_crtc_state;
diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index 9232a305b1e6..28dc5ec08740 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -599,7 +599,7 @@ static int gmch_panel_fitting(struct intel_crtc_state *crtc_state,
 			      const struct drm_connector_state *conn_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	u32 pfit_control = 0, pfit_pgm_ratios = 0, border = 0;
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	int pipe_src_w = drm_rect_width(&crtc_state->pipe_src);
@@ -676,7 +676,7 @@ int intel_panel_fitting(struct intel_crtc_state *crtc_state,
 			const struct drm_connector_state *conn_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	if (HAS_GMCH(i915))
 		return gmch_panel_fitting(crtc_state, conn_state);
diff --git a/drivers/gpu/drm/i915/display/intel_pch_display.c b/drivers/gpu/drm/i915/display/intel_pch_display.c
index 866786e6b32f..6a4c56cf018b 100644
--- a/drivers/gpu/drm/i915/display/intel_pch_display.c
+++ b/drivers/gpu/drm/i915/display/intel_pch_display.c
@@ -26,7 +26,7 @@ bool intel_has_pch_trancoder(struct drm_i915_private *i915,
 
 enum pipe intel_crtc_pch_transcoder(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	if (HAS_PCH_LPT(i915))
 		return PIPE_A;
@@ -174,7 +174,7 @@ static void ibx_sanitize_pch_ports(struct drm_i915_private *dev_priv)
 static void intel_pch_transcoder_set_m1_n1(struct intel_crtc *crtc,
 					   const struct intel_link_m_n *m_n)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	intel_set_m_n(dev_priv, m_n,
@@ -185,7 +185,7 @@ static void intel_pch_transcoder_set_m1_n1(struct intel_crtc *crtc,
 static void intel_pch_transcoder_set_m2_n2(struct intel_crtc *crtc,
 					   const struct intel_link_m_n *m_n)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	intel_set_m_n(dev_priv, m_n,
@@ -196,7 +196,7 @@ static void intel_pch_transcoder_set_m2_n2(struct intel_crtc *crtc,
 void intel_pch_transcoder_get_m1_n1(struct intel_crtc *crtc,
 				    struct intel_link_m_n *m_n)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	intel_get_m_n(dev_priv, m_n,
@@ -207,7 +207,7 @@ void intel_pch_transcoder_get_m1_n1(struct intel_crtc *crtc,
 void intel_pch_transcoder_get_m2_n2(struct intel_crtc *crtc,
 				    struct intel_link_m_n *m_n)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	intel_get_m_n(dev_priv, m_n,
@@ -219,7 +219,7 @@ static void ilk_pch_transcoder_set_timings(const struct intel_crtc_state *crtc_s
 					   enum pipe pch_transcoder)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	intel_de_write(dev_priv, PCH_TRANS_HTOTAL(pch_transcoder),
@@ -242,7 +242,7 @@ static void ilk_pch_transcoder_set_timings(const struct intel_crtc_state *crtc_s
 static void ilk_enable_pch_transcoder(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
 	u32 val, pipeconf_val;
@@ -308,7 +308,7 @@ static void ilk_enable_pch_transcoder(const struct intel_crtc_state *crtc_state)
 
 static void ilk_disable_pch_transcoder(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	i915_reg_t reg;
 
@@ -357,7 +357,7 @@ void ilk_pch_pre_enable(struct intel_atomic_state *state,
 void ilk_pch_enable(struct intel_atomic_state *state,
 		    struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	enum pipe pipe = crtc->pipe;
@@ -448,7 +448,7 @@ void ilk_pch_disable(struct intel_atomic_state *state,
 void ilk_pch_post_disable(struct intel_atomic_state *state,
 			  struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	ilk_disable_pch_transcoder(crtc);
@@ -470,7 +470,7 @@ void ilk_pch_post_disable(struct intel_atomic_state *state,
 static void ilk_pch_clock_get(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	/* read out port_clock from the DPLL */
 	i9xx_crtc_clock_get(crtc, crtc_state);
@@ -488,7 +488,7 @@ static void ilk_pch_clock_get(struct intel_crtc_state *crtc_state)
 void ilk_pch_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_shared_dpll *pll;
 	enum pipe pipe = crtc->pipe;
 	enum intel_dpll_id pll_id;
@@ -539,7 +539,7 @@ void ilk_pch_get_config(struct intel_crtc_state *crtc_state)
 static void lpt_enable_pch_transcoder(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 val, pipeconf_val;
 
@@ -584,7 +584,7 @@ static void lpt_disable_pch_transcoder(struct drm_i915_private *dev_priv)
 void lpt_pch_enable(struct intel_atomic_state *state,
 		    struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
@@ -601,7 +601,7 @@ void lpt_pch_enable(struct intel_atomic_state *state,
 void lpt_pch_disable(struct intel_atomic_state *state,
 		     struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	lpt_disable_pch_transcoder(dev_priv);
 
@@ -611,7 +611,7 @@ void lpt_pch_disable(struct intel_atomic_state *state,
 void lpt_pch_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	u32 tmp;
 
 	if ((intel_de_read(dev_priv, LPT_TRANSCONF) & TRANS_ENABLE) == 0)
diff --git a/drivers/gpu/drm/i915/display/intel_pch_refclk.c b/drivers/gpu/drm/i915/display/intel_pch_refclk.c
index f4c09cc37a5e..ec0f948ecc31 100644
--- a/drivers/gpu/drm/i915/display/intel_pch_refclk.c
+++ b/drivers/gpu/drm/i915/display/intel_pch_refclk.c
@@ -175,7 +175,7 @@ int lpt_iclkip(const struct intel_crtc_state *crtc_state)
 void lpt_program_iclkip(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	int clock = crtc_state->hw.adjusted_mode.crtc_clock;
 	struct iclkip_params p;
 	u32 temp;
diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
index 5a468ed6e26c..240776a5694f 100644
--- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
+++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
@@ -278,7 +278,7 @@ static int ilk_pipe_crc_ctl_reg(enum intel_pipe_crc_source *source,
 static void
 intel_crtc_crc_setup_workarounds(struct intel_crtc *crtc, bool enable)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_crtc_state *pipe_config;
 	struct drm_atomic_state *state;
 	struct drm_modeset_acquire_ctx ctx;
@@ -556,7 +556,7 @@ const char *const *intel_crtc_get_crc_sources(struct drm_crtc *crtc,
 int intel_crtc_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 				 size_t *values_cnt)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm_dev);
 	enum intel_pipe_crc_source source;
 
 	if (display_crc_ctl_parse_source(source_name, &source) < 0) {
@@ -576,7 +576,7 @@ int intel_crtc_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 int intel_crtc_set_crc_source(struct drm_crtc *_crtc, const char *source_name)
 {
 	struct intel_crtc *crtc = to_intel_crtc(_crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_pipe_crc *pipe_crc = &crtc->pipe_crc;
 	enum intel_display_power_domain power_domain;
 	enum intel_pipe_crc_source source;
@@ -629,7 +629,7 @@ int intel_crtc_set_crc_source(struct drm_crtc *_crtc, const char *source_name)
 
 void intel_crtc_enable_pipe_crc(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_pipe_crc *pipe_crc = &crtc->pipe_crc;
 	enum pipe pipe = crtc->pipe;
 	u32 val = 0;
@@ -649,7 +649,7 @@ void intel_crtc_enable_pipe_crc(struct intel_crtc *crtc)
 
 void intel_crtc_disable_pipe_crc(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_pipe_crc *pipe_crc = &crtc->pipe_crc;
 	enum pipe pipe = crtc->pipe;
 
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index 736072a8b2b0..18e7c25f5a6a 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -163,7 +163,7 @@ static bool
 intel_alloc_initial_plane_obj(struct intel_crtc *crtc,
 			      struct intel_initial_plane_config *plane_config)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct drm_mode_fb_cmd2 mode_cmd = { 0 };
 	struct drm_framebuffer *fb = &plane_config->fb->base;
@@ -211,7 +211,7 @@ static void
 intel_find_initial_plane_obj(struct intel_crtc *crtc,
 			     struct intel_initial_plane_config *plane_config)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_plane *plane =
 		to_intel_plane(crtc->base.primary);
@@ -303,7 +303,7 @@ static void plane_config_fini(struct intel_initial_plane_config *plane_config)
 
 void intel_crtc_initial_plane_config(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_initial_plane_config plane_config = {};
 
 	/*
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 56c17283ba2d..ef10db17c1dc 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1731,7 +1731,7 @@ void intel_psr2_program_plane_sel_fetch_noarm(struct intel_plane *plane,
 
 void intel_psr2_program_trans_man_trk_ctl(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	struct intel_encoder *encoder;
 
@@ -1756,7 +1756,7 @@ static void psr2_man_trk_ctl_calc(struct intel_crtc_state *crtc_state,
 				  struct drm_rect *clip, bool full_update)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	u32 val = man_trk_ctl_enable_bit_get(dev_priv);
 
 	/* SF partial frame enable has to be set even on full update */
@@ -1775,7 +1775,7 @@ static void psr2_man_trk_ctl_calc(struct intel_crtc_state *crtc_state,
 		val |= ADLP_PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR(clip->y1);
 		val |= ADLP_PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR(clip->y2 - 1);
 	} else {
-		drm_WARN_ON(crtc_state->uapi.crtc->dev, clip->y1 % 4 || clip->y2 % 4);
+		drm_WARN_ON(crtc_state->uapi.crtc->drm_dev, clip->y1 % 4 || clip->y2 % 4);
 
 		val |= PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR(clip->y1 / 4 + 1);
 		val |= PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR(clip->y2 / 4 + 1);
@@ -1807,7 +1807,7 @@ static void clip_area_update(struct drm_rect *overlap_damage_area,
 static void intel_psr2_sel_fetch_pipe_alignment(const struct intel_crtc_state *crtc_state,
 						struct drm_rect *pipe_clip)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	const struct drm_dsc_config *vdsc_cfg = &crtc_state->dsc.config;
 	u16 y_alignment;
 
@@ -2164,7 +2164,7 @@ static int _psr1_ready_for_pipe_update_locked(struct intel_dp *intel_dp)
  */
 void intel_psr_wait_for_idle_locked(const struct intel_crtc_state *new_crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(new_crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(new_crtc_state->uapi.crtc->drm_dev);
 	struct intel_encoder *encoder;
 
 	if (!new_crtc_state->has_psr)
@@ -2750,7 +2750,7 @@ bool intel_psr_enabled(struct intel_dp *intel_dp)
  */
 void intel_psr_lock(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	struct intel_encoder *encoder;
 
 	if (!crtc_state->has_psr)
@@ -2773,7 +2773,7 @@ void intel_psr_lock(const struct intel_crtc_state *crtc_state)
  */
 void intel_psr_unlock(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	struct intel_encoder *encoder;
 
 	if (!crtc_state->has_psr)
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 21f92123c844..dc553130ba72 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -1272,7 +1272,7 @@ intel_sdvo_get_preferred_input_mode(struct intel_sdvo *intel_sdvo,
 
 static void i9xx_adjust_sdvo_tv_clock(struct intel_crtc_state *pipe_config)
 {
-	struct drm_i915_private *dev_priv = to_i915(pipe_config->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(pipe_config->uapi.crtc->drm_dev);
 	unsigned dotclock = pipe_config->port_clock;
 	struct dpll *clock = &pipe_config->dpll;
 
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index f5659ebd08eb..85a15b8735f0 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -65,7 +65,7 @@
  */
 u32 i915_get_vblank_counter(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm_dev);
 	struct drm_vblank_crtc *vblank = &dev_priv->drm.vblank[drm_crtc_index(crtc)];
 	const struct drm_display_mode *mode = &vblank->hwmode;
 	enum pipe pipe = to_intel_crtc(crtc)->pipe;
@@ -118,7 +118,7 @@ u32 i915_get_vblank_counter(struct drm_crtc *crtc)
 
 u32 g4x_get_vblank_counter(struct drm_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->drm_dev);
 	struct drm_vblank_crtc *vblank = &dev_priv->drm.vblank[drm_crtc_index(crtc)];
 	enum pipe pipe = to_intel_crtc(crtc)->pipe;
 
@@ -130,9 +130,9 @@ u32 g4x_get_vblank_counter(struct drm_crtc *crtc)
 
 static u32 intel_crtc_scanlines_since_frame_timestamp(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct drm_vblank_crtc *vblank =
-		&crtc->base.dev->vblank[drm_crtc_index(&crtc->base)];
+		&crtc->base.drm_dev->vblank[drm_crtc_index(&crtc->base)];
 	const struct drm_display_mode *mode = &vblank->hwmode;
 	u32 htotal = mode->crtc_htotal;
 	u32 clock = mode->crtc_clock;
@@ -178,7 +178,7 @@ static u32 intel_crtc_scanlines_since_frame_timestamp(struct intel_crtc *crtc)
 static u32 __intel_get_crtc_scanline_from_timestamp(struct intel_crtc *crtc)
 {
 	struct drm_vblank_crtc *vblank =
-		&crtc->base.dev->vblank[drm_crtc_index(&crtc->base)];
+		&crtc->base.drm_dev->vblank[drm_crtc_index(&crtc->base)];
 	const struct drm_display_mode *mode = &vblank->hwmode;
 	u32 vblank_start = mode->crtc_vblank_start;
 	u32 vtotal = mode->crtc_vtotal;
@@ -197,7 +197,7 @@ static u32 __intel_get_crtc_scanline_from_timestamp(struct intel_crtc *crtc)
  */
 static int __intel_get_crtc_scanline(struct intel_crtc *crtc)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	const struct drm_display_mode *mode;
 	struct drm_vblank_crtc *vblank;
@@ -207,7 +207,7 @@ static int __intel_get_crtc_scanline(struct intel_crtc *crtc)
 	if (!crtc->active)
 		return 0;
 
-	vblank = &crtc->base.dev->vblank[drm_crtc_index(&crtc->base)];
+	vblank = &crtc->base.drm_dev->vblank[drm_crtc_index(&crtc->base)];
 	mode = &vblank->hwmode;
 
 	if (crtc->mode_flags & I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP)
@@ -257,7 +257,7 @@ static bool i915_get_crtc_scanoutpos(struct drm_crtc *_crtc,
 				     ktime_t *stime, ktime_t *etime,
 				     const struct drm_display_mode *mode)
 {
-	struct drm_device *dev = _crtc->dev;
+	struct drm_device *dev = _crtc->drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_crtc *crtc = to_intel_crtc(_crtc);
 	enum pipe pipe = crtc->pipe;
@@ -394,7 +394,7 @@ bool intel_crtc_get_vblank_timestamp(struct drm_crtc *crtc, int *max_error,
 
 int intel_get_crtc_scanline(struct intel_crtc *crtc)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	unsigned long irqflags;
 	int position;
 
@@ -420,7 +420,7 @@ static bool pipe_scanline_is_moving(struct drm_i915_private *dev_priv,
 
 static void wait_for_pipe_scanline_moving(struct intel_crtc *crtc, bool state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	/* Wait for the display line to settle/start moving */
@@ -442,7 +442,7 @@ void intel_wait_for_pipe_scanline_moving(struct intel_crtc *crtc)
 
 static int intel_crtc_scanline_offset(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 
 	/*
@@ -491,7 +491,7 @@ void intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state,
 				      bool vrr_enable)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	u8 mode_flags = crtc_state->mode_flags;
 	struct drm_display_mode adjusted_mode;
 	int vmax_vblank_start = 0;
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index bd9116d2cd76..cda25a5e4e0f 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -22,7 +22,7 @@
 bool intel_dsc_source_support(const struct intel_crtc_state *crtc_state)
 {
 	const struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	if (!HAS_DSC(i915))
@@ -36,7 +36,7 @@ bool intel_dsc_source_support(const struct intel_crtc_state *crtc_state)
 
 static bool is_pipe_dsc(struct intel_crtc *crtc, enum transcoder cpu_transcoder)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	if (DISPLAY_VER(i915) >= 12)
 		return true;
@@ -153,7 +153,7 @@ static int intel_dsc_slice_dimensions_valid(struct intel_crtc_state *pipe_config
 int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 {
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct drm_dsc_config *vdsc_cfg = &pipe_config->dsc.config;
 	u16 compressed_bpp = pipe_config->dsc.compressed_bpp;
 	int err;
@@ -271,7 +271,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 enum intel_display_power_domain
 intel_dsc_power_domain(struct intel_crtc *crtc, enum transcoder cpu_transcoder)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	/*
@@ -296,7 +296,7 @@ intel_dsc_power_domain(struct intel_crtc *crtc, enum transcoder cpu_transcoder)
 static void intel_dsc_pps_configure(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	const struct drm_dsc_config *vdsc_cfg = &crtc_state->dsc.config;
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	enum pipe pipe = crtc->pipe;
@@ -871,7 +871,7 @@ static i915_reg_t dss_ctl2_reg(struct intel_crtc *crtc, enum transcoder cpu_tran
 void intel_uncompressed_joiner_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	u32 dss_ctl1_val = 0;
 
 	if (crtc_state->bigjoiner_pipes && !crtc_state->dsc.compression_enable) {
@@ -887,7 +887,7 @@ void intel_uncompressed_joiner_enable(const struct intel_crtc_state *crtc_state)
 void intel_dsc_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	u32 dss_ctl1_val = 0;
 	u32 dss_ctl2_val = 0;
 
@@ -913,7 +913,7 @@ void intel_dsc_enable(const struct intel_crtc_state *crtc_state)
 void intel_dsc_disable(const struct intel_crtc_state *old_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 
 	/* Disable only if either of them is enabled */
 	if (old_crtc_state->dsc.compression_enable ||
@@ -926,7 +926,7 @@ void intel_dsc_disable(const struct intel_crtc_state *old_crtc_state)
 void intel_dsc_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct drm_dsc_config *vdsc_cfg = &crtc_state->dsc.config;
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	enum pipe pipe = crtc->pipe;
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 88e4759b538b..2144d37ce09a 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -76,7 +76,7 @@ intel_vrr_check_modeset(struct intel_atomic_state *state)
 static int intel_vrr_vblank_exit_length(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	if (DISPLAY_VER(i915) >= 13)
 		return crtc_state->vrr.guardband;
@@ -101,7 +101,7 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 			 struct drm_connector_state *conn_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
@@ -156,7 +156,7 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 
 static u32 trans_vrr_ctl(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 
 	if (DISPLAY_VER(i915) >= 13)
 		return VRR_CTL_IGN_MAX_SHIFT | VRR_CTL_FLIP_LINE_EN |
@@ -169,7 +169,7 @@ static u32 trans_vrr_ctl(const struct intel_crtc_state *crtc_state)
 
 void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	/*
@@ -194,7 +194,7 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 void intel_vrr_send_push(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	if (!crtc_state->vrr.enable)
@@ -207,7 +207,7 @@ void intel_vrr_send_push(const struct intel_crtc_state *crtc_state)
 bool intel_vrr_is_push_sent(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	if (!crtc_state->vrr.enable)
@@ -218,7 +218,7 @@ bool intel_vrr_is_push_sent(const struct intel_crtc_state *crtc_state)
 
 void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	if (!crtc_state->vrr.enable)
@@ -232,7 +232,7 @@ void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
 void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
 
 	if (!old_crtc_state->vrr.enable)
@@ -247,7 +247,7 @@ void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
 
 void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 trans_vrr_ctl;
 
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 1e7c97243fcf..32bc87dce987 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -108,7 +108,7 @@ skl_update_scaler(struct intel_crtc_state *crtc_state, bool force_detach,
 	struct intel_crtc_scaler_state *scaler_state =
 		&crtc_state->scaler_state;
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 	int pipe_src_w = drm_rect_width(&crtc_state->pipe_src);
@@ -354,7 +354,7 @@ static int intel_atomic_setup_scaler(struct intel_crtc_scaler_state *scaler_stat
 				     struct intel_plane_state *plane_state,
 				     int *scaler_id)
 {
-	struct drm_i915_private *dev_priv = to_i915(intel_crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(intel_crtc->base.drm_dev);
 	int j;
 	u32 mode;
 
@@ -707,7 +707,7 @@ static void skl_scaler_setup_filter(struct drm_i915_private *dev_priv, enum pipe
 void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	const struct intel_crtc_scaler_state *scaler_state =
 		&crtc_state->scaler_state;
 	const struct drm_rect *dst = &crtc_state->pch_pfit.dst;
@@ -823,7 +823,7 @@ skl_program_plane_scaler(struct intel_plane *plane,
 
 static void skl_detach_scaler(struct intel_crtc *crtc, int id)
 {
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 
 	intel_de_write_fw(dev_priv, SKL_PS_CTRL(crtc->pipe, id), 0);
@@ -860,7 +860,7 @@ void skl_scaler_disable(const struct intel_crtc_state *old_crtc_state)
 void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	struct intel_crtc_scaler_state *scaler_state = &crtc_state->scaler_state;
 	int id = -1;
 	int i;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 6b01a0b68b97..338b5b82f9f8 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -879,7 +879,7 @@ static u32 adlp_plane_ctl_arb_slots(const struct intel_plane_state *plane_state)
 
 static u32 skl_plane_ctl_crtc(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	u32 plane_ctl = 0;
 
 	if (DISPLAY_VER(dev_priv) >= 10)
@@ -939,7 +939,7 @@ static u32 skl_plane_ctl(const struct intel_crtc_state *crtc_state,
 
 static u32 glk_plane_color_ctl_crtc(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->drm_dev);
 	u32 plane_color_ctl = 0;
 
 	if (DISPLAY_VER(dev_priv) >= 11)
@@ -2389,7 +2389,7 @@ skl_get_initial_plane_config(struct intel_crtc *crtc,
 			     struct intel_initial_plane_config *plane_config)
 {
 	struct intel_crtc_state *crtc_state = to_intel_crtc_state(crtc->base.state);
-	struct drm_device *dev = crtc->base.dev;
+	struct drm_device *dev = crtc->base.drm_dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_plane *plane = to_intel_plane(crtc->base.primary);
 	enum plane_id plane_id = plane->id;
diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 063929a42a42..a0a99a5eec9e 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -338,7 +338,7 @@ void intel_sagv_post_plane_update(struct intel_atomic_state *state)
 static bool skl_crtc_can_enable_sagv(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	enum plane_id plane_id;
 	int max_level = INT_MAX;
 
@@ -410,7 +410,7 @@ static bool tgl_crtc_can_enable_sagv(const struct intel_crtc_state *crtc_state)
 static bool intel_crtc_can_enable_sagv(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 
 	if (!i915->params.enable_sagv)
 		return false;
@@ -627,7 +627,7 @@ static void intel_crtc_dbuf_weights(const struct intel_dbuf_state *dbuf_state,
 static int
 skl_crtc_allocate_ddb(struct intel_atomic_state *state, struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	unsigned int weight_total, weight_start, weight_end;
 	const struct intel_dbuf_state *old_dbuf_state =
 		intel_atomic_get_old_dbuf_state(state);
@@ -736,7 +736,7 @@ skl_cursor_allocation(const struct intel_crtc_state *crtc_state,
 		      int num_active)
 {
 	struct intel_plane *plane = to_intel_plane(crtc_state->uapi.crtc->cursor);
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	struct skl_wm_level wm = {};
 	int ret, min_ddb_alloc = 0;
 	struct skl_wm_params wp;
@@ -801,7 +801,7 @@ static void skl_pipe_ddb_get_hw_state(struct intel_crtc *crtc,
 				      struct skl_ddb_entry *ddb,
 				      struct skl_ddb_entry *ddb_y)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	enum intel_display_power_domain power_domain;
 	enum pipe pipe = crtc->pipe;
 	intel_wakeref_t wakeref;
@@ -1329,7 +1329,7 @@ static u8 dg2_compute_dbuf_slices(enum pipe pipe, u8 active_pipes, bool join_mbu
 
 static u8 skl_compute_dbuf_slices(struct intel_crtc *crtc, u8 active_pipes, bool join_mbus)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 
 	if (IS_DG2(i915))
@@ -1362,7 +1362,7 @@ static u64
 skl_total_relative_data_rate(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	enum plane_id plane_id;
 	u64 data_rate = 0;
 
@@ -1488,7 +1488,7 @@ static int
 skl_crtc_allocate_plane_ddb(struct intel_atomic_state *state,
 			    struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_dbuf_state *dbuf_state =
@@ -1699,7 +1699,7 @@ skl_wm_method2(u32 pixel_rate, u32 pipe_htotal, u32 latency,
 static uint_fixed_16_16_t
 intel_get_linetime_us(const struct intel_crtc_state *crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	u32 pixel_rate;
 	u32 crtc_htotal;
 	uint_fixed_16_16_t linetime_us;
@@ -1726,7 +1726,7 @@ skl_compute_wm_params(const struct intel_crtc_state *crtc_state,
 		      int color_plane)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	u32 interm_pbpl;
 
 	/* only planar format has two planes */
@@ -1854,7 +1854,7 @@ static void skl_compute_plane_wm(const struct intel_crtc_state *crtc_state,
 				 const struct skl_wm_level *result_prev,
 				 struct skl_wm_level *result /* out */)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	uint_fixed_16_16_t method1, method2;
 	uint_fixed_16_16_t selected_result;
 	u32 blocks, lines, min_ddb_alloc = 0;
@@ -1986,7 +1986,7 @@ skl_compute_wm_levels(const struct intel_crtc_state *crtc_state,
 		      const struct skl_wm_params *wm_params,
 		      struct skl_wm_level *levels)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	struct skl_wm_level *result_prev = &levels[0];
 	int level;
 
@@ -2006,7 +2006,7 @@ static void tgl_compute_sagv_wm(const struct intel_crtc_state *crtc_state,
 				const struct skl_wm_params *wm_params,
 				struct skl_plane_wm *plane_wm)
 {
-	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->drm_dev);
 	struct skl_wm_level *sagv_wm = &plane_wm->sagv.wm0;
 	struct skl_wm_level *levels = plane_wm->wm;
 	unsigned int latency = 0;
@@ -2088,7 +2088,7 @@ static int skl_build_plane_wm_single(struct intel_crtc_state *crtc_state,
 				     struct intel_plane *plane, int color_plane)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct skl_plane_wm *wm = &crtc_state->wm.skl.raw.planes[plane->id];
 	struct skl_wm_params wm_params;
 	int ret;
@@ -2239,7 +2239,7 @@ static int skl_max_wm_level_for_vblank(struct intel_crtc_state *crtc_state,
 				       int wm0_lines)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	int level;
 
 	for (level = i915->display.wm.num_levels - 1; level >= 0; level--) {
@@ -2264,7 +2264,7 @@ static int skl_max_wm_level_for_vblank(struct intel_crtc_state *crtc_state,
 static int skl_wm_check_vblank(struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	int wm0_lines, level;
 
 	if (!crtc_state->hw.active)
@@ -2319,7 +2319,7 @@ static int skl_wm_check_vblank(struct intel_crtc_state *crtc_state)
 static int skl_build_pipe_wm(struct intel_atomic_state *state,
 			     struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_plane_state *plane_state;
@@ -2512,7 +2512,7 @@ skl_ddb_add_affected_planes(const struct intel_crtc_state *old_crtc_state,
 {
 	struct intel_atomic_state *state = to_intel_atomic_state(new_crtc_state->uapi.state);
 	struct intel_crtc *crtc = to_intel_crtc(new_crtc_state->uapi.crtc);
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct intel_plane *plane;
 
 	for_each_intel_plane_on_crtc(&i915->drm, crtc, plane) {
@@ -2859,7 +2859,7 @@ static bool skl_plane_selected_wm_equals(struct intel_plane *plane,
 static int skl_wm_add_affected_planes(struct intel_atomic_state *state,
 				      struct intel_crtc *crtc)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	const struct intel_crtc_state *old_crtc_state =
 		intel_atomic_get_old_crtc_state(state, crtc);
 	struct intel_crtc_state *new_crtc_state =
@@ -2944,7 +2944,7 @@ static void skl_wm_level_from_reg_val(u32 val, struct skl_wm_level *level)
 static void skl_pipe_wm_get_hw_state(struct intel_crtc *crtc,
 				     struct skl_pipe_wm *out)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	enum plane_id plane_id;
 	int level;
@@ -3135,7 +3135,7 @@ static void skl_wm_get_hw_state_and_sanitize(struct drm_i915_private *i915)
 void intel_wm_state_verify(struct intel_crtc *crtc,
 			   struct intel_crtc_state *new_crtc_state)
 {
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+	struct drm_i915_private *i915 = to_i915(crtc->base.drm_dev);
 	struct skl_hw_state {
 		struct skl_ddb_entry ddb[I915_MAX_PLANES];
 		struct skl_ddb_entry ddb_y[I915_MAX_PLANES];
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index ae2f3ab3e73d..ef1684165205 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -737,7 +737,7 @@ static void intel_dsi_pre_enable(struct intel_atomic_state *state,
 {
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
-	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(crtc->base.drm_dev);
 	enum pipe pipe = crtc->pipe;
 	enum port port;
 	bool glk_cold_boot = false;
-- 
2.39.2

