Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF23289BB03
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 10:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEBE1122F8;
	Mon,  8 Apr 2024 08:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PNtbReBM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3257A112311;
 Mon,  8 Apr 2024 08:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712566599; x=1744102599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sJRZIiU19JMnnFm9x55z6Ue1qfuAjgndR3khh1cMlPo=;
 b=PNtbReBMBIOnMnXZPJZCYMvoVA5oCgeusNsxiSIzXEySxX32gu3duWeR
 oAIDo0GMDDIN98CJaVFQxnC+IE5vIixE9snrSf0s2HSqeetzUBfFOI+wX
 eyM+S0pFbwTJOuqKfwHEIgCsoGeiyPoP7N37wCq9eJiyl4EI5TV/4dtjh
 oJZPMrOHWgF03Kg3M6DftGsZL3iBQzv0/O4PLnxrFRVtNrtYX38KH+r20
 NAjuuOQVQftimHaXW3JEsDfZFpRwMnDxpWSNWbf67QPFnxkCYMWq9pmEd
 aZHedzBRRAes2Z6wyL3ylOGHbi5w7fg2s+ADi/osZ29yJUOp4qkjTnFmP w==;
X-CSE-ConnectionGUID: KyE84EpUSJ2eQ+hAk5yM2w==
X-CSE-MsgGUID: 7eQmyknqQzeC7mo15eoHgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7997466"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7997466"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 01:56:39 -0700
X-CSE-ConnectionGUID: Ij8m79oNRv61teiIvC4kAA==
X-CSE-MsgGUID: 42kvke/xSKuHajanwz/l2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="24294356"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 01:56:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 5/7] drm/edid: avoid drm_edid_find_extension() internally
Date: Mon,  8 Apr 2024 11:56:06 +0300
Message-Id: <1d5009116442d72b710897c2c389afb24e01a02f.1712565984.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712565984.git.jani.nikula@intel.com>
References: <cover.1712565984.git.jani.nikula@intel.com>
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
index 6a31a3af20dd..02f0a5fd819a 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4171,11 +4171,21 @@ static bool drm_edid_has_cta_extension(const struct drm_edid *drm_edid)
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

