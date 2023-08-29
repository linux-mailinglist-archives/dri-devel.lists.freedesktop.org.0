Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0F278C37F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01D610E2F2;
	Tue, 29 Aug 2023 11:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C2510E2CB;
 Tue, 29 Aug 2023 11:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693309204; x=1724845204;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0e+ltTfUJbmmtbUfJYK2kWw2VZwZOaHPLYn0grYDIbI=;
 b=JwXoKpYSFXbg26lzObBb5mOSo2irH0mxbUS7x2Xcl1AvD4zY1OyIAxh9
 nTqBSQ93mk9WzXsGZu8ZD9GrkjAEOgxhVH96ap24inPK5l/9r+rxd4d5g
 zYqRR0vATTiOtV+tWrmMUGt9t4k8NnH7YnlsPUSeUzf1DWxXt22hF6vI+
 mlcG+ImkvrgV0g3XiAhX5dFbLWSdRGgQlaKiQGQsGk2oNnABeGjm8g5l/
 reL3VQ+S5rz3AX4RG7TxOZIytkJiDh09PbO08wzYexpFBpuK7DPpVPkNK
 VFfL35QVN44upb50v9a9T77Bl3QwQQBrlL6XrXNY5Jd8Up8MV+Lgq9zAv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="365548919"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="365548919"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:40:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="768040394"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="768040394"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga008.jf.intel.com with SMTP; 29 Aug 2023 04:40:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Aug 2023 14:40:00 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 11/12] drm/i915/hdmi: Remove old i2c symlink
Date: Tue, 29 Aug 2023 14:39:19 +0300
Message-ID: <20230829113920.13713-12-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Remove the i915 specific i2c-N symlink from HDMI connectors.
This was added to sort of mirror the DP connectors that alreayd
had their aux ch based i2c adapter sitting beneath them in the
sysfs hierarchy. But now that we have the standard "ddc" symlink
approach provided by the core let's switch to that fully.
I don't think anything beyond igt depends on this.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 25 -----------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 6b8754290304..e9dcd3d5f6e4 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2544,28 +2544,6 @@ static int intel_hdmi_get_modes(struct drm_connector *connector)
 	return drm_edid_connector_add_modes(connector);
 }
 
-static void intel_hdmi_create_i2c_symlink(struct drm_connector *connector)
-{
-	struct drm_i915_private *i915 = to_i915(connector->dev);
-	struct i2c_adapter *ddc = connector->ddc;
-	struct kobject *i2c_kobj = &ddc->dev.kobj;
-	struct kobject *connector_kobj = &connector->kdev->kobj;
-	int ret;
-
-	ret = sysfs_create_link(connector_kobj, i2c_kobj, i2c_kobj->name);
-	if (ret)
-		drm_err(&i915->drm, "Failed to create i2c symlink (%d)\n", ret);
-}
-
-static void intel_hdmi_remove_i2c_symlink(struct drm_connector *connector)
-{
-	struct i2c_adapter *ddc = connector->ddc;
-	struct kobject *i2c_kobj = &ddc->dev.kobj;
-	struct kobject *connector_kobj = &connector->kdev->kobj;
-
-	sysfs_remove_link(connector_kobj, i2c_kobj->name);
-}
-
 static int
 intel_hdmi_connector_register(struct drm_connector *connector)
 {
@@ -2575,8 +2553,6 @@ intel_hdmi_connector_register(struct drm_connector *connector)
 	if (ret)
 		return ret;
 
-	intel_hdmi_create_i2c_symlink(connector);
-
 	return ret;
 }
 
@@ -2586,7 +2562,6 @@ static void intel_hdmi_connector_unregister(struct drm_connector *connector)
 
 	cec_notifier_conn_unregister(n);
 
-	intel_hdmi_remove_i2c_symlink(connector);
 	intel_connector_unregister(connector);
 }
 
-- 
2.41.0

