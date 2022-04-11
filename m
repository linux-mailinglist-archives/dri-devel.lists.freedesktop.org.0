Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8854FB81E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 11:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190FE10F6A8;
	Mon, 11 Apr 2022 09:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD2010F065;
 Mon, 11 Apr 2022 09:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649670517; x=1681206517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eUwfE6J7MGtN+SHDukPVHhZVkx57GJxLY/qWDI8IwII=;
 b=ePGBvYTH7zY02zoXHVuozG/xUfaQ12un9f0oBpxF7wvZQOSlodtbmHgu
 dpD7sUglJVgVhVQcnP1E1TXh4J9hnHz/wqMg51sMIyEtL5AKMfuCYyKI+
 gh62Ae1zDzv34TrBltPWhot7ffKdJJqryalBUIDztQ/S4x1FyOhFFAAI/
 JOK6H4ozpSHI4M4Gr31VvuB5sYESmbeCF1Ib3r5Ij2/4+3J/Iz37csyoR
 4D6Fu6QhNE0Q0clYpxaCh93q0cJPOtO4ftSMHDXncnvYGr6uLo8w7iBjH
 2tg3YDuT40vyF9EIchW3F2cn/SHtQi1g8WUcmwsf1ILbPglZXau24ANBh Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="259673140"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="259673140"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:48:37 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="525914357"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:48:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [CI v2 11/12] drm/edid: add single point of return to
 drm_do_get_edid()
Date: Mon, 11 Apr 2022 12:47:32 +0300
Message-Id: <1db13fe5a34c441558c2de11fec7218f22f9e43d.1649670305.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649670305.git.jani.nikula@intel.com>
References: <cover.1649670305.git.jani.nikula@intel.com>
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

This will be useful in the future. Use fail label for fail exit.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 5a1906a5c523..0933a5c44998 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2106,7 +2106,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 
 	edid = drm_get_override_edid(connector);
 	if (edid)
-		return edid;
+		goto ok;
 
 	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
 	if (!edid)
@@ -2117,7 +2117,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	edid_block_status_print(status, edid, 0);
 
 	if (status == EDID_BLOCK_READ_FAIL)
-		goto out;
+		goto fail;
 
 	/* FIXME: Clarify what a corrupt EDID actually means. */
 	if (status == EDID_BLOCK_OK || status == EDID_BLOCK_VERSION)
@@ -2130,15 +2130,15 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 			connector->null_edid_counter++;
 
 		connector_bad_edid(connector, edid, 1);
-		goto out;
+		goto fail;
 	}
 
 	if (edid->extensions == 0)
-		return edid;
+		goto ok;
 
 	new = krealloc(edid, (edid->extensions + 1) * EDID_LENGTH, GFP_KERNEL);
 	if (!new)
-		goto out;
+		goto fail;
 	edid = new;
 
 	for (j = 1; j <= edid->extensions; j++) {
@@ -2150,7 +2150,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 
 		if (!edid_block_status_valid(status, edid_block_tag(block))) {
 			if (status == EDID_BLOCK_READ_FAIL)
-				goto out;
+				goto fail;
 			invalid_blocks++;
 		}
 	}
@@ -2161,9 +2161,10 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 		edid = edid_filter_invalid_blocks(edid, invalid_blocks);
 	}
 
+ok:
 	return edid;
 
-out:
+fail:
 	kfree(edid);
 	return NULL;
 }
-- 
2.30.2

