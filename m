Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD82A12D37
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D2A10E800;
	Wed, 15 Jan 2025 21:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aQRGmgoX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F22410E800
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:06:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D5C3EA41377;
 Wed, 15 Jan 2025 21:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C751C4CEE3;
 Wed, 15 Jan 2025 21:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975199;
 bh=sDDX/oiMtlwEuDb5DiMZpd8llHRvToc5ZvV7Y0vSefE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=aQRGmgoXtOob3SAB5VN3V4zbRNadt2qCPZFhp9Y9t0KNtX16gTitwhGAHiryeK+Mt
 hObV5WVLr6DOfOqzVlrQ2PKL3Jo3sal+LATk8eTRCzo9dijQCKwy+FQNWJlplEIABu
 b2fpcwB6Yu2+vAGlklz5POgvUTZzwfOK5x7YFpdmlYtgpfTiEb3K0Bmclcw+pYffVP
 zES3xkVZXaTGDk6TDZkar4E3C3YAJ5fIE99pMRHGD556BXo/c1/cGA6ahQ1si+rfW4
 ue2YqgKUzc5BbEAiqNPcW0L36GaW0g2f5AAvKWfyr7pw1s+v5NuGH+NsQczdGqU832
 O+iOehWHyFKfQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:28 +0100
Subject: [PATCH 21/29] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_wait_for_flip_done()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-21-9a2fecd886a6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2600; i=mripard@kernel.org;
 h=from:subject:message-id; bh=sDDX/oiMtlwEuDb5DiMZpd8llHRvToc5ZvV7Y0vSefE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdynL+RmJma9lFoo90X639eFjE4HVdy/W8lI0fgh2fH
 Pv/7nR/x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZgI90/GhsU71zG3XrlomjNT
 fLu9e/HhB2d8U0N1G7yeT53E3ne38un/vyVBWnx3uy9O2MObfjWPjbGG1zBxtVXD7rJegV7tm5J
 pl37u4nRs2zLnX8vm/uNLdxi3mkuEvNkS2ySz88Nrx0/9BfMA
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
index baa32b10c4a08252b736927fedd36c3fccbe6020..cb24e590a39f80c0cc5feb8b6a9a4fd41a651211 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1716,11 +1716,11 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
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
@@ -1729,32 +1729,32 @@ EXPORT_SYMBOL(drm_atomic_helper_wait_for_vblanks);
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
2.47.1

