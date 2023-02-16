Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BADD86992DE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 12:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AE510ED30;
	Thu, 16 Feb 2023 11:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2DC10ED30
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 11:12:20 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id h16so1445687wrz.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 03:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1676545938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/9p5YKUpDfB/VIccEe/gl5TXkWsNme3I0Rd/ZJSwPZE=;
 b=daprNBF2cioSkaV/LaHMvRsLzymaFwYTfmNpbtoHjKT7Sk7wu0MquSVBUXgz7PQnnc
 PrwSpTRvCwpgn/+bHmTCXmQId048ksqxzkl9YY8RcymgN5s2s5Lg5cbLlWtekPM1P35W
 osp8BS7+ZJFdMfWCjabnAp+Ta0+ZH+PNIjT1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676545938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/9p5YKUpDfB/VIccEe/gl5TXkWsNme3I0Rd/ZJSwPZE=;
 b=58N2x//BwhR8soNLBQC3ArtmBPUHVil7Iw04XS32CA7jvEesvc4iVmd/uu4Ty6pbCQ
 WZRHvik1sQcJZMWZgknrETHl83kbcr3pi0V2rhf/ia7K62Hg6ohZ2GupexgCb78OXev/
 7uC2Fpy0oxO/9pd0csahxH3M291uDRG4vjQKW5y5hea4sDm1ff63GIxJUGy7L7p1DitL
 tksAsfqHaCgXkgdv65+qfLj2GD6H6e4lwkw87ikHiK5SnnN8HUL3I6jbQMwZohBv8gvm
 gVluxhGC5RRrUd4qusNYohn+v7Ixfib/oUKnOqnUMSAYFyarwdLXy5budbOn19ffvbVv
 /58Q==
X-Gm-Message-State: AO0yUKVh8273E+I3tIjE8S3OxrEpHkDxCpAH5fyHTiDf2cOnacAhqNc5
 lpFdr2ZQN1pfoXVCZLysn1e6QTZVGzZhza4S
X-Google-Smtp-Source: AK7set/V0HgKdwJ6CfD3OOAKl1s05e2DIcRxjV++t26IPN2C/xks2eE9SyhLBLK2KpcVGucfai4f8w==
X-Received: by 2002:adf:dd82:0:b0:2c3:d296:7a94 with SMTP id
 x2-20020adfdd82000000b002c3d2967a94mr3158589wrl.3.1676545938440; 
 Thu, 16 Feb 2023 03:12:18 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 y12-20020adfe6cc000000b002c3dc4131f5sm1206658wrm.18.2023.02.16.03.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 03:12:18 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Date: Thu, 16 Feb 2023 12:12:13 +0100
Message-Id: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-arm-msm@vger.kernel.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Jani Nikula <jani.nikula@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-mediatek@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>, Matthias Brugger <matthias.bgg@gmail.com>,
 mikita.lipski@amd.com, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, Manasi Navare <manasi.d.navare@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The stuff never really worked, and leads to lots of fun because it
out-of-order frees atomic states. Which upsets KASAN, among other
things.

For async updates we now have a more solid solution with the
->atomic_async_check and ->atomic_async_commit hooks. Support for that
for msm and vc4 landed. nouveau and i915 have their own commit
routines, doing something similar.

For everyone else it's probably better to remove the use-after-free
bug, and encourage folks to use the async support instead. The
affected drivers which register a legacy cursor plane and don't either
use the new async stuff or their own commit routine are: amdgpu,
atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and vmwgfx.

Inspired by an amdgpu bug report.

v2: Drop RFC, I think with amdgpu converted over to use
atomic_async_check/commit done in

commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Date:   Wed Dec 5 14:59:07 2018 -0500

    drm/amd/display: Add fast path for cursor plane updates

we don't have any driver anymore where we have userspace expecting
solid legacy cursor support _and_ they are using the atomic helpers in
their fully glory. So we can retire this.

v3: Paper over msm and i915 regression. The complete_all is the only
thing missing afaict.

