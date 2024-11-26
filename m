Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B289D983E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D4E10E888;
	Tue, 26 Nov 2024 13:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOluEDwm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D204510E3FD;
 Tue, 26 Nov 2024 13:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732627192; x=1764163192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4A4KCfP+1/za6JqnhvMAkyCFZFOar8As1zYEKdb0cic=;
 b=EOluEDwmL2rCt3CKrgZt/+ek+PK4ydUbcAvuA3+zJLmI0Ak+5uAuTxZi
 GrFClpaNldWh+N3KbG27aQHz4J+I3vvy4a9OMg197VhIv0311dIJB0I33
 eXF3aA6y1Z5kLif5eT6LDlTjU3RLxLt0AN1bsFvYAthJoEGazfQVlytGF
 dg6jjZZHX6EE/PAdidIQphdgcY2UtmiEfSpFsp7n9TOJAGuOQZ35MDdRR
 hZaUOtwYJqRRBv5r9XxLSFJzDP3Kr2+Ee/Hw48345AZdFsIsLFXEO8XYP
 P+kvOUhcGDva4POjkGNLwjZ1vAQbYAbzA7t1IiJCKSbfVc9KAQ4yFlOPP Q==;
X-CSE-ConnectionGUID: daolTG9sTX+UlMSyclfWpQ==
X-CSE-MsgGUID: 47cgJhf9RrG8rFJvxGtn1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44170124"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44170124"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:19:50 -0800
X-CSE-ConnectionGUID: mHgNE+HkRmWkm9fiAoi/Ag==
X-CSE-MsgGUID: QsOhSdAFSUiGGfHZS57iSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114874613"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 05:19:47 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 05/25] drm: Add Color ops capability property
Date: Tue, 26 Nov 2024 18:57:10 +0530
Message-ID: <20241126132730.1192571-6-uma.shankar@intel.com>
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

Add capability property which a colorop can expose it's
hardware's abilities. It's a blob property that can be
filled with respective data structures depending on the
colorop. The user space is expected to read this property
and program the colorop accordingly.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
 include/drm/drm_colorop.h         | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index ba68358c0ffe..46cc7b0df6e8 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -780,6 +780,9 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->size;
 	} else if (property == colorop->data_property) {
 		*val = (state->data) ? state->data->base.id : 0;
+	} else if (property == colorop->hw_caps_property) {
+		*val = state->hw_caps ?
+			state->hw_caps->base.id : 0;
 	} else {
 		return -EINVAL;
 	}
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 56b51fafebdf..58e5b87c6d56 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -146,6 +146,11 @@ struct drm_colorop_state {
 	 * Number of entries of the custom LUT. This should be read-only.
 	 */
 	uint32_t size;
+	/**
+	 * @hw_caps:
+	 *
+	 */
+	struct drm_property_blob *hw_caps;
 
 	/**
 	 * @lut_3d_modes:
@@ -297,6 +302,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *curve_1d_type_property;
 
+	/**
+	 * @hwlut_caps_property:
+	 *
+	 * Property to expose hardware lut capbilities.
+	 */
+	struct drm_property *hw_caps_property;
+
 	/**
 	 * @multiplier_property:
 	 *
-- 
2.42.0

