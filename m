Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F114851FC0B
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754CD10EEA0;
	Mon,  9 May 2022 12:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C9410EE9E;
 Mon,  9 May 2022 12:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097866; x=1683633866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5yHaI1nKrawDEghgxdQlWaGJ28fwoT1Eyj30sB3mVOA=;
 b=JaqiG7pQw8K7YNm+troVuF02fnYQW44RHx9pTS583Hdzqi36S5vy/Qke
 htTP08pnXqPQc64zbyKjASNVp8QZ9lN7akKOzJDEFNotZtzyCzKLJb28T
 tkjGwbSPY9R9L8K8u9Q94jm6mcyqG30/+q9ebhmHGnAQLR9Q62SVZwYBh
 Sxf83dY0TDYdJOxytHmJ2ZJ/7aQT1OpfqqnlgO6vS0/M81dZcPioL4OPA
 OFOn6TZCf2Uxvs3gY46pxQPdeq/22h1kCplHgJYZhPuiYYNwvnjJQZIfp
 eM6n1Dz6Zb1Ugfn3WAXg+8/EE6BqpmWhyHTCFwcFSKNJxVqLFlmigwsv5 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="268693437"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="268693437"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:04:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="696464671"
Received: from csawicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.129.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:04:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/25] drm/edid: convert drm_gtf_modes_for_range() to
 drm_edid
Date: Mon,  9 May 2022 15:03:10 +0300
Message-Id: <b50377ce67fd3cee6628ea5865c80fa0fa7da990.1652097712.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1652097712.git.jani.nikula@intel.com>
References: <cover.1652097712.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need to propagate drm_edid everywhere.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 5d8744a7b62e..037102a4d0b5 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3156,9 +3156,9 @@ void drm_mode_fixup_1366x768(struct drm_display_mode *mode)
 	}
 }
 
-static int
-drm_gtf_modes_for_range(struct drm_connector *connector, const struct edid *edid,
-			const struct detailed_timing *timing)
+static int drm_gtf_modes_for_range(struct drm_connector *connector,
+				   const struct drm_edid *drm_edid,
+				   const struct detailed_timing *timing)
 {
 	int i, modes = 0;
 	struct drm_display_mode *newmode;
@@ -3172,7 +3172,7 @@ drm_gtf_modes_for_range(struct drm_connector *connector, const struct edid *edid
 			return modes;
 
 		drm_mode_fixup_1366x768(newmode);
-		if (!mode_in_range(newmode, edid, timing) ||
+		if (!mode_in_range(newmode, drm_edid->edid, timing) ||
 		    !valid_inferred_mode(connector, newmode)) {
 			drm_mode_destroy(dev, newmode);
 			continue;
@@ -3236,7 +3236,7 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
 	case 0x02: /* secondary gtf, XXX could do more */
 	case 0x00: /* default gtf */
 		closure->modes += drm_gtf_modes_for_range(closure->connector,
-							  closure->drm_edid->edid,
+							  closure->drm_edid,
 							  timing);
 		break;
 	case 0x04: /* cvt, only in 1.4+ */
-- 
2.30.2

