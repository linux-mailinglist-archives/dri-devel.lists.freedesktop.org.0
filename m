Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 580A24E99B5
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 16:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D2B10E65C;
	Mon, 28 Mar 2022 14:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C4210E1EA;
 Mon, 28 Mar 2022 14:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648478094; x=1680014094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pvY77cjJzi57ZcgLuSU7edvXHhrsFD6w3JOysl9p8uU=;
 b=bVUa8QXixqXCCePuovrGr/bvkvFeKEcSDTvMERRF0qtnYudTOQa6t9n/
 QkXrh5TTreYWc9U1sTjwAn4GrHplB6FimA4f0KxG1GXyBJfAVitbYzVpx
 g3o91kbPRUhUuGaiuo+Hnauep1Ra5yojDPBvuP3Ow7i9Ir68gnpPSjXsR
 PpGgSh4ABvGhWFYswc4YndKtcDaTUeQvrh6nOG4NB4FZ/YeXjXDAt2dFd
 NoynJdTQ/gntwaR9XDG1/dFQGSGo6LnlEjXTejYyXtnwokJKyVgAm1w4p
 ut384Qx7RWIjHXSG1UHnKwfLoLaqFSxuS+Og7u/Ct1wS8mcjggtOinNmI w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="259198600"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="259198600"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 07:34:54 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="521036618"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 07:34:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 02/12] drm/edid: fix reduced blanking support check
Date: Mon, 28 Mar 2022 17:34:23 +0300
Message-Id: <5dea5ee24065450716bbc177dd6850d3193dbeec.1648477901.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648477901.git.jani.nikula@intel.com>
References: <cover.1648477901.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The reduced blanking bit is valid only for CVT, indicated by display
range limits flags 0x04.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 1b552fe54f38..13d05062d68c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2408,7 +2408,7 @@ is_rb(struct detailed_timing *t, void *data)
 	if (!is_display_descriptor(r, EDID_DETAIL_MONITOR_RANGE))
 		return;
 
-	if (r[15] & 0x10)
+	if (r[10] == DRM_EDID_CVT_SUPPORT_FLAG && r[15] & 0x10)
 		*(bool *)data = true;
 }
 
-- 
2.30.2

