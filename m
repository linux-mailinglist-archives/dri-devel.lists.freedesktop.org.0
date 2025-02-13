Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D05A34325
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F1B10EAE9;
	Thu, 13 Feb 2025 14:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dyYq4q5n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694B610EAF2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:45:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4D74BA42106;
 Thu, 13 Feb 2025 14:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDFEEC4CED1;
 Thu, 13 Feb 2025 14:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457906;
 bh=gFRcGFvjH0bWMkbbVnrkKaXw6Mi4hkjhor6jplmqh6E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=dyYq4q5nfydIAW1y7gN6j/ezodOhhsdvXWDpAbjbCP4YHEnY0J1X1OrOzuFkCxoh9
 Y5IjTAOH7LqlW+lcajRQYIgn+4J9zLN1Qhd/CDlf7yT7EvHtACpm2QGU0i7VD840iD
 Z6CGgpUSuzEJF/98btlQu+J7vpBzdxFVNwjZGAbLWraC1zsFHbji42gwVMRGPwOGD3
 v5bfQb69WmmAaCb55VNXhZ3kftUsnM42k7Gj3pT+lqNQO4sDV64HmlFD7EI1ZniDdg
 /Sw8k3LfkwAg2ny8I+JCNWChfsn0StktzoTIipABaY3IGuPO+40D93IgVc9yD7ynNF
 eS0fhV3x8cPLg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:45 +0100
Subject: [PATCH v3 26/37] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_wait_for_flip_done()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-26-e71598f49c8f@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2600; i=mripard@kernel.org;
 h=from:subject:message-id; bh=gFRcGFvjH0bWMkbbVnrkKaXw6Mi4hkjhor6jplmqh6E=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWBU3szxfceVRkKH9hC3lM4uSD7yxagmSPeToMGVLu
 Zc67+PCjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCR9mmMDW3n918seRBRdHCt
 +Yo1BQsrFfM5NTT/rXCc99sjL+rZwxBzA2OtjIPzEx/PjuR6rWb9krG+IF7iEe894UD1RLVoM8v
 MRx//9KyZ4NcWVtnP1vAw71r/9KD6V4rrzTIPzuEIvOK0YioA
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

drm_atomic_helper_wait_for_flip_done() will wait for pages flips on all
CRTCs affected by a given commit. It takes the drm_atomic_state being
committed as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index df07923a57be5e0bdc135dfa5752645ff30e9827..5fbaf3707f39d77a85a80d89d2183bafe7806c0c 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1726,11 +1726,11 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
 EXPORT_SYMBOL(drm_atomic_helper_wait_for_vblanks);
 
 /**
  * drm_atomic_helper_wait_for_flip_done - wait for all page flips to be done
  * @dev: DRM device
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * Helper to, after atomic commit, wait for page flips on all affected
  * crtcs (ie. before cleaning up old framebuffers using
  * drm_atomic_helper_cleanup_planes()). Compared to
  * drm_atomic_helper_wait_for_vblanks() this waits for the completion on all
@@ -1739,32 +1739,32 @@ EXPORT_SYMBOL(drm_atomic_helper_wait_for_vblanks);
  *
  * This requires that drivers use the nonblocking commit tracking support
  * initialized using drm_atomic_helper_setup_commit().
  */
 void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
-					  struct drm_atomic_state *old_state)
+					  struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	int i;
 
 	for (i = 0; i < dev->mode_config.num_crtc; i++) {
-		struct drm_crtc_commit *commit = old_state->crtcs[i].commit;
+		struct drm_crtc_commit *commit = state->crtcs[i].commit;
 		int ret;
 
-		crtc = old_state->crtcs[i].ptr;
+		crtc = state->crtcs[i].ptr;
 
 		if (!crtc || !commit)
 			continue;
 
 		ret = wait_for_completion_timeout(&commit->flip_done, 10 * HZ);
 		if (ret == 0)
 			drm_err(dev, "[CRTC:%d:%s] flip_done timed out\n",
 				crtc->base.id, crtc->name);
 	}
 
-	if (old_state->fake_commit)
-		complete_all(&old_state->fake_commit->flip_done);
+	if (state->fake_commit)
+		complete_all(&state->fake_commit->flip_done);
 }
 EXPORT_SYMBOL(drm_atomic_helper_wait_for_flip_done);
 
 /**
  * drm_atomic_helper_commit_tail - commit atomic update to hardware

-- 
2.48.0

