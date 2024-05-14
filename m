Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7380A8C5657
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 14:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B096410E678;
	Tue, 14 May 2024 12:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BaWw/RM+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49A510E74A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 12:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715691362; x=1747227362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jU/aDHYotreKrBqHFXuvyXSfHVJrI4IOkgonyVhSqpo=;
 b=BaWw/RM+ddXQrflstcyN25l/nZ5m1ZcfKIDf+zBQNmURP0vDdOxrcJ2d
 3KYm7vfxzD9kQpRs/BZBdmXb7d22cxp45mDenBC0XOIeeX8Sdc/S1sgfR
 qC5CM2VeSAHRRcYes+/FCaOZgI7Nd9mcHkU82xH8Iee/RGRKCnHhn2hHt
 Kc0GVL1YzpuxubjwyRdbsz4RD44ozxgznyztm3H8fAPAIibNF2YUh+wKx
 S4/kGzYgpudXg5PS/w9NMENZ1vHX7+18L8kKjbbXKWdc213Os39Sn9ZUH
 NSWHTxxjtg/OZCFayfDRwaiUDkZashztooadFpk+kFTrBp7JTTlT0H/gP g==;
X-CSE-ConnectionGUID: AE/HPgW6QfWTYZ5rvcEFRg==
X-CSE-MsgGUID: KyDYwudtQROTCIvMkw+fuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="22270671"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="22270671"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:56:01 -0700
X-CSE-ConnectionGUID: 13onZANCRyaGCJNLDVgHpQ==
X-CSE-MsgGUID: fLI/SKUBR2K5RFdLPiSPAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35140621"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:55:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Xinliang Liu <xinliang.liu@linaro.org>,
 Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/11] drm/hisilicon/hibmc: convert to struct drm_edid
Date: Tue, 14 May 2024 15:55:11 +0300
Message-Id: <386e3a64efbdd61c3eaed3f49ea9c3ebd4fcd41d.1715691257.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1715691257.git.jani.nikula@intel.com>
References: <cover.1715691257.git.jani.nikula@intel.com>
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

Prefer the struct drm_edid based functions for reading the EDID and
updating the connector.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Yongqin Liu <yongqin.liu@linaro.org>
Cc: John Stultz <jstultz@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c    | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index 94e2c573a7af..409c551c92af 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -24,14 +24,16 @@
 
 static int hibmc_connector_get_modes(struct drm_connector *connector)
 {
-	int count;
-	void *edid;
 	struct hibmc_connector *hibmc_connector = to_hibmc_connector(connector);
+	const struct drm_edid *drm_edid;
+	int count;
+
+	drm_edid = drm_edid_read_ddc(connector, &hibmc_connector->adapter);
 
-	edid = drm_get_edid(connector, &hibmc_connector->adapter);
-	if (edid) {
-		drm_connector_update_edid_property(connector, edid);
-		count = drm_add_edid_modes(connector, edid);
+	drm_edid_connector_update(connector, drm_edid);
+
+	if (drm_edid) {
+		count = drm_edid_connector_add_modes(connector);
 		if (count)
 			goto out;
 	}
@@ -42,7 +44,8 @@ static int hibmc_connector_get_modes(struct drm_connector *connector)
 	drm_set_preferred_mode(connector, 1024, 768);
 
 out:
-	kfree(edid);
+	drm_edid_free(drm_edid);
+
 	return count;
 }
 
-- 
2.39.2

