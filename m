Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA3ACCEBF8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 08:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E02010EE9C;
	Fri, 19 Dec 2025 07:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nCf2VCfW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4AB10EE8E;
 Fri, 19 Dec 2025 07:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766128405; x=1797664405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6nh5/XsgM2xvKV1hwWNrjgrXhBNc+MyoiSBxw6FVTGM=;
 b=nCf2VCfW17Q0uJMN30cZQhJcraLirM20hdD/r4t8Zt61JbI7esLViD7J
 QdfF0a5DlXwqvHaTysQZ0A9lcQRqc7cczfUGDmlzAmV0elhgY+qHPzJ2w
 EpD99+NjJIdtcR6Q9VVFMKwbhNBVeB6OD1UJjHQt06hYq3/MQ07a8ivLG
 usv9oZOXvNw7Ep69lrxkuXf8h1DKCGc5sxBUYcJUnYt4AGow8CSeuEcev
 uFCOt/yYAI0YdhHA05sapemdMA781socNLWk1WszO7iQ4sUadBC1XEVds
 gvh0x6KMA7W232HHg/pgwI8Ym/9zU0qVayVcgqxqoAjf721wqTOmQNLR5 g==;
X-CSE-ConnectionGUID: 5V4HRt0qRJa+6bw/kAyp1g==
X-CSE-MsgGUID: Ko0qPDoVS8mlAlKQ7TcdlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93562329"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="93562329"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 23:13:25 -0800
X-CSE-ConnectionGUID: x2AF5lcMS7GxEuyb6rUd2g==
X-CSE-MsgGUID: OhBrcP2yRCiNQKyx0zs48Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="222209482"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 18 Dec 2025 23:13:20 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH 06/13] drm/colorop: Add destroy helper for colorop objects
Date: Fri, 19 Dec 2025 12:26:07 +0530
Message-Id: <20251219065614.190834-7-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
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

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/drm_colorop.c | 12 ++++++++++++
 include/drm/drm_colorop.h     | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index efe61bdd9b24..4b27804bb0bd 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -180,6 +180,18 @@ void drm_colorop_cleanup(struct drm_colorop *colorop)
 }
 EXPORT_SYMBOL(drm_colorop_cleanup);
 
+/**
+ * drm_colorop_destroy() - Helper for colorop destruction
+ *
+ * @colorop: colorop to destroy
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
index 45d1b1d3faf9..ee6454b08b2d 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -440,6 +440,16 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
  */
 void drm_colorop_reset(struct drm_colorop *colorop);
 
+/**
+ * drm_colorop_destroy - destroy colorop
+ * @colorop: drm colorop
+ *
+ * Destroys @colorop by performing common DRM cleanup and freeing the
+ * colorop object. This can be used by drivers if they do not
+ * require any driver-specific teardown.
+ */
+void drm_colorop_destroy(struct drm_colorop *colorop);
+
 /**
  * drm_colorop_index - find the index of a registered colorop
  * @colorop: colorop to find index for
-- 
2.25.1

