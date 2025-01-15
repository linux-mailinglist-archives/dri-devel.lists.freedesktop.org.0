Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B0CA12D1F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:05:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1261A10E107;
	Wed, 15 Jan 2025 21:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X7oDNsbM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CAC10E107
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:05:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D8F5EA42503;
 Wed, 15 Jan 2025 21:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E4FC4CEE1;
 Wed, 15 Jan 2025 21:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975144;
 bh=6ckx9CZvlTSjCbDIC22eA0KmGebnaJfAaI11J96XgL8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=X7oDNsbMUqOZ2nxr1qXnWSQw7tTXhewLgar4NWvbIae+PH/3Z7FpRpijNxQac1RRQ
 MNr1OBnYuCfwVDcuOuyf+KZKAuZ4IR6K8qDF2nvyqH7raxb66LI7UkYXUVrvCCV70Y
 NPSqVXylaN+c3OotEuvR0BdiPA0kbRNdTuGXzKEoevH5CdN/6Eqmqcl3WUrcbcswNf
 QPVENMDuUp9WmBixya1VTl2Nw/Fn3ZXBMd7NFA0MVcBKBGaEat/uGbC3TWjFv8VL7r
 eIScfZ0UBoczeaLhFl2MaKGWUYlTLt25lP0N7mh/fbLsaJMCfzhgBv9qPgp9wk+q3m
 oIdFYm2ddEPPg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:08 +0100
Subject: [PATCH 01/29] drm/atomic-helper: Fix commit_tail state variable name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-1-9a2fecd886a6@kernel.org>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
In-Reply-To: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3025; i=mripard@kernel.org;
 h=from:subject:message-id; bh=6ckx9CZvlTSjCbDIC22eA0KmGebnaJfAaI11J96XgL8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdyqLs60OP2j15q3Fr1oPYCRf+OW0omv2BP+lSok9Ia
 6SZ+APOjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARy1DG+uKC563zLOaW/z4m
 f0jCJne567pv3DP+phy1CEsQOmQmePJwmNW6KyznLr//oGH0jdfiAWM1u3LH6bpiEd+/C7fNiJR
 ecP35R7uY8jPzp7T/CtzR3Zf1PtC6kfuW4NUPJxwFWl6JulsCAA==
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

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 40e4e1b6c9110677c1c4981eeb15dc93966f4cf6..913d94d664d885323ad7e41a6424633c28c787e1 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1818,13 +1818,13 @@ void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *old_state)
 
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
@@ -1842,37 +1842,37 @@ static void commit_tail(struct drm_atomic_state *old_state)
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
2.47.1

