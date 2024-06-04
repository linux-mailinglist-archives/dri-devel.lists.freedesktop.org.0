Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE09E8FA85B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 04:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA04B10E0F6;
	Tue,  4 Jun 2024 02:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBrsGbEO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35ACF10E0F6
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 02:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717468869; x=1749004869;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eLp6WLKas21rieZUAKSbUw+QdxmalQnHeXGfg9oPOCs=;
 b=VBrsGbEOi22vORZfsiw+iREqJVZTIjo5kK8IaFsy6AuPh+35GSXZNcnz
 TNnhACJgM79ZdSw4DU9TDWDiobHpeFgBzA7R2UeXDGGVe67nWn+rJjd+i
 c9Sa1nbBMXo5i09nPvs1Ma4+ZX0NBadqFL1WY2ZJFZZUx2PNyw78Efx4w
 Kanq3zD5q7mkW8cBOZeazHURAWtbUztTXnbOw508wOZDETa2Xn00bJFAl
 6CQ/jyRyzmzhPt+7am7SqGNAAcsfkXymkAXP+KB3Kbc8NLViX7vV/v8d4
 uQyfoV5AlVsrFv6OFbEXbeUKIOe7p6pJxunFvJj9kZ6JsP40cufStlzII Q==;
X-CSE-ConnectionGUID: +M7CjTjvTPy0+uEUCTKgFA==
X-CSE-MsgGUID: n/HmbA3ySlmbQYAwegP2RA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25101262"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="25101262"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 19:41:09 -0700
X-CSE-ConnectionGUID: YhHc/M9KRZed8YqOmybfnA==
X-CSE-MsgGUID: eg7WVcW5QVuGAykAYgo6iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="74567188"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 19:41:08 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: mcanal@igalia.com
Subject: [PATCH] drm/v3d: Fix compile with CONFIG_WERROR
Date: Mon,  3 Jun 2024 19:40:55 -0700
Message-ID: <20240604024055.1792731-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fix compile with CONFIG_WERROR by explicitly computing the max number of
7.1 and 4.2 counters.

In file included from ../drivers/gpu/drm/v3d/v3d_drv.h:14,
                 from ../drivers/gpu/drm/v3d/v3d_bo.c:26:
../drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: \
	error: ‘v3d_v42_performance_counters’ defined but not used \
	[-Werror=unused-const-variable=]

Fixes: 3cbcbe016c31 ("drm/v3d: Add Performance Counters descriptions for V3D 4.2 and 7.1")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 556cbb400ba0..93dccb5f4c23 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -352,7 +352,9 @@ struct v3d_timestamp_query {
 };
 
 /* Maximum number of performance counters supported by any version of V3D */
-#define V3D_MAX_COUNTERS ARRAY_SIZE(v3d_v71_performance_counters)
+#define MAX(a, b) ((a) > (b) ? (a) : (b))
+#define V3D_MAX_COUNTERS MAX(ARRAY_SIZE(v3d_v71_performance_counters), \
+			     ARRAY_SIZE(v3d_v42_performance_counters))
 
 /* Number of perfmons required to handle all supported performance counters */
 #define V3D_MAX_PERFMONS DIV_ROUND_UP(V3D_MAX_COUNTERS, \
-- 
2.41.0

