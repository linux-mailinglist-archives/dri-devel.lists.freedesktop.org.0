Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B0782C3F8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 17:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD0010EB33;
	Fri, 12 Jan 2024 16:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B0210EB33
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 16:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705078235; x=1736614235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=okdSamReSXfiRgy3B5DAMHJ9bmN9NST/nJOWkPfP060=;
 b=Q7ubKDGFGGYJx5ydGbJObkoqyV1GFmk9Q74iwLvTvmVOyLYFBH0868w0
 PBAJQEOG8xZWlcxykv8dGUixpn2DeU8UKyP2r+h8lsqdIrGcu/5UmuWx6
 NWlCZHANncz7KEJPxs+rkCI9HVn/meY0fSDwtHkhfyBCItc/YSudT0hoD
 W0+EaQH8IVz3GQjOTAlS5oyUJGG2Uhftf1vVby/wI56frWNirT7AxyFpv
 cBku4inp8rxiNU+Z31BK3tPZngpTvcy1E7ZaJvrIyxXIz4roQOKeffUr9
 4pPlZgz83XRzsIiatX96wl9BbOaEKvW8I5Q90KJ8ARyuKWBdFQuf52lPG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="12583339"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="12583339"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 08:50:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="776044244"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="776044244"
Received: from tsenx-mobl.ger.corp.intel.com (HELO localhost) ([10.252.38.158])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 08:50:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6] drm/connector: update edid_blob_ptr documentation
Date: Fri, 12 Jan 2024 18:49:58 +0200
Message-Id: <f75ba2470e26a953b430a21ee1d25514eeafc672.1705078136.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705078136.git.jani.nikula@intel.com>
References: <cover.1705078136.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Accessing the EDID via edid_blob_ptr causes chicken-and-egg
problems. Keep edid_blob_ptr as the userspace interface that should be
accessed via dedicated functions.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_connector.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index fe88d7fc6b8f..58ee9adf9091 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1636,8 +1636,12 @@ struct drm_connector {
 
 	/**
 	 * @edid_blob_ptr: DRM property containing EDID if present. Protected by
-	 * &drm_mode_config.mutex. This should be updated only by calling
+	 * &drm_mode_config.mutex.
+	 *
+	 * This must be updated only by calling drm_edid_connector_update() or
 	 * drm_connector_update_edid_property().
+	 *
+	 * This must not be used by drivers directly.
 	 */
 	struct drm_property_blob *edid_blob_ptr;
 
-- 
2.39.2

