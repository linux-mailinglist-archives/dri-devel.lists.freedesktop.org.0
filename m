Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2A2A34044
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 14:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B11D10EA99;
	Thu, 13 Feb 2025 13:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EmSUlZZ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99A210EA99;
 Thu, 13 Feb 2025 13:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739453185; x=1770989185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T3RVDVVhqmqzK9z+/Rcfq2H+TPS1qVjh8vsTVSfmpd4=;
 b=EmSUlZZ2NowzQ1oPQfgJ0FKvO9EAiv0qcGFeerdsyNcfErA/BVlkbVG5
 gpS6Q+OI7AqwFLWFr/oYMiKD5H1pQktjNSSjzyRG75085/Dn1aFJbKO4X
 IJxi9JEXL4FzxEWXbkvQDyDRefGhlZN4FF8dlaziUmo043ccpNEKUq1/Z
 yDVmRwssrTSTKJ5NQ8V42yrS3Yojj8ihccxKgfNA7Htqp9VeVWG3jEUwo
 /0l5aCWiM5eetIM89NuSPje5xA5JQax4ZU1GKwb4sRGgI+4wamB4tvBG2
 qXVgMnLJtL1IAylybsCJDZrGbT/bUv4tsKX1KJlYRMDFBlviljxsBkiZU A==;
X-CSE-ConnectionGUID: IIaaMo6wTvuVaax7brMZ6g==
X-CSE-MsgGUID: bDVtmgU1QjKTRKfoV3kYhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40025313"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40025313"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 05:26:25 -0800
X-CSE-ConnectionGUID: bWgigDjuQdu35vadVZnQRA==
X-CSE-MsgGUID: 9muKak6ATRy2+3pwy0GK/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113014230"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.251])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 05:26:22 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, vinod.govindapillai@intel.com,
 ville.syrjala@intel.com, santhosh.reddy.guddati@intel.com,
 jani.saarinen@intel.com
Subject: [PATCH v8 1/7] drm/damage-helper: add const qualifier in
 drm_atomic_helper_damage_merged()
Date: Thu, 13 Feb 2025 15:25:52 +0200
Message-ID: <20250213132559.136815-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213132559.136815-1-vinod.govindapillai@intel.com>
References: <20250213132559.136815-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
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

