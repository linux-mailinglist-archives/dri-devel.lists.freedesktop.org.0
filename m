Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BD9BEABF9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328B010EC9C;
	Fri, 17 Oct 2025 16:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ism7NYWG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154D210EC8F;
 Fri, 17 Oct 2025 16:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760718817; x=1792254817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ui3y0a2ikJBNEcNMXotQOlDBaeZZzJRmW162cLoqCDs=;
 b=Ism7NYWGejFcT91ATvP9leEF6vW4C6u3bhvuGsezWG4CiyTk/p5f11+t
 UjGQ9cQTY8/+9XMXrKoFnfoQgjeWpu2TyifLReskQrJT9EcnsTf1+EfpT
 +lglrsxHu5liw8Svx4VZKOup8v956ORGrvaKY0t1ZC/w4ZD+r14IY18uF
 yzfqz97ewS8c6JcUWwSvI+A5lCAllYyeZARu0A7F5cFFYPyhThR5iuTyq
 lEX2HILfZ89uuirsZWeAJ/84mTKpOiIQM5AidhjFV8tGwkBz68tR6moOV
 qh3s8e/rb4/R7YtMHKDiqRZ6cxl8YKUwmKJLYclOIbbu6PrOFuUwIif7O Q==;
X-CSE-ConnectionGUID: P3ao/xVpRUONtdqXuvpIjQ==
X-CSE-MsgGUID: hgPjI0KIT/KC1G7JwKtYVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="73218791"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="73218791"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 09:33:37 -0700
X-CSE-ConnectionGUID: 5sPa9gnfTIu2LHBhFsMQ9w==
X-CSE-MsgGUID: XG6GDVXPSaSeGO9lh49Zaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="183260739"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.129])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 09:33:34 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH 2/2] drm/atomic: WARN about invalid drm_foo_get_state() usage
Date: Fri, 17 Oct 2025 19:33:27 +0300
Message-ID: <20251017163327.9074-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251017163327.9074-1-ville.syrjala@linux.intel.com>
References: <20251017163327.9074-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

drm_{crtc,plane,connector,private_obj}_get_state() must not
be called after the atomic check phase. At that point the commit
has been carved in stone and no new objects must be introduced
into it. WARN if anyone attempts to violate this rule.

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_atomic.c | 8 ++++++++
 include/drm/drm_atomic.h     | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 5d31b20e67ab..e05820b18832 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -200,6 +200,8 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
 
 	drm_dbg_atomic(dev, "Clearing atomic state %p\n", state);
 
+	state->checked = false;
+
 	for (i = 0; i < state->num_connector; i++) {
 		struct drm_connector *connector = state->connectors[i].ptr;
 
@@ -348,6 +350,7 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
 	struct drm_crtc_state *crtc_state;
 
 	WARN_ON(!state->acquire_ctx);
+	drm_WARN_ON(state->dev, state->checked);
 
 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (crtc_state)
@@ -528,6 +531,7 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
 	struct drm_plane_state *plane_state;
 
 	WARN_ON(!state->acquire_ctx);
+	drm_WARN_ON(state->dev, state->checked);
 
 	/* the legacy pointers should never be set */
 	WARN_ON(plane->fb);
@@ -837,6 +841,7 @@ drm_atomic_get_private_obj_state(struct drm_atomic_state *state,
 	struct drm_private_state *obj_state;
 
 	WARN_ON(!state->acquire_ctx);
+	drm_WARN_ON(state->dev, state->checked);
 
 	obj_state = drm_atomic_get_new_private_obj_state(state, obj);
 	if (obj_state)
@@ -1131,6 +1136,7 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
 	struct drm_connector_state *connector_state;
 
 	WARN_ON(!state->acquire_ctx);
+	drm_WARN_ON(state->dev, state->checked);
 
 	ret = drm_modeset_lock(&config->connection_mutex, state->acquire_ctx);
 	if (ret)
@@ -1543,6 +1549,8 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
 		     requested_crtc, affected_crtc);
 	}
 
+	state->checked = true;
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_atomic_check_only);
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 155e82f87e4d..2e433d44658d 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -523,6 +523,14 @@ struct drm_atomic_state {
 	 */
 	bool duplicated : 1;
 
+	/**
+	 * @checked:
+	 *
+	 * Indicates the state has been checked and thus must no longer
+	 * be mutated. For internal use only, do not consult from drivers.
+	 */
+	bool checked : 1;
+
 	/**
 	 * @planes:
 	 *
-- 
2.49.1

