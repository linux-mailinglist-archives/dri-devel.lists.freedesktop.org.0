Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 600DCBAC9DC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E003910E58A;
	Tue, 30 Sep 2025 11:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kL/MZSKf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0ADD10E57A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:01:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B7B8C43C61;
 Tue, 30 Sep 2025 11:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C98DC113D0;
 Tue, 30 Sep 2025 11:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230068;
 bh=nNx/hsbAYZMyXaXmKZxqvUgYQmVg7r1EybeCojwn7IA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=kL/MZSKfjP7Vpgc86KAAI8Jz+xpYi7/5/lVuUsTC+frL8dey/jAFNrUUEZ2w0lNvM
 N3MvQ2RpGU0qFE6iPGhBPzQq+UBaDEdCN5LI6HoIUGUi1BWQgtwOl9EofXa0jwQd9R
 zTwRU5EkuICCzJZ56ITpiiE4rP6jFfOEYjgM/fo7Do1sSmkS9kWfi5os2KqRLo2Dlg
 bDZ0ZNX5P7OGEttLuysoBB5vjSxEQRhuZc8xm1HbDj9eMSYJmYKi8l9NvU2LJN5XUs
 PNCqYh1YcfBdlG+L4fPqZz4r7QXgcdaYNd8QJNwdFa9axTUyiosmqq447Jv38GhyvG
 o/ueH5JdUQPyg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:37 +0200
Subject: [PATCH v5 22/39] drm/logicvc: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-22-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Paul Kocialkowski <paulk@sys-base.io>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346; i=mripard@kernel.org;
 h=from:subject:message-id; bh=nNx/hsbAYZMyXaXmKZxqvUgYQmVg7r1EybeCojwn7IA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d2iePbw6TZtD1ERlVULb/rVP9z8Jv5/LWWvrKRJ+r
 EKY0+FQx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIK2HGhtvdm00Lt/gITnII
 0PUISn/1gLtUuE11yxq5hL+3rZ+L9X3I2zL9zwedqWKm9SJsX1hvMdbnH3+8eo3V3Yu3b/rpGXq
 2+oVIpZcGrjC1FS9j33JOOvZOLavutfn1YS+nTV2td7P4pj4A
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

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
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
2.51.0

