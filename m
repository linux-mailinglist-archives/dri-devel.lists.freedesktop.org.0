Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 423C09E51B6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 10:49:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B749910E386;
	Thu,  5 Dec 2024 09:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCwRF0XN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7AA10E39D;
 Thu,  5 Dec 2024 09:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733392197; x=1764928197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RjEk9KxpiXq5IqtZQnUTNrg37mvyAwQXbHVk9jk4h4w=;
 b=mCwRF0XN/myGcv6EoUZNEuap4cUbUwvlc2X80Zw/agLnjWhz+0oE1BUd
 gWB4Tg2Fak4bmv8gaP7E/49cJXcZcGFbAX61X6AYKBPrfi4kxCk7JM2tw
 T0eHAaFhaHRrnZYNZ1YHcECObbxF2rlLSxt7Zsmc9NOae+spkfhraI9Jh
 o2OwU9kmpZq7Tsbh1U0DZMqiGg82Wwmviu8tD62X9AwMFFZOR2bRCTBX9
 3oG7Uuh8wJjyoOpa8U235J7gEb2p5WKvmwp8KKXfTZ8S5QTq23NaMm3r3
 6fniB4VZJTI2iRAeH94Jt6ir2w5rttSIdLHMvCIk4ZVF+D1WbrVFL0SD0 w==;
X-CSE-ConnectionGUID: ccRlmoDeRQ29Vw69cB3wxA==
X-CSE-MsgGUID: UGdKszb4RUKINDFQNo/6Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33938958"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="33938958"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 01:49:57 -0800
X-CSE-ConnectionGUID: py4z3AyvScKxOHjkxNKHMQ==
X-CSE-MsgGUID: lG6wRfpIQg6bcPqQa8jLTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="124862188"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.27])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 01:49:55 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 3/3] drm/i915/display: use drm_print_hex_dump() for buffer
 mismatch dumps
Date: Thu,  5 Dec 2024 11:49:35 +0200
Message-Id: <a536050b5f9dc2d7de32d29766c98477f58d746c.1733392101.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1733392101.git.jani.nikula@intel.com>
References: <cover.1733392101.git.jani.nikula@intel.com>
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

Use the drm_printer based printer to get the device specific printing of
the hex dump, and avoid the manual loglevel hacking.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 28c1b372cc95..5419e849450b 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5268,26 +5268,13 @@ pipe_config_buffer_mismatch(struct drm_printer *p, bool fastset,
 			    const char *name,
 			    const u8 *a, const u8 *b, size_t len)
 {
-	const char *loglevel;
-
-	if (fastset) {
-		if (!drm_debug_enabled(DRM_UT_KMS))
-			return;
-
-		loglevel = KERN_DEBUG;
-	} else {
-		loglevel = KERN_ERR;
-	}
-
 	pipe_config_mismatch(p, fastset, crtc, name, "buffer");
 
 	/* only dump up to the last difference */
 	len = memcmp_diff_len(a, b, len);
 
-	print_hex_dump(loglevel, "expected: ", DUMP_PREFIX_NONE,
-		       16, 0, a, len, false);
-	print_hex_dump(loglevel, "found: ", DUMP_PREFIX_NONE,
-		       16, 0, b, len, false);
+	drm_print_hex_dump(p, "expected: ", a, len);
+	drm_print_hex_dump(p, "found:    ", b, len);
 }
 
 static void
-- 
2.39.5

