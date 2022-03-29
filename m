Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8E84EB37E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 20:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D08D10E4F2;
	Tue, 29 Mar 2022 18:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5B610E4F2;
 Tue, 29 Mar 2022 18:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648579350; x=1680115350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IawFGzewoI/wgYchdAT6tBttnoSfwlgiLKIghzsbea8=;
 b=m6Q55Iw7hvogDIf1LCJ0QINSxRTOSv4bV41Viv8yO5Z7Cgd5apBQN9za
 HDUWJNDBGPK5xLAKa9G/URACL8JouW3JW4kOPIqjPEV965eDyB4Y9ShL0
 fS2bydJB5k841TMzXvP26zybwc0HSmprGDq2+esYrBl/D2bLxuTjiRmZn
 VFb6xnVNC4l1b+J1vx2QDmz7mgnUjT8y4wdQRtcfW4dX5+BMkjwntJlTa
 BrzeNP2Ujwj5Ve2qj8b/pwUGvGEPu20unwYJCj7f5zFZ0vAPQoHPPy39K
 HHC++NeDLFgDVdBx6EscWL8VAm/XEhnWA731BMM3qyRhRmHjlsW0cfLxG Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="246827978"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="246827978"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:42:30 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="564858652"
Received: from dmendyk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.121])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:42:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/12] drm/edid: use struct edid * in drm_do_get_edid()
Date: Tue, 29 Mar 2022 21:42:08 +0300
Message-Id: <380b903fb91b1e20a1a7af61db40b6c7c5617005.1648578814.git.jani.nikula@intel.com>
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

Mixing u8 * and struct edid * is confusing, switch to the latter.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index d79b06f7f34c..0650b9217aa2 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1991,29 +1991,28 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	void *data)
 {
 	int i, j = 0, valid_extensions = 0;
-	u8 *edid, *new;
-	struct edid *override;
+	struct edid *edid, *new, *override;
 
 	override = drm_get_override_edid(connector);
 	if (override)
 		return override;
 
-	edid = (u8 *)drm_do_get_edid_base_block(connector, get_edid_block, data);
+	edid = drm_do_get_edid_base_block(connector, get_edid_block, data);
 	if (!edid)
 		return NULL;
 
 	/* if there's no extensions or no connector, we're done */
-	valid_extensions = edid[0x7e];
+	valid_extensions = edid->extensions;
 	if (valid_extensions == 0)
-		return (struct edid *)edid;
+		return edid;
 
 	new = krealloc(edid, (valid_extensions + 1) * EDID_LENGTH, GFP_KERNEL);
 	if (!new)
 		goto out;
 	edid = new;
 
-	for (j = 1; j <= edid[0x7e]; j++) {
-		u8 *block = edid + j * EDID_LENGTH;
+	for (j = 1; j <= edid->extensions; j++) {
+		void *block = edid + j;
 
 		for (i = 0; i < 4; i++) {
 			if (get_edid_block(data, block, j, EDID_LENGTH))
@@ -2026,13 +2025,13 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 			valid_extensions--;
 	}
 
-	if (valid_extensions != edid[0x7e]) {
-		u8 *base;
+	if (valid_extensions != edid->extensions) {
+		struct edid *base;
 
-		connector_bad_edid(connector, edid, edid[0x7e] + 1);
+		connector_bad_edid(connector, (u8 *)edid, edid->extensions + 1);
 
-		edid[EDID_LENGTH-1] += edid[0x7e] - valid_extensions;
-		edid[0x7e] = valid_extensions;
+		edid->checksum += edid->extensions - valid_extensions;
+		edid->extensions = valid_extensions;
 
 		new = kmalloc_array(valid_extensions + 1, EDID_LENGTH,
 				    GFP_KERNEL);
@@ -2040,21 +2039,21 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 			goto out;
 
 		base = new;
-		for (i = 0; i <= edid[0x7e]; i++) {
-			u8 *block = edid + i * EDID_LENGTH;
+		for (i = 0; i <= edid->extensions; i++) {
+			void *block = edid + i;
 
 			if (!drm_edid_block_valid(block, i, false, NULL))
 				continue;
 
 			memcpy(base, block, EDID_LENGTH);
-			base += EDID_LENGTH;
+			base++;
 		}
 
 		kfree(edid);
 		edid = new;
 	}
 
-	return (struct edid *)edid;
+	return edid;
 
 out:
 	kfree(edid);
-- 
2.30.2

