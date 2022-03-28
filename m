Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7DF4E99BE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 16:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1F210E692;
	Mon, 28 Mar 2022 14:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FF710E66D;
 Mon, 28 Mar 2022 14:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648478124; x=1680014124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7GZMZeJsjd0xdosgOp9CwtswIpNPGapabRzEVFo7e1s=;
 b=DXdKRvGStXe0c1E9bPnu+TfHQfHYVEBQZ28PIwomgqoWw/yR+RZ/3xwY
 +j7u9E7+RH3ouURlhEzIQofYn5AbgH8tnUv9k9Wm+vCsde/c7v59WL8P0
 g/WUAXkQ2RzZGYqSFvveclJJ0mHT09M8ZOedco3fXeiC80OoGpg6qN1f9
 6WVh0uKZ8pdx6isGwuy78L77ZF9/3vB4MOMT+fLvQf+ajBLfIPS1ziX+/
 3wG90NOq4EEyjgNmCqQ7YhhnXCSGK6rIWGa9iWAnrcblzmctnPY6zXxlO
 KLj8yCxB9/SnBxgdy//NswFDbRX6YKvNwk7jIuAIrNpEHPXmxRH1i1Znx A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="256586297"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="256586297"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 07:35:03 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="652069274"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 07:35:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 04/12] drm/edid: pass a timing pointer to
 is_detailed_timing_descriptor()
Date: Mon, 28 Mar 2022 17:34:25 +0300
Message-Id: <0b5213383e14f11c6a505b10a7342fb2ff4f2a11.1648477901.git.jani.nikula@intel.com>
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

Use struct member access instead of direct offsets to avoid a cast.

Use BUILD_BUG_ON() for sanity check.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ded1f019180d..10da6b9b14fb 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2342,9 +2342,11 @@ static bool is_display_descriptor(const struct detailed_timing *descriptor, u8 t
 		descriptor->data.other_data.type == type;
 }
 
-static bool is_detailed_timing_descriptor(const u8 d[18])
+static bool is_detailed_timing_descriptor(const struct detailed_timing *descriptor)
 {
-	return d[0] != 0x00 || d[1] != 0x00;
+	BUILD_BUG_ON(offsetof(typeof(*descriptor), pixel_clock) != 0);
+
+	return descriptor->pixel_clock != 0;
 }
 
 typedef void detailed_cb(struct detailed_timing *timing, void *closure);
@@ -3266,7 +3268,7 @@ do_detailed_mode(struct detailed_timing *timing, void *c)
 	struct detailed_mode_closure *closure = c;
 	struct drm_display_mode *newmode;
 
-	if (!is_detailed_timing_descriptor((const u8 *)timing))
+	if (!is_detailed_timing_descriptor(timing))
 		return;
 
 	newmode = drm_mode_detailed(closure->connector->dev,
-- 
2.30.2

