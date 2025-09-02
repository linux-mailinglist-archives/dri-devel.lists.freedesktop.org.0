Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595FCB3F885
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773F810E5EB;
	Tue,  2 Sep 2025 08:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mImlMD6d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC0110E5E9
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:33:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3638A6020B;
 Tue,  2 Sep 2025 08:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9039FC4CEF7;
 Tue,  2 Sep 2025 08:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756802021;
 bh=D+1PlyzQZJSGxoRUBwJ5wrqa9UanKG0XdziPaR9YWbc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mImlMD6dQA+/LO6bh0u9xq1eWJH1SZprzLuDqgy42tVX5zvFD8NYbCa33rMt9ey7Y
 r0UOEFiheZBFJEMuHv3epywusWGGL6+/IA9KUuX63tcRHUcEL+D/gc+AzpdsGHbrg6
 biztYhWicNC2vcja/tgIfKX1GS+e2s24FDBfPUl/shXc+CXES40rfvhdD2Q/KRlmvr
 +hUbJH7bmcow5Gk2LWLSb+iiA5iESZcmJvpJDuDTHsy/Gz7L8KktJLnVd47Ja9T8AQ
 F7PPNPNXSJ0TUy0Ydq6gjij+kAGdZkNNYfU/HoNWT6PFhmOICLw4pxx8Lqb4yXf4pj
 Z4Xp+ZrKOT0CA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 10:32:40 +0200
Subject: [PATCH 12/29] drm/atomic_helper: Pass nonblock to commit_tail
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-state-readout-v1-12-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
In-Reply-To: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1814; i=mripard@kernel.org;
 h=from:subject:message-id; bh=D+1PlyzQZJSGxoRUBwJ5wrqa9UanKG0XdziPaR9YWbc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbVu+sb7JzSXG/FjaFYeWW19rHq3Wepl3TvV5aaVXaG
 b+P48mMjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARbjHGhmPKpwMMZr3Ktviz
 VyKuXP1cxmt7Gb/8u2vnKojX7Ix5yBwanv/p+JfHs2zubjr79sW894w1/LwyhuWcV1Y1dEldO/I
 m6u/XNdxd5x4FpPNJXQ3072fr3JZeUt/gx+e/qYn7osjE51oA
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

We'll need to know if a commit is blocking or non-blocking in
commit_tail later on, so let's pass it along.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index f59512476ebf2b48e1c7034950bcaf99237f03c6..14d9bc282ca570964e494936090898b2dc6bee31 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2332,11 +2332,11 @@ void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *state)
 
 	drm_atomic_helper_cleanup_planes(dev, state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_tail_rpm);
 
-static void commit_tail(struct drm_atomic_state *state)
+static void commit_tail(struct drm_atomic_state *state, bool nonblock)
 {
 	struct drm_device *dev = state->dev;
 	const struct drm_mode_config_helper_funcs *funcs;
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_crtc *crtc;
@@ -2390,11 +2390,11 @@ static void commit_tail(struct drm_atomic_state *state)
 static void commit_work(struct work_struct *work)
 {
 	struct drm_atomic_state *state = container_of(work,
 						      struct drm_atomic_state,
 						      commit_work);
-	commit_tail(state);
+	commit_tail(state, true);
 }
 
 /**
  * drm_atomic_helper_async_check - check if state can be committed asynchronously
  * @dev: DRM device
@@ -2610,11 +2610,11 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 
 	drm_atomic_state_get(state);
 	if (nonblock)
 		queue_work(system_unbound_wq, &state->commit_work);
 	else
-		commit_tail(state);
+		commit_tail(state, false);
 
 	return 0;
 
 err:
 	drm_atomic_helper_unprepare_planes(dev, state);

-- 
2.50.1

