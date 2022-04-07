Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CE84F7B52
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B923310E7CD;
	Thu,  7 Apr 2022 09:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E2710E4A1;
 Thu,  7 Apr 2022 09:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649322928; x=1680858928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zjq4m8ktl35THTgYx3jFnjZtAOYdlwXz42yAjO7fNd8=;
 b=dSpYPzvIEdLjMoaW3XI0OzU9AlBklvVvEolG5mN0FrAzqHoSIqEs1E5q
 J430xf8PU+PuhRD8vMMj9O1d5FuV/ONDMVKUvyNrrPk4YilLtRzK8G+cD
 IjpCRXX9z7Nr/9yNhp0gzVGoS7kfO/Hdb5TUZnYWNSgU/bM2Pr/E/P0RB
 Wvmi0FPfA3HkYlOwqf6y8CsyPpJPQqjVXJjNMb66WAd3EP8JmjDY0qUUr
 bgfiZt4+oSJ2FZxjUEyxts3D9d2IB7nqihGrawjYZQtVezIvA32tXW2U9
 hrQNdEfavY4MP1jBgoHIWt0qfl54+3ngRq16scOufdO/RIlIUDiDFhmTO A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="258863883"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="258863883"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 02:15:28 -0700
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="524292488"
Received: from kgibala-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.142.48])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 02:15:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/12] drm/edid: use EDID block read helper in
 drm_do_get_edid()
Date: Thu,  7 Apr 2022 12:14:34 +0300
Message-Id: <05f4f103cda02565c913435e0a2d7bffeca82d44.1649322799.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649322799.git.jani.nikula@intel.com>
References: <cover.1649322799.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert drm_do_get_edit() from the base block read helper to the generic
block read helper. There's quite a bit going on here, as the corrupt and
null EDID information is moved back to the caller. As we see, they were
not all that clear to begin with, and this change underlines that.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 62 ++++++++++++++------------------------
 1 file changed, 23 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 162f0a959376..bffb8a599cda 100644
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

