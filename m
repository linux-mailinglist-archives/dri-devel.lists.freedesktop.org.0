Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 876944FB808
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 11:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C4B10F9EC;
	Mon, 11 Apr 2022 09:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23ED10F9EC;
 Mon, 11 Apr 2022 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649670476; x=1681206476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J291T5B0/vg+PlwHYdwNEhO3zaCOD4WT+HRAmm3cbTo=;
 b=WJokJFxCAf5OQ0UYwAGnNYhyoUv4ziG+1t4hz3YTZe3UR+hYcSBnXSwF
 6B5qZn5Zy5Y8thWzUO9k25TrNhhG2FoDJnah5x537oZkccyjIGmTiNnpr
 NkXBjS10vJZscYpgGDNS/JlkqJa6T/cFNuiGvsvTm4uZ00ksnmSlnEnZO
 EKaurmbMrQVhO1n89W3gBviWVnz6063h+o8STnVv8JDkpvCflEZ2YVxPa
 +9ICuriOXwPIClh8BLZhbLn0f4FhjmvnQ1/C8iHv41w3GbFk0S8c4rVJK
 r6zOsMdhjBT2DYbtcMgXxQgwdc916PVu8CIgvK7Yz0AqVS1CnJ/NsHnx0 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="261822321"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="261822321"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:47:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="507045541"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:47:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [CI v2 03/12] drm/edid: refactor EDID block status printing
Date: Mon, 11 Apr 2022 12:47:24 +0300
Message-Id: <8b2422d85c69b55dd60374bb32d16dcc259bea5e.1649670305.git.jani.nikula@intel.com>
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

Split out a function to log EDID block status. The printouts get changed
slightly.

Unfortunately, not all users will have struct drm_device available, so
we convert to pr_* debug logging instead of drm device based logging.

v2: Complain more loudly about unknown status codes (Ville)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 75 ++++++++++++++++++++++++++------------
 1 file changed, 51 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f062d1715ec3..88e8f906a229 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1729,6 +1729,50 @@ static bool edid_block_valid(const void *block, bool base)
 				       edid_block_tag(block));
 }
 
+static void edid_block_status_print(enum edid_block_status status,
+				    const struct edid *block,
+				    int block_num)
+{
+	switch (status) {
+	case EDID_BLOCK_OK:
+		break;
+	case EDID_BLOCK_NULL:
+		pr_debug("EDID block %d pointer is NULL\n", block_num);
+		break;
+	case EDID_BLOCK_ZERO:
+		pr_notice("EDID block %d is all zeroes\n", block_num);
+		break;
+	case EDID_BLOCK_HEADER_CORRUPT:
+		pr_notice("EDID has corrupt header\n");
+		break;
+	case EDID_BLOCK_HEADER_REPAIR:
+		pr_debug("EDID corrupt header needs repair\n");
+		break;
+	case EDID_BLOCK_HEADER_FIXED:
+		pr_debug("EDID corrupt header fixed\n");
+		break;
+	case EDID_BLOCK_CHECKSUM:
+		if (edid_block_status_valid(status, edid_block_tag(block))) {
+			pr_debug("EDID block %d (tag 0x%02x) checksum is invalid, remainder is %d, ignoring\n",
+				 block_num, edid_block_tag(block),
+				 edid_block_compute_checksum(block));
+		} else {
+			pr_notice("EDID block %d (tag 0x%02x) checksum is invalid, remainder is %d\n",
+				  block_num, edid_block_tag(block),
+				  edid_block_compute_checksum(block));
+		}
+		break;
+	case EDID_BLOCK_VERSION:
+		pr_notice("EDID has major version %d, instead of 1\n",
+			  block->version);
+		break;
+	default:
+		WARN(1, "EDID block %d unknown edid block status code %d\n",
+		     block_num, status);
+		break;
+	}
+}
+
 /**
  * drm_edid_block_valid - Sanity check the EDID block (base or extension)
  * @raw_edid: pointer to raw EDID block
@@ -1775,33 +1819,16 @@ bool drm_edid_block_valid(u8 *_block, int block_num, bool print_bad_edid,
 			*edid_corrupt = true;
 	}
 
+	edid_block_status_print(status, block, block_num);
+
 	/* Determine whether we can use this block with this status. */
 	valid = edid_block_status_valid(status, edid_block_tag(block));
 
-	/* Some fairly random status printouts. */
-	if (status == EDID_BLOCK_CHECKSUM) {
-		if (valid) {
-			DRM_DEBUG("EDID block checksum is invalid, remainder is %d\n",
-				  edid_block_compute_checksum(block));
-			DRM_DEBUG("Assuming a KVM switch modified the block but left the original checksum\n");
-		} else if (print_bad_edid) {
-			DRM_NOTE("EDID block checksum is invalid, remainder is %d\n",
-				 edid_block_compute_checksum(block));
-		}
-	} else if (status == EDID_BLOCK_VERSION) {
-		DRM_NOTE("EDID has major version %d, instead of 1\n",
-			 block->version);
-	}
-
-	if (!valid && print_bad_edid) {
-		if (status == EDID_BLOCK_ZERO) {
-			pr_notice("EDID block is all zeroes\n");
-		} else {
-			pr_notice("Raw EDID:\n");
-			print_hex_dump(KERN_NOTICE,
-				       " \t", DUMP_PREFIX_NONE, 16, 1,
-				       block, EDID_LENGTH, false);
-		}
+	if (!valid && print_bad_edid && status != EDID_BLOCK_ZERO) {
+		pr_notice("Raw EDID:\n");
+		print_hex_dump(KERN_NOTICE,
+			       " \t", DUMP_PREFIX_NONE, 16, 1,
+			       block, EDID_LENGTH, false);
 	}
 
 	return valid;
-- 
2.30.2

