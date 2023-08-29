Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1B578C91B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF4210E404;
	Tue, 29 Aug 2023 15:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3FD10E3F3;
 Tue, 29 Aug 2023 15:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324765; x=1724860765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=93hDMXKlUVtM6dMv2jIX3mE572Gifj58PoXC1o3U6zU=;
 b=h45URntJOgcUcFF0ad8USYYhomcfmZa0RjelVTwK6a9K+5c3tnuXkzHl
 Rv/W3r5sN2a9mTqBAD7ZeZHW5GyZk9Gh4KmQHbYFJZvYxtp8JY9eOchDG
 A85Yk2tUg3+tP2dwFFZEdXrR3Efvt/ty1XWBuUdkftvewzYXEompgICrn
 ff0IOmgi+wBKsrAC5/a4DciYU4qVlAJ7OJz3ZQa+8Sp4AwXSt2l7iI6QG
 z45D88JNbL5HrykIOk6MrIeOLQClyZ60tMukBcFMITNlfhndHctMRF1BN
 LjorpNiYLiT8KMZq8xj/0cL3PJObEVxFOzT4K2Mu0PNQpTD+e3DGxUf+5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769393"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769393"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555048"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555048"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:20 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 19/33] drm/i915/color: Add SDR plane LUT range data to color
 pipeline
Date: Tue, 29 Aug 2023 21:34:08 +0530
Message-ID: <20230829160422.1251087-20-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Add LUT ranges for color blocks in SDR planes. Userspace can
parse through this information to generate proper LUT data for
respective hardware blocks. It will be exposed to the user space
by the color pipeline.

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 99ae3f4fca05..a8c6be70c859 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4010,6 +4010,22 @@ static int intel_prepare_plane_color_pipeline(struct drm_plane *plane)
 
 		color_pipeline_hdr[2].blob_id =
 			blob[i++]->base.id;
+	} else {
+		blob[i] = drm_property_create_blob(plane->dev,
+						   sizeof(xelpd_pre_post_csc_sdr),
+						   xelpd_pre_post_csc_sdr);
+		if (IS_ERR(blob[i])) {
+			ret =  PTR_ERR(blob[i]);
+			goto out;
+		}
+
+		/*
+		 * In SDR color pipeline PRE-CSC and POST-CSC blocks are positioned
+		 * at 0th and 1st index/postion.
+		 * LUT ranges for SDR planes are similar for pre and post-csc blocks
+		 */
+		color_pipeline_sdr[0].blob_id =
+			color_pipeline_sdr[1].blob_id = blob[i++]->base.id;
 	}
 
 out:
-- 
2.38.1

