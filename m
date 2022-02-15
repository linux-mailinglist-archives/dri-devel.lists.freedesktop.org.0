Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F28B4B7B74
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 00:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E647D10E1A1;
	Tue, 15 Feb 2022 23:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3D010E1A1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 23:54:56 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 a11-20020a17090a740b00b001b8b506c42fso4924078pjg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 15:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XCMuYxh+2di03JYmyV8dujrYzv3SXhYvMBvZiel5/fo=;
 b=ccxhsBMFOCVfhgnoeerlnPe9CGG4uxGXLAYEhClhIyCP3tNpTcHx/x+JN4ucRCwQL2
 WqY6MYRiz8wL1xuFwwtTVnDt4SsyShQuW1OnmDwEiIOaAiSnJKUYtZyf5HqPE0WTprMn
 +7Llc0763f37U4Tbbu48tie2OA6UAMwycMI/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XCMuYxh+2di03JYmyV8dujrYzv3SXhYvMBvZiel5/fo=;
 b=IdiNCdKz/mXmv+IKZOtgadyhCnaOSpjTRSFQsbe30BkSXRldk1u185eobXHoq8YyEP
 98NRw71pDRP7JZKifij171CG5TvA0VgV2zUNZSCYvI7yNFbF7yc/RRqf65gp8cZ6JQTy
 45SzBehaZdQNxt41tjxRDnVc7j9ZeFM1LWUQK9f73YUMYOx6HuQXXNnt6/0RyNeOYCmn
 nfZ8q7cAH5iP3IhPy+/OF95oNEh1e21S5cAuXP0XBiV1LwYNo96BQxVtGjd/WM6Eq6rg
 pfcQlHlr4B+vpq6HacflCouc6R7mW8WT9llgcaxj9+JC7Yv7fUukY0FooB4IxndTr1oo
 tS+A==
X-Gm-Message-State: AOAM530vj4Y1HWuoZx3BgpGPBgkhuPPM2oMn30qsSLJqvc/f2yQ2Hb8l
 dDST+H+LCxNu1pzICZAw6Py48w==
X-Google-Smtp-Source: ABdhPJx6l/DF/88bJJ5I6OrdrZ57LWHcn7N2oIe+IhY40ktSvgddR6j7CB8zOcFwdg0ZCwoVNOcHcQ==
X-Received: by 2002:a17:90b:4a02:b0:1b8:d3c7:7a2b with SMTP id
 kk2-20020a17090b4a0200b001b8d3c77a2bmr7163388pjb.194.1644969295688; 
 Tue, 15 Feb 2022 15:54:55 -0800 (PST)
Received: from localhost ([2620:15c:202:201:97ca:4b5:7d22:b276])
 by smtp.gmail.com with UTF8SMTPSA id a12sm38166601pfv.18.2022.02.15.15.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 15:54:55 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] drm/atomic: Force bridge self-refresh-exit on CRTC switch
Date: Tue, 15 Feb 2022 15:54:20 -0800
Message-Id: <20220215155417.2.Ic15a2ef69c540aee8732703103e2cff51fb9c399@changeid>
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

Cc: <stable@vger.kernel.org>
Fixes: 1452c25b0e60 ("drm: Add helpers to kick off self refresh mode in drivers")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/gpu/drm/drm_atomic_helper.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 9603193d2fa1..74161d007894 100644
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
+	if (old_state->self_refresh_active && new_state->enable &&
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
2.35.1.265.g69c8d7142f-goog

