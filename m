Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBFA5FA890
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 01:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446F710E74F;
	Mon, 10 Oct 2022 23:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE58510E74F;
 Mon, 10 Oct 2022 23:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665443873; x=1696979873;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q8qj+6SQgteU4qsfiTSmPBIvncuAVYMU8h+Bl7uEXFU=;
 b=VckMvB33aoF6PQ2cMd/NN+++bC6w+pGKYm9kQi7NUyiVxADOyNyp4rvk
 EpHtfKLAjEzr/d1aLV1LXvR96PBd1DotVwhtSZER333EeNOAZlnUx+RdM
 omOolZx8RP8c7WP0ldMNgtVtz0AAjWpTpOt4ahWAzir1mlgCBVypFnZpx
 hI3y7SiZCPfi45dmPX0cWs3bi/ZHcExA8XF3QIyhsKuftCKPGI3ywPkP6
 /OLd+sWFBAN9LlKESzWanSAAzkpYot/cttuYzjNwgvrR6zgueLvM5tVJr
 83qX/69cQ8ZXhrjz1GsS9tLfW7pWyeIaKUXtnffAbJ5DzQT/pcNkVFpW6 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="291670562"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="291670562"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 16:17:53 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="751526805"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="751526805"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 16:17:53 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Use graphics ver,
 rel info for media on old platforms
Date: Mon, 10 Oct 2022 16:17:20 -0700
Message-Id: <20221010231720.3730568-1-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Platforms prior to MTL do not have a separate media and graphics version.
On platforms where GMD id is not supported, reuse the graphics ip version,
release info for media.

The rest of the IP graphics, display versions would be copied during driver
creation.

While at it warn if GMD is not used for platforms greater than gen12.

Fixes: c2c7075225ef ("drm/i915: Read graphics/media/display arch version from hw")
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/intel_device_info.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index 090097bb3c0a..ba178b61bceb 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -329,8 +329,18 @@ static void intel_ipver_early_init(struct drm_i915_private *i915)
 {
 	struct intel_runtime_info *runtime = RUNTIME_INFO(i915);
 
-	if (!HAS_GMD_ID(i915))
+	if (!HAS_GMD_ID(i915)) {
+		drm_WARN_ON(&i915->drm, RUNTIME_INFO(i915)->graphics.ip.ver > 12);
+		/*
+		 * On older platforms, graphics and media share the same ip
+		 * version and release.
+		 */
+		RUNTIME_INFO(i915)->media.ip.ver =
+			RUNTIME_INFO(i915)->graphics.ip.ver;
+		RUNTIME_INFO(i915)->media.ip.rel =
+			RUNTIME_INFO(i915)->graphics.ip.rel;
 		return;
+	}
 
 	ip_ver_read(i915, i915_mmio_reg_offset(GMD_ID_GRAPHICS),
 		    &runtime->graphics.ip);
-- 
2.34.1

