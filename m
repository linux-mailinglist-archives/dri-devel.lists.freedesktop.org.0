Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C835FB3C0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 15:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF6B10E3A7;
	Tue, 11 Oct 2022 13:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A21E10E802;
 Tue, 11 Oct 2022 13:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665496221; x=1697032221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p3B6ENV73gUh5NO2OJAuRQ1UPdcHod/EzahlDF89kkI=;
 b=Sor4Dg8EQCCePVgCVV6TrDschGrNCz98lhEkwShdur5q7GZcJzUbKcca
 KGqa20O+/6mYRfuBPXpQwr01G7WGjkUE9w1u5jGuVaC+vuDQuo2esN5hS
 pEbs9vF/LjzpoTanunRPwFgL+lPfxY42bYWzAN3BSvUmqDI3WjX4xq0dy
 PBKtzkosiughsqy3vFVb5ddvWgzdnVFLBrn34r1IscxUUy10pYLjX4iNB
 nU3WJ/PwkJYYGWftyuSB72xJHPpeJ/A0+OuYaYqXdKGyWZcijo7WWb5sG
 dLC2NFejPGVIHK7tsdblNg4sxFI5p5Hm+ryY+h2hjOw1pOzLj5RF5/ny9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="303244764"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="303244764"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:20 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="871510139"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="871510139"
Received: from milawils-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/15] drm/edid: abstract debugfs override EDID show better
Date: Tue, 11 Oct 2022 16:49:39 +0300
Message-Id: <c51732dbbd7115879982c478912d0f03820413e3.1665496046.git.jani.nikula@intel.com>
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

Add a function to dump the override EDID in debugfs. This hides the
override EDID management better in drm_edid.c.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
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

