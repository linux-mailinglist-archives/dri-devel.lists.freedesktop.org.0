Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AA41ECDC8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 12:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D2689CF7;
	Wed,  3 Jun 2020 10:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699F089CF7
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 10:45:35 +0000 (UTC)
Date: Wed, 03 Jun 2020 10:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1591181133;
 bh=dL0hNzhffG6kkgrQLYFzpVklReEnz35ljoYoEETQJE8=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=bzGO0YzYhDbUP02RjsbHEF6ELk/lTg8iKW8kWHVln3Fk6ebstyWo6WcENQmFLiiaM
 4mYzpY+SHDBtDW6LwAWYVBiHwG/dOvnypTrAdAX6bXmF1VIRIopeg8G716kqtKlTHu
 20ap7A2nXFGQu00aWklP2ArWmJbCLJZ4Abiehla0=
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm/atomic: don't reset link-status to GOOD without
 ALLOW_MODESET
Message-ID: <6Q-O7vKObfRu8cOyvcAxR_uRWgjQdlYgVursTGN2AaHtdaUZICSC6szFjkkDGXhyKF22Grj-aGCTC74OGhtuJ9JChitqvqtCVi1wr_Lnh6Y=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In update_output_state, the link-status property was reset to GOOD to
ensure legacy drmModeSetCrtc re-trains the link. However this auto-reset
is also performed on an atomic commit without ALLLOW_MODESET. If a
driver reads link-status to figure out whether to re-train the link,
this could cause an atomic commit failure. User-space doesn't expect
such a failure, because commits without ALLOW_MODESET aren't supposed to
fail because of link training issues.

Change update_output_state to implicitly reset link-status to GOOD only
if ALLOW_MODESET is set. This is the case for legacy drmModeSetCrtc
because drm_atomic_state_init sets it (and is used in
drm_atomic_helper_set_config, called from drm_mode_setcrtc).

Drivers don't seem to read link-status at the moment -- they seem to
rely on user-space performing a modeset instead. So this shouldn't
result in any change in behaviour, this should only prevent future
failures if drivers start reading link-status.

Signed-off-by: Simon Ser <contact@emersion.fr>
Suggested-by: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Manasi Navare <manasi.d.navare@intel.com>
---
 drivers/gpu/drm/drm_atomic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 965173fd0ac2..3d9d9e6f7397 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1426,7 +1426,8 @@ static int update_output_state(struct drm_atomic_state *state,
 				return ret;
 
 			/* Make sure legacy setCrtc always re-trains */
-			new_conn_state->link_status = DRM_LINK_STATUS_GOOD;
+			if (state->allow_modeset)
+				new_conn_state->link_status = DRM_LINK_STATUS_GOOD;
 		}
 	}
 
-- 
2.26.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
