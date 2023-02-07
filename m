Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E9E68CF0A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 06:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A858010E44E;
	Tue,  7 Feb 2023 05:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB4D10E2EB;
 Tue,  7 Feb 2023 05:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675747949; x=1707283949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oYmFhq34i8kMKrh1iOfyufUErGhdEMAkJysV8Gz+w4Q=;
 b=nQJIJhHnkVhjTu7+ibRS8SiFDH1oTwMA7CWlMlwxXOb68Tzgu1G27gje
 0Bq2B6udU9EKv6SAQvhUvsoe/QPNK6omFRCpWzAPsLiQqbH4k48oKi1Aj
 hFwmoiHHG18F6D+6ThNnb4lBCIITcZB3TMernV4XvWKEQdjsZT8W0vL62
 UGd0BkT9E5WPe8XiB0TzPQMbguu4XuzUb0bKXYa+KZnN/aYaKaDaTYLtp
 wV0n1uf8AD6gvs3QkKBbSDnRgo+lQ6EKgVxNtKVzXozTkM134xw0r88/O
 ALr7nRPxRDIq9hryfvge1N5QiujpfE/ppfutv0GEvvrvf0juW+63pMMaJ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="356778189"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="356778189"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 21:32:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="790666596"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="790666596"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orsmga004.jf.intel.com with ESMTP; 06 Feb 2023 21:32:26 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCHv3 2/2] i915/display/dp: SDP CRC16 for 128b132b link layer
Date: Tue,  7 Feb 2023 10:56:57 +0530
Message-Id: <20230207052657.2917314-3-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207052657.2917314-1-arun.r.murthy@intel.com>
References: <20230120061600.1451088-1-arun.r.murthy@intel.com>
 <20230207052657.2917314-1-arun.r.murthy@intel.com>
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable SDP error detection configuration, this will set CRC16 in
128b/132b link layer.
For Display version 13 a hardware bit31 in register VIDEO_DIP_CTL is
added to enable/disable SDP CRC applicable for DP2.0 only, but the
default value of this bit will enable CRC16 in 128b/132b hence
skipping this write.
Corrective actions on SDP corruption is yet to be defined.

v2: Moved the CRC enable to link training init(Jani N)
v3: Moved crc enable to ddi pre enable <Jani N>

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 .../gpu/drm/i915/display/intel_dp_link_training.c    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 3d3efcf02011..7064e465423b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1453,4 +1453,16 @@ void intel_dp_start_link_train(struct intel_dp *intel_dp,
 
 	if (!passed)
 		intel_dp_schedule_fallback_link_training(intel_dp, crtc_state);
+
+	/* DP v2.0 SCR on SDP CRC16 for 128b/132b Link Layer */
+	if (intel_dp_is_uhbr(crtc_state) && passed)
+		drm_dp_dpcd_writeb(&intel_dp->aux,
+				   DP_SDP_ERROR_DETECTION_CONFIGURATION,
+				   DP_SDP_CRC16_128B132B_EN);
+		/*
+		 * VIDEO_DIP_CTL register bit 31 should be set to '0' to not
+		 * disable SDP CRC. This is applicable for Display version 13.
+		 * Default value of bit 31 is '0' hence discarding the write
+		 */
+		/* TODO: Corrective actions on SDP corruption yet to be defined */
 }
-- 
2.25.1

