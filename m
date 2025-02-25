Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA24DA43665
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 08:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8566210E597;
	Tue, 25 Feb 2025 07:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EitktdbI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F86D10E596;
 Tue, 25 Feb 2025 07:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740469715; x=1772005715;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=WYJNQVGGJ25Mc/mIlnFnQbjwv/k3xZBqc0F2Iki1nLI=;
 b=EitktdbIlbKV3Ma/WTV+bkpPrI8sONsHzoVpr+sPoCiZi4Jq21TcnTqS
 SMEXwtcJtlLpUFms9sdBbBdZzwe6PjbEh3LVsKaW8dvgTgXy2bRSrqXcv
 NHhtiPRkdVGtIcebsNYr/KYmS1DH11VLkdrQBXayJCN5VAyazEWNRcYiS
 GGHAJ0sz1oEAv2Vtg55CQKvZmNhT3uj2LXXJ/0OXaT6qyg9/dGPXeh01Y
 I6zLfTAzFGWVvskQPMpoFLWCxGHRoC1KylPNMtfvGkzdOHyXilXZZCkDp
 MqVoImylZIpGvl605L5WihjSQOap3AVcAFtMdKQfFpQSezXpCeL6iHJ53 w==;
X-CSE-ConnectionGUID: Nmy+Yz1TRBiiaJH9fzocLQ==
X-CSE-MsgGUID: OdVvZdm0TuqpFfoPZybvow==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="63726916"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="63726916"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 23:48:35 -0800
X-CSE-ConnectionGUID: 3+olT39nTUOAccTpZRyb4A==
X-CSE-MsgGUID: Bvi4J2aaSHSRP7A9U/mErg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116330871"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa007.fm.intel.com with ESMTP; 24 Feb 2025 23:48:33 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 25 Feb 2025 13:03:52 +0530
Subject: [PATCH v7 2/3] drm/plane: modify create_in_formats to accommodate
 async
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-asyn-v7-2-20b81122f4ce@intel.com>
References: <20250225-asyn-v7-0-20b81122f4ce@intel.com>
In-Reply-To: <20250225-asyn-v7-0-20b81122f4ce@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com
Cc: Arun R Murthy <arun.r.murthy@intel.com>, 
 Naveen Kumar <naveen1.kumar@intel.com>
X-Mailer: b4 0.15-dev
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

create_in_formats creates the list of supported format/modifiers for
synchronous flips, modify the same function so as to take the
format_mod_supported as argument and create list of format/modifier for
async as well.

v5: create_in_formats can return -ve value in failure case, correct the
if condition to check the creation of blob <Chaitanya>
Dont add the modifier for which none of the formats is not supported.
v6: Remove the code for masking the unsupported modifiers as UMD can
leave with it. (Naveen/Chaitanya)
v7: Retain the unsupported modifiers, userspace should have no
impact, return pointer to blob instead of blob_id(Ville)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Tested-by: Naveen Kumar <naveen1.kumar@intel.com>
---
 drivers/gpu/drm/drm_plane.c | 41 +++++++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index fe181c1002171acc68d3054c2d178f9b9f501fe2..97a387a966622f4b53b0452279617cb27b42f7b2 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -193,9 +193,12 @@ modifiers_ptr(struct drm_format_modifier_blob *blob)
 	return (struct drm_format_modifier *)(((char *)blob) + blob->modifiers_offset);
 }
 
-static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane)
+static struct drm_property_blob *create_in_format_blob(struct drm_device *dev,
+						       struct drm_plane *plane,
+						       bool (*format_mod_supported)(struct drm_plane *plane,
+						       u32 format,
+						       u64 modifier))
 {
-	const struct drm_mode_config *config = &dev->mode_config;
 	struct drm_property_blob *blob;
 	struct drm_format_modifier *mod;
 	size_t blob_size, formats_size, modifiers_size;
@@ -237,10 +240,10 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 	mod = modifiers_ptr(blob_data);
 	for (i = 0; i < plane->modifier_count; i++) {
 		for (j = 0; j < plane->format_count; j++) {
-			if (!plane->funcs->format_mod_supported ||
-			    plane->funcs->format_mod_supported(plane,
-							       plane->format_types[j],
-							       plane->modifiers[i])) {
+			if (!format_mod_supported ||
+			    format_mod_supported(plane,
+						 plane->format_types[j],
+						 plane->modifiers[i])) {
 				mod->formats |= 1ULL << j;
 			}
 		}
@@ -251,10 +254,7 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 		mod++;
 	}
 
-	drm_object_attach_property(&plane->base, config->modifiers_property,
-				   blob->base.id);
-
-	return 0;
+	return blob;
 }
 
 /**
@@ -366,6 +366,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 				      const char *name, va_list ap)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_property_blob *blob;
 	static const uint64_t default_modifiers[] = {
 		DRM_FORMAT_MOD_LINEAR,
 	};
@@ -477,8 +478,24 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 		drm_plane_create_hotspot_properties(plane);
 	}
 
-	if (format_modifier_count)
-		create_in_format_blob(dev, plane);
+	if (format_modifier_count) {
+		blob = create_in_format_blob(dev, plane,
+					     plane->funcs->format_mod_supported);
+		if (!IS_ERR(blob))
+			drm_object_attach_property(&plane->base,
+						   config->modifiers_property,
+						   blob->base.id);
+	}
+
+	if (plane->funcs->format_mod_supported_async) {
+		blob = create_in_format_blob(dev, plane,
+					     plane->funcs->format_mod_supported_async);
+		if (!IS_ERR(blob))
+			drm_object_attach_property(&plane->base,
+						   config->async_modifiers_property,
+						   blob->base.id);
+	}
+
 
 	return 0;
 }

-- 
2.25.1

