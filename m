Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D538554586
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 13:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E85110EAB4;
	Wed, 22 Jun 2022 11:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E63D10EADE;
 Wed, 22 Jun 2022 11:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655895601; x=1687431601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nwfOlHL2nglw9+d59/d+TvytzF+TBnMwuokxXU7/USI=;
 b=FkGM7c7Co8dkxQvWW2jSWZPdSh0Mg5MZosQ3muWM8Cp6aPkeLieEVKOg
 KosIhCBpabrSz9VhEFs1gMzS2vSilMP3c8Qq6btAL4Eq9kST0QULO7EoC
 WyATwDb747/bJd24Ti386xM4NW1B+laL9iNlG4RVGzOqGv52dZlOeitX6
 LIKKxRMIWY6uuhc0kKv2mvrG9R3zVIq6IulFi81Atd4y+w0oB7kwzu/07
 3upG6NYN0o3VSGpwir/IDn/Npzp4uE/m8bAQ/7THmmZIRDuT9Sx2pTg2P
 gT51MKEYB1AcUK6YjyFRLpSy5qhxnwgA4oeVqU98rLaDQ/IhwN19fj5rE Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="305837429"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="305837429"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 04:00:00 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="655609312"
Received: from snowacki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.111])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 03:59:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 07/13] drm/edid: add drm_edid_raw() to access the raw EDID
 data
Date: Wed, 22 Jun 2022 13:59:21 +0300
Message-Id: <910bff54e79a93a339b209162aad83806a3d66f7.1655895388.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1655895388.git.jani.nikula@intel.com>
References: <cover.1655895388.git.jani.nikula@intel.com>
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

Unfortunately, there are still plenty of interfaces around that require
a struct edid pointer, and it's impossible to change them all at
once. Add an accessor to the raw EDID data to help the transition.

While there are no such cases now, be defensive against raw EDID
extension count indicating bigger EDID than is actually allocated.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 26 ++++++++++++++++++++++++++
 include/drm/drm_edid.h     |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 41b3de52b8f1..1c761e12820e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2359,6 +2359,32 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
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

