Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C99385FB3C8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 15:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCE110E809;
	Tue, 11 Oct 2022 13:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D14D10E809;
 Tue, 11 Oct 2022 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665496234; x=1697032234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CSiJmwl63Ve17x9WidN07hNQfl3YX3ZtwWvfyRaP5YE=;
 b=GCAPqosT2yT+Nl1jFKFWpciOYFzT9Lkx06jdNNeABjTezNk7gHKjjbrb
 luxBpnC0oEJaVSgRluhyVKxc0+YQ8G5ldfN0Ne0UnhkA1L6wNmU3e6h+V
 ioJ/99x0jrdFUzJA2rTz744h0fvLGHPhtrXPdqaSYvOyW5I2wsAPDeqEo
 6IubZfvx3A7XTM+JK3JzosW1e8RO6iirJ+VaepBNNn7EGS1tbz9w35D9d
 Pgqmlk/xc/8KZ+JzGMKcpGiPBL9eLwdgTsCpxWdWCyTPR0BU3+HxUkFOG
 LmS5Ve7F+0KxS4bCpKa30UHdBI28dTHvGqJ/P+HpEq6y+DX+9AK6k4qy9 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="306130199"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="306130199"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:32 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="626363869"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="626363869"
Received: from milawils-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/15] drm/edid: add function for checking drm_edid validity
Date: Tue, 11 Oct 2022 16:49:42 +0300
Message-Id: <1f11b4e6e91d526fb3646d7987be7148da3f7b47.1665496046.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1665496046.git.jani.nikula@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
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

We've lacked a function for immutable validity check on drm_edid. Add
one.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 30 ++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     |  1 +
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 616c1cdc7507..c3cf942186b7 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2040,6 +2040,36 @@ bool drm_edid_is_valid(struct edid *edid)
 }
 EXPORT_SYMBOL(drm_edid_is_valid);
 
+/**
+ * drm_edid_valid - sanity check EDID data
+ * @drm_edid: EDID data
+ *
+ * Sanity check an EDID. Cross check block count against allocated size and
+ * checksum the blocks.
+ *
+ * Return: True if the EDID data is valid, false otherwise.
+ */
+bool drm_edid_valid(const struct drm_edid *drm_edid)
+{
+	int i;
+
+	if (!drm_edid)
+		return false;
+
+	if (edid_size_by_blocks(__drm_edid_block_count(drm_edid)) != drm_edid->size)
+		return false;
+
+	for (i = 0; i < drm_edid_block_count(drm_edid); i++) {
+		const void *block = drm_edid_block_data(drm_edid, i);
+
+		if (!edid_block_valid(block, i == 0))
+			return false;
+	}
+
+	return true;
+}
+EXPORT_SYMBOL(drm_edid_valid);
+
 static struct edid *edid_filter_invalid_blocks(struct edid *edid,
 					       size_t *alloc_size)
 {
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 05380681a4fb..a2e25e7e6ee5 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -606,6 +606,7 @@ drm_display_mode_from_cea_vic(struct drm_device *dev,
 const struct drm_edid *drm_edid_alloc(const void *edid, size_t size);
 const struct drm_edid *drm_edid_dup(const struct drm_edid *drm_edid);
 void drm_edid_free(const struct drm_edid *drm_edid);
+bool drm_edid_valid(const struct drm_edid *drm_edid);
 const struct edid *drm_edid_raw(const struct drm_edid *drm_edid);
 const struct drm_edid *drm_edid_read(struct drm_connector *connector);
 const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
-- 
2.34.1

