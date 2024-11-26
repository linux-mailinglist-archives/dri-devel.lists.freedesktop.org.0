Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7A49D983B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8328D10E881;
	Tue, 26 Nov 2024 13:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ql2aQQ/6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C67610E880;
 Tue, 26 Nov 2024 13:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732627194; x=1764163194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=64QqKmSwXbFZja0rhdJJH6RDmVroKrEAq0bq+ZgVo2Q=;
 b=Ql2aQQ/6INE0HYSr42sRT0FUAz9KjVmRxdlSIuEDNrIK/l8muFk08TAt
 hzqs6taPQpipLkymmRpwT+NWK4M2kDVdDdfLHzOR2exFbMbBEuKYa8fdq
 4XXZQ1BcEN8ah6b7Oz3HkMRxppyBwlPO5uc8F6l6Ron3VUpchSmHM5ryz
 7hs7QdSKUcYK55kJUgI6cVxCr9fpbGHtcU3wldSI7uBc/A66QKZwz/TWx
 sKPFIOshxqdnjXDpZDsZSmxwWNSRUKoO551SljPUTsw6FarNwRLc8xEmm
 FV9JHV9FJzm6CtA2jicCuwYdnElU9GToAufASrIwpE6e6mJGnH9Yy44f1 w==;
X-CSE-ConnectionGUID: RHIaaXSBSgGnqt9jZBLCtg==
X-CSE-MsgGUID: hXLohYyJQ3WyuFHE4VQQ+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44170140"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44170140"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:19:54 -0800
X-CSE-ConnectionGUID: 7zEi/aDrRRi/1ff0mTLH7g==
X-CSE-MsgGUID: LMegASa9Tt+XeSAdDH1dzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114874626"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 05:19:50 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 06/25] drm: Define helper to create color ops capability property
Date: Tue, 26 Nov 2024 18:57:11 +0530
Message-ID: <20241126132730.1192571-7-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241126132730.1192571-1-uma.shankar@intel.com>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
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

Add a helper to create capability property for a colorop

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/drm_colorop.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index a427cfc5bbbc..8563953ec9cf 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -83,6 +83,27 @@ static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] =
 };
 
 /* Init Helpers */
+__maybe_unused
+static int drm_create_colorop_capability_prop(struct drm_device *dev,
+					      struct drm_colorop *colorop,
+					      struct drm_property_blob *blob)
+{
+	struct drm_property *prop = NULL;
+
+	prop = drm_property_create(dev, DRM_MODE_PROP_BLOB |
+				   DRM_MODE_PROP_ATOMIC |
+				   DRM_MODE_PROP_IMMUTABLE,
+				   "HW_CAPS", 1);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->hw_caps_property = prop;
+	drm_object_attach_property(&colorop->base,
+				   colorop->hw_caps_property,
+				   blob->base.id);
+
+	return 0;
+}
 
 static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 			    struct drm_plane *plane, enum drm_colorop_type type,
-- 
2.42.0

