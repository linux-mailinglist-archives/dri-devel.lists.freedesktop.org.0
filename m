Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D1271598B
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 11:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AB610E388;
	Tue, 30 May 2023 09:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027D510E386;
 Tue, 30 May 2023 09:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685437762; x=1716973762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iOOLBfLwiKsWoCvn5Nsv5WTESUgLcQKcpOV60NlpGsE=;
 b=GwxJtFKe0kcHRGiaGnBGXv3FJir3NSP3tX2ZWEhmInDglsAPG8hFpLio
 VN/CvSyWEgUsNIdxqi/n7LfOvApe0NQ/G02yTSDlumRT7w+0q2xsr5TzK
 BHzj+cCpVm4oloajKkJ4goLRdZfCTUvglS04HuolU1phOmCfMvEPjE1wB
 i7YexS2ivNaex3Sn3hQQJDyZ1IPavi78UyViEyEPD5jjHt/n8d3qz4gg4
 eqclZhwSwY8JTl2zBGhUoM1h3dklMSyRyph9EEf308PrndhYaAiY0P7h2
 F29Ihj1bCc+oYiFD0J64nkLiAHX9oWoEfkKt8+P6jvg5Rn45MPkm4f0PJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="354872622"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="354872622"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 02:09:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="683875196"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="683875196"
Received: from kleve-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.47.8])
 by orsmga006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 02:09:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 10/13] drm/i915/lvds: switch to drm_edid_read_switcheroo()
Date: Tue, 30 May 2023 12:08:22 +0300
Message-Id: <429cd6f23366cb4cace4fa13cf92ad068aca64dd.1685437501.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1685437500.git.jani.nikula@intel.com>
References: <cover.1685437500.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm_edid_read_switcheroo() to switch from struct edid to struct
drm_edid.

Reviewed-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lvds.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
index 1f4349a12a02..3ace56979b70 100644
--- a/drivers/gpu/drm/i915/display/intel_lvds.c
+++ b/drivers/gpu/drm/i915/display/intel_lvds.c
@@ -944,17 +944,8 @@ void intel_lvds_init(struct drm_i915_private *i915)
 	 */
 	mutex_lock(&i915->drm.mode_config.mutex);
 	if (vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC) {
-		const struct edid *edid;
-
-		/* FIXME: Make drm_get_edid_switcheroo() return drm_edid */
-		edid = drm_get_edid_switcheroo(&connector->base,
-					       intel_gmbus_get_adapter(i915, pin));
-		if (edid) {
-			drm_edid = drm_edid_alloc(edid, (edid->extensions + 1) * EDID_LENGTH);
-			kfree(edid);
-		} else {
-			drm_edid = NULL;
-		}
+		drm_edid = drm_edid_read_switcheroo(&connector->base,
+						    intel_gmbus_get_adapter(i915, pin));
 	} else {
 		drm_edid = drm_edid_read_ddc(&connector->base,
 					     intel_gmbus_get_adapter(i915, pin));
-- 
2.39.2

