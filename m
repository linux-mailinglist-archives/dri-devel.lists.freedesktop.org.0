Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1078C5658
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 14:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E173110E74A;
	Tue, 14 May 2024 12:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9fOrq2O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28D110E74A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 12:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715691367; x=1747227367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QFCTAcbDHAxYsVMOhCeqPSF60ddgC78h9uhTjFsgXRI=;
 b=d9fOrq2ORxMWLL3D85/L9EDuFHjOxrxtGwCC+62VoAbQbY62T2J7BRri
 vrkU0IslpjnwQDKzkGwfvS73Fqxe805VVbpdbZ0whMpp+C49TxY8a8P9s
 tLqBFho7fPk/gsjGHNqUMxjZRg1Yp56GB7ZTB4P3ocOCs2QfgkGjlkKbT
 4nLXXxB78fgkxUFtKoXd9PFry63fRRC5KEXhCcRvE39aisSzn/zuLc5VU
 ToSv7X3Q2wbw9bYoFTxP4QJKMthFwJhtshw9NSeGOdYzJqkeobSlJnixU
 hL+40jYM0kTvnpU/TqkgEya3a5vJP7ijEBiMot+TCZS3ydYptl6e/enIf Q==;
X-CSE-ConnectionGUID: r5SqcJSDQ46ySBrDU1gd4Q==
X-CSE-MsgGUID: vA+A1aIWRHelQqPzG33wkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="22270681"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="22270681"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:56:07 -0700
X-CSE-ConnectionGUID: b0On+TQdQVeTq3h7VcKffQ==
X-CSE-MsgGUID: Uy/OSIU8RxeX2yCJrxadXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35140694"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:56:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Sui Jingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/11] drm/loongson/7a1000: convert to struct drm_edid
Date: Tue, 14 May 2024 15:55:12 +0300
Message-Id: <22c66af62cd5ae1998bbaf6801cda3cc689f9e3f.1715691257.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_output_7a1000.c b/drivers/gpu/drm/loongson/lsdc_output_7a1000.c
index 6fc8dd1c7d9a..600ed4fb0884 100644
--- a/drivers/gpu/drm/loongson/lsdc_output_7a1000.c
+++ b/drivers/gpu/drm/loongson/lsdc_output_7a1000.c
@@ -40,16 +40,15 @@
 
 static int ls7a1000_dpi_connector_get_modes(struct drm_connector *conn)
 {
-	unsigned int num = 0;
-	struct edid *edid;
+	int num;
 
 	if (conn->ddc) {
-		edid = drm_get_edid(conn, conn->ddc);
-		if (edid) {
-			drm_connector_update_edid_property(conn, edid);
-			num = drm_add_edid_modes(conn, edid);
-			kfree(edid);
-		}
+		const struct drm_edid *drm_edid;
+
+		drm_edid = drm_edid_read(conn);
+		drm_edid_connector_update(conn, drm_edid);
+		num = drm_edid_connector_add_modes(conn);
+		drm_edid_free(drm_edid);
 
 		return num;
 	}
-- 
2.39.2

