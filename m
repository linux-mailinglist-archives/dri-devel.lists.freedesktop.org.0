Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6474FB817
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 11:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DDD10E175;
	Mon, 11 Apr 2022 09:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8160010E175;
 Mon, 11 Apr 2022 09:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649670502; x=1681206502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fgn/VlHilTVwvjoZ36oCp9pU1Nz13lyciypWk6ckYeg=;
 b=UYmH8XEkKXBHojJpce8UM2Ya+7M2w94SEU7DAy8GMut7l69E2PvyG4et
 A9Tc6i6XiGGxoeeZJRtbRF9r5LK8/bzWIBkyyNckQKf6B42khbmyepIwc
 SA4HV3DX4fS7wfbT/JASOk2dmvhI9/eELfSzZMEDNF5mAM0RMoVf4Vxzl
 taTL23iiWzG8JuxoKTM08/LWwUxeHlpuhCW0m5JGBQu/nKfO236TLu2zp
 feKItIRrh2riuO8/pthbxT/OIvdN09mHm+bhZOah6vnrr1AViwVUvbEpJ
 lFdkSGDMltedVj54euBiN7jYrysq/HrRHoYidB/edXneZBkfuOWkjn1SF A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="259673101"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="259673101"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:48:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="525914275"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:48:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [CI v2 08/12] drm/edid: use EDID block read helper in
 drm_do_get_edid()
Date: Mon, 11 Apr 2022 12:47:29 +0300
Message-Id: <20668eb713be7d48dd6c297a9513a1a9d7d64c3d.1649670305.git.jani.nikula@intel.com>
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

Convert drm_do_get_edit() from the base block read helper to the generic
block read helper. There's quite a bit going on here, as the corrupt and
null EDID information is moved back to the caller. As we see, they were
not all that clear to begin with, and this change underlines that.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 62 ++++++++++++++------------------------
 1 file changed, 23 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 58be9be72dde..359d3d6f216e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2076,44 +2076,6 @@ static enum edid_block_status edid_block_read(void *block, unsigned int block_nu
 	return status;
 }
 
-static struct edid *drm_do_get_edid_base_block(struct drm_connector *connector,
-					       read_block_fn read_block,
-					       void *context)
-{
-	int *null_edid_counter = connector ? &connector->null_edid_counter : NULL;
-	bool *edid_corrupt = connector ? &connector->edid_corrupt : NULL;
-	void *edid;
-	int try;
-
-	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
-	if (edid == NULL)
-		return NULL;
-
-	/* base block fetch */
-	for (try = 0; try < 4; try++) {
-		if (read_block(context, edid, 0, EDID_LENGTH))
-			goto out;
-		if (drm_edid_block_valid(edid, 0, false, edid_corrupt))
-			break;
-		if (try == 0 && edid_block_is_zero(edid)) {
-			if (null_edid_counter)
-				(*null_edid_counter)++;
-			goto carp;
-		}
-	}
-	if (try == 4)
-		goto carp;
-
-	return edid;
-
-carp:
-	if (connector)
-		connector_bad_edid(connector, edid, 1);
-out:
-	kfree(edid);
-	return NULL;
-}
-
 /**
  * drm_do_get_edid - get EDID data using a custom EDID block read function
  * @connector: connector we're probing
@@ -2138,6 +2100,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 			     read_block_fn read_block,
 			     void *context)
 {
+	enum edid_block_status status;
 	int j, invalid_blocks = 0;
 	struct edid *edid, *new, *override;
 
@@ -2145,10 +2108,31 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	if (override)
 		return override;
 
-	edid = drm_do_get_edid_base_block(connector, read_block, context);
+	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
 	if (!edid)
 		return NULL;
 
+	status = edid_block_read(edid, 0, read_block, context);
+
+	edid_block_status_print(status, edid, 0);
+
+	if (status == EDID_BLOCK_READ_FAIL)
+		goto out;
+
+	/* FIXME: Clarify what a corrupt EDID actually means. */
+	if (status == EDID_BLOCK_OK || status == EDID_BLOCK_VERSION)
+		connector->edid_corrupt = false;
+	else
+		connector->edid_corrupt = true;
+
+	if (!edid_block_status_valid(status, edid_block_tag(edid))) {
+		if (status == EDID_BLOCK_ZERO)
+			connector->null_edid_counter++;
+
+		connector_bad_edid(connector, edid, 1);
+		goto out;
+	}
+
 	if (edid->extensions == 0)
 		return edid;
 
-- 
2.30.2

