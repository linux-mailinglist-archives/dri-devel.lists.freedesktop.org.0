Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7563A3D6FB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B26C10E926;
	Thu, 20 Feb 2025 10:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="npwLoNy4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BCA10E924;
 Thu, 20 Feb 2025 10:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740048150; x=1771584150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zgC2fv7B8e7LVdgB6bmH3CsC+Zx/vFo7l6Hf2mv7ujY=;
 b=npwLoNy4HYR7xQhT+mGFto7cvJb7eIEI+QENLsGj8c2umN1z/O9sXaXH
 9aiMWWTLZxwdlu3nk0Hz7rDoIvqjYmGk2aeDrdbzq9iqHo6Gnb3ltfTfP
 ZNGHNbky3rSb1RKEVzhJYWAnXQUyceaaB3engJ1XnovhciuAyU77eEiuU
 pxgiHSWlzw/xTClVdBFif2WRJ+zoL8BdpX26KLqR1z33aepXuguimh+Er
 fZHzBAmKkJYKNn02jYsmLkNC1Ea7JcMGgPwtRTyyzlRe1Pn7gJjBCU5XV
 e+B3oJ5ngNAnc4HeQKwdP2oU9eGu+BHUF6SF6mdPSZpOiNfzkXZTRZYOt g==;
X-CSE-ConnectionGUID: m4fXbAEdS+i6X4qqV6FVUw==
X-CSE-MsgGUID: E7qB1XmGTqyD6hp3FztKfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51804870"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="51804870"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 02:42:30 -0800
X-CSE-ConnectionGUID: D3MQBEjfRWOhm2+wEQQwuw==
X-CSE-MsgGUID: RyFmcyoAQl2PHsakHYTl3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="119941912"
Received: from slindbla-desk.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.224])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 02:42:26 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, vinod.govindapillai@intel.com,
 ville.syrjala@linux.intel.com, santhosh.reddy.guddati@intel.com,
 jani.saarinen@intel.com
Subject: [PATCH v9 1/8] drm/damage-helper: add const qualifier in
 drm_atomic_helper_damage_merged()
Date: Thu, 20 Feb 2025 12:41:37 +0200
Message-ID: <20250220104144.207526-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220104144.207526-1-vinod.govindapillai@intel.com>
References: <20250220104144.207526-1-vinod.govindapillai@intel.com>
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

Add a const qualifier for the "state" parameter as well as we could
use this helper to get the combined damage in cases of const
drm_plane_state as well. Needed mainly for xe driver big joiner cases
where we need to track the damage from immutable plane state.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/drm_damage_helper.c | 2 +-
 include/drm/drm_damage_helper.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
index afb02aae707b..44a5a36806e3 100644
--- a/drivers/gpu/drm/drm_damage_helper.c
+++ b/drivers/gpu/drm/drm_damage_helper.c
@@ -308,7 +308,7 @@ EXPORT_SYMBOL(drm_atomic_helper_damage_iter_next);
  * True if there is valid plane damage otherwise false.
  */
 bool drm_atomic_helper_damage_merged(const struct drm_plane_state *old_state,
-				     struct drm_plane_state *state,
+				     const struct drm_plane_state *state,
 				     struct drm_rect *rect)
 {
 	struct drm_atomic_helper_damage_iter iter;
diff --git a/include/drm/drm_damage_helper.h b/include/drm/drm_damage_helper.h
index effda42cce31..a58cbcd11276 100644
--- a/include/drm/drm_damage_helper.h
+++ b/include/drm/drm_damage_helper.h
@@ -78,7 +78,7 @@ bool
 drm_atomic_helper_damage_iter_next(struct drm_atomic_helper_damage_iter *iter,
 				   struct drm_rect *rect);
 bool drm_atomic_helper_damage_merged(const struct drm_plane_state *old_state,
-				     struct drm_plane_state *state,
+				     const struct drm_plane_state *state,
 				     struct drm_rect *rect);
 
 #endif
-- 
2.43.0

