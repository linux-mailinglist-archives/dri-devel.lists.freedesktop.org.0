Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B36F7A1A6AD
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 16:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971F510E841;
	Thu, 23 Jan 2025 15:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dhMsdTZI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B03D10E83F;
 Thu, 23 Jan 2025 15:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737644966; x=1769180966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qgIL61BEA/zScrPiI/D+X9N0jaIJgsAgygGVk8U1kIA=;
 b=dhMsdTZIaRlQCmkMReaSYQSn1G5LHLeV2RCLj/9XuivI28qQFRh/Lx7C
 ED0YAzmadrnAGAXiaZrOcURy3HQZq01V4FBLdNg7WJi13MIC4SPHu9vGm
 4IW74Dz+rJ+EOcAjJMyvsrpYOBkbgmPuNYaj2ewMJ46BzcdWxwzuEMPDr
 NxXYJoo+GLlNzf7dvwGSEIkjlxZinxnAY5orrSTIxH0rUL76NxJD9XEep
 ZITJ2KLDfGVKUIF+0IyXSVJsxhiV6/FvYfsap12OGccbv3Hnosy2xqdUQ
 j+IBASSxy+bRJkFYBrUlJnLmvdGsLiUCJSKFPCZYlcanjUaSuEhKikRJ/ A==;
X-CSE-ConnectionGUID: NNt2MSSZRhihfsnRLjcCZg==
X-CSE-MsgGUID: 1Eqs00yWSeu/h9zl5pcgSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="49542382"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="49542382"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 07:09:26 -0800
X-CSE-ConnectionGUID: Bev1LY4QRkeywDeTzBJePQ==
X-CSE-MsgGUID: vq9gKgjZRJWx5hUvhQZWEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108350312"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 07:09:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/5] drm/mipi-dsi: stop passing non struct drm_device to
 drm_err() and friends
Date: Thu, 23 Jan 2025 17:09:08 +0200
Message-Id: <842f97ade87d6f0c4b1de12e8ed5610a1b07fd8c.1737644530.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1737644530.git.jani.nikula@intel.com>
References: <cover.1737644530.git.jani.nikula@intel.com>
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

The expectation is that the struct drm_device based logging helpers get
passed an actual struct drm_device pointer rather than some random
struct pointer where you can dereference the ->dev member.

Convert drm_err(host, ...) to dev_err(host->dev, ...). This matches
current usage, as struct drm_device is not available, but drops "[drm]
*ERROR*" from logs.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/drm_mipi_dsi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 5e5c5f84daac..7a1ebf71d798 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -162,13 +162,13 @@ of_mipi_dsi_device_add(struct mipi_dsi_host *host, struct device_node *node)
 	u32 reg;
 
 	if (of_alias_from_compatible(node, info.type, sizeof(info.type)) < 0) {
-		drm_err(host, "modalias failure on %pOF\n", node);
+		dev_err(host->dev, "modalias failure on %pOF\n", node);
 		return ERR_PTR(-EINVAL);
 	}
 
 	ret = of_property_read_u32(node, "reg", &reg);
 	if (ret) {
-		drm_err(host, "device node %pOF has no valid reg property: %d\n",
+		dev_err(host->dev, "device node %pOF has no valid reg property: %d\n",
 			node, ret);
 		return ERR_PTR(-EINVAL);
 	}
@@ -206,18 +206,18 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *host,
 	int ret;
 
 	if (!info) {
-		drm_err(host, "invalid mipi_dsi_device_info pointer\n");
+		dev_err(host->dev, "invalid mipi_dsi_device_info pointer\n");
 		return ERR_PTR(-EINVAL);
 	}
 
 	if (info->channel > 3) {
-		drm_err(host, "invalid virtual channel: %u\n", info->channel);
+		dev_err(host->dev, "invalid virtual channel: %u\n", info->channel);
 		return ERR_PTR(-EINVAL);
 	}
 
 	dsi = mipi_dsi_device_alloc(host);
 	if (IS_ERR(dsi)) {
-		drm_err(host, "failed to allocate DSI device %ld\n",
+		dev_err(host->dev, "failed to allocate DSI device %ld\n",
 			PTR_ERR(dsi));
 		return dsi;
 	}
@@ -228,7 +228,7 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *host,
 
 	ret = mipi_dsi_device_add(dsi);
 	if (ret) {
-		drm_err(host, "failed to add DSI device %d\n", ret);
+		dev_err(host->dev, "failed to add DSI device %d\n", ret);
 		kfree(dsi);
 		return ERR_PTR(ret);
 	}
-- 
2.39.5

