Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 808244EE0DC
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 20:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B64E10F459;
	Thu, 31 Mar 2022 18:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7944F10F459;
 Thu, 31 Mar 2022 18:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648752319; x=1680288319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qxnV0KoqtLLqbpNFSzQsn2wPalVagmirZ25nNYl3gbU=;
 b=D7GYa2inm/cTYRJPghKYZhgNBmQ5K9CIL/Rn5SKpNRNoBwTa8lHt7WfZ
 bTT3+v7Y5WXDE82Y2nHdXRKiIdKF+o08zAUwcJwXY03utlWnpzyNFtGPy
 X3rIHD24H1TgOQV5HB3UrtWDON2HU555YQrBWLv5X+Emo5J+kEpKfk4Hm
 hKhVeymvOt3gatsn45X/LKAh2AyPUrpAXUOgXU6H/37JK7CiHf0gzGHRe
 Tm9jd+djy0MkCvaC9+KLj1stHQ9xCvu9xG1ww8nimq0PlLFuvrx/egHke
 jqM/Nogz5iWP7Pt4Ue0eahvkMio3mkZfT8UX2KI91KbJ9IY80oK57nQNk g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="239847784"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="239847784"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:45:18 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="566724921"
Received: from gluca-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.194])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:45:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/12] drm/edid: use struct edid * in drm_do_get_edid()
Date: Thu, 31 Mar 2022 21:44:58 +0300
Message-Id: <18bf820c1d20e616076b3275627e7ebf01bce7a3.1648752228.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648752228.git.jani.nikula@intel.com>
References: <cover.1648752228.git.jani.nikula@intel.com>
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

v2:
- Rebase on the invalid block filtering fix
- Rename struct edid *base to *dest_block for clarity (Ville)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 8829120470ab..5c7065561d4c 100644
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
@@ -2026,35 +2025,35 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 			valid_extensions--;
 	}
 
-	if (valid_extensions != edid[0x7e]) {
-		u8 *base;
+	if (valid_extensions != edid->extensions) {
+		struct edid *dest_block;
 
-		connector_bad_edid(connector, edid, edid[0x7e] + 1);
+		connector_bad_edid(connector, (u8 *)edid, edid->extensions + 1);
 
 		new = kmalloc_array(valid_extensions + 1, EDID_LENGTH,
 				    GFP_KERNEL);
 		if (!new)
 			goto out;
 
-		base = new;
-		for (i = 0; i <= edid[0x7e]; i++) {
-			u8 *block = edid + i * EDID_LENGTH;
+		dest_block = new;
+		for (i = 0; i <= edid->extensions; i++) {
+			void *block = edid + i;
 
 			if (!drm_edid_block_valid(block, i, false, NULL))
 				continue;
 
-			memcpy(base, block, EDID_LENGTH);
-			base += EDID_LENGTH;
+			memcpy(dest_block, block, EDID_LENGTH);
+			dest_block++;
 		}
 
-		new[EDID_LENGTH - 1] += new[0x7e] - valid_extensions;
-		new[0x7e] = valid_extensions;
+		new->checksum += new->extensions - valid_extensions;
+		new->extensions = valid_extensions;
 
 		kfree(edid);
 		edid = new;
 	}
 
-	return (struct edid *)edid;
+	return edid;
 
 out:
 	kfree(edid);
-- 
2.30.2

