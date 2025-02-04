Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E1CA274FB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 15:58:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A89510E66B;
	Tue,  4 Feb 2025 14:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N6M2ZuZm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99B610E11A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 14:58:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6BAF05C6A2E;
 Tue,  4 Feb 2025 14:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBE0C4CEE6;
 Tue,  4 Feb 2025 14:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681088;
 bh=X/3X9gxwaw8y2mFAmNJm5vGCvb0YBUiIDCVUdWp06Ew=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=N6M2ZuZm0VfTIRo2LpBoAaP/an1HfF3EJ2G6Pk71b/lpg+GW325i3VKOjjKFtZQNJ
 b8P86FRLzM6GoDHXDi2e+sExNHEgtguJ+LM2mXyGEKafvYUP1Kc/MPgJRMLI4tgixZ
 rdJ12lUprI9xj/WaZ5+02z7bOFqFgujmqUXRBIHPPUotskbh6Xlm9d76O3DlLHS5Ls
 RPGDmK2jMmug2hrU3g2bhY4YQxWvppB/K0+iWzglLgVKYYMBGSRULZhFv2pnbp0Mj7
 KwrkQWEAJXS56CDlzAGqszaFjuWDt/QF197s9miWJD3cuFJXiMJWBLuKGQDe0YX9iW
 8+i91BhKCaPXQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:29 +0100
Subject: [PATCH v2 01/35] drm/atomic: Document history of drm_atomic_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-1-35dd6c834e08@kernel.org>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2948; i=mripard@kernel.org;
 h=from:subject:message-id; bh=X/3X9gxwaw8y2mFAmNJm5vGCvb0YBUiIDCVUdWp06Ew=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtF7GtEpN2fTntrL0/C1LJx/Ku+TxzUYha9viOieHt
 VNMT25S6pjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQAT2XOdsWFpifjDqMPHFumr
 f742d/ftuO2vblzs+/s34djSD5OV/FVt3APOlXwIn/rXYpXyXcf78WKM9eUOT3612FWdvfpmgrf
 3vIeFHzNYk/XeivI0P5C6eF2VdyfD2qt6NwtqjTW/c+Uc3+d2GAA=
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

After some discussions on the mailing-list for an earlier revision of
the series, it was suggested to document the evolution of
drm_atomic_state and its use by drivers to explain some of the confusion
one might still encounter when reading the framework code.

Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
Link: https://lore.kernel.org/dri-devel/Z4jtKHY4qN3RNZNG@phenom.ffwll.local/
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 31ca88deb10d262fb3a3f8e14d2afe24f8410cb1..7af43062e5ca8c30b3fd600a34543e79137ab3ea 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -355,10 +355,41 @@ struct __drm_private_objs_state {
  * these.
  *
  * States are added to an atomic update by calling drm_atomic_get_crtc_state(),
  * drm_atomic_get_plane_state(), drm_atomic_get_connector_state(), or for
  * private state structures, drm_atomic_get_private_obj_state().
+ *
+ * NOTE: struct drm_atomic_state first started as a single collection of
+ * entities state pointers (drm_plane_state, drm_crtc_state, etc.).
+ *
+ * At atomic_check time, you could get the state about to be committed
+ * from drm_atomic_state, and the one currently running from the
+ * entities state pointer (drm_crtc.state, for example). After the call
+ * to drm_atomic_helper_swap_state(), the entities state pointer would
+ * contain the state previously checked, and the drm_atomic_state
+ * structure the old state.
+ *
+ * Over time, and in order to avoid confusion, drm_atomic_state has
+ * grown to have both the old state (ie, the state we replace) and the
+ * new state (ie, the state we want to apply). Those names are stable
+ * during the commit process, which makes it easier to reason about.
+ *
+ * You can still find some traces of that evolution through some hooks
+ * or callbacks taking a drm_atomic_state parameter called names like
+ * "old_state". This doesn't necessarily mean that the previous
+ * drm_atomic_state is passed, but rather that this used to be the state
+ * collection we were replacing after drm_atomic_helper_swap_state(),
+ * but the variable name was never updated.
+ *
+ * Some atomic operations implementations followed a similar process. We
+ * first started to pass the entity state only. However, it was pretty
+ * cumbersome for drivers, and especially CRTCs, to retrieve the states
+ * of other components. Thus, we switched to passing the whole
+ * drm_atomic_state as a parameter to those operations. Similarly, the
+ * transition isn't complete yet, and one might still find atomic
+ * operations taking a drm_atomic_state pointer, or a component state
+ * pointer. The former is the preferred form.
  */
 struct drm_atomic_state {
 	/**
 	 * @ref:
 	 *

-- 
2.48.0

