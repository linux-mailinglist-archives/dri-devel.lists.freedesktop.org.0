Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB3DA12D39
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B60310E803;
	Wed, 15 Jan 2025 21:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e087VOMQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3979A10E801
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:06:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6F8B2A42528;
 Wed, 15 Jan 2025 21:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE68C4CED1;
 Wed, 15 Jan 2025 21:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975202;
 bh=ehJPr/l/FwO7pkSiqq2hk3A9URL1NN3vlOmlGJYM1jY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=e087VOMQBtFNI6g2por7/hTrQj5ETw0OsoWIsjhBaZudNgEYZlDZkECZr+KYUJ34b
 LLtfWKJy6W0f3yuZRkv3Xa0LlCcsrMfjSS9CJ2q4WHdxRDSRd2/X1r7J1hXlIBjrnm
 Fv1MpDwx3xc88WOijwYwZJVDcEIBfwBcdDMoSCm2lhUuN69bWC/7K8tlO+TdASn1UM
 nusyWIYM9xPJ2PJ4U6ImuIhdEf9ium2EFZeU+I//TfM30z9lAKH03uxcQwqrDbBkKZ
 FzZdWlNysf78OtxWnrNbBrRN6rsJfGMIXGxw+LEElCgKmhgwAxgE5aBFals12hhz96
 1Z8AqWfyIpHPQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:29 +0100
Subject: [PATCH 22/29] drm/bridge: Rename atomic hooks parameters to drop
 old prefix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-22-9a2fecd886a6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2433; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ehJPr/l/FwO7pkSiqq2hk3A9URL1NN3vlOmlGJYM1jY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdynLq2UnGsl3KX8LflGpu/rrzZck8/nV9tz31U15c2
 9Ove7moYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEykko+x4ZmO+I3onb3LPr3R
 rbt91qbCwC7h0o2l73v/q5hxPX5hri/O0XZdyfin/GZ5mRMOemumM9Yn9DaGnVjxYtafVP5ls+/
 9Up7trZdo9iuo8U/E3ItPPzbn9eVtu++9aNan+2rZvunWnJcA
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

All the bridge atomic hooks were using the old_bridge_state name for
their drm_bridge_state parameter. However, this state is the current
state being committed for all of them, which ends up being confusing.

Let's rename it to bridge_state for all of them.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_bridge.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4b84faf14e368310dd20aa964e8178ec80aa6fa7..8e18130be8bb85fc2463917dde9bf1d281934184 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -303,11 +303,11 @@ struct drm_bridge_funcs {
 	 * there is one) when this callback is called.
 	 *
 	 * The @atomic_pre_enable callback is optional.
 	 */
 	void (*atomic_pre_enable)(struct drm_bridge *bridge,
-				  struct drm_bridge_state *old_bridge_state);
+				  struct drm_bridge_state *bridge_state);
 
 	/**
 	 * @atomic_enable:
 	 *
 	 * This callback should enable the bridge. It is called right after
@@ -323,11 +323,11 @@ struct drm_bridge_funcs {
 	 * chain if there is one.
 	 *
 	 * The @atomic_enable callback is optional.
 	 */
 	void (*atomic_enable)(struct drm_bridge *bridge,
-			      struct drm_bridge_state *old_bridge_state);
+			      struct drm_bridge_state *bridge_state);
 	/**
 	 * @atomic_disable:
 	 *
 	 * This callback should disable the bridge. It is called right before
 	 * the preceding element in the display pipe is disabled. If the
@@ -340,11 +340,11 @@ struct drm_bridge_funcs {
 	 * signals) feeding it is still running when this callback is called.
 	 *
 	 * The @atomic_disable callback is optional.
 	 */
 	void (*atomic_disable)(struct drm_bridge *bridge,
-			       struct drm_bridge_state *old_bridge_state);
+			       struct drm_bridge_state *bridge_state);
 
 	/**
 	 * @atomic_post_disable:
 	 *
 	 * This callback should disable the bridge. It is called right after the
@@ -359,11 +359,11 @@ struct drm_bridge_funcs {
 	 * called.
 	 *
 	 * The @atomic_post_disable callback is optional.
 	 */
 	void (*atomic_post_disable)(struct drm_bridge *bridge,
-				    struct drm_bridge_state *old_bridge_state);
+				    struct drm_bridge_state *bridge_state);
 
 	/**
 	 * @atomic_duplicate_state:
 	 *
 	 * Duplicate the current bridge state object (which is guaranteed to be

-- 
2.47.1

