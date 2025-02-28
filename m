Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6486A49555
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 10:38:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E849110EC38;
	Fri, 28 Feb 2025 09:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ekqRAmxr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B181410EC35;
 Fri, 28 Feb 2025 09:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740735510; x=1772271510;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zgC2fv7B8e7LVdgB6bmH3CsC+Zx/vFo7l6Hf2mv7ujY=;
 b=ekqRAmxrvLAIfKpfrBWpSOdbl2Z8s8XO89WNmQhuF3DqxenyOAvG8hYT
 Dp/YbaWlezAljIb7kJfvVWQCm6ENKt8zRjIVQ8OhuQ8sX7xj4ujDM91Eh
 TYeClxMiMYkvcGtqOgQF8FdHgoT2+gpIr3Uo3k5LmJZ05zW86j8ezSh+O
 hjqRwfKFxwzZ/MSD7fwSwlBSpq3Uj165V3DwK/b/BK1/PJgRUkKnLYEbr
 7VNbnODdNszuSSuz4ge4aOCrM59nlz+gZ3ATkjPkWBgMs7cIcg1/Hv613
 iMdB2fV9ACP8HJJaDjp4Arj2GJzN4LAYKWWGCiMurH/DIzduSnvwTFJgh Q==;
X-CSE-ConnectionGUID: Q1TM8LJrR6KO4W4S2gTOVQ==
X-CSE-MsgGUID: xjPpTCtrThaMYlJEa3kNFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52293060"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="52293060"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:38:29 -0800
X-CSE-ConnectionGUID: FB5P8u9HQ6y5cemJ+TbGeA==
X-CSE-MsgGUID: 9L1P/cGqQnObAmb8cX2VTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="154466429"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:38:26 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, vinod.govindapillai@intel.com,
 jani.nikula@intel.com, jani.saarinen@intel.com
Subject: [PATCH v10 2/9] drm/damage-helper: add const qualifier in
 drm_atomic_helper_damage_merged()
Date: Fri, 28 Feb 2025 11:37:55 +0200
Message-ID: <20250228093802.27091-3-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250228093802.27091-1-vinod.govindapillai@intel.com>
References: <20250228093802.27091-1-vinod.govindapillai@intel.com>
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

