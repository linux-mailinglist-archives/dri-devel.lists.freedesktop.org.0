Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 373858C2768
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F7B10ED74;
	Fri, 10 May 2024 15:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NmYdxwfH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB7410ED60;
 Fri, 10 May 2024 15:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715353739; x=1746889739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=okdSamReSXfiRgy3B5DAMHJ9bmN9NST/nJOWkPfP060=;
 b=NmYdxwfH0SJyW+WHpsLSs3uUpAcZe7OnWeBbdNAIG00tzb2BssLwDJIG
 lZ5/YjDSCziru3wNCQok315MDygcTKhq9k6aUtQVQA10G2IcccqbbvY4Y
 tynIah82OuYK8sewvC4XTS/KTevLm0K8xYnm9TmyX2/jZzdrNTMMOT9o9
 /wf3qm1hAKL3x3xa57AHDR7LUIksAGw/rsh6UYip/EoQ8oThcYE2wzhKY
 eXnbQenbEm3ay/1hWy0kSgrn7iAzK0afbeBjTnrSz1bGwUlnExiu7Fr4a
 wnyAB2Si8UAaGJbPvC2oebAZ/7+odihzFFWEvIdUqC4ID1na84QGhkV+K Q==;
X-CSE-ConnectionGUID: eIZiRkbYSbWRCL5LuGm8pQ==
X-CSE-MsgGUID: xgMMb9CPSROUZYBOzNVrJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11469183"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11469183"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:08:58 -0700
X-CSE-ConnectionGUID: lfOe0sIqQli66kmc/zKdVw==
X-CSE-MsgGUID: oFPGclBFQyWjV2Tq3OV9pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="34081535"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:08:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@intel.com
Subject: [RESEND 6/6] drm/connector: update edid_blob_ptr documentation
Date: Fri, 10 May 2024 18:08:13 +0300
Message-Id: <b6aa1ea30ae85ef9e9814315d3437e82f0ba6754.1715353572.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1715353572.git.jani.nikula@intel.com>
References: <cover.1715353572.git.jani.nikula@intel.com>
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

