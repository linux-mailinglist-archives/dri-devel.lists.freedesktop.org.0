Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B1785292A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA9210E8D3;
	Tue, 13 Feb 2024 06:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DV8gXign";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5351C10E8B5;
 Tue, 13 Feb 2024 06:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806494; x=1739342494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TurxMBLxfRJAT3ksqBzCRZ+Lafb1YAaMIfNckjnHc9c=;
 b=DV8gXigniFfF6gsUQziT/P6q4aAMKm9KByqfoO3nJj+k24S6t4R0iCA+
 lrhBJLuZeY6CtnlY7DKTw8HIOnJ1qq6/4hWFa7g9QyYhmLlfRbs7fm8oK
 qdG9ygx6ojcZwGCQPf0zmyYQcd/mGysdOwCQP9iEnxYXGxavK8wk7U+o6
 75r1PXYDAJr3Gf+/LZ2T6a9/PXAC+uSlCNynTcsLq8KtHJhbJFh3Sw7Bz
 eGEmUwCwG8oSv+n/0DZoV6iwr+nIvhvC2EHCyAXRoy5JmFsKk90sB2PZk
 WCIZVvCgo26q1eiRBz4P0IVJjobimoggUoQnwhzA9JzLiybrCKI64zNVL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436947887"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436947887"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:41:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450316"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:41:27 -0800
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
Subject: [PATCH 09/28] drm: Add Color ops capability property
Date: Tue, 13 Feb 2024 12:18:16 +0530
Message-ID: <20240213064835.139464-10-uma.shankar@intel.com>
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

Add capability property which a colorop can expose it's
hardware's abilities. It's a blob property that can be
filled with respective data structures depending on the
colorop. The user space is expected to read this property
and program the colorop accordingly.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
 include/drm/drm_colorop.h         | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 9f6a3a1c8020..95f1df73209c 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -770,6 +770,9 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->curve_1d_type;
 	} else if (property == colorop->data_property) {
 		*val = (state->data) ? state->data->base.id : 0;
+	} else if (property == colorop->hw_caps_property) {
+		*val = state->hw_caps ?
+			state->hw_caps->base.id : 0;
 	} else {
 		return -EINVAL;
 	}
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 5b8c36538491..f417e109c40a 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -59,6 +59,12 @@ struct drm_colorop_state {
 	 */
 	enum drm_colorop_curve_1d_type curve_1d_type;
 
+	/**
+	 * @hw_caps:
+	 *
+	 */
+	struct drm_property_blob *hw_caps;
+
 	/**
 	 * @data:
 	 *
@@ -167,6 +173,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *bypass_property;
 
+	/**
+	 * @hwlut_caps_property:
+	 *
+	 * Property to expose hardware lut capbilities.
+	 */
+	struct drm_property *hw_caps_property;
+
 	/**
 	 * @curve_1d_type:
 	 *
-- 
2.42.0

