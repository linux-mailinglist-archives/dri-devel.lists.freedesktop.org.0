Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8B659DAEC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 13:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF3511AD9A;
	Tue, 23 Aug 2022 11:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012BC11AF46;
 Tue, 23 Aug 2022 11:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661254256; x=1692790256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dhcs9iy7LyjmqdjtvPN2uVgUJMjbzgk4nJ1LzrDMKr0=;
 b=HlRs15k0KQ9JSwZrxarnrpG6wZ2/lZWg0RQYzMarxmm78YwxmqajTOak
 IbLdOqeybOJkzUU026fu0mzsdBW4jwFP9OwzXGcuVA375f68KkgdEo+BP
 fa93RLv2eug8NJZ1k56oLSjRJAPq9zJzfZNLhfbQQQWIeiL8iVv2YUVlQ
 O5LGqtlqlmK7S+fdvnDASIK+NRDmPKTsjHtewVDxhpdWAvahCt5+bVhIv
 LnnOGx9ce4aYopKLnFWiz/qzRGeq/Ws+5pIFmCPNp/q/mL7kfnfvG4f/k
 z+VgS8iIwrPocsyizpix3V320MBD4Ejl6qnG3BdR/JHMH4RM+pKJS5VF0 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="273415842"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="273415842"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 04:30:55 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="669990877"
Received: from fjohn-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.249.42.156])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 04:30:54 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm: Use original src rect while initializing damage
 iterator
Date: Tue, 23 Aug 2022 14:29:17 +0300
Message-Id: <20220823112920.352563-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823112920.352563-1-jouni.hogander@intel.com>
References: <20220823112920.352563-1-jouni.hogander@intel.com>
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_plane_state->src might be modified by the driver. This is done
e.g. in i915 driver when there is bigger framebuffer than the plane
and there is some offset within framebuffer. I915 driver calculates
separate offset and adjusts src rect coords to be relative to this
offset. Damage clips are still relative to original src coords
provided by user-space.

This patch ensures original coordinates provided by user-space are
used when initiliazing damage iterator.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/drm_damage_helper.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
index 937b699ac2a8..d8b2955e88fd 100644
--- a/drivers/gpu/drm/drm_damage_helper.c
+++ b/drivers/gpu/drm/drm_damage_helper.c
@@ -224,6 +224,7 @@ drm_atomic_helper_damage_iter_init(struct drm_atomic_helper_damage_iter *iter,
 				   const struct drm_plane_state *old_state,
 				   const struct drm_plane_state *state)
 {
+	struct drm_rect src;
 	memset(iter, 0, sizeof(*iter));
 
 	if (!state || !state->crtc || !state->fb || !state->visible)
@@ -233,10 +234,12 @@ drm_atomic_helper_damage_iter_init(struct drm_atomic_helper_damage_iter *iter,
 	iter->num_clips = drm_plane_get_damage_clips_count(state);
 
 	/* Round down for x1/y1 and round up for x2/y2 to catch all pixels */
-	iter->plane_src.x1 = state->src.x1 >> 16;
-	iter->plane_src.y1 = state->src.y1 >> 16;
-	iter->plane_src.x2 = (state->src.x2 >> 16) + !!(state->src.x2 & 0xFFFF);
-	iter->plane_src.y2 = (state->src.y2 >> 16) + !!(state->src.y2 & 0xFFFF);
+	src = drm_plane_state_src(state);
+
+	iter->plane_src.x1 = src.x1 >> 16;
+	iter->plane_src.y1 = src.y1 >> 16;
+	iter->plane_src.x2 = (src.x2 >> 16) + !!(src.x2 & 0xFFFF);
+	iter->plane_src.y2 = (src.y2 >> 16) + !!(src.y2 & 0xFFFF);
 
 	if (!iter->clips || !drm_rect_equals(&state->src, &old_state->src)) {
 		iter->clips = NULL;
-- 
2.34.1

