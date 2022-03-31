Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C111C4EE0FA
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 20:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A32F10F485;
	Thu, 31 Mar 2022 18:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B32E10F484;
 Thu, 31 Mar 2022 18:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648752372; x=1680288372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9mHjZBzFu+ZT78deVICwPRULZVVYzoQtUaNUQxZnSOQ=;
 b=JlvUa+wFzuZnGKDpvUXwdOnnkPewBzNbC/nJVN15tCALGhRtwNFCoQu6
 cH/vg5wVJHe7CrW9HAN6xhHr4DSLcXy4zH/IBQDx9biBWPOnOOs9RGiRf
 mWAhDn2UtwJs6oaZHxUtAjyep8HvWCV4OFT5PWsAYHuq4FKCJLomBsnni
 O/qnmePfSz4Fj8q+H/95LPz5qMg468EE4SAMyk9I5ucVInyFCRnrkno/W
 k6U1CkDR7TkG6uOzVq8fTJjnvmrLdFx7VYysxldhVoTKCxk56Mkxvyd1M
 EmMhvQmyL90uYsvDE8oSTJjmap7lfZL2RbmB/2XNTQg6JoVtgwmzmFcSh g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="257505587"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="257505587"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:45:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="654985245"
Received: from gluca-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.194])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:45:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/12] drm/edid: split out invalid block filtering to a
 separate function
Date: Thu, 31 Mar 2022 21:45:07 +0300
Message-Id: <ea8ccd654b5beca6ccf99666754aea09c836b6a5.1648752228.git.jani.nikula@intel.com>
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

It's such a special case there's no point in keeping it inline in the
happy day scenario, confusing matters.

v2: Rebase on the invalid block filtering fix

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 52 ++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 4803033d44fd..73bb2c4a7014 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1823,6 +1823,33 @@ bool drm_edid_is_valid(struct edid *edid)
 }
 EXPORT_SYMBOL(drm_edid_is_valid);
 
+static struct edid *edid_filter_invalid_blocks(const struct edid *edid,
+					       int valid_extensions)
+{
+	struct edid *new, *dest_block;
+	int i;
+
+	new = kmalloc_array(valid_extensions + 1, EDID_LENGTH, GFP_KERNEL);
+	if (!new)
+		goto out;
+
+	dest_block = new;
+	for (i = 0; i <= edid->extensions; i++) {
+		const void *block = edid + i;
+
+		if (edid_block_valid(block, i == 0))
+			memcpy(dest_block++, block, EDID_LENGTH);
+	}
+
+	new->checksum += new->extensions - valid_extensions;
+	new->extensions = valid_extensions;
+
+out:
+	kfree(edid);
+
+	return new;
+}
+
 #define DDC_SEGMENT_ADDR 0x30
 /**
  * drm_do_probe_ddc_edid() - get EDID information via I2C
@@ -2072,32 +2099,9 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	}
 
 	if (valid_extensions != edid->extensions) {
-		struct edid *dest_block;
-		int i;
-
 		connector_bad_edid(connector, (u8 *)edid, edid->extensions + 1);
 
-		new = kmalloc_array(valid_extensions + 1, EDID_LENGTH,
-				    GFP_KERNEL);
-		if (!new)
-			goto out;
-
-		dest_block = new;
-		for (i = 0; i <= edid->extensions; i++) {
-			void *block = edid + i;
-
-			if (!edid_block_valid(block, i == 0))
-				continue;
-
-			memcpy(dest_block, block, EDID_LENGTH);
-			dest_block++;
-		}
-
-		new->checksum += new->extensions - valid_extensions;
-		new->extensions = valid_extensions;
-
-		kfree(edid);
-		edid = new;
+		edid = edid_filter_invalid_blocks(edid, valid_extensions);
 	}
 
 	return edid;
-- 
2.30.2

