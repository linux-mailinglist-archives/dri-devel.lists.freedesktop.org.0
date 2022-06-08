Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 210E7542873
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE23610EEE0;
	Wed,  8 Jun 2022 07:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B440510EECF;
 Wed,  8 Jun 2022 07:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654674689; x=1686210689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GpE7nEyY2uspeeoHz7FHu7PpDL0wfiXZ3iIaSnnNdJM=;
 b=Uson+bCc8s7GpmOJw2KB80df61QJOhmuq53n4Sk7efs0dxz0At/hiAgb
 UfHefM2Hlb0LJLN1+gGWlHPoaoQYVF53TFKH3yyjh4E8inYV9mdt8F1i4
 064E9N1MkHDk47bPB0Nake0N1t5G+ln+jBJGtPGcouESIxnDYOYN/0J1R
 sTGNBNsKGgmJartZQCWnkd+rvHrojYMz3Vr3PMJKNcPtN5c9IvGkOj+EN
 jMal93MtjqIK4SYOQ+odS9nWlKz2xzdFgE9FPcz4ffhR+KEnQfKc3oNVZ
 KtywS3sPkp+Qz4hulJmJj4qGyYXh8022fIYTSQ/w+/e6aveRNLHd78pEG Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="363142728"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="363142728"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="907528407"
Received: from jkosticx-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.58.130])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 09/15] drm/edid: add drm_edid_raw() to access the raw EDID
 data
Date: Wed,  8 Jun 2022 10:50:39 +0300
Message-Id: <5363988bcd7f0af9a32e30634348dbb8f22ec5b9.1654674560.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1654674560.git.jani.nikula@intel.com>
References: <cover.1654674560.git.jani.nikula@intel.com>
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
index 952724788963..4e788c5cbf25 100644
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
index aeb2fa95bc04..2181977ae683 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -597,6 +597,7 @@ drm_display_mode_from_cea_vic(struct drm_device *dev,
 const struct drm_edid *drm_edid_alloc(const void *edid, size_t size);
 const struct drm_edid *drm_edid_dup(const struct drm_edid *drm_edid);
 void drm_edid_free(const struct drm_edid *drm_edid);
+const struct edid *drm_edid_raw(const struct drm_edid *drm_edid);
 const struct drm_edid *drm_edid_read(struct drm_connector *connector);
 const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
 					 struct i2c_adapter *adapter);
-- 
2.30.2

