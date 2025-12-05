Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C1BCA7634
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0C310EACB;
	Fri,  5 Dec 2025 11:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UcLClGBA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DA210EAE7;
 Fri,  5 Dec 2025 11:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934138; x=1796470138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MQsKawZNmdHPuy2g1NagLloRBmnwhMkpb/mmQl0rnaQ=;
 b=UcLClGBAQJprZVAP+JHBCw6ifmhMX2ovTRVBGXwlzPV53rSYs9cJ66Py
 xMsKc/odFtqv4jfenkk+ve6b2bcryISmsB0e/mzyZBU09HKUyBxUbnYn2
 R/Wct0o+Lvr4EI5MP9M3devGl76GlDG6qvfZZMO4CnPbjbYFmdwU5DyBc
 eYMkBfJTkYC9iU6wJ60uzsfHw6V59PMW457FQDgmNXPSp7/hSR5QroaBW
 AS5v2pkbIUM5emZQmezgRcgO5KqiuZ9VQf0PezFEYX8XJuxBDlZ4feZsS
 Wq5AZM3ctYfYzzWXO5xGjAIik55wuIarLjjxjO3pS8+UraZw3I8iejMln w==;
X-CSE-ConnectionGUID: d+9PN8EkT/2zy3fX3VPB3w==
X-CSE-MsgGUID: WGG2Q3bJQ7uuznkyHUiJZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78431584"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="78431584"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:57 -0800
X-CSE-ConnectionGUID: ISNGyiIxSA+voqfuQW6cHw==
X-CSE-MsgGUID: D0T5FOqhQvWLC1gRZrSkMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="195097547"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:55 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 13/25] drm/vblank: pass vblank to drm_wait_vblank_reply()
Date: Fri,  5 Dec 2025 13:27:29 +0200
Message-ID: <0576d9f7d7d40572d5dfc30e882290a893c7be01.1764933891.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1764933891.git.jani.nikula@intel.com>
References: <cover.1764933891.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Use the vblank pointer instead of a dev, pipe pair to simplify
code. Rename to drm_vblank_crtc_wait_reply().

v2: Rename (Thomas)

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 6be354415529..233c60860c78 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1705,18 +1705,18 @@ static u64 widen_32_to_64(u32 narrow, u64 near)
 	return near + (s32) (narrow - near);
 }
 
-static void drm_wait_vblank_reply(struct drm_device *dev, unsigned int pipe,
-				  struct drm_wait_vblank_reply *reply)
+static void drm_vblank_crtc_wait_reply(struct drm_vblank_crtc *vblank,
+				       struct drm_wait_vblank_reply *reply)
 {
 	ktime_t now;
 	struct timespec64 ts;
 
 	/*
-	 * drm_wait_vblank_reply is a UAPI structure that uses 'long'
+	 * drm_vblank_crtc_wait_reply is a UAPI structure that uses 'long'
 	 * to store the seconds. This is safe as we always use monotonic
 	 * timestamps since linux-4.15.
 	 */
-	reply->sequence = drm_vblank_count_and_time(dev, pipe, &now);
+	reply->sequence = drm_vblank_count_and_time(vblank->dev, vblank->pipe, &now);
 	ts = ktime_to_timespec64(now);
 	reply->tval_sec = (u32)ts.tv_sec;
 	reply->tval_usec = ts.tv_nsec / 1000;
@@ -1788,7 +1788,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	if (vblank->config.disable_immediate &&
 	    drm_wait_vblank_is_query(vblwait) &&
 	    READ_ONCE(vblank->enabled)) {
-		drm_wait_vblank_reply(dev, pipe, &vblwait->reply);
+		drm_vblank_crtc_wait_reply(vblank, &vblwait->reply);
 		return 0;
 	}
 
@@ -1855,7 +1855,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	}
 
 	if (ret != -EINTR) {
-		drm_wait_vblank_reply(dev, pipe, &vblwait->reply);
+		drm_vblank_crtc_wait_reply(vblank, &vblwait->reply);
 
 		drm_dbg_core(dev, "crtc %d returning %u to client\n",
 			     pipe, vblwait->reply.sequence);
-- 
2.47.3

