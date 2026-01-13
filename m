Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72143D182B1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 11:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D36010E4B0;
	Tue, 13 Jan 2026 10:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nttcn8Ls";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7267510E490;
 Tue, 13 Jan 2026 10:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768301331; x=1799837331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ttnICJt5IYENWLPuqHFYEXOSG6v+L8k1jixrSFejo8Y=;
 b=nttcn8LsGaUFKW2u8Dy8q+lZwGPFvqbk496LVYb6gc6ZoEk5wMMUrXF5
 nVtYvTsS7v2fdHsriicL11sW9idUofXqloFCW/aoNccYBXp6GUp/um0R/
 uWimMISu4ZYoyViNOBtl7U2MrDxeIgiae8onGmshJiOwmAyOqOtl6idrN
 DEQf3+Pzw+gwb2wMrHhSyRIIbHZRkVgMLn80FLF0GD0Waxu+//dqTkqE5
 FVeMkSfQ1ahfNuKNrDg2sB+FmmdRGhhd6BeElx8rDQkwm/juGW0fRcRl9
 AZ28MQP4cg7zbWIzb78BE2gN/rhtSeZbaZpw1d3jL/weuO7lqyTebtCp7 A==;
X-CSE-ConnectionGUID: WO7zaduCQByVvniKa8ZgTg==
X-CSE-MsgGUID: /sXIken3ST2beV/PNcTgGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="87165208"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="87165208"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 02:48:51 -0800
X-CSE-ConnectionGUID: qdUrcqTJRBaAIMckZYbHrA==
X-CSE-MsgGUID: nDJa8XW2Q/quOnZbauFUCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="227554604"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 13 Jan 2026 02:48:47 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH v3 05/13] drm/colorop: Add destroy helper for colorop objects
Date: Tue, 13 Jan 2026 15:52:55 +0530
Message-Id: <20260113102303.724205-6-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260113102303.724205-1-chaitanya.kumar.borah@intel.com>
References: <20260113102303.724205-1-chaitanya.kumar.borah@intel.com>
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

Add a helper that performs common cleanup and frees the
associated object. This can be used by drivers if they do not
require any driver-specific teardown.

v2:
- Add function documentation only before definition (Jani)

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/drm_colorop.c | 15 +++++++++++++++
 include/drm/drm_colorop.h     |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 44eb823585d2..c226870fde9e 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -178,6 +178,21 @@ void drm_colorop_cleanup(struct drm_colorop *colorop)
 }
 EXPORT_SYMBOL(drm_colorop_cleanup);
 
+/**
+ * drm_colorop_destroy - destroy colorop
+ * @colorop: drm colorop
+ *
+ * Destroys @colorop by performing common DRM cleanup and freeing the
+ * colorop object. This can be used by drivers if they do not
+ * require any driver-specific teardown.
+ */
+void drm_colorop_destroy(struct drm_colorop *colorop)
+{
+	drm_colorop_cleanup(colorop);
+	kfree(colorop);
+}
+EXPORT_SYMBOL(drm_colorop_destroy);
+
 /**
  * drm_colorop_pipeline_destroy - Helper for color pipeline destruction
  *
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index a3a32f9f918c..3056f3f02597 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -420,6 +420,8 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
  */
 void drm_colorop_reset(struct drm_colorop *colorop);
 
+void drm_colorop_destroy(struct drm_colorop *colorop);
+
 /**
  * drm_colorop_index - find the index of a registered colorop
  * @colorop: colorop to find index for
-- 
2.25.1

