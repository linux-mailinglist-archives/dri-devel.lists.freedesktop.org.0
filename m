Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6561321840F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 11:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F8789D8A;
	Wed,  8 Jul 2020 09:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37DE89C8D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 09:44:53 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j4so45737870wrp.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 02:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ybJ4Dnit1irkirbDl3HEXrQn20c76yC56MxL58jaKo0=;
 b=TEa4WFPfW4ItE+FDvtLsRF0xRzc2cbkTSV1DUBqJ06eX2fie/xQr2PU70ooGjgVoXz
 3NHwLWzyHSm5ttzKMjgHnPEtXKwMCBkwKPSepx+PS8CmgZdnWP+M7H9pTES3h0T/7lwN
 6NA0o3CmTIEedYrAQ/U4VqN5r2XIxWbkI/Ojo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ybJ4Dnit1irkirbDl3HEXrQn20c76yC56MxL58jaKo0=;
 b=ZearFkKgF0M60qibrQz77uATVCyHB13G0AhzgUk1OMt/YEsArHocNVAno636OwqZmL
 yDkuz0Sz5yDLNP7m62k+EWCKYSCewZmdPUIFC45fuGGpG8omppEx2JAmcYl67jSARQZw
 t9cZz3Rc8X/5fXfxFSfByPCLYx8r3/PotFU+G8pwp0RuNLPT3UJtvxWC7+ArDikpPy+j
 NguWc79ekGn4l8yzS3FWJzi69AZ21e4wbaM/EwSyX3NeiqYU7OoMHwDgmPz55OKSUl6I
 tqcngnUnO1M/En52g+kCZVFHCIzheRZeOQOi8DbyONpy2mr6RmWBskSydDZlei976m7M
 Awmg==
X-Gm-Message-State: AOAM530dRtiLa8mNrxLD7tWX3DJPlqPFqVOUZ1DR5ADm9fvghgslikG0
 6h7CFgch6pJElEwWjBBDJu/zB08w3XA=
X-Google-Smtp-Source: ABdhPJyujhwjsPlc2lYR6xS9eQSUtg+sV4F/+yXT/gXEwYN5qcPuzGw5pVb/Smu0G+/jU2tEPVU+eQ==
X-Received: by 2002:adf:f350:: with SMTP id e16mr55862343wrp.43.1594201492225; 
 Wed, 08 Jul 2020 02:44:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j4sm4860356wrp.51.2020.07.08.02.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 02:44:51 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/tilcdc: Use standard drm_atomic_helper_commit
Date: Wed,  8 Jul 2020 11:44:46 +0200
Message-Id: <20200708094446.508414-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707201229.472834-16-daniel.vetter@ffwll.ch>
References: <20200707201229.472834-16-daniel.vetter@ffwll.ch>
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Gives us proper nonblocking support for free, and a pile of other
things. The tilcdc code is simply old enough that it was never
converted over, but was stuck forever with the copypasta from when it
was initially merged.

The riskiest thing with this conversion is maybe that there's an issue
with the vblank handling or vblank event handling, which will upset
the modern commit support in atomic helpers. But from a cursory review
drm_crtc_vblank_on/off is called in the right places, and the event
handling also seems to exist (albeit with much hand-rolling and
probably some races, could perhaps be converted over to
drm_crtc_arm_vblank_event without any real loss).

Motivated by me not having to hand-roll the dma-fence annotations for
this.

v2: Clear out crtc_state->event when we're handling the event, to
avoid upsetting the helpers (reported by Jyri).

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
--
I'm not really sure whether the event handling is correct for when a
crtc gets disabled. dpms off or similar would be a good test, assuming
this patch here fixes the first issue.
-Daniel
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c   | 47 +--------------------------
 drivers/gpu/drm/tilcdc/tilcdc_plane.c |  8 +++--
 2 files changed, 6 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 0d74a6443263..4f5fc3e87383 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -87,55 +87,10 @@ static int tilcdc_atomic_check(struct drm_device *dev,
 	return ret;
 }
 
-static int tilcdc_commit(struct drm_device *dev,
-		  struct drm_atomic_state *state,
-		  bool async)
-{
-	int ret;
-
-	ret = drm_atomic_helper_prepare_planes(dev, state);
-	if (ret)
-		return ret;
-
-	ret = drm_atomic_helper_swap_state(state, true);
-	if (ret) {
-		drm_atomic_helper_cleanup_planes(dev, state);
-		return ret;
-	}
-
-	/*
-	 * Everything below can be run asynchronously without the need to grab
-	 * any modeset locks at all under one condition: It must be guaranteed
-	 * that the asynchronous work has either been cancelled (if the driver
-	 * supports it, which at least requires that the framebuffers get
-	 * cleaned up with drm_atomic_helper_cleanup_planes()) or completed
-	 * before the new state gets committed on the software side with
-	 * drm_atomic_helper_swap_state().
-	 *
-	 * This scheme allows new atomic state updates to be prepared and
-	 * checked in parallel to the asynchronous completion of the previous
-	 * update. Which is important since compositors need to figure out the
-	 * composition of the next frame right after having submitted the
-	 * current layout.
-	 */
-
-	drm_atomic_helper_commit_modeset_disables(dev, state);
-
-	drm_atomic_helper_commit_planes(dev, state, 0);
-
-	drm_atomic_helper_commit_modeset_enables(dev, state);
-
-	drm_atomic_helper_wait_for_vblanks(dev, state);
-
-	drm_atomic_helper_cleanup_planes(dev, state);
-
-	return 0;
-}
-
 static const struct drm_mode_config_funcs mode_config_funcs = {
 	.fb_create = drm_gem_fb_create,
 	.atomic_check = tilcdc_atomic_check,
-	.atomic_commit = tilcdc_commit,
+	.atomic_commit = drm_atomic_helper_commit,
 };
 
 static void modeset_init(struct drm_device *dev)
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
index 0d09b31ae759..2f681a713815 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
@@ -83,9 +83,11 @@ static void tilcdc_plane_atomic_update(struct drm_plane *plane,
 	if (WARN_ON(!state->fb || !state->crtc->state))
 		return;
 
-	tilcdc_crtc_update_fb(state->crtc,
-			      state->fb,
-			      state->crtc->state->event);
+	if (tilcdc_crtc_update_fb(state->crtc,
+				  state->fb,
+				  state->crtc->state->event) == 0) {
+		state->crtc->state->event = NULL;
+	}
 }
 
 static const struct drm_plane_helper_funcs plane_helper_funcs = {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
