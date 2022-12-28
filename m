Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FE5657B21
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 16:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1231610E1A9;
	Wed, 28 Dec 2022 15:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCDB10E1A9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 15:18:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 528166155B;
 Wed, 28 Dec 2022 15:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9DEC433D2;
 Wed, 28 Dec 2022 15:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1672240695;
 bh=xnncnqnNxEXQ71qlNDAGrOqAbIWOZBwesnFOzhzptFU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wJ3k0Assu2Ll9cdQ0deZdujb40b7fTD+4T3kTlPW3n7iRCmpozv6j9uVWJsCKKtjH
 lgV3krSZ63Ps7VQxXE99WpWH8bB3d8Qk9ejHs09fwmW9ZXph16XFPYdAIRbWJK4lCG
 RGLfEUx7M5MyQEJfSsKBAR0ib1cIN/7mh+iJ3sCw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Subject: [PATCH 6.0 0192/1073] drm/atomic-helper: Dont allocate new plane
 state in CRTC check
Date: Wed, 28 Dec 2022 15:29:40 +0100
Message-Id: <20221228144333.228471808@linuxfoundation.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228144328.162723588@linuxfoundation.org>
References: <20221228144328.162723588@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit dbbf933d365da1a76a540211bee3d57bde520194 ]

In drm_atomic_helper_check_crtc_state(), do not add a new plane state
to the global state if it does not exist already. Adding a new plane
state will result in overhead for the plane during the atomic-commit
step.

For the test in drm_atomic_helper_check_crtc_state() to succeed, it
is important that the CRTC has an enabled primary plane after the
commit. Simply testing the CRTC state's plane_mask for a primary plane
is sufficient.

Note that the helper still only tests for an attached primary plane.
Drivers have to ensure that the plane contains valid pixel information.

v5:
	* fix commit description (Javier)
v3:
	* test for a primary plane in plane_mask (Ville)
v2:
	* remove unnecessary test for plane->crtc (Ville)
	* inline drm_atomic_get_next_plane_state() (Ville)
	* acquire plane lock before accessing plane->state (Ville)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Fixes: d6b9af1097fe ("drm/atomic-helper: Add helper drm_atomic_helper_check_crtc_state()")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Link: https://patchwork.freedesktop.org/patch/msgid/20221007124338.24152-2-tzimmermann@suse.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 8bf41aa24068..6526d6ade04b 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -899,7 +899,6 @@ int drm_atomic_helper_check_crtc_state(struct drm_crtc_state *crtc_state,
 				       bool can_disable_primary_planes)
 {
 	struct drm_device *dev = crtc_state->crtc->dev;
-	struct drm_atomic_state *state = crtc_state->state;
 
 	if (!crtc_state->enable)
 		return 0;
@@ -910,14 +909,7 @@ int drm_atomic_helper_check_crtc_state(struct drm_crtc_state *crtc_state,
 		struct drm_plane *plane;
 
 		drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask) {
-			struct drm_plane_state *plane_state;
-
-			if (plane->type != DRM_PLANE_TYPE_PRIMARY)
-				continue;
-			plane_state = drm_atomic_get_plane_state(state, plane);
-			if (IS_ERR(plane_state))
-				return PTR_ERR(plane_state);
-			if (plane_state->fb && plane_state->crtc) {
+			if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
 				has_primary_plane = true;
 				break;
 			}
-- 
2.35.1



