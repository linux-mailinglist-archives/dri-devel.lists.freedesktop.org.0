Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F2E5FB778
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 17:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757CD10E874;
	Tue, 11 Oct 2022 15:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CF910E380;
 Tue, 11 Oct 2022 15:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665502781; x=1697038781;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rt5TN++QcPZFbsjfvyDFQ96+McN98i7Ji8Gsdhl57AU=;
 b=niOu+zNzFuZ2FiU4YBLqX0FvUG8vscU4Yexa9rzdZp8tXIOxVuyRwefO
 3Ph6Z/VQLWm8RKn6z+wVdZHGJ2hif/hfcv5pmUl5j1fQmgU8LUeegTNYr
 R/+sK8oLFt8y/8bp+feDqS1XBRRXMWj/qYbK8lqj4IEID/74uuQ0Jz6o1
 hl+9fye0C2JGTTPzhQoJ7YytiM+VUckt6Cws6nCaFtlAMlJXzC8YPoxXt
 SQuwI2ivBEzKZB/IfDCLXhCv4GJW/EZ4r3XJVu8t7D3kVNYekqwOCjLaF
 peeHUEWt7dTkSu961skI5fxnUOjhU8oh4ruMugNoVs7fakPIJZc7hhNrZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="305591637"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="305591637"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 08:39:31 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="768839296"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="768839296"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 08:39:31 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915: Use graphics ver,
 rel info for media on old platforms
Date: Tue, 11 Oct 2022 08:38:51 -0700
Message-Id: <20221011153851.3781507-2-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011153851.3781507-1-radhakrishna.sripada@intel.com>
References: <20221011153851.3781507-1-radhakrishna.sripada@intel.com>
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
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Platforms prior to MTL do not have a separate media and graphics version.
On platforms where GMD id is not supported, reuse the graphics ip version,
release info for media.

The rest of the IP graphics, display versions would be copied during driver
creation.

While at it warn if GMD is not used for platforms greater than gen12.

v2:
 - Use simple assignment to copy contents of the structure(JaniN)

Fixes: c2c7075225ef ("drm/i915: Read graphics/media/display arch version from hw")
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/intel_device_info.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index 37267c662dc6..1dc1fb29a776 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -329,8 +329,16 @@ static void intel_ipver_early_init(struct drm_i915_private *i915)
 {
 	struct intel_runtime_info *runtime = RUNTIME_INFO(i915);
 
-	if (!HAS_GMD_ID(i915))
+	if (!HAS_GMD_ID(i915)) {
+		drm_WARN_ON(&i915->drm, RUNTIME_INFO(i915)->graphics.ip.ver > 12);
+		/*
+		 * On older platforms, graphics and media share the same ip
+		 * version and release.
+		 */
+		RUNTIME_INFO(i915)->media.ip =
+			RUNTIME_INFO(i915)->graphics.ip;
 		return;
+	}
 
 	ip_ver_read(i915, i915_mmio_reg_offset(GMD_ID_GRAPHICS),
 		    &runtime->graphics.ip);
-- 
2.34.1

