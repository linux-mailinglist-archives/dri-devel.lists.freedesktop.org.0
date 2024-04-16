Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389FD8A74B1
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 21:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025C910F2CE;
	Tue, 16 Apr 2024 19:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA6710F2CE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 19:29:48 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 88D633F434;
 Tue, 16 Apr 2024 21:29:45 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue, 16 Apr 2024 21:29:39 +0200
Subject: [PATCH] drm: Fix no_vblank field references in documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240416-drm-no_vblank-kdoc-link-v1-1-a1d8d1e9ff34@somainline.org>
X-B4-Tracking: v=1; b=H4sIAKLRHmYC/x2MQQqAIBAAvxJ7bkHLIvpKRJhutVQaChJEf0+6z
 RxmHogUmCL0xQOBEkf2LossCzCbdish2+xQiUoJJVu04UTnpzQf2u24W2/w4EwLaTk3tRCdriH
 XV6CF7/88jO/7AQakzM5pAAAA
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13.0
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

Browsing the DRM documentation shows that drm_crtc_state.no_vblank
is not turned into a reference to the no_vblank field, but rather a
reference to `struct drm_crtc_state`.  The only difference with other
field references is that the struct name is prefixed by the literal
`struct` tag, despite also already having a `&` reference prefix in two
of the three cases.  Remove the `struct` prefix to turn these references
into proper links to the designated field.

Fixes: 7beb691f1e6f ("drm: Initialize struct drm_crtc_state.no_vblank from device settings")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
Note that a simple regex like "&struct \w+\.\w+" shows that there are
only a handful of violators, most of them inside DRM files.  Let me know
if you'd like a v2 that addresses all of them in one go (in separate
patches or one combined change)?

Kind regards,
Marijn
---
 drivers/gpu/drm/drm_vblank.c        | 2 +-
 include/drm/drm_crtc.h              | 2 +-
 include/drm/drm_simple_kms_helper.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 702a12bc93bd..45504732f98e 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -140,7 +140,7 @@
  * must not call drm_vblank_init(). For such drivers, atomic helpers will
  * automatically generate fake vblank events as part of the display update.
  * This functionality also can be controlled by the driver by enabling and
- * disabling struct drm_crtc_state.no_vblank.
+ * disabling &drm_crtc_state.no_vblank.
  */
 
 /* Retry timestamp calculation up to 3 times to satisfy
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 8b48a1974da3..eb75d0aec170 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -342,7 +342,7 @@ struct drm_crtc_state {
 	 *    that case.
 	 *
 	 * For very simple hardware without VBLANK interrupt, enabling
-	 * &struct drm_crtc_state.no_vblank makes DRM's atomic commit helpers
+	 * &drm_crtc_state.no_vblank makes DRM's atomic commit helpers
 	 * send a fake VBLANK event at the end of the display update after all
 	 * hardware changes have been applied. See
 	 * drm_atomic_helper_fake_vblank().
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index b2486d073763..6e64d91819e7 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -102,7 +102,7 @@ struct drm_simple_display_pipe_funcs {
 	 * drm_crtc_arm_vblank_event(), when the driver supports vblank
 	 * interrupt handling, or drm_crtc_send_vblank_event() for more
 	 * complex case. In case the hardware lacks vblank support entirely,
-	 * drivers can set &struct drm_crtc_state.no_vblank in
+	 * drivers can set &drm_crtc_state.no_vblank in
 	 * &struct drm_simple_display_pipe_funcs.check and let DRM's
 	 * atomic helper fake a vblank event.
 	 */

---
base-commit: 6bd343537461b57f3efe5dfc5fc193a232dfef1e
change-id: 20240416-drm-no_vblank-kdoc-link-fea1b53008a3

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>

