Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AB04C7A48
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 21:26:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9580310E8B4;
	Mon, 28 Feb 2022 20:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B51F10E685
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 20:25:59 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id g1so12076941pfv.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 12:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JYJS0+baIpj8rNk1gxFjQtSNQLz0w5fW/GZ4P6Cva34=;
 b=NtBj2377xC9UwhgXdBGz78ZGGbAgv+utx1c/2FxM08P9KP+6cQCgHNSCuUa6K2g/ot
 wLF0mQ2Tzf0O/FdNrPPV8s8rvp7/x0FZBKLgJVqg2mi3PjsAQP1PqggPaJun9dTCOqau
 Tz+PbS0+pVtyzDyGcZHoOtWHeUVJzr9f3TuDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JYJS0+baIpj8rNk1gxFjQtSNQLz0w5fW/GZ4P6Cva34=;
 b=yFb0eq6qnmkm2N2GtFywmklk41e2MRV1Hs2JkrcM27HK92W3g2iyHuzTboXytkdvOy
 RoB2M/BtOI2/jq2H1viu5P/zoF8OudaESXzGR/EruTwkiSPm+ECBk0bJ6fOXS396Xmf5
 iGpzEKc6tx0LR4GWgYhgFSX5J7MPFqB8LjAbqGkaNkcLs+6p6em/hlg4fylxGkJBDpka
 j8VV9EGgv7os+RBKtm4x12jrPewF7ei4J/4VjAE7je38uKBwZK98nslp49FQH23wbeyX
 kCy+NJ+Z8iKeQ0PsaaGXEO4r5PSu9rTg6cKFPQ1AQkd8Ko85m3TT91xtCxhLe0CvK2F1
 oRWw==
X-Gm-Message-State: AOAM532DcqJ6ZQ+v2il/bgapJEmt9VvAd3hVAth6qQSFiKDJsv2rlnqY
 vaj9n1WjfcPIKks4t/+i+aR3KQ==
X-Google-Smtp-Source: ABdhPJzA2n4xckiPWFfvi2ErCa67YVQqABCW741BDbD621t4ro8ENXSJcL3UE0iJi9/RyWEl4pHfeA==
X-Received: by 2002:a63:1003:0:b0:378:7d70:2ec5 with SMTP id
 f3-20020a631003000000b003787d702ec5mr8779623pgl.351.1646079958576; 
 Mon, 28 Feb 2022 12:25:58 -0800 (PST)
Received: from localhost ([2620:15c:202:201:ba66:7507:a6af:82f1])
 by smtp.gmail.com with UTF8SMTPSA id
 p10-20020a056a000b4a00b004e12fd48035sm14633629pfo.96.2022.02.28.12.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 12:25:58 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/2] drm/atomic: Force bridge self-refresh-exit on CRTC
 switch
Date: Mon, 28 Feb 2022 12:25:32 -0800
Message-Id: <20220228122522.v2.2.Ic15a2ef69c540aee8732703103e2cff51fb9c399@changeid>
X-Mailer: git-send-email 2.35.1.574.g5d30c73bfb-goog
In-Reply-To: <20220228202532.869740-1-briannorris@chromium.org>
References: <20220228202532.869740-1-briannorris@chromium.org>
MIME-Version: 1.0
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liu Ying <victor.liu@oss.nxp.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's possible to change which CRTC is in use for a given
connector/encoder/bridge while we're in self-refresh without fully
disabling the connector/encoder/bridge along the way. This can confuse
the bridge encoder/bridge, because
(a) it needs to track the SR state (trying to perform "active"
    operations while the panel is still in SR can be Bad(TM)); and
(b) it tracks the SR state via the CRTC state (and after the switch, the
    previous SR state is lost).

Thus, we need to either somehow carry the self-refresh state over to the
new CRTC, or else force an encoder/bridge self-refresh transition during
such a switch.

I choose the latter, so we disable the encoder (and exit PSR) before
attaching it to the new CRTC (where we can continue to assume a clean
(non-self-refresh) state).

This fixes PSR issues seen on Rockchip RK3399 systems with
drivers/gpu/drm/bridge/analogix/analogix_dp_core.c.

Change in v2:

- Drop "->enable" condition; this could possibly be "->active" to
  reflect the intended hardware state, but it also is a little
  over-specific. We want to make a transition through "disabled" any
  time we're exiting PSR at the same time as a CRTC switch.
  (Thanks Liu Ying)

Cc: Liu Ying <victor.liu@oss.nxp.com>
Cc: <stable@vger.kernel.org>
Fixes: 1452c25b0e60 ("drm: Add helpers to kick off self refresh mode in drivers")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 9603193d2fa1..987e4b212e9f 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1011,9 +1011,19 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
 		return drm_atomic_crtc_effectively_active(old_state);
 
 	/*
-	 * We need to run through the crtc_funcs->disable() function if the CRTC
-	 * is currently on, if it's transitioning to self refresh mode, or if
-	 * it's in self refresh mode and needs to be fully disabled.
+	 * We need to disable bridge(s) and CRTC if we're transitioning out of
+	 * self-refresh and changing CRTCs at the same time, because the
+	 * bridge tracks self-refresh status via CRTC state.
+	 */
+	if (old_state->self_refresh_active &&
+	    old_state->crtc != new_state->crtc)
+		return true;
+
+	/*
+	 * We also need to run through the crtc_funcs->disable() function if
+	 * the CRTC is currently on, if it's transitioning to self refresh
+	 * mode, or if it's in self refresh mode and needs to be fully
+	 * disabled.
 	 */
 	return old_state->active ||
 	       (old_state->self_refresh_active && !new_state->active) ||
-- 
2.35.1.574.g5d30c73bfb-goog

