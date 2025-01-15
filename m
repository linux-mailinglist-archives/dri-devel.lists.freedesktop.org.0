Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCF7A12D26
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408D810E7E7;
	Wed, 15 Jan 2025 21:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ac213T0J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E1210E7E7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:06:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2E36A5C5E99;
 Wed, 15 Jan 2025 21:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D439C4CEE1;
 Wed, 15 Jan 2025 21:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975161;
 bh=rqGqdTzqbd19HgjsQNxbk7hOL1MYm+2z8Ug5KClR57A=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ac213T0JrLVZh8R28ZEvt475+SFdBPPJLzznlMNKBXlBTHfeLfYR5EeoUY578lt2R
 kt+dlHRmwEOxI4USFetJ5bI5K+jJ9MAp6zMrmlbj0NnRvQYeFQ5eO/uxJsSMxtCmGk
 d8PluXR5+v9vMSrNm0STPOp/kNM5+aNg8wlYSg4sDbuPhDZ3kQyN0iBQ9SJFYrVQ4S
 8K9vMwARSyaxdDBGl1amw6BMTqbjEqMzySKTjGtsVKCeITRP64mUW0sr8icI8ZNay2
 B5zn5GsOlNKi2WixeaEqrA8ghtsPMCITBKGb0qQTa9YRTmTOrqFIdbIrxIQb0x4zuL
 7wI8sQqiCZVAg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:14 +0100
Subject: [PATCH 07/29] drm/bridge: Change parameter name of
 drm_atomic_bridge_chain_disable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-7-9a2fecd886a6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2110; i=mripard@kernel.org;
 h=from:subject:message-id; bh=rqGqdTzqbd19HgjsQNxbk7hOL1MYm+2z8Ug5KClR57A=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdyhLn5l9nztTluX7rpt+sZ58MPH9dk1sax5VxjOHAZ
 RE/1e+LO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBE7kQx1nv9WLo1JUS06pp1
 /tI/HesVjKrK2+5N+/Wt13CRfY3Gk/BrLe+04q98Li+85Rrztun2B8aGjR+8rb3imawCRUpmtez
 gL5nM4Fmx6ZnPFH1/z3c5tzhWLHNeJVKp+GiP0fWvkcrVDx8AAA==
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

drm_atomic_bridge_chain_disable() disables all bridges affected by a new
commit. It takes the drm_atomic_state being committed as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_bridge.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c6af46dd02bfa9e15b59e4c460debdd7fd84be44..e714c8ddd9d564473a41c465e437a6022dfd031c 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -544,21 +544,21 @@ void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
 EXPORT_SYMBOL(drm_bridge_chain_mode_set);
 
 /**
  * drm_atomic_bridge_chain_disable - disables all bridges in the encoder chain
  * @bridge: bridge control structure
- * @old_state: old atomic state
+ * @state: atomic state being committed
  *
  * Calls &drm_bridge_funcs.atomic_disable (falls back on
  * &drm_bridge_funcs.disable) op for all the bridges in the encoder chain,
  * starting from the last bridge to the first. These are called before calling
  * &drm_encoder_helper_funcs.atomic_disable
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
-				     struct drm_atomic_state *old_state)
+				     struct drm_atomic_state *state)
 {
 	struct drm_encoder *encoder;
 	struct drm_bridge *iter;
 
 	if (!bridge)
@@ -568,11 +568,11 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
 		if (iter->funcs->atomic_disable) {
 			struct drm_bridge_state *old_bridge_state;
 
 			old_bridge_state =
-				drm_atomic_get_old_bridge_state(old_state,
+				drm_atomic_get_old_bridge_state(state,
 								iter);
 			if (WARN_ON(!old_bridge_state))
 				return;
 
 			iter->funcs->atomic_disable(iter, old_bridge_state);

-- 
2.47.1

