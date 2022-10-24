Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D7D60A65A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 14:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD74910E4D8;
	Mon, 24 Oct 2022 12:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C175310E4C5;
 Mon, 24 Oct 2022 12:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666614863; x=1698150863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ls/lWODBhwwzZPFbIwJVX5X70cuHXnQOnnSNBD1GVXw=;
 b=U8ysNyMUO7C3VcNjvlG8ST8eLeeFJKcgr7a2spSsIgXKHETmn6H1XTI0
 UBtSjpjI7rfsV9CDZT6E6ZuYWWoUQrnwZXCVpyjDljfbtLn5A1ihMTT+N
 Y6whnowyzE7X/rd8NxFhJdfxO/CSP63qAPKOXAhyfBCnYKl9lIghyy4nt
 Ksm4V08FVBOZ5a3nskBl56pvewcdgHn8ii9YYHolLgRPy0QrZhPjg3xLZ
 w1YlBCP0dxNnEik0Kr2/Oyr2pI/NbhP9E/VqCGwjijWjDk3l1RkURecva
 Qdi4kbmcDvyJq5fudN07eQkgNlsK7ZHFp4Gj/CKyC0AQUqYVyB+HxhHJC Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="287801314"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="287801314"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:23 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="626055696"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="626055696"
Received: from emontau-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.221])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/16] drm/edid: split drm_edid block count helper
Date: Mon, 24 Oct 2022 15:33:35 +0300
Message-Id: <a7d63878c7fb3dd6f3b987f5257897113797b94f.1666614699.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666614699.git.jani.nikula@intel.com>
References: <cover.1666614699.git.jani.nikula@intel.com>
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

Split the drm_edid block count helper to a base version that reports the
block count indicated by EDID contents, and another on top that limits
the block count based on size allocated for the EDID.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 8baa46dc2537..616c1cdc7507 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1613,7 +1613,8 @@ static const void *edid_extension_block_data(const struct edid *edid, int index)
 	return edid_block_data(edid, index + 1);
 }
 
-static int drm_edid_block_count(const struct drm_edid *drm_edid)
+/* EDID block count indicated in EDID, may exceed allocated size */
+static int __drm_edid_block_count(const struct drm_edid *drm_edid)
 {
 	int num_blocks;
 
@@ -1633,12 +1634,18 @@ static int drm_edid_block_count(const struct drm_edid *drm_edid)
 			num_blocks = eeodb;
 	}
 
-	/* Limit by allocated size */
-	num_blocks = min(num_blocks, (int)drm_edid->size / EDID_LENGTH);
-
 	return num_blocks;
 }
 
+/* EDID block count, limited by allocated size */
+static int drm_edid_block_count(const struct drm_edid *drm_edid)
+{
+	/* Limit by allocated size */
+	return min(__drm_edid_block_count(drm_edid),
+		   (int)drm_edid->size / EDID_LENGTH);
+}
+
+/* EDID extension block count, limited by allocated size */
 static int drm_edid_extension_block_count(const struct drm_edid *drm_edid)
 {
 	return drm_edid_block_count(drm_edid) - 1;
-- 
2.34.1

