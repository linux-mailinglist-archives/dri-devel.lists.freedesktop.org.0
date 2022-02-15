Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 837CD4B7B76
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 00:55:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E77810E5C1;
	Tue, 15 Feb 2022 23:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C4B10E1A1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 23:54:53 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id i21so649432pfd.13
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 15:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OTjPJEv3ppz+4wwYIsjeEfkrs5jHH+xc9iC4EpIvllM=;
 b=bX3WqJk+exjCq2P0E71uHI+d1H1gMFVhRanSZrq0RtyTM6ZnoNrpgaDZmfh8JQIb3P
 9lp7dBU45gQfukf/Ecau1JNWXrD6fV/DwJL6kzQ6tqPKRPjQ0vg2uzA8LmE/DFcotBI8
 Mb3q+EwmEEHoIF4mG07cGcDG8P8BPqZR0KveU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OTjPJEv3ppz+4wwYIsjeEfkrs5jHH+xc9iC4EpIvllM=;
 b=hrAi6RYy1nlc/sPpUyBS9xrK+1ru/9qfcLsfLV4lR1rf2ZUak3/fLKg6PQ8N5arlxP
 wZ+ZZN2cGpk7uq9Cql8Qg5E9xgbaDg3Ymt1ZLsHDXV5JPKLzzpAghqWqKW1bQt8RZ93b
 HegKRkDZ/imbK+eQmNV1rB+OFBrj+juZlinbkT0r9BTT/KYS+NKVhufG+Q4OLO38tXo5
 /bgs63G8OnnlOh2shSxGsMJIPpq8S7DPiqcfNwV8QIxfFo5wAEhrUVeF4zBXu9Q4nsb2
 wv3uquInpc6E4Vm0cEBuUhOH4QQ0EcRtDmLwlbDK/ANJsUrq+/UHOkvFNHAGV2+nzX+Q
 bzAg==
X-Gm-Message-State: AOAM531n9r2C5riG7+LKkaF+08KnuLs+dbQe8ezt/9o5WjKhTLLNlkNT
 M13zQhC9F81a39C6si6iwL6g/g==
X-Google-Smtp-Source: ABdhPJyJigo6j1/TFkCRK+3+g9/LHae8UwKZbETfFM8qk5v8BSLotLEGqFJiM6DKZdJXWUXfP0QCWA==
X-Received: by 2002:a62:5347:0:b0:4e0:2ea8:9f6c with SMTP id
 h68-20020a625347000000b004e02ea89f6cmr396742pfb.61.1644969293185; 
 Tue, 15 Feb 2022 15:54:53 -0800 (PST)
Received: from localhost ([2620:15c:202:201:97ca:4b5:7d22:b276])
 by smtp.gmail.com with UTF8SMTPSA id gb8sm3325304pjb.21.2022.02.15.15.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 15:54:52 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] drm/bridge: analogix_dp: Support PSR-exit to disable
 transition
Date: Tue, 15 Feb 2022 15:54:19 -0800
Message-Id: <20220215155417.1.I161904be17ba14526f78536ccd78b85818449b51@changeid>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
In-Reply-To: <20220215235420.1284208-1-briannorris@chromium.org>
References: <20220215235420.1284208-1-briannorris@chromium.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 stable@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most eDP panel functions only work correctly when the panel is not in
self-refresh. In particular, analogix_dp_bridge_disable() tends to hit
AUX channel errors if the panel is in self-refresh.

Given the above, it appears that so far, this driver assumes that we are
never in self-refresh when it comes time to fully disable the bridge.
Prior to commit 846c7dfc1193 ("drm/atomic: Try to preserve the crtc
enabled state in drm_atomic_remove_fb, v2."), this tended to be true,
because we would automatically disable the pipe when framebuffers were
removed, and so we'd typically disable the bridge shortly after the last
display activity.

However, that is not guaranteed: an idle (self-refresh) display pipe may
be disabled, e.g., when switching CRTCs. We need to exit PSR first.

Stable notes: this is definitely a bugfix, and the bug has likely
existed in some form for quite a while. It may predate the "PSR helpers"
refactor, but the code looked very different before that, and it's
probably not worth rewriting the fix.

Cc: <stable@vger.kernel.org>
Fixes: 6c836d965bad ("drm/rockchip: Use the helpers for PSR")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 .../drm/bridge/analogix/analogix_dp_core.c    | 42 +++++++++++++++++--
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index b7d2e4449cfa..6ee0f62a7161 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1268,6 +1268,25 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 	return 0;
 }
 
+static
+struct drm_crtc *analogix_dp_get_old_crtc(struct analogix_dp_device *dp,
+					  struct drm_atomic_state *state)
+{
+	struct drm_encoder *encoder = dp->encoder;
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+
+	connector = drm_atomic_get_old_connector_for_encoder(state, encoder);
+	if (!connector)
+		return NULL;
+
+	conn_state = drm_atomic_get_old_connector_state(state, connector);
+	if (!conn_state)
+		return NULL;
+
+	return conn_state->crtc;
+}
+
 static
 struct drm_crtc *analogix_dp_get_new_crtc(struct analogix_dp_device *dp,
 					  struct drm_atomic_state *state)
@@ -1448,14 +1467,16 @@ analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 {
 	struct drm_atomic_state *old_state = old_bridge_state->base.state;
 	struct analogix_dp_device *dp = bridge->driver_private;
-	struct drm_crtc *crtc;
+	struct drm_crtc *old_crtc, *new_crtc;
+	struct drm_crtc_state *old_crtc_state = NULL;
 	struct drm_crtc_state *new_crtc_state = NULL;
+	int ret;
 
-	crtc = analogix_dp_get_new_crtc(dp, old_state);
-	if (!crtc)
+	new_crtc = analogix_dp_get_new_crtc(dp, old_state);
+	if (!new_crtc)
 		goto out;
 
-	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
+	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, new_crtc);
 	if (!new_crtc_state)
 		goto out;
 
@@ -1464,6 +1485,19 @@ analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 		return;
 
 out:
+	old_crtc = analogix_dp_get_old_crtc(dp, old_state);
+	if (old_crtc) {
+		old_crtc_state = drm_atomic_get_old_crtc_state(old_state,
+							       old_crtc);
+
+		/* When moving from PSR to fully disabled, exit PSR first. */
+		if (old_crtc_state && old_crtc_state->self_refresh_active) {
+			ret = analogix_dp_disable_psr(dp);
+			if (ret)
+				DRM_ERROR("Failed to disable psr (%d)\n", ret);
+		}
+	}
+
 	analogix_dp_bridge_disable(bridge);
 }
 
-- 
2.35.1.265.g69c8d7142f-goog

