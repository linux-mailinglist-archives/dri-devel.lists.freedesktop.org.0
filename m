Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1C9BCC34B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 10:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1220F10EB83;
	Fri, 10 Oct 2025 08:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bc6ELRjY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57A310EB80;
 Fri, 10 Oct 2025 08:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760085947; x=1791621947;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=MQFPp78b7PFTeflb40kCM2Zkq8HnFwv3oe1dUvA7IwM=;
 b=bc6ELRjYYyH8XliJzr4mLqeEZgapP7IMmNBlqUbvMGtTZ4AHt8am8f0V
 Hre6qlq24MWm3xP7CrcYGlI7Ld9QtK/86kq9L2CntN5ZgyOfcoNw67p1I
 78/iQFa7Qbw3OowJ4v5eC8TgMD5anWMFnz/Zi5RpSWL+CAU2bdcmPhYlj
 DI8Il+oaYasGi4iZFm0OYdotZe6N5pSk6rPUO1E7wBjSlUf8JnrJo4fi8
 E1wI/IVRtXeQP+Z03+3HP3pyFq4BxEB10qZdLRyIt23d4mnM206W5vNTH
 fq1ywq/VGWZQBaSA6MwFFlTnddDndnDPnjHZbdzmNAecTOgo2K0++gb2l g==;
X-CSE-ConnectionGUID: rWAh9YicRT+u7cz4gsK67Q==
X-CSE-MsgGUID: MH3HiC7lR0SSEphPK+wn2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62460675"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="62460675"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 01:45:47 -0700
X-CSE-ConnectionGUID: CZw3mq8RSQGbZuP653jW0A==
X-CSE-MsgGUID: z0Wwnij2QSmQqXtk8wthCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="185181457"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa004.jf.intel.com with ESMTP; 10 Oct 2025 01:45:42 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 10 Oct 2025 14:15:59 +0530
Subject: [PATCH RFC v2 2/2] drm/atomic: Use async_flip plane property for
 asynchronous flips
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-async-v2-2-50c6b7a9b654@intel.com>
References: <20251010-async-v2-0-50c6b7a9b654@intel.com>
In-Reply-To: <20251010-async-v2-0-50c6b7a9b654@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 jani.nikula@intel.com, ville.syrjala@intel.com, uma.shankar@intel.com, 
 xaver.hugl@kde.org, andrealmeid@igalia.com, naveen1.kumar@intel.com, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

In atomic path, the crtc_state->async_flip is being used. Its commented
in drm_crtc.h that async_flip in crtc_state is to be used with the
legacy page_flip ioctl for async flips and not in atomic path. Morever
this limits of enabling async flip only on one plane even though
hardware supports them on all the planes. Retaining the present
implementation, support for using async_flip plane property is added.
Further checks for async flip will be done in the driver specific
atomic_check()

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 7773e0057302fccb57df8067f417b23a9cb9fcde..111afc8e07aa531d03d237c61cb4b8216d645fb6 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1075,6 +1075,11 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		struct drm_mode_config *config = &plane->dev->mode_config;
 		const struct drm_plane_helper_funcs *plane_funcs = plane->helper_private;
 
+		if (async_flip && plane->async_flip_property) {
+			drm_err(prop->dev, "driver has plane async_flip property, dont use the legacy one\n");
+			return -EINVAL;
+		}
+
 		plane_state = drm_atomic_get_plane_state(state, plane);
 		if (IS_ERR(plane_state)) {
 			ret = PTR_ERR(plane_state);
@@ -1377,9 +1382,22 @@ static void
 set_async_flip(struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
+	struct drm_plane *plane;
 	struct drm_crtc_state *crtc_state;
+	struct drm_plane_state *plane_state;
 	int i;
 
+	/*
+	 * Async flip is being set with plane async_flip property then bypass
+	 * the legacy async path in atomic_ioctl.
+	 * TODO: the below legacy path should be removed once all drivers
+	 * start using the async_flip plane property.
+	 */
+	for_each_new_plane_in_state(state, plane, plane_state, i) {
+		if (plane_state->async_flip)
+			return;
+	}
+
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
 		crtc_state->async_flip = true;
 	}

-- 
2.25.1

