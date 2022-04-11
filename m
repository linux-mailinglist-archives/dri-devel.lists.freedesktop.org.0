Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3544FBE2D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 16:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC2C10F746;
	Mon, 11 Apr 2022 14:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B285410F6D6;
 Mon, 11 Apr 2022 14:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649685718; x=1681221718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eUwfE6J7MGtN+SHDukPVHhZVkx57GJxLY/qWDI8IwII=;
 b=mCruRhft90tjWaeJtnTctkgW5sxoNVScWjxDxyMxMJ/ldQ5u3YLkntys
 wIJKn3klf2qv8AwS6UFOY70zs+v+E42udco9yHVQCSgKF/eAyeSaTBqM9
 4WA6v26yL+HFqK2DSPrOdUAlpY22LHzgjq0RVykRUevz7X6Uqg1XS39+E
 TtZTuAJT1weLysM7c1JDEUiE8orXF5KjntvFoZmpMbW6veudNZa5LANWt
 5qQHIGBQt5EaBtFgKD3KY5LOmfiiTR+mJKOh1+sVxAwstEtbaVXu9VOjm
 LMFmNFKMjbhOpKOeQ2mBX1YOa/YVwDk8Z5ym6jpgUw0NMB5eruUH5BOZ4 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="244005561"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="244005561"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 07:01:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="723980342"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 07:01:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [CI v3 11/12] drm/edid: add single point of return to
 drm_do_get_edid()
Date: Mon, 11 Apr 2022 17:00:34 +0300
Message-Id: <8e564e9415baa4dc9dc3127e4200b2618a8a3ba0.1649685475.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649685475.git.jani.nikula@intel.com>
References: <cover.1649685475.git.jani.nikula@intel.com>
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

