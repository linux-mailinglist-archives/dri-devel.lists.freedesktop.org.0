Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFB68758A0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 21:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C995010F54E;
	Thu,  7 Mar 2024 20:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RK+kh9Xv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199F210F54A;
 Thu,  7 Mar 2024 20:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709844003; x=1741380003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iPLq7WWRHXR3x1I/IBCp+ljHLEXkUTNs6qmyxZ+qJ5U=;
 b=RK+kh9Xv5/ZmtwEm2fHJOuQdFQTj7UnfWIb9gL//7GUoNE2FX8rEcPIS
 p3gmG3plVO1OYWtUJspX7JozRu1SY4cusmVf7aqrqItI7JRXyHXotQx32
 TTSP5ejqZgtXm2eOX7Cv/W7rzpufPs54QQulXcqH0sklflwRASX2J1Ptn
 NQ4fjWgJ9Mo8Mhp+tu/LS0Ld3VP+liotk73UJfnbLq4ay4+GZxBYLeaOo
 X3ecn0kokXojx0ixOHS1RXzQlBXFiOkAEaV/ZiED23Pn/Z27rbIjxOjOL
 jQaVXo4E4FbnZRB/D1lYiIoBiDnZUDTLNj0qLFne+DGoZD1t2Wxv7Gwka A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4680417"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4680417"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:40:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="10362419"
Received: from tofferse-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.212])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:39:59 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 3/6] drm/modes: switch drm_mode_prune_invalid() to use struct
 drm_printer
Date: Thu,  7 Mar 2024 22:39:35 +0200
Message-Id: <b9e4f74f13a732b4d8e2536dcc0debe10e6bc6d8.1709843865.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709843865.git.jani.nikula@intel.com>
References: <cover.1709843865.git.jani.nikula@intel.com>
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

Use device based debug logging for the mode via drm_printer.

This changes the output from the format:

[drm:drm_mode_debug_printmodeline] Modeline "6144x3456": 60 1378800 6144 6192 6224 6464 3456 3459 3464 3555 0x48 0x9
[drm:drm_mode_prune_invalid] Not using 6144x3456 mode: CLOCK_HIGH

to format:

i915 0000:00:02.0: [drm] Rejected mode: "6144x3456": 60 1378800 6144 6192 6224 6464 3456 3459 3464 3555 0x48 0x9
i915 0000:00:02.0: [drm] Rejected mode: "6144x3456": CLOCK_HIGH

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_modes.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 711750ab57c7..0fff5a8d4d81 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1825,10 +1825,13 @@ void drm_mode_prune_invalid(struct drm_device *dev,
 					 DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
 			}
 			if (verbose) {
-				drm_mode_debug_printmodeline(mode);
-				DRM_DEBUG_KMS("Not using %s mode: %s\n",
-					      mode->name,
-					      drm_get_mode_status_name(mode->status));
+				struct drm_printer p;
+
+				p = drm_dbg_printer(dev, DRM_UT_KMS, "Rejected mode:");
+
+				drm_mode_print(&p, mode);
+				drm_printf(&p, "\"%s\": %s\n", mode->name,
+					   drm_get_mode_status_name(mode->status));
 			}
 			drm_mode_destroy(dev, mode);
 		}
-- 
2.39.2

