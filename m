Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E56CA34301
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:44:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963BB10EADA;
	Thu, 13 Feb 2025 14:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KA7ys39B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82AD10EADC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:44:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D0E62A4263A;
 Thu, 13 Feb 2025 14:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18FCC4CEE7;
 Thu, 13 Feb 2025 14:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457858;
 bh=VBPbKHLSvmMn3Amvc6nP0KWacSWl+aC0MG5g3q4s2SM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=KA7ys39BAwx9jAsYwn04zoiMA8wq6sqkMyQT2vsE8rra8EQJAGIZLCfQhXi3Eub5e
 TsNjaenYrEErAHClhombR5chMUa2qcCWB3SbIKJVdjY4ihYUJM1RNy4zG1FkJ+lphw
 tfr5FdgmdzjfzG0Z8Ui/lAmMSlwQyXEdzlvDxKEDZa/Xlv0dVU8kANKfRwk4mJMPNW
 btPhg3tlB7QIc5okLy8yNThK+aItMDcaM79LP8WA2CSsKPNFisOy3AUMC9APIW6yEY
 b61IXsPO0Eo2kqgdX4QvIFaDrHGNNmyh+7xyniujOYrQgcxNOF90bOe98x5vpWQQRD
 497vP6unkuM4A==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:27 +0100
Subject: [PATCH v3 08/37] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_tail()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-8-e71598f49c8f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2685; i=mripard@kernel.org;
 h=from:subject:message-id; bh=VBPbKHLSvmMn3Amvc6nP0KWacSWl+aC0MG5g3q4s2SM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWCUt1718Nz1V/vmFI+pvHm9dqRO8h2lBznNL23nMd
 d98guoiO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEpK8wNvzhOvCKX821evf5
 Yo/za6T+6zW+2P51ssL5WFZTrm1z3jtfst/oJht2b17oB97fy1urDjHWV6pxfRLNYY9/vuHyiaK
 GaxwLXC77Z+wqvSfldWunYr21VY79t92sS5Y+WS/NIzw15cZpAA==
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

drm_atomic_helper_commit_tail() is the final part of an atomic commit,
and is given a parameter with the drm_atomic_state being committed.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index f859dae58a92d56ebed5a1fd7b2243a02b568297..fbff59f9c00e319a7649c6961c60839dc302a44c 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1766,38 +1766,38 @@ void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_wait_for_flip_done);
 
 /**
  * drm_atomic_helper_commit_tail - commit atomic update to hardware
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * This is the default implementation for the
  * &drm_mode_config_helper_funcs.atomic_commit_tail hook, for drivers
  * that do not support runtime_pm or do not need the CRTC to be
  * enabled to perform a commit. Otherwise, see
  * drm_atomic_helper_commit_tail_rpm().
  *
  * Note that the default ordering of how the various stages are called is to
  * match the legacy modeset helper library closest.
  */
-void drm_atomic_helper_commit_tail(struct drm_atomic_state *old_state)
+void drm_atomic_helper_commit_tail(struct drm_atomic_state *state)
 {
-	struct drm_device *dev = old_state->dev;
+	struct drm_device *dev = state->dev;
 
-	drm_atomic_helper_commit_modeset_disables(dev, old_state);
+	drm_atomic_helper_commit_modeset_disables(dev, state);
 
-	drm_atomic_helper_commit_planes(dev, old_state, 0);
+	drm_atomic_helper_commit_planes(dev, state, 0);
 
-	drm_atomic_helper_commit_modeset_enables(dev, old_state);
+	drm_atomic_helper_commit_modeset_enables(dev, state);
 
-	drm_atomic_helper_fake_vblank(old_state);
+	drm_atomic_helper_fake_vblank(state);
 
-	drm_atomic_helper_commit_hw_done(old_state);
+	drm_atomic_helper_commit_hw_done(state);
 
-	drm_atomic_helper_wait_for_vblanks(dev, old_state);
+	drm_atomic_helper_wait_for_vblanks(dev, state);
 
-	drm_atomic_helper_cleanup_planes(dev, old_state);
+	drm_atomic_helper_cleanup_planes(dev, state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_tail);
 
 /**
  * drm_atomic_helper_commit_tail_rpm - commit atomic update to hardware

-- 
2.48.0

