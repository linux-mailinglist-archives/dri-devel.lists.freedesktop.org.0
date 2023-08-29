Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B43478C909
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 17:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797BC10E3F2;
	Tue, 29 Aug 2023 15:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B6510E3EA;
 Tue, 29 Aug 2023 15:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324748; x=1724860748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DY7p5m0Mj5iFffaF3e2ykVgUwXzAxhI951ITRXu05p8=;
 b=e/nABQsKYlxp2j0MpOGKSiZU7cHDEmKGs+z+rfr1tnwODK/PlqLgY+ys
 1PPo0My4LGoZMqfmnQ1IGdo9ijE8SSOVorrS8axeK0cjDC1T1XJDBXgvp
 QK93YJ9v8FlWf+zytQJ/gSEwSswwUYJ8ZC2VFf2Wps1StYL4vZkKN2ddt
 GQZRzB3rXFvwHwLarK4Zu4MJ9bazFF14yVXCVVdLEd3rgFLvDpCSctVQ+
 8UkxV5wHxOFIVcU6iQuTvYKRIeNY1nEGSOlmRWjzABMQ3ksSHoilr6SA+
 hOiKBh7OAzBZaE6Tz9kpuvPEpREpurWxxZtFnEILJMobWo0kQ/pfDv9vK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769309"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769309"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555015"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555015"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:06 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 12/33] drm: Reset pipeline when user sends NULL blob
Date: Tue, 29 Aug 2023 21:34:01 +0530
Message-ID: <20230829160422.1251087-13-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
MIME-Version: 1.0
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

User can disable the color pipeline entirely, thereby
disabling all the color hardware blocks in the pipeline.

User should set NULL as the blob id and invoke SET_COLOR_PIPELINE
property. Driver will disable all the color hardware blocks by
updating respective blob id's as NULL.

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 50 +++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 20f9366865ca..259cd4f5f520 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -411,6 +411,53 @@ drm_atomic_replace_property_blob_from_id(struct drm_device *dev,
  * available at driver level, the driver should check for
  * the sanity of the userspace data.
  */
+static
+int drm_plane_reset_color_op_blobs(struct drm_plane *plane,
+				   struct drm_plane_state *state,
+				   bool *replaced)
+{
+	struct drm_device *dev = plane->dev;
+	int ret;
+	bool blob_replaced = false;
+	bool temp_replaced = false;
+
+	ret = drm_atomic_replace_property_blob_from_id(dev,
+						       &state->color.ctm,
+						       0, -1, -1,
+						       &blob_replaced);
+	temp_replaced |= blob_replaced;
+	if (ret)
+		goto out;
+
+	ret = drm_atomic_replace_property_blob_from_id(dev,
+						       &state->color.pre_csc_lut,
+						       0, -1, -1,
+						       &blob_replaced);
+	temp_replaced |= blob_replaced;
+
+	if (ret)
+		goto out;
+
+	ret = drm_atomic_replace_property_blob_from_id(dev,
+						       &state->color.post_csc_lut,
+						       0, -1, -1,
+						       &blob_replaced);
+	temp_replaced |= blob_replaced;
+
+	ret = drm_atomic_replace_property_blob_from_id(dev,
+						       &state->color.private_color_op_data,
+						       0, -1, -1,
+						       &blob_replaced);
+	temp_replaced |= blob_replaced;
+
+	if (ret)
+		goto out;
+out:
+	if (!ret)
+		*replaced |= temp_replaced;
+	return ret;
+}
+
 static
 int drm_plane_replace_color_op_blobs(struct drm_plane *plane,
 				     struct drm_plane_state *state,
@@ -425,6 +472,9 @@ int drm_plane_replace_color_op_blobs(struct drm_plane *plane,
 	bool blob_replaced = false;
 	bool temp_replaced = false;
 
+	if (!color_pipeline_blob_id)
+		return drm_plane_reset_color_op_blobs(plane, state, replaced);
+
 	new_blob = drm_property_lookup_blob(dev, color_pipeline_blob_id);
 
 	if (!new_blob) {
-- 
2.38.1

