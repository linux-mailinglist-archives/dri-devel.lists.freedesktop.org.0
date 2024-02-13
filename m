Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EF785292C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4CB10E8DC;
	Tue, 13 Feb 2024 06:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ff2cjW22";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163B110E8D5;
 Tue, 13 Feb 2024 06:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806501; x=1739342501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fZmM2nX/1BCjnR1Qr3x4VzKJeWex+kWa+99dGVtjK3c=;
 b=Ff2cjW224MdoMBR3krU4sEOoIpSy35DD3nFD5j672t4+iypKAwv4yXIV
 AqFrp1anGQdTW1HMpDLJvOuP8vRq/hJtUOFadvZ+FqcKbJaZVTnm8tQcu
 03me43cSeqom3hhHa5zp7zSlV7Fclaz5/CRJ3pvlpFygFcBt6ppX8i9l+
 OKeXs3vDnbvc79u1L7LOIkbt7gY6uczyAiSNvpCXKVGJBuMngPG4GoECw
 x7V+3QVicMGObYGis77mOEo90aauPUl8SOQlRikjqsTA1jLuIroYcpJMa
 v+ESpCfs2kg8c/1WJDc5OPvqZC/opEatGQkzyXmSrBqd+4OOmJVo6sFmc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436947919"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436947919"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:41:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450346"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:41:34 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, arthurgrillo@riseup.net, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com, sean@poorly.run,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 10/28] drm: Define helper to create color ops capability
 property
Date: Tue, 13 Feb 2024 12:18:17 +0530
Message-ID: <20240213064835.139464-11-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240213064835.139464-1-uma.shankar@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
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
index 4d57eaef04aa..cfdc8e751012 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -43,6 +43,27 @@ static const struct drm_prop_enum_list drm_colorop_curve_1d_type_enum_list[] = {
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
 
 int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 		     struct drm_plane *plane, enum drm_colorop_type type)
-- 
2.42.0

