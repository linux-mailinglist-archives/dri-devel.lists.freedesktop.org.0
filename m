Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A447A342FD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA9810EADB;
	Thu, 13 Feb 2025 14:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BRQz/BMK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424D510EADA
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:44:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 27D1BA42633;
 Thu, 13 Feb 2025 14:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C2FC4CEE7;
 Thu, 13 Feb 2025 14:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457852;
 bh=yGpnS+bYKk0E6Y2+/FI6asLPESf8ZlRcD1McZsZgydY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=BRQz/BMKy+nn7SKUQdVOSM8MJBR5b2wrVf5IhHik2mtfoyduMfZCCspBD35Usd16f
 4yeMAVJ1gcbl1Hq8cObOdWiRJPNod6hHPZQIqRxREKpQ+35FA4OeDp3t5xrqqZLltf
 0+AqZWziQ4Cgsdi5L4kxEq/MetdKcrxt6oTbaFGKEqge7ioGC/6lt18d3i8nBWoEb9
 Lt9t/cbtwEcQBh+yZNxxT6ErVhE/lc5h0FgXyeFlbGdMJ8m6UfOMxKL3gTF32KiHDb
 4Fr83buywEMQ+6fITlfrYZCBQOYLA0oFXeKIaGph+frKyBmyPVHgiGTemEFMP2EuwY
 n2z8zEhxRAg2g==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:25 +0100
Subject: [PATCH v3 06/37] drm/atomic-helper: Fix commit_tail state variable
 name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-6-e71598f49c8f@kernel.org>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
In-Reply-To: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3086; i=mripard@kernel.org;
 h=from:subject:message-id; bh=yGpnS+bYKk0E6Y2+/FI6asLPESf8ZlRcD1McZsZgydY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWCVEHtsY/ZGTm5OyIPTvgUu7lXcZsh0pZOX9M1di+
 0TN1valHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiH+0Z66v39e2Xbe9wvJC9
 0Uju65qP505+ePeyOdMxOfmGJ1PGVP/Utf+1PN72XzFYlG2m8cj3K2PDoaNXJgqo8c6JlY1b8S6
 F/9re14F7uwOrQg7GL5jyYv9iuSuzlpjuvvXga5Hzwm59yY9mAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Even though the commit_tail () drm_atomic_state parameter is called
old_state, it's actually the state being committed which is confusing.

It's even more confusing since the atomic_commit_tail hook being called
by commit_tail() parameter is called state.

Let's rename the variable from old_state to state to make it less
confusing.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 26bf2465cee7807d640881ddcb8edc2f972e79d1..e8c30e151dc0af13fbf3d282cc8c5c32ef00c8ee 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1828,13 +1828,13 @@ void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *old_state)
 
 	drm_atomic_helper_cleanup_planes(dev, old_state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_tail_rpm);
 
-static void commit_tail(struct drm_atomic_state *old_state)
+static void commit_tail(struct drm_atomic_state *state)
 {
-	struct drm_device *dev = old_state->dev;
+	struct drm_device *dev = state->dev;
 	const struct drm_mode_config_helper_funcs *funcs;
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_crtc *crtc;
 	ktime_t start;
 	s64 commit_time_ms;
@@ -1852,37 +1852,37 @@ static void commit_tail(struct drm_atomic_state *old_state)
 	 * These times will be averaged out in the self refresh helpers to avoid
 	 * overreacting over one outlier frame
 	 */
 	start = ktime_get();
 
-	drm_atomic_helper_wait_for_fences(dev, old_state, false);
+	drm_atomic_helper_wait_for_fences(dev, state, false);
 
-	drm_atomic_helper_wait_for_dependencies(old_state);
+	drm_atomic_helper_wait_for_dependencies(state);
 
 	/*
 	 * We cannot safely access new_crtc_state after
 	 * drm_atomic_helper_commit_hw_done() so figure out which crtc's have
 	 * self-refresh active beforehand:
 	 */
-	for_each_new_crtc_in_state(old_state, crtc, new_crtc_state, i)
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
 		if (new_crtc_state->self_refresh_active)
 			new_self_refresh_mask |= BIT(i);
 
 	if (funcs && funcs->atomic_commit_tail)
-		funcs->atomic_commit_tail(old_state);
+		funcs->atomic_commit_tail(state);
 	else
-		drm_atomic_helper_commit_tail(old_state);
+		drm_atomic_helper_commit_tail(state);
 
 	commit_time_ms = ktime_ms_delta(ktime_get(), start);
 	if (commit_time_ms > 0)
-		drm_self_refresh_helper_update_avg_times(old_state,
+		drm_self_refresh_helper_update_avg_times(state,
 						 (unsigned long)commit_time_ms,
 						 new_self_refresh_mask);
 
-	drm_atomic_helper_commit_cleanup_done(old_state);
+	drm_atomic_helper_commit_cleanup_done(state);
 
-	drm_atomic_state_put(old_state);
+	drm_atomic_state_put(state);
 }
 
 static void commit_work(struct work_struct *work)
 {
 	struct drm_atomic_state *state = container_of(work,

-- 
2.48.0

