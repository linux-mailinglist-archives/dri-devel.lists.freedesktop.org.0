Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1527503BE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D1710E4C4;
	Wed, 12 Jul 2023 09:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD45D10E3E6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRH-0001ce-9t; Wed, 12 Jul 2023 11:47:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRG-00Dr67-2V; Wed, 12 Jul 2023 11:47:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWRD-004GTs-1U; Wed, 12 Jul 2023 11:47:11 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 31/52] drm/radeon: Use struct drm_crtc::drm_dev instead
 of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:41 +0200
Message-Id: <20230712094702.1770121-32-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=23373;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=tKNdlwhdBH9tuZaiDTuvUBJ8gtYyYZnSdH7V8bSs7+k=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkrnZ6u5rrsctjwlbcQZMKs3o05p0S6ZhTAMJ8Y
 OJZbaC0vceJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZK52egAKCRCPgPtYfRL+
 TpB2B/45AwOgUGiEODKAypgRiooY4grPGqeSoGI55ZHLCtBwYxHAEDZn3RUP+YgffRDdWWwK/Wv
 cJOVE5TnVNO5a7ySycXkAiw2I+Xgzg/PJq7TbJStwojLtSeJlbQlBaZFNdqsWN7/xsdVvpkcIF/
 CvTKucDTmYpTuQLyFEbs8pV/R8NRZ0LT3Se8RlEOD+Ho4r+K4+Ub5Av2RqtTlgjINuofuwAIl6u
 R95pAArC5sZrX/eoOMeknGjLxsOvFFpDbKFf48qOR2oSuiXxoJv0yZLU2/txFlJJIZjpACufnyB
 vM4CiL5TUBj2lP/epRmJHMo22OUj0ho+qKDqQoa58MpIEy+F
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
 drivers/gpu/drm/radeon/atombios_crtc.c      | 54 ++++++++++-----------
 drivers/gpu/drm/radeon/radeon_cursor.c      | 14 +++---
 drivers/gpu/drm/radeon/radeon_display.c     | 28 +++++------
 drivers/gpu/drm/radeon/radeon_kms.c         |  6 +--
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c | 16 +++---
 5 files changed, 60 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/radeon/atombios_crtc.c
