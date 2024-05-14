Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 060E38C5659
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 14:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F387110E796;
	Tue, 14 May 2024 12:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oq3iXrrR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504B610E796
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 12:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715691373; x=1747227373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gWeytuoLYW81OahLs34l8TGDbRCcql8Z+kOldXRVO4k=;
 b=Oq3iXrrRPM50toCYw6ikmGOCJ31Uwuo614quZoRlq5KKS8jUAObHF76e
 hsCxPkQVn37UaSt36n38587bW8qxSmtwXYtolwy7rCNiOIkS85JiBmMK+
 eDISVQsWjq0q/OD3s30e4OlvHJ8qxgJNTr+Lb6sCn4I9Cc8j/dLrB2Pl7
 6c5MnlvOLppTV3W8OLodkILiHsanRsve88+hgHHyUz4OGCpuGQcd6jjUc
 EY1kUO7KCphvizar6Oklih2tRIZqRS64ZLPtwVGM3wO1eG1/bGzA1L6Uc
 Uo9UFXIN/+9yD/BOQ5kb4WJ4YfSkQYsAE51Xex+x//B+F4dIZhe+mEy0m A==;
X-CSE-ConnectionGUID: vXfFNzy5TfmNbk09xyoTrg==
X-CSE-MsgGUID: /UZLa0g8SQKGrM0AHjBdFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="22270702"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="22270702"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:56:13 -0700
X-CSE-ConnectionGUID: rnZTcBGkTQGo5jLGNW/QAg==
X-CSE-MsgGUID: 9Dx/GTy4T/uOoYcWhS8b5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35140774"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:56:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Sui Jingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 07/11] drm/loongson/7a2000: convert to struct drm_edid
Date: Tue, 14 May 2024 15:55:13 +0300
Message-Id: <b8c477279a6ae1b44df72bee230180e277087fae.1715691257.git.jani.nikula@intel.com>
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

Cc: Sui Jingfeng <suijingfeng@loongson.cn>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_output_7a2000.c b/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
index ce3dabec887e..2bd797a9b9ff 100644
--- a/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
+++ b/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
@@ -44,16 +44,15 @@
 
 static int ls7a2000_connector_get_modes(struct drm_connector *connector)
 {
-	unsigned int num = 0;
-	struct edid *edid;
+	int num;
 
 	if (connector->ddc) {
-		edid = drm_get_edid(connector, connector->ddc);
-		if (edid) {
-			drm_connector_update_edid_property(connector, edid);
-			num = drm_add_edid_modes(connector, edid);
-			kfree(edid);
-		}
+		const struct drm_edid *drm_edid;
+
+		drm_edid = drm_edid_read(connector);
+		drm_edid_connector_update(connector, drm_edid);
+		num = drm_edid_connector_add_modes(connector);
+		drm_edid_free(drm_edid);
 
 		return num;
 	}
-- 
2.39.2

