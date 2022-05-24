Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 044345327FC
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 12:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B3D10F4EE;
	Tue, 24 May 2022 10:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB87410F4EE;
 Tue, 24 May 2022 10:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653388843; x=1684924843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3lkgf0tDTdE4R42b7nywMKffBUqaKjx6MASnGDQ9PbI=;
 b=HRfVYdcsr1qkrasAQQu+KQBccWnD+q4dTOBO5BbPmfL6g7sK87uA00HN
 JQf3+DbLhEuK35tRGty6YUm3rabrTmofFG8flNzXnl77J/4Bcxy1lk4hM
 QZOH8y7e/MCuD5YgcSKk2womZLyZZA0eyntsaiAZ5ExCqdBIEm3h0GpLY
 WOLh5AfDQ7XYDs27T0zxM0KCt4TgqSmPt5X836tivAzWqrsbOqP8SG1NT
 EtwnOr+fEASuxh+kqcL1Zfaxm1TYgaS2k2dTYUtT4f3ue1yVizMCAIEuT
 KibikugzjKIUUkaAeutY7w8iH3p36dgjcZcSYisrKamUIcorxho9KCgfN w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="273490403"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="273490403"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:40:43 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="703416871"
Received: from zychseba-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.136.104])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:40:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 08/13] drm/edid: add drm_edid_raw() to access the raw EDID
 data
Date: Tue, 24 May 2022 13:39:30 +0300
Message-Id: <2457c7f3fac56547d8f8a85582fe79d040ebda13.1653381821.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1653381821.git.jani.nikula@intel.com>
References: <cover.1653381821.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unfortunately, there are still plenty of interfaces around that require
a struct edid pointer, and it's impossible to change them all at
once. Add an accessor to the raw EDID data to help the transition.

While there are no such cases now, be defensive against raw EDID
extension count indicating bigger EDID than is actually allocated.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 26 ++++++++++++++++++++++++++
 include/drm/drm_edid.h     |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 09328298aabf..6617ea70ae5c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2333,6 +2333,32 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 }
 EXPORT_SYMBOL_GPL(drm_do_get_edid);
 
+/**
+ * drm_edid_raw - Get a pointer to the raw EDID data.
+ * @drm_edid: drm_edid container
+ *
+ * Get a pointer to the raw EDID data.
+ *
+ * This is for transition only. Avoid using this like the plague.
+ *
+ * Return: Pointer to raw EDID data.
+ */
+const struct edid *drm_edid_raw(const struct drm_edid *drm_edid)
+{
+	if (!drm_edid || !drm_edid->size)
+		return NULL;
+
+	/*
+	 * Do not return pointers where relying on EDID extension count would
+	 * lead to buffer overflow.
+	 */
+	if (WARN_ON(edid_size(drm_edid->edid) > drm_edid->size))
+		return NULL;
+
+	return drm_edid->edid;
+}
+EXPORT_SYMBOL(drm_edid_raw);
+
 /* Allocate struct drm_edid container *without* duplicating the edid data */
 static const struct drm_edid *_drm_edid_alloc(const void *edid, size_t size)
 {
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 289b956d31ea..f74ec9f7439b 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -584,6 +584,7 @@ drm_display_mode_from_cea_vic(struct drm_device *dev,
 const struct drm_edid *drm_edid_alloc(const void *edid, size_t size);
 const struct drm_edid *drm_edid_dup(const struct drm_edid *drm_edid);
 void drm_edid_free(const struct drm_edid *drm_edid);
+const struct edid *drm_edid_raw(const struct drm_edid *drm_edid);
 const struct drm_edid *drm_edid_read(struct drm_connector *connector);
 const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
 					 struct i2c_adapter *adapter);
-- 
2.30.2

