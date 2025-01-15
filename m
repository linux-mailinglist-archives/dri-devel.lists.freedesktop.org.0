Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF82A12D2A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB8E10E528;
	Wed, 15 Jan 2025 21:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aDnLrefF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F59F10E7EC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:06:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8D968A4252C;
 Wed, 15 Jan 2025 21:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B09C4CED1;
 Wed, 15 Jan 2025 21:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975170;
 bh=3U25VSbp7zOKRnxUgWW8z3EJnwEdMNg7JGTzkjvUMOg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=aDnLrefFjZcXQkJsio+Cp6itcjqalKBxXBIDJ19kFSt2IKh65aCfbgqKKKqCUULYT
 2kjY9Moaut5YFpSRMdnUEsoW3XEfN+xrg43JzgqiZeNIgV0czCdYNeeSsi+UCVtXZm
 dRyAW3UCMkz3CCKaVwkHR0gn6vEXBYkOhXHmnR/OUed+/A+XwKPx2EnDNxaWWq4eef
 nzCoQEdOSTHDgqBLF44QZTeyV39m619DRuVeQ0pOhmpg54svT/3Udexb7WoA08ooEg
 wdDCkmdrHi9OhMQu7yqwbCZC/AiLo8yFj16s5x9kvj35D66bdeAXrVfUYqaXUYYsdX
 napBMQ5Ql/BYw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:17 +0100
Subject: [PATCH 10/29] drm/atomic-helper: Change parameter name of
 crtc_set_mode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-10-9a2fecd886a6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1984; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3U25VSbp7zOKRnxUgWW8z3EJnwEdMNg7JGTzkjvUMOg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdypI6e9/EOxcfO12npXo/Mf7drOYdayT12hKyog5UT
 mNgDovpmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABMRe85YZ1bzgoO1I0pAR+zg
 +pdLP/N+X6dloWm4Q/WuwBbz/cY/lx++ymPEPf+c//tzc6cn9y6rZ2yY/Wbm0wsbI5Kl1hcXfjl
 UtaxEr8bi9I2bbQytPNqpm/fFHuZwr1h+6PZ9WU9TXoEWjq0A
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

crtc_set_mode() deals with calling the modeset related hooks for CRTC,
connectors and bridges if and when a new commit changes them. It takes
the drm_atomic_state being committed as a parameter.

However, that parameter name is called as old_state, which is pretty
confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 50b3fdb033eaae8e852a4fd298d2e958be1201f3..55c91f2821d550c8af52b71d8f452e0fdee997e4 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1363,19 +1363,19 @@ void drm_atomic_helper_calc_timestamping_constants(struct drm_atomic_state *stat
 	}
 }
 EXPORT_SYMBOL(drm_atomic_helper_calc_timestamping_constants);
 
 static void
-crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *old_state)
+crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_connector *connector;
 	struct drm_connector_state *new_conn_state;
 	int i;
 
-	for_each_new_crtc_in_state(old_state, crtc, new_crtc_state, i) {
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
 
 		if (!new_crtc_state->mode_changed)
 			continue;
 
@@ -1387,11 +1387,11 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *old_state)
 
 			funcs->mode_set_nofb(crtc);
 		}
 	}
 
-	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
+	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
 		const struct drm_encoder_helper_funcs *funcs;
 		struct drm_encoder *encoder;
 		struct drm_display_mode *mode, *adjusted_mode;
 		struct drm_bridge *bridge;
 

-- 
2.47.1

