Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F984EB391
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 20:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A87710E8A7;
	Tue, 29 Mar 2022 18:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA29410E8A7;
 Tue, 29 Mar 2022 18:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648579398; x=1680115398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CWMsp6PMtY3HPqRPU8nhVENH4x5YiXre/xgjmr31Nbo=;
 b=fLSi3hdWowZDVjJ8yuto9GTegJIBxCb99/0Ua1ys1e2w7/cbJmX7yWie
 3rLM1j+wgryak5cs3AqEy9L+0yebJ7RNBRT0raPpPGSPDiTnE/fI/YCVU
 TlrOgqcZ9/EntPCu6X42weGR9NBQk35xgu0i3sYEapbw8gEfZwvCUulX6
 yNDWLH0vdBByV2QbIo/T1Omnt1m3RDCqM8XJpgothiIDlKuexIPoFCrze
 63QlNthZ9lAY39zm0s2S9zvREHyR8hdLXjR03SMX21c8taM3SGhjChYXe
 LWsiGR88t0J2Yz885swiIWs73CYqe+r8WqDgkYo4W2oGDLbZmYyLNaccP g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="322518379"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="322518379"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:43:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="585694743"
Received: from dmendyk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.121])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:43:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/12] drm/edid: track invalid blocks in drm_do_get_edid()
Date: Tue, 29 Mar 2022 21:42:18 +0300
Message-Id: <f1eba5ee868d29f522dd9c8215328a1aa7b84b74.1648578814.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648578814.git.jani.nikula@intel.com>
References: <cover.1648578814.git.jani.nikula@intel.com>
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

Track invalid blocks instead of valid extensions to minimize impact on
the happy day scenario, and hide the details in the separate function.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index dee95332d7e1..d0a76781ed19 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1822,9 +1822,10 @@ bool drm_edid_is_valid(struct edid *edid)
 EXPORT_SYMBOL(drm_edid_is_valid);
 
 static struct edid *edid_filter_invalid_blocks(const struct edid *edid,
-					       int valid_extensions)
+					       int invalid_blocks)
 {
 	struct edid *new, *base;
+	int valid_extensions = edid->extensions - invalid_blocks;
 	int i;
 
 	new = kmalloc_array(valid_extensions + 1, EDID_LENGTH, GFP_KERNEL);
@@ -2060,7 +2061,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 			      size_t len),
 	void *data)
 {
-	int j, valid_extensions = 0;
+	int j, invalid_blocks = 0;
 	struct edid *edid, *new, *override;
 
 	override = drm_get_override_edid(connector);
@@ -2071,12 +2072,10 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	if (!edid)
 		return NULL;
 
-	/* if there's no extensions or no connector, we're done */
-	valid_extensions = edid->extensions;
-	if (valid_extensions == 0)
+	if (edid->extensions == 0)
 		return edid;
 
-	new = krealloc(edid, (valid_extensions + 1) * EDID_LENGTH, GFP_KERNEL);
+	new = krealloc(edid, (edid->extensions + 1) * EDID_LENGTH, GFP_KERNEL);
 	if (!new)
 		goto out;
 	edid = new;
@@ -2093,13 +2092,13 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 		}
 
 		if (try == 4)
-			valid_extensions--;
+			invalid_blocks++;
 	}
 
-	if (valid_extensions != edid->extensions) {
+	if (invalid_blocks) {
 		connector_bad_edid(connector, (u8 *)edid, edid->extensions + 1);
 
-		edid = edid_filter_invalid_blocks(edid, valid_extensions);
+		edid = edid_filter_invalid_blocks(edid, invalid_blocks);
 	}
 
 	return edid;
-- 
2.30.2

