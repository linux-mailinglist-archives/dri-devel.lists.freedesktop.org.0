Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A760D01E73
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C1210E6DC;
	Thu,  8 Jan 2026 09:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CrdaBEZd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5850310E6D5;
 Thu,  8 Jan 2026 09:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767865520; x=1799401520;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=P/GpUp6G8Wgim73sDmwtAhgYVC3/YpvT01aimc3kqec=;
 b=CrdaBEZd0VpGuYAHbBmOU3XZPSeSuUnWeJuBqONkGTZo7JzbAfAbPK8e
 375Y6ffW1sXzhsiD7aDGCxUq94NGKxPjFhz/oBn2EoKq5soPQMVcKedJN
 q17+KglG79C94K1UmzB+lETPAoZ2cKWGgZbyAnWEeDXPyv+qgErM5VuzY
 SK7f3ISfxFJ7FWUwgJWJ2gjhO0VVhwBMxb7JMaaLCRRK5GQgJ8MIkm9ju
 llhqvs3fwkBErG6KmBtjT7HcnZVkEjv/Gv84QDPH+cjZXTPc6bWuNVGhn
 S8leeVp8Ep6AKJern6qititfIkx1yYHrb9xLYMkjQLybZcbHKsLiMs/jG g==;
X-CSE-ConnectionGUID: CdwO4gloTZ6qKnVuHE3gsA==
X-CSE-MsgGUID: iB6uFu3sSL2Je6UQZ4bdag==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72876565"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="72876565"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 01:45:13 -0800
X-CSE-ConnectionGUID: OlLaTQ/cSuOzarrbJaMm0w==
X-CSE-MsgGUID: 9ykuwAlfSL2RxGr6gOcI0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="208232107"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa005.jf.intel.com with ESMTP; 08 Jan 2026 01:45:08 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 08 Jan 2026 15:13:24 +0530
Subject: [PATCH [RFC] v3 3/7] drm/atomic: Re-route the async flip based on
 the flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-async-v3-3-e7730c3fe9ff@intel.com>
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
In-Reply-To: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 andrealmeid@igalia.com, naveen1.kumar@intel.com, ville.syrjala@intel.com, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
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

At present the async flip is being done by the flag
DRM_MODE_PAGE_FLIP_ASYNC. New plane property is being added for async
flip on per plane basis. Allow existing users using the flag
DRM_MODE_PAGE_FLIP_ASYNC to do async flip and internally set the
plane_state flags for async flip.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 4a2da81abd713127d5157e84f2cae2f8b34a4dd6..eb4d7146f1f92eec58aba99ce6f5b678c0959b66 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1190,6 +1190,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		ret = drm_atomic_connector_set_property(connector,
 				connector_state, file_priv,
 				prop, prop_value);
+
 		break;
 	}
 	case DRM_MODE_OBJECT_CRTC: {
@@ -1256,6 +1257,10 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 				plane_state, file_priv,
 				prop, prop_value);
 
+		/* Hack to make the legacy DRM_MODE_PAGE_FLIP_ASYNC work with atomic_ioctl() */
+		if (async_flip && prop == config->prop_fb_id)
+			plane_state->async_flip = true;
+
 		break;
 	}
 	case DRM_MODE_OBJECT_COLOROP: {
@@ -1591,6 +1596,12 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 			return -EINVAL;
 		}
 
+		/*
+		 * Legacy way of handling async flip using the flag
+		 * DRM_MODE_PAGE_FLIP_ASYNC is still supported using the local
+		 * flag async_flip. Once the UMD moves to the plane property
+		 * for async flip this should be removed.
+		 */
 		async_flip = true;
 	}
 

-- 
2.25.1

