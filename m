Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B26CC47DA0
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:18:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624F410E436;
	Mon, 10 Nov 2025 16:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jO7Dgc9q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033A910E42D;
 Mon, 10 Nov 2025 16:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791485; x=1794327485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=62kaBkTQieyrdnMtJL+HUdsoEvI3gtK0wIlY44orC18=;
 b=jO7Dgc9qXMNEjWff1BK9BNnAXJ3qwsfeF5WbtBAOs/iZnR8wmM7/j4Kq
 gOLfkA7/s2EmVfC5BXfIMyX3Kcl75ahvXllkL3YuBJRY5wDYPokMktI58
 pQKfOPRa9ikeoNKuTQBRZCDucZIoRa79/uXz1T/u+gWNolp6g5xhe5UDJ
 Lu6IXp7EKtrrcXXXMwI2uSVX0LLPS/1IWvbmN4B+Qtep/mwp3fa1LCpKu
 wsMEq67HkOAL3yF2gKYgFxkXtMjzh5m7fEvRO0EQJjFnTLPn5GRrk6d0T
 uOwAwK5HbeZZytb2J3/zD7uUEcoEOlhJzzckGWBcuTWQML2ELSkKHf1RQ g==;
X-CSE-ConnectionGUID: YuqTlB3jS8mf6OgHV6EgTg==
X-CSE-MsgGUID: qkGhI3kgSKCelBTr8nnndw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64753246"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="64753246"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:05 -0800
X-CSE-ConnectionGUID: yKnnpMvaSH6lCz/sGK0cuA==
X-CSE-MsgGUID: tKzDVcoDR0m/q0iXEHHbAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="192819546"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:02 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 03/24] drm/vblank: remove superfluous pipe check
Date: Mon, 10 Nov 2025 18:17:21 +0200
Message-ID: <c958768c2049d2248c27d582eeea7ae68f614d25.1762791343.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762791343.git.jani.nikula@intel.com>
References: <cover.1762791343.git.jani.nikula@intel.com>
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

Now that the pipe is crtc->pipe, there's no need to check it's within
range.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 1d12836e3d80..f4d1fe182a4d 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1302,9 +1302,6 @@ void drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
 	int ret;
 	u64 last;
 
-	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
-		return;
-
 	ret = drm_vblank_get(dev, pipe);
 	if (drm_WARN(dev, ret, "vblank not available on crtc %i, ret=%i\n",
 		     pipe, ret))
-- 
2.47.3