v4: Fixup i915 fixup ...

v5: Unallocate the crtc->event in msm to avoid hitting a WARN_ON in
dpu_crtc_atomic_flush(). This is a bit a hack, but simplest way to
untangle this all. Thanks to Abhinav Kumar for the debug help.

Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <maxime@cerno.tech>
References: https://bugzilla.kernel.org/show_bug.cgi?id=199425
References: https://lore.kernel.org/all/20220221134155.125447-9-maxime@cerno.tech/
References: https://bugzilla.kernel.org/show_bug.cgi?id=199425
Cc: Maxime Ripard <maxime@cerno.tech>
Tested-by: Maxime Ripard <maxime@cerno.tech>
Cc: mikita.lipski@amd.com
Cc: Michel Dänzer <michel@daenzer.net>
Cc: harry.wentland@amd.com
Cc: Rob Clark <robdclark@gmail.com>
Cc: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_atomic_helper.c          | 13 -------------
 drivers/gpu/drm/i915/display/intel_display.c | 14 ++++++++++++++
 drivers/gpu/drm/msm/msm_atomic.c             | 15 +++++++++++++++
 3 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d579fd8f7cb8..f6b4c3a00684 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1587,13 +1587,6 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
 	int i, ret;
 	unsigned int crtc_mask = 0;
 
-	 /*
-	  * Legacy cursor ioctls are completely unsynced, and userspace
-	  * relies on that (by doing tons of cursor updates).
-	  */
-	if (old_state->legacy_cursor_update)
-		return;
-
 	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
 		if (!new_crtc_state->active)
 			continue;
@@ -2244,12 +2237,6 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 			continue;
 		}
 
-		/* Legacy cursor updates are fully unsynced. */
-		if (state->legacy_cursor_update) {
-			complete_all(&commit->flip_done);
-			continue;
-		}
-
 		if (!new_crtc_state->event) {
 			commit->event = kzalloc(sizeof(*commit->event),
 						GFP_KERNEL);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 3479125fbda6..2454451fcf95 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7651,6 +7651,20 @@ static int intel_atomic_commit(struct drm_device *dev,
 		intel_runtime_pm_put(&dev_priv->runtime_pm, state->wakeref);
 		return ret;
 	}
+
+	/*
+	 * FIXME: Cut over to (async) commit helpers instead of hand-rolling
+	 * everything.
+	 */
+	if (state->base.legacy_cursor_update) {
+		struct intel_crtc_state *new_crtc_state;
+		struct intel_crtc *crtc;
+		int i;
+
+		for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
+			complete_all(&new_crtc_state->uapi.commit->flip_done);
+	}
+
 	intel_shared_dpll_swap_state(state);
 	intel_atomic_track_fbs(state);
 
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 1686fbb611fd..b7151767b567 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -189,6 +189,19 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	bool async = kms->funcs->vsync_time &&
 			can_do_async(state, &async_crtc);
 
+	/*
+	 * FIXME: Convert to async plane helpers and remove the various hacks to
+	 * keep the old legacy_cursor_way of doing async commits working for the
+	 * dpu code, like the expectation that these don't have a crtc->event.
+	 */
+	if (async) {
+		/* both ->event itself and the pointer hold a reference! */
+		drm_crtc_commit_put(async_crtc->state->commit);
+		drm_crtc_commit_put(async_crtc->state->commit);
+		kfree(async_crtc->state->event);
+		async_crtc->state->event = NULL;
+	}
+
 	trace_msm_atomic_commit_tail_start(async, crtc_mask);
 
 	kms->funcs->enable_commit(kms);
@@ -222,6 +235,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 		/* async updates are limited to single-crtc updates: */
 		WARN_ON(crtc_mask != drm_crtc_mask(async_crtc));
 
+		complete_all(&async_crtc->state->commit->flip_done);
+
 		/*
 		 * Start timer if we don't already have an update pending
 		 * on this crtc:
-- 
2.39.0