index ade13173921b..76a2924a8590 100644
--- a/drivers/gpu/drm/radeon/atombios_crtc.c
+++ b/drivers/gpu/drm/radeon/atombios_crtc.c
@@ -39,7 +39,7 @@ static void atombios_overscan_setup(struct drm_crtc *crtc,
 				    struct drm_display_mode *mode,
 				    struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	SET_CRTC_OVERSCAN_PS_ALLOCATION args;
@@ -82,7 +82,7 @@ static void atombios_overscan_setup(struct drm_crtc *crtc,
 
 static void atombios_scaler_setup(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	ENABLE_SCALER_PS_ALLOCATION args;
@@ -167,7 +167,7 @@ static void atombios_scaler_setup(struct drm_crtc *crtc)
 static void atombios_lock_crtc(struct drm_crtc *crtc, int lock)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	int index =
 	    GetIndexIntoMasterTable(COMMAND, UpdateCRTC_DoubleBufferRegisters);
@@ -184,7 +184,7 @@ static void atombios_lock_crtc(struct drm_crtc *crtc, int lock)
 static void atombios_enable_crtc(struct drm_crtc *crtc, int state)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	int index = GetIndexIntoMasterTable(COMMAND, EnableCRTC);
 	ENABLE_CRTC_PS_ALLOCATION args;
@@ -200,7 +200,7 @@ static void atombios_enable_crtc(struct drm_crtc *crtc, int state)
 static void atombios_enable_crtc_memreq(struct drm_crtc *crtc, int state)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	int index = GetIndexIntoMasterTable(COMMAND, EnableCRTCMemReq);
 	ENABLE_CRTC_PS_ALLOCATION args;
@@ -226,7 +226,7 @@ static const u32 vga_control_regs[6] =
 static void atombios_blank_crtc(struct drm_crtc *crtc, int state)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	int index = GetIndexIntoMasterTable(COMMAND, BlankCRTC);
 	BLANK_CRTC_PS_ALLOCATION args;
@@ -251,7 +251,7 @@ static void atombios_blank_crtc(struct drm_crtc *crtc, int state)
 static void atombios_powergate_crtc(struct drm_crtc *crtc, int state)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	int index = GetIndexIntoMasterTable(COMMAND, EnableDispPowerGating);
 	ENABLE_DISP_POWER_GATING_PARAMETERS_V2_1 args;
@@ -266,7 +266,7 @@ static void atombios_powergate_crtc(struct drm_crtc *crtc, int state)
 
 void atombios_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 
@@ -303,7 +303,7 @@ atombios_set_crtc_dtd_timing(struct drm_crtc *crtc,
 			     struct drm_display_mode *mode)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	SET_CRTC_USING_DTD_TIMING_PARAMETERS args;
 	int index = GetIndexIntoMasterTable(COMMAND, SetCRTC_UsingDTDTiming);
@@ -350,7 +350,7 @@ static void atombios_crtc_set_timing(struct drm_crtc *crtc,
 				     struct drm_display_mode *mode)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	SET_CRTC_TIMING_PARAMETERS_PS_ALLOCATION args;
 	int index = GetIndexIntoMasterTable(COMMAND, SetCRTC_Timing);
@@ -558,7 +558,7 @@ static u32 atombios_adjust_pll(struct drm_crtc *crtc,
 			       struct drm_display_mode *mode)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_encoder *encoder = radeon_crtc->encoder;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
@@ -826,7 +826,7 @@ static void atombios_crtc_program_pll(struct drm_crtc *crtc,
 				      bool ss_enabled,
 				      struct radeon_atom_ss *ss)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	u8 frev, crev;
 	int index = GetIndexIntoMasterTable(COMMAND, SetPixelClock);
@@ -955,7 +955,7 @@ static void atombios_crtc_program_pll(struct drm_crtc *crtc,
 static bool atombios_crtc_prepare_pll(struct drm_crtc *crtc, struct drm_display_mode *mode)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder =
 		to_radeon_encoder(radeon_crtc->encoder);
@@ -1053,7 +1053,7 @@ static bool atombios_crtc_prepare_pll(struct drm_crtc *crtc, struct drm_display_
 static void atombios_crtc_set_pll(struct drm_crtc *crtc, struct drm_display_mode *mode)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder =
 		to_radeon_encoder(radeon_crtc->encoder);
@@ -1136,7 +1136,7 @@ static int dce4_crtc_do_set_base(struct drm_crtc *crtc,
 				 int x, int y, int atomic)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_framebuffer *target_fb;
 	struct drm_gem_object *obj;
@@ -1457,7 +1457,7 @@ static int avivo_crtc_do_set_base(struct drm_crtc *crtc,
 				  int x, int y, int atomic)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_gem_object *obj;
 	struct radeon_bo *rbo;
@@ -1663,7 +1663,7 @@ static int avivo_crtc_do_set_base(struct drm_crtc *crtc,
 int atombios_crtc_set_base(struct drm_crtc *crtc, int x, int y,
 			   struct drm_framebuffer *old_fb)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 
 	if (ASIC_IS_DCE4(rdev))
@@ -1678,7 +1678,7 @@ int atombios_crtc_set_base_atomic(struct drm_crtc *crtc,
 				  struct drm_framebuffer *fb,
 				  int x, int y, enum mode_set_atomic state)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 
 	if (ASIC_IS_DCE4(rdev))
@@ -1692,7 +1692,7 @@ int atombios_crtc_set_base_atomic(struct drm_crtc *crtc,
 /* properly set additional regs when using atombios */
 static void radeon_legacy_atom_fixup(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	u32 disp_merge_cntl;
@@ -1722,7 +1722,7 @@ static void radeon_legacy_atom_fixup(struct drm_crtc *crtc)
  */
 static u32 radeon_get_pll_use_mask(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_crtc *test_crtc;
 	struct radeon_crtc *test_radeon_crtc;
 	u32 pll_in_use = 0;
@@ -1749,7 +1749,7 @@ static u32 radeon_get_pll_use_mask(struct drm_crtc *crtc)
  */
 static int radeon_get_shared_dp_ppll(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_crtc *test_crtc;
 	struct radeon_crtc *test_radeon_crtc;
@@ -1783,7 +1783,7 @@ static int radeon_get_shared_dp_ppll(struct drm_crtc *crtc)
 static int radeon_get_shared_nondp_ppll(struct drm_crtc *crtc)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_crtc *test_crtc;
 	struct radeon_crtc *test_radeon_crtc;
@@ -1862,7 +1862,7 @@ static int radeon_get_shared_nondp_ppll(struct drm_crtc *crtc)
 static int radeon_atom_pick_pll(struct drm_crtc *crtc)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder =
 		to_radeon_encoder(radeon_crtc->encoder);
@@ -2043,7 +2043,7 @@ int atombios_crtc_mode_set(struct drm_crtc *crtc,
 			   int x, int y, struct drm_framebuffer *old_fb)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder =
 		to_radeon_encoder(radeon_crtc->encoder);
@@ -2086,7 +2086,7 @@ static bool atombios_crtc_mode_fixup(struct drm_crtc *crtc,
 				     struct drm_display_mode *adjusted_mode)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_encoder *encoder;
 
 	/* assign the encoder to the radeon crtc to avoid repeated lookups later */
@@ -2124,7 +2124,7 @@ static bool atombios_crtc_mode_fixup(struct drm_crtc *crtc,
 
 static void atombios_crtc_prepare(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 
 	/* disable crtc pair power gating before programming */
@@ -2144,7 +2144,7 @@ static void atombios_crtc_commit(struct drm_crtc *crtc)
 static void atombios_crtc_disable(struct drm_crtc *crtc)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_atom_ss ss;
 	int i;
diff --git a/drivers/gpu/drm/radeon/radeon_cursor.c b/drivers/gpu/drm/radeon/radeon_cursor.c
index 3507805b34bc..4cea0639b7be 100644
--- a/drivers/gpu/drm/radeon/radeon_cursor.c
+++ b/drivers/gpu/drm/radeon/radeon_cursor.c
@@ -31,7 +31,7 @@
 
 static void radeon_lock_cursor(struct drm_crtc *crtc, bool lock)
 {
-	struct radeon_device *rdev = crtc->dev->dev_private;
+	struct radeon_device *rdev = crtc->drm_dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	uint32_t cur_lock;
 
@@ -62,7 +62,7 @@ static void radeon_lock_cursor(struct drm_crtc *crtc, bool lock)
 static void radeon_hide_cursor(struct drm_crtc *crtc)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct radeon_device *rdev = crtc->dev->dev_private;
+	struct radeon_device *rdev = crtc->drm_dev->dev_private;
 
 	if (ASIC_IS_DCE4(rdev)) {
 		WREG32_IDX(EVERGREEN_CUR_CONTROL + radeon_crtc->crtc_offset,
@@ -90,7 +90,7 @@ static void radeon_hide_cursor(struct drm_crtc *crtc)
 static void radeon_show_cursor(struct drm_crtc *crtc)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct radeon_device *rdev = crtc->dev->dev_private;
+	struct radeon_device *rdev = crtc->drm_dev->dev_private;
 
 	if (radeon_crtc->cursor_out_of_bounds)
 		return;
@@ -144,7 +144,7 @@ static void radeon_show_cursor(struct drm_crtc *crtc)
 static int radeon_cursor_move_locked(struct drm_crtc *crtc, int x, int y)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct radeon_device *rdev = crtc->dev->dev_private;
+	struct radeon_device *rdev = crtc->drm_dev->dev_private;
 	int xorigin = 0, yorigin = 0;
 	int w = radeon_crtc->cursor_width;
 
@@ -182,7 +182,9 @@ static int radeon_cursor_move_locked(struct drm_crtc *crtc, int x, int y)
 		 * crtc's lock as long as write access to this flag _always_
 		 * grabs all locks.
 		 */
-		list_for_each_entry(crtc_p, &crtc->dev->mode_config.crtc_list, head) {
+		list_for_each_entry(crtc_p,
+				    &crtc->drm_dev->mode_config.crtc_list,
+				    head) {
 			if (crtc_p->enabled)
 				i++;
 		}
@@ -282,7 +284,7 @@ int radeon_crtc_cursor_set2(struct drm_crtc *crtc,
 			    int32_t hot_y)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct radeon_device *rdev = crtc->dev->dev_private;
+	struct radeon_device *rdev = crtc->drm_dev->dev_private;
 	struct drm_gem_object *obj;
 	struct radeon_bo *robj;
 	int ret;
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 901e75ec70ff..46668ccb622a 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -49,7 +49,7 @@
 static void avivo_crtc_load_lut(struct drm_crtc *crtc)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	u16 *r, *g, *b;
 	int i;
@@ -87,7 +87,7 @@ static void avivo_crtc_load_lut(struct drm_crtc *crtc)
 static void dce4_crtc_load_lut(struct drm_crtc *crtc)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	u16 *r, *g, *b;
 	int i;
@@ -121,7 +121,7 @@ static void dce4_crtc_load_lut(struct drm_crtc *crtc)
 static void dce5_crtc_load_lut(struct drm_crtc *crtc)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	u16 *r, *g, *b;
 	int i;
@@ -193,7 +193,7 @@ static void dce5_crtc_load_lut(struct drm_crtc *crtc)
 static void legacy_crtc_load_lut(struct drm_crtc *crtc)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	u16 *r, *g, *b;
 	int i;
@@ -220,7 +220,7 @@ static void legacy_crtc_load_lut(struct drm_crtc *crtc)
 
 void radeon_crtc_load_lut(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 
 	if (!crtc->enabled)
@@ -462,7 +462,7 @@ static void radeon_flip_work_func(struct work_struct *__work)
 		usleep_range(1000, 2000);
 
 	/* We borrow the event spin lock for protecting flip_status */
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	spin_lock_irqsave(&crtc->drm_dev->event_lock, flags);
 
 	/* set the proper interrupt */
 	radeon_irq_kms_pflip_irq_get(rdev, radeon_crtc->crtc_id);
@@ -471,7 +471,7 @@ static void radeon_flip_work_func(struct work_struct *__work)
 	radeon_page_flip(rdev, radeon_crtc->crtc_id, work->base, work->async);
 
 	radeon_crtc->flip_status = RADEON_FLIP_SUBMITTED;
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	spin_unlock_irqrestore(&crtc->drm_dev->event_lock, flags);
 	up_read(&rdev->exclusive_lock);
 }
 
@@ -482,7 +482,7 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
 					uint32_t target,
 					struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	struct drm_gem_object *obj;
@@ -583,11 +583,11 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
 		crtc->funcs->get_vblank_counter(crtc);
 
 	/* We borrow the event spin lock for protecting flip_work */
-	spin_lock_irqsave(&crtc->dev->event_lock, flags);
+	spin_lock_irqsave(&crtc->drm_dev->event_lock, flags);
 
 	if (radeon_crtc->flip_status != RADEON_FLIP_NONE) {
 		DRM_DEBUG_DRIVER("flip queue: crtc already busy\n");
-		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+		spin_unlock_irqrestore(&crtc->drm_dev->event_lock, flags);
 		r = -EBUSY;
 		goto pflip_cleanup;
 	}
@@ -597,7 +597,7 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
 	/* update crtc fb */
 	crtc->primary->fb = fb;
 
-	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	spin_unlock_irqrestore(&crtc->drm_dev->event_lock, flags);
 
 	queue_work(radeon_crtc->flip_queue, &work->flip_work);
 	return 0;
@@ -630,7 +630,7 @@ radeon_crtc_set_config(struct drm_mode_set *set,
 	if (!set || !set->crtc)
 		return -EINVAL;
 
-	dev = set->crtc->dev;
+	dev = set->crtc->drm_dev;
 
 	ret = pm_runtime_get_sync(dev->dev);
 	if (ret < 0) {
@@ -1681,7 +1681,7 @@ bool radeon_crtc_scaling_mode_fixup(struct drm_crtc *crtc,
 				const struct drm_display_mode *mode,
 				struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_encoder *encoder;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
@@ -1985,7 +1985,7 @@ radeon_get_crtc_scanout_position(struct drm_crtc *crtc,
 				 ktime_t *stime, ktime_t *etime,
 				 const struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = crtc->index;
 
 	return radeon_get_crtc_scanoutpos(dev, pipe, 0, vpos, hpos,
diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index e0214cf1b43b..f7280a566409 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -760,7 +760,7 @@ void radeon_driver_postclose_kms(struct drm_device *dev,
  */
 u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = crtc->index;
 	int vpos, hpos, stat;
 	u32 count;
@@ -830,7 +830,7 @@ u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc)
  */
 int radeon_enable_vblank_kms(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = crtc->index;
 	struct radeon_device *rdev = dev->dev_private;
 	unsigned long irqflags;
@@ -857,7 +857,7 @@ int radeon_enable_vblank_kms(struct drm_crtc *crtc)
  */
 void radeon_disable_vblank_kms(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = crtc->index;
 	struct radeon_device *rdev = dev->dev_private;
 	unsigned long irqflags;
diff --git a/drivers/gpu/drm/radeon/radeon_legacy_crtc.c b/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
index 825b351ff53c..06ce4a21a9c0 100644
--- a/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
+++ b/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
@@ -37,7 +37,7 @@
 static void radeon_overscan_setup(struct drm_crtc *crtc,
 				  struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 
@@ -49,7 +49,7 @@ static void radeon_overscan_setup(struct drm_crtc *crtc,
 static void radeon_legacy_rmx_mode_set(struct drm_crtc *crtc,
 				       struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	int xres = mode->hdisplay;
@@ -297,7 +297,7 @@ static uint8_t radeon_compute_pll_gain(uint16_t ref_freq, uint16_t ref_div,
 static void radeon_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	uint32_t crtc_ext_cntl = 0;
 	uint32_t mask;
@@ -374,7 +374,7 @@ int radeon_crtc_do_set_base(struct drm_crtc *crtc,
 			 struct drm_framebuffer *fb,
 			 int x, int y, int atomic)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	struct drm_framebuffer *target_fb;
@@ -572,7 +572,7 @@ int radeon_crtc_do_set_base(struct drm_crtc *crtc,
 
 static bool radeon_set_crtc_timing(struct drm_crtc *crtc, struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	const struct drm_framebuffer *fb = crtc->primary->fb;
@@ -732,7 +732,7 @@ static bool radeon_set_crtc_timing(struct drm_crtc *crtc, struct drm_display_mod
 
 static void radeon_set_pll(struct drm_crtc *crtc, struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	struct drm_encoder *encoder;
@@ -1060,7 +1060,7 @@ static int radeon_crtc_mode_set(struct drm_crtc *crtc,
 
 static void radeon_crtc_prepare(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_crtc *crtci;
 
 	/*
@@ -1073,7 +1073,7 @@ static void radeon_crtc_prepare(struct drm_crtc *crtc)
 
 static void radeon_crtc_commit(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_crtc *crtci;
 
 	/*
-- 
2.39.2

