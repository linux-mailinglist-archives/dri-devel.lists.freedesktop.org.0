Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE36DA34317
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4D810EAE5;
	Thu, 13 Feb 2025 14:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mG4POwOJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0966E10EAE5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:44:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E9883A41D5E;
 Thu, 13 Feb 2025 14:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93410C4CED1;
 Thu, 13 Feb 2025 14:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457892;
 bh=dZR6XleMstBRH8qMe8S0jac5NtCLUK6u4TcwjnZURVk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mG4POwOJxqlKiyInEarZFz3sfaSu+fHXjG62ArQ7Oy2I+vfdMIJCBgPCDez1rFVCX
 nFxHNMhRWwDE5Y9nCS70a3j3MoT6+SEKGA4pcgzF6XPdZ83XwK+bbM5Jb2D2mOk9iv
 1M4/hoBb/9xUfodyzwcdx2nkyJaJEfmAHc0fj3/ttHWrDu8j6PMTr1bcTf+7icVMfx
 cNFeJ06eVel/L0A8p8KzjRIL0XT4CzTUU3ZHojbCW0rOX8wGPtXTdlFv0KiAaQjEEJ
 i29TGNHZXvDPvbzKIHCN63U1BFozpDW3Y/A7FqOAyiiboEuK32ivgvOlLH24mgofdM
 kRdxnI1dv73ug==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:40 +0100
Subject: [PATCH v3 21/37] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_fake_vblank()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-21-e71598f49c8f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2558; i=mripard@kernel.org;
 h=from:subject:message-id; bh=dZR6XleMstBRH8qMe8S0jac5NtCLUK6u4TcwjnZURVk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWOUtoiv3akeZbt+zeEfYOrH7X0qzau7X/m25/UPsS
 lRir/nkjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRjWaMDZd9Gb9dl4vV8o59
 9eec2PnXiya2K+8Q/cfUtTejZPL/5gmed5kD5E8W+vM7Pu8Qf3xtF2PDxm6lM8ru3vxv/5r6/fn
 /VCdojtt/h99m3Iubur2NzZdNrzS4wj9zx/kba/RT+Kc2rAoHAA==
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

drm_atomic_helper_fake_vblank() fake a vblank event if needed when a new
commit is being applied. It takes the drm_atomic_state being committed
as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index b8bdbbba8555d4ede22821625579430649149267..37d1bbffd1feed4323e91fadef155d19f51ca5a8 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2470,11 +2470,11 @@ void drm_atomic_helper_wait_for_dependencies(struct drm_atomic_state *state)
 }
 EXPORT_SYMBOL(drm_atomic_helper_wait_for_dependencies);
 
 /**
  * drm_atomic_helper_fake_vblank - fake VBLANK events if needed
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * This function walks all CRTCs and fakes VBLANK events on those with
  * &drm_crtc_state.no_vblank set to true and &drm_crtc_state.event != NULL.
  * The primary use of this function is writeback connectors working in oneshot
  * mode and faking VBLANK events. In this case they only fake the VBLANK event
@@ -2486,29 +2486,29 @@ EXPORT_SYMBOL(drm_atomic_helper_wait_for_dependencies);
  * VBLANK interrupt.
  *
  * This is part of the atomic helper support for nonblocking commits, see
  * drm_atomic_helper_setup_commit() for an overview.
  */
-void drm_atomic_helper_fake_vblank(struct drm_atomic_state *old_state)
+void drm_atomic_helper_fake_vblank(struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_crtc *crtc;
 	int i;
 
-	for_each_new_crtc_in_state(old_state, crtc, new_crtc_state, i) {
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
 		unsigned long flags;
 
 		if (!new_crtc_state->no_vblank)
 			continue;
 
-		spin_lock_irqsave(&old_state->dev->event_lock, flags);
+		spin_lock_irqsave(&state->dev->event_lock, flags);
 		if (new_crtc_state->event) {
 			drm_crtc_send_vblank_event(crtc,
 						   new_crtc_state->event);
 			new_crtc_state->event = NULL;
 		}
-		spin_unlock_irqrestore(&old_state->dev->event_lock, flags);
+		spin_unlock_irqrestore(&state->dev->event_lock, flags);
 	}
 }
 EXPORT_SYMBOL(drm_atomic_helper_fake_vblank);
 
 /**

-- 
2.48.0

