Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C5CB3FAAA
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F19010E630;
	Tue,  2 Sep 2025 09:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hx+JC5TG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DCE10E630
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:36:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F350D4330D;
 Tue,  2 Sep 2025 09:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856EDC4CEED;
 Tue,  2 Sep 2025 09:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805781;
 bh=Uj9/ipaCINLOaWExTlGqlbRSQbxImJCWUWYKmvHL4RQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hx+JC5TGebI8gCzOzTw1naJTUnuZIAfyRI1Cfya5/92Fp0c9PokvOne0LUdaMjENO
 RUiEscQOqGXKLiSnj8D2W1hh8ixXxV2ydm6UeBf0kAfw5bWqQgJytcady8rGZZdFfx
 8gpSId4+DBXoLzzgmmNOnVelIBvoPzF2VnJSnn/q41L6KTdqfVE+arM4Fru0ibgJcI
 Y1fDieTU0VVKf5SVBgkP5voEyvBaNvBu+FsttaPMVTw23edXA4ZhCYBumnecc0nRTR
 ACiX9mpHJKMhNBS0rcNnmmoSdDA7+xEO8A/IBewfXM8W75n7msp3sM0VW807pwha0F
 Hm2PozLWPzdGA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:20 +0200
Subject: [PATCH v2 21/37] drm/logicvc: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-21-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Paul Kocialkowski <paulk@sys-base.io>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1286; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Uj9/ipaCINLOaWExTlGqlbRSQbxImJCWUWYKmvHL4RQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdoU4Pg69sKDyc6qoe8IXHfY2vv3voxV4/aolznHt7
 Q3ZYVPQMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZi6cHY0OH14Kr1CeXMzub3
 4T8+PZTPc+RxLE1T3Bfupd3woH/Juat6Tjw/c8rnWO+a6vuqYMNjxvrML4qH9hu+ub4h73FDgKR
 d/ukEDX6mOJdT518e3JQRpv8991DY+SZm5bYAy8aV9hbH5gIA
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

The logicvc atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/gpu/drm/logicvc/logicvc_layer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/logicvc/logicvc_layer.c
index 464000aea765378894002fdb02dab16d197c27b1..eab4d773f92b66a9edb9770aa7a95349d665ec18 100644
--- a/drivers/gpu/drm/logicvc/logicvc_layer.c
+++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
@@ -94,12 +94,12 @@ static int logicvc_plane_atomic_check(struct drm_plane *drm_plane,
 	int ret;
 
 	if (!new_state->crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(new_state->state,
-							new_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(new_state->state,
+						   new_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	if (new_state->crtc_x < 0 || new_state->crtc_y < 0) {
 		drm_err(drm_dev,

-- 
2.50.1

