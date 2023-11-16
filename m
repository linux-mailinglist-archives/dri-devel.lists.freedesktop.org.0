Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 397217EE7C6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:58:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C754310E69D;
	Thu, 16 Nov 2023 19:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F61010E698;
 Thu, 16 Nov 2023 19:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NRCcBXnmGSKr8m7ip5h6qqs877Fiim5Th5OQ4js85NY=; b=e8e88sg1nl312YanSlRaLcVNhb
 BHCP2AXVQrRmiGOk5UZCpVjdcbJKLNCt7NkH+QbKx3Cn4c3ah4voCdaCFUxMoh0KFhMbJXUWPf6FQ
 yZBSpPLTjr6HDYfQtNHz7CYXBtqx2uLlqh3KAMPw2Fas6JuBnE6WfiaR5ycp/i04tino2hMHJpBPF
 41wSVhPwIF42vMiwro6oEi8ZzSt5NSsznj9QrF8qE2w1UhVdFppMyGT2sEpMeZgfUI77rRPHGKsPj
 d+Dctisb8nZ6QTqvKQ4Wt4xbsCTS/d8UoL7YpJt0vbF5Hh72UAJ1RPB8gQs9vHfEiA2lAXc7jTRRj
 PLtSamNw==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r3iVL-0048Yy-1g; Thu, 16 Nov 2023 20:58:23 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH v5 03/32] drm/drm_plane: track color mgmt changes per plane
Date: Thu, 16 Nov 2023 18:57:43 -0100
Message-Id: <20231116195812.906115-4-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231116195812.906115-1-mwen@igalia.com>
References: <20231116195812.906115-1-mwen@igalia.com>
MIME-Version: 1.0
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We will add color mgmt properties to DRM planes in the next patches and
we want to track when one of this properties change to define atomic
commit behaviors. Using a similar approach from CRTC color props, we set
a color_mgmt_changed boolean whenever a plane color prop changes.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_atomic.c              | 1 +
 drivers/gpu/drm/drm_atomic_state_helper.c | 1 +
 include/drm/drm_plane.h                   | 7 +++++++
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 2c454568a607..2925371d230d 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -724,6 +724,7 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 		   drm_get_color_encoding_name(state->color_encoding));
 	drm_printf(p, "\tcolor-range=%s\n",
 		   drm_get_color_range_name(state->color_range));
+	drm_printf(p, "\tcolor_mgmt_changed=%d\n", state->color_mgmt_changed);
 
 	if (plane->funcs->atomic_print_state)
 		plane->funcs->atomic_print_state(p, state);
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 784e63d70a42..25bb0859fda7 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -338,6 +338,7 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 	state->fence = NULL;
 	state->commit = NULL;
 	state->fb_damage_clips = NULL;
+	state->color_mgmt_changed = false;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_duplicate_state);
 
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 51291983ea44..52c3287da0da 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -237,6 +237,13 @@ struct drm_plane_state {
 
 	/** @state: backpointer to global drm_atomic_state */
 	struct drm_atomic_state *state;
+
+	/**
+	 * @color_mgmt_changed: Color management properties have changed. Used
+	 * by the atomic helpers and drivers to steer the atomic commit control
+	 * flow.
+	 */
+	bool color_mgmt_changed : 1;
 };
 
 static inline struct drm_rect
-- 
2.40.1

