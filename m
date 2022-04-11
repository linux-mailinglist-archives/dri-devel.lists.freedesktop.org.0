Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8094FBE18
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 16:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FCF10F6BA;
	Mon, 11 Apr 2022 14:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6476710F299;
 Mon, 11 Apr 2022 14:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649685677; x=1681221677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gPIxVTiGwHoeGkk2/a0ECjEgMc8DFOtTzwOWtwrWB/o=;
 b=FFZdGAASks6Ybi046lNYYxGp5sq4nCq7CkO7wuhMfFRb4HNAoqZC3O6g
 aXS4XxXIUbvIWQ01MfhLLMy2U7a6OWdJGTKdoT15bZrSoC5Gjn/61OCDm
 w27/egojMH/lVl1EfuZtWq85xcknEiP3+HYgtyXFdBVhDwmNm3t0LS5yp
 fyk8oOqtblCIGFz0SxdRb8oc4LjH6+JWffyoVLhWGkQj/OOn7ze9W07iq
 Xp2dtXB9zC6z2DMdcP8G866PmIMRDcNHQBd1GyqAWC/jT+GDMPYxpm5y2
 I3lyZ8Qmn87xf39ayVERGdp7WWEJyJv6wwcshf6a88tlqVIkGyMHiGGxT w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="261866171"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="261866171"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 07:01:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="525987583"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 07:01:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [CI v3 07/12] drm/edid: abstract an EDID block read helper
Date: Mon, 11 Apr 2022 17:00:30 +0300
Message-Id: <47560f7530e4a7b32b56cb9038178244fe30a4af.1649685475.git.jani.nikula@intel.com>
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

We have an abstraction for the EDID base block read, yet duplicating the
retries and error handling for extension block reads. Introduce a more
generic EDID block read helper.

Switch to the helper piecemeal, starting with drm_edid_get_panel_id(),
which doesn't need or have access to the connector anyway.

The subtle change is switching from drm_edid_block_valid() to
edid_block_check(). We also status print once, not for every attempt.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 58 +++++++++++++++++++++++++++++++++-----
 1 file changed, 51 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 5b450bad018e..58be9be72dde 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1670,6 +1670,7 @@ EXPORT_SYMBOL(drm_edid_are_equal);
 
 enum edid_block_status {
 	EDID_BLOCK_OK = 0,
+	EDID_BLOCK_READ_FAIL,
 	EDID_BLOCK_NULL,
 	EDID_BLOCK_ZERO,
 	EDID_BLOCK_HEADER_CORRUPT,
@@ -1736,6 +1737,9 @@ static void edid_block_status_print(enum edid_block_status status,
 	switch (status) {
 	case EDID_BLOCK_OK:
 		break;
+	case EDID_BLOCK_READ_FAIL:
+		pr_debug("EDID block %d read failed\n", block_num);
+		break;
 	case EDID_BLOCK_NULL:
 		pr_debug("EDID block %d pointer is NULL\n", block_num);
 		break;
@@ -2039,6 +2043,39 @@ EXPORT_SYMBOL(drm_add_override_edid_modes);
 
 typedef int read_block_fn(void *context, u8 *buf, unsigned int block, size_t len);
 
+static enum edid_block_status edid_block_read(void *block, unsigned int block_num,
+					      read_block_fn read_block,
+					      void *context)
+{
+	enum edid_block_status status;
+	bool is_base_block = block_num == 0;
+	int try;
+
+	for (try = 0; try < 4; try++) {
+		if (read_block(context, block, block_num, EDID_LENGTH))
+			return EDID_BLOCK_READ_FAIL;
+
+		status = edid_block_check(block, is_base_block);
+		if (status == EDID_BLOCK_HEADER_REPAIR) {
+			edid_header_fix(block);
+
+			/* Retry with fixed header, update status if that worked. */
+			status = edid_block_check(block, is_base_block);
+			if (status == EDID_BLOCK_OK)
+				status = EDID_BLOCK_HEADER_FIXED;
+		}
+
+		if (edid_block_status_valid(status, edid_block_tag(block)))
+			break;
+
+		/* Fail early for unrepairable base block all zeros. */
+		if (try == 0 && is_base_block && status == EDID_BLOCK_ZERO)
+			break;
+	}
+
+	return status;
+}
+
 static struct edid *drm_do_get_edid_base_block(struct drm_connector *connector,
 					       read_block_fn read_block,
 					       void *context)
@@ -2237,20 +2274,27 @@ static u32 edid_extract_panel_id(const struct edid *edid)
 
 u32 drm_edid_get_panel_id(struct i2c_adapter *adapter)
 {
-	const struct edid *edid;
-	u32 panel_id;
-
-	edid = drm_do_get_edid_base_block(NULL, drm_do_probe_ddc_edid, adapter);
+	enum edid_block_status status;
+	void *base_block;
+	u32 panel_id = 0;
 
 	/*
 	 * There are no manufacturer IDs of 0, so if there is a problem reading
 	 * the EDID then we'll just return 0.
 	 */
-	if (!edid)
+
+	base_block = kmalloc(EDID_LENGTH, GFP_KERNEL);
+	if (!base_block)
 		return 0;
 
-	panel_id = edid_extract_panel_id(edid);
-	kfree(edid);
+	status = edid_block_read(base_block, 0, drm_do_probe_ddc_edid, adapter);
+
+	edid_block_status_print(status, base_block, 0);
+
+	if (edid_block_status_valid(status, edid_block_tag(base_block)))
+		panel_id = edid_extract_panel_id(base_block);
+
+	kfree(base_block);
 
 	return panel_id;
 }
-- 
2.30.2

