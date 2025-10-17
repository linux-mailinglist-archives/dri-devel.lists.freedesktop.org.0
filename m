Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33F2BEABF3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C32910EC8A;
	Fri, 17 Oct 2025 16:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YjYxVQGk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE9F10EC85;
 Fri, 17 Oct 2025 16:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760718813; x=1792254813;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Aym55k6vQldoC0M/kJ8A6/DU8+AE6e/cmt1FvxLwX3I=;
 b=YjYxVQGk2yu5pZfrK2C+9ypymVQ4jVuLAru6nP8MwxkhtThut0fBvloX
 RpGVKms9Qv/rzy8+7JERphXMg396AlW1VMPe8CwY+qejJq8je71xtag8f
 DaCM0I699tQptiiX+pewstS3ucjftcG+eLOydYl+/GA9aq0aw1ckk3vv4
 ACO7VHQ/YiTdHgBkCv49UopvpgkseQAVF9Sp7CprckTe+z/GyG4EvqWMJ
 OorPcJUvmJ5OereKANJCIvKeV+2bJzBxMWrfhHeASFJlo2O/VlpcQbZlZ
 AecE+tiV7EdhiYl0IZzCqxzhlhf8x6p2hvh45uw3adyj1h2DqgzIKdAhX g==;
X-CSE-ConnectionGUID: JNeQBCDSRcicRlYEUulXJg==
X-CSE-MsgGUID: 3JysJmTbTi6zvXYqJW3egQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="73218778"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="73218778"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 09:33:33 -0700
X-CSE-ConnectionGUID: lhuYqJNnQnWuN4xVAsxdUg==
X-CSE-MsgGUID: 8bZUWiZwTcOx0WIKZLfURg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="183260734"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.129])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 09:33:29 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH 1/2] drm/atomic: WARN about missing acquire_ctx in
 drm_atomic_get_private_obj_state()
Date: Fri, 17 Oct 2025 19:33:26 +0300
Message-ID: <20251017163327.9074-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
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

The crtc/plane/connector counterparts of
drm_atomic_get_private_obj_state() all WARN about a missing
acquire_ctx. Do the same in drm_atomic_get_private_obj_state()
for consistency.

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_atomic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index be2cb6e43cb0..5d31b20e67ab 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -836,6 +836,8 @@ drm_atomic_get_private_obj_state(struct drm_atomic_state *state,
 	struct __drm_private_objs_state *arr;
 	struct drm_private_state *obj_state;
 
+	WARN_ON(!state->acquire_ctx);
+
 	obj_state = drm_atomic_get_new_private_obj_state(state, obj);
 	if (obj_state)
 		return obj_state;
-- 
2.49.1

