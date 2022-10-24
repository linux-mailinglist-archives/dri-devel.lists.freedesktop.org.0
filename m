Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1444F60A65E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 14:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E227C10E4D5;
	Mon, 24 Oct 2022 12:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6216E10E4C5;
 Mon, 24 Oct 2022 12:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666614854; x=1698150854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RQkkT1yMahbj0kDW9QjzTq5p45Jp1xhDRb5NCf8BCbw=;
 b=l9pO0aWkk3O2W0r08+SS9zj3rfuHeq2Z3M/+NdWOfvk8Q5SEJKR2iqb+
 raQ8tNjRkgw6YkSDXT4qfv6FUf8O2MhSL3Oe8J8ydbEHYAqfr+3/yxJuf
 R0IOsUa8oYl2d4H1rOCGsHgwXzVFnrAOAvroBQkvir2PpRDjWxyo5xsxJ
 X/dm6Ell7xzYLNILwJrLCnVnIjLnxBAsZIU95p+6asuiEEKhbapSztsb9
 iPVTqzrOamIS9LAIJ+H7gpmT76iHpIS9oNU8RM5qfsckf4jd05MgjeCFJ
 D760ap9nWBsW434J94LOKaqr2SD78+Fi1QTYm5Q8RXJexR0wGy4ZqbIHs Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="369472683"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="369472683"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:14 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="626055656"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="626055656"
Received: from emontau-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.221])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/16] drm/edid: abstract debugfs override EDID show better
Date: Mon, 24 Oct 2022 15:33:33 +0300
Message-Id: <74defa7b595f51e6c1f2eacd9c799d567d29f053.1666614699.git.jani.nikula@intel.com>
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

Add a function to dump the override EDID in debugfs. This hides the
override EDID management better in drm_edid.c.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_crtc_internal.h |  4 +++-
 drivers/gpu/drm/drm_debugfs.c       |  8 +-------
 drivers/gpu/drm/drm_edid.c          | 11 +++++++++++
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 56041b604881..fb8a68d90940 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -56,9 +56,10 @@ struct drm_plane;
 struct drm_plane_state;
 struct drm_property;
 struct edid;
+struct fwnode_handle;
 struct kref;
+struct seq_file;
 struct work_struct;
-struct fwnode_handle;
 
 /* drm_crtc.c */
 int drm_mode_crtc_set_obj_prop(struct drm_mode_object *obj,
@@ -286,5 +287,6 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 
 /* drm_edid.c */
 void drm_mode_fixup_1366x768(struct drm_display_mode *mode);
+int drm_edid_override_show(struct drm_connector *connector, struct seq_file *m);
 int drm_edid_override_set(struct drm_connector *connector, const void *edid, size_t size);
 int drm_edid_override_reset(struct drm_connector *connector);
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 01ee3febb813..ee445f4605ba 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -328,13 +328,7 @@ static ssize_t connector_write(struct file *file, const char __user *ubuf,
 
 static int edid_show(struct seq_file *m, void *data)
 {
-	struct drm_connector *connector = m->private;
-	struct drm_property_blob *edid = connector->edid_blob_ptr;
-
-	if (connector->override_edid && edid)
-		seq_write(m, edid->data, edid->length);
-
-	return 0;
+	return drm_edid_override_show(m->private, m);
 }
 
 static int edid_open(struct inode *inode, struct file *file)
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index a863cffa2dc5..1ada36e0d826 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2183,6 +2183,17 @@ static struct edid *drm_get_override_edid(struct drm_connector *connector,
 	return IS_ERR(override) ? NULL : override;
 }
 
+/* For debugfs edid_override implementation */
+int drm_edid_override_show(struct drm_connector *connector, struct seq_file *m)
+{
+	struct drm_property_blob *edid = connector->edid_blob_ptr;
+
+	if (connector->override_edid && edid)
+		seq_write(m, edid->data, edid->length);
+
+	return 0;
+}
+
 /* For debugfs edid_override implementation */
 int drm_edid_override_set(struct drm_connector *connector, const void *edid,
 			  size_t size)
-- 
2.34.1

