Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F7E8A66F7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 11:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06A0112B38;
	Tue, 16 Apr 2024 09:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DFNf5TeR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C98610FCBC;
 Tue, 16 Apr 2024 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713259233; x=1744795233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aVX/KLDb5ph19KSJlUR0eMkyxqZVQdZFk2NRtwqhnSo=;
 b=DFNf5TeRC+XxM7uEj89VkjlJH8Adv70gskLFSYZ5nxK+O8dz4S4HljpD
 6f6TLDmxeiNf9imviWN85b95odvW8DUBbpfIfoZd+/2InQ24sZhwem00u
 SIl6irmJ7KOaywAtO+QSMlDTAcUiX1yuyWwGm8XL40mtJk47NAiLTvme0
 oViKNjSO1qus/hBXc3/WylcsV1PtvX+Ye050syrI/e1eHFcRTwgaZLQYH
 s87HuxV5OJSnIYDQtKnBMf3yg/vhDwvV1Xit9ZStqxTboS7tNC+jJDpiU
 6HJhfiFRCYlC4u4VcjL4dxFiMp7jCfzx9DHtC9eW2+kn2RrjBEePDKAIy Q==;
X-CSE-ConnectionGUID: sVA//DhoTxujbw15feBuvw==
X-CSE-MsgGUID: lTU4y6ZxTBmkFeHGwgUHxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8606029"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8606029"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:20:29 -0700
X-CSE-ConnectionGUID: tG2ZTvWVQnqomxwblTbpkQ==
X-CSE-MsgGUID: 1i04zhOhSwCU1NyCS060ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="22199407"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:20:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: [REBASE 5/7] drm/edid: avoid drm_edid_find_extension() internally
Date: Tue, 16 Apr 2024 12:19:58 +0300
Message-Id: <9fa366147b06a28304527be48f1b363c3484c8a3.1713259151.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713259151.git.jani.nikula@intel.com>
References: <cover.1713259151.git.jani.nikula@intel.com>
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

Prefer the EDID iterators over drm_edid_find_extension() in
drm_edid_has_cta_extension(), even if this leads to more code. The key
is to use the same patterns as much as possible.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index c29f31dcc818..4b3ad42a8f95 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4230,11 +4230,21 @@ static bool drm_edid_has_cta_extension(const struct drm_edid *drm_edid)
 {
 	const struct displayid_block *block;
 	struct displayid_iter iter;
-	int ext_index = 0;
+	struct drm_edid_iter edid_iter;
+	const u8 *ext;
 	bool found = false;
 
 	/* Look for a top level CEA extension block */
-	if (drm_edid_find_extension(drm_edid, CEA_EXT, &ext_index))
+	drm_edid_iter_begin(drm_edid, &edid_iter);
+	drm_edid_iter_for_each(ext, &edid_iter) {
+		if (ext[0] == CEA_EXT) {
+			found = true;
+			break;
+		}
+	}
+	drm_edid_iter_end(&edid_iter);
+
+	if (found)
 		return true;
 
 	/* CEA blocks can also be found embedded in a DisplayID block */
-- 
2.39.2

