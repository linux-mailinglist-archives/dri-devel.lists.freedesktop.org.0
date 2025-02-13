Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC605A342EE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5704F10EAD0;
	Thu, 13 Feb 2025 14:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s6PJj3Ku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235AF10EAD0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:43:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 09F87A42634;
 Thu, 13 Feb 2025 14:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC408C4CED1;
 Thu, 13 Feb 2025 14:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457837;
 bh=6Q8/Gx7S1MXgTUh2LRdvJil1muXBWlk69MwbKDeH5bI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=s6PJj3KuLOghevIpVBummJzuGhds9mgMyO3FdYdadQQiUfRpj4lEc2HDt4QOzB84N
 wTQJB/pL/zSRguPRWZY/AYv7PFI6C2dRevbMIC+LAtA8F0Rq2sTDSWbDesPn4dW66r
 EsmEptW7gpDLz5VFnhuXG509h+2EweJXMAqBd0rIPgCD7MvbY3PScJpPDiKEWc3o+B
 jhcPx3V6vLg1eYXRxOMlQDuQ9H6yQxUrFaFdElEgGBCXyjE0sdrjIqZXoga4EQKeNv
 uImI0tcAVQPIrL6H1647qXIs3R4m1Jd6k1pZkVjgMeN/1WFcx6UqA5RKNZ9lr3jOLp
 D/rcvnuXf6m9g==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:20 +0100
Subject: [PATCH v3 01/37] drm/atomic: Document history of drm_atomic_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-1-e71598f49c8f@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2948; i=mripard@kernel.org;
 h=from:subject:message-id; bh=6Q8/Gx7S1MXgTUh2LRdvJil1muXBWlk69MwbKDeH5bI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWMXaPMy/TNdTVD7VYb1iZ8q/tXP1PggKzHp55MaRC
 RwVEwRNOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEPG8w1pnpGZ3ZL2Vu/6Nc
 7r5pklnQQosNWXJz2j7+mMC/rtqtav2i5odhGzQuBi7q+9T94V2CIWPDnpC7GfUBP3p5lsmfanh
 ccysp+p+ZcPX9mZbrt3TpFHf+aufo5RP44/+8K7auvsxg9VQA
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
index 1ded9a8d4e84d7d9879d7f60a876ba9d69785766..4c673f0698fef6b60f77db980378d5e88e0e250e 100644
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

