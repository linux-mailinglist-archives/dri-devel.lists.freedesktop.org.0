Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 910514FBE0F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 16:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016BE10F285;
	Mon, 11 Apr 2022 14:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A41710F281;
 Mon, 11 Apr 2022 14:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649685663; x=1681221663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U2HYEl9bv7sv51IVHuvFJdKHUkR5uVLHIJV8jKO3kg8=;
 b=fhIyhmZIYcTNzDMC6sGtgJpiiXM2qaH2zzMsUknMsbFSKf03TdYP0r00
 Kx4FX8Mfk0wM3HbG0FcVSE8ao7tETeqfmDYtGEsiDmXRaErpil+cUZv/Y
 G7rvDiGaR32PImF58cb8j4taCf0bQWnmipYKTNU8ZdHs1K6Wx2Xe0XrAx
 DnJMi+gncWNjF8ZNoMKJg1jTdoVkBrX6ppAOoO5kfMTNNNrdyEbiy+Mws
 FgjGg7/cAfmu5RU0Zwu9WV+NrRhBW2gNtWaJ9bmL9/b9Bvaaqfv2O4ZLa
 Naa04h5lgPZ8TUvg9rEGRUfnXfdSNr0aeLIu3m64Y4fn0awwS01NaZvhM w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="322565585"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="322565585"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 07:01:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="723980025"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 07:01:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [CI v3 04/12] drm/edid: add a helper to log dump an EDID block
Date: Mon, 11 Apr 2022 17:00:27 +0300
Message-Id: <b56f120a26f54b0defc43faa6d49e26f072d4d8f.1649685475.git.jani.nikula@intel.com>
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

Unify debug log dumping. There's duplication in the error paths for EDID
block validity checks, but this should be neglible.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 88e8f906a229..0b8098e34236 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1773,6 +1773,23 @@ static void edid_block_status_print(enum edid_block_status status,
 	}
 }
 
+static void edid_block_dump(const char *level, const void *block, int block_num)
+{
+	enum edid_block_status status;
+	char prefix[20];
+
+	status = edid_block_check(block, block_num == 0);
+	if (status == EDID_BLOCK_ZERO)
+		sprintf(prefix, "\t[%02x] ZERO ", block_num);
+	else if (!edid_block_status_valid(status, edid_block_tag(block)))
+		sprintf(prefix, "\t[%02x] BAD  ", block_num);
+	else
+		sprintf(prefix, "\t[%02x] GOOD ", block_num);
+
+	print_hex_dump(level, prefix, DUMP_PREFIX_NONE, 16, 1,
+		       block, EDID_LENGTH, false);
+}
+
 /**
  * drm_edid_block_valid - Sanity check the EDID block (base or extension)
  * @raw_edid: pointer to raw EDID block
@@ -1826,9 +1843,7 @@ bool drm_edid_block_valid(u8 *_block, int block_num, bool print_bad_edid,
 
 	if (!valid && print_bad_edid && status != EDID_BLOCK_ZERO) {
 		pr_notice("Raw EDID:\n");
-		print_hex_dump(KERN_NOTICE,
-			       " \t", DUMP_PREFIX_NONE, 16, 1,
-			       block, EDID_LENGTH, false);
+		edid_block_dump(KERN_NOTICE, block, block_num);
 	}
 
 	return valid;
@@ -1976,18 +1991,8 @@ static void connector_bad_edid(struct drm_connector *connector,
 	drm_dbg_kms(connector->dev, "%s: EDID is invalid:\n", connector->name);
 	for (i = 0; i < num_blocks; i++) {
 		u8 *block = edid + i * EDID_LENGTH;
-		char prefix[20];
-
-		if (edid_block_is_zero(block))
-			sprintf(prefix, "\t[%02x] ZERO ", i);
-		else if (!drm_edid_block_valid(block, i, false, NULL))
-			sprintf(prefix, "\t[%02x] BAD  ", i);
-		else
-			sprintf(prefix, "\t[%02x] GOOD ", i);
 
-		print_hex_dump(KERN_DEBUG,
-			       prefix, DUMP_PREFIX_NONE, 16, 1,
-			       block, EDID_LENGTH, false);
+		edid_block_dump(KERN_DEBUG, block, i);
 	}
 }
 
-- 
2.30.2

