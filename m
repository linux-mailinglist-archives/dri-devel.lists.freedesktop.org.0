Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DADCC4ECA3E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 19:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8595289D5B;
	Wed, 30 Mar 2022 17:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BC289D46;
 Wed, 30 Mar 2022 17:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648659878; x=1680195878;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GVZtx7L606MZ51j1xlSPn80DFnkIKJHIjP59Bq2tCG4=;
 b=HnUL12Llq5Ht5oVdR299R3NfROU5jUQQuUoV7dEVQXHiSJy1cZ7tJ0oW
 wJMvOnwhQUrDh0k2CFQR+LJAacggu8bsCvKXtUfEmu0o7e2HnEoAg7lEt
 blQandW2ZAaZrrtynygGOLNtE4khwKB4We9EfG2dV/Dm98xvtj/GEgi4d
 v6xYQWjk4yA5tCt+JmTKgaKZ/ueTuDkK7edhELHyb6s+QjqD+zt7YJi4b
 EkDcCAPPiBX1H8xBItUcIntHj/nToQKCyjQr3/UjBiQAGMo90T2FFyjg4
 CeUVWYtsffpGobelxRFdsSdOfeO4eVPX8jQlwvfArt16Pk/pFoK6TMmoR A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="258425203"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="258425203"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 10:04:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="565652976"
Received: from nhanus-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.62.116])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 10:04:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: fix invalid EDID extension block filtering
Date: Wed, 30 Mar 2022 20:04:26 +0300
Message-Id: <20220330170426.349248-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
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

The invalid EDID block filtering uses the number of valid EDID
extensions instead of all EDID extensions for looping the extensions in
the copy. This is fine, by coincidence, if all the invalid blocks are at
the end of the EDID. However, it's completely broken if there are
invalid extensions in the middle; the invalid blocks are included and
valid blocks are excluded.

Fix it by modifying the base block after, not before, the copy.

Fixes: 14544d0937bf ("drm/edid: Only print the bad edid when aborting")
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index d79b06f7f34c..8829120470ab 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2031,9 +2031,6 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 
 		connector_bad_edid(connector, edid, edid[0x7e] + 1);
 
-		edid[EDID_LENGTH-1] += edid[0x7e] - valid_extensions;
-		edid[0x7e] = valid_extensions;
-
 		new = kmalloc_array(valid_extensions + 1, EDID_LENGTH,
 				    GFP_KERNEL);
 		if (!new)
@@ -2050,6 +2047,9 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 			base += EDID_LENGTH;
 		}
 
+		new[EDID_LENGTH - 1] += new[0x7e] - valid_extensions;
+		new[0x7e] = valid_extensions;
+
 		kfree(edid);
 		edid = new;
 	}
-- 
2.30.2

