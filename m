Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E18AF9D0A84
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 09:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C0C10E42E;
	Mon, 18 Nov 2024 08:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UrGakWV4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3903B10E34E;
 Mon, 18 Nov 2024 08:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731916975; x=1763452975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4EeMmGmaTUQIlbMVXUQKkMA6tmXGzrmWIo2B+QbYfQA=;
 b=UrGakWV4wMnb/12631HElknG0qXRm8lwmBEkWu6OOkoiv+QqJJUP9vKF
 CyS309tk7D6oJwqcOJ15upACszZZSupQaT/IYurAXAutG3EIhhZ6qnKp5
 awgci80HxIqiQtqA5sIncmpGYM6sG+UT6yZoU7OCt5Pl5rhie58JHimhy
 6rBvyt803BoZGagU8HE39TjIx+mTP/KQ4OzLAlVAlX3gOJBajj5BQ1lC5
 b+enAs92RgclxY1j0gIucHArDlWH8p2IoTmEWT7KBHi+91ubeUnlWOlaz
 iP+QfEz7WSjKLjtfZjNNU3HomEDfn1ZvNKcfS0cLPGYQwjaxUEFJgIpFY g==;
X-CSE-ConnectionGUID: 26fPt73mQzqF1sY/3u6q4Q==
X-CSE-MsgGUID: rpiqO3o5TdeLoyKPKYa35Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31915485"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="31915485"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 00:02:55 -0800
X-CSE-ConnectionGUID: QmTAFXDmRFqMLHMkSCRnIw==
X-CSE-MsgGUID: 7OCJbOOSSj6M5dhDowfYPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="89061829"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa010.jf.intel.com with ESMTP; 18 Nov 2024 00:02:52 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv2 1/3] drm/plane: Add new plane property IN_FORMATS_ASYNC
Date: Mon, 18 Nov 2024 13:23:13 +0530
Message-Id: <20241118075315.466009-2-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241118075315.466009-1-arun.r.murthy@intel.com>
References: <20241118075315.466009-1-arun.r.murthy@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There exists a property IN_FORMATS which exposes the plane supported
modifiers/formats to the user. In some platforms when asynchronous flips
are used all of modifiers/formats mentioned in IN_FORMATS are not
supported. This patch adds a new plane property IN_FORMATS_ASYNC to
expose the async flips supported modifiers/formats so that user can use
this information ahead and done flips with unsupported
formats/modifiers. This will save flips failures.

v2: Remove async variable from drm_plane (Ville)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_mode_config.c | 7 +++++++
 drivers/gpu/drm/drm_plane.c       | 6 ++++++
 include/drm/drm_mode_config.h     | 6 ++++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 37d2e0a4ef4b..cff189a2e751 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -379,6 +379,13 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.size_hints_property = prop;
 
+	prop = drm_property_create(dev,
+				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
+				   "IN_FORMATS_ASYNC", 0);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.async_modifiers_property = prop;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index a28b22fdd7a4..416818e54ccf 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -141,6 +141,12 @@
  *     various bugs in this area with inconsistencies between the capability
  *     flag and per-plane properties.
  *
+ * IN_FORMATS_ASYNC:
+ *     Blob property which contains the set of buffer format and modifier
+ *     pairs supported by this plane for asynchronous flips. The blob is a struct
+ *     drm_format_modifier_blob. Without this property the plane doesn't
+ *     support buffers with modifiers. Userspace cannot change this property.
+ *
  * SIZE_HINTS:
  *     Blob property which contains the set of recommended plane size
  *     which can used for simple "cursor like" use cases (eg. no scaling).
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 271765e2e9f2..0c116d6dfd27 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -936,6 +936,12 @@ struct drm_mode_config {
 	 */
 	struct drm_property *modifiers_property;
 
+	/**
+	 * @async_modifiers_property: Plane property to list support modifier/format
+	 * combination for asynchronous flips.
+	 */
+	struct drm_property *async_modifiers_property;
+
 	/**
 	 * @size_hints_property: Plane SIZE_HINTS property.
 	 */
-- 
2.25.1

